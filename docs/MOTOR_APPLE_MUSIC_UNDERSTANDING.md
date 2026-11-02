# Evaluación de motor: Apple Music Understanding

Fecha: 2026-11-02  
Estado: candidato prioritario para prototipo; todavía no validado en el iPad del usuario.

## Hallazgos oficiales

Apple presentó Music Understanding en WWDC26. El framework analiza audio en el dispositivo y sin conexión, y puede recibir un `AVAsset` para analizar una pista completa o una secuencia de buffers de audio.

Las seis familias de resultados documentadas son:

- **Key:** tónica y modo mayor/menor asociados a rangos temporales.
- **Rhythm:** posiciones de beats, compases y BPM.
- **Structure:** límites temporales de secciones, segmentos y frases.
- **Pace:** energía/momentum percibidos expresados como eventos por minuto; no equivale a BPM.
- **Instrument activity:** instrumentos detectados y actividad estimada a lo largo del tiempo.
- **Loudness:** mediciones integradas, momentáneas, short-term y peak, incluyendo LUFS.

La API permite solicitar solo los análisis necesarios, cancelar tareas y obtener resultados parciales de loudness. Los resultados pueden codificarse como JSON.

## Compatibilidad y límites conocidos

- La documentación de disponibilidad consultada indica iPadOS 27.0 o posterior.
- Apple publica el ejemplo Music Understanding Lab para iOS, iPadOS y macOS.
- La documentación del framework y del ejemplo está marcada como Beta; la API puede cambiar.
- Apple no publica en la documentación consultada una lista específica de chips iPad compatibles ni una garantía de rendimiento para el iPad A16.
- No se debe confundir este framework con Apple Intelligence: no se encontró un requisito oficial que indique que Music Understanding dependa de Apple Intelligence o de sus modelos/dispositivos compatibles.
- La compatibilidad real del iPad A16 debe verificarse compilando con el SDK apropiado y ejecutando un análisis de MP3 en el dispositivo.
- Para compilar se necesitará Xcode/macOS con el SDK que incluya MusicUnderstanding. Codespaces Linux puede preparar pruebas auxiliares, pero no sustituye Xcode.

## Encaje en el alcance del analizador

Music Understanding cubre directamente varios requisitos de V1: tonalidad por rangos, estructura musical, actividad instrumental, pace y loudness. Aunque también ofrece ritmo/BPM, el producto V1 no desarrollará detector BPM ni beatgrid; esos resultados se dejarán desactivados o no se expondrán en la interfaz de V1.

Pace puede alimentar el Energy Map, pero no debe presentarse como una medida universal de energía ni confundirse con LUFS. Loudness y el análisis espectral son dimensiones distintas. El framework no documenta un resultado FFT/espectro que sustituya nuestro Frequency Analysis; esa visualización seguirá siendo nativa con Accelerate/vDSP. El waveform también se generará desde el audio decodificado.

El framework no documenta detección de género, mood, separación de stems ni código Camelot. Camelot se calculará a partir de la tonalidad y el modo devueltos, y la compatibilidad armónica será lógica propia claramente explicable.

## Estrategia de integración

1. Crear una capa adaptadora propia, por ejemplo `MusicAnalysisProvider`, para que la interfaz y la base de datos no dependan directamente de tipos de Apple.
2. Implementar primero un prototipo mínimo que abra un MP3 local mediante `AVURLAsset` y solicite únicamente `key`, `structure`, `pace`, `instrumentActivity` y `loudness`.
3. Guardar el resultado original codificado y normalizarlo a modelos internos con timestamps.
4. Convertir tonic/mode a Camelot mediante una tabla validada.
5. Mantener un motor alternativo de cromagrama/tonalidad para comparar resultados; no fijar Essentia como dependencia principal.
6. Medir duración de análisis, memoria, estabilidad, temperatura/consumo y precisión cualitativa en pistas completas.
7. Ejecutar las pruebas con dos MP3 de referencia privados; no subirlos al repositorio público.

## Licencias y distribución

Music Understanding es un framework del SDK de Apple, no una biblioteca open source de terceros con licencia AGPL. Su uso está sujeto a los acuerdos y condiciones de Apple para sus plataformas y herramientas. No se ha identificado una tarifa comercial independiente por utilizar esta API; la distribución seguirá sujeta a los requisitos normales de Apple y a cualquier condición aplicable del SDK.

## Fuentes oficiales

- Apple Developer Documentation — Music Understanding: https://developer.apple.com/documentation/musicunderstanding
- WWDC26 Session 253 — Meet the Music Understanding framework: https://developer.apple.com/videos/play/wwdc2026/253/
- Apple sample — Creating visuals with Music Understanding analysis results: https://developer.apple.com/documentation/musicunderstanding/create-visuals-using-musicunderstanding-analysis-results

## Criterio de aceptación

No declarar el motor integrado ni compatible hasta compilar y ejecutar en el iPad A16 una pista MP3 completa, obtener resultados no vacíos de las dimensiones requeridas, comprobar timestamps, cancelar/reanudar cuando corresponda y registrar tiempos/errores. Si el dispositivo o el SDK no son compatibles, activar el plan alternativo nativo.
