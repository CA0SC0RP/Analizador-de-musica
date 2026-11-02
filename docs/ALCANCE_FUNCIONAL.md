# Alcance funcional aprobado

## 1. Biblioteca y procesamiento por lotes

- Selección de archivos MP3 locales.
- Cola de análisis individual y por lotes.
- Estados por archivo: pendiente, en análisis, completo, parcial, error y requiere revisión.
- Reintentos controlados y recuperación tras interrupciones.
- Persistencia local de resultados.
- Identificación de cambios de archivo mediante hash y metadatos técnicos para evitar recalcular innecesariamente.
- No duplicar ni mover archivos originales sin autorización.

## 2. Expediente musical por pista

Cada pista tendrá una ficha navegable con módulos independientes:

### Identidad y metadatos
- Título, artista, artistas invitados, álbum, año/fecha, género, sello, número de pista, comentarios y etiquetas ID3.
- Información técnica: duración, códec, bitrate, sample rate, canales y tamaño.
- Diferenciar metadatos incrustados, datos externos y valores inferidos.

### Tonalidad y armonía
- Tonalidad estimada, modo mayor/menor y alternativas plausibles.
- Código Camelot.
- Perfil armónico a lo largo del tiempo.
- Cambios tonales y segmentos ambiguos cuando se puedan detectar.
- Acordes/notas estimados cuando la tecnología y señal lo permitan.
- Confianza y explicación de las estimaciones.

### Ritmo
- BPM y posibles interpretaciones a mitad/doble tempo.
- Beatgrid y detección de beats.
- Compás y regularidad temporal.
- Variaciones de tempo.
- Groove y características de percusión.

### Estructura y momentos
- Intro y outro.
- Entrada/salida de kick, bajo y percusión.
- Breaks, builds, drops y cambios de sección.
- Subidas y bajadas de energía.
- Momentos de mayor densidad o intensidad.
- Timestamps navegables.
- Etiquetas adaptadas a música electrónica; no forzar estructura pop.

### Sonido y calidad técnica
- Waveform.
- Spectrogram.
- Frequency Analysis.
- Energy Map.
- Distribución de subgraves, graves, medios y agudos.
- RMS, LUFS, picos, rango dinámico y clipping como indicadores descriptivos.
- Timbre, densidad, transitorios, presencia vocal y posibles elementos/instrumentos/efectos.
- Calidad técnica y señales de compresión o degradación cuando puedan inferirse.

El análisis no debe confundirse con mastering ni con una evaluación subjetiva absoluta de calidad. Un nivel bajo de volumen se informa; no se corrige.

## 3. Corrección de etiquetas ID3

- Detectar campos vacíos, inconsistentes, duplicados o aparentemente erróneos.
- Proponer correcciones con fuente, coincidencia y confianza.
- No reemplazar un título numérico o dudoso sin identificación suficientemente sólida.
- Permitir revisión individual y por lotes.
- Mostrar valores anteriores y propuestos.
- Conservar respaldo de valores originales.
- Escribir etiquetas únicamente tras confirmación explícita.
- No alterar el audio ni convertir el archivo.

## 4. Compatibilidad entre canciones

La puntuación debe ser explicable y desglosada en:
- Compatibilidad armónica.
- Relación Camelot y tonalidades vecinas.
- Compatibilidad de BPM y ajuste razonable.
- Groove y patrones rítmicos.
- Energía y evolución.
- Estructura y puntos posibles de transición.
- Características tímbricas y densidad.

No asumir que solo funciona la misma tonalidad ni que una relación Camelot garantiza una buena mezcla. Separar compatibilidad teórica, compatibilidad estimada y evidencia observada en sets reales.

## 5. Investigación de canciones y artistas

Consultar fuentes públicas permitidas para enriquecer:
- Identificación oficial de canción y artista.
- Álbum, fecha, sello y discografía.
- Productores, compositores y créditos disponibles.
- Remixes, edits, versiones y colaboraciones.
- Géneros y lanzamientos relacionados.

Resolver ambigüedades antes de asociar datos. Registrar fuente y confianza.

## 6. DJ sets y sesiones

### Encontrar la biblioteca del usuario en sets
- Buscar tracklists públicos y sets publicados que incluyan canciones de la biblioteca.
- Asociar DJ, sesión, evento, ciudad/país, fecha, plataforma y enlace.
- Mostrar timestamp cuando exista.
- Distinguir coincidencia confirmada, probable y no verificada.
- Manejar remixes, edits, versiones e IDs desconocidos sin confundirlos.

### Buscar sets para estudiar mezclas
- Buscar por DJ, artista, sello, club, evento, escena o género.
- No limitarse a artistas comerciales ni a festivales masivos.
- Dar prioridad de descubrimiento a techno, minimal techno, dark techno, deep house y house underground, especialmente escenas europeas y alemanas.
- También permitir analizar sets de otros estilos si aportan información técnica sobre transiciones.
- Desglosar tracklist, BPM, tonalidad, Camelot y transición entre canciones cuando haya datos o audio accesible legalmente.
- Estimar solapamiento, cambios de tempo y puntos de entrada/salida solo cuando exista evidencia suficiente.

La aplicación no descarga música ni proporciona acceso a tiendas o cuentas privadas. Presenta información pública y enlaces a las plataformas originales. Respetará APIs oficiales, términos, límites y restricciones de acceso.

## 7. Interfaz

Dirección visual: oscura, profesional, informativa y visual. Debe priorizar lectura de datos, navegación rápida y visualizaciones interactivas.

Secciones previstas:
1. Biblioteca.
2. Análisis de pista.
3. Compatibilidad.
4. Rueda Camelot.
5. Live Sets encontrados.
6. Buscador de DJ sets.
7. Estudio de transiciones.
8. Artistas, sellos y descubrimientos.
9. Etiquetas ID3 y revisión de metadatos.

## 8. Exclusiones

Quedan fuera del alcance actual mastering, remasterización, ecualización correctiva, compresión, limitadores, normalización, restauración, conversión de formatos, exportación de audio procesado, decks, mixer, reproducción de mezcla, compra/descarga de música y acceso a cuentas de tiendas.

## 9. Requisitos de honestidad técnica

- No prometer detección perfecta de tonalidad, instrumentos, efectos o tracklists.
- Los MP3 con pérdida no contienen las frecuencias eliminadas durante su codificación; el programa no puede recuperarlas.
- Los análisis algorítmicos deben mostrar confianza y limitaciones.
- Un tracklist publicado no demuestra por sí solo cómo fue ejecutada una transición.
- No inventar timestamps, datos de eventos ni metadatos.
