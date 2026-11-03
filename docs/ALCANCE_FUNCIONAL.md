# Alcance funcional V1

## 1. Producto y plataforma

Aplicación nativa para iPad dedicada al análisis y organización de archivos musicales locales. No es una aplicación DJ, DAW ni herramienta de mastering. Tendrá un reproductor sencillo para escuchar pistas mientras se consulta la biblioteca; no tendrá decks ni mezcla.

Ruta técnica candidata: Swift/SwiftUI. La elección se confirmará con un prototipo ejecutable y una auditoría de APIs, rendimiento y licencias.

## 2. Experiencia de usuario y diseño

La experiencia visual es un requisito principal, no una capa cosmética posterior. Se busca una consola musical oscura, profesional, atractiva, fluida y rica en información útil, sin saturación ni controles decorativos.

### Biblioteca: pantalla central

- Cabecera de pista seleccionada con título, artista, tonalidad, modo, Camelot y metadatos esenciales.
- Waveform horizontal amplio integrado en la misma ventana.
- Transporte integrado: Play/Pause, posición, duración y volumen.
- Tabla/lista de biblioteca con columnas configurables, filtros, búsqueda y ordenamiento.
- Panel contextual con metadatos adicionales, compatibilidad y Frequency Analysis compacto.
- Seleccionar una fila actualiza ficha, waveform y reproductor sin abandonar la Biblioteca.

### Navegación principal

1. Biblioteca musical.
2. Análisis musical.
3. Tonalidades.
4. Organización.
5. Exportación.

La vista Análisis presentará Waveform y Energy Map en una composición conjunta, lado a lado o apilada según el espacio disponible. Frequency Analysis será un widget compacto expandible, no una ventana obligatoria a pantalla completa. Los controles deben admitir touch y mouse/puntero; teclado cuando corresponda.

Las interacciones tendrán estados visibles, feedback, progreso y transiciones discretas. El rendimiento y la legibilidad tienen prioridad sobre los efectos visuales.

## 3. Biblioteca e importación

- Importar MP3 individuales o por lotes (incluidos lotes grandes).
- Utilizar el selector de archivos de iPadOS y respetar su modelo de permisos.
- Gestionar acceso persistente o copia de trabajo local según corresponda.
- Cola con estados: pendiente, analizando, completo, parcial, error y requiere revisión.
- Reintentos, cancelación controlada y recuperación tras interrupciones.
- Base de datos local persistente.
- Evitar análisis repetidos si el contenido no cambió; preferir hash de contenido y usar tamaño/fecha como ayuda, no como prueba definitiva.
- Mostrar almacenamiento utilizado y errores de lectura.

## 4. Metadatos y reproductor

Leer metadatos ID3 y datos técnicos disponibles: título, artista, álbum, año, género, sello, comentarios, duración, códec, bitrate, sample rate, canales y tamaño. Identificar la procedencia de cada dato: etiqueta incrustada, medición, fuente externa o inferencia.

El reproductor integrado solo sirve para escuchar y revisar la pista seleccionada: Play/Pause, seek, posición, duración y volumen. No incluye decks, sincronización, cue DJ, pitch, mixer, crossfader ni efectos.

## 5. Waveform

- Calcular una forma de onda a partir del audio real.
- Representar la duración completa de la pista.
- Integrarse en la Biblioteca y en Análisis.
- Permitir navegación temporal y zoom cuando resulte útil.
- Actualizarse al seleccionar otra canción y mantener sincronía con el reproductor.

## 6. Energy Map

- Mostrar evolución temporal de energía/intensidad durante la pista completa.
- Usar características de audio explicables; no presentar una puntuación heurística como estándar universal.
- Marcar posibles breaks, builds, drops o cambios solo cuando exista evidencia suficiente.
- Asociar timestamps y nivel de confianza.
- Adaptarse a estructuras de música electrónica sin imponer una plantilla pop.

## 7. Frequency Analysis

- Analizar distribución espectral a partir de audio local.
- Mostrar subgraves, graves, medios y agudos.
- Widget compacto en la interfaz principal y vista expandida bajo demanda.
- Es una visualización descriptiva, no un ecualizador ni herramienta de mastering.

## 8. Tonalidad y Camelot

- Analizar la canción completa, no limitar el cálculo a los primeros segundos/minutos.
- Estimar tonalidad, modo mayor/menor y código Camelot.
- Mostrar alternativas plausibles y confianza calibrada o claramente descrita.
- Comparar cromagrama/perfil armónico y resultados de motores cuando sea útil.
- Detectar inestabilidad o cambios tonales solo si la señal y el método lo permiten.
- No asignar una tonalidad por defecto cuando el análisis falla; devolver desconocido/ambiguo.
- Explicar compatibilidad armónica y relaciones, sin tratar Camelot como regla infalible.

Apple Music Understanding es el primer motor candidato aprobado para evaluación. La documentación indica iPadOS 27.0 o posterior y está marcada como Beta. Se debe validar compilación y ejecución real en el iPad A16 antes de adoptarlo. Cubre tonalidad por rangos, estructura, pace, actividad instrumental y loudness; no sustituye el waveform ni el análisis espectral propio, y no se usará su salida de ritmo/BPM en V1. Essentia y librosa quedan como motores de comparación/alternativa, no como dependencias principales.

## 9. Organización y compatibilidad

Organizar biblioteca por tonalidad, modo y Camelot; permitir filtros, etiquetas y categorías configurables. La compatibilidad entre pistas debe explicar la relación armónica y señalar incertidumbre. No se desarrollará un motor de BPM ni beatgrid en V1.

## 10. Exportación de MP3 originales

- Copiar los MP3 analizados a una carpeta destino elegida mediante iPadOS.
- Crear carpetas por tonalidad/Camelot y categorías configurables.
- Enviar pistas ambiguas o no identificadas a una carpeta de revisión.
- Mostrar resumen y conflictos antes de iniciar.
- No mover ni borrar originales.
- No decodificar/re-encodear ni cambiar formato, bitrate, sample rate, duración, volumen o calidad.
- Evitar sobrescrituras; resolver duplicados y nombres repetidos de forma explícita.
- Permitir reanudar o identificar con claridad archivos copiados y pendientes.
- Verificar hash de origen y copia cuando sea viable.
- Mantener la base de datos local separada de las carpetas exportadas.
- No editar etiquetas ID3 en V1 salvo que se apruebe expresamente una función posterior; cualquier edición autorizada afectaría únicamente la copia exportada.

## 11. Exclusiones de V1

- Detector BPM, beatgrid, compás y groove.
- Spectrogram como vista independiente.
- Análisis automático avanzado de transiciones.
- Separación de stems.
- Búsqueda de DJ sets, identificación de canciones en sesiones y estudio de transiciones de sets.
- Mastering, EQ correctiva, compresión, limitadores, normalización, restauración o mejora de audio.
- Conversión de formatos, recodificación y exportación de audio procesado.
- Decks, mixer, crossfader y efectos DJ.
- Descarga/compra de música o acceso a cuentas privadas de tiendas.

Un valor BPM presente en metadatos puede mostrarse como dato de origen, sin construir un detector.

## 12. Privacidad, coste y honestidad

- Procesamiento local como prioridad.
- No exigir cuentas ni servicios de IA/API externos.
- Ningún gasto, suscripción o API comercial sin autorización explícita.
- Diferenciar mediciones, estimaciones, metadatos y datos externos.
- No afirmar exactitud perfecta; mostrar incertidumbre y fallos.
- El usuario conserva la decisión final.
- Una función solo se declara terminada después de pruebas reales, documentación y verificación en iPad.
