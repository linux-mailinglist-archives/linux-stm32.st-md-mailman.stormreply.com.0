Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDEEAA73E1
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 15:36:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFE1EC78F83;
	Fri,  2 May 2025 13:36:39 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6197AC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 13:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tMsYaN25z76lktbBdIck2Jfs8+Pu7kcg9oa4M4iajcs=; b=cSFc2TcE8QON1lJEl1vxBmZ+PB
 er39jf7VRDi85a7WRoCkv2VH9aGObtmVv3sbRs3G3Cq/+Efvvf+8HTsfJc65h+YjFClnKvc9zqBrt
 PM07APXmvBWjXXt6dkdSJ1/sG0kCPH/fqicLT3JqUpnOHomK541IZELqMJh56ZRjKpNQTyL8YrB4n
 uHb2PzZOwtOXmJ6daWvzkXmc22gubNo3Uze9xIQmdEVND1tHfjG78gQzrjJBcyuhb+2vKsLFwTj/v
 PXp4vfBXVzwHhvIL0JVkLaJKVE2+OIaRVHf8OAMaSq00hiDDVb29Zhw1FnH//+clAdVC7oQhYWpMV
 2dg53/qA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58384 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1uAqYz-0001PF-3D;
 Fri, 02 May 2025 14:36:26 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uAqYN-002D41-53; Fri, 02 May 2025 14:35:47 +0100
In-Reply-To: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
References: <aBTKOBKnhoz3rrlQ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uAqYN-002D41-53@rmk-PC.armlinux.org.uk>
Date: Fri, 02 May 2025 14:35:47 +0100
Cc: Thierry Reding <treding@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 4/4] net: stmmac: leave enabling
 _RE and _TE to stmmac_mac_link_up()
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

We only need to enable the MAC receiver and transmiter only when the
link has come up.

With commit "net: stmmac: move phylink_resume() after resume setup
is complete" we move the race between stmmac_mac_link_up() and
stmmac_hw_setup(), ensuring that stmmac_mac_link_up() happens
afterwards. This patch is a pre-requisit of this change.

Remove the unnecessary call to stmmac_mac_set(, true) in
stmmac_hw_setup().

Tested-by: Furong Xu <0x1207@gmail.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index ac27ea679b23..ef2a08342b25 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3533,9 +3533,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 		priv->hw->rx_csum = 0;
 	}
 
-	/* Enable the MAC Rx/Tx */
-	stmmac_mac_set(priv, priv->ioaddr, true);
-
 	/* Set the HW DMA mode and the COE */
 	stmmac_dma_operation_mode(priv);
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
