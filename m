Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMRoAFVmdmkmQQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 19:52:05 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A933781CE1
	for <lists+linux-stm32@lfdr.de>; Sun, 25 Jan 2026 19:52:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70970C87ED5;
	Sun, 25 Jan 2026 18:52:04 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B4B4C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 25 Jan 2026 18:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=sVBBtTtHZDiuRw9xiNC+g1Bn2nLrGFbkjjc5++bmQN4=; b=Od2hrv
 7e587jJGvYj/YhtcC5s95KgPAHyqoi/9vVEA88KLZR36sLSG5z1yIHc0w/KN9sJ3
 IPF4p+ZLeyRbHSD+HYg1zCPacE61g+lFEDLoKOcYR7FOgALSXhnJEYmQpFvTnLO5
 QhTvlNLdk5gW/zHsm9N9aYIu06RcnEvtpZMyzzYsB6OuqWoWN9gGlbeJz51jLczF
 KmecgO9KHlZCsXOJ4pisco1DD4fh4em8sPMGZvTrzYsQrg9NHxsMVa++O+RffPHz
 wixjnGYwapkMR6u1+clrsivB8XBzi480OzPek+YvZDzARWJMHrYFwIPG6Pd8VNdW
 mql9dG4Kn5ftRhnQ==
Received: (qmail 2369557 invoked from network); 25 Jan 2026 19:51:49 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 25 Jan 2026 19:51:49 +0100
X-UD-Smtp-Session: l3s3148p1@Jf0K4jpJd0BtKXAW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Date: Sun, 25 Jan 2026 19:46:52 +0100
Message-ID: <20260125184654.17843-7-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
References: <20260125184654.17843-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: linux-omap@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, Linus Walleij <linusw@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RFC PATCH 1/4] hwspinlock: refactor existing headers
	into provider.h
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:linux-omap@vger.kernel.org,m:baolin.wang@linux.alibaba.com,m:wilken.gottwalt@posteo.net,m:zhang.lyra@gmail.com,m:andersson@kernel.org,m:samuel@sholland.org,m:linux-remoteproc@vger.kernel.org,m:jernej.skrabec@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wsa+renesas@sang-engineering.com,m:mcoquelin.stm32@gmail.com,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:linusw@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:wsa@sang-engineering.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.alibaba.com,posteo.net,gmail.com,kernel.org,sholland.org,st-md-mailman.stormreply.com,sang-engineering.com,lists.linux.dev,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.963];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A933781CE1
X-Rspamd-Action: no action

The ultimate goal is to allow hwspinlock drivers outside of the
hwspinlock directory. So, the public and the internal header get
refactored into a more modern public provider/consumer pair. This patch
creates the provider header. It is a plain move without functional
changes. Only a now obsolete comment gets removed which explained why
some functions do not have fallbacks if hwspinlock is not seleceted. All
acutal providers are converted as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS                                   |  1 +
 drivers/hwspinlock/hwspinlock_core.c          |  3 +-
 drivers/hwspinlock/omap_hwspinlock.c          |  4 +-
 drivers/hwspinlock/qcom_hwspinlock.c          |  4 +-
 drivers/hwspinlock/sprd_hwspinlock.c          |  4 +-
 drivers/hwspinlock/stm32_hwspinlock.c         |  4 +-
 drivers/hwspinlock/sun6i_hwspinlock.c         |  4 +-
 drivers/hwspinlock/u8500_hsem.c               |  3 +-
 include/linux/hwspinlock.h                    | 14 -------
 .../linux/hwspinlock/provider.h               | 40 ++++++++++++-------
 10 files changed, 33 insertions(+), 48 deletions(-)
 rename drivers/hwspinlock/hwspinlock_internal.h => include/linux/hwspinlock/provider.h (78%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a56f8f00aebb..18f4991044ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11187,6 +11187,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git hw
 F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/locking/hwspinlock.rst
 F:	drivers/hwspinlock/
+F:	include/linux/hwspinlock/
 F:	include/linux/hwspinlock.h
 
 HARDWARE TRACING FACILITIES
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a6772..3ee4f4357e01 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -18,12 +18,11 @@
 #include <linux/jiffies.h>
 #include <linux/radix-tree.h>
 #include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
 #include <linux/of.h>
 
-#include "hwspinlock_internal.h"
-
 /* retry delay used in atomic context */
 #define HWSPINLOCK_RETRY_DELAY_US	100
 
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 1832e0c3af6b..e2a8fe4ad96a 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -19,12 +19,10 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
-#include "hwspinlock_internal.h"
-
 /* Spinlock register offsets */
 #define SYSSTATUS_OFFSET		0x0014
 #define LOCK_BASE_OFFSET		0x0800
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 0390979fd765..1b5a0c2fadee 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2015, Sony Mobile Communications AB
  */
 
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/mfd/syscon.h>
@@ -14,8 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include "hwspinlock_internal.h"
-
 #define QCOM_MUTEX_APPS_PROC_ID	1
 #define QCOM_MUTEX_NUM_LOCKS	32
 
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 22e2ffb91743..62de2a551cee 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -7,7 +7,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -15,8 +15,6 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
-#include "hwspinlock_internal.h"
-
 /* hwspinlock registers definition */
 #define HWSPINLOCK_RECCTRL		0x4
 #define HWSPINLOCK_MASTERID(_X_)	(0x80 + 0x4 * (_X_))
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index bb5c7e5f7a80..7af8e4cc564c 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -6,7 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -14,8 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-#include "hwspinlock_internal.h"
-
 #define STM32_MUTEX_COREID	BIT(8)
 #define STM32_MUTEX_LOCK_BIT	BIT(31)
 #define STM32_MUTEX_NUM_LOCKS	32
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index c2d314588046..3c8c067e6312 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -7,7 +7,7 @@
 #include <linux/clk.h>
 #include <linux/debugfs.h>
 #include <linux/errno.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -17,8 +17,6 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
-#include "hwspinlock_internal.h"
-
 #define DRIVER_NAME		"sun6i_hwspinlock"
 
 #define SPINLOCK_BASE_ID	0 /* there is only one hwspinlock device per SoC */
diff --git a/drivers/hwspinlock/u8500_hsem.c b/drivers/hwspinlock/u8500_hsem.c
index 5a2d8c3e0d80..ff0730613929 100644
--- a/drivers/hwspinlock/u8500_hsem.c
+++ b/drivers/hwspinlock/u8500_hsem.c
@@ -19,10 +19,9 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/platform_device.h>
 
-#include "hwspinlock_internal.h"
-
 /*
  * Implementation of STE's HSem protocol 1 without interrutps.
  * The only masterID we allow is '0x01' to force people to use
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index f35b42e8c5de..7f38960c7162 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -55,9 +55,6 @@ struct hwspinlock_pdata {
 
 #ifdef CONFIG_HWSPINLOCK
 
-int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks);
-int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
 int of_hwspin_lock_get_id(struct device_node *np, int index);
@@ -70,13 +67,6 @@ int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
 int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock);
 struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 						     unsigned int id);
-int devm_hwspin_lock_unregister(struct device *dev,
-				struct hwspinlock_device *bank);
-int devm_hwspin_lock_register(struct device *dev,
-			      struct hwspinlock_device *bank,
-			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks);
-
 #else /* !CONFIG_HWSPINLOCK */
 
 /*
@@ -85,10 +75,6 @@ int devm_hwspin_lock_register(struct device *dev,
  * code path get compiled away. This way, if CONFIG_HWSPINLOCK is not
  * required on a given setup, users will still work.
  *
- * The only exception is hwspin_lock_register/hwspin_lock_unregister, with which
- * we _do_ want users to fail (no point in registering hwspinlock instances if
- * the framework is not available).
- *
  * Note: ERR_PTR(-ENODEV) will still be considered a success for NULL-checking
  * users. Others, which care, can still check this with IS_ERR.
  */
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/include/linux/hwspinlock/provider.h
similarity index 78%
rename from drivers/hwspinlock/hwspinlock_internal.h
rename to include/linux/hwspinlock/provider.h
index f298fc0ee5ad..d53bbacec744 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/include/linux/hwspinlock/provider.h
@@ -7,14 +7,26 @@
  * Contact: Ohad Ben-Cohen <ohad@wizery.com>
  */
 
-#ifndef __HWSPINLOCK_HWSPINLOCK_H
-#define __HWSPINLOCK_HWSPINLOCK_H
+#ifndef __LINUX_HWSPINLOCK_PROVIDER_H
+#define __LINUX_HWSPINLOCK_PROVIDER_H
 
 #include <linux/spinlock.h>
 #include <linux/device.h>
 
 struct hwspinlock_device;
 
+/**
+ * struct hwspinlock - this struct represents a single hwspinlock instance
+ * @bank: the hwspinlock_device structure which owns this lock
+ * @lock: initialized and used by hwspinlock core
+ * @priv: private data, owned by the underlying platform-specific hwspinlock drv
+ */
+struct hwspinlock {
+	struct hwspinlock_device *bank;
+	spinlock_t lock;
+	void *priv;
+};
+
 /**
  * struct hwspinlock_ops - platform-specific hwspinlock handlers
  *
@@ -34,18 +46,6 @@ struct hwspinlock_ops {
 	void (*relax)(struct hwspinlock *lock);
 };
 
-/**
- * struct hwspinlock - this struct represents a single hwspinlock instance
- * @bank: the hwspinlock_device structure which owns this lock
- * @lock: initialized and used by hwspinlock core
- * @priv: private data, owned by the underlying platform-specific hwspinlock drv
- */
-struct hwspinlock {
-	struct hwspinlock_device *bank;
-	spinlock_t lock;
-	void *priv;
-};
-
 /**
  * struct hwspinlock_device - a device which usually spans numerous hwspinlocks
  * @dev: underlying device, will be used to invoke runtime PM api
@@ -69,4 +69,14 @@ static inline int hwlock_to_id(struct hwspinlock *hwlock)
 	return hwlock->bank->base_id + local_id;
 }
 
-#endif /* __HWSPINLOCK_HWSPINLOCK_H */
+int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
+		const struct hwspinlock_ops *ops, int base_id, int num_locks);
+int hwspin_lock_unregister(struct hwspinlock_device *bank);
+int devm_hwspin_lock_register(struct device *dev,
+			      struct hwspinlock_device *bank,
+			      const struct hwspinlock_ops *ops,
+			      int base_id, int num_locks);
+int devm_hwspin_lock_unregister(struct device *dev,
+				struct hwspinlock_device *bank);
+
+#endif /* __LINUX_HWSPINLOCK_PROVIDER_H */
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
