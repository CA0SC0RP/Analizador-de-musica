# Prototipo visual para iPad

**Estado:** diseño definido y primer shell SwiftUI de demostración preparado en esta rama. No está compilado ni probado en el iPad.  
**Rama:** `prototype/ipad-visual-shell`  
**Objetivo:** fijar la experiencia principal y la vista comparativa de transición antes de conectar el análisis real.

## Principios de interfaz

- Aplicación nativa iPadOS con SwiftUI; orientación horizontal como espacio de trabajo principal y adaptación vertical sin reducir controles a tamaños incómodos.
- Biblioteca como centro de trabajo. Seleccionar una pista actualiza su ficha, waveform y panel contextual sin abandonar la biblioteca.
- Estética oscura, técnica y profesional; jerarquía clara, superficies discretas y acentos de color funcionales.
- Touch como interacción principal, con soporte de puntero/teclado cuando estén disponibles.
- Toda cifra o waveform simulada debe llevar una indicación de demostración. Nunca se presentará como resultado real.
- El reproductor será de escucha de una pista seleccionada. La vista de transición es una herramienta de análisis visual, no dos decks ni un mixer.

## Pantalla 1 — Biblioteca

### Distribución en horizontal

1. **Navegación lateral:** Biblioteca, Análisis, Tonalidades, Organización y Exportación. La vista Transición se abre desde la comparación de canciones; puede aparecer como acceso de trabajo, no como deck.
2. **Barra superior:** nombre del proyecto, búsqueda, importación y estado de la cola de análisis. La importación y la cola se conectarán en la fase funcional.
3. **Ficha de pista seleccionada:** título, artista, duración y metadatos musicales principales: BPM cuando esté validado, tonalidad, modo, Camelot y confianza.
4. **Waveform principal:** forma de onda de la canción completa, escala temporal, posición de reproducción y controles sencillos. El primer shell muestra una forma de onda simulada; no contiene audio ni reproducción.
5. **Biblioteca:** filas seleccionables con título, artista, duración, BPM, tonalidad/Camelot y estado de análisis. Filtros y ordenamiento se conectarán con la biblioteca persistente.
6. **Inspector contextual:** metadatos, Energy Map compacto y compatibilidad sugerida. Frequency Analysis se mantendrá como widget compacto expandible.

En orientación vertical, el inspector pasa debajo de la waveform y la biblioteca conserva prioridad. No se ocultarán datos esenciales detrás de controles diminutos.

## Pantalla 2 — Comparación de transición

Se abre al seleccionar una canción y elegir una candidata. No reemplaza la Biblioteca ni inicia una mezcla.

### Composición

- **Pista A:** canción de referencia, con tonalidad, BPM, Camelot y confianza.
- **Pista B:** candidata seleccionable desde la biblioteca.
- **Dos waveforms apiladas:** A arriba y B abajo. Cada una conserva su propio eje temporal y muestra la región relevante de salida/entrada.
- **Marcadores:** “Salida estimada A” y “Entrada sugerida B”, con una franja sombreada que representa la ventana propuesta de transición.
- **Frases y estructura:** cuando el análisis real las proporcione, se mostrarán límites de frases, intro, breakdown, build, drop y outro. No se inventarán segmentos si el motor no aporta evidencia.
- **Resumen de compatibilidad:** relación tonal, diferencia de BPM, alineación rítmica/frase y evolución de energía.
- **Confianza y advertencias:** distinguir resultado alto, moderado, incierto o no disponible; explicar qué factor limita la recomendación.
- **Alternativas:** permitir cambiar la candidata y comparar otras opciones.

### Qué significa el punto sugerido

El marcador será una **estimación de una ventana conveniente**, no una garantía de que la mezcla suene bien ni un punto universal exacto. Se priorizarán límites de frase y estructura; después se considerarán tempo, armonía y energía. Si beatgrid, estructura o tonalidad tienen baja confianza, la interfaz mostrará la advertencia y evitará una precisión falsa.

Las dos waveforms estarán alineadas visualmente para facilitar la comparación de las zonas de salida y entrada. Esto no implica reproducción simultánea, sincronización DJ, crossfader, EQ ni procesamiento. Esas funciones no forman parte del alcance acordado.

## Estados de interfaz

- **Sin analizar:** muestra metadatos disponibles y explica qué falta.
- **En cola / analizando:** progreso y posibilidad de cancelar/reintentar.
- **Completo:** muestra resultados y su procedencia.
- **Parcial o incierto:** conserva los valores disponibles, marca confianza y permite revisión.
- **Error:** explica el problema sin asignar tonalidad o BPM ficticios.
- **Demostración:** datos simulados identificados de forma visible.

## Dirección visual

- Fondo carbón/grafito y paneles ligeramente elevados.
- Pista A con acento cian; pista B con acento violeta.
- Verde reservado para estados realmente favorables; ámbar para incertidumbre o advertencias.
- Tipografía compacta pero legible; etiquetas pequeñas solo para metadatos secundarios.
- Waveforms amplias, con contraste suficiente y marcadores fáciles de distinguir.
- Animaciones discretas; priorizar fluidez y batería del iPad.

## Secuencia de construcción

1. **Shell visual:** navegación, Biblioteca, ficha, waveform simulada, tabla e inspector.
2. **Biblioteca real:** selector de archivos iPadOS, metadatos, persistencia y estados.
3. **Audio local:** reproducción de una pista y waveform calculada desde el MP3 original.
4. **Análisis:** Energy Map, espectro, tonalidad, ritmo y estructura mediante proveedores locales validados.
5. **Comparación:** waveforms reales A/B, marcadores temporales, compatibilidad explicable y confianza.
6. **Generador de sets:** construir recorridos completos cuando la comparación entre pares sea fiable.

El shell visual puede construirse sin esperar al motor analítico. La vista de transición se define ahora, pero sus recomendaciones reales se implementarán después de validar la biblioteca y el análisis. El generador de sets queda como etapa posterior.

## Criterios de aceptación del primer prototipo

- Abre como interfaz SwiftUI en el iPad.
- Biblioteca y vista de transición son navegables.
- Seleccionar una fila actualiza la ficha y la waveform de demostración.
- Cambiar la candidata actualiza la segunda pista y su marcador.
- El layout se adapta a horizontal y vertical.
- Los datos simulados están claramente identificados.
- No se presenta como funcional la importación, reproducción, análisis ni mezcla hasta implementarlos y probarlos con MP3 reales.

## Límites técnicos

- Procesamiento final local en iPadOS; Codespaces solo como entorno auxiliar de desarrollo.
- AVFoundation para acceso y reproducción local; Accelerate/vDSP para waveform y análisis espectral, según validación.
- Apple Music Understanding se evaluará como primer proveedor analítico local; la disponibilidad de su framework Beta en Swift Playgrounds y su rendimiento en el iPad A16 siguen pendientes de prueba.
- No subir MP3 personales a GitHub ni a servicios externos.
- No modificar, mover, recodificar ni sobrescribir los MP3 originales.
- No añadir servicios, API ni dependencias de pago sin autorización.
