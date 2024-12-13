Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A42F59F15F4
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 20:35:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4BC4CC78018;
	Fri, 13 Dec 2024 19:35:13 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43BE1C78006
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 19:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HdDCxRaTUX9FGCD245j20jXl1EXkrNlD8Fe9FHouQUM=; b=t3BbWIbt0mNjNv/q72K2ziPS/i
 AY/p8nVScTMol5dSAKTKnfdtkXLXZPGh89Cj3mjEhdCu0Nfc3BV028PdJeGK+WNwZsawUIdkm/mO0
 735oeSHWCV2/tVwzV7lG7WmVzojiIxqhMya7f9MOq1HqMlRHfQRsIDOB4eaN9k9NYjIjDuHEQz7vQ
 H7VvT5e6gw2ZC8LAnuRPjAo2bnTqElRdzxRtlFqXeu78z/tdWNQUeXlUDvjWUZv0Lcvn/dWzTqpl1
 4GnVWcgUh96ugv0dLl25WqOdyvtr079spbDDFisw9pJOa6KwxxLQdhPEkpq679IHPwIMpPmBoseFq
 8Kb+LFCA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:32846 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1tMBRC-0007DD-2v;
 Fri, 13 Dec 2024 19:34:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1tMBRA-006vaY-Sv; Fri, 13 Dec 2024 19:34:56 +0000
In-Reply-To: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1tMBRA-006vaY-Sv@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Dec 2024 19:34:56 +0000
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 2/5] net: pcs: xpcs: fill in PCS
	supported_interfaces
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

Fill in the new PCS supported_interfaces member with the interfaces
that XPCS supports.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index f70ca39f0905..cf41dc5e74e8 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1446,6 +1446,8 @@ static struct dw_xpcs *xpcs_create(struct mdio_device *mdiodev)
 	if (ret)
 		goto out_clear_clks;
 
+	xpcs_get_interfaces(xpcs, xpcs->pcs.supported_interfaces);
+
 	if (xpcs->info.pma == WX_TXGBE_XPCS_PMA_10G_ID)
 		xpcs->pcs.poll = false;
 	else
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
