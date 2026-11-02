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

BPM como detector, beatgrid, compás y groove; Spectrogram como vista independiente; análisis avanzado de transiciones; separación de stems; búsqueda de DJ sets y coincidencias en sesiones; mastering, EQ correctiva, compresión, normalización, restauración o mejora de audio; decks, mixer, crossfader y efectos DJ; conversión o recodificación de audio; compra o descarga de música.

Un BPM ya incluido en metadatos puede mostrarse como dato de origen, pero no se desarrollará un detector BPM en V1.

## Exportación de MP3

La exportación es una función esencial. Copiará los MP3 originales a una carpeta elegida por el usuario, organizados por tonalidad, Camelot y grupos configurables. No moverá ni borrará originales, no decodificará ni recodificará, y no cambiará formato, bitrate, sample rate, volumen ni calidad. Los resultados inciertos irán a revisión. Se evitarán sobrescrituras, se informarán conflictos y se verificará integridad mediante hash cuando sea viable. La base de datos local será independiente de la exportación.

## Tecnología candidata

Ruta principal a evaluar: Swift y SwiftUI para la aplicación nativa; AVFoundation para acceso/reproducción de audio; Accelerate/vDSP para operaciones numéricas y espectrales. Essentia.js es el motor candidato principal para análisis musical, pendiente de pruebas reales de integración, rendimiento en iPadOS y revisión de licencia AGPL-3.0/opción propietaria. No se considera validado hasta superar esas pruebas.

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

La definición V1 y el primer esqueleto de interfaz SwiftUI se preparan en la rama de fundación. El código inicial no debe considerarse compilado ni probado hasta que se ejecute en Xcode sobre un iPad.

Documentos: [Alcance funcional](docs/ALCANCE_FUNCIONAL.md) · [Hoja de ruta](docs/HOJA_DE_RUTA.md) · [Bitácora](BITACORA.md) · [Plan de pruebas MP3](docs/PRUEBAS_MP3.md)
