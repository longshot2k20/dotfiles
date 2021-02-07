# Python

## Installation pyenv and conda

Installed via \$DOTFILES/etc/boostrap-macos.sh
This snippet from bootstrap-macos.sh pertains directly to python

```console
brew install pyenv
brew install pyenv-virtualenv
brew cask install anaconda
```

in .zshrc these lines config pyenv and active pyenv-virtualenv

```console
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

this snippet corresponds with anaconda's conda

```console
# init conda, the following command write scripts into your shell init file automatically
/usr/local/anaconda3/condabin/conda init zsh
# disable init of env "base"
/usr/local/anaconda3/condabin/conda config --set auto_activate_base false
```

Do not install python via homebrew rely on pyenv and conda.

The current setup will use conda if it's activated environment(non-base) and pyenv otherwise, if the folder contains a .python-version file that will become activated in pyenv.

## Anaconda commands

Run Anaconda Navigator

```console
conda run anaconda-navigator
```

Run Jupyter Notebook

```console
conda run jupyter notebook
```

## Useful commands

List conda environment

```console
dotfiles master* ❯ conda env list
# conda environments:
#
base                  *  /usr/local/anaconda3
anaconda-postgres        /usr/local/anaconda3/envs/anaconda-postgres
```

Create conda environment

```console
conda create --name anaconda-postgres psycopg2
```

Active conda environment

```console
conda activate anaconda-postgres
```

Deactivate conda(return to base in our system then let pyenv take over)

```console
conda deactivate
```

List pyenv versions

```console
pyenv versions
```

Set global python

```console
pyenv global 3.8.3
pyenv versions
```

Which executable

```console
pyenv which python
pyenv which pip
```

## Create new conda environment add pip package

(assumes pyenv installed correctly and pip is associated with active conda env)
conda create --name flair-test
conda activate flair-test
pip install --upgrade pip
pip list
pip install flair
pip list

(make available to jupyter notebook)
pip install --user ipykernel
(ignore above warnings about path)
python -m ipykernel install --user --name=flair-test
(refresh jupyter browser should be available)

## Create a project with cookiercutter

Create python_tempate as new github repo in browser

````console
cd $dev/src/github.com/longshot2k20/
pyenv virtualenv 3.8.3 python-template
pyenv activate python-template
pip install cookiecutter
cookiecutter https://github.com/audreyr/cookiecutter-pypackage.git
cd python_template
pyenv local python-template
git init .
git add .
git commit -m "Initial check-in"
git push -u origin
pwd
git remote add origin git@github.com:longshot2k20/python_template.git
git push -u origin master
```console

in vscode cmd-shift-p 'python interpreter' -> python-template

```console
pip install -r requirements_dev.txt
make test
```

## Create a conda virtuanenv #1

conda create -n mypy37 python=3.7 psycopg2 numpy scipy

## Create a conda virtualenv #2

Create a folder for the new project

```console
mkdir anaconda-postgres
```

Create a conda virtualenv with postgres

```console
create --name anaconda-postgres psycopg2
```

Activate the virtualenv

```console
conda activate anaconda-postgres
```

To create a new project in pycharm that uses the above virtualenv, follow these steps:

- Launch PyCharm CE
- Enter the location name for e.g.
  \$USER/Developer/src/anaconda-postgres
- Select Existing interpreter radial button
- Navigate to the following executable
  /usr/local/anaconda3/envs/anaconda-postgres/bin/python

Open a python console

```console
import psycopg2
with psycopg2.connect(host="localhost", user="$USER", password="$PASSWORD", dbname="sqlda", port=5432) as conn:
    with conn.cursor() as cur:
        cur.execute("select * from customers limit 5")
        records = cur.fetchall()
print(records)
```

Once you leave the folder deactivate the virtualenv so it defaults to conda base and reverts to pyenv.

```console
conda deactivate
```

Within pycharm it does not appear necessary to activate/deactivate environments seems to just respect what has been configured for the project.

## Create a pyenv virtualenv

```console
pyenv virtualenv anaconda3-5.3.1 postgres-anaconda3-5.3.1
```

This will create

\$USER/.pyenv/versions/anaconda3-5.3.1/envs/postgres-anaconda3-5.3.1

Since eval "\$(pyenv virtualenv-init -)" is configured in your .zshrc, pyenv-virtualenv will automatically activate/deactivate virtualenvs on entering/leaving directories which contain a .python-version file that contains the name of a valid virtual environment as shown in the output of pyenv virtualenvs (e.g., venv34 or 3.4.3/envs/venv34 in example above) . .python-version files are used by pyenv to denote local Python versions and can be created and deleted with the pyenv local command.

To create a new project in pycharm that uses the above virtualenv, follow these steps:

- Launch PyCharm CE
- Enter the location name for e.g.
  \$USER/Developer/src/anaconda-postgres
- Select Existing interpreter radial button
- Navigate to the following executable
  ~/.pyenv/versions/postgres-anaconda-5.3.1/bin/python3

Open up a terminal in the project folder and set the local project to your virtualenv

```console
pyenv local anaconda3-5.3.1/envs/postgres-anaconda3-5.3.1
```

Output:

```console
anaconda-postgres ❯ pyenv versions
  system
* 3.8.3 (set by $USER/.pyenv/version)
  anaconda3-5.3.1
  anaconda3-5.3.1/envs/postgres-anaconda3-5.3.1
  postgres-anaconda3-5.3.1
anaconda-postgres ❯ pyenv local anaconda3-5.3.1/envs/postgres-anaconda3-5.3.1
(anaconda3-5.3.1/envs/postgres-anaconda3-5.3.1) anaconda-postgres ❯ conda
```

To create a project in PyCharm using a python virtual env.

Install postgres package

Run the following from within the project created above

```console
conda install psycopg2
```

Open a python console

```console
import psycopg2
with psycopg2.connect(host="localhost", user="$USER", password="$PASSWORD", dbname="sqlda", port=5432) as conn:
    with conn.cursor() as cur:
        cur.execute("select * from customers limit 5")
        records = cur.fetchall()
print(records)
```

Output

```console
PyDev console: starting.
Python 3.8.3 (default, Jul  2 2020, 11:26:31)
[Clang 10.0.0 ] on darwin
import psycopg2
... with psycopg2.connect(host="localhost", user="$USER", password="$PASSWORD", dbname="sqlda", port=5432) as conn:
...     with conn.cursor() as cur:
...         cur.execute("select * from customers limit 5")
...         records = cur.fetchall()
... print(records)
[(1, None, 'Arlena', 'Riveles', None, 'ariveles0@stumbleupon.com', 'F', '98.36.172.246', None, None, None, None, None, None, None, datetime.datetime(2017, 4, 23, 0, 0)), (2, 'Dr', 'Ode', 'Stovin', None, 'ostovin1@npr.org', 'M', '16.97.59.186', '314-534-4361', '2573 Fordem Parkway', 'Saint Louis', 'MO', '63116', 38.5814, -90.2625, datetime.datetime(2014, 10, 2, 0, 0)), (3, None, 'Braden', 'Jordan', None, 'bjordan2@geocities.com', 'M', '192.86.248.59', None, '5651 Kennedy Park', 'Pensacola', 'FL', '32590', 30.6143, -87.2758, datetime.datetime(2018, 10, 27, 0, 0)), (4, None, 'Jessika', 'Nussen', None, 'jnussen3@salon.com', 'F', '159.165.138.166', '615-824-2506', '224 Village Circle', 'Nashville', 'TN', '37215', 36.0986, -86.8219, datetime.datetime(2017, 9, 3, 0, 0)), (5, None, 'Lonnie', 'Rembaud', None, 'lrembaud4@discovery.com', 'F', '18.131.58.65', '786-499-3431', '38 Lindbergh Way', 'Miami', 'FL', '33124', 25.5584, -80.4582, datetime.datetime(2014, 3, 6, 0, 0))]
records[1]
(2, 'Dr', 'Ode', 'Stovin', None, 'ostovin1@npr.org', 'M', '16.97.59.186', '314-534-4361', '2573 Fordem Parkway', 'Saint Louis', 'MO', '63116', 38.5814, -90.2625, datetime.datetime(2014, 10, 2, 0, 0))
records[0]
(1, None, 'Arlena', 'Riveles', None, 'ariveles0@stumbleupon.com', 'F', '98.36.172.246', None, None, None, None, None, None, None, datetime.datetime(2017, 4, 23, 0, 0))
records[5]
```
````
