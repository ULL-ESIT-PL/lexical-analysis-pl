See in the ULL OCW course [PROCESADORES DE LENGUAJES](https://campusvirtual.ull.es/ocw/course/view.php?id=45#section-0) the sections

* Folder [analisis-sintactico-con-yacc` contains a version of the examples in section [Análisis Sintáctico con yacc](https://campusvirtual.ull.es/ocw/mod/resource/view.php?id=1835)
* [Expresiones Regulares en Flex](https://campusvirtual.ull.es/ocw/mod/resource/view.php?id=1823)


## Installing Flex in Codespaces

To install Flex in a GitHub Codespace, you can add the following commands to your `.devcontainer/Dockerfile`:

```Dockerfile
# Install Flex
RUN apt-get update && apt-get install -y flex
``` 