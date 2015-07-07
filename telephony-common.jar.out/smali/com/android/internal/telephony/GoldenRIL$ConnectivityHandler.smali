.class Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;
.super Landroid/os/Handler;
.source "GoldenRIL.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/GoldenRIL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectivityHandler"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler$ConnectivityBroadcastReceiver;
    }
.end annotation


# static fields
.field private static final MESSAGE_SET_PREFERRED_NETWORK_TYPE:I = 0x1e


# instance fields
.field private mConnectivityReceiver:Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler$ConnectivityBroadcastReceiver;

.field private mContext:Landroid/content/Context;

.field private mDesiredNetworkType:I

.field private mNetworktypeResponse:Landroid/os/Message;

.field final synthetic this$0:Lcom/android/internal/telephony/GoldenRIL;


# direct methods
.method public constructor <init>(Lcom/android/internal/telephony/GoldenRIL;Landroid/content/Context;Landroid/os/Looper;)V
    .locals 2
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "looper"    # Landroid/os/Looper;

    .prologue
    .line 255
    iput-object p1, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->this$0:Lcom/android/internal/telephony/GoldenRIL;

    .line 256
    invoke-direct {p0, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 252
    new-instance v0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler$ConnectivityBroadcastReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler$ConnectivityBroadcastReceiver;-><init>(Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;Lcom/android/internal/telephony/GoldenRIL$1;)V

    iput-object v0, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mConnectivityReceiver:Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler$ConnectivityBroadcastReceiver;

    .line 257
    iput-object p2, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mContext:Landroid/content/Context;

    .line 258
    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;

    .prologue
    .line 245
    invoke-direct {p0}, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->stopListening()V

    return-void
.end method

.method static synthetic access$200(Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;)I
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;

    .prologue
    .line 245
    iget v0, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mDesiredNetworkType:I

    return v0
.end method

.method static synthetic access$202(Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;I)I
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;
    .param p1, "x1"    # I

    .prologue
    .line 245
    iput p1, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mDesiredNetworkType:I

    return p1
.end method

.method private startListening()V
    .locals 3

    .prologue
    .line 261
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 262
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 263
    iget-object v1, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mConnectivityReceiver:Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler$ConnectivityBroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 264
    return-void
.end method

.method private declared-synchronized stopListening()V
    .locals 2

    .prologue
    .line 267
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mConnectivityReceiver:Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler$ConnectivityBroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 268
    monitor-exit p0

    return-void

    .line 267
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x0

    .line 283
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 295
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "unexpected event not handled"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 286
    :pswitch_0
    iget-object v1, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/telephony/TelephonyManager;->from(Landroid/content/Context;)Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 287
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    const-string v1, "RILJ"

    const-string v2, "preferred NetworkType set upping Mobile Dataconnection"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/telephony/TelephonyManager;->setDataEnabled(Z)V

    .line 290
    iget-object v1, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mNetworktypeResponse:Landroid/os/Message;

    invoke-static {v1, v3, v3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 291
    iget-object v1, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mNetworktypeResponse:Landroid/os/Message;

    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    .line 292
    iput-object v3, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mNetworktypeResponse:Landroid/os/Message;

    .line 297
    return-void

    .line 283
    :pswitch_data_0
    .packed-switch 0x1e
        :pswitch_0
    .end packed-switch
.end method

.method public setPreferedNetworkType(ILandroid/os/Message;)V
    .locals 3
    .param p1, "networkType"    # I
    .param p2, "response"    # Landroid/os/Message;

    .prologue
    .line 272
    const-string v1, "RILJ"

    const-string v2, "Mobile Dataconnection is online setting it down"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    iput p1, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mDesiredNetworkType:I

    .line 274
    iput-object p2, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mNetworktypeResponse:Landroid/os/Message;

    .line 275
    iget-object v1, p0, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/telephony/TelephonyManager;->from(Landroid/content/Context;)Landroid/telephony/TelephonyManager;

    move-result-object v0

    .line 277
    .local v0, "tm":Landroid/telephony/TelephonyManager;
    invoke-direct {p0}, Lcom/android/internal/telephony/GoldenRIL$ConnectivityHandler;->startListening()V

    .line 278
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/telephony/TelephonyManager;->setDataEnabled(Z)V

    .line 279
    return-void
.end method
