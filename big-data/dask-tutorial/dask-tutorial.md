# Dask Tutorial

https://github.com/dask/dask-tutorial

```bash
conda env create -f binder/environment.yml
conda activate dask-tutorial
jupyter labextension install @jupyter-widgets/jupyterlab-manager
jupyter labextension install @bokeh/jupyter_bokeh
```

Add currently active environment kernelspec jupyterhub/jupyterlab

```bash
(dask-tutorial) [user@localhost ~]$ python -m ipykernel install --user --name dask-tutorial
Installed kernelspec dask-tutorial in /home/user/.local/share/jupyter/kernels/dask-tutorial
(dask-tutorial) [user@localhost ~]$ jupyter kernelspec list
Available kernels:
  dask-tutorial    /home/user/.local/share/jupyter/kernels/dask-tutorial
  python3          /home/user/.conda/envs/dask-tutorial/share/jupyter/kernels/python3
```

http://${internal-ip}:8000/

error finding graphviz in path

```python
z.visualize()

---------------------------------------------------------------------------
FileNotFoundError                         Traceback (most recent call last)
~/.conda/envs/dask-tutorial/lib/python3.8/site-packages/graphviz/backend.py in run(cmd, input, capture_output, check, encoding, quiet, **kwargs)
    165     try:
--> 166         proc = subprocess.Popen(cmd, startupinfo=get_startupinfo(), **kwargs)
    167     except OSError as e:

~/.conda/envs/dask-tutorial/lib/python3.8/subprocess.py in __init__(self, args, bufsize, executable, stdin, stdout, stderr, preexec_fn, close_fds, shell, cwd, env, universal_newlines, startupinfo, creationflags, restore_signals, start_new_session, pass_fds, encoding, errors, text)
    853
--> 854             self._execute_child(args, executable, preexec_fn, close_fds,
    855                                 pass_fds, cwd, env,

~/.conda/envs/dask-tutorial/lib/python3.8/subprocess.py in _execute_child(self, args, executable, preexec_fn, close_fds, pass_fds, cwd, env, startupinfo, creationflags, shell, p2cread, p2cwrite, c2pread, c2pwrite, errread, errwrite, restore_signals, start_new_session)
   1701                         err_msg = os.strerror(errno_num)
-> 1702                     raise child_exception_type(errno_num, err_msg, err_filename)
   1703                 raise child_exception_type(err_msg)

FileNotFoundError: [Errno 2] No such file or directory: 'dot'

During handling of the above exception, another exception occurred:

ExecutableNotFound                        Traceback (most recent call last)
<ipython-input-11-be67cab1446e> in <module>
      1 # Look at the task graph for `z`
----> 2 z.visualize()

~/.conda/envs/dask-tutorial/lib/python3.8/site-packages/dask/base.py in visualize(self, filename, format, optimize_graph, **kwargs)
     90         https://docs.dask.org/en/latest/optimize.html
     91         """
---> 92         return visualize(
     93             self,
     94             filename=filename,

~/.conda/envs/dask-tutorial/lib/python3.8/site-packages/dask/base.py in visualize(*args, **kwargs)
    547         raise NotImplementedError("Unknown value color=%s" % color)
    548
--> 549     return dot_graph(dsk, filename=filename, **kwargs)
    550
    551

~/.conda/envs/dask-tutorial/lib/python3.8/site-packages/dask/dot.py in dot_graph(dsk, filename, format, **kwargs)
    269     """
    270     g = to_graphviz(dsk, **kwargs)
--> 271     return graphviz_to_file(g, filename, format)
    272
    273

~/.conda/envs/dask-tutorial/lib/python3.8/site-packages/dask/dot.py in graphviz_to_file(g, filename, format)
    281         format = "png"
    282
--> 283     data = g.pipe(format=format)
    284     if not data:
    285         raise RuntimeError(

~/.conda/envs/dask-tutorial/lib/python3.8/site-packages/graphviz/files.py in pipe(self, format, renderer, formatter, quiet)
    167         data = text_type(self.source).encode(self._encoding)
    168
--> 169         out = backend.pipe(self._engine, format, data,
    170                            renderer=renderer, formatter=formatter,
    171                            quiet=quiet)

~/.conda/envs/dask-tutorial/lib/python3.8/site-packages/graphviz/backend.py in pipe(engine, format, data, renderer, formatter, quiet)
    248     """
    249     cmd, _ = command(engine, format, None, renderer, formatter)
--> 250     out, _ = run(cmd, input=data, capture_output=True, check=True, quiet=quiet)
    251     return out
    252

~/.conda/envs/dask-tutorial/lib/python3.8/site-packages/graphviz/backend.py in run(cmd, input, capture_output, check, encoding, quiet, **kwargs)
    167     except OSError as e:
    168         if e.errno == errno.ENOENT:
--> 169             raise ExecutableNotFound(cmd)
    170         else:
    171             raise

ExecutableNotFound: failed to execute ['dot', '-Kdot', '-Tpng'], make sure the Graphviz executables are on your systems' PATH
```

solution:

```bash
sudo yum install graphviz
```
