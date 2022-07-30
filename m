Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0322585B9B
	for <lists+linux-stm32@lfdr.de>; Sat, 30 Jul 2022 20:20:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AB46C03FDB;
	Sat, 30 Jul 2022 18:20:12 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF2EFC03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 30 Jul 2022 18:20:11 +0000 (UTC)
Received: from pop-os.home ([90.11.190.129]) by smtp.orange.fr with ESMTPA
 id Hr4JoicqGgtndHr4JoDTCy; Sat, 30 Jul 2022 20:20:11 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 30 Jul 2022 20:20:11 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: andriy.shevchenko@linux.intel.com, vee.khee.wong@intel.com,
 weifeng.voon@intel.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Date: Sat, 30 Jul 2022 20:20:02 +0200
Message-Id: <9f82d58aa4a6c34ec3c734399a4792d3aa23297f.1659204745.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b5b44a0c025d0fdddd9b9d23153261363089a06a.1659204745.git.christophe.jaillet@wanadoo.fr>
References: <b5b44a0c025d0fdddd9b9d23153261363089a06a.1659204745.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] stmmac: intel: Simplify
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
---
This patch is speculative.
Sometimes the order of releasing managed resources is tricky.

Just a few drivers have this pattern, while many call pcim_iomap_regions().
If I'm right and this patch is reviewed and merged, I'll look at the
other files if they also can be simplified a bit.
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index 9f38642f86ce..f68d23051557 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -1136,8 +1136,6 @@ static void intel_eth_pci_remove(struct pci_dev *pdev)
 
 	clk_disable_unprepare(plat->stmmac_clk);
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
