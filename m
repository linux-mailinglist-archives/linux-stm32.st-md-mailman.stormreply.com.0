Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C833F7BE457
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Oct 2023 17:15:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D039C6A61D;
	Mon,  9 Oct 2023 15:15:26 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DC27C6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Oct 2023 14:59:27 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3af65455e7cso3390663b6e.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Oct 2023 07:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1696863565; x=1697468365;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gremNSB3d9SyFHcL1LlmJRtVUMpoQGmg6IJzbQmBl54=;
 b=vqJhuCW9YpTMCLsDMdIzBUfpLPb6BhXzZzD896fvsYomUgL1ZQkpgGbDQRjl+bmnwg
 QU2A6aonlN9oj4kzu/g6C31RT/86C092CJujrA/mbLvzPWZp2dHfEPg8Bw3n1j+HHyQ9
 /A5/E1ziGNkDu2YquiLUbOuwDgFiu14bb+t8NVqInryVcc4JvEHYAZSLsZl9FjPtEpCD
 lG1qX3fF7g9g1BoE/DB+I/uiE5/eB+WCCGBxU/Zc7SvWYBBZQV0OS3O2AZRx9ghz02MR
 wmjTzZvATdZrNF8j3OHYmI4SFlg80NGBHa7lyTerx5hSLi0I5GascGR5wumP3HV7bCPP
 ntcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696863565; x=1697468365;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gremNSB3d9SyFHcL1LlmJRtVUMpoQGmg6IJzbQmBl54=;
 b=Ns8yq74spQtgJbFrHRG0OibnQ73QhE8ba76p6iz6WO8tMCsG5+9PLx9e1OKoqZ66DM
 DcR7q52UPsX8zRiKxVpLFQv4C7qcGCrMxoZL/m1PlaUW73jdvjn8q5bMBB7rQ87ghkLX
 TnlHXm0OSIZbYMDGgB7i2DTT3JguBLQc/MCsLgVPnBfE0FiPFrFpXZpNNGZ+fIZJjKBA
 W7SgbBXgOLXy+F6C+Js4Qp8zbZ8NDPjFpjWn7IMdmkggwRLslO8S8fhzJe+QTJ8GiOKS
 PWnYpyINXtqa2aGZ658dLJzaF12bFa6NHTWGbVkTTKaPQfnIdaXKszwQea7POWLGhJ7k
 u7mg==
X-Gm-Message-State: AOJu0YxjFMRFlY5SE6L/d7qYVfPwj91/3u07BjVxJeDWnxb4P9WtLflD
 51xp6MDHJQywzCRHEdNM5PSupiL9d+kkoGXAlBo=
X-Google-Smtp-Source: AGHT+IFYy9l29dEpiDaimL5a3XAFRuyoA772ghfVXLzJSXypiGc/Ts/jVpBhpkvrQjwoxhJ+y8jQfA==
X-Received: by 2002:a05:6870:d187:b0:1b0:60ff:b73f with SMTP id
 a7-20020a056870d18700b001b060ffb73fmr19038396oac.8.1696863565494; 
 Mon, 09 Oct 2023 07:59:25 -0700 (PDT)
Received: from localhost.localdomain ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 u21-20020ae9c015000000b0076ef29f3429sm3559275qkk.120.2023.10.09.07.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 07:59:25 -0700 (PDT)
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Date: Mon,  9 Oct 2023 10:59:04 -0400
Message-ID: <20231009145904.3776703-1-ben.wolsieffer@hefring.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Oct 2023 15:15:25 +0000
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: dwmac-stm32: refactor
	clock config
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

Currently, clock configuration is spread throughout the driver and
partially duplicated for the STM32MP1 and STM32 MCU variants. This makes
it difficult to keep track of which clocks need to be enabled or disabled
in various scenarios.

This patch adds symmetric stm32_dwmac_clk_enable/disable() functions
that handle all clock configuration, including quirks required while
suspending or resuming. syscfg_clk and clk_eth_ck are not present on
STM32 MCUs, but it is fine to try to configure them anyway since NULL
clocks are ignored.

Signed-off-by: Ben Wolsieffer <ben.wolsieffer@hefring.com>
---
This is a followup to my recent STM32 ethernet resume bug fix [1] that
tries to address the underlying issues that led to that bug.

[1] https://lore.kernel.org/all/20230927175749.1419774-1-ben.wolsieffer@hefring.com/ 

 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 113 +++++++-----------
 1 file changed, 45 insertions(+), 68 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index d8d3c729f219..c92dfc4ecf57 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -98,7 +98,6 @@ struct stm32_dwmac {
 
 struct stm32_ops {
 	int (*set_mode)(struct plat_stmmacenet_data *plat_dat);
-	int (*clk_prepare)(struct stm32_dwmac *dwmac, bool prepare);
 	int (*suspend)(struct stm32_dwmac *dwmac);
 	void (*resume)(struct stm32_dwmac *dwmac);
 	int (*parse_data)(struct stm32_dwmac *dwmac,
@@ -107,62 +106,55 @@ struct stm32_ops {
 	bool clk_rx_enable_in_suspend;
 };
 
-static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat)
+static int stm32_dwmac_clk_enable(struct stm32_dwmac *dwmac, bool resume)
 {
-	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
 	int ret;
 
-	if (dwmac->ops->set_mode) {
-		ret = dwmac->ops->set_mode(plat_dat);
-		if (ret)
-			return ret;
-	}
-
 	ret = clk_prepare_enable(dwmac->clk_tx);
 	if (ret)
-		return ret;
+		goto err_clk_tx;
 
-	if (!dwmac->ops->clk_rx_enable_in_suspend ||
-	    !dwmac->dev->power.is_suspended) {
+	if (!dwmac->ops->clk_rx_enable_in_suspend || !resume) {
 		ret = clk_prepare_enable(dwmac->clk_rx);
-		if (ret) {
-			clk_disable_unprepare(dwmac->clk_tx);
-			return ret;
-		}
+		if (ret)
+			goto err_clk_rx;
 	}
 
-	if (dwmac->ops->clk_prepare) {
-		ret = dwmac->ops->clk_prepare(dwmac, true);
-		if (ret) {
-			clk_disable_unprepare(dwmac->clk_rx);
-			clk_disable_unprepare(dwmac->clk_tx);
-		}
+	ret = clk_prepare_enable(dwmac->syscfg_clk);
+	if (ret)
+		goto err_syscfg_clk;
+
+	if (dwmac->enable_eth_ck) {
+		ret = clk_prepare_enable(dwmac->clk_eth_ck);
+		if (ret)
+			goto err_clk_eth_ck;
 	}
 
 	return ret;
+
+err_clk_eth_ck:
+	clk_disable_unprepare(dwmac->syscfg_clk);
+err_syscfg_clk:
+	if (!dwmac->ops->clk_rx_enable_in_suspend || !resume)
+		clk_disable_unprepare(dwmac->clk_rx);
+err_clk_rx:
+	clk_disable_unprepare(dwmac->clk_tx);
+err_clk_tx:
+	return ret;
 }
 
-static int stm32mp1_clk_prepare(struct stm32_dwmac *dwmac, bool prepare)
+static int stm32_dwmac_init(struct plat_stmmacenet_data *plat_dat, bool resume)
 {
-	int ret = 0;
+	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
+	int ret;
 
-	if (prepare) {
-		ret = clk_prepare_enable(dwmac->syscfg_clk);
+	if (dwmac->ops->set_mode) {
+		ret = dwmac->ops->set_mode(plat_dat);
 		if (ret)
 			return ret;
-		if (dwmac->enable_eth_ck) {
-			ret = clk_prepare_enable(dwmac->clk_eth_ck);
-			if (ret) {
-				clk_disable_unprepare(dwmac->syscfg_clk);
-				return ret;
-			}
-		}
-	} else {
-		clk_disable_unprepare(dwmac->syscfg_clk);
-		if (dwmac->enable_eth_ck)
-			clk_disable_unprepare(dwmac->clk_eth_ck);
 	}
-	return ret;
+
+	return stm32_dwmac_clk_enable(dwmac, resume);
 }
 
 static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)
@@ -252,13 +244,15 @@ static int stm32mcu_set_mode(struct plat_stmmacenet_data *plat_dat)
 				 dwmac->ops->syscfg_eth_mask, val << 23);
 }
 
-static void stm32_dwmac_clk_disable(struct stm32_dwmac *dwmac)
+static void stm32_dwmac_clk_disable(struct stm32_dwmac *dwmac, bool suspend)
 {
 	clk_disable_unprepare(dwmac->clk_tx);
-	clk_disable_unprepare(dwmac->clk_rx);
+	if (!dwmac->ops->clk_rx_enable_in_suspend || !suspend)
+		clk_disable_unprepare(dwmac->clk_rx);
 
-	if (dwmac->ops->clk_prepare)
-		dwmac->ops->clk_prepare(dwmac, false);
+	clk_disable_unprepare(dwmac->syscfg_clk);
+	if (dwmac->enable_eth_ck)
+		clk_disable_unprepare(dwmac->clk_eth_ck);
 }
 
 static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
@@ -397,7 +391,7 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 
 	plat_dat->bsp_priv = dwmac;
 
-	ret = stm32_dwmac_init(plat_dat);
+	ret = stm32_dwmac_init(plat_dat, false);
 	if (ret)
 		return ret;
 
@@ -408,7 +402,7 @@ static int stm32_dwmac_probe(struct platform_device *pdev)
 	return 0;
 
 err_clk_disable:
-	stm32_dwmac_clk_disable(dwmac);
+	stm32_dwmac_clk_disable(dwmac, false);
 
 	return ret;
 }
@@ -421,7 +415,7 @@ static void stm32_dwmac_remove(struct platform_device *pdev)
 
 	stmmac_dvr_remove(&pdev->dev);
 
-	stm32_dwmac_clk_disable(priv->plat->bsp_priv);
+	stm32_dwmac_clk_disable(dwmac, false);
 
 	if (dwmac->irq_pwr_wakeup >= 0) {
 		dev_pm_clear_wake_irq(&pdev->dev);
@@ -431,18 +425,7 @@ static void stm32_dwmac_remove(struct platform_device *pdev)
 
 static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
 {
-	int ret = 0;
-
-	ret = clk_prepare_enable(dwmac->clk_ethstp);
-	if (ret)
-		return ret;
-
-	clk_disable_unprepare(dwmac->clk_tx);
-	clk_disable_unprepare(dwmac->syscfg_clk);
-	if (dwmac->enable_eth_ck)
-		clk_disable_unprepare(dwmac->clk_eth_ck);
-
-	return ret;
+	return clk_prepare_enable(dwmac->clk_ethstp);
 }
 
 static void stm32mp1_resume(struct stm32_dwmac *dwmac)
@@ -450,14 +433,6 @@ static void stm32mp1_resume(struct stm32_dwmac *dwmac)
 	clk_disable_unprepare(dwmac->clk_ethstp);
 }
 
-static int stm32mcu_suspend(struct stm32_dwmac *dwmac)
-{
-	clk_disable_unprepare(dwmac->clk_tx);
-	clk_disable_unprepare(dwmac->clk_rx);
-
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int stm32_dwmac_suspend(struct device *dev)
 {
@@ -468,6 +443,10 @@ static int stm32_dwmac_suspend(struct device *dev)
 	int ret;
 
 	ret = stmmac_suspend(dev);
+	if (ret)
+		return ret;
+
+	stm32_dwmac_clk_disable(dwmac, true);
 
 	if (dwmac->ops->suspend)
 		ret = dwmac->ops->suspend(dwmac);
@@ -485,7 +464,7 @@ static int stm32_dwmac_resume(struct device *dev)
 	if (dwmac->ops->resume)
 		dwmac->ops->resume(dwmac);
 
-	ret = stm32_dwmac_init(priv->plat);
+	ret = stm32_dwmac_init(priv->plat, true);
 	if (ret)
 		return ret;
 
@@ -500,13 +479,11 @@ static SIMPLE_DEV_PM_OPS(stm32_dwmac_pm_ops,
 
 static struct stm32_ops stm32mcu_dwmac_data = {
 	.set_mode = stm32mcu_set_mode,
-	.suspend = stm32mcu_suspend,
 	.syscfg_eth_mask = SYSCFG_MCU_ETH_MASK
 };
 
 static struct stm32_ops stm32mp1_dwmac_data = {
 	.set_mode = stm32mp1_set_mode,
-	.clk_prepare = stm32mp1_clk_prepare,
 	.suspend = stm32mp1_suspend,
 	.resume = stm32mp1_resume,
 	.parse_data = stm32mp1_parse_data,
-- 
2.42.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
