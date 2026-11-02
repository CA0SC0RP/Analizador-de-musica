# Hoja de ruta

La experiencia iPad y la calidad visual son requisitos centrales, no una fase cosmética al final. Cada etapa debe cuidar tanto el funcionamiento como la claridad y calidad de la interfaz. Las etapas no se consideran terminadas hasta contar con implementación y evidencia de pruebas.

| Fase | Objetivo | Criterio de salida |
|---|---|---|
| 0. Definición | Alcance, límites, bitácora y decisiones | Documentación revisada |
| 1. Auditoría técnica iPad | Evaluar stack, bibliotecas, licencias, rendimiento, archivos locales y distribución de prueba | Decisión técnica justificada |
| 2. Dirección visual y navegación | Diseñar sistema visual oscuro, denso en información útil, navegación y vistas de análisis | Prototipo visual navegable aprobado en iPad |
| 3. Base de aplicación | Biblioteca local, importación MP3, cola y persistencia | Importar y reanudar análisis de archivos de prueba |
| 4. Análisis esencial | BPM, beats, tonalidad, modo, Camelot y metadatos técnicos | Resultados comparables y medibles |
| 5. Estructura musical | Segmentación, breaks, drops, entradas y evolución | Timeline con timestamps y confianza |
| 6. Visualización | Energy Map, Waveform, Spectrogram y Frequency Analysis | Vistas visuales dedicadas, interactivas y vinculadas al tiempo |
| 7. Expediente de pista | Ficha modular con navegación a subventanas de análisis | Cada botón abre una vista funcional y conserva el contexto |
| 8. Etiquetas ID3 | Detección, propuesta, revisión y escritura autorizada | Pruebas de preservación del audio y reversión de tags |
| 9. Compatibilidad | Motor explicable armónico, rítmico, estructural y energético | Comparaciones justificadas |
| 10. Metadatos externos | Identificación y créditos con fuentes y confianza | Resolver coincidencias ambiguas con seguridad |
| 11. DJ sets | Búsqueda de sesiones y tracklists públicos | Resultados con fuentes, enlaces y estados de certeza |
| 12. Estudio de transiciones | Análisis de secuencia y transiciones verificables | Informe por transición con evidencia |
| 13. Calidad y entrega | Rendimiento, pruebas en iPad, accesibilidad táctil, documentación y distribución de prueba | Versión funcional verificable |

## Requisitos del prototipo visual

- Composición profesional de consola musical para iPad.
- Alta densidad de información relevante, con jerarquía y legibilidad.
- Navegación principal clara y persistente.
- Ficha de pista con accesos a vistas especializadas.
- Vistas dedicadas de Waveform, Spectrogram, Frequency Analysis, Energy Map, tonalidad, ritmo y estructura.
- Navegación entre vistas sin perder la pista o contexto seleccionado.
- Controles cómodos para touch y, cuando esté disponible, puntero/teclado.
- Datos de ejemplo claramente identificados como demostración, no como análisis real.

## Evaluación técnica pendiente

Tecnologías candidatas, no decisiones definitivas:
- Swift / SwiftUI y frameworks nativos de Apple: evaluar como ruta principal para iPad.
- AVFoundation: lectura y decodificación de audio local, sujeto a pruebas y compatibilidad.
- Accelerate / vDSP: procesamiento numérico y espectral local, si resulta adecuado.
- Essentia: evaluar compatibilidad, licencia y viabilidad de compilación/uso en iPad.
- librosa: referencia útil de algoritmos/prototipos, pero comprobar si conviene en el dispositivo o solo para validación de resultados.
- aubio: tempo y detección de beats; comprobar soporte y licencia.
- FFmpeg: evaluar necesidad, licencia y tamaño; evitar incorporar una dependencia grande si APIs nativas bastan.
- MusicBrainz y Discogs: metadatos públicos, sujetos a sus condiciones de uso.
- Chromaprint: huellas acústicas, si encaja con el caso de uso.
- Demucs u otras alternativas: estudiar separación de stems solo si aporta valor real; no es requisito central.

La selección debe considerar compatibilidad con iPadOS, licencias, CPU/RAM, tamaño, tiempo de análisis, precisión en música electrónica, acceso a archivos, consumo energético y posibilidad de ejecución local. No instalar todas las opciones por defecto.
