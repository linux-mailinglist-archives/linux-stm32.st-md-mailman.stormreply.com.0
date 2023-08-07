Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD9C772BA6
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Aug 2023 18:54:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7109DC6B45C;
	Mon,  7 Aug 2023 16:54:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46B56C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 16:54:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4A18C61FB3;
 Mon,  7 Aug 2023 16:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 450C2C433CB;
 Mon,  7 Aug 2023 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691427250;
 bh=meIPlCLi1bchsiAPHa2YkAHiZoy6af5a6nvWxPBXByQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T8+xLqHNrEOI5ubSRNwSnODx9PNj3Y8aPp+tRzdpDXrHdHfLT2wsmNdVDHVLv8oAg
 dYpGMCTnv83a9TyKjdjUMULv641OUyCNzV/lg3zHMUn9C1EnfwWSdNbAixUi6k8/Se
 dmV48RAleYf6zULf7Bk83NUaPJsXQcPYAltfqosGAvNhhAx4hvw5qF9geXMuMYENkW
 PwhBcTN1XAfywgY/lENUWxjya0dCfHJYBI6zoEIAGvX6kbAwjsxNfHZ/9nNip34ezG
 +B5ao3HxhZwXZ4W0ulDZFce3Iozuk1iTgyxw8w7Rp5zVuQMmEaNT6jsAYudXJkFdB0
 ndIGPd4ALY/5w==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
Date: Tue,  8 Aug 2023 00:41:51 +0800
Message-Id: <20230807164151.1130-11-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230807164151.1130-1-jszhang@kernel.org>
References: <20230807164151.1130-1-jszhang@kernel.org>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH net-next v2 10/10] net: stmmac: platform:
	support parsing per channel irq from DT
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

The snps dwmac IP may support per channel interrupt. Add support to
parse the per channel irq from DT.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  6 +++--
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 23 +++++++++++++++++++
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4ed5c976c7a3..7c607ef6f364 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7278,8 +7278,10 @@ int stmmac_dvr_probe(struct device *device,
 	priv->plat = plat_dat;
 	priv->ioaddr = res->addr;
 	priv->dev->base_addr = (unsigned long)res->addr;
-	priv->plat->dma_cfg->perch_irq_en =
-		(priv->plat->flags & STMMAC_FLAG_PERCH_IRQ_EN);
+	if (res->rx_irq[0] && res->tx_irq[0]) {
+		priv->plat->flags |= STMMAC_FLAG_PERCH_IRQ_EN;
+		priv->plat->dma_cfg->perch_irq_en = true;
+	}
 
 	priv->dev->irq = res->irq;
 	priv->wol_irq = res->wol_irq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 29145682b57b..9b46775b41ab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -705,6 +705,9 @@ EXPORT_SYMBOL_GPL(stmmac_remove_config_dt);
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
+	char irq_name[8];
+	int i;
+
 	memset(stmmac_res, 0, sizeof(*stmmac_res));
 
 	/* Get IRQ information early to have an ability to ask for deferred
@@ -738,6 +741,26 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
 	}
 
+	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
+		snprintf(irq_name, sizeof(irq_name), "rx%i", i);
+		stmmac_res->rx_irq[i] = platform_get_irq_byname_optional(pdev, irq_name);
+		if (stmmac_res->rx_irq[i] < 0) {
+			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			break;
+		}
+	}
+
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+		snprintf(irq_name, sizeof(irq_name), "tx%i", i);
+		stmmac_res->tx_irq[i] = platform_get_irq_byname_optional(pdev, irq_name);
+		if (stmmac_res->tx_irq[i] < 0) {
+			if (stmmac_res->tx_irq[i] == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			break;
+		}
+	}
+
 	stmmac_res->sfty_ce_irq = platform_get_irq_byname_optional(pdev, "sfty_ce");
 	if (stmmac_res->sfty_ce_irq < 0) {
 		if (stmmac_res->sfty_ce_irq == -EPROBE_DEFER)
-- 
2.40.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
