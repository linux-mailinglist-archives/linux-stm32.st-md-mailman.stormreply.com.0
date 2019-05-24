Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF96290E5
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 08:26:28 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C652FC5660F
	for <lists+linux-stm32@lfdr.de>; Fri, 24 May 2019 06:26:27 +0000 (UTC)
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 786CBC5660C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 May 2019 06:26:24 +0000 (UTC)
X-UUID: 11b01a1f3a6a4d4cb21edba42fb58a89-20190524
X-UUID: 11b01a1f3a6a4d4cb21edba42fb58a89-20190524
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 874709294; Fri, 24 May 2019 14:26:17 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 24 May 2019 14:26:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 24 May 2019 14:26:14 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: Jose Abreu <joabreu@synopsys.com>
Date: Fri, 24 May 2019 14:26:08 +0800
Message-ID: <1558679169-26752-3-git-send-email-biao.huang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1558679169-26752-1-git-send-email-biao.huang@mediatek.com>
References: <1558679169-26752-1-git-send-email-biao.huang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 86EFF50A2E3E7471BBF624373C15CF06603E1AF3736B7DA1286DF202D2EDBB822000:8
X-MTK: N
Cc: jianguo.zhang@mediatek.comi, biao.huang@mediatek.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, boon.leong.ong@intel.com,
 yt.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [v4,
	PATCH 2/3] net: stmmac: fix csr_clk can't be zero issue
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

The specific clk_csr value can be zero, and
stmmac_clk is necessary for MDC clock which can be set dynamically.
So, change the condition from plat->clk_csr to plat->stmmac_clk to
fix clk_csr can't be zero issue.

Fixes: cd7201f477b9 ("stmmac: MDC clock dynamically based on the csr clock input")
Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |    6 +++---
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |    5 ++++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 06487a6..b2feb6c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4380,10 +4380,10 @@ int stmmac_dvr_probe(struct device *device,
 	 * set the MDC clock dynamically according to the csr actual
 	 * clock input.
 	 */
-	if (!priv->plat->clk_csr)
-		stmmac_clk_csr_set(priv);
-	else
+	if (priv->plat->clk_csr >= 0)
 		priv->clk_csr = priv->plat->clk_csr;
+	else
+		stmmac_clk_csr_set(priv);
 
 	stmmac_check_pcs_mode(priv);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 3031f2b..f45bfbe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -408,7 +408,10 @@ struct plat_stmmacenet_data *
 	/* Default to phy auto-detection */
 	plat->phy_addr = -1;
 
-	/* Get clk_csr from device tree */
+	/* Default to get clk_csr from stmmac_clk_crs_set(),
+	 * or get clk_csr from device tree.
+	 */
+	plat->clk_csr = -1;
 	of_property_read_u32(np, "clk_csr", &plat->clk_csr);
 
 	/* "snps,phy-addr" is not a standard property. Mark it as deprecated
-- 
1.7.9.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
