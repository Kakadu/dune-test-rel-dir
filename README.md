#### Dune test are being executed in wrong dir


##### Setup

The inner project is `inner-vendored`,
the top project is `dune-project-root`, and it has a symlink to inner project to emulate vendoring.

We can `(cd inner-vendored && dune test)` and it works fine.
More precisely, the library `dir/lib1.cmxa` uses external preprocessor `dir/rewriter1.exe` to preprocess.

##### Issue

When we vendor inner project in the root one (right now, it is done via symlink) the tests are being executed in the context of root project. And it doesn't allow us to run tests in the inner project, because CWD changes. 
I can't workaround it with %{project_root} beacuse it is being expanded in to relative path.

##### Possible workarounds

We can prefix invocation of rewriter executable by the difference between %{workspace_root} and
vendored %{project_root}. It seem to work, but hacky.
