Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E221426819
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 12:42:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B669AC5A4FA;
	Fri,  8 Oct 2021 10:42:35 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A490BC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 10:24:46 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 145so7804564pfz.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Oct 2021 03:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a9+SkQaOPjsBTe9c6aiqQVMNMLolkjNbz68KZM8fxyk=;
 b=DFRXnnToUO5DrTYgeR64i6seqNB2yC38VBpzv1sBYG1oXZCgJ6GOqLUCfsATR2fsoh
 6xQLqTxnWSULuLc9ZeIJUqe16YJgN+3EFgWuMiooxYGKiHeOOd+BlCDcdYp+q27Iqcjl
 oOI6j6juDnrm3hW+0hzZA/nasRCczpIyaCaeRHBxeWMFKBAnBmu2ZLbI0IWCMPGixnwM
 syjyYHgLbbFosb2ysbnGVuh3a8USteuYKMRKWSsDXI2IKrF2OC7PwCnuWvWKQeuOFFGi
 06rXT8H9H4P3VZ9G6dvV6LpKAEu8dUf4/AVD37LXJB3LrwCXidSRzkiFnllONbgrU9Zj
 dCpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a9+SkQaOPjsBTe9c6aiqQVMNMLolkjNbz68KZM8fxyk=;
 b=4kq+7Ix1BFeDmZiV+WhHwftLTY1TgF+Hu2a1wY8BUzLdgxaEj66zzlTkZ5MvZv8t7s
 GoimRlVhqnN/IO10OqlR8MeJC5FRUTyqgQcG1Nx1fRiVb7F9pFyjZa8kXI3C+nHBoc2n
 xWpkkuqaYhBVUZZtd/oRx2VA9UtYrUJQCaTWZVzHz+M/fIy9bVEQqYPq+b0aqewJRrO2
 XW10PULPqubl3mr29UUIsoaN1qkY3rPC9kPapevjYmY4bUd533+ML4lU9IWnZf98wVsn
 5gY1pxSywh6jeDOgg1RTF/6mDXzDau95esaZVqtIyQ1zhB5t7FiQZXpJ9JcdeD5qW3BR
 Fspw==
X-Gm-Message-State: AOAM533whUJkT7MERTu//FI66aDiOVBoJ7Z6ZKh/+NpKdAZdC+iY3oyn
 /KINLf/4rC1kFhg0ZXBp4KA=
X-Google-Smtp-Source: ABdhPJy77L0NPD0IPs0pHKmluyLSKJzH8GoOC/pXSo2mzaH+7ffl2xTl/0AOMbNsRCF22s0tLg8AUQ==
X-Received: by 2002:a63:8f47:: with SMTP id r7mr1545186pgn.270.1633688684790; 
 Fri, 08 Oct 2021 03:24:44 -0700 (PDT)
Received: from jensen.next ([113.109.79.206])
 by smtp.gmail.com with ESMTPSA id s37sm2491835pfg.44.2021.10.08.03.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 03:24:44 -0700 (PDT)
From: hmz007 <hmz007@gmail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, kuba@kernel.org, mcoquelin.stm32@gmail.com,
 p.zabel@pengutronix.de, lgirdwood@gmail.com, broonie@kernel.org
Date: Fri,  8 Oct 2021 18:24:10 +0800
Message-Id: <20211008102410.6535-1-hmz007@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 08 Oct 2021 10:42:35 +0000
Cc: netdev@vger.kernel.org, hmz007 <hmz007@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: Add runtime PM support
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

Commit 2d26f6e39afb ("fix unbalanced pm_runtime_enable warnings")
also enables runtime PM, which affects rk3399 with power-domain.

After an off-on switch of power-domain, the GMAC doesn't work properly,
calling rk_gmac_powerup at runtime resume fixes this issue.

Fixes: 2d26f6e39afb ("net: stmmac: dwmac-rk: fix unbalanced pm_runtime_enable warnings")
Signed-off-by: hmz007 <hmz007@gmail.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index ed817011a94a..a9eb98691a66 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -21,6 +21,7 @@
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
+#include <linux/pm_runtime.h>

 #include "stmmac_platform.h"

@@ -1626,7 +1627,8 @@ static int rk_gmac_remove(struct platform_device *pdev)
 	struct rk_priv_data *bsp_priv = get_stmmac_bsp_priv(&pdev->dev);
 	int ret = stmmac_dvr_remove(&pdev->dev);

-	rk_gmac_powerdown(bsp_priv);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		rk_gmac_powerdown(bsp_priv);

 	return ret;
 }
@@ -1638,7 +1640,7 @@ static int rk_gmac_suspend(struct device *dev)
 	int ret = stmmac_suspend(dev);

 	/* Keep the PHY up if we use Wake-on-Lan. */
-	if (!device_may_wakeup(dev)) {
+	if (pm_runtime_active(dev) && !device_may_wakeup(dev)) {
 		rk_gmac_powerdown(bsp_priv);
 		bsp_priv->suspended = true;
 	}
@@ -1660,7 +1662,24 @@ static int rk_gmac_resume(struct device *dev)
 }
 #endif /* CONFIG_PM_SLEEP */

-static SIMPLE_DEV_PM_OPS(rk_gmac_pm_ops, rk_gmac_suspend, rk_gmac_resume);
+#ifdef CONFIG_PM
+static int rk_gmac_runtime_suspend(struct device *dev)
+{
+	rk_gmac_powerdown(get_stmmac_bsp_priv(dev));
+	return 0;
+}
+
+static int rk_gmac_runtime_resume(struct device *dev)
+{
+	rk_gmac_powerup(get_stmmac_bsp_priv(dev));
+	return 0;
+}
+#endif
+
+static const struct dev_pm_ops __maybe_unused rk_gmac_pm_ops = {
+    SET_SYSTEM_SLEEP_PM_OPS(rk_gmac_suspend, rk_gmac_resume)
+    SET_RUNTIME_PM_OPS(rk_gmac_runtime_suspend, rk_gmac_runtime_resume, NULL)
+};

 static const struct of_device_id rk_gmac_dwmac_match[] = {
 	{ .compatible = "rockchip,px30-gmac",	.data = &px30_ops   },
--
2.33.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
