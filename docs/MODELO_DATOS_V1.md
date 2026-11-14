# Modelo de datos local V1

Fecha: 2026-11-14  
Estado: propuesta de diseño; pendiente de implementar y validar.

## Objetivos

- Biblioteca persistente y análisis incremental de MP3 locales.
- Conservar resultados de varios motores sin sobrescribir discrepancias.
- Registrar procedencia, versión del motor, timestamps y confianza disponible.
- Separar metadatos incrustados, mediciones locales, referencias externas y valores derivados.
- Mantener los originales intactos y la exportación como copia independiente.
- No guardar el audio dentro de la base de datos.

## Tecnología

Evaluar SwiftData como primera opción nativa; SQLite directo si se necesita control explícito de índices, consultas, migraciones o interoperabilidad. La decisión se toma con un prototipo, no por preferencia teórica. Los resultados voluminosos (waveform/curvas) se guardan como archivos cacheados locales con referencia en la base, no como grandes blobs si no es necesario.

## Entidades

### Track
Identidad persistente de una entrada de biblioteca:
- id (UUID)
- sourceBookmark / securityScopedURL (referencia de acceso local; nunca una ruta absoluta compartida públicamente)
- fileName, fileSize, duration
- contentHash (SHA-256 cuando sea viable)
- codec, bitrate, sampleRate, channels
- importedAt, lastSeenAt
- fileStatus (available, missing, unreadable, needsPermission)
- metadataSnapshot (campos ID3 leídos, preservando su procedencia)

El hash identifica contenido y evita análisis repetidos; tamaño/fecha son ayudas, no sustitutos de hash.

### AnalysisRun
Una ejecución de un proveedor sobre una pista:
- id, trackId
- provider (apple_music_understanding, openkeyscan_coreml, local_dsp, external_catalog)
- engineVersion, appVersion, osVersion
- startedAt, completedAt, durationMs
- status (queued, running, completed, partial, failed, cancelled)
- requestedFeatures
- rawResultReference (JSON local o archivo cacheado)
- errorCode, errorMessage
- deviceMetrics (memoria/tiempo cuando sea posible)

### AnalysisObservation
Un resultado atómico, que puede ser global o temporal:
- id, trackId, analysisRunId
- feature (key, mode, bpm, beat, bar, structure, pace, loudness, peak, instrumentActivity, spectralBand, energy)
- value / valueUnit
- startTime, endTime (opcionales para resultados temporales)
- confidenceValue (nullable)
- confidenceKind (calibrated_probability, provider_score, qualitative, unavailable)
- sourceType (local_framework, local_model, embedded_tag, external_catalog, derived)
- provider, provenanceNote
- validationState (unvalidated, corroborated, disputed, accepted, rejected)

No asumir que toda salida del framework o del catálogo incluye una confianza numérica. Conservar nulos cuando no exista.

### WaveformCache
- id, trackId, algorithmVersion
- resolution / samplesPerSecond
- cacheFileReference
- generatedAt
- sourceHash

### ExportJob y ExportItem
ExportJob:
- id, destinationBookmark
- createdAt, completedAt
- organizationRuleVersion
- status (planned, running, partial, completed, failed, cancelled)

ExportItem:
- id, exportJobId, trackId
- sourceHash, destinationRelativePath
- status (pending, copied, verified, conflict, failed)
- copiedHash, errorMessage

La exportación copia bytes del MP3 original. No modifica ID3, no recodifica, no normaliza y no cambia formato. Los conflictos de nombre se resuelven sin sobrescribir.

## Reglas de cálculo y comparación

- Camelot se deriva de tónica y modo mediante tabla validada; almacenar la tonalidad original además del código.
- Compatibilidad armónica es un resultado derivado con versión de reglas y explicación, no un dato medido por el motor.
- Energy Map se deriva de dimensiones separadas (Pace, loudness y características espectrales/temporales); no convertirlas en un porcentaje sin definición y calibración.
- Si Key/Mode cambian por segmentos, almacenar intervalos y conservar también cualquier resumen global claramente identificado.
- Los resultados de OpenKeyScan y Sonovault no sustituyen automáticamente los de Apple.
- Los datos de Sonovault se guardan como external_catalog y solo después de coincidencia confirmada de identidad.

## Índices y rendimiento

- Índice único por contentHash cuando esté disponible.
- Índices por Track.fileStatus, AnalysisRun.status/provider y AnalysisObservation.feature/time range.
- Evitar almacenar el PCM completo o duplicar los MP3.
- Cachear waveform y curvas derivadas; regenerar cuando cambie el hash o la versión del algoritmo.
- Procesar lotes con límites de concurrencia adecuados a RAM/batería; permitir pausa, cancelación y reanudación.

## Privacidad y recuperación

- Base de datos y cachés en almacenamiento local de la app.
- No sincronizar audio ni metadatos privados por defecto.
- No registrar rutas personales completas en logs compartidos.
- La pérdida de caché no debe afectar a los MP3 originales.
- Los archivos exportados deben poder verificarse por hash.
