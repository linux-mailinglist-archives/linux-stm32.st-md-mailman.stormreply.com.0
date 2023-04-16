Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D31486E3BBD
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Apr 2023 21:56:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D5F3C6B448;
	Sun, 16 Apr 2023 19:56:22 +0000 (UTC)
Received: from st43p00im-zteg10073501.me.com (st43p00im-zteg10073501.me.com
 [17.58.63.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D068BC6A61F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Apr 2023 19:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1681674979; bh=O2TgTgX7Cq2LJV67gutPlIPCO8dEwx+fpuc5YkEkMmg=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=XiM+52YdQzHlNrICnD+SpK/PumIEIs8y6iUR1ed6CEDCdOcJkhnx55KiZBI3ClnlR
 yt4rOX2A8yuFRrT7QadN9Wjsm/dycbOo7vNnI/0sfuycIH+MwwIzDO8mhLZ5n3set4
 l+JPOXApJelaJsInpXAQXEiH6gZpCZW+DgFT6aUvkxFGZ/zJjN+Z/igEp5wJpeoeX7
 WWJt46cw+Zg1gnIuVewk8LrJRxgdW6+MjO+JbxTHeKPEfI2SQ+uJ8vrQ+5Hx/BMhHU
 hV+jMVdnnuqa0lZPKLvUpyEfh6qohD7Xvv84a4V6myVVRuDshccQet2i5krPaAeLBm
 pbXbt3Gmo48JA==
Received: from localhost (st43p00im-dlb-asmtp-mailmevip.me.com [17.42.251.41])
 by st43p00im-zteg10073501.me.com (Postfix) with ESMTPSA id
 B440936071D; Sun, 16 Apr 2023 19:56:18 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sun, 16 Apr 2023 21:55:23 +0200
Message-Id: <20230416195523.61075-1-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-GUID: -BnxXXwNbnJuEUZ46-1HnoonediJYxBc
X-Proofpoint-ORIG-GUID: -BnxXXwNbnJuEUZ46-1HnoonediJYxBc
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-17=5F04:2020-02-14=5F02,2022-01-17=5F04,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2304160188
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Alain Volmat <avolmat@me.com>
Subject: [Linux-stm32] [PATCH] net: ethernet: stmmac: dwmac-sti: remove
	stih415/stih416/stid127
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
Acked-by: Jakub Kicinski <kuba@kernel.org>
---
Patch sent previously as part of serie: https://lore.kernel.org/all/20230209091659.1409-8-avolmat@me.com/

 .../net/ethernet/stmicro/stmmac/dwmac-sti.c   | 60 +------------------
 1 file changed, 1 insertion(+), 59 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index be3b1ebc06ab..465ce66ef9c1 100644
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
@@ -408,14 +357,7 @@ static const struct sti_dwmac_of_data stih4xx_dwmac_data = {
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
