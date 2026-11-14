# OpenKeyScan y Sonovault: evaluación para el analizador

Fecha: 2026-11-14  
Estado: referencias técnicas evaluadas; no integradas ni ejecutadas en el proyecto.

## 1. OpenKeyScan

Repositorio: https://github.com/rekordcloud/openkeyscan-analyzer  
API de escritorio: https://www.openkeyscan.com/api  
Benchmarks publicados por el proyecto: https://www.openkeyscan.com/benchmarks

OpenKeyScan es un detector de tonalidad basado en una CNN. La documentación del proyecto describe una entrada de audio convertida a mono/44.1 kHz, una representación CQT de 105 bandas y clasificación en 24 clases (12 tonalidades mayores y 12 menores). Puede expresar el resultado en notación musical, Camelot y Open Key.

### Utilidad
- Motor independiente para contrastar la tonalidad estimada por Apple Music Understanding.
- Puede ayudar a investigar discrepancias, especialmente en electrónica y pistas con tonalidad ambigua.
- La salida tonal se puede convertir a nuestro modelo interno y comparar con modo/tonalidad por rangos.

### Límites
- No sustituye un motor completo de BPM/beatgrid, Energy Map, waveform, análisis espectral o compatibilidad.
- La API REST documentada escucha en `http://localhost:58721` y forma parte de la aplicación de escritorio. Sus endpoints reciben rutas locales de archivos del ordenador. No es una API remota ni un servicio que el iPad pueda invocar para analizar archivos del iPad.
- La aplicación de escritorio y su stack PyTorch están orientados a macOS/Windows; no se deben copiar como arquitectura iPadOS.
- El benchmark publicado por el propio proyecto no es validación independiente. Sus cifras deben tratarse como afirmaciones del autor hasta reproducir pruebas comparables.

### Licencias
El repositorio declara licencia MIT para el código. Esto no demuestra que los pesos/checkpoint `openkeyscan3.pt`, datos de entrenamiento ni componentes de terceros tengan automáticamente la misma licencia. Antes de integrar o redistribuir el modelo, auditar los avisos y la procedencia de cada artefacto.

### Ruta posible a iPadOS
1. Usar el motor Python/PyTorch solo en entorno de desarrollo para obtener resultados de referencia.
2. Revisar arquitectura, preprocesamiento CQT, normalización y pesos.
3. Evaluar conversión del modelo a Core ML con coremltools.
4. Verificar equivalencia numérica y predicciones frente al modelo original.
5. Medir latencia, memoria y consumo en iPad A16.
6. Integrar solo si aporta una mejora demostrable frente al framework de Apple.

No se añade OpenKeyScan como dependencia obligatoria de V1.

## 2. API local de OpenKeyScan

La página oficial documenta:
- `GET /health`
- `POST /analyze/single`
- `POST /analyze/add` (cola por lotes)
- `GET /analyze/result`
- `GET /analyze/results`
- `DELETE /analyze/clear`

El ejemplo de respuesta incluye una tonalidad alfanumérica. La API respeta ajustes de la aplicación de escritorio. Su utilidad inmediata es automatizar el OpenKeyScan instalado en un ordenador; no resuelve el análisis local en iPadOS.

## 3. Sonovault

Página del producto: https://sonovault.now/bpm-key-api  
API: https://api.sonovault.now  
Documentación: https://sonovault.now/docs

Sonovault ofrece una consulta por artista+título, ISRC o identificador de plataforma. Su ficha puede devolver:
- BPM con hasta dos decimales.
- Tonalidad musical.
- Camelot/alphanumeric.
- Open Key.
- ISRC, género y enlaces de plataformas.

La documentación del proveedor declara que mide tonalidad con OpenKeyScan y BPM con el detector de beats integrado en Lexicon DJ. Los resultados son mediciones previas de su catálogo, no análisis del archivo local del usuario. La página anuncia un nivel gratuito de 1,000 solicitudes mensuales sin tarjeta; confirmar condiciones y límites vigentes antes de usarlo.

### Utilidad y restricciones
- Fuente secundaria para contrastar una canción si artista/título o ISRC identifican inequívocamente la grabación.
- Puede devolver una referencia rápida sin descargar ni subir el MP3.
- No proporciona Energy Map, Groove, waveform, espectro ni beatgrid temporal del archivo.
- Puede no reconocer edits, remixes underground, promos o versiones no catalogadas.
- Requiere conexión, API key y envío de metadatos/identificadores a un servicio externo.

Por privacidad, coste y cobertura, Sonovault queda desactivado por defecto, fuera del camino crítico y sujeto a autorización explícita. No se subirá audio a Sonovault.

## 4. Política de comparación

No sobrescribir resultados locales con datos externos. Guardar cada observación con fuente, proveedor, versión/fecha si está disponible y coincidencia de identidad. Si los motores discrepan, conservar ambas predicciones y marcar revisión. No convertir la confianza cualitativa de un proveedor en una probabilidad numérica si no se documenta su calibración.

## Fuentes
- https://www.openkeyscan.com/api
- https://github.com/rekordcloud/openkeyscan-analyzer
- https://www.openkeyscan.com/benchmarks
- https://sonovault.now/bpm-key-api
- https://sonovault.now/docs
