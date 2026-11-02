# Bitácora del proyecto

## 2026-11-02 — Inicio de documentación y definición del alcance

### Estado del repositorio
- Repositorio: `CA0SC0RP/Analizador-de-m-sica`
- URL: https://github.com/CA0SC0RP/Analizador-de-m-sica
- Rama predeterminada reportada: `main`
- Visibilidad: pública.
- Inspección inicial: el repositorio estaba vacío (sin archivos ni código).
- Por ello, no hay implementación previa que pueda declararse como terminada o probada.

### Decisiones aprobadas por el usuario

1. El producto es un **analizador de música**, no una aplicación DJ.
2. Su función principal es leer y analizar MP3 locales con profundidad.
3. Debe aceptar análisis individuales y por lotes de cualquier tamaño práctico.
4. Cada pista tendrá un expediente detallado y persistente.
5. Visualizaciones destacadas: Energy Map, Frequency Analysis, Spectrogram y Waveform.
6. El Energy Map debe mostrar evolución de energía y momentos musicales, incluyendo tonalidad y eventos detectados a lo largo del tiempo.
7. La tonalidad, Camelot y BPM son importantes, pero la compatibilidad no se limitará a tonalidades idénticas ni a reglas rígidas.
8. Se estudiarán ritmo, groove, estructura, timbre, energía y transiciones.
9. Se podrá revisar y corregir ID3; toda escritura en MP3 será opcional, revisable y autorizada.
10. El programa buscará información pública de canciones, artistas y sellos.
11. Habrá dos funciones de sets: detectar canciones propias en sesiones publicadas y buscar sets externos para estudiar sus tracklists y transiciones.
12. Se priorizará música electrónica underground (minimal techno, techno, dark techno, deep house y house), con interés especial en escenas europeas y alemanas. Los sets de otros estilos podrán servir como material de estudio técnico.
13. El programa no descargará música, no comprará canciones y no accederá a cuentas de Beatport u otras tiendas.
14. Se usarán fuentes públicas y accesos permitidos; no se hará nada ilegal ni se evadirán restricciones.
15. El audio original se mantiene intacto durante el análisis.

### Exclusiones expresas

- Mastering/remasterización.
- Ecualización correctiva.
- Compresión, limitadores y normalización.
- Restauración de audio.
- Conversión de formatos.
- Exportación de audio procesado.
- Reproductor DJ, decks, mixer, crossfader o efectos.
- Compra/descarga de música y acceso a cuentas de tiendas.
- APIs comerciales obligatorias o gastos sin autorización.

### Próximas etapas

1. Inspeccionar y documentar requisitos técnicos del entorno objetivo.
2. Comparar bibliotecas de análisis (Essentia, librosa, aubio, FFmpeg y alternativas) según precisión, licencias, rendimiento y requisitos; no instalar todo indiscriminadamente.
3. Diseñar arquitectura local, base de datos, cola por lotes y caché de análisis.
4. Definir modelo de datos y esquema de resultados con procedencia y confianza.
5. Diseñar prototipo de interfaz oscura y expediente de pista.
6. Implementar primero ingestión MP3 y análisis básico verificable.
7. Añadir análisis armónico, ritmo y estructura.
8. Construir visualizaciones Energy Map, Waveform, Spectrogram y Frequency Analysis.
9. Añadir etiquetas ID3 con revisión y confirmación.
10. Añadir compatibilidad entre canciones.
11. Investigar integraciones públicas y permitidas para metadatos y DJ sets.
12. Implementar detección de canciones en sets y estudio de transiciones.
13. Añadir pruebas, documentación y empaquetado.

### Reglas de trabajo

- Mantener esta bitácora actualizada con decisiones, cambios y evidencia.
- Distinguir siempre entre aprobado, propuesto, implementado y probado.
- No registrar funciones como completadas sin pruebas.
- No añadir gastos ni servicios pagos sin autorización explícita.
- No ampliar el producto hacia mastering o funciones DJ.
- Preservar archivos originales; respaldar y confirmar cualquier escritura ID3.
- Ante incertidumbre técnica, documentarla y evaluar opciones antes de adoptar dependencias.

### Estado al cierre de esta entrada

**Fase:** definición y documentación inicial.  
**Implementación:** todavía no iniciada.  
**Pruebas:** ninguna.  
**Siguiente hito:** auditoría técnica y diseño de arquitectura.
