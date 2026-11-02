# Bitácora del proyecto

## 2026-11-02 — Redefinición y reducción del alcance V1

### Repositorio
- Repositorio: `CA0SC0RP/Analizador-de-musica`
- URL: https://github.com/CA0SC0RP/Analizador-de-musica
- Rama base: `main`
- Rama de esta preparación: `foundation/v1-scope-and-swiftui-shell`

### Decisiones de producto

1. El producto es un analizador y organizador de biblioteca musical local para iPad. No es una aplicación DJ, DAW ni mastering.
2. La interfaz y la facilidad de trabajo son prioridades centrales, al mismo nivel que la calidad analítica.
3. La Biblioteca será el centro: ficha de pista, waveform amplio, reproductor integrado, tabla configurable y panel contextual.
4. Navegación principal: Biblioteca, Análisis, Tonalidades, Organización y Exportación.
5. Waveform integrado en Biblioteca y Análisis; Energy Map junto al waveform; Frequency Analysis compacto y expandible.
6. El reproductor solo permite escuchar la pista seleccionada: Play/Pause, seek, posición, duración y volumen. No habrá decks ni mezcla.
7. V1 incluye importación MP3 por lotes, metadatos, persistencia local, waveform, Energy Map, Frequency Analysis, tonalidad, modo, alternativas, confianza, Camelot, compatibilidad armónica y exportación.
8. V1 analiza la canción completa; no se impondrán límites arbitrarios de 60 o 180 segundos.
9. Essentia.js es el candidato principal para evaluación, no una dependencia validada todavía. Hay que probar integración iPadOS, rendimiento y licencia.
10. Ruta nativa candidata: Swift/SwiftUI, AVFoundation y Accelerate/vDSP.
11. Exportar es esencial: copiar MP3 originales a carpetas por tonalidad/Camelot y categorías configurables; nunca mover ni recodificar.
12. Los resultados dudosos se separan para revisión; no se asigna una tonalidad por defecto cuando falla el análisis.
13. Se necesitan dos MP3 de referencia aportados por el usuario cuando comience la prueba del motor: una pista techno/minimal y otra contrastante. No subirlos al repositorio público.

### Fuera de V1

- Detector BPM, beatgrid, compás y groove.
- Spectrogram independiente.
- Análisis avanzado de transiciones, separación de stems, búsqueda de DJ sets y análisis de sesiones.
- Mastering, EQ correctiva, compresión, normalización, restauración, mejora de audio.
- Conversión/recodificación, decks, mixer, crossfader y efectos DJ.
- Compra o descarga de música.

BPM ya presente en metadatos puede mostrarse como dato de origen, sin detector propio.

### Referencias técnicas evaluadas

- Audio AI Dynamics: referencia para Essentia.js y análisis de tonalidad.
- Neural Frames Song Key Finder: referencia conceptual para cromagrama, perfiles mayor/menor y Camelot.
- Audio Analysis Studio: referencia de modularidad, no de arquitectura servidor.
- Camelot AI DJ: ideas de caché, persistencia y análisis incremental.
- DJ Analyzer: ideas de análisis de energía y espectro; no adoptar sus límites parciales ni fallbacks engañosos.

No se copiará código de estos proyectos sin revisar licencia y necesidad. Las referencias sirven para seleccionar ideas y validar algoritmos.

### Reglas de trabajo

- Procesamiento local como prioridad; ningún gasto/API de pago sin permiso.
- El usuario conserva la decisión final.
- Registrar decisiones, cambios y evidencia.
- Distinguir aprobado, propuesto, implementado, compilado y probado.
- No declarar un módulo terminado sin pruebas con audio real.
- Preservar los originales y evitar sobrescrituras.
- Diseño, navegación, touch y mouse/puntero son requisitos funcionales.
- Los datos simulados deben identificarse claramente.

### Estado al registrar esta actualización

- Alcance V1 redefinido.
- Rama de preparación creada.
- Actualización documental y esqueleto SwiftUI en curso.
- No se ha confirmado todavía una compilación en Xcode ni pruebas en iPad.
- Siguiente hito: terminar el shell visual de Biblioteca, abrirlo en Xcode/iPad y ajustar diseño antes de integrar el motor de audio.
