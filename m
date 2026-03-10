Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HLiEF4ZsWleqwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0567225DC57
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Mar 2026 08:27:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C643C9008A;
	Wed, 11 Mar 2026 07:27:25 +0000 (UTC)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 19F97C0693D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Mar 2026 07:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 s=k1; bh=Ww4nYucVcxYHOiIbxAnzL68uueWTV/h2bRDqOLnsme0=; b=jSnsmL
 qYMbsKvWcgJkDyGTS/MKc6CavAjUlEjTs7Jc1fq4TKz63lF18ap7o8k4SN8PXbyS
 AHL8q+PdihoH4HtcqxO1Zy9d6w3gs2vfEITGwDJ18954tz/bYbrqQpz/k5n1K+Nt
 vqA+pg0pr/pfiZ2fyH5RHWpZiNLfI2uD5UnE6EKKWdtKakY3rKSVsxEeWvmAX4PB
 +B3SdKbjJvBo2xJWzM61toM3yRYMNng1r3e81RTJbF7WjE0V86GHf4eX9TX5YlDv
 GFNVWeKy9ahgzUkxhBCCWgdgtJ2nAGza2RYfakik/k4ZYVxFHNsMPQILQ5qr5KgQ
 co7yFG/J9Xj4yChg==
Received: (qmail 3112619 invoked from network); 10 Mar 2026 08:55:50 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 10 Mar 2026 08:55:50 +0100
X-UD-Smtp-Session: l3s3148p1@Bz4S2aZMrpAujntP
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Date: Tue, 10 Mar 2026 08:55:18 +0100
Message-ID: <20260310075539.11701-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 11 Mar 2026 07:27:22 +0000
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
Subject: [Linux-stm32] [PATCH v4 03/15] hwspinlock: add helpers to retrieve
	core data
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
X-Rspamd-Queue-Id: 0567225DC57
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[sang-engineering.com:s=k1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
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
	DKIM_TRACE(0.00)[sang-engineering.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,posteo.net,kernel.org,sholland.org,sang-engineering.com,linux.alibaba.com,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.728];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:mid,sang-engineering.com:email]
X-Rspamd-Action: no action

This is a first step to hide internal core structs from hwspinlock
providers. It adds helper functions to retrieve the data needed by them.
Because all users are only within the hwspinlock subsystem and the
change there is trivial, conversion is included in this patch as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c  | 12 ++++++++++++
 drivers/hwspinlock/omap_hwspinlock.c  |  4 ++--
 drivers/hwspinlock/qcom_hwspinlock.c  | 11 ++++++-----
 drivers/hwspinlock/sprd_hwspinlock.c  |  6 +++---
 drivers/hwspinlock/stm32_hwspinlock.c |  4 ++--
 drivers/hwspinlock/sun6i_hwspinlock.c |  4 ++--
 include/linux/hwspinlock.h            |  2 ++
 7 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a6772..2c9eceba7fe8 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -888,5 +888,17 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
 
+void *hwspin_lock_get_priv(struct hwspinlock *hwlock)
+{
+	return hwlock->priv;
+}
+EXPORT_SYMBOL_GPL(hwspin_lock_get_priv);
+
+struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock)
+{
+	return hwlock->bank->dev;
+}
+EXPORT_SYMBOL_GPL(hwspin_lock_get_dev);
+
 MODULE_DESCRIPTION("Hardware spinlock interface");
 MODULE_AUTHOR("Ohad Ben-Cohen <ohad@wizery.com>");
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 1832e0c3af6b..5bf0061d3fd6 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -37,7 +37,7 @@
 
 static int omap_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	/* attempt to acquire the lock by reading its value */
 	return (SPINLOCK_NOTTAKEN == readl(lock_addr));
@@ -45,7 +45,7 @@ static int omap_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void omap_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	/* release the lock by writing 0 to it */
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 0390979fd765..7ff89c3e8c6b 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -27,7 +27,7 @@ struct qcom_hwspinlock_of_data {
 
 static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
 	u32 lock_owner;
 	int ret;
 
@@ -44,7 +44,7 @@ static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
 	u32 lock_owner;
 	int ret;
 
@@ -66,13 +66,14 @@ static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
 
 static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
+	struct device *dev = hwspin_lock_get_dev(lock);
 	u32 owner;
 	int ret;
 
 	ret = regmap_field_read(field, &owner);
 	if (ret) {
-		dev_err(lock->bank->dev, "unable to query spinlock owner\n");
+		dev_err(dev, "unable to query spinlock owner\n");
 		return ret;
 	}
 
@@ -81,7 +82,7 @@ static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
 
 	ret = regmap_field_write(field, 0);
 	if (ret) {
-		dev_err(lock->bank->dev, "failed to bust spinlock\n");
+		dev_err(dev, "failed to bust spinlock\n");
 		return ret;
 	}
 
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 22e2ffb91743..0d08efbdfb07 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -40,8 +40,8 @@ struct sprd_hwspinlock_dev {
 static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 {
 	struct sprd_hwspinlock_dev *sprd_hwlock =
-		dev_get_drvdata(lock->bank->dev);
-	void __iomem *addr = lock->priv;
+		dev_get_drvdata(hwspin_lock_get_dev(lock));
+	void __iomem *addr = hwspin_lock_get_priv(lock);
 	int user_id, lock_id;
 
 	if (!readl(addr))
@@ -59,7 +59,7 @@ static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 /* unlock the hardware spinlock */
 static void sprd_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(HWSPINLOCK_NOTTAKEN, lock_addr);
 }
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index bb5c7e5f7a80..1d75dc03f4ad 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -27,7 +27,7 @@ struct stm32_hwspinlock {
 
 static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 	u32 status;
 
 	writel(STM32_MUTEX_LOCK_BIT | STM32_MUTEX_COREID, lock_addr);
@@ -38,7 +38,7 @@ static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void stm32_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(STM32_MUTEX_COREID, lock_addr);
 }
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index c2d314588046..8ff81cb5880a 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -62,14 +62,14 @@ static void sun6i_hwspinlock_debugfs_init(struct sun6i_hwspinlock_data *priv)
 
 static int sun6i_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	return (readl(lock_addr) == SPINLOCK_NOTTAKEN);
 }
 
 static void sun6i_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
 }
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 74b91244fe0e..dffa1dff7289 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -27,6 +27,8 @@ struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
+void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
+struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		const struct hwspinlock_ops *ops, int base_id, int num_locks);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
