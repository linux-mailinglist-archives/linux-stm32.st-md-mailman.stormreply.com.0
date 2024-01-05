Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BA0824EF7
	for <lists+linux-stm32@lfdr.de>; Fri,  5 Jan 2024 08:10:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BCBF5C6C83C;
	Fri,  5 Jan 2024 07:10:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 788E1C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  5 Jan 2024 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704438602; x=1735974602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yI3vAwPncbVLavG81fYMbPZSPJAY88eIPqNf+iXAeL4=;
 b=M0IZmEE4wue+wkSmnCrPdzmHsdpi3NU8BAzDjTJHNxHDpdqOjigIzXtV
 hvx5z3kvzpIXX/usyWT1TJypgA53dguNrY78xbl05G8ViOHPDUSq9kw/K
 FYbT//XXA2F6dzitgdC0LDrW4XsMgeXidIkEo2oEnm+0obequswqlOeec
 IBTRQiz0PGMRxMQzSQmhka1R7JwxrYwfja5Xh6al6PA7Ef7K8F/BMG9Kj
 7Md4ac8qiyuYOHm4JMpedIUOhgbxKC+YRG2UofqY+vVdHSsXVA+V1PYto
 lDOderL+6ZF8yqTvnVHCT990bkzbBEhDo9uQgJI0FUo1uanPrwva+NqD2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="463845869"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="463845869"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 23:10:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="871167308"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="871167308"
Received: from pg-esw-build.png.intel.com ([10.226.214.65])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Jan 2024 23:09:57 -0800
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
Date: Fri,  5 Jan 2024 15:09:24 +0800
Message-Id: <20240105070925.2948871-4-leong.ching.swee@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240105070925.2948871-1-leong.ching.swee@intel.com>
References: <20240105070925.2948871-1-leong.ching.swee@intel.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Teoh Ji Sheng <ji.sheng.teoh@intel.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Swee Leong Ching <leong.ching.swee@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 3/4] net: stmmac: Add support for
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
 .../ethernet/stmicro/stmmac/stmmac_platform.c | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 70eadc83ca68..ae6859153e98 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -710,6 +710,10 @@ EXPORT_SYMBOL_GPL(devm_stmmac_probe_config_dt);
 int stmmac_get_platform_resources(struct platform_device *pdev,
 				  struct stmmac_resources *stmmac_res)
 {
+	char irq_name[9];
+	int i;
+	int irq;
+
 	memset(stmmac_res, 0, sizeof(*stmmac_res));
 
 	/* Get IRQ information early to have an ability to ask for deferred
@@ -743,6 +747,30 @@ int stmmac_get_platform_resources(struct platform_device *pdev,
 		dev_info(&pdev->dev, "IRQ eth_lpi not found\n");
 	}
 
+	/* For RX Channel */
+	for (i = 0; i < MTL_MAX_RX_QUEUES; i++) {
+		snprintf(irq_name, sizeof(irq_name), "dma_rx%i", i);
+		irq = platform_get_irq_byname_optional(pdev, irq_name);
+		if (irq == -EPROBE_DEFER)
+			return irq;
+		else if (irq < 0)
+			break;
+
+		stmmac_res->rx_irq[i] = irq;
+	}
+
+	/* For TX Channel */
+	for (i = 0; i < MTL_MAX_TX_QUEUES; i++) {
+		snprintf(irq_name, sizeof(irq_name), "dma_tx%i", i);
+		irq = platform_get_irq_byname_optional(pdev, irq_name);
+		if (irq == -EPROBE_DEFER)
+			return irq;
+		else if (irq < 0)
+			break;
+
+		stmmac_res->tx_irq[i] = irq;
+	}
+
 	stmmac_res->addr = devm_platform_ioremap_resource(pdev, 0);
 
 	return PTR_ERR_OR_ZERO(stmmac_res->addr);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
