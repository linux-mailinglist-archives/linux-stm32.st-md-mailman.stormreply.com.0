Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C25D084C
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Oct 2019 09:31:50 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 881B1C36B0C;
	Wed,  9 Oct 2019 07:31:50 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86B17C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Oct 2019 07:31:48 +0000 (UTC)
X-UUID: fc0c3191f177453c81ef62b7eb8b4885-20191009
X-UUID: fc0c3191f177453c81ef62b7eb8b4885-20191009
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw01.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 415846299; Wed, 09 Oct 2019 15:31:43 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 9 Oct 2019 15:31:38 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 9 Oct 2019 15:31:37 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>, <andrew@lunn.ch>
Date: Wed, 9 Oct 2019 15:31:29 +0800
Message-ID: <20191009073129.5439-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: B285750855EC341362F90DB9DFAED3B70120BD807D577E25220679B16259FE2E2000:8
X-MTK: N
Cc: jianguo.zhang@mediatek.com, boon.leong.ong@intel.com,
 biao.huang@mediatek.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 yt.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net: stmmac: dwmac-mediatek: fix wrong delay
	value issue when resume back
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

mac_delay value will be divided by 550/170 in mt2712_delay_stage2ps(),
which is invoked at the beginning of mt2712_set_delay(), and the value
should be restored at the end of mt2712_set_delay().
Or, mac_delay will be divided again when invoking mt2712_set_delay()
when resume back.
So, add mt2712_delay_ps2stage() to mt2712_set_delay() to recovery the
original mac_delay value.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 79f2ee37afed..cea7a0c7ce68 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -130,6 +130,31 @@ static void mt2712_delay_ps2stage(struct mediatek_dwmac_plat_data *plat)
 	}
 }
 
+static void mt2712_delay_stage2ps(struct mediatek_dwmac_plat_data *plat)
+{
+	struct mac_delay_struct *mac_delay = &plat->mac_delay;
+
+	switch (plat->phy_mode) {
+	case PHY_INTERFACE_MODE_MII:
+	case PHY_INTERFACE_MODE_RMII:
+		/* 550ps per stage for MII/RMII */
+		mac_delay->tx_delay *= 550;
+		mac_delay->rx_delay *= 550;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+		/* 170ps per stage for RGMII */
+		mac_delay->tx_delay *= 170;
+		mac_delay->rx_delay *= 170;
+		break;
+	default:
+		dev_err(plat->dev, "phy interface not supported\n");
+		break;
+	}
+}
+
 static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 {
 	struct mac_delay_struct *mac_delay = &plat->mac_delay;
@@ -199,6 +224,8 @@ static int mt2712_set_delay(struct mediatek_dwmac_plat_data *plat)
 	regmap_write(plat->peri_regmap, PERI_ETH_DLY, delay_val);
 	regmap_write(plat->peri_regmap, PERI_ETH_DLY_FINE, fine_val);
 
+	mt2712_delay_stage2ps(plat);
+
 	return 0;
 }
 
-- 
2.18.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
