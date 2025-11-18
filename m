Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA81C68AE0
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 11:01:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 981ECC628CF;
	Tue, 18 Nov 2025 10:01:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C116C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aRVTCsVKmKuNEimYsPQc5eVcrZkNx01Ledzu5WS/DBo=; b=QsbRz4CLzEuj/1cu3cYRbqZy/t
 WLuNxQc7gHHPRxQXBzvBvXXu9rI6ICsM4p2v94jse1+TEhIUogH0J4RaokES2E34djACWsEPQx5X3
 0/jBae55MjzLQdYmMVEb5tNV74SfazqeljkAyGGA8EY6vIGQ6Uje2gig/Mpkbl6LRPBEzZoEdGgcE
 5v/9MRdhdi6P7xfBeoaBaN96rMKTOsqbvWOAAgs8kDpxYRt+PuXdEZPJuGudwctiJWP2aM/6jPMUB
 5zBTsYa2eEmePzhNLqCYpN+8a1LmIM73t/wIDjhBzf8Wv2loP1b6C3nbySLOWuVdbF6n6JEZcgkMK
 bkl8dcrQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43556 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vLIWS-0000000031x-0q2O;
 Tue, 18 Nov 2025 10:01:16 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vLIWR-0000000Ewkf-1Tdx; Tue, 18 Nov 2025 10:01:15 +0000
In-Reply-To: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
References: <aRxDqJSWxOdOaRt4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vLIWR-0000000Ewkf-1Tdx@rmk-PC.armlinux.org.uk>
Date: Tue, 18 Nov 2025 10:01:15 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac:
 stmmac_is_jumbo_frm() len should be unsigned
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

stmmac_is_jumbo_frm() and the is_jumbo_frm() methods take skb->len
which is an unsigned int. Avoid an implicit cast to "int" via the
method parameter and then incorrectly doing signed comparisons on
this unsigned value.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/chain_mode.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/ring_mode.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
index fb55efd52240..d14b56e5ed40 100644
--- a/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/chain_mode.c
@@ -83,7 +83,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	return entry;
 }
 
-static unsigned int is_jumbo_frm(int len, int enh_desc)
+static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
 {
 	unsigned int ret = 0;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index d359722100fa..4953e0fab547 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -541,7 +541,7 @@ struct stmmac_rx_queue;
 struct stmmac_mode_ops {
 	void (*init) (void *des, dma_addr_t phy_addr, unsigned int size,
 		      unsigned int extend_desc);
-	unsigned int (*is_jumbo_frm) (int len, int ehn_desc);
+	unsigned int (*is_jumbo_frm)(unsigned int len, int ehn_desc);
 	int (*jumbo_frm)(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 			 int csum);
 	int (*set_16kib_bfsize)(int mtu);
diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
index d218412ca832..039903c424df 100644
--- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
+++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
@@ -91,7 +91,7 @@ static int jumbo_frm(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
 	return entry;
 }
 
-static unsigned int is_jumbo_frm(int len, int enh_desc)
+static unsigned int is_jumbo_frm(unsigned int len, int enh_desc)
 {
 	unsigned int ret = 0;
 
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
