Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A3F3FB0D0
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Aug 2021 07:29:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AF82C5A4D5;
	Mon, 30 Aug 2021 05:29:39 +0000 (UTC)
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F2493C57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 05:29:35 +0000 (UTC)
X-QQ-mid: bizesmtp54t1630301358tp73135x
Received: from localhost.localdomain (unknown [111.207.172.18])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 30 Aug 2021 13:29:16 +0800 (CST)
X-QQ-SSF: 0140000000200070D000B00B0000000
X-QQ-FEAT: vCa7dv7JIu7h/OEU73Iq3I8ZIIaeIJtLUZK6oCc7M8av+W9edfBIM+fI9M2GP
 A2WHJV1Iki6zZMV9pK/+OlCGsPC/ZgmXcg3zBjMkdM9nYjSA/vV0S28z9ElUcamn7iCEcb4
 chSjGGNapd4NKOLkm/ctnvQwit9wnz3S55aKV1HLLnnyytYLu0gXZmL14YCEAJKAJFG4Gn7
 bO2zPvAIXgBK7lmWalTzi7C9RWf/+q+oC9wcEnEDvxJYWv0HMcQgeISzM7ZpUcQqkVXslUw
 TQlGSvcmPnWZvIxJGx703rqDxfFkGjeLt2pFrJNmPMLE3euiairPYyxlBVrlstOx1rxO4Ra
 Aw8KpvUF6rA/Q6TH7IDpk+m/GkIWg==
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	mcoquelin.stm32@gmail.com
Date: Mon, 30 Aug 2021 13:29:13 +0800
Message-Id: <20210830052913.12793-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
Cc: zhaoxiao <zhaoxiao@uniontech.com>, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] stmmac: dwmac-loongson:add the return value
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

Add the return value when phy_mode < 0.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 4c9a37dd0d3f..ecf759ee1c9f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -109,8 +109,10 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 		plat->bus_id = pci_dev_id(pdev);
 
 	phy_mode = device_get_phy_mode(&pdev->dev);
-	if (phy_mode < 0)
+	if (phy_mode < 0) {
 		dev_err(&pdev->dev, "phy_mode not found\n");
+		return phy_mode;
+	}
 
 	plat->phy_interface = phy_mode;
 	plat->interface = PHY_INTERFACE_MODE_GMII;
-- 
2.20.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
