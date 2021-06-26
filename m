Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD103B59AA
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 09:20:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01F6FC597AA;
	Mon, 28 Jun 2021 07:20:36 +0000 (UTC)
Received: from qq.com (smtpbg551.qq.com [183.3.226.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 69B9EC57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 26 Jun 2021 09:09:17 +0000 (UTC)
X-QQ-mid: bizesmtp41t1624698528tk3ihx4e
Received: from localhost.localdomain (unknown [182.148.13.245])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sat, 26 Jun 2021 17:08:43 +0800 (CST)
X-QQ-SSF: 0100000000200060B000C00A0000000
X-QQ-FEAT: 2sGzaMTScJcsLEe4gThQR8mhKDGPO56wBJiZSMg6pSwT/kSoOJE+sW8boQ3gM
 cp1Uw3JjAuu6rHK6WEePM8CFRx1Lb9VIiYAnJ7Ne4K3pniHjghcxm5zXNdq4p8zrcqXghuq
 FJEQHr1nSmiy83Teyzq1isBxfFxLziVI0BMivvBQUXHvD8SuhYANNlDNtv/NSw7Xeqop9gB
 J91EYVd2hm49cTY8uM3Ti1J09HedDZtg4sKoXPXGQIQO5zs1IiqnSSaPjowxioC/x1gpkEC
 jnvQIJoDoeoBNWl4R6pRaPttx9WMIf5YF32YbPirkdFxrl7dwl0eVjIzs+QszF/HxLQlOoq
 ONCNszyV6to2HV8bRtk9YrEqUeORg==
X-QQ-GoodBg: 0
From: Jinchao Wang <wjc@cdjrlc.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, f.fainelli@gmail.com,
 rjui@broadcom.com, sbranden@broadcom.com, baruch@tkos.co.il,
 vilhelm.gray@gmail.com
Date: Sat, 26 Jun 2021 17:08:35 +0800
Message-Id: <20210626090835.51754-1-wjc@cdjrlc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgweb:qybgweb11
X-Mailman-Approved-At: Mon, 28 Jun 2021 07:20:31 +0000
Cc: Jinchao Wang <wjc@cdjrlc.com>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] watchdog: Prefer unsigned int to bare use of
	unsigned
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Fix checkpatch warnings:
    WARNING: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Jinchao Wang <wjc@cdjrlc.com>
---
 drivers/watchdog/ar7_wdt.c          | 2 +-
 drivers/watchdog/ath79_wdt.c        | 4 ++--
 drivers/watchdog/bcm_kona_wdt.c     | 6 +++---
 drivers/watchdog/digicolor_wdt.c    | 2 +-
 drivers/watchdog/ebc-c384_wdt.c     | 6 +++---
 drivers/watchdog/imx2_wdt.c         | 2 +-
 drivers/watchdog/it8712f_wdt.c      | 2 +-
 drivers/watchdog/mt7621_wdt.c       | 4 ++--
 drivers/watchdog/omap_wdt.c         | 2 +-
 drivers/watchdog/pika_wdt.c         | 2 +-
 drivers/watchdog/rt2880_wdt.c       | 4 ++--
 drivers/watchdog/sbc7240_wdt.c      | 2 +-
 drivers/watchdog/shwdt.c            | 2 +-
 drivers/watchdog/stmp3xxx_rtc_wdt.c | 4 ++--
 drivers/watchdog/w83977f_wdt.c      | 2 +-
 drivers/watchdog/watchdog_dev.c     | 2 +-
 16 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/watchdog/ar7_wdt.c b/drivers/watchdog/ar7_wdt.c
index ff37dc91057d..822719fdd944 100644
--- a/drivers/watchdog/ar7_wdt.c
+++ b/drivers/watchdog/ar7_wdt.c
@@ -57,7 +57,7 @@ struct ar7_wdt {
 };
 
 static unsigned long wdt_is_open;
-static unsigned expect_close;
+static unsigned int expect_close;
 static DEFINE_SPINLOCK(wdt_lock);
 
 /* XXX currently fixed, allows max margin ~68.72 secs */
diff --git a/drivers/watchdog/ath79_wdt.c b/drivers/watchdog/ath79_wdt.c
index 0f18f06a21b6..567e25df804b 100644
--- a/drivers/watchdog/ath79_wdt.c
+++ b/drivers/watchdog/ath79_wdt.c
@@ -68,12 +68,12 @@ static int boot_status;
 static int max_timeout;
 static void __iomem *wdt_base;
 
-static inline void ath79_wdt_wr(unsigned reg, u32 val)
+static inline void ath79_wdt_wr(unsigned int reg, u32 val)
 {
 	iowrite32(val, wdt_base + reg);
 }
 
-static inline u32 ath79_wdt_rr(unsigned reg)
+static inline u32 ath79_wdt_rr(unsigned int reg)
 {
 	return ioread32(wdt_base + reg);
 }
diff --git a/drivers/watchdog/bcm_kona_wdt.c b/drivers/watchdog/bcm_kona_wdt.c
index 8237c4e9c2a0..200965cdc670 100644
--- a/drivers/watchdog/bcm_kona_wdt.c
+++ b/drivers/watchdog/bcm_kona_wdt.c
@@ -58,7 +58,7 @@ struct bcm_kona_wdt {
 static int secure_register_read(struct bcm_kona_wdt *wdt, uint32_t offset)
 {
 	uint32_t val;
-	unsigned count = 0;
+	unsigned int count = 0;
 
 	/*
 	 * If the WD_LOAD_FLAG is set, the watchdog counter field is being
@@ -165,7 +165,7 @@ static void bcm_kona_wdt_debug_exit(struct platform_device *pdev) {}
 #endif /* CONFIG_BCM_KONA_WDT_DEBUG */
 
 static int bcm_kona_wdt_ctrl_reg_modify(struct bcm_kona_wdt *wdt,
-					unsigned mask, unsigned newval)
+		unsigned int  mask, unsigned int newval)
 {
 	int val;
 	unsigned long flags;
@@ -197,7 +197,7 @@ static int bcm_kona_wdt_set_resolution_reg(struct bcm_kona_wdt *wdt)
 }
 
 static int bcm_kona_wdt_set_timeout_reg(struct watchdog_device *wdog,
-					unsigned watchdog_flags)
+					unsigned int watchdog_flags)
 {
 	struct bcm_kona_wdt *wdt = watchdog_get_drvdata(wdog);
 
diff --git a/drivers/watchdog/digicolor_wdt.c b/drivers/watchdog/digicolor_wdt.c
index 073d37867f47..95a0053a5f30 100644
--- a/drivers/watchdog/digicolor_wdt.c
+++ b/drivers/watchdog/digicolor_wdt.c
@@ -27,7 +27,7 @@ struct dc_wdt {
 	spinlock_t		lock;
 };
 
-static unsigned timeout;
+static unsigned int timeout;
 module_param(timeout, uint, 0);
 MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds");
 
diff --git a/drivers/watchdog/ebc-c384_wdt.c b/drivers/watchdog/ebc-c384_wdt.c
index 8ef4b0df3855..7b408421bb38 100644
--- a/drivers/watchdog/ebc-c384_wdt.c
+++ b/drivers/watchdog/ebc-c384_wdt.c
@@ -32,14 +32,14 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 	__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static unsigned timeout;
+static unsigned int timeout;
 module_param(timeout, uint, 0);
 MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
 	__MODULE_STRING(WATCHDOG_TIMEOUT) ")");
 
 static int ebc_c384_wdt_start(struct watchdog_device *wdev)
 {
-	unsigned t = wdev->timeout;
+	unsigned int t = wdev->timeout;
 
 	/* resolution is in minutes for timeouts greater than 255 seconds */
 	if (t > 255)
@@ -57,7 +57,7 @@ static int ebc_c384_wdt_stop(struct watchdog_device *wdev)
 	return 0;
 }
 
-static int ebc_c384_wdt_set_timeout(struct watchdog_device *wdev, unsigned t)
+static int ebc_c384_wdt_set_timeout(struct watchdog_device *wdev, unsigned int t)
 {
 	/* resolution is in minutes for timeouts greater than 255 seconds */
 	if (t > 255) {
diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index cc86018c5eb5..3b42e194e3a8 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -73,7 +73,7 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static unsigned timeout;
+static unsigned int timeout;
 module_param(timeout, uint, 0);
 MODULE_PARM_DESC(timeout, "Watchdog timeout in seconds (default="
 				__MODULE_STRING(IMX2_WDT_DEFAULT_TIME) ")");
diff --git a/drivers/watchdog/it8712f_wdt.c b/drivers/watchdog/it8712f_wdt.c
index 3ce6a58bd81e..2c18701ff883 100644
--- a/drivers/watchdog/it8712f_wdt.c
+++ b/drivers/watchdog/it8712f_wdt.c
@@ -47,7 +47,7 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Disable watchdog shutdown on close");
 
 static unsigned long wdt_open;
-static unsigned expect_close;
+static unsigned int expect_close;
 static unsigned char revision;
 
 /* Dog Food address - We use the game port address */
diff --git a/drivers/watchdog/mt7621_wdt.c b/drivers/watchdog/mt7621_wdt.c
index a8aa3522cfda..0c7e0b478d85 100644
--- a/drivers/watchdog/mt7621_wdt.c
+++ b/drivers/watchdog/mt7621_wdt.c
@@ -40,12 +40,12 @@ MODULE_PARM_DESC(nowayout,
 		 "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static inline void rt_wdt_w32(unsigned reg, u32 val)
+static inline void rt_wdt_w32(unsigned int reg, u32 val)
 {
 	iowrite32(val, mt7621_wdt_base + reg);
 }
 
-static inline u32 rt_wdt_r32(unsigned reg)
+static inline u32 rt_wdt_r32(unsigned int reg)
 {
 	return ioread32(mt7621_wdt_base + reg);
 }
diff --git a/drivers/watchdog/omap_wdt.c b/drivers/watchdog/omap_wdt.c
index 1616f93dfad7..062ff05436ba 100644
--- a/drivers/watchdog/omap_wdt.c
+++ b/drivers/watchdog/omap_wdt.c
@@ -48,7 +48,7 @@ module_param(nowayout, bool, 0);
 MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started "
 	"(default=" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static unsigned timer_margin;
+static unsigned int timer_margin;
 module_param(timer_margin, uint, 0);
 MODULE_PARM_DESC(timer_margin, "initial watchdog timeout (in seconds)");
 
diff --git a/drivers/watchdog/pika_wdt.c b/drivers/watchdog/pika_wdt.c
index a98abd0d3146..8ce915bf4a6e 100644
--- a/drivers/watchdog/pika_wdt.c
+++ b/drivers/watchdog/pika_wdt.c
@@ -77,7 +77,7 @@ static inline void pikawdt_reset(void)
 	 *           seconds. Valid ranges are 1 to 15 seconds. The value can
 	 *           be modified dynamically.
 	 */
-	unsigned reset = in_be32(pikawdt_private.fpga + 0x14);
+	unsigned int reset = in_be32(pikawdt_private.fpga + 0x14);
 	/* enable with max timeout - 15 seconds */
 	reset |= (1 << 7) + (WDT_HW_TIMEOUT << 8);
 	out_be32(pikawdt_private.fpga + 0x14, reset);
diff --git a/drivers/watchdog/rt2880_wdt.c b/drivers/watchdog/rt2880_wdt.c
index 49aff800824d..9ae678d1a47c 100644
--- a/drivers/watchdog/rt2880_wdt.c
+++ b/drivers/watchdog/rt2880_wdt.c
@@ -51,12 +51,12 @@ MODULE_PARM_DESC(nowayout,
 		"Watchdog cannot be stopped once started (default="
 		__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
-static inline void rt_wdt_w32(unsigned reg, u32 val)
+static inline void rt_wdt_w32(unsigned int reg, u32 val)
 {
 	iowrite32(val, rt288x_wdt_base + reg);
 }
 
-static inline u32 rt_wdt_r32(unsigned reg)
+static inline u32 rt_wdt_r32(unsigned int reg)
 {
 	return ioread32(rt288x_wdt_base + reg);
 }
diff --git a/drivers/watchdog/sbc7240_wdt.c b/drivers/watchdog/sbc7240_wdt.c
index d640b26e18a6..53b5fcfd5f9e 100644
--- a/drivers/watchdog/sbc7240_wdt.c
+++ b/drivers/watchdog/sbc7240_wdt.c
@@ -75,7 +75,7 @@ static int wdt_set_timeout(int t)
 		return -1;
 	}
 	/* set the timeout */
-	outb_p((unsigned)t, SBC7240_SET_TIMEOUT_PORT);
+	outb_p((unsigned int)t, SBC7240_SET_TIMEOUT_PORT);
 	timeout = t;
 	pr_info("timeout set to %d seconds\n", t);
 	return 0;
diff --git a/drivers/watchdog/shwdt.c b/drivers/watchdog/shwdt.c
index f55533e0e045..2bc250676c9d 100644
--- a/drivers/watchdog/shwdt.c
+++ b/drivers/watchdog/shwdt.c
@@ -155,7 +155,7 @@ static int sh_wdt_keepalive(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
-static int sh_wdt_set_heartbeat(struct watchdog_device *wdt_dev, unsigned t)
+static int sh_wdt_set_heartbeat(struct watchdog_device *wdt_dev, unsigned int t)
 {
 	struct sh_wdt *wdt = watchdog_get_drvdata(wdt_dev);
 	unsigned long flags;
diff --git a/drivers/watchdog/stmp3xxx_rtc_wdt.c b/drivers/watchdog/stmp3xxx_rtc_wdt.c
index 7caf3aa71c6a..9b931953d9a8 100644
--- a/drivers/watchdog/stmp3xxx_rtc_wdt.c
+++ b/drivers/watchdog/stmp3xxx_rtc_wdt.c
@@ -42,7 +42,7 @@ static int wdt_stop(struct watchdog_device *wdd)
 	return 0;
 }
 
-static int wdt_set_timeout(struct watchdog_device *wdd, unsigned new_timeout)
+static int wdt_set_timeout(struct watchdog_device *wdd, unsigned int new_timeout)
 {
 	wdd->timeout = new_timeout;
 	return wdt_start(wdd);
@@ -94,7 +94,7 @@ static int stmp3xxx_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&stmp3xxx_wdd, dev);
 
-	stmp3xxx_wdd.timeout = clamp_t(unsigned, heartbeat, 1, STMP3XXX_MAX_TIMEOUT);
+	stmp3xxx_wdd.timeout = clamp_t(unsigned int, heartbeat, 1, STMP3XXX_MAX_TIMEOUT);
 	stmp3xxx_wdd.parent = dev;
 
 	ret = devm_watchdog_register_device(dev, &stmp3xxx_wdd);
diff --git a/drivers/watchdog/w83977f_wdt.c b/drivers/watchdog/w83977f_wdt.c
index fd64ae77780a..90cac7fcb09c 100644
--- a/drivers/watchdog/w83977f_wdt.c
+++ b/drivers/watchdog/w83977f_wdt.c
@@ -102,7 +102,7 @@ static int wdt_start(void)
 	outb_p(DEVICE_REGISTER, IO_INDEX_PORT);
 	outb_p(0x07, IO_DATA_PORT);
 	if (!testmode) {
-		unsigned pin_map;
+		unsigned int pin_map;
 
 		outb_p(0xE6, IO_INDEX_PORT);
 		outb_p(0x0A, IO_DATA_PORT);
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
index 3bab32485273..beae3f4078f4 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -57,7 +57,7 @@ static struct kthread_worker *watchdog_kworker;
 static bool handle_boot_enabled =
 	IS_ENABLED(CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED);
 
-static unsigned open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
+static unsigned int open_timeout = CONFIG_WATCHDOG_OPEN_TIMEOUT;
 
 static bool watchdog_past_open_deadline(struct watchdog_core_data *data)
 {
-- 
2.31.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
