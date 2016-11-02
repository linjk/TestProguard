# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /Users/apple/Library/Android/sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}
#代码的压缩级别, 0~7之间，默认为5
-optimizationpasses 5
#包名不混合大小写，混淆后的类名为小写(主要针对windows用户的配置)
-dontusemixedcaseclassnames
#不去忽略非公共的库类
-dontskipnonpubliclibraryclasses
#不去忽略非公共的库的类的成员
-dontskipnonpubliclibraryclassmembers
#优化 不优化输入的类文件
-dontoptimize
#不做预校验（Android不需要此步骤，跳过可加快混淆速度）
-dontpreverify
#混淆后生成映射文件-->(包含有类名->混淆后类名的映射关系)
-verbose
#指定映射文件的名称
-printmapping proguardMapping.txt
#-applymapping proguardMapping.txt

#混淆时所采用的算法，谷歌推荐，一般不改变
-optimizations !code/simplification/arithmetic,!field/,!class/merging/
#保护代码中的Annotation不被混淆，在使用如fastJSON时的实体映射
-keepattributes *Annotation*
#避免混淆泛型，在使用如fastJSON时的实体映射
-keepattributes Signature
#抛出异常时保留代码行号
-keepattributes SourceFile,LineNumberTable
#忽略警告
-ignorewarning
#记录生成的日志数据,gradle build时在本项目根目录输出
#apk 包内所有 class 的内部结构
-dump class_files.txt
#未混淆的类和成员
-printseeds seeds.txt
#列出从 apk 中删除的代码
-printusage unused.txt

#保留所有的本地native方法不被混淆
-keepclasseswithmembernames class * {
    native <methods>;
}
#保持哪些类不被混淆
-keep public class * extends android.support.v7.app.AppCompatActivity
-keep public class * extends android.app.Fragment
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.app.backup.BackupAgentHelper
-keep public class * extends android.preference.Preference
-keep public class * extends android.view.View

-keep public class com.android.vending.licensing.ILicensingService
#如果有引用v4包可以添加下面这行
-keep public class * extends android.support.v4.app.Fragment
#保留在Activity中的方法参数是view的方法，从而在layout里编写的onClick不会被影响
-keepclassmembers class * extends android.app.Activity{
    public void *(android.view.View);
}
#枚举类不能被混淆
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}
#保留自定义控件(继承自view)不被混淆
-keep public class * extends android.view.View{
    ** get*();
    void set*(***);
    public <init>(android.content.Context);
    public <init>(android.content.Context, android.util,AttributeSet);
    public <init>(android.content.Context, android.util,AttributeSet, int);
}

#保留Parcelable序列化的类不被混淆
-keep class * implements android.os.Parcelable{
    public static final android.os.Parcelable$Creator *;
}

#保留Serialable序列化的类不被混淆
-keepclassmembers class * implements java.io.Serializable{
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistenFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

#对于R(资源)下的所有类机器方法不能被混淆
-keep class **.R$* {
    *;
}

#对于带有回调函数onXXEvent的方法不能被混淆
-keepclassmembers class * {
    void *(**On*Event);
}
