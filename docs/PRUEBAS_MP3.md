# Plan de pruebas con MP3 reales

## Archivos de referencia que aportará el usuario

Solicitar los archivos cuando comience la integración y validación del motor de audio; no es necesario subirlos durante la fase documental.

1. **Referencia A — electrónica:** pista completa de techno o minimal techno, preferentemente MP3 320 kbps, de aproximadamente 6–8 minutos.
2. **Referencia B — contraste:** MP3 de otro estilo o con una estructura/sonoridad claramente distinta.

No es necesario que los archivos sean comerciales ni que se publiquen. Se conservarán únicamente en el entorno privado de pruebas disponible y nunca se añadirán al repositorio público.

## Matriz inicial de validación

- Apertura y decodificación del archivo completo.
- Duración, tamaño, bitrate, sample rate, canales y metadatos ID3.
- Manejo de tags ausentes, caracteres especiales y metadatos incompletos.
- Waveform de la pista completa y correspondencia con duración.
- Reproducción, pausa, búsqueda temporal y volumen.
- Energy Map a lo largo de la canción y estabilidad del cálculo.
- Frequency Analysis: distribución espectral y bandas.
- Tonalidad, modo, Camelot, alternativas y confianza.
- Comportamiento ante pistas ambiguas, cambios armónicos o fallos: nunca inventar una tonalidad por defecto.
- Tiempo de análisis, memoria, CPU, temperatura y batería en iPad.
- Repetición del análisis: verificar caché y detección de cambios.
- Exportación: comparar hash del MP3 original y de la copia; comprobar que no hubo recodificación.

## Registro por archivo

Para cada prueba registrar nombre local o identificador no público, duración, propiedades técnicas, dispositivo/iPadOS, versión de app, tiempo de análisis, resultados, incidencias y hashes cuando proceda. No publicar audio protegido, nombres privados ni datos personales en logs públicos.

## Límites

Dos archivos permiten una primera prueba funcional, no demuestran precisión general. Antes de declarar el motor validado se necesitará un conjunto más amplio con distintos tempos, tonalidades, estructuras, calidades y casos ambiguos.
