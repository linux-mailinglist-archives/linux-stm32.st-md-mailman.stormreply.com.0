Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 755A5F1959
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 16:03:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2010EC36B1E;
	Wed,  6 Nov 2019 15:03:16 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B87FC36B0F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 15:03:14 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 24C9EC0F50;
 Wed,  6 Nov 2019 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573052592; bh=ntn5h+EtiIr26cxuzm1ZrBPes0SSBYvLTZygjleUGzc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=klG2q3nFG65HPrpY5Kdxt47P3pYI7LWxN8yFGTQ9ytOchwkVULKnj/kfj2fmz6kTp
 bo20ZV4qA+5zBEgV7eTtSmoeeeacKbJDbClj9VXmp8JJvXZaN9SkhmT3P8zofep/7X
 PMZVqBY98iJsPwys1f4y7hFtQ5cDX3kexvDKl2lCE47/Qg201fXq6MEld9SVV6wRmE
 zjKK19Yks6TWJQZvrG8ts6NovA5/rhw6Md7qHK/+vnkfg744b7YYg6MoceD6wUTgyn
 Zt8uzjiz/4/aSmexQJo5bLNv+eY57D88JRDvkvkiQrJWNXXYjwTodHU8VJ2gA+4e52
 cuseJ31+kCE0Q==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id DE67CA007D;
 Wed,  6 Nov 2019 15:03:10 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed,  6 Nov 2019 16:03:02 +0100
Message-Id: <d89d225566d012d499eec5c8ab30b5e441f5c509.1573052379.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573052378.git.Jose.Abreu@synopsys.com>
References: <cover.1573052378.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1573052378.git.Jose.Abreu@synopsys.com>
References: <cover.1573052378.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net 08/11] net: stmmac: xgmac: Disable MMC
	interrupts by default
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

MMC interrupts were being enabled, which is not what we want because it
will lead to a storm of interrupts that are not handled at all. Fix it
by disabling all MMC interrupts for XGMAC.

Fixes: b6cdf09f51c2 ("net: stmmac: xgmac: Implement MMC counters")
Signed-off-by: Jose Abreu <Jose.Abreu@synopsys.com>

---
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Jose Abreu <joabreu@synopsys.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/stmicro/stmmac/mmc_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
index a223584f5f9a..252cf48c5816 100644
--- a/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/mmc_core.c
@@ -176,6 +176,7 @@
 #define MMC_XGMAC_RX_PKT_SMD_ERR	0x22c
 #define MMC_XGMAC_RX_PKT_ASSEMBLY_OK	0x230
 #define MMC_XGMAC_RX_FPE_FRAG		0x234
+#define MMC_XGMAC_RX_IPC_INTR_MASK	0x25c
 
 static void dwmac_mmc_ctrl(void __iomem *mmcaddr, unsigned int mode)
 {
@@ -333,8 +334,9 @@ static void dwxgmac_mmc_ctrl(void __iomem *mmcaddr, unsigned int mode)
 
 static void dwxgmac_mmc_intr_all_mask(void __iomem *mmcaddr)
 {
-	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_RX_INTR_MASK);
-	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_TX_INTR_MASK);
+	writel(0x0, mmcaddr + MMC_RX_INTR_MASK);
+	writel(0x0, mmcaddr + MMC_TX_INTR_MASK);
+	writel(MMC_DEFAULT_MASK, mmcaddr + MMC_XGMAC_RX_IPC_INTR_MASK);
 }
 
 static void dwxgmac_read_mmc_reg(void __iomem *addr, u32 reg, u32 *dest)
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
