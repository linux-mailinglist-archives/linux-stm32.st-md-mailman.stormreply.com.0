Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7756903E0
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Feb 2023 10:33:55 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7F48DC6A600;
	Thu,  9 Feb 2023 09:33:55 +0000 (UTC)
Received: from mr85p00im-ztdg06021801.me.com (mr85p00im-ztdg06021801.me.com
 [17.58.23.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1DE5C6A5E9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Feb 2023 09:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1675934345; bh=Yv+aNQTOHIB7qRjwbmhigngM9kFtfMeoMgBiuYQtyTc=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=oBFHuOqplvPaB63OfWHRSYdmhJyYEYuM64AGUaaBl1O9cDGOgkRm1Md9X2qfrF4Yb
 cNz0TzPvmowvMZJclQB7q20wOlUdM9FyImDauKzGV8RQBoi95qNIoPHcV5yfLNh+r/
 vrOgEvUpTrDjsa+N3wKz7AMoBx0vdz2xODUb2uLlX5u3FoUlSP/DAJotIuTq7ffHmx
 loB19SNpknN+bJRB6rQSAzEjc8fYLEaKmd8bFy5WboTd2EiURLhGE+8JGhRPH32TJQ
 jo56V1Jy4Nfph7kVKWThxswd2D1+l+pHOAjF5LzmoSfiCXh11WUKgMOc9pE5RRtW24
 PKcyexmRmtGtA==
Received: from localhost (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
 by mr85p00im-ztdg06021801.me.com (Postfix) with ESMTPSA id
 F2AFAD02A13; Thu,  9 Feb 2023 09:19:04 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu,  9 Feb 2023 10:16:55 +0100
Message-Id: <20230209091659.1409-8-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209091659.1409-1-avolmat@me.com>
References: <20230209091659.1409-1-avolmat@me.com>
MIME-Version: 1.0
X-Proofpoint-GUID: cbkkKnxBitPfqUkYra3jifKFBB60-BQq
X-Proofpoint-ORIG-GUID: cbkkKnxBitPfqUkYra3jifKFBB60-BQq
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 bulkscore=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302090088
X-Mailman-Approved-At: Thu, 09 Feb 2023 09:33:54 +0000
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Alain Volmat <avolmat@me.com>
Subject: [Linux-stm32] [PATCH 07/11] net: ethernet: stmmac: dwmac-sti:
	remove stih415/stih416/stid127
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

Remove no more supported platforms (stih415/stih416 and stid127)

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 60 +------------------
 1 file changed, 1 insertion(+), 59 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 710d7435733e..3b424f4f95f9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -35,7 +35,7 @@
 #define IS_PHY_IF_MODE_GBIT(iface)	(IS_PHY_IF_MODE_RGMII(iface) || \
 					 iface == PHY_INTERFACE_MODE_GMII)
 
-/* STiH4xx register definitions (STiH415/STiH416/STiH407/STiH410 families)
+/* STiH4xx register definitions (STiH407/STiH410 families)
  *
  * Below table summarizes the clock requirement and clock sources for
  * supported phy interface modes with link speeds.
@@ -75,27 +75,6 @@
 #define STIH4XX_ETH_SEL_INTERNAL_NOTEXT_PHYCLK	BIT(7)
 #define STIH4XX_ETH_SEL_TXCLK_NOT_CLK125	BIT(6)
 
-/* STiD127 register definitions
- *-----------------------
- * src	 |BIT(6)| BIT(7)|
- *-----------------------
- * MII   |  1	|   n/a	|
- *-----------------------
- * RMII  |  n/a	|   1	|
- * clkgen|	|	|
- *-----------------------
- * RMII  |  n/a	|   0	|
- * phyclk|	|	|
- *-----------------------
- * RGMII |  1	|  n/a	|
- * clkgen|	|	|
- *-----------------------
- */
-
-#define STID127_RETIME_SRC_MASK			GENMASK(7, 6)
-#define STID127_ETH_SEL_INTERNAL_NOTEXT_PHYCLK	BIT(7)
-#define STID127_ETH_SEL_INTERNAL_NOTEXT_TXCLK	BIT(6)
-
 #define ENMII_MASK	GENMASK(5, 5)
 #define ENMII		BIT(5)
 #define EN_MASK		GENMASK(1, 1)
@@ -194,36 +173,6 @@ static void stih4xx_fix_retime_src(void *priv, u32 spd)
 			   stih4xx_tx_retime_val[src]);
 }
 
-static void stid127_fix_retime_src(void *priv, u32 spd)
-{
-	struct sti_dwmac *dwmac = priv;
-	u32 reg = dwmac->ctrl_reg;
-	u32 freq = 0;
-	u32 val = 0;
-
-	if (dwmac->interface == PHY_INTERFACE_MODE_MII) {
-		val = STID127_ETH_SEL_INTERNAL_NOTEXT_TXCLK;
-	} else if (dwmac->interface == PHY_INTERFACE_MODE_RMII) {
-		if (!dwmac->ext_phyclk) {
-			val = STID127_ETH_SEL_INTERNAL_NOTEXT_PHYCLK;
-			freq = DWMAC_50MHZ;
-		}
-	} else if (IS_PHY_IF_MODE_RGMII(dwmac->interface)) {
-		val = STID127_ETH_SEL_INTERNAL_NOTEXT_TXCLK;
-		if (spd == SPEED_1000)
-			freq = DWMAC_125MHZ;
-		else if (spd == SPEED_100)
-			freq = DWMAC_25MHZ;
-		else if (spd == SPEED_10)
-			freq = DWMAC_2_5MHZ;
-	}
-
-	if (freq)
-		clk_set_rate(dwmac->clk, freq);
-
-	regmap_update_bits(dwmac->regmap, reg, STID127_RETIME_SRC_MASK, val);
-}
-
 static int sti_dwmac_set_mode(struct sti_dwmac *dwmac)
 {
 	struct regmap *regmap = dwmac->regmap;
@@ -407,14 +356,7 @@ static const struct sti_dwmac_of_data stih4xx_dwmac_data = {
 	.fix_retime_src = stih4xx_fix_retime_src,
 };
 
-static const struct sti_dwmac_of_data stid127_dwmac_data = {
-	.fix_retime_src = stid127_fix_retime_src,
-};
-
 static const struct of_device_id sti_dwmac_match[] = {
-	{ .compatible = "st,stih415-dwmac", .data = &stih4xx_dwmac_data},
-	{ .compatible = "st,stih416-dwmac", .data = &stih4xx_dwmac_data},
-	{ .compatible = "st,stid127-dwmac", .data = &stid127_dwmac_data},
 	{ .compatible = "st,stih407-dwmac", .data = &stih4xx_dwmac_data},
 	{ }
 };
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
