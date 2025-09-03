Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D42DB422D7
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 16:01:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1639FC3FAC9;
	Wed,  3 Sep 2025 14:01:05 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9549EC3FAC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 14:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UZ535sMG9SHzKQxaCXBfr4JfaELjSThyJX0LteFzYAI=; b=N9VGlBQfCIXoCER8b40eEiqZr0
 45BFRSok5U/ALiTU1M1+lI3qJ6nfVhxGcOASOZWkl8+LvD8pXTeozsI4tpfPYepPFUli2D21WqtXH
 SpvsjTSs+QJLBqMl1JlFMUy4PUPkn4aCyU48XNS+nRbklbntWsS94wIce0rY9A2l3JF4gB/g9iXqI
 lZoNo/IXljxz3/1VFOSeUKmGVRY9N8EtlvDVbBQ0pvAEWQ2aTgNwYpNSsgW7WzHkwgkEmFqoMGKlo
 frhX7jgBWoGJpgmoX84OHYDOB3oNrO/BXidU5ZmfaD48YDTeKFmCjuzUk0f1+vhXQ0lBm3fd150OZ
 w0965dPg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52698 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uto2d-000000000bz-3Qsc;
 Wed, 03 Sep 2025 15:00:51 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uto2d-00000001se4-0JSY; Wed, 03 Sep 2025 15:00:51 +0100
In-Reply-To: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
References: <aLhJ8Gzb0T2qpXBE@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uto2d-00000001se4-0JSY@rmk-PC.armlinux.org.uk>
Date: Wed, 03 Sep 2025 15:00:51 +0100
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: ptp: conditionally
 populate getcrosststamp() method
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

drivers/char/ptp_chardev.c::ptp_clock_getcaps() uses the presence of
the getcrosststamp() method to indicate to userspace whether
rosststamping is supported or not. Therefore, we should not provide
this method unless it is functional. Only set this method pointer
in stmmac_ptp_register() if the platform glue provides the
necessary functionality.

This does not mean that it will be supported (see intel_crosststamp(),
which is the only implementation that may have support) but at least
we won't be suggesting that it is supported on many platforms where
there is no hope.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3767ba495e78..8b4cf1a31633 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -247,10 +247,7 @@ static int stmmac_get_syncdevicetime(ktime_t *device,
 {
 	struct stmmac_priv *priv = (struct stmmac_priv *)ctx;
 
-	if (priv->plat->crosststamp)
-		return priv->plat->crosststamp(device, system, ctx);
-	else
-		return -EOPNOTSUPP;
+	return priv->plat->crosststamp(device, system, ctx);
 }
 
 static int stmmac_getcrosststamp(struct ptp_clock_info *ptp,
@@ -278,7 +275,6 @@ const struct ptp_clock_info stmmac_ptp_clock_ops = {
 	.gettime64 = stmmac_get_time,
 	.settime64 = stmmac_set_time,
 	.enable = stmmac_enable,
-	.getcrosststamp = stmmac_getcrosststamp,
 };
 
 /* structure describing a PTP hardware clock */
@@ -296,7 +292,6 @@ const struct ptp_clock_info dwmac1000_ptp_clock_ops = {
 	.gettime64 = stmmac_get_time,
 	.settime64 = stmmac_set_time,
 	.enable = dwmac1000_ptp_enable,
-	.getcrosststamp = stmmac_getcrosststamp,
 };
 
 /**
@@ -332,6 +327,9 @@ void stmmac_ptp_register(struct stmmac_priv *priv)
 	if (priv->plat->ptp_max_adj)
 		priv->ptp_clock_ops.max_adj = priv->plat->ptp_max_adj;
 
+	if (priv->plat->crosststamp)
+		priv->ptp_clock_ops.getcrosststamp = stmmac_getcrosststamp;
+
 	rwlock_init(&priv->ptp_lock);
 	mutex_init(&priv->aux_ts_lock);
 
-- 
2.47.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
