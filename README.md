<h1> Installation </h1>

Make an empty folder

```
mkdir shellScripts
cd shellScripts
```

Clone the repository -

```
git clone https://github.com/AryamanMishra/Basic_Automation_Scripts_Shell.git
```

Get the path -

```
pwd
```

Edit bashrc file -

```
gedit ~/.bashrc
```

Add the following line in the end

```
export PATH=$PATH:"the path you copied above"
```

Save the file and run

```
source ~/.bashrc
```

(Note : If the above procedure doesnt work try doing the same with .zshrc file)

Now you can run all the scripts listed inside shellScripts folder from anywhere in your file system. 
<br>
For example to transfer files through scp command you can run
```
$ doscp.sh
```
