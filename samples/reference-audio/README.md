# Audio de referencia (uso local, no versionado)

Esta carpeta es el destino local para los MP3 que se utilizarán en las pruebas del analizador.

## Archivos sugeridos

- `reference_01_techno.mp3`: pista completa de techno/minimal techno, idealmente 320 kbps y 6–8 minutos.
- `reference_02_contrast.mp3`: pista de otro estilo o estructura.
- `reference_03_optional.mp3`: tercera pista opcional para ampliar la comparación.

Puedes usar nombres distintos; no hace falta renombrar tus archivos originales.

## Importante: el repositorio es público

**No subas los MP3 mediante GitHub ni los agregues a un commit.** Aunque esta carpeta exista en el repositorio, el audio debe permanecer fuera del control de versiones porque podría tener derechos de autor y porque queremos mantenerlo privado.

La regla local de `.gitignore` de esta carpeta excluye archivos de audio habituales. Para las pruebas, coloca los archivos en esta ruta dentro del entorno privado de trabajo/Codespace:

`samples/reference-audio/`

Después se ejecutarán los scripts de prueba desde allí. Los resultados públicos deben contener únicamente métricas técnicas no sensibles y nunca el audio.

Consulta `docs/PRUEBAS_MP3.md` para los criterios de validación.
