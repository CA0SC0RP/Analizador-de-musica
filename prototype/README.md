# Prototipo SwiftUI para iPad

Esta carpeta contiene el primer shell visual de la aplicación.

## Archivo principal

- `ContentView.swift`: Biblioteca, navegación lateral, ficha de pista, waveform de demostración, tabla de biblioteca, inspector y comparación visual de dos pistas.

## Cómo probarlo en Swift Playgrounds

1. En Swift Playgrounds del iPad, crea un proyecto nuevo de tipo **App**.
2. Abre el archivo `ContentView.swift` del proyecto.
3. Sustituye su contenido por el de este repositorio: [prototype/ContentView.swift](ContentView.swift).
4. Ejecuta la app y revisa la navegación Biblioteca/Transición en horizontal y vertical.

El archivo usa únicamente SwiftUI. No requiere API, cuenta externa, paquete ni servicio de pago.

## Estado y límites

- Es un prototipo visual con nombres, BPM, tonalidades, energía y waveforms simulados.
- No importa MP3, no reproduce audio, no ejecuta Apple Music Understanding y no calcula compatibilidad real.
- Los botones de selección y navegación sí cambian la vista de demostración.
- No incluye decks, mixer, crossfader ni procesamiento.
- Todavía no se ha compilado ni ejecutado en el iPad A16. La prueba en Swift Playgrounds es el siguiente criterio de aceptación.

Para la definición de pantallas y criterios, consulta [docs/PROTOTIPO_VISUAL_IPAD.md](../docs/PROTOTIPO_VISUAL_IPAD.md).
