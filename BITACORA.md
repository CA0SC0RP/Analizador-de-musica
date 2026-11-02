# Bitácora del proyecto

## 2026-11-02 — Definición inicial y decisiones de alcance

### Estado del repositorio
- Repositorio: `CA0SC0RP/Analizador-de-m-sica`
- URL: https://github.com/CA0SC0RP/Analizador-de-m-sica
- Rama: `main`
- El repositorio estaba vacío al iniciar la documentación.
- No hay implementación ni pruebas de audio verificadas todavía.

### Decisiones aprobadas

1. Producto: analizador de música, no aplicación DJ.
2. Plataforma: iPad desde el inicio.
3. La calidad visual es prioritaria. Interfaz oscura, profesional y rica en información útil, con navegación por secciones y subventanas especializadas que conservan el contexto.
4. Importar y analizar MP3 individualmente o por lotes.
5. Mantener análisis y metadatos en almacenamiento local; evitar recalcular archivos sin cambios.
6. Expediente por canción con tonalidad, modo, Camelot, BPM, beatgrid, compás, groove, estructura, Energy Map, Waveform, Spectrogram, Frequency Analysis, características sonoras y calidad técnica.
7. Energy Map integrado con eventos temporales, tonalidad y cambios de energía.
8. Compatibilidad explicable y no limitada a tonalidades idénticas ni reglas rígidas de Camelot.
9. Corrección ID3 asistida; mostrar original y propuesta, y escribir cambios solo con aprobación.
10. Investigación de información pública de canciones, artistas y sellos.
11. Dos funciones de DJ sets: encontrar las canciones del usuario en sesiones publicadas y buscar sets para estudiar tracklists y transiciones.
12. Priorizar minimal techno, techno, dark techno, deep house y house underground, especialmente escenas europeas y alemanas; otros estilos pueden servir para estudiar técnicas de mezcla.
13. Sin descarga/compra de música ni acceso a cuentas privadas de Beatport u otras tiendas.
14. Usar fuentes públicas y accesos permitidos, sin evadir restricciones.
15. **Sí habrá exportación:** una vez analizados los MP3, la aplicación copiará los archivos originales a otra carpeta elegida por el usuario, organizándolos por tonalidad/Camelot y agrupaciones de compatibilidad.
16. La exportación no convierte ni recodifica: conserva MP3, flujo de audio, bitrate, sample rate y duración. No aplica procesamiento de sonido.
17. La exportación será copia, no movimiento; los originales permanecen intactos.
18. Si el usuario aprueba correcciones ID3, estas podrán aplicarse a la copia exportada. Si no, se copia también el metadata original sin cambios.
19. La aplicación debe prevenir sobrescrituras accidentales y permitir revisar clasificación y conflictos antes de copiar.
20. Pruebas iniciales mediante el flujo Apple Developer de siete días; publicación de pago solo si se decide más adelante.

### Exclusiones expresas

- Mastering/remasterización, EQ correctiva, compresión, limitadores, normalización y restauración.
- Conversión de formatos o recodificación.
- Exportación de audio procesado.
- Reproductor DJ, decks, mixer, crossfader y efectos.
- Descarga/compra de música o acceso a cuentas de tiendas.
- Gastos o APIs comerciales obligatorias sin autorización.

### Próximas etapas

1. Auditoría técnica para iPad: APIs nativas, bibliotecas, licencias, acceso a archivos y rendimiento.
2. Diseñar navegación y sistema visual; prototipo navegable aprobado antes de completar algoritmos.
3. Diseñar almacenamiento local, caché, cola por lotes y gestión de espacio.
4. Implementar importación MP3 y análisis esencial.
5. Implementar estructura musical y visualizaciones.
6. Implementar corrección ID3 segura.
7. Implementar compatibilidad.
8. Implementar exportación por tonalidad/Camelot y categorías, con pruebas de identidad binaria del audio.
9. Investigar fuentes públicas para artistas, tracklists y sets.
10. Implementar descubrimiento de sets y estudio de transiciones.
11. Pruebas completas en iPad, documentación y distribución de prueba.

### Reglas de trabajo

- Registrar cada decisión, cambio, implementación y evidencia en esta bitácora.
- Distinguir aprobado, propuesto, implementado y probado.
- No declarar una función terminada sin pruebas.
- No asumir gastos sin autorización explícita.
- No ampliar el producto hacia mastering o funciones DJ.
- Preservar originales; confirmar cambios ID3.
- La interfaz y la navegación son requisitos funcionales.
- La exportación copia y organiza; nunca procesa ni convierte el audio.

### Estado al cierre

**Fase:** definición y documentación.  
**Implementación:** no iniciada.  
**Pruebas:** ninguna.  
**Siguiente hito:** auditoría técnica iPad y prototipo visual/navegable.
