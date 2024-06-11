Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7959036BE
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Jun 2024 10:39:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27488C78004;
	Tue, 11 Jun 2024 08:39:13 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B02FC78003
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Jun 2024 08:39:12 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B7dlRR027839;
 Tue, 11 Jun 2024 10:38:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 tczm6qTSViwTLH/qT7QMjrs9/mSv8f7on1Dp4y1LX4Y=; b=5qz/Ktyq7Fb9YXER
 6RKJK2KEiwQ241jF+xpYRg1WHe07I4m5CZf0MupFPjohySQ91g9sKUWUVqvOsTq7
 e9HtNBNDneSaU6c+nK5+UqaURUocMY6XJQcdjVUibsBzMszYksnrgPIOeYwo4jum
 xF9uzVY6TJrAOkdChq/GrrzBUjY7k7KPOmd9HPMYPIrW1cSBhmOerMElNfzybJwj
 d3myGoAwpIiuywHfkYcFGLNG+wwbBuW0byIqRtBG5YUk7cQSzABIP5oYa2uyBm3t
 IhS52WqIk7etdt9cGvCwC5ctqKN+2LjZJoXJQfI0f5rPI/8ArgWGvWIcJyJ0UbVt
 fc69lQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ypbp29s9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Jun 2024 10:38:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EBA684002D;
 Tue, 11 Jun 2024 10:38:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E7CC21160A;
 Tue, 11 Jun 2024 10:37:35 +0200 (CEST)
Received: from localhost (10.48.86.164) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 11 Jun
 2024 10:37:34 +0200
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>, Marek Vasut <marex@denx.de>
Date: Tue, 11 Jun 2024 10:36:06 +0200
Message-ID: <20240611083606.733453-9-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240611083606.733453-1-christophe.roullier@foss.st.com>
References: <20240611083606.733453-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.164]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_04,2024-06-11_01,2024-05-17_01
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [Linux-stm32] [net-next,
	PATCH v7 8/8] net: stmmac: dwmac-stm32: add management of stm32mp13
	for stm32
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
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 32 ++++++++++++++++---
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 09ff0be0bdcdc..b2db0e26c4e45 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -104,6 +104,7 @@ struct stm32_ops {
 	int (*parse_data)(struct stm32_dwmac *dwmac,
 			  struct device *dev);
 	bool clk_rx_enable_in_suspend;
+	bool is_mp13;
 	u32 syscfg_clr_off;
 };
 
@@ -224,11 +225,18 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
 	u32 reg = dwmac->mode_reg;
-	int val;
+	int val = 0;
 
 	switch (plat_dat->mac_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		val = SYSCFG_PMCR_ETH_SEL_MII;
+		/*
+		 * STM32MP15xx supports both MII and GMII, STM32MP13xx MII only.
+		 * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15xx and
+		 * acts as a selector between 0:GMII and 1:MII. As STM32MP13xx
+		 * supports only MII, ETH_SELMII is not present.
+		 */
+		if (!dwmac->ops->is_mp13)  /* Select MII mode on STM32MP15xx */
+			val |= SYSCFG_PMCR_ETH_SEL_MII;
 		break;
 	case PHY_INTERFACE_MODE_GMII:
 		val = SYSCFG_PMCR_ETH_SEL_GMII;
@@ -359,8 +367,12 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac *dwmac,
 
 	dwmac->mode_mask = SYSCFG_MP1_ETH_MASK;
 	err = of_property_read_u32_index(np, "st,syscon", 2, &dwmac->mode_mask);
-	if (err)
-		dev_dbg(dev, "Warning sysconfig register mask not set\n");
+	if (err) {
+		if (dwmac->ops->is_mp13)
+			dev_err(dev, "Sysconfig register mask must be set (%d)\n", err);
+		else
+			dev_dbg(dev, "Warning sysconfig register mask not set\n");
+	}
 
 	return err;
 }
@@ -560,12 +572,24 @@ static struct stm32_ops stm32mp1_dwmac_data = {
 	.resume = stm32mp1_resume,
 	.parse_data = stm32mp1_parse_data,
 	.syscfg_clr_off = 0x44,
+	.is_mp13 = false,
+	.clk_rx_enable_in_suspend = true
+};
+
+static struct stm32_ops stm32mp13_dwmac_data = {
+	.set_mode = stm32mp1_set_mode,
+	.suspend = stm32mp1_suspend,
+	.resume = stm32mp1_resume,
+	.parse_data = stm32mp1_parse_data,
+	.syscfg_clr_off = 0x08,
+	.is_mp13 = true,
 	.clk_rx_enable_in_suspend = true
 };
 
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
