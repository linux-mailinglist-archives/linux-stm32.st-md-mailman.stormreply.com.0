Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDCE822AB2
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Jan 2024 10:57:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2716BC6DD7E;
	Wed,  3 Jan 2024 09:57:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 796F2C6B46B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 22 Dec 2023 05:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703223976; x=1734759976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n0Gp5OLNE//xWw9yHCmOFyQdR4GTfHiilxz7KaWheEQ=;
 b=kAjYgkGktzAQ64O1AU9/I3fCUeGFI7LoUYIJlhTgegfvWbDhApAeUbGt
 ZGT01Ec04l7xx1vZbF8Pah4nmfq/dzgtvPv00jQsTYhdYQfPhqnV04yUD
 OA7DfB/IwwzugwCDqMqKU+Bb0miesZEVzRQKIyTaOY/4yS/Ek5R4eKEUO
 e0Ez7C3SNwM0/Unm8UpsAEj8Ib284k2NDTh2yW1vVsQZflkaxBzBdiRLq
 MD4Y73js5syFFEkBQuCbEzj3tEaYfBnSzs0h8/e4zZJQqsGh08jC1kN4r
 faC/yS2n4udPQ09kRGyaGwlzSvu9JIK50qiSHbK2X2GCeN1SXlrJ04itD w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="9470581"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; 
   d="scan'208";a="9470581"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 21:46:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="900324224"
X-IronPort-AV: E=Sophos;i="6.04,294,1695711600"; d="scan'208";a="900324224"
Received: from pg-esw-build.png.intel.com ([10.226.214.57])
 by orsmga004.jf.intel.com with ESMTP; 21 Dec 2023 21:46:09 -0800
From: Leong Ching Swee <leong.ching.swee@intel.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Date: Fri, 22 Dec 2023 13:44:50 +0800
Message-Id: <20231222054451.2683242-4-leong.ching.swee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231222054451.2683242-1-leong.ching.swee@intel.com>
References: <20231222054451.2683242-1-leong.ching.swee@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Jan 2024 09:57:54 +0000
Cc: devicetree@vger.kernel.org, Teoh Ji Sheng <ji.sheng.teoh@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v1 3/4] net: stmmac: Add support for
	TX/RX channel interrupt
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

From: Swee Leong Ching <leong.ching.swee@intel.com>

Enable TX/RX channel interrupt registration for MAC that interrupts CPU
through shared peripheral interrupt (SPI).

Per channel interrupts and interrupt-names are registered through,
Eg: 4 tx and 4 rx channels:
interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
             <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
             <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>;
             <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
             <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
             <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
interrupt-names = "dma_tx0",
                  "dma_tx1",
                  "dma_tx2",
                  "dma_tx3",
                  "dma_rx0",
                  "dma_rx1",
                  "dma_rx2",
                  "dma_rx3";

Signed-off-by: Teoh Ji Sheng <ji.sheng.teoh@intel.com>
Signed-off-by: Swee Leong Ching <leong.ching.swee@intel.com>
---
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 70eadc83ca68..f857907f13a0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -710,6 +710,8 @@ EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
+	char irq_name[8];
+	int i;
 	memset(stmmac_res, 0, sizeof(*stmmac_res));
 
 	/* Get IRQ information early to have an ability to ask for deferred
@@ -719,6 +721,28 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 	if (stmmac_res->irq < 0)
 		return stmmac_res->irq;
 
+	/* For RX Channel */
+	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
+		snprintf(irq_name, sizeof(irq_name), "dma_rx%i", i);
+		stmmac_res->rx_irq[i] = platform_get_irq_byname_optional(pdev, irq_name);
+		if (stmmac_res->rx_irq[i] < 0) {
+			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			break;
+		}
+	}
+
+	/* For TX Channel */
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+		snprintf(irq_name, sizeof(irq_name), "dma_tx%i", i);
+		stmmac_res->tx_irq[i] = platform_get_irq_byname_optional(pdev, irq_name);
+		if (stmmac_res->tx_irq[i] < 0) {
+			if (stmmac_res->rx_irq[i] == -EPROBE_DEFER)
+				return -EPROBE_DEFER;
+			break;
+		}
+	}
+
 	/* On some platforms e.g. SPEAr the wake up irq differs from the mac irq
 	 * The external wake up irq can be passed through the platform code
 	 * named as "eth_wake_irq"
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
