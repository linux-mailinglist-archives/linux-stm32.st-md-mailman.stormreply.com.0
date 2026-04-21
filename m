Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id JHkrAKOG72kBCQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 608604759CB
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Apr 2026 17:54:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F7F5C58D77;
	Mon, 27 Apr 2026 15:54:09 +0000 (UTC)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D546C8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 11:50:52 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20260421115052euoutp01029f156ba478648191c8c812a00cfdc7~oXPMmcrt81628916289euoutp013
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Apr 2026 11:50:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20260421115052euoutp01029f156ba478648191c8c812a00cfdc7~oXPMmcrt81628916289euoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1776772252;
 bh=Wdm3kV4WDvCDxi2Q1eh8TQdGmwSJyWv03shz+xr93NA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=OXRIxigNRGwkHnJiEZ1USlGtyC22qjDAtNpf+a0Ge/z/2SbHAFLKXO3BdBaS2e703
 YTpSTUwAlx93ngfJ+caYX8rDuOVftYXVl3wRjJMThlON7ULwiDGahtVcDJHx77wCeW
 vICmQnjG9MlVkJym6OCqB9HE3SEvJ8eDZ2HngkZM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6~oXPMWi_xc0669206692eucas1p1S;
 Tue, 21 Apr 2026 11:50:52 +0000 (GMT)
Received: from AMDC4843.eu.corp.samsungelectronics.net (unknown
 [106.120.77.61]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20260421115051eusmtip10861a4b8207300cfdc8286dec4615f9e~oXPL4eC_W1849318493eusmtip1l;
 Tue, 21 Apr 2026 11:50:51 +0000 (GMT)
From: Jakub Raczynski <j.raczynski@samsung.com>
To: netdev@vger.kernel.org
Date: Tue, 21 Apr 2026 13:50:09 +0200
Message-Id: <20260421115008.2690541-1-j.raczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMS-MailID: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
X-Msg-Generator: CA
X-RootMTR: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
X-EPHeader: CA
X-CMS-RootMailID: 20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6
References: <CGME20260421115052eucas1p103281c5b25719a44c0875d6b0860bfa6@eucas1p1.samsung.com>
X-Mailman-Approved-At: Mon, 27 Apr 2026 15:54:08 +0000
Cc: Jakub Raczynski <j.raczynski@samsung.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH] net/stmmac: Fix typos: 'tx_undeflow_irq' ->
 'tx_underflow_irq'
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
X-Rspamd-Queue-Id: 608604759CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[148];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[samsung.com:s=mail20170921];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:netdev@vger.kernel.org,m:j.raczynski@samsung.com,m:kernel-janitors@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:kuba@kernel.org,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[j.raczynski@samsung.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[samsung.com:-];
	NEURAL_HAM(-0.00)[-0.818];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

All references to tx_underflow_irq are misspelled as 'undeflow'. Fix them.

Signed-off-by: Jakub Raczynski <j.raczynski@samsung.com>
---
 drivers/net/ethernet/stmicro/stmmac/common.h         | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c    | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c      | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index d26e8a063022..e7da9964854d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -147,7 +147,7 @@ struct stmmac_extra_stats {
 	unsigned long rx_vlan;
 	unsigned long rx_split_hdr_pkt_n;
 	/* Tx/Rx IRQ error info */
-	unsigned long tx_undeflow_irq;
+	unsigned long tx_underflow_irq;
 	unsigned long tx_process_stopped_irq;
 	unsigned long tx_jabber_irq;
 	unsigned long rx_overflow_irq;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 815213223583..068c21f37c29 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -247,7 +247,7 @@ static int loongson_dwmac_dma_interrupt(struct stmmac_priv *priv,
 	if (unlikely(abnor_intr_status)) {
 		if (unlikely(intr_status & DMA_STATUS_UNF)) {
 			ret = tx_hard_error_bump_tc;
-			x->tx_undeflow_irq++;
+			x->tx_underflow_irq++;
 		}
 		if (unlikely(intr_status & DMA_STATUS_TJT))
 			x->tx_jabber_irq++;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index c01b86fd64da..a73720811791 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -459,7 +459,7 @@ static int sun8i_dwmac_dma_interrupt(struct stmmac_priv *priv,
 
 	if (v & EMAC_TX_UNDERFLOW_INT) {
 		ret |= tx_hard_error;
-		x->tx_undeflow_irq++;
+		x->tx_underflow_irq++;
 	}
 
 	if (v & EMAC_TX_EARLY_INT)
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
index a0383f9486c2..79fe50ad33d1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac_lib.c
@@ -182,7 +182,7 @@ int dwmac_dma_interrupt(struct stmmac_priv *priv, void __iomem *ioaddr,
 	if (unlikely(intr_status & DMA_STATUS_AIS)) {
 		if (unlikely(intr_status & DMA_STATUS_UNF)) {
 			ret = tx_hard_error_bump_tc;
-			x->tx_undeflow_irq++;
+			x->tx_underflow_irq++;
 		}
 		if (unlikely(intr_status & DMA_STATUS_TJT))
 			x->tx_jabber_irq++;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index c1e26965d9b5..df092fb354ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -78,7 +78,7 @@ static const struct stmmac_stats stmmac_gstrings_stats[] = {
 	STMMAC_STAT(rx_vlan),
 	STMMAC_STAT(rx_split_hdr_pkt_n),
 	/* Tx/Rx IRQ error info */
-	STMMAC_STAT(tx_undeflow_irq),
+	STMMAC_STAT(tx_underflow_irq),
 	STMMAC_STAT(tx_process_stopped_irq),
 	STMMAC_STAT(tx_jabber_irq),
 	STMMAC_STAT(rx_overflow_irq),
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
