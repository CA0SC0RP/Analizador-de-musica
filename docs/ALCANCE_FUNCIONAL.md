# Alcance funcional aprobado

## 1. Plataforma y experiencia de usuario

### Plataforma objetivo
- Aplicación diseñada y desarrollada directamente para iPad.
- La interfaz debe adaptarse al tamaño de pantalla y a la interacción táctil del iPad desde el inicio.
- La elección del stack se hará en la auditoría técnica, priorizando compatibilidad real con iPad, acceso a archivos locales, rendimiento de análisis y facilidad de pruebas.
- Se prevé probar versiones de desarrollo mediante el flujo de Developer de Apple de siete días disponible para el usuario. La publicación o distribución de pago queda para una decisión futura independiente.

### Prioridad visual
La interfaz gráfica es una prioridad principal, al mismo nivel que la capacidad analítica. El resultado debe sentirse como una consola profesional de análisis musical.

Dirección visual:
- Tema oscuro, elegante y profesional.
- Alta densidad de información útil: gráficos, indicadores, metadatos, métricas, etiquetas y controles visibles cuando aporten valor.
- Composición ordenada, jerarquía visual clara y tipografía legible.
- Controles táctiles cómodos y claramente identificables.
- Paneles y tarjetas con información contextual.
- La densidad deseada es de contenido importante, no de decoración ni ruido visual.

### Navegación por vistas y subventanas
La aplicación tendrá secciones principales y vistas especializadas dentro de cada sección. Un botón podrá abrir una nueva vista de análisis dedicada, conservando el contexto de la pista, set o elemento que se está estudiando.

Desde la ficha de canción se podrá entrar a General, Waveform, Spectrogram, Frequency Analysis, Energy Map, Tonalidad/armonía, BPM/beatgrid/groove, Estructura, Calidad técnica, Compatibilidad, metadatos externos y DJ Sets relacionados.

Cada botón debe conducir a una vista funcional. Se podrá profundizar y volver al nivel anterior sin perder la pista seleccionada ni el estado de navegación.

Áreas principales:
1. Biblioteca y cola de análisis.
2. Expediente / análisis de pista.
3. Compatibilidad.
4. Rueda Camelot.
5. Live Sets encontrados en la biblioteca.
6. Buscador de DJ sets.
7. Estudio de transiciones.
8. Artistas, sellos y descubrimientos.
9. Etiquetas ID3 y revisión de metadatos.
10. Exportación organizada.

## 2. Biblioteca, almacenamiento y procesamiento por lotes

- Selección de archivos MP3 locales mediante el selector de archivos de iPadOS.
- Importación o acceso seguro a los archivos seleccionados, según las capacidades y permisos de iPadOS.
- Cola de análisis individual y por lotes.
- Estados por archivo: pendiente, en análisis, completo, parcial, error y requiere revisión.
- Reintentos controlados y recuperación tras interrupciones.
- Persistencia local de resultados.
- Identificación de cambios de archivo mediante hash y metadatos técnicos para evitar recalcular innecesariamente.
- El espacio de trabajo podrá conservar copias de trabajo locales para que el análisis por lotes y la exportación no dependan de que el usuario vuelva a seleccionar cada archivo.
- La aplicación informará del espacio utilizado y permitirá administrar los archivos de trabajo sin borrar por accidente los originales de otras ubicaciones.

## 3. Expediente musical por pista

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

## 4. Corrección de etiquetas ID3

- Detectar campos vacíos, inconsistentes, duplicados o aparentemente erróneos.
- Proponer correcciones con fuente, coincidencia y confianza.
- No reemplazar un título numérico o dudoso sin identificación suficientemente sólida.
- Permitir revisión individual y por lotes.
- Mostrar valores anteriores y propuestos.
- Conservar respaldo de valores originales.
- Escribir etiquetas únicamente tras confirmación explícita.
- No alterar el flujo de audio ni convertir el archivo.

## 5. Compatibilidad entre canciones

La puntuación debe ser explicable y desglosada en:
- Compatibilidad armónica.
- Relación Camelot y tonalidades vecinas.
- Compatibilidad de BPM y ajuste razonable.
- Groove y patrones rítmicos.
- Energía y evolución.
- Estructura y puntos posibles de transición.
- Características tímbricas y densidad.

No asumir que solo funciona la misma tonalidad ni que una relación Camelot garantiza una buena mezcla. Separar compatibilidad teórica, compatibilidad estimada y evidencia observada en sets reales.

## 6. Investigación de canciones y artistas

Consultar fuentes públicas permitidas para enriquecer identificación oficial, álbum, fecha, sello, discografía, productores, compositores, créditos, remixes, edits, versiones y colaboraciones. Resolver ambigüedades y registrar fuente y confianza.

## 7. DJ sets y sesiones

### Encontrar la biblioteca del usuario en sets
- Buscar tracklists públicos y sets publicados que incluyan canciones de la biblioteca.
- Asociar DJ, sesión, evento, ciudad/país, fecha, plataforma y enlace.
- Mostrar timestamp cuando exista.
- Distinguir coincidencia confirmada, probable y no verificada.
- Manejar remixes, edits, versiones e IDs desconocidos sin confundirlos.

### Buscar sets para estudiar mezclas
- Buscar por DJ, artista, sello, club, evento, escena o género.
- Dar prioridad de descubrimiento a techno, minimal techno, dark techno, deep house y house underground, especialmente escenas europeas y alemanas.
- También permitir analizar sets de otros estilos si aportan información técnica.
- Desglosar tracklist, BPM, tonalidad, Camelot y transición entre canciones cuando haya datos o audio accesible legalmente.
- Estimar solapamiento, cambios de tempo y puntos de entrada/salida solo con evidencia suficiente.

La aplicación no descarga música ni proporciona acceso a tiendas o cuentas privadas. Presenta información pública y enlaces a plataformas originales, respetando sus términos y restricciones.

## 8. Exportación organizada de MP3 originales

La exportación es una función central del flujo de trabajo. Después de analizar una o varias tandas, el usuario podrá exportar los MP3 a otra ubicación/carpeta elegida en iPadOS, ordenados según los resultados del análisis.

### Funcionamiento
- La aplicación prepara una estructura de carpetas según tonalidad y código Camelot.
- Puede crear subcarpetas o agrupaciones adicionales según compatibilidad armónica, por ejemplo tonalidades relacionadas, siempre mostrando el criterio utilizado.
- Los archivos con tonalidad incierta, desconocida o contradictoria se colocan en una carpeta de revisión, no se clasifican como si el dato fuera seguro.
- El usuario puede revisar el resumen de clasificación antes de iniciar la exportación.
- La operación se ejecuta como copia de archivos a la carpeta destino; no mueve ni elimina los originales.
- Se informan conflictos de nombres, duplicados, archivos omitidos y errores de copia.
- Se evita sobrescribir archivos existentes sin autorización.
- La exportación debe poder reanudarse o informar claramente qué elementos quedaron pendientes si se interrumpe.

### Integridad del archivo
- Copiar el MP3 original sin decodificarlo y volverlo a codificar.
- Mantener el mismo formato MP3, flujo de audio, bitrate, frecuencia de muestreo y duración.
- No aplicar ganancia, normalización, EQ, compresión, limitación ni procesamiento.
- Verificar integridad de la copia mediante hash cuando sea viable.
- Las etiquetas ID3 corregidas solo se escriben en la copia exportada si el usuario aprobó expresamente esas correcciones. Si no, se copia el archivo sin modificar sus metadatos.
- La base de datos y los análisis se conservan independientemente de la carpeta exportada.

**La exportación organiza los archivos; no procesa el sonido.** No es una función de conversión ni de mastering.

## 9. Exclusiones

Quedan fuera del alcance actual mastering, remasterización, ecualización correctiva, compresión, limitadores, normalización, restauración, conversión de formatos, recodificación, exportación de audio procesado, decks, mixer, reproducción de mezcla, compra/descarga de música y acceso a cuentas de tiendas.

## 10. Requisitos de honestidad técnica

- No prometer detección perfecta de tonalidad, instrumentos, efectos o tracklists.
- Los MP3 con pérdida no contienen las frecuencias eliminadas durante su codificación; el programa no puede recuperarlas.
- Los análisis algorítmicos deben mostrar confianza y limitaciones.
- Un tracklist publicado no demuestra por sí solo cómo fue ejecutada una transición.
- No inventar timestamps, datos de eventos ni metadatos.
