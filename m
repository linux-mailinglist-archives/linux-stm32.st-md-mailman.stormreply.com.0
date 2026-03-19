Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MgBM1HXu2k4owIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 12:00:33 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 779512C9E07
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 12:00:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A4D9C87ED8;
	Thu, 19 Mar 2026 11:00:33 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A9713C87ED3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 11:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=2njF1crk5JYsuohHYtW2T9uqDGU7n8lPKWVOP57dVMM=; b=aUUAA+
 TIQCX0SJ4pwNyGnHcH0zdCPfLwTWLGDHElsPMF9Ilpu25xYdzGWSOVuOv8sk4aHl
 smE69sqboqQY9qeCEAW9pn/aMaEIONIEfygCV6MFDpCke67nmnkkgL9+SrJrTWdI
 Fk6W7yWEOz1FVBXo1TBgzFag76Q8y+Kf9xsOfuQdmbEZIgD/KfRqXDMCcVNluwl/
 apT+Lso2+LBs4YnxOp9WV2vTgIa9vIjiXxvMt7gJFZrwxcr7dlztwyx+5ygqV0nQ
 JZbCWNk0uBEHrqXerCS6/G27bE61SBY0aSzTQ19mdG5NbUSfyHScytsOE+f60u82
 S93eOd3pxgDrJy2g==
Received: (qmail 1099899 invoked from network); 19 Mar 2026 12:00:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 19 Mar 2026 12:00:08 +0100
X-UD-Smtp-Session: l3s3148p1@MEzEeF5NuK0gAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Date: Thu, 19 Mar 2026 11:59:33 +0100
Message-ID: <20260319105947.6237-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
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
Subject: [Linux-stm32] [PATCH v5 11/15] hwspinlock: move entries from
	internal to public header
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
	NEURAL_HAM(-0.00)[-0.821];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[wizery.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 779512C9E07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Providers need the ops-structure and the hwlock_to_id-function. Move
these entries to the public header. With this change, all providers are
also updated to use the public header only. The internal header is now
used by the core only.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c     |  8 +++++++
 drivers/hwspinlock/hwspinlock_internal.h | 29 ------------------------
 drivers/hwspinlock/omap_hwspinlock.c     |  2 --
 drivers/hwspinlock/qcom_hwspinlock.c     |  2 --
 drivers/hwspinlock/sprd_hwspinlock.c     |  2 --
 drivers/hwspinlock/stm32_hwspinlock.c    |  2 --
 drivers/hwspinlock/sun6i_hwspinlock.c    |  2 --
 include/linux/hwspinlock.h               | 23 +++++++++++++++++++
 8 files changed, 31 insertions(+), 39 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index a7610ba755b4..e0227d027cf2 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -915,5 +915,13 @@ struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock)
 }
 EXPORT_SYMBOL_GPL(hwspin_lock_get_dev);
 
+int hwlock_to_id(struct hwspinlock *hwlock)
+{
+	int local_id = hwlock - &hwlock->bank->lock[0];
+
+	return hwlock->bank->base_id + local_id;
+}
+EXPORT_SYMBOL_GPL(hwlock_to_id);
+
 MODULE_DESCRIPTION("Hardware spinlock interface");
 MODULE_AUTHOR("Ohad Ben-Cohen <ohad@wizery.com>");
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index 3c835d96bf86..20ae531fc389 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -15,28 +15,6 @@
 
 struct hwspinlock_device;
 
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
 /**
  * struct hwspinlock - this struct represents a single hwspinlock instance
  * @bank: the hwspinlock_device structure which owns this lock
@@ -65,11 +43,4 @@ struct hwspinlock_device {
 	struct hwspinlock lock[];
 };
 
-static inline int hwlock_to_id(struct hwspinlock *hwlock)
-{
-	int local_id = hwlock - &hwlock->bank->lock[0];
-
-	return hwlock->bank->base_id + local_id;
-}
-
 #endif /* __HWSPINLOCK_HWSPINLOCK_H */
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 87ab30614e1d..41a8812708ef 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -23,8 +23,6 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
-#include "hwspinlock_internal.h"
-
 /* Spinlock register offsets */
 #define SYSSTATUS_OFFSET		0x0014
 #define LOCK_BASE_OFFSET		0x0800
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index e2836d6728e8..22cc6f9003df 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -14,8 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
-#include "hwspinlock_internal.h"
-
 #define QCOM_MUTEX_APPS_PROC_ID	1
 #define QCOM_MUTEX_NUM_LOCKS	32
 
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index bbae37e25243..0f4fc622e3cd 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -15,8 +15,6 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
-#include "hwspinlock_internal.h"
-
 /* hwspinlock registers definition */
 #define HWSPINLOCK_RECCTRL		0x4
 #define HWSPINLOCK_MASTERID(_X_)	(0x80 + 0x4 * (_X_))
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index ed937bc26bf5..8eafe1a74b1b 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -14,8 +14,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-#include "hwspinlock_internal.h"
-
 #define STM32_MUTEX_COREID	BIT(8)
 #define STM32_MUTEX_LOCK_BIT	BIT(31)
 #define STM32_MUTEX_NUM_LOCKS	32
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index 8bbed23af5f4..145d284c5ab5 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -17,8 +17,6 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
-#include "hwspinlock_internal.h"
-
 #define DRIVER_NAME		"sun6i_hwspinlock"
 
 #define SPINLOCK_BASE_ID	0 /* there is only one hwspinlock device per SoC */
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 58733cda7a9a..4f5b6932712e 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -27,8 +27,31 @@ struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
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
 void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
 struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
+int hwlock_to_id(struct hwspinlock *hwlock);
 struct hwspinlock_device *hwspin_lock_register(struct device *dev, const struct hwspinlock_ops *ops,
 					       int base_id, int num_locks, void *init_data);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
-- 
2.51.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
