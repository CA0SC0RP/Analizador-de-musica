# Analizador de música

Aplicación nativa para iPad que analiza archivos musicales locales y organiza una biblioteca por tonalidad, Camelot y compatibilidad armónica. La experiencia de uso y la calidad visual son prioridades de producto, al mismo nivel que la precisión técnica.

**No es una aplicación DJ, DAW ni herramienta de mastering.** Incluye un reproductor sencillo para escuchar y revisar canciones, pero no decks, mezcla ni procesamiento de audio.

## Objetivo de V1

- Importar MP3 locales individualmente o por lotes.
- Mantener una biblioteca persistente, con cola, estados, reintentos y análisis incremental.
- Escuchar la pista seleccionada desde la Biblioteca.
- Mostrar waveform integrado en la ventana principal.
- Calcular Energy Map y análisis de frecuencias.
- Estimar tonalidad, modo mayor/menor, alternativas, confianza y código Camelot.
- Explicar compatibilidad armónica entre canciones.
- Organizar y exportar copias de los MP3 originales a carpetas elegidas por el usuario, según tonalidad/Camelot y categorías configurables.

## La interfaz es parte esencial del producto

La Biblioteca será el centro de trabajo. La pantalla principal combinará:

1. **Cabecera de pista:** título, artista, tonalidad, modo, Camelot y metadatos esenciales.
2. **Waveform y transporte:** forma de onda amplia, Play/Pause, posición, duración y volumen.
3. **Biblioteca:** tabla/lista con columnas configurables, filtros, búsqueda y ordenamiento.
4. **Panel contextual:** metadatos ampliados, compatibilidad y Frequency Analysis compacto expandible.

La navegación principal tendrá Biblioteca, Análisis, Tonalidades, Organización y Exportación. Seleccionar una canción actualizará ficha, waveform y reproductor sin sacar al usuario de la Biblioteca. En Análisis, Waveform y Energy Map compartirán una composición; Frequency Analysis será un widget compacto que podrá expandirse.

Dirección visual: consola oscura profesional, clara y atractiva, con información útil visible, jerarquía tipográfica, paneles coherentes y controles cómodos. Debe funcionar con touch y también con mouse/puntero y teclado cuando estén disponibles. Las animaciones serán discretas y estarán subordinadas al rendimiento.

## Alcance V1

- Metadatos ID3 y técnicos: título, artista, álbum, año, género, sello, duración, bitrate, sample rate, canales, códec y tamaño.
- Reproductor local de escucha y navegación temporal.
- Waveform generado a partir del audio completo.
- Energy Map: evolución temporal de energía e intensidad, con eventos solo cuando haya evidencia suficiente.
- Frequency Analysis: distribución espectral y bandas de subgraves, graves, medios y agudos.
- Tonalidad estimada, modo, alternativas plausibles, confianza y Camelot.
- Compatibilidad armónica explicable, sin depender de reglas rígidas.
- Organización local y exportación segura de copias MP3 originales.

## Fuera de V1

Groove como métrica independiente y validada; Spectrogram como vista independiente; análisis avanzado de transiciones; separación de stems; búsqueda de DJ sets y coincidencias en sesiones; mastering, EQ correctiva, compresión, normalización, restauración o mejora de audio; decks, mixer, crossfader y efectos DJ; conversión o recodificación de audio; compra o descarga de música.

BPM, posiciones de beats y límites de compás pasan a ser funciones candidatas de V1 mediante Apple Music Understanding. Se habilitarán tras validar resultados y rendimiento en el iPad A16; no se asumirá que equivalen a un beatgrid DJ editable.

## Exportación de MP3

La exportación es una función esencial. Copiará los MP3 originales a una carpeta elegida por el usuario, organizados por tonalidad, Camelot y grupos configurables. No moverá ni borrará originales, no decodificará ni recodificará, y no cambiará formato, bitrate, sample rate, volumen ni calidad. Los resultados inciertos irán a revisión. Se evitarán sobrescrituras, se informarán conflictos y se verificará integridad mediante hash cuando sea viable. La base de datos local será independiente de la exportación.

## Tecnología candidata

Ruta principal: Swift/SwiftUI para la app nativa; AVFoundation para audio; Accelerate/vDSP para waveform y espectro. **Apple Music Understanding** es el primer motor a probar: tonalidad temporal, ritmo/BPM, beats, estructura, pace, actividad instrumental y loudness, on-device. Requiere iPadOS 27.0+ y está en Beta; el iPad con iPadOS 27.3 cumple el mínimo de versión, pero falta validar el chip A16. OpenKeyScan será candidato secundario para contrastar tonalidad; su modelo PyTorch podría requerir conversión a Core ML. Librosa, Essentia, aubio y PyWavelets quedan como referencias o alternativas selectivas, no como dependencias automáticas.

No se incorporarán dependencias o servicios de pago sin autorización explícita. Se priorizará procesamiento local.

## Pruebas con audio real

Antes de validar el motor se solicitarán dos MP3 de referencia: una pista de electrónica (preferentemente techno/minimal techno, completa y de buena calidad) y otra pista de estilo o estructura distinta. Se usarán para verificar lectura, duración, metadatos, waveform, energía, espectro y tonalidad/Camelot. Los archivos de prueba no se incluirán en el repositorio público.

## Principios de trabajo

- Local-first y sin gastos no autorizados.
- No alterar los MP3 originales.
- Separar datos medidos, metadatos incrustados, datos externos e inferencias.
- Mostrar confianza e incertidumbre; no inventar precisión.
- No declarar módulos terminados sin pruebas con archivos reales.
- La interfaz, la navegación y la facilidad de trabajo son requisitos funcionales.
- El usuario conserva la decisión final.

## Estado

La definición V1 y el primer esqueleto SwiftUI se preparan en la rama de fundación. El código no debe considerarse compilado ni probado hasta ejecutarlo en Swift Playgrounds sobre el iPad o en Xcode con un dispositivo.

Documentos: [Alcance funcional](docs/ALCANCE_FUNCIONAL.md) · [Hoja de ruta](docs/HOJA_DE_RUTA.md) · [Prototipo visual iPad](docs/PROTOTIPO_VISUAL_IPAD.md) · [Motor Apple Music Understanding](docs/MOTOR_APPLE_MUSIC_UNDERSTANDING.md) · [Bitácora](BITACORA.md) · [Plan de pruebas MP3](docs/PRUEBAS_MP3.md) · [OpenKeyScan y Sonovault](docs/OPENKEYSCAN_Y_SONOVAULT.md) · [Modelo de datos V1](docs/MODELO_DATOS_V1.md) · [Shell SwiftUI](prototype/ContentView.swift) · [Instrucciones del prototipo](prototype/README.md) · [Carpeta de muestras locales](samples/reference-audio/README.md)


## Actualización tecnológica — 2026-11-14

- Arquitectura objetivo: aplicación nativa Swift/SwiftUI para iPadOS; AVFoundation para importar, decodificar y reproducir; Accelerate/vDSP para waveform, FFT y características espectrales; SwiftData o SQLite para persistencia local (decisión tras prototipo).
- Apple Music Understanding es el primer proveedor analítico: análisis on-device y offline. Es Beta y su disponibilidad documentada comienza en iPadOS 27.0. El iPad A16 con iPadOS 27.3 supera el mínimo de versión, pero el soporte/rendimiento concreto debe probarse.
- BPM/ritmo y beats pasan a evaluación V1. Pace no equivale a una puntuación universal de energía ni a Groove; el Energy Map combinará medidas temporales propias con Pace y loudness, explicando cada dimensión.
- OpenKeyScan (código MIT según su repositorio) queda como referencia y motor de contraste de tonalidad. Su API REST local requiere la aplicación de escritorio y no es una API remota para iPad. Revisar por separado licencia/procedencia de pesos y datasets antes de portar el modelo.
- Sonovault es una fuente externa opcional de metadatos/BPM/tonalidad por artista+título, ISRC o ID de plataforma. No analiza el archivo local; requiere Internet y API key. El plan gratuito anunciado es de 1,000 solicitudes/mes, sujeto a cambios. No será dependencia ni se usará sin autorización.
- Los MP3 originales nunca se suben para análisis. La consulta de catálogo solo usa identificadores/metadatos cuando el usuario habilite expresamente esa función.
- La base local conservará resultados por proveedor, timestamps, versión del motor, parámetros, confianza disponible y procedencia; discrepancias no se sobrescriben ni se ocultan.


### Desarrollo directamente en iPad
Swift Playgrounds permite crear y ejecutar proyectos de aplicación SwiftUI desde el propio iPad. Se evaluará como entorno inicial para construir el prototipo sin depender de un Mac. La disponibilidad del módulo Beta MusicUnderstanding dentro de la versión instalada de Swift Playgrounds debe comprobarse con una prueba de importación/compilación. Xcode 27 requiere un Mac con macOS Tahoe 26.6 o posterior, por lo que no será un requisito para el primer prototipo si Playgrounds expone las APIs necesarias.


### Prototipo visual inicial — 2026-11-14
Se abrió la rama `prototype/ipad-visual-shell` desde `main`. Incluye la definición de la Biblioteca y la comparación visual de transición, además de un primer shell SwiftUI con datos simulados. La importación, reproducción, análisis y compatibilidad reales todavía no están conectados; el código no se considera compilado ni probado en el iPad.