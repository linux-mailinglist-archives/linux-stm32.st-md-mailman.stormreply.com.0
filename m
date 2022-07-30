Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C0911585B98
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jul 2022 20:19:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55D67C03FFF;
	Sat, 30 Jul 2022 18:19:56 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp02.smtpout.orange.fr
 [80.12.242.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 41668C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jul 2022 18:19:54 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id Hr41oSyrhBDYDHr41oo8rt; Sat, 30 Jul 2022 20:19:53 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 30 Jul 2022 20:19:53 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: andriy.shevchenko@linux.intel.com, vee.khee.wong@intel.com,
 weifeng.voon@intel.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Date: Sat, 30 Jul 2022 20:19:47 +0200
Message-Id: <b5b44a0c025d0fdddd9b9d23153261363089a06a.1659204745.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 1/2] stmmac: intel: Add a missing
	clk_disable_unprepare() call in intel_eth_pci_remove()
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

Commit 09f012e64e4b ("stmmac: intel: Fix clock handling on error and remove
paths") removed this clk_disable_unprepare()

This was partly revert by commit ac322f86b56c ("net: stmmac: Fix clock
handling on remove path") which removed this clk_disable_unprepare()
because:
"
   While unloading the dwmac-intel driver, clk_disable_unprepare() is
   being called twice in stmmac_dvr_remove() and
   intel_eth_pci_remove(). This causes kernel panic on the second call.
"

However later on, commit 5ec55823438e8 ("net: stmmac: add clocks management
for gmac driver") has updated stmmac_dvr_remove() which do not call
clk_disable_unprepare() anymore.

So this call should now be called from intel_eth_pci_remove().

Fixes: 5ec55823438e8 ("net: stmmac: add clocks management for gmac driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
/!\     This patch is HIGHLY speculative.     /!\

The corresponding clk_disable_unprepare() is still called within the pm
related stmmac_bus_clks_config() function.

However, with my limited understanding of the pm API, I think it that the
patch is valid.
(in other word, does the pm_runtime_put() and/or pm_runtime_disable()
and/or stmmac_dvr_remove() can end up calling .runtime_suspend())

So please review with care, as I'm not able to test the change by myself.


If I'm wrong, maybe a comment explaining why it is safe to have this
call in the error handling path of the probe and not in the remove function
would avoid erroneous patches generated from static code analyzer to be
sent.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 52f9ed8db9c9..9f38642f86ce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1134,6 +1134,7 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
 
 	stmmac_dvr_remove(&pdev->dev);
 
+	clk_disable_unprepare(plat->stmmac_clk);
 	clk_unregister_fixed_rate(priv->plat->stmmac_clk);
 
 	pcim_iounmap_regions(pdev, BIT(0));
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
