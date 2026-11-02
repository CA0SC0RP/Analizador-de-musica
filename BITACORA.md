# Bitácora del proyecto

## 2026-11-02 — Inicio de documentación y definición del alcance

### Estado del repositorio
- Repositorio: `CA0SC0RP/Analizador-de-m-sica`
- URL: https://github.com/CA0SC0RP/Analizador-de-m-sica
- Rama predeterminada: `main`
- Visibilidad: pública.
- Inspección inicial: el repositorio estaba vacío (sin archivos ni código).
- No hay implementación previa que pueda declararse como terminada o probada.

### Decisiones aprobadas por el usuario

1. El producto es un **analizador de música**, no una aplicación DJ.
2. Plataforma objetivo: **iPad desde el inicio**. No se desarrollará primero una aplicación de escritorio para adaptarla después.
3. La calidad visual y la experiencia de uso son prioridades centrales, al mismo nivel que el motor de análisis.
4. La interfaz será oscura, profesional y rica en información útil. El usuario sí quiere una presentación visualmente densa cuando todos los datos mostrados sean relevantes; no busca minimalismo vacío.
5. La navegación será por áreas principales y vistas/subventanas especializadas. Desde una misma ficha o contexto, botones independientes abrirán Waveform, Spectrogram, Frequency Analysis, Energy Map, tonalidad, ritmo, estructura, compatibilidad y DJ Sets. Debe conservarse el contexto y poder volver a la vista anterior.
6. Su función principal es leer y analizar MP3 locales con profundidad.
7. Debe aceptar análisis individuales y por lotes de cualquier tamaño práctico.
8. Cada pista tendrá un expediente detallado y persistente.
9. Visualizaciones destacadas: Energy Map, Frequency Analysis, Spectrogram y Waveform.
10. El Energy Map debe mostrar evolución de energía y momentos musicales, incluyendo tonalidad y eventos detectados a lo largo del tiempo.
11. La tonalidad, Camelot y BPM son importantes, pero la compatibilidad no se limitará a tonalidades idénticas ni a reglas rígidas.
12. Se estudiarán ritmo, groove, estructura, timbre, energía y transiciones.
13. Se podrá revisar y corregir ID3; toda escritura en MP3 será opcional, revisable y autorizada.
14. El programa buscará información pública de canciones, artistas y sellos.
15. Habrá dos funciones de sets: detectar canciones propias en sesiones publicadas y buscar sets externos para estudiar sus tracklists y transiciones.
16. Se priorizará música electrónica underground (minimal techno, techno, dark techno, deep house y house), con interés especial en escenas europeas y alemanas. Los sets de otros estilos podrán servir como material de estudio técnico.
17. El programa no descargará música, no comprará canciones y no accederá a cuentas de Beatport u otras tiendas.
18. Se usarán fuentes públicas y accesos permitidos; no se hará nada ilegal ni se evadirán restricciones.
19. El audio original se mantiene intacto durante el análisis.
20. El usuario prevé probar builds mediante el programa Developer de Apple de siete días. Publicar o pagar distribución será una decisión futura, no un requisito actual.

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

1. Auditar opciones técnicas para una aplicación nativa o adecuada para iPad, con acceso a archivos locales y procesamiento eficiente.
2. Comparar bibliotecas de análisis (Essentia, librosa, aubio, FFmpeg y alternativas) según precisión, licencias, rendimiento, requisitos y compatibilidad con iPad.
3. Definir arquitectura de aplicación, base de datos, cola por lotes y caché de análisis.
4. Diseñar primero la arquitectura de navegación y el sistema visual de iPad: jerarquía, navegación principal, vistas de análisis, controles táctiles y continuidad del contexto.
5. Crear prototipo visual navegable con datos de ejemplo antes de completar todos los algoritmos.
6. Definir modelo de datos y esquema de resultados con procedencia y confianza.
7. Implementar ingestión MP3 y análisis básico verificable.
8. Añadir análisis armónico, ritmo y estructura.
9. Construir visualizaciones Energy Map, Waveform, Spectrogram y Frequency Analysis.
10. Añadir etiquetas ID3 con revisión y confirmación.
11. Añadir compatibilidad entre canciones.
12. Investigar integraciones públicas y permitidas para metadatos y DJ sets.
13. Implementar detección de canciones en sets y estudio de transiciones.
14. Añadir pruebas, documentación y distribución de prueba en iPad.

### Reglas de trabajo

- Mantener esta bitácora actualizada con decisiones, cambios y evidencia.
- Distinguir siempre entre aprobado, propuesto, implementado y probado.
- No registrar funciones como completadas sin pruebas.
- No añadir gastos ni servicios pagos sin autorización explícita.
- No ampliar el producto hacia mastering o funciones DJ.
- Preservar archivos originales; respaldar y confirmar cualquier escritura ID3.
- Evaluar la interfaz visual y la navegación como requisitos funcionales desde el primer prototipo.
- Ante incertidumbre técnica, documentarla y evaluar opciones antes de adoptar dependencias.

### Estado al cierre de esta entrada

**Fase:** definición y documentación inicial.  
**Implementación:** todavía no iniciada.  
**Pruebas:** ninguna.  
**Siguiente hito:** auditoría técnica para iPad y prototipo de interfaz/navegación.
