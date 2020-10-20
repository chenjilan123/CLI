
# Sonar安装教程

By [Jeale Chen](https://github.com/chenjilan123)

在软件工程中，对代码的质量需要有严格的要求。良好的编程习惯和代码结构对代码的可读性，可扩展性，执行效率等都有良性提升。

代码扫描软件通过对软件项目进行扫描，分析安全性漏洞，代码重复率等，提供重构建议，生成报告。帮助软件开发人员编写简洁、优质、安全的代码。

## Sonare简介

Sonar是一款[开源](https://github.com/SonarSource/sonarqube)、跨平台的静态代码扫描软件。

软件开发人员可以通过[Sonar官方下载链接](https://www.sonarqube.org/downloads/)下载最新的Sonar社区版本或开发者版本。

本文参考了[Sonar官方文档](https://docs.sonarqube.org/latest/setup/overview/)和开源社区中对Sonar介绍，以一个习惯使用Windows系统和SQL Server数据库的.NET开发人员的角度，对Sonar组件的安装和使用进行了说明。非.NET开发人员无需担心，因为介绍中并未包含专业的.NET知识。

* [运行环境要求](#运行环境要求)
* [Windows系统下Sonar服务器的安装](#Windows系统下Sonar服务器的安装)
* [SQL Server数据库的配置](#SQL-Server数据库的配置)
* [分析 .NET Framework项目](#分析-\.NET-Framework项目)
* [分析 .NET Core项目](#分析-\.NET-Core项目)
* [安装汉化插件](#安装汉化插件)

## 运行环境要求

安装或启动Sonar软件前，需安装必要的运行环境：

* [Java Development Kit(JDK)](#Java-Development-Kit\(JDK\))
* [SQL Server服务器](#SQL-Server服务器)

### Java Development Kit(JDK)

Sonar是基于Java开发的软件，启动时，需要有JDK环境支持。

* 从Oracle官方下载JDK并安装：[jdk-14.0.1_windows-x64_bin.exe](https://www.oracle.com/java/technologies/javase-jdk14-downloads.html#license-lightbox)
* 将JDK安装路径下的bin文件夹目录添加到环境变量Path中。例如：右键此电脑 -> 属性 -> 高级系统设置 -> 环境变量 -> 选中用户变量Path -> 编辑 -> 新建C:\Program Files\Java\jdk-14.0.1\bin -> 确定

### SQL Server服务器

使用Sonar时，需配置数据库，数据库保存了Sonar服务器的用户配置，操作日志，扫描报告等，使用性能优越的数据库能提高Sonar的性能。

软件开发人员通常熟悉SQL Server的使用和安装，并且社区中有大量安装教程，因此此处不作说明。

## Windows系统下Sonar服务器的安装

Sonar支持在Linux、MacOS、Windows以及Docker环境中运行。

本文仅针对Windows系统进行说明。

* 下载[Sonar社区版本](https://www.sonarqube.org/success-download-community-edition/)，并安装。
* 在Sonar安装目录下，进入bin\windows-x86-64\目录，双击StartSonar.bat文件启动Sonar服务。以后每次启动Sonar时，都通过该操作来启动。
* 打开浏览器，进入网站[http://localhost:9000](http://localhost:9000)，查看Sonar页面。

若点击Projects进入项目页面，在下方出现提示：'Embedded database should be used for evaluation purposes only'，即内嵌数据库只能用于测试场景。这是因为还没有配置数据库，Sonar暂时使用功能不足内嵌数据库。下一节中，将配置SQL Server数据库。

> 注意：Sonar监听本地9000端口。启动Sonar前，请确保9000端口未被占用。

### 日志文件

若Sonar服务启动失败，可在Sonar安装目录下的log\目录，通过sonar.log或web.log等日志文件，查看错误信息。由于人为的疏忽或操作系统环境等原因，发生错误在所难免，不同的错误都有可行的解决方案。

## SQL Server数据库的配置

在新版的Sonar中，支持SQL Server、Oracle和PostgreSQL数据库。

> 注意：在7.9之前的版本，除了上述3种数据库，还支持MySQL数据库。在新版本中删除对MySQL的支持主要是性能方面的考量，在数据量增大的情况下，MySQL逐渐出现性能瓶颈，导致运行速度下降，当然还有MySQL自身特性和功能的缺失。

> 备注： 由于PostgreSQL是开源且免费的，官方团队建议使用PostgreSQL，他们将聚焦于对PostgreSQL进行完善，以保证用户能够在使用免费数据库的同时享受Sonar的服务。

下面，对SQL Server数据库的配置进行说明。

* 打开SQL Server配置管理器，在 SQL Server网络配置 -> MSSQLSERVER的协议 下，将TCP/IP协议项配置的为启动。
* 在SQL Server中，建立新的数据库。（数据库名称可自定义，下面以sonar为例）
* 执行下面的SELECT语句，查看sonar数据库并发锁配置。若配置为0，执行ALTER语句，将配置开启，该配置防止查询同一个数据库表格时，锁表导致查询速度下降：
    ``` SQL
    SELECT is_read_committed_snapshot_on FROM sys.databases WHERE name='sonar';
    ```
    ``` SQL
    ALTER DATABASE sonar SET READ_COMMITTED_SNAPSHOT ON WITH ROLLBACK IMMEDIATE;
    ```
* 执行下面的SELECT语句，查看sonar数据库字符串排序规则。若配置为Chinese_PRC_CI_AS，执行ALTER语句，将排序规则修改为区分大小写的，即将CI改为CS：
    ``` SQL
    SELECT DATABASEPROPERTYEX('sonar', 'Collation');
    ```
    ``` SQL
    ALTER DATABASE sonar 
    COLLATE Chinese_PRC_CS_AS;
    ```
* 打开Sonar安装目录下的 conf\sonar.properties 文件。
  * 若采用SQL Server 身份验证，则添加如下配置：
    ```
    sonar.jdbc.url=jdbc:sqlserver://localhost;databaseName=sonar;
    sonar.jdbc.username=SA
    sonar.jdbc.password=password
    sonar.sorceEncoding=UTF-8
    sonar.login=admin
    sonar.password=admin
    ```
  * 若采用Windows 身份验证，则需安装[Microsoft SQL JDBC Driver](https://www.microsoft.com/en-us/download/details.aspx?id=57782)，并将该JDBC Driver安装目录下的 sqljdbc_7.2\enu\auth\x64\sqljdbc_auth.dll 复制到Path环境变量包含的目录下，建议直接将该 sqljdbc_7.2\enu\auth\x64 目录的完整访问地址添加到环境Path中。完成后，添加如下配置：
    ```
    sonar.jdbc.url=jdbc:sqlserver://localhost;databaseName=sonar;integratedSecurity=true
    sonar.sorceEncoding=UTF-8
    sonar.login=admin
    sonar.password=admin
    ```
* 重启Sonar：打开 任务管理器 -> 详细信息，将所有java.exe进程结束掉，关闭Sonar。再次双击StartSonar.bat启动Sonar。
    > 注意：未启动其他java程序时，可结束全部java.exe进程，若有其他java程序正在运行，请确保结束掉对应的java.exe进程，防止错误操作导致系统中其他java服务出现异常。
* 再次打开[Sonar页面](http://localhost:9000)，进入Projects页面，可以看到下面的Embedded database should be used for evaluation purposes only提示消失了。

至此，Sonar已经安装并配置成功了。开发人员可以通过Sonar的扩展工具，对Java、C、C++、C#、Html等等语言组成的代码进行分析。

以下，从.NET开发人员的角度，对 .NET Framework项目和 .NET Core项目的代码扫描分别进行介绍。

## 分析 .NET Framework项目

Sonar通过MSBuild Scanner命令行工具进行扩展，可分析 .NET Framework项目。

* [下载MSBuild Scanner](https://www.microsoft.com/download/details.aspx?id=53344)，并安装。
* 将MSBuild Scanner安装目录下的bin文件夹添加到环境变量Path中。
* 打开命令行工具，cd到待分析的解决方案文件夹下。执行以下命令，以GrpcService项目为例：
    ``` cmd
    SonarScanner.MSBuild.exe begin /k:"GrpcService" 
    MSBuild /t:Rebuild
    SonarScanner.MSBuild.exe end 
    ```
* 扫描完成后，进入Sonar页面下的Projects(项目)标签页，查看GrpcService项目的扫描报告。

## 分析 .NET Core项目

Sonar通过dotnet scanner命令行工具进行扩展，可分析 .NET Core项目。
* 打开命令行工具，通过以下命令安装dotnet scanner工具：

    ``` cmd
    dotnet tool install --global dotnet-sonarscanner
    ```
* 打开命令行工具，cd到待分析的解决方案文件夹下。执行以下命令，以GrpcService项目为例：
    ``` cmd
    dotnet sonarscanner begin /k:"GrpcService" 
    dotnet build
    dotnet sonarscanner end 
    ```
* 扫描完成后，进入Sonar页面下的Projects(项目)标签页，查看GrpcService项目的扫描报告。

## 安装汉化插件

Sonar提供插件扩展支持，开发人员可通过安装或开发相应的插件来扩展所需的功能。

用户只需下载所需的插件，并将其放置在Sonar安装目录的extensions\plugins文件夹下，即可享受插件提供的服务。当然，不想使用已安装的插件时，也可将插件从该目录下删去。

下面，以简体中文汉化插件为例，说明扩展插件的安装和使用。

* [下载汉化插件](https://github.com/SonarQubeCommunity/sonar-l10n-zh/releases/download/sonar-l10n-zh-plugin-8.3/sonar-l10n-zh-plugin-8.3.jar)
* 将插件放到Sonar安装目录的 extensions\plugins 文件夹下。
* 重启Sonar服务。

> 注意：本节中使用8.3版本的汉化插件，对于不同的Sonar版本，建议到[Sonar简体中文开源项目](https://github.com/SonarQubeCommunity/sonar-l10n-zh/releases)中下载对应版本的插件。

## 引用

[Sonar官方地址](https://www.sonarqube.org/)

[Sonar官方文档](https://docs.sonarqube.org/latest/)

[Sonar简体中文项目](https://github.com/SonarQubeCommunity/sonar-l10n-zh)

[MySQL: SonarQube和Gitlab放弃支持的原因](https://blog.csdn.net/liumiaocn/article/details/102714605)

[没有为集成身份验证配置驱动程序](https://zhidao.baidu.com/question/498426015.html....)

[SQL Server数据库设置区分大小写导致Sonar启动失败](https://blog.csdn.net/CanyChen/article/details/3949788)