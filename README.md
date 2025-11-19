# Debian Scripts

目标是简化命令行输入，集成日常维护功能为菜单选项


## 安装

### 自动安装

执行：
```
bash <(curl -fsSL https://raw.githubusercontent.com/yduke/debian-scripts/main/install.sh)

```


### 手动动安装

创建文件


````
sudo nano /usr/local/bin/update
````

并将

````
https://raw.githubusercontent.com/yduke/debian-scripts/refs/heads/main/update
````

脚本内容复制粘贴到文件内

赋予执行权限

````
sudo chmod +x /usr/local/bin/update
````


## 运行


````
update
````


## 兼容性

- Ubuntu 24/25
- Debian 10/11/12/13
