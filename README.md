# Analizador de música

Analizador local de archivos MP3 orientado a música electrónica y al estudio de compatibilidad musical y mezclas DJ.

## Propósito

Leer y analizar archivos MP3 sin convertirlos, procesarlos, remasterizarlos ni exportar audio. El programa debe ofrecer un análisis musical profundo, visual e informativo, además de investigar información pública sobre canciones y DJ sets.

**No es una aplicación DJ, reproductor de mezcla ni estación de mastering.**

## Alcance aprobado

- Importar y analizar archivos MP3 individualmente o por lotes (por ejemplo, 1, 2, 50 o 100 archivos).
- Conservar resultados en una base de datos local y evitar análisis repetidos si el archivo no ha cambiado.
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
- Mantener bitácora, estado, decisiones y hoja de ruta en GitHub.

## Visualizaciones principales

- **Energy Map:** evolución de energía y momentos musicales a lo largo de la pista; debe integrar marcas de estructura, tonalidad y eventos relevantes.
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
- Conversión de formatos.
- Exportación de audio procesado.
- Reproductor DJ, decks, mixer, crossfader o efectos de mezcla.
- Descarga de música, compra de canciones o acceso a cuentas de tiendas.
- Integraciones obligatorias con APIs comerciales o servicios de pago.

Los MP3 originales deben permanecer intactos durante el análisis. La única escritura sobre ellos contemplada es la actualización opcional de etiquetas ID3, siempre con autorización explícita y sin alterar el flujo de audio.

## Principios

1. Prioridad local, gratuita y sin gastos no autorizados.
2. El audio original se lee; no se transforma.
3. Separar datos medidos, estimaciones algorítmicas y datos obtenidos de Internet.
4. Mostrar confianza, incertidumbre y procedencia.
5. No afirmar que se identificó un instrumento, efecto, tonalidad o transición cuando la evidencia no lo permita.
6. No imponer reglas rígidas de Camelot: evaluar compatibilidad real con armonía, tempo, groove, estructura y energía.
7. Respetar derechos de autor, términos de plataformas, límites de acceso y fuentes públicas permitidas.
8. El usuario conserva la decisión final sobre cambios de metadatos y cualquier gasto.

## Estado inicial

El repositorio se encontraba vacío al iniciar esta documentación. Todavía no hay implementación, pruebas ni análisis de MP3 verificados.

Consulta:
- [Alcance funcional](docs/ALCANCE_FUNCIONAL.md)
- [Bitácora](BITACORA.md)
- [Hoja de ruta](docs/HOJA_DE_RUTA.md)
