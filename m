Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1F25733D7
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jul 2022 12:10:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2266CC64101;
	Wed, 13 Jul 2022 10:10:17 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0BA76C640FC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jul 2022 10:10:14 +0000 (UTC)
X-UUID: cd1f4f481c09423d86c2092588e9eb2c-20220713
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:737f2da4-67fc-4c70-b929-484b8e7a9de1, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:0f94e32, CLOUDID:31312e64-0b3f-4b2c-b3a6-ed5c044366a0,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: cd1f4f481c09423d86c2092588e9eb2c-20220713
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw01.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 927296812; Wed, 13 Jul 2022 18:10:07 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 13 Jul 2022 18:10:06 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 13 Jul 2022 18:10:04 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: David Miller <davem@davemloft.net>, Matthias Brugger
 <matthias.bgg@gmail.com>
Date: Wed, 13 Jul 2022 18:10:00 +0800
Message-ID: <20220713101002.10970-2-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713101002.10970-1-biao.huang@mediatek.com>
References: <20220713101002.10970-1-biao.huang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>, Jisheng
 Zhang <jszhang@kernel.org>, Biao
 Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eric
 Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [Linux-stm32] [PATCH net v4 1/3] stmmac: dwmac-mediatek: fix clock
	issue
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

The pm_runtime takes care of the clock handling in current
stmmac drivers, and dwmac-mediatek implement the
mediatek_dwmac_clks_config() as the callback for pm_runtime.

Then, stripping duplicated clocks handling in old init()/exit()
to fix clock issue in suspend/resume test.

As to clocks in probe/remove, vendor need symmetric handling to
ensure clocks balance.

Test pass, including suspend/resume and ko insertion/remove.

Fixes: 3186bdad97d5 ("stmmac: dwmac-mediatek: add platform level clocks management")
Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 49 ++++++++-----------
 1 file changed, 21 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 6ff88df58767..ca8ab290013c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -576,32 +576,7 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
 		}
 	}
 
-	ret = clk_bulk_prepare_enable(variant->num_clks, plat->clks);
-	if (ret) {
-		dev_err(plat->dev, "failed to enable clks, err = %d\n", ret);
-		return ret;
-	}
-
-	ret = clk_prepare_enable(plat->rmii_internal_clk);
-	if (ret) {
-		dev_err(plat->dev, "failed to enable rmii internal clk, err = %d\n", ret);
-		goto err_clk;
-	}
-
 	return 0;
-
-err_clk:
-	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
-	return ret;
-}
-
-static void mediatek_dwmac_exit(struct platform_device *pdev, void *priv)
-{
-	struct mediatek_dwmac_plat_data *plat = priv;
-	const struct mediatek_dwmac_variant *variant = plat->variant;
-
-	clk_disable_unprepare(plat->rmii_internal_clk);
-	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
 }
 
 static int mediatek_dwmac_clks_config(void *priv, bool enabled)
@@ -643,7 +618,6 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
 	plat->addr64 = priv_plat->variant->dma_bit_mask;
 	plat->bsp_priv = priv_plat;
 	plat->init = mediatek_dwmac_init;
-	plat->exit = mediatek_dwmac_exit;
 	plat->clks_config = mediatek_dwmac_clks_config;
 	if (priv_plat->variant->dwmac_fix_mac_speed)
 		plat->fix_mac_speed = priv_plat->variant->dwmac_fix_mac_speed;
@@ -712,13 +686,32 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 	mediatek_dwmac_common_data(pdev, plat_dat, priv_plat);
 	mediatek_dwmac_init(pdev, priv_plat);
 
+	ret = mediatek_dwmac_clks_config(priv_plat, true);
+	if (ret)
+		return ret;
+
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret) {
 		stmmac_remove_config_dt(pdev, plat_dat);
-		return ret;
+		goto err_drv_probe;
 	}
 
 	return 0;
+
+err_drv_probe:
+	mediatek_dwmac_clks_config(priv_plat, false);
+	return ret;
+}
+
+static int mediatek_dwmac_remove(struct platform_device *pdev)
+{
+	struct mediatek_dwmac_plat_data *priv_plat = get_stmmac_bsp_priv(&pdev->dev);
+	int ret;
+
+	ret = stmmac_pltfr_remove(pdev);
+	mediatek_dwmac_clks_config(priv_plat, false);
+
+	return ret;
 }
 
 static const struct of_device_id mediatek_dwmac_match[] = {
@@ -733,7 +726,7 @@ MODULE_DEVICE_TABLE(of, mediatek_dwmac_match);
 
 static struct platform_driver mediatek_dwmac_driver = {
 	.probe  = mediatek_dwmac_probe,
-	.remove = stmmac_pltfr_remove,
+	.remove = mediatek_dwmac_remove,
 	.driver = {
 		.name           = "dwmac-mediatek",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
