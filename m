Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4341891268
	for <lists+linux-stm32@lfdr.de>; Sat, 17 Aug 2019 20:55:04 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 11E94C35E0C;
	Sat, 17 Aug 2019 18:55:04 +0000 (UTC)
Received: from smtprelay-out1.synopsys.com (unknown [198.182.61.142])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03FD1C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 17 Aug 2019 18:55:00 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DECBAC0E43;
 Sat, 17 Aug 2019 18:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1566068097; bh=fVQZvfAxc/G+VutS8V5jk5gMniugumrB3Ej9sQMBc1s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:In-Reply-To:
 References:From;
 b=NXSS6GG2OkQOAcl3gN7TN/5Wn1EHzH+/S1+yTbJB6uOSV9wOJOcDC+dKvrw0oTLXF
 fcX1sMIGH3J4NwtG05AQoGUOHXT/O97ObbDiX93/lhyouTDsWydo0+NNjOmN2DaW5r
 fthSorC5NAxPnPVJUCM3VhyQiD18vzhwbkbvSa29/HB8kGVzbbixVCFVC7geM4N7r+
 hv5tIqzmdU6mFCR9xhQZUdNR/HX7jV7q3efiifHex0aFIhbSSxPhZCn4zl6Lobyoed
 vgUwWs8VtKfCAF8e6H4bT9h8s7NomloZlsvItzkuoxx0DAHnmg1OgEqJYd4f/1cykv
 NPB/E28hxYKyA==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 9B977A006D;
 Sat, 17 Aug 2019 18:54:55 +0000 (UTC)
From: Jose Abreu <Jose.Abreu@synopsys.com>
To: netdev@vger.kernel.org
Date: Sat, 17 Aug 2019 20:54:44 +0200
Message-Id: <f9a9af5a961f7d507c3bb0d6e578dbfa45f54641.1566067802.git.joabreu@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1566067802.git.joabreu@synopsys.com>
References: <cover.1566067802.git.joabreu@synopsys.com>
In-Reply-To: <cover.1566067802.git.joabreu@synopsys.com>
References: <cover.1566067802.git.joabreu@synopsys.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v3 05/12] net: stmmac: Add a counter
	for Split Header packets
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

Add a counter that increments each time a packet with split header is
received.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>

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
 drivers/net/ethernet/stmicro/stmmac/common.h         | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 527f961579f4..1303ec81fd3d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -75,6 +75,7 @@ struct stmmac_extra_stats {
 	unsigned long rx_missed_cntr;
 	unsigned long rx_overflow_cntr;
 	unsigned long rx_vlan;
+	unsigned long rx_split_hdr_pkt_n;
 	/* Tx/Rx IRQ error info */
 	unsigned long tx_undeflow_irq;
 	unsigned long tx_process_stopped_irq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 2423160ab582..eb784fdb6d32 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -65,6 +65,7 @@ static const struct stmmac_stats stmmac_gstrings_stats[] = {
 	STMMAC_STAT(rx_missed_cntr),
 	STMMAC_STAT(rx_overflow_cntr),
 	STMMAC_STAT(rx_vlan),
+	STMMAC_STAT(rx_split_hdr_pkt_n),
 	/* Tx/Rx IRQ error info */
 	STMMAC_STAT(tx_undeflow_irq),
 	STMMAC_STAT(tx_process_stopped_irq),
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 60e5f3584790..f2a198eda20b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3503,6 +3503,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 				len = hlen;
 
 				prefetch(page_address(buf->sec_page));
+				priv->xstats.rx_split_hdr_pkt_n++;
 			}
 
 			skb = napi_alloc_skb(&ch->rx_napi, len);
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
