# Hoja de ruta

Esta hoja separa el orden de construcción del alcance funcional. Las etapas no se consideran terminadas hasta contar con implementación y evidencia de pruebas.

| Fase | Objetivo | Criterio de salida |
|---|---|---|
| 0. Definición | Alcance, límites, bitácora y decisiones | Documentación revisada |
| 1. Auditoría técnica | Evaluar tecnologías, licencias, rendimiento y plataforma | Decisión técnica justificada |
| 2. Base de aplicación | Biblioteca local, importación MP3, cola y persistencia | Importar y reanudar análisis de archivos de prueba |
| 3. Análisis esencial | BPM, beats, tonalidad, modo, Camelot y metadatos técnicos | Resultados comparables y medibles |
| 4. Estructura musical | Segmentación, breaks, drops, entradas y evolución | Timeline con timestamps y confianza |
| 5. Visualización | Energy Map, Waveform, Spectrogram y Frequency Analysis | Visualizaciones vinculadas al tiempo |
| 6. Expediente de pista | Ficha modular con todos los análisis | Navegación por canción y apartados |
| 7. Etiquetas ID3 | Detección, propuesta, revisión y escritura autorizada | Pruebas de preservación del audio y reversión de tags |
| 8. Compatibilidad | Motor explicable armónico, rítmico, estructural y energético | Comparaciones justificadas |
| 9. Metadatos externos | Identificación y créditos con fuentes y confianza | Resolver coincidencias ambiguas con seguridad |
| 10. DJ sets | Búsqueda de sesiones y tracklists públicos | Resultados con fuentes, enlaces y estados de certeza |
| 11. Estudio de transiciones | Análisis de secuencia y transiciones verificables | Informe por transición con evidencia |
| 12. Calidad y entrega | Rendimiento, pruebas, documentación y empaquetado | Versión funcional verificable |

## Evaluación técnica pendiente

Tecnologías candidatas, no decisiones definitivas:
- FFmpeg: lectura/decodificación y metadatos técnicos.
- Essentia: análisis musical y características de audio.
- librosa: análisis de señal, espectrogramas y características.
- aubio: tempo y detección de beats.
- Chromaprint: huellas acústicas, si encaja con el caso de uso.
- MusicBrainz y Discogs: metadatos públicos, sujetos a sus condiciones de uso.
- Demucs u otras alternativas: estudiar separación de stems solo si aporta valor real; no es requisito central.

La selección debe considerar licencias, compatibilidad, CPU/RAM, tamaño, tiempo de análisis, calidad en electrónica y posibilidad de ejecución local. No instalar todas las opciones por defecto.
