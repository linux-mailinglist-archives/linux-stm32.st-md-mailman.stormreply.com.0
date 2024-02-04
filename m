Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0B9848D68
	for <lists+linux-stm32@lfdr.de>; Sun,  4 Feb 2024 13:13:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5830C6C858;
	Sun,  4 Feb 2024 12:13:26 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D832C6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  4 Feb 2024 12:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h2e2qQbupPLjDt7RKJD14LZY6ZDC/UDMiQaHqNdcgDc=; b=mSiogrBIUuUXYfEHNmMb9pCKXX
 qjt2VTB8BwJmk8LtOiCuIXPLVV/YKC3Gtq8WJdlOPkiBnq1oJhuDLn/++zRb+gd4QDA6Lx45Mpxn7
 /GEEtcDGrKgXnsIoXjrVo7z/fAuLk5cwfLdLiOafrTI4khu6iHkH6t9CR8FhKcvTjzewKn77G8OEx
 r1oR1GjewgiQ1tYlLYdkugQNMOmqmweSDmkPfndGI1ZNHj+alvoyOytdzoV5HBvmdFpsN3U4BAxcN
 R7f4CG9u+e9JKtSM4xpOEvJMCI0/HVrSy3fFT/f3RZDs54QaW0WnEAeZUtjWPoUNdvGHcowJn7esu
 AaR6G6Ng==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43562 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1rWbN3-0007wH-3A;
 Sun, 04 Feb 2024 12:13:14 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1rWbN2-002cCh-MY; Sun, 04 Feb 2024 12:13:12 +0000
In-Reply-To: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
References: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rWbN2-002cCh-MY@rmk-PC.armlinux.org.uk>
Date: Sun, 04 Feb 2024 12:13:12 +0000
Cc: Vladimir Oltean <olteanv@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Byungho An <bh74.an@samsung.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Justin Chen <justin.chen@broadcom.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
 Wei Fang <wei.fang@nxp.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 3/6] net: fec: remove
 eee_enabled/eee_active in fec_enet_get_eee()
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

fec_enet_get_eee() sets edata->eee_active and edata->eee_enabled from
its own copy, and then calls phy_ethtool_get_eee() which in turn will
call genphy_c45_ethtool_get_eee().

genphy_c45_ethtool_get_eee() will overwrite eee_enabled and eee_active
with its own interpretation from the PHYs settings and negotiation
result.

Therefore, setting these members in fec_enet_get_eee() is redundant.
Remove this, and remove the setting of fep->eee.eee_active member which
becomes a write-only variable.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/freescale/fec_main.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 63707e065141..42bdc01a304e 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -3139,8 +3139,6 @@ static int fec_enet_eee_mode_set(struct net_device *ndev, bool enable)
 	}
 
 	p->tx_lpi_enabled = enable;
-	p->eee_enabled = enable;
-	p->eee_active = enable;
 
 	writel(sleep_cycle, fep->hwp + FEC_LPI_SLEEP);
 	writel(wake_cycle, fep->hwp + FEC_LPI_WAKE);
@@ -3160,8 +3158,6 @@ fec_enet_get_eee(struct net_device *ndev, struct ethtool_keee *edata)
 	if (!netif_running(ndev))
 		return -ENETDOWN;
 
-	edata->eee_enabled = p->eee_enabled;
-	edata->eee_active = p->eee_active;
 	edata->tx_lpi_timer = p->tx_lpi_timer;
 	edata->tx_lpi_enabled = p->tx_lpi_enabled;
 
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
