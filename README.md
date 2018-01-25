# Shell
自己写的Shell工具

## reNamer
> 为一个文件夹的所有文件批量命名

### 使用方法:
```shell
reNamer [-f folder] [-e extention] [-p pattern] [-a]
```

### 选项参数：
> -f：文件夹名
> 
> -e：过滤的文件拓展名
> 
> -p：命名的格式
> 
> -a：是否包含文件夹
> 

### 例子：
> 为photo文件夹下的所有png文件命名，命令格式为photo-...(...代表自增的数字)

```shell
reNamer -f photo -e png -p photo-...
```