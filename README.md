# Analizador de música

Analizador local de archivos MP3 orientado a música electrónica y al estudio de compatibilidad musical y mezclas DJ.

## Propósito

Leer y analizar archivos MP3 sin convertirlos, procesarlos ni remasterizarlos. El programa ofrece análisis musical profundo, visual e informativo, investiga información pública sobre canciones y DJ sets y organiza los MP3 analizados en carpetas según sus resultados.

**No es una aplicación DJ, reproductor de mezcla ni estación de mastering.**

## Plataforma y prioridad de diseño

**La aplicación se diseñará y desarrollará directamente para iPad.** La interfaz no será una adaptación posterior de un programa de escritorio. Se diseñará considerando el tamaño de pantalla, orientación, interacción táctil, navegación y rendimiento del iPad desde el inicio.

La experiencia gráfica es una prioridad central, al mismo nivel que el funcionamiento del motor de análisis. Se busca una consola musical oscura, profesional, atractiva y rica en información.

La interfaz debe ser **densa en información útil**: cuando los datos sean relevantes, deben estar visibles y bien organizados. No se busca una pantalla minimalista ni vacía, pero tampoco una acumulación desordenada de controles. Cada panel, indicador, gráfico y botón debe tener una función clara.

### Navegación por espacios y subventanas

La aplicación se organizará en áreas principales y, dentro de cada una, en vistas de análisis especializadas. La misma canción o contexto podrá abrir distintas vistas sin perder la referencia de dónde se estaba trabajando.

Ejemplo de flujo desde la ficha de una pista:
- Vista general de la canción.
- Botón Waveform → vista dedicada a la forma de onda y timeline.
- Botón Spectrogram → vista dedicada al espectrograma.
- Botón Frequency Analysis → vista dedicada al análisis espectral.
- Botón Energy Map → vista de energía, breaks, builds, drops y momentos destacados.
- Botón Tonalidad → vista armónica, Camelot y evolución tonal.
- Botón Ritmo → BPM, beatgrid, compás y groove.
- Botón Estructura → secciones y eventos con timestamps.
- Botón Compatibilidad → canciones relacionadas y razones de compatibilidad.
- Botón DJ Sets → sesiones donde aparece esta canción.

Las áreas principales también tendrán accesos directos independientes para Biblioteca, Análisis, Compatibilidad, Camelot, DJ Sets, Descubrimientos, etiquetas ID3 y Exportación organizada.

## Alcance aprobado

- Importar y analizar archivos MP3 individualmente o por lotes (por ejemplo, 1, 2, 50 o 100 archivos).
- Conservar temporalmente los archivos seleccionados dentro del espacio de trabajo de la aplicación, según las reglas de almacenamiento de iPadOS, y guardar los resultados en una base de datos local.
- Evitar análisis repetidos si el archivo no ha cambiado.
- Mostrar una ficha detallada por canción con visualizaciones y análisis.
- Analizar tonalidad, modo, Camelot, BPM, beatgrid, compás, ritmo, groove y estructura.
- Mostrar Waveform, Spectrogram, Frequency Analysis y Energy Map.
- Detectar y marcar intro, entrada del beat, bajo, breaks, builds, drops, cambios de energía, outro y otros momentos relevantes, con timestamp y nivel de confianza.
- Describir rasgos sonoros y posibles efectos/instrumentos cuando el análisis lo permita.
- Evaluar calidad técnica del archivo sin intentar corregirla.
- Corregir y administrar etiquetas ID3 mediante propuestas verificables y confirmación antes de escribir cambios.
- Comparar canciones y explicar compatibilidad armónica, rítmica, estructural y energética.
- Investigar metadatos públicos de artistas, canciones, sellos y créditos.
- Buscar DJ sets publicados y detectar canciones de la biblioteca en sus tracklists o grabaciones cuando sea legal y técnicamente posible.
- Analizar tracklists y transiciones de sets externos, indicando qué está confirmado y qué es inferido.
- **Exportar los MP3 analizados a otra carpeta, organizados por tonalidad/Camelot y categorías de compatibilidad. La exportación copia los archivos originales sin recodificar ni cambiar de formato.**
- Mantener bitácora, estado, decisiones y hoja de ruta en GitHub.

## Exportación organizada de MP3

La exportación es una función esencial del flujo de trabajo, no una exportación de audio procesado. Tras analizar una tanda de canciones, el usuario podrá generar una estructura de carpetas de destino y copiar allí los MP3 correspondientes, organizados por tonalidad, Camelot y criterios de compatibilidad seleccionados.

- Los archivos exportados conservan el formato MP3 y el flujo de audio original, sin recodificación.
- No se cambia bitrate, frecuencia de muestreo, volumen ni calidad de audio.
- La organización puede usar carpetas por tonalidad y Camelot, además de grupos o categorías armónicas configurables.
- Las canciones cuya tonalidad no pueda determinarse con confianza irán a una carpeta de revisión/no identificadas.
- Se evitarán sobrescrituras y colisiones de nombres; se informarán duplicados y conflictos.
- El usuario elige el destino y confirma la operación.
- Por seguridad, la exportación será una copia y no moverá ni borrará los originales.
- Las correcciones ID3 solo se incluirán en la copia exportada si el usuario las aprobó expresamente; de lo contrario, la copia conservará las etiquetas originales.
- Los análisis y sus resultados permanecen en la base de datos local, independientemente de la exportación.

## Visualizaciones principales

- **Energy Map:** evolución de energía y momentos musicales a lo largo de la pista; integra marcas de estructura, tonalidad y eventos relevantes.
- **Waveform:** amplitud y cambios temporales.
- **Spectrogram:** distribución de frecuencias a través del tiempo.
- **Frequency Analysis:** distribución espectral, graves, medios, agudos y características técnicas.
- **Timeline musical:** eventos con timestamp, BPM, tonalidad y confianza cuando estén disponibles.

Estas vistas son herramientas de lectura y análisis, no controles de procesamiento de audio.

## Exclusiones expresas

No se desarrollarán, como parte del alcance actual:
- Mastering o remasterización.
- Ecualización correctiva.
- Compresión, limitadores o normalización.
- Restauración o mejora de audio.
- Conversión de formatos o recodificación.
- Exportación de audio procesado.

Tampoco se incluirán reproductor DJ, decks, mixer, crossfader, efectos de mezcla, descarga de música, compra de canciones ni acceso a cuentas de tiendas.

Los MP3 originales deben permanecer intactos durante el análisis y la exportación. La única escritura de metadatos contemplada es la actualización opcional de etiquetas ID3, siempre con autorización explícita y sin alterar el flujo de audio.

## Principios

1. Prioridad local, gratuita y sin gastos no autorizados.
2. El audio original se lee; no se transforma.
3. La exportación organizada copia el MP3 sin recodificarlo.
4. Separar datos medidos, estimaciones algorítmicas y datos obtenidos de Internet.
5. Mostrar confianza, incertidumbre y procedencia.
6. No afirmar que se identificó un instrumento, efecto, tonalidad o transición cuando la evidencia no lo permita.
7. No imponer reglas rígidas de Camelot: evaluar compatibilidad real con armonía, tempo, groove, estructura y energía.
8. Respetar derechos de autor, términos de plataformas, límites de acceso y fuentes públicas permitidas.
9. El usuario conserva la decisión final sobre cambios de metadatos, exportaciones y cualquier gasto.
10. La calidad visual, jerarquía de información y navegación táctil son requisitos de producto, no detalles cosméticos.

## Estado inicial

El repositorio se encontraba vacío al iniciar esta documentación. Todavía no hay implementación, pruebas ni análisis de MP3 verificados.

Consulta:
- [Alcance funcional](docs/ALCANCE_FUNCIONAL.md)
- [Bitácora](BITACORA.md)
- [Hoja de ruta](docs/HOJA_DE_RUTA.md)
