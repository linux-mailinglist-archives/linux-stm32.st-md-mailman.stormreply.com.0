Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A26F195B
	for <lists+linux-stm32@lfdr.de>; Wed,  6 Nov 2019 16:03:16 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49BD3C36B24;
	Wed,  6 Nov 2019 15:03:16 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (dc8-smtprelay2.synopsys.com
 [198.182.47.102])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07005C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 Nov 2019 15:03:14 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1E216C0F4F;
 Wed,  6 Nov 2019 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573052592; bh=5oeMB9CE84lgWSWl1HAT/3PLsWVooIarHoFAomQbC8c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=S4sbwIDzBosHiMJ0XXvhTpL+iQyTI8N9TxIGxc5g5rjrDLqKefAAkJiegC6xTeLyr
 MMVAVklxiqwdwUbdQ77vxQzefbSKzUcHtgoGD4aBpct/UClTdasVuohYU1KiieVaFB
 0rRxBMFcXZBzSjWxFim2heDC0NMVLYwQJB8petxr6nD9z9lyklpJwlfJxNg94MoBXc
 InlkkIf0b/dboBVTNI9wkQl9u6xC0vNYlX/xc+fh7NtTCutI501j1Mwni8gk3bE5Me
 H3CeiG2wi8HloyptzFkGUvfTPHGzaqlkwdCOpn8WypW6GZ1F2rZMjgWI2Bi9E2L6YA
 nsWBjyiTv9QjA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id D5BC0A0079;
 Wed,  6 Nov 2019 15:03:10 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Wed,  6 Nov 2019 16:03:01 +0100
Message-Id: <df2a41e98a7980b9f499b33b6d36d61e1effea1e.1573052379.git.Jose.Abreu@synopsys.com>
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
Subject: [Linux-stm32] [PATCH net 07/11] net: stmmac: xgmac: Disable Flow
	Control when 1 or more queues are in AV
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

When in AVB mode we need to disable flow control to prevent MAC from
pausing in TX side.

Fixes: ec6ea8e3eee9 ("net: stmmac: Add CBS support in XGMAC2")
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
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index 2e814aa64a5c..f70ca5300b82 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -470,6 +470,7 @@ static void dwxgmac2_enable_tso(void __iomem *ioaddr, bool en, u32 chan)
 static void dwxgmac2_qmode(void __iomem *ioaddr, u32 channel, u8 qmode)
 {
 	u32 value = readl(ioaddr + XGMAC_MTL_TXQ_OPMODE(channel));
+	u32 flow = readl(ioaddr + XGMAC_RX_FLOW_CTRL);
 
 	value &= ~XGMAC_TXQEN;
 	if (qmode != MTL_QUEUE_AVB) {
@@ -477,6 +478,7 @@ static void dwxgmac2_qmode(void __iomem *ioaddr, u32 channel, u8 qmode)
 		writel(0, ioaddr + XGMAC_MTL_TCx_ETS_CONTROL(channel));
 	} else {
 		value |= 0x1 << XGMAC_TXQEN_SHIFT;
+		writel(flow & (~XGMAC_RFE), ioaddr + XGMAC_RX_FLOW_CTRL);
 	}
 
 	writel(value, ioaddr +  XGMAC_MTL_TXQ_OPMODE(channel));
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
