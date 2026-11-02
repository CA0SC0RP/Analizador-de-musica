# Hoja de ruta

La experiencia iPad y la calidad visual son requisitos centrales, no una fase cosmética al final. La exportación organizada de MP3 originales también forma parte del flujo principal. Cada etapa requiere implementación y evidencia de pruebas.

| Fase | Objetivo | Criterio de salida |
|---|---|---|
| 0. Definición | Alcance, límites, bitácora y decisiones | Documentación revisada |
| 1. Auditoría técnica iPad | Evaluar stack, bibliotecas, licencias, rendimiento, archivos locales y distribución de prueba | Decisión técnica justificada |
| 2. Dirección visual y navegación | Diseñar sistema visual oscuro, denso en información útil, navegación y vistas de análisis | Prototipo visual navegable aprobado en iPad |
| 3. Biblioteca local | Importación/acceso seguro a MP3, cola, almacenamiento y persistencia | Importar lotes, reanudar y conservar análisis |
| 4. Análisis esencial | BPM, beats, tonalidad, modo, Camelot y metadatos técnicos | Resultados comparables y medibles |
| 5. Estructura musical | Segmentación, breaks, drops, entradas y evolución | Timeline con timestamps y confianza |
| 6. Visualización | Energy Map, Waveform, Spectrogram y Frequency Analysis | Vistas dedicadas, interactivas y vinculadas al tiempo |
| 7. Expediente de pista | Ficha modular con navegación a subventanas | Cada botón abre vista funcional y conserva contexto |
| 8. Etiquetas ID3 | Detección, propuesta, revisión y escritura autorizada | Preservación del flujo de audio y reversión de tags |
| 9. Compatibilidad | Motor explicable armónico, rítmico, estructural y energético | Comparaciones justificadas |
| 10. Exportación organizada | Copiar MP3 a carpetas por tonalidad/Camelot y grupos compatibles | Archivos exportados conservan el audio original; hash verificado, sin recodificación ni sobrescritura accidental |
| 11. Metadatos externos | Identificación y créditos con fuentes y confianza | Resolver coincidencias ambiguas con seguridad |
| 12. DJ sets | Búsqueda de sesiones y tracklists públicos | Resultados con fuentes, enlaces y certeza |
| 13. Estudio de transiciones | Análisis de secuencia y transiciones verificables | Informe por transición con evidencia |
| 14. Calidad y entrega | Rendimiento, pruebas en iPad, accesibilidad táctil, documentación y distribución de prueba | Versión funcional verificable |

## Requisitos del prototipo visual

- Composición profesional de consola musical para iPad.
- Alta densidad de información relevante, con jerarquía y legibilidad.
- Navegación principal clara y persistente.
- Ficha de pista con accesos a vistas especializadas.
- Vistas dedicadas de Waveform, Spectrogram, Frequency Analysis, Energy Map, tonalidad, ritmo y estructura.
- Navegación entre vistas sin perder pista o contexto seleccionado.
- Controles cómodos para touch y, cuando esté disponible, puntero/teclado.
- Datos de ejemplo claramente identificados como demostración, no como análisis real.

## Evaluación técnica pendiente

Tecnologías candidatas, no decisiones definitivas:
- Swift / SwiftUI y frameworks nativos de Apple: evaluar como ruta principal para iPad.
- AVFoundation: lectura y decodificación de audio local, sujeto a pruebas y compatibilidad.
- Accelerate / vDSP: procesamiento numérico y espectral local, si resulta adecuado.
- Essentia: evaluar compatibilidad, licencia y viabilidad en iPad.
- librosa: referencia útil de algoritmos/prototipos; comprobar si conviene en el dispositivo o para validación.
- aubio: tempo y detección de beats; comprobar soporte y licencia.
- FFmpeg: evaluar necesidad, licencia y tamaño; evitar una dependencia grande si APIs nativas bastan.
- MusicBrainz y Discogs: metadatos públicos, sujetos a sus condiciones de uso.
- Chromaprint: huellas acústicas, si encaja con el caso.
- Demucs u otras alternativas: estudiar separación de stems solo si aporta valor real; no es requisito central.

La selección debe considerar compatibilidad con iPadOS, licencias, CPU/RAM, tamaño, tiempo de análisis, precisión en música electrónica, acceso a archivos, consumo energético, persistencia local y copia/exportación de archivos sin recodificación. No instalar todas las opciones por defecto.
