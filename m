Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E3B2F9A6
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2019 11:43:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6458CC55589
	for <lists+linux-stm32@lfdr.de>; Thu, 30 May 2019 09:43:35 +0000 (UTC)
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3C69C55586
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 May 2019 09:43:33 +0000 (UTC)
X-UUID: 34c1b09971504a898fb02dea42d2fcf6-20190530
X-UUID: 34c1b09971504a898fb02dea42d2fcf6-20190530
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by
 mailgw02.mediatek.com (envelope-from <biao.huang@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2029886013; Thu, 30 May 2019 17:43:29 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 May 2019 17:43:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 30 May 2019 17:43:26 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Jose Abreu <joabreu@synopsys.com>
Date: Thu, 30 May 2019 17:43:16 +0800
Message-ID: <1559209398-3607-3-git-send-email-biao.huang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1559209398-3607-1-git-send-email-biao.huang@mediatek.com>
References: <1559209398-3607-1-git-send-email-biao.huang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FF02FF3E28C90F7B4A400DA5EA20CF77D529F50EAA269A1FE346A2132AB260232000:8
X-MTK: N
Cc: andrew@lunn.ch, jianguo.zhang@mediatek.com, boon.leong.ong@intel.com,
 biao.huang@mediatek.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 yt.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [RESEND,
	PATCH 2/4] net: stmmac: dwmac-mediatek: disable rx watchdog
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

disable rx watchdog for dwmac-mediatek, then the hw will
issue a rx interrupt once receiving a packet, so the responding time
for rx path will be reduced.

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 3c7a60f..38cd054 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -356,6 +356,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 	plat_dat->has_gmac4 = 1;
 	plat_dat->has_gmac = 0;
 	plat_dat->pmt = 0;
+	plat_dat->riwt_off = 1;
 	plat_dat->maxmtu = ETH_DATA_LEN;
 	plat_dat->bsp_priv = priv_plat;
 	plat_dat->init = mediatek_dwmac_init;
-- 
1.7.9.5

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
