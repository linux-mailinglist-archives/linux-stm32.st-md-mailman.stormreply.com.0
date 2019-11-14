Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CD7FC581
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Nov 2019 12:42:59 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A1778C36B21;
	Thu, 14 Nov 2019 11:42:59 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (us03-smtprelay2.synopsys.com
 [149.117.87.133])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56B80C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Nov 2019 11:42:58 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B6FE9C04C2;
 Thu, 14 Nov 2019 11:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573731777; bh=RkTzmSnfUcfP/b47ooybjfWnSVm+09bi58sAsWhDWA8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=dWb14nDpOP0in8blqVn5IlVU9RSsRgfrEUedNhcwPxb7V4LA51IIWRO2IP++vO9vH
 obn+8QwlCqmOyZOtHYMWyzm/C7EgyBjQd9xmjAH2uNMOAOjriHdOiCbBLUD7hyjpmS
 g+exKlKIUsSOP9d+7lpWcopSMocwAY3JW6n2RDRf1IuZWCWoDjVL6dKK6O7MNC1zMD
 N5Ee8M4Goo3C6a946O00vetBL+nRZvKXTwMsM4PqaC0PFav0t89U5aF/U4wj79JqaW
 xex/pquw+itLqAKB04tu6NNW6b/cn3+ukmSVTTdMps2ZUUQZoWPUjmx4CZX03TuWEb
 1AmiGlHZIGcBQ==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 54633A0084;
 Thu, 14 Nov 2019 11:42:53 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Thu, 14 Nov 2019 12:42:46 +0100
Message-Id: <d47c38c59dc923cb021a435ffd956bbf7a0a48de.1573731453.git.Jose.Abreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573731453.git.Jose.Abreu@synopsys.com>
References: <cover.1573731453.git.Jose.Abreu@synopsys.com>
In-Reply-To: <cover.1573731453.git.Jose.Abreu@synopsys.com>
References: <cover.1573731453.git.Jose.Abreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 net-next 2/7] net: stmmac: Setup a default
	RX Coalesce value instead of the minimum
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

For performance reasons, sometimes using the minimum RX Coalesce value
is not optimal. Lets setup a default value that is optimal in most of
the use cases.

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
 drivers/net/ethernet/stmicro/stmmac/common.h      | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 912bbb6515b2..309ea12ea61f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -248,6 +248,7 @@ struct stmmac_safety_stats {
 /* Max/Min RI Watchdog Timer count value */
 #define MAX_DMA_RIWT		0xff
 #define MIN_DMA_RIWT		0x10
+#define DEF_DMA_RIWT		0xa0
 /* Tx coalesce parameters */
 #define STMMAC_COAL_TX_TIMER	1000
 #define STMMAC_MAX_COAL_TX_TICK	100000
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7939ef7e23b7..400fbb727fd5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2605,9 +2605,10 @@ static int stmmac_hw_setup(struct net_device *dev, bool init_ptp)
 	priv->tx_lpi_timer = STMMAC_DEFAULT_TWT_LS;
 
 	if (priv->use_riwt) {
-		ret = stmmac_rx_watchdog(priv, priv->ioaddr, MIN_DMA_RIWT, rx_cnt);
-		if (!ret)
-			priv->rx_riwt = MIN_DMA_RIWT;
+		if (!priv->rx_riwt)
+			priv->rx_riwt = DEF_DMA_RIWT;
+
+		ret = stmmac_rx_watchdog(priv, priv->ioaddr, priv->rx_riwt, rx_cnt);
 	}
 
 	if (priv->hw->pcs)
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
