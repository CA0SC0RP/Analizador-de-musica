# iPadOS SwiftUI starter

Este directorio contiene el primer esqueleto de interfaz en SwiftUI. Todavía no incluye un proyecto Xcode (.xcodeproj), motor de audio, importador real ni reproducción. Para ejecutarlo:

1. En Xcode, crear una nueva app iOS llamada `AnalizadorMusica`, interfaz SwiftUI y lenguaje Swift.
2. Configurar Deployment Target según el iPad de prueba disponible.
3. Añadir los archivos de `AnalizadorMusica/` al target de la aplicación.
4. Confirmar que `AnalizadorMusicaApp.swift` es el punto de entrada y que no queda otro archivo `@main`.
5. Ejecutar en simulador y después en iPad real.

Los datos de biblioteca incluidos son demostrativos y están marcados como tales. No representan análisis de MP3. Los siguientes pasos son reemplazar el contenido de demostración por selección local de archivos, persistencia, AVFoundation y análisis, manteniendo la jerarquía visual.

## Estado

- [x] Tema y componentes visuales iniciales.
- [x] Navegación principal y primera composición de Biblioteca.
- [x] Modelo de pista de demostración.
- [ ] Proyecto Xcode y compilación.
- [ ] Importación MP3 real.
- [ ] Reproductor AVFoundation.
- [ ] Waveform calculado desde audio.
- [ ] Pruebas con MP3 reales.
