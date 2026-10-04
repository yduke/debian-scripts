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

> 菜单里的 `7) 更新脚本` 会先比较本地与远端版本号，**版本一致时不会重复下载覆盖**，只会提示“已是最新版本，无需更新。”；只有本地版本落后时才会拉取。
> 检测远端版本时只会请求脚本的前 1KB（HTTP Range），不会整文件下载。

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


## 版本号

版本号是**唯一定义源**，写在 `update` 脚本顶部：

```bash
VERSION="1.0.0"
```

发布新版本时只需修改这一处，注意保持它在文件的**前 1KB 内**（自更新就是靠读取这一段来获取远端版本号）。

版本比较规则：

| 情况 | 行为 |
|---|---|
| 远端版本 = 本地版本 | 提示“已是最新版本，无需更新”，不下载任何文件；输入 `f` 可强制重新下载 |
| 远端版本 > 本地版本 | 执行更新，并显示 `v旧版本 -> v新版本` |
| 远端版本 < 本地版本 | 视为已是最新，不降级 |
| 网络异常取不到版本号 | 提示失败并询问是否强制更新，直接回车默认不更新 |
| 本地脚本没有 `VERSION`（旧版脚本） | 直接更新一次，之后即可正常比较 |

## 兼容性

- Ubuntu 24/25
- Debian 10/11/12/13
