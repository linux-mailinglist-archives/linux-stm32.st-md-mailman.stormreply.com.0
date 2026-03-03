Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIwmKDQ3p2mUfwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 20:32:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8F21F6045
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Mar 2026 20:32:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FBD7C87ECE;
	Tue,  3 Mar 2026 19:32:04 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9F94C87ECC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Mar 2026 19:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=eZSTpzKDUIc2vRfE3Wkr3hk5q7loVov9yTUGLtbVCIE=; b=ZHoHeD
 LaNFIEPzgUNb7jPaYhPLxLZ8z3Kv3IHmL6E2nMPE6gfl4RoSUobYEcEfGy6GErxW
 JG/bm6oMWHGbGwfXxsKJdcqlWutQwccwhGo1Dulman9zT0wbNt66ofswJrVs6Eki
 pGqiNnEVGAakMhcKcRZ9aqDq2Y42Q6tCNqeSHIKpjgZHpM2B7J7p2MpAgYqGTe6F
 hGnuGZEARs2R+sjsO1xy/BqzRfiILXhNpdR80+YWDKFRZLdGaSlvlknPe5iO2zBL
 UsiBiMCkD0U3wh3ka4U4+LWb2cK1+lXEm5H8sjLcnqYYU0cZ9TgHj9rapvlrERdC
 1ozFnV2lzVFyygCw==
Received: (qmail 430845 invoked from network); 3 Mar 2026 20:31:41 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 3 Mar 2026 20:31:41 +0100
X-UD-Smtp-Session: l3s3148p1@Y364wCNMTqgujnu+
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Date: Tue,  3 Mar 2026 20:26:06 +0100
Message-ID: <20260303192600.7224-31-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
References: <20260303192600.7224-17-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Cc: linux-omap@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 14/15] hwspinlock: refactor provider.h from
	public header
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
X-Rspamd-Queue-Id: 5C8F21F6045
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:linux-omap@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:wilken.gottwalt@posteo.net,m:zhang.lyra@gmail.com,m:andersson@kernel.org,m:samuel@sholland.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernej.skrabec@gmail.com,m:wsa+renesas@sang-engineering.com,m:baolin.wang@linux.alibaba.com,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.950];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,posteo.net,kernel.org,sholland.org,sang-engineering.com,linux.alibaba.com,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,sang-engineering.com:mid,sang-engineering.com:email,ti.com:url]
X-Rspamd-Action: no action

Factor out the entries only needed for providers from the generic public
header. This allows for a clean separation between providers and
consumers. All providers are in the hwspinlock subsystem currently and
are trivially converted here as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 MAINTAINERS                           |  1 +
 drivers/hwspinlock/hwspinlock_core.c  |  1 +
 drivers/hwspinlock/omap_hwspinlock.c  |  2 +-
 drivers/hwspinlock/qcom_hwspinlock.c  |  2 +-
 drivers/hwspinlock/sprd_hwspinlock.c  |  2 +-
 drivers/hwspinlock/stm32_hwspinlock.c |  2 +-
 drivers/hwspinlock/sun6i_hwspinlock.c |  2 +-
 include/linux/hwspinlock.h            | 44 --------------------
 include/linux/hwspinlock/provider.h   | 60 +++++++++++++++++++++++++++
 9 files changed, 67 insertions(+), 49 deletions(-)
 create mode 100644 include/linux/hwspinlock/provider.h

diff --git a/MAINTAINERS b/MAINTAINERS
index b4cb7a63e800..4e95cbb48dd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11215,6 +11215,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git hw
 F:	Documentation/devicetree/bindings/hwlock/
 F:	Documentation/locking/hwspinlock.rst
 F:	drivers/hwspinlock/
+F:	include/linux/hwspinlock/
 F:	include/linux/hwspinlock.h
 
 HARDWARE TRACING FACILITIES
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index adf6fefb382f..6c8a03deb00c 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -13,6 +13,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 96fdc35ef642..338ae9fa89f0 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -19,7 +19,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
-#include <linux/hwspinlock.h>
+#include <linux/hwspinlock/provider.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 22cc6f9003df..7fdbb1e58b29 100644
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
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index d2aa4714e2ea..f6014b314432 100644
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
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 08762cd96cee..a22ebabe1921 100644
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
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index 5c6d20eb24b5..4dab91800745 100644
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
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 4f5b6932712e..4fe1c8831cd1 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -27,34 +27,6 @@ struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
-/**
- * struct hwspinlock_ops - platform-specific hwspinlock handlers
- *
- * @trylock:	make a single attempt to take the lock. returns 0 on
- *		failure and true on success. may _not_ sleep.
- * @unlock:	release the lock. always succeed. may _not_ sleep.
- * @bust:	optional, platform-specific bust handler, called by hwspinlock
- *		core to bust a specific lock.
- * @relax:	optional, platform-specific relax handler, called by hwspinlock
- *		core while spinning on a lock, between two successive
- *		invocations of @trylock. may _not_ sleep.
- * @init_priv:	optional, callback used when registering the hwspinlock device.
- *		Its return value will be used to fill the per-lock 'priv' data.
- */
-struct hwspinlock_ops {
-	int (*trylock)(struct hwspinlock *lock);
-	void (*unlock)(struct hwspinlock *lock);
-	int (*bust)(struct hwspinlock *lock, unsigned int id);
-	void (*relax)(struct hwspinlock *lock);
-	void *(*init_priv)(int local_id, void *init_data);
-};
-
-void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
-struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
-int hwlock_to_id(struct hwspinlock *hwlock);
-struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
-					       int base_id, int num_locks, void *init_data);
-int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
 int of_hwspin_lock_get_id(struct device_node *np, int index);
@@ -67,18 +39,6 @@ int hwspin_lock_bust(struct hwspinlock *hwlock, unsigned int id);
 int devm_hwspin_lock_free(struct device *dev, struct hwspinlock *hwlock);
 struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 						     unsigned int id);
-int devm_hwspin_lock_unregister(struct device *dev,
-				struct hwspinlock_device *bank);
-struct hwspinlock_device *devm_hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
-						    int base_id, int num_locks, void *init_data);
-
-static inline int devm_hwspin_lock_register_errno(struct device *dev,
-						  const struct hwspinlock_ops *ops,
-						  int base_id, int num_locks, void *init_data)
-{
-	return PTR_ERR_OR_ZERO(devm_hwspin_lock_register(dev, ops, base_id, num_locks, init_data));
-}
-
 #else /* !CONFIG_HWSPINLOCK */
 
 /*
@@ -87,10 +47,6 @@ static inline int devm_hwspin_lock_register_errno(struct device *dev,
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
diff --git a/include/linux/hwspinlock/provider.h b/include/linux/hwspinlock/provider.h
new file mode 100644
index 000000000000..73c7b0cb6735
--- /dev/null
+++ b/include/linux/hwspinlock/provider.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hardware spinlock public header for providers
+ *
+ * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2026 Sang Engineering
+ * Copyright (C) 2026 Renesas Solutions Corp.
+ */
+
+#ifndef __LINUX_HWSPINLOCK_PROVIDER_H
+#define __LINUX_HWSPINLOCK_PROVIDER_H
+
+#include <linux/err.h>
+
+struct device;
+struct hwspinlock;
+struct hwspinlock_device;
+
+/**
+ * struct hwspinlock_ops - platform-specific hwspinlock handlers
+ *
+ * @trylock:	make a single attempt to take the lock. returns 0 on
+ *		failure and true on success. may _not_ sleep.
+ * @unlock:	release the lock. always succeed. may _not_ sleep.
+ * @bust:	optional, platform-specific bust handler, called by hwspinlock
+ *		core to bust a specific lock.
+ * @relax:	optional, platform-specific relax handler, called by hwspinlock
+ *		core while spinning on a lock, between two successive
+ *		invocations of @trylock. may _not_ sleep.
+ * @init_priv:	optional, callback used when registering the hwspinlock device.
+ *		Its return value will be used to fill the per-lock 'priv' data.
+ */
+struct hwspinlock_ops {
+	int (*trylock)(struct hwspinlock *lock);
+	void (*unlock)(struct hwspinlock *lock);
+	int (*bust)(struct hwspinlock *lock, unsigned int id);
+	void (*relax)(struct hwspinlock *lock);
+	void *(*init_priv)(int local_id, void *init_data);
+};
+
+void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
+struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
+int hwlock_to_id(struct hwspinlock *hwlock);
+struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+					       int base_id, int num_locks, void *init_data);
+int hwspin_lock_unregister(struct hwspinlock_device *bank);
+
+struct hwspinlock_device *devm_hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
+						    int base_id, int num_locks, void *init_data);
+int devm_hwspin_lock_unregister(struct device *dev,
+				struct hwspinlock_device *bank);
+
+static inline int devm_hwspin_lock_register_errno(struct device *dev,
+						  const struct hwspinlock_ops *ops,
+						  int base_id, int num_locks, void *init_data)
+{
+	return PTR_ERR_OR_ZERO(devm_hwspin_lock_register(dev, ops, base_id, num_locks, init_data));
+}
+
+#endif /* __LINUX_HWSPINLOCK_PROVIDER_H */
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
