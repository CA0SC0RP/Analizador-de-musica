# Hoja de ruta V1

La Biblioteca y el entorno visual son el centro del producto. El motor analítico debe integrarse en una experiencia coherente y fácil de trabajar; no se considerará suficiente que el programa simplemente escanee archivos.

## Secuencia de trabajo

| Etapa | Trabajo | Criterio de salida |
|---|---|---|
| 0. Consolidación | Alcance, decisiones, bitácora y límites V1 | Documentación coherente |
| 1. Fundamento visual | SwiftUI, tema, navegación, componentes y layout adaptativo | App shell y Biblioteca navegables |
| 2. Biblioteca funcional | Importación, lista, selección, estados y persistencia inicial | Selección y actualización contextual verificables |
| 3. Reproductor + waveform | Reproducción local y waveform completo | Audio real, seek y waveform sincronizados |
| 4. Energy Map | Análisis temporal de energía y eventos tentativos | Visualización con timestamps y confianza |
| 5. Frequency Analysis | FFT/espectro y bandas | Widget compacto y vista expandida |
| 6. Tonalidad + Camelot | Essentia.js candidato, cromagrama y métodos de contraste | Análisis de pista completa, alternativas y fallos honestos |
| 7. Compatibilidad + organización | Relaciones armónicas y filtros | Clasificación explicable |
| 8. Exportación | Copia segura de MP3 originales por carpetas | Integridad, conflictos y reanudación probados |
| 9. Integración y QA | Rendimiento, accesibilidad, memoria, batería y regresiones | Versión V1 probada en iPad |

## Plan intensivo de siete jornadas (objetivo, no garantía)

1. **Diseño visual y navegación:** sistema visual, Biblioteca, paneles y estados.
2. **Waveform y reproductor:** reproducción local, transporte y forma de onda integrada.
3. **Energy Map:** cálculo temporal y visualización.
4. **Frequency Analysis:** espectro y widget expandible.
5. **Tonalidad y Camelot:** integración del motor y pruebas completas.
6. **Compatibilidad y organización:** explicación de relaciones y clasificación.
7. **Exportación e integración:** copia íntegra, pruebas y correcciones.

Cada jornada exige implementación real y pruebas. Si la precisión o estabilidad no alcanza el criterio de salida, se registra como pendiente; el calendario no justifica declarar terminado un módulo defectuoso.

## Reglas del prototipo visual

- La Biblioteca debe verse como un entorno de trabajo completo, no como un formulario de importación.
- Cabecera de pista, waveform, reproductor, tabla y panel contextual conviven en la misma pantalla.
- Navegación principal: Biblioteca, Análisis, Tonalidades, Organización y Exportación.
- Energy Map y Waveform se relacionan en la vista Análisis.
- Frequency Analysis aparece compacto y se expande a demanda.
- Datos de demostración deben estar etiquetados como tales y nunca confundirse con análisis real.
- Touch es prioritario, sin perder compatibilidad con mouse/puntero y teclado.
- Adaptar layout a orientación y tamaños de iPad.
- Transiciones discretas, estados claros y rendimiento fluido.

## Evaluación tecnológica

Ruta candidata:
- Swift / SwiftUI: interfaz nativa iPadOS.
- AVFoundation: lectura y reproducción local.
- Accelerate / vDSP: FFT y operaciones numéricas.
- Essentia.js: candidato principal para tonalidad y análisis musical; probar integración WebAssembly/JavaScript, rendimiento, consumo y licencia AGPL-3.0/opción propietaria antes de distribuir.
- aubio, librosa y otros motores: referencias o alternativas para validar algoritmos; no agregar dependencias sin necesidad.
- FFmpeg solo si las APIs nativas no cubren una necesidad real.

Medir compatibilidad iPadOS, CPU/RAM, tamaño, tiempo de análisis de pistas completas, batería, precisión en música electrónica, recuperación de errores y obligaciones de licencia. No contratar servicios ni asumir costes sin autorización.

## Conjunto de pruebas MP3

Solicitar al usuario dos archivos cuando comience la integración del motor:
1. Una pista completa de techno/minimal techno de buena calidad, preferentemente 320 kbps.
2. Una pista de otro estilo o estructura musical contrastante.

Usar ambos archivos para importación, metadatos, duración, decodificación, waveform, Energy Map, espectro y tonalidad/Camelot. Añadir posteriormente más muestras y casos difíciles. Los MP3 de prueba no se subirán al repositorio público.

## Criterio de calidad

Por cada módulo: diseño definido → implementación → prueba con audio real → integración → evidencia registrada en bitácora. Distinguir siempre planificado, implementado, compilado, probado y aprobado. No declarar V1 lista solo porque la interfaz o una pantalla de demostración funcione.
