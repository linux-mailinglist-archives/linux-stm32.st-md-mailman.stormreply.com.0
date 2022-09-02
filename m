Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AC95AB679
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Sep 2022 18:27:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67528C640FC;
	Fri,  2 Sep 2022 16:27:07 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr
 [80.12.242.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E27AFC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Sep 2022 16:27:05 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id U9VRobqH1kifIU9VSoXLOn; Fri, 02 Sep 2022 18:27:03 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 02 Sep 2022 18:27:03 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Fri,  2 Sep 2022 18:26:56 +0200
Message-Id: <35ab3ac5b67716acb3f7073229b02a38fce71fb7.1662135995.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3] stmmac: intel: Simplify
	intel_eth_pci_remove()
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

There is no point to call pcim_iounmap_regions() in the remove function,
this frees a managed resource that would be release by the framework
anyway.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Change in v3:
  * (no code change)
  * what was patch 1/2 in the serie has been applied
  * synch with net-next

Change in v2:
  * (no code change)
  * Remove the text added below the --- in v1 (see link below if
    needed)
  * Add Reviewed-by:
  https://lore.kernel.org/all/2aeb1a03d07c686efd8b3e6fc8ff2d45cd7da1e8.1660659689.git.christophe.jaillet@wanadoo.fr/

v1:
  https://lore.kernel.org/all/9f82d58aa4a6c34ec3c734399a4792d3aa23297f.1659204745.git.christophe.jaillet@wanadoo.fr/
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 7d3c7ca7caf4..0a2afc1a3124 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1135,8 +1135,6 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
 
 	clk_disable_unprepare(priv->plat->stmmac_clk);
 	clk_unregister_fixed_rate(priv->plat->stmmac_clk);
-
-	pcim_iounmap_regions(pdev, BIT(0));
 }
 
 static int __maybe_unused intel_eth_pci_suspend(struct device *dev)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
