Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E413FC078
	for <lists+linux-stm32@lfdr.de>; Tue, 31 Aug 2021 03:25:48 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1F45CC5A4D9;
	Tue, 31 Aug 2021 01:25:48 +0000 (UTC)
Received: from qq.com (smtpbg558.qq.com [183.3.226.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AE71C5A4D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 31 Aug 2021 01:25:44 +0000 (UTC)
X-QQ-mid: bizesmtp32t1630373126teomyjyj
Received: from localhost.localdomain (unknown [124.126.19.250])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 31 Aug 2021 09:25:25 +0800 (CST)
X-QQ-SSF: 0140000000200070D000B00A0000000
X-QQ-FEAT: QX/rXDl9P1ur4thuaXke1KHxASVcRttKMr8SgRrWrHJ7vdSYee+STb7rwRvNS
 sSioNxtoNRvQdXaHdt/gZP7ep3cLZ+2mSc+TLLDhu+PJRkPnr/3b6me1qCR+Ft/sr7JOmCx
 ClRCMfbOCyqe8Mp+C1wt3z+xvjjxhapaVFVsPC+a03iFM6qMDX+4ARgI+FYShyrep2X3N3J
 igw08sXbMgoIypheYtzNk6gSadWhe8Yi7n5SWtXP0mAGVGp2TUWR+pCJ9Psdgfg0saf3ydE
 q+laIH+nK1uVbouPXdkNK/TWoAzcJ7cDssXQbaxkGtxdCJ0v01SVMeHmEzgiH7k4/O2sWEb
 oOvOrI5
X-QQ-GoodBg: 2
From: zhaoxiao <zhaoxiao@uniontech.com>
To: davem@davemloft.net,
	kuba@kernel.org,
	mcoquelin.stm32@gmail.com
Date: Tue, 31 Aug 2021 09:25:23 +0800
Message-Id: <20210831012523.2691-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign1
X-QQ-Bgrelay: 1
Cc: zhaoxiao <zhaoxiao@uniontech.com>, netdev@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 joabreu@synopsys.com, peppe.cavallaro@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] stmmac: dwmac-loongson: change the
	pr_info() to dev_err() in loongson_dwmac_probe()
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

Change the pr_info to dev_err.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
v3:Remove the redundant blank line.
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 4c9a37dd0d3f..f03f25d9adb0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -54,14 +54,13 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
 	bool mdio = false;
 
 	np = dev_of_node(&pdev->dev);
-
 	if (!np) {
-		pr_info("dwmac_loongson_pci: No OF node\n");
+		dev_err(&pdev->dev, "dwmac_loongson_pci: No OF node\n");
 		return -ENODEV;
 	}
 
 	if (!of_device_is_compatible(np, "loongson, pci-gmac")) {
-		pr_info("dwmac_loongson_pci: Incompatible OF node\n");
+		dev_err(&pdev->dev, "dwmac_loongson_pci: Incompatible OF node\n");
 		return -ENODEV;
 	}
 
-- 
2.20.1



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
