# Debian Scripts

目标是简化命令行输入，集成日常维护功能为菜单选项

一条命令  $\color{Orange}\Huge{\textbf{update}}$ 加数字序号维护服务器

## 安装

### 自动安装/更新

执行：
```
bash <(curl -fsSL https://raw.githubusercontent.com/yduke/debian-scripts/main/install.sh)
```

如果嫌太长的话，运行下面的也是一样
```
curl -fsL api.yins.top/u | bash
```

首次执行安装成功后，后续可以使用脚本内的“更新”功能更新脚本，不用每次都运行安装命令。

### 使用/运行：

````
update
````

--------

### 手动动安装

如果你希望手动安装脚本，可按如下步骤，这同时也是自动安装脚本install.sh的原理：



1 复制以下脚本的内容

````
https://raw.githubusercontent.com/yduke/debian-scripts/refs/heads/main/update
````

2 创建文件并粘贴内容


````
sudo nano /usr/local/bin/update
````
保存。

3 赋予执行权限

````
sudo chmod +x /usr/local/bin/update
````
4 完成

### 使用/运行：

````
update
````


## 兼容性

- Ubuntu 24/25
- Debian 10/11/12/13
