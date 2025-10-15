Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 570B2BDF955
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Oct 2025 18:11:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C479C57163;
	Wed, 15 Oct 2025 16:11:08 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92A75C5663F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Oct 2025 16:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uqLOBUY0xU3RN71ffCkfmJX1LRd55XNwi+h1nM0Q9Ps=; b=awDYVu/9177C4j2gkxtgJtIgeK
 yiI0UZJ570OzDPY4bl2k1nEhy7+Oa6FFVznX4uC5U4g55kXg6NMWt3AklfN+mz1dzix2+Ol4yzChF
 IOix5BhyOK2a7QmKKwE6FvI6DA/eKSEjfWFLocZ56CQnupmB111bVc5PzUX2vv2PBxv0YgwC3BFb2
 USTUYWUKz9dWGLBm8WZVBRpzf6xDaG7d19xb9RukV9k8UhEzAnhzW0blKGMb/saL3b5wLkp2SJEpU
 0j8IR3htwwhR92S8nSOfIdbSzwrSRFhtDXa44/nF0TKlUB669pMhK/PiwEZn5LyqC0qBVPCcyATZX
 NRVdomjw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34182 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1v945Z-000000005AZ-2lmk;
 Wed, 15 Oct 2025 17:10:57 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1v945Y-0000000Ameb-2gDI; Wed, 15 Oct 2025 17:10:56 +0100
In-Reply-To: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
References: <aO_HIwT_YvxkDS8D@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1v945Y-0000000Ameb-2gDI@rmk-PC.armlinux.org.uk>
Date: Wed, 15 Oct 2025 17:10:56 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/5] net: stmmac: rearrange tc_init()
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

To make future changes easier, rearrange the use of dma_cap->l3l4fnum
vs priv->flow_entries_max.

Always initialise priv->flow_entries_max from dma_cap->l3l4fnum, then
use priv->flow_entries_max to determine whether we allocate
priv->flow_entries and set it up.

This change is safe because tc_init() is only called once from
stmmac_dvr_probe().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 97e89a604abd..ef65cf511f3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -262,10 +262,10 @@ static int tc_init(struct stmmac_priv *priv)
 	unsigned int count;
 	int ret, i;
 
-	if (dma_cap->l3l4fnum) {
-		priv->flow_entries_max = dma_cap->l3l4fnum;
+	priv->flow_entries_max = dma_cap->l3l4fnum;
+	if (priv->flow_entries_max) {
 		priv->flow_entries = devm_kcalloc(priv->device,
-						  dma_cap->l3l4fnum,
+						  priv->flow_entries_max,
 						  sizeof(*priv->flow_entries),
 						  GFP_KERNEL);
 		if (!priv->flow_entries)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
