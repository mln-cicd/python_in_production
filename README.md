# python_in_production


Create the repo with secondary gh account
```bash

git clone git@github.com-mln-cicd:mln-cicd/python_in_production.git

```



## **ISORT**

Yes, it is possible to configure `isort` to separate imports from your custom codebase and regular Python library imports like `fastapi`. You can achieve this by using the `known_first_party` and `known_third_party` settings in your `.isort.cfg` file.

Here's an example of how you can configure `.isort.cfg` to achieve this:

```ini
[settings]
multi_line_output = 3
import_heading_stdlib = Standard Library Imports
import_heading_firstparty = My Project Imports
import_heading_thirdparty = Third Party Imports
known_first_party = your_project_name
known_third_party = fastapi

```

In this configuration:

- `multi_line_output = 3` sets the import lines to be vertically hanging, with import statements after the first grouped in the same line.
- `import_heading_stdlib`, `import_heading_firstparty`, and `import_heading_thirdparty` define the section headings for standard library imports, your project imports, and third-party imports, respectively.
- `known_first_party = your_project_name` tells `isort` to treat imports from the directory or package named `your_project_name` as first-party (your project) imports.
- `known_third_party = fastapi` tells `isort` to treat imports from the `fastapi` library as third-party imports.

With this configuration, `isort` will separate imports into three sections:




## **RADON**


```sh
pip install radon
radon cc 8/cyclomatic_complexity.py -s
```
