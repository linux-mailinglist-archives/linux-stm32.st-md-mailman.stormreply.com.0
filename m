Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118C6C39F2
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Mar 2023 20:10:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4EF96C6A5EF;
	Tue, 21 Mar 2023 19:10:02 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2081.outbound.protection.outlook.com [40.107.105.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5DC74C65049
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Mar 2023 19:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7/FWA/bI1QtRJzsCM0AVWzO/QOI1V9wHyStWJ1DAVDriMvWfspypGzt+kUFelkaXm+70gcOBX8+CrO9bfWewmIZzoafMiVU6LI+sgLlFoG9fr6NIXiF6pGG0eYsODQsuTvX9fR+kvQ1RmDSSNbIrZJiFAscf0LoOlVx0Wm5XZd7xKh4LDtdSjbTCdkm7O6AXeAhESLtIjkhRo4F5z+331hqo8rUoOkJcdCj1ibkUw966FGubpvFLKpHtxQ2tUiz92IVTjIbAUTMYGuVGiVL7vrwFv6J/e/7SVLtHb/KFqK02mkTfCcohqk7E2v1LDjPlgDdKfCSgoFIjjqiGjTK6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yl/Nal0PpgBFmmyQJ3enEWiLymBs3mGdmq4D2SJEd18=;
 b=JbKzMqSj7DX4UBd3MXa1zKEMBPs+DS/Wb1pRnVTPuFQwDNxGyLED8wXhKrmEf5819ldiuVH5K+8J4wcrbhLy/UBTLFSu/SqfO3yIRV/995FXze1m15AU5dw4uiRjAbVJK2GkMfI+D4/XktsEFvOFpF24S8ONtnhoZak9yY70zx4+dOP+6xt5gC8GGh97fbiVN7cX6cZXldD8Co0IGi8KsV8zu+FTPT1yZaknBZFTO9Spfai1kk4GKrpbvy5SiHnJbDzBZHPouBGdsRUABAjPrYuf1e8YFNscu+85kJ0+eyqf/2sq0gMhO/cSkbIy7nUraoRTGOn1E1jIBZcFkt+M/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yl/Nal0PpgBFmmyQJ3enEWiLymBs3mGdmq4D2SJEd18=;
 b=SkzoeoiRzwkqJkNH5jh59OEKQbHNWshdySSSax0lq6NgUa4OKetETML+We3w9BJ33+Eq+0HKugENYiiq9FUDYFUu569rCe1KlLhtHwneT/c+OC976TWi1c+YckQMj5UDCzfwfWSU9of+McH2DXJ8jvnKTPJtrHiBO8Dizj1HnFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 19:09:59 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::31d:b51c:db92:cb15]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::31d:b51c:db92:cb15%8]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 19:09:59 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
Date: Tue, 21 Mar 2023 14:09:21 -0500
Message-Id: <20230321190921.3113971-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230321190921.3113971-1-shenwei.wang@nxp.com>
References: <20230321190921.3113971-1-shenwei.wang@nxp.com>
X-ClientProxiedBy: SJ0PR05CA0208.namprd05.prod.outlook.com
 (2603:10b6:a03:330::33) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be0a17b-9435-4dab-1ba3-08db2a3fdcff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ae4UbhwdaTC+qwpkquInJUgCqjDUYzw3TEyPz/XfRsHCQZ7Bdap7ra+OatuvoVemeUlfU9fEvbsHnzj14qEHBU9JFo0iqS6W6/Bx8nsZwzglqbBT+nX7JP1w+QhhaQ0Z/uKyWn41LdpNnK/2dIL9nl5U8GeYCEyibRrpVuQSoxjaMV1Xeyql5LyaNWsOK4yOOTPJlzLlDanIsn9EFlTHfFRfwV90ZNnjb9IW3ALleR6onmH5oDjD+BOxIkQ6gdCM7DBvb07Tj0u8+17kW+7inQC3VofBdHRxkKEcTasJLWKI3NrKnML0ZutrEfcd90gPgEKHoEBGILV3pIsNbdFRbYI+XqWabX9vkoJ3NfXJdLpgYRdu8tl4u/9ZUseHlZDDOESxZok5rHGFIwtwB0TTsZyUhS8pW8h7pUqYP+mXEVN5lz3NpdghSKmF4QJKcUQxnbajSUBS5Zm5iDz2TOMs9YPEJBTAt0shzLF/+fpo/GXFyXi74V0mlOQ2wx2VRzccJ1jlGGCSFQcSiz+K/ydkOTYgLaOBy88hpM1hAh1SJhRV2pKMA3e61GMRUeXl7WGNkxjpcCkuiIsktgbDD8uBkwyrPW61TtoSl+3rDhfIBx5r+HCKi99oh+aAKJO2ygnb6Dhy74rj7QWzlgrLToTUQMXCD0wSijhcB09CxniC+wjatmbyHM8X/TqprdvM+2YpX6+UNAdvs8xUXaO3PVp7WA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(6029001)(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199018)(54906003)(83380400001)(2616005)(6636002)(52116002)(6512007)(6506007)(6486002)(478600001)(7416002)(110136005)(26005)(6666004)(1076003)(55236004)(186003)(5660300002)(316002)(44832011)(38350700002)(38100700002)(86362001)(2906002)(8936002)(66946007)(36756003)(4326008)(66556008)(8676002)(41300700001)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g3LvobxIpNTCeyU0zhbrmVH+ZYUiL1d69AbEJTacrM6B5D2XJU7L8dW8LjRB?=
 =?us-ascii?Q?v7nn0cVc0U3n7h20aYFId/O5mCKU9y1IkpMb+cz8Wg2zcWf4/eSqQIY/+PyC?=
 =?us-ascii?Q?zKj+Tr8WIUXvFc55q+LhlY8XQ61VAI8QqcQcnHerxiCdu3hyHrJxPPGTH9/4?=
 =?us-ascii?Q?F/FhOProTKstFdWvayla48KYEWM4rcTcZbq8r6YegXS+CS6lhT5KvDs0kZ2h?=
 =?us-ascii?Q?O3w46TxWfFbp0nTzvesvaLiI+T067An1KbjRWxNtyW4IAq7DgheYJXSOMTia?=
 =?us-ascii?Q?1fnqy8saN9XP4zUqP0ekJsuHnfGDkULd4OE2xLWozF2bJb/cNpbM73vjKT/F?=
 =?us-ascii?Q?YM0cILx1z9zFn5Ao2EF8u+TkO5BP4CAftZ+GUr21pDJeLeKiAjD2BQ9ncxDe?=
 =?us-ascii?Q?DXGYBvdgIi252KO49i7uJN8944xGtfiLU4KjgXjTL9RDa7H5PX/xwhPBC5Y4?=
 =?us-ascii?Q?JxWsMteGPAwtLZt5Z3WtEOpX5YOueEwMCCCXRgsMjbIyKEUetQlS+7X6Olay?=
 =?us-ascii?Q?sPFAuOU2W9qgEga+5Bk4iKTpn+Zm2t+XQZLplXVzodk8MotlsuOaoU+MwElC?=
 =?us-ascii?Q?mS4kfmFCHmoVnC98dlo3dyMmH4usfnYcxxBfPlqVjHQf7vYn87vWzEF/fxph?=
 =?us-ascii?Q?he2DP2NSZDN2tte/lr3gpg285k290O88upDc9f06JxyHaUJr8UXGP+eW8ITX?=
 =?us-ascii?Q?r3RgkbQqEaWTuYOKvk5swXO1Z36rBg/ENQ4pzR3OI17+HBQ9F+a07+rZdYZR?=
 =?us-ascii?Q?xsHsdnxTbnJeqRPHyhNbdHYcogjJ9gCeN+7BqlrVoGZhM3ylN15knXk1SG5w?=
 =?us-ascii?Q?kQKJzThRM374uJ4593eRTfXx1hIAqiV5IlACRLaExLuolAhYVAYWkCBY16qQ?=
 =?us-ascii?Q?T8AHaZXffWKOmvhXdmfn+DsFGVt7fvyLMbULBCajcWKtw6mF/8EGmBRAbanE?=
 =?us-ascii?Q?jK50yr3zSewzp6hgwrOcRC6PRDJGXyo65daAxNOiLxAlb51HolmYO0fxitm1?=
 =?us-ascii?Q?oNlCZGqAgWcMcEHv5Glt0ASEEymyGEf+n1klRoN8aNlbl6rz9tG4jItF/9HS?=
 =?us-ascii?Q?T4E6jEi8DcueQLUVsfpNNFw/LlPS2mAkp8BTzBitxiyYLR1BaikqSZMYP1R3?=
 =?us-ascii?Q?mEvJKFFC2X8Cg8VqHh0a4DRuctbF6AJKvtBO8uFStoMIvxA4TE6uXh86cLoB?=
 =?us-ascii?Q?Y6fqG7u4lGrPQTzoT5ffdddZuFfyj1R3Al1+ncAIaQ0otMS7vKxONRX1RTQT?=
 =?us-ascii?Q?DNxhDpo4j/SijHbiJShJr0VEOrA/rL2lSr83vljtQO0YKC0FHoap6lUfZ8xO?=
 =?us-ascii?Q?igehToPnuDLfW8kauGtyyqVTG+BvRO7Sk8864f0N5SlSbjqUSinSrqVSSAJ8?=
 =?us-ascii?Q?+54SEYijgc1sM63noq17Ql1XcJXLKaHnbY7UxJXhbB6tt+//GlXiLfzgNoAY?=
 =?us-ascii?Q?TzOhiwA1+cYQE49mfL5pou5p8msSDpA1lLq61wjzVXLa8DetoM8mIIJjnAZQ?=
 =?us-ascii?Q?1jOQrDkP8eA4TpRRC3xe4fbWjvweHA295VLRJBBRmZZ3YwGcKGrrdrewCjKm?=
 =?us-ascii?Q?9a4lxX2arl4/Tr+ulCrn8NO6vi9f7jokYSUM98I+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be0a17b-9435-4dab-1ba3-08db2a3fdcff
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 19:09:58.9738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yi03taI5uFGHu+9OQlEzoztUBf44vGLBJwshl1qay9L3K8yRsjssIABGXpc8Qf0OjVzUarLthS1vN+zKqwDknw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348
Cc: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 imx@lists.linux.dev, Tan Tee Min <tee.min.tan@linux.intel.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Jon Hunter <jonathanh@nvidia.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] net: stmmac: dwmac-imx: use platform
	specific reset for imx93 SoCs
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

The patch addresses an issue with the reset logic on the i.MX93 SoC, which
requires configuration of the correct interface speed under RMII mode to
complete the reset. The patch implements a fix_soc_reset function and uses
it specifically for the i.MX93 SoCs.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-imx.c   | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index ac8580f501e2..3329150010ce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -19,9 +19,9 @@
 #include <linux/pm_wakeirq.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-#include <linux/stmmac.h>
 
 #include "stmmac_platform.h"
+#include "common.h"
 
 #define GPR_ENET_QOS_INTF_MODE_MASK	GENMASK(21, 16)
 #define GPR_ENET_QOS_INTF_SEL_MII	(0x0 << 16)
@@ -37,6 +37,10 @@
 #define MX93_GPR_ENET_QOS_INTF_SEL_RGMII	(0x1 << 1)
 #define MX93_GPR_ENET_QOS_CLK_GEN_EN		(0x1 << 0)
 
+#define DMA_BUS_MODE			0x00001000
+#define DMA_BUS_MODE_SFT_RESET		(0x1 << 0)
+#define RMII_RESET_SPEED		(0x3 << 14)
+
 struct imx_dwmac_ops {
 	u32 addr_width;
 	bool mac_rgmii_txclk_auto_adj;
@@ -207,6 +211,24 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed)
 		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
 }
 
+static int imx_dwmac_mx93_reset(void *priv, void __iomem *ioaddr)
+{
+	struct plat_stmmacenet_data *plat_dat = priv;
+	u32 value = readl(ioaddr + DMA_BUS_MODE);
+
+	/* DMA SW reset */
+	value |= DMA_BUS_MODE_SFT_RESET;
+	writel(value, ioaddr + DMA_BUS_MODE);
+
+	usleep_range(100, 200);
+	if (plat_dat->interface == PHY_INTERFACE_MODE_RMII)
+		writel(RMII_RESET_SPEED, ioaddr + MAC_CTRL_REG);
+
+	return readl_poll_timeout(ioaddr + DMA_BUS_MODE, value,
+				 !(value & DMA_BUS_MODE_SFT_RESET),
+				 10000, 1000000);
+}
+
 static int
 imx_dwmac_parse_dt(struct imx_priv_data *dwmac, struct device *dev)
 {
@@ -305,6 +327,9 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_dwmac_init;
 
+	if (of_machine_is_compatible("fsl,imx93"))
+		dwmac->plat_dat->fix_soc_reset = imx_dwmac_mx93_reset;
+
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
 		goto err_drv_probe;
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
