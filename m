Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1347B1C40
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 14:26:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46B17C6B473;
	Thu, 28 Sep 2023 12:26:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9C805C6B462
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 12:26:03 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38S8kbbg029789; Thu, 28 Sep 2023 14:25:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:content-type; s=
 selector1; bh=tCZxZAAY+Gn9wAA1qw22DEBm15B9XqamItmDNiDWxRA=; b=3T
 hKsGtN3FHsNkACWq8RTC+Eb//Ldd6YaKS2h5AWlZfUQQn/8GCAuA/1MNTDot/g0u
 jgy68t2kWg9lgiTXaL9o2RspXGDqVhtlGH2am2gjPTgEPl7TOqVBI0gajfbJlZ1y
 qp0GtBqaXDUHNx2S2XJ5cJ+lk58M5OGoPv1m+OPULIUHLG5PrGkl409S+l5kJ+og
 TyVJrW6V5y1bNZbQw1IgSHYKqhzt1/02hiRPX9+IqiC3tm3VbRQL3TgJ4pqYNI/H
 1mKP/Ve0qPP2VGFpi/WF2hckTid1839AbESqi3RzaJzYOYZGjECTQ6eD1uCIzVgK
 L/Sj20hQhZxF8BMVFSHA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3tcq63c405-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Sep 2023 14:25:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0FA09100058;
 Thu, 28 Sep 2023 14:25:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 04E202309E5;
 Thu, 28 Sep 2023 14:25:47 +0200 (CEST)
Received: from localhost (10.201.21.249) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 14:25:46 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
Date: Thu, 28 Sep 2023 14:24:20 +0200
Message-ID: <20230928122427.313271-6-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230928122427.313271-1-christophe.roullier@foss.st.com>
References: <20230928122427.313271-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.201.21.249]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_11,2023-09-28_01,2023-05-22_02
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 05/12] net: ethernet: stmmac: add
	management of stm32mp13 for stm32
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

From: Christophe Roullier <christophe.roullier@st.com>

Add Ethernet support for STM32MP13.
STM32MP13 is STM32 SOC with 2 GMACs instances.
GMAC IP version is SNPS 4.20.
GMAC IP configure with 1 RX and 1 TX queue.
DMA HW capability register supported
RX Checksum Offload Engine supported
TX Checksum insertion supported
Wake-Up On Lan supported
TSO supported

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 52106e0d7359f..a071dc6ffc95b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -537,9 +537,30 @@ static struct stm32_ops stm32mp1_dwmac_data = {
 	}
 };
 
+static struct stm32_ops stm32mp13_dwmac_data = {
+	.set_mode = stm32mp1_set_mode,
+	.clk_prepare = stm32mp1_clk_prepare,
+	.suspend = stm32mp1_suspend,
+	.resume = stm32mp1_resume,
+	.parse_data = stm32mp1_parse_data,
+	.syscfg_clr_off = 0x08,
+	.pmcsetr = {
+		.eth1_clk_sel		= BIT(16),
+		.eth1_ref_clk_sel	= BIT(17),
+		.eth1_selmii		= 0,
+		.eth1_sel_rgmii		= BIT(21),
+		.eth1_sel_rmii		= BIT(23),
+		.eth2_clk_sel		= BIT(24),
+		.eth2_ref_clk_sel	= BIT(25),
+		.eth2_sel_rgmii		= BIT(29),
+		.eth2_sel_rmii		= BIT(31)
+	}
+};
+
 static const struct of_device_id stm32_dwmac_match[] = {
 	{ .compatible = "st,stm32-dwmac", .data = &stm32mcu_dwmac_data},
 	{ .compatible = "st,stm32mp1-dwmac", .data = &stm32mp1_dwmac_data},
+	{ .compatible = "st,stm32mp13-dwmac", .data = &stm32mp13_dwmac_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, stm32_dwmac_match);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
