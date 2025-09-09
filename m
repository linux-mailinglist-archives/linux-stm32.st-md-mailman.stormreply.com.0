Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B3AB50320
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 18:48:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F87BC3F93A;
	Tue,  9 Sep 2025 16:48:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 598AFC3F939
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 16:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B9mlUuiZUBrX7aQtqBT3TxfiZmcQldNbBylxYkZ/v1U=; b=Xasu243PE4+x7EhdTuRRpFFaIp
 ajSpEcHYhC+X/gI0bD4m31dEWya8hehFCIefFOTrcYNUMv9TyUS7jMW67dsEdLi8kYIHL2Z4m+ETA
 fYhwXXZhqjmBORtYbHcEL8m+LxvH+VQZQpQ2YidZK3HEjL2ktP8MXxVuW5PCC0LuayiNpUCetaBjM
 oFakpvKCOKu9LUF22clin5BpCjVgQMzrjcQ5nYwh3XVhb0iKRoS2mq/KVf2D6iFNdtt8+FTrQI7e/
 BX+ilGhFcvX2ZeXmlmJTj3jSdrgz49Lclzjk2s48pNMushYZlar5sY27eRK7mT/PqXkWrUAXH8GTM
 EA231OLg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55550 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uw1Vh-0000000005E-2psl;
 Tue, 09 Sep 2025 17:48:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uw1Vf-00000004MCR-2eUl; Tue, 09 Sep 2025 17:47:59 +0100
In-Reply-To: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uw1Vf-00000004MCR-2eUl@rmk-PC.armlinux.org.uk>
Date: Tue, 09 Sep 2025 17:47:59 +0100
Cc: Richard Cochran <richardcochran@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 07/11] net: stmmac: move
 stmmac_init_ptp() messages into function
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

Move the stmmac_init_ptp() messages from stmmac_hw_setup() to
stmmac_init_ptp(), which will allow further cleanups.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index cb058e4c6ea9..716c7e21baf1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -788,8 +788,13 @@ static int stmmac_init_ptp(struct stmmac_priv *priv)
 		priv->plat->ptp_clk_freq_config(priv);
 
 	ret = stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE);
-	if (ret)
+	if (ret) {
+		if (ret == -EOPNOTSUPP)
+			netdev_info(priv->dev, "PTP not supported by HW\n");
+		else
+			netdev_warn(priv->dev, "PTP init failed\n");
 		return ret;
+	}
 
 	priv->adv_ts = 0;
 	/* Check if adv_ts can be enabled for dwmac 4.x / xgmac core */
@@ -3497,12 +3502,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 				    ERR_PTR(ret));
 	}
 
-	ret = stmmac_init_ptp(priv);
-	if (ret == -EOPNOTSUPP)
-		netdev_info(priv->dev, "PTP not supported by HW\n");
-	else if (ret)
-		netdev_warn(priv->dev, "PTP init failed\n");
-	else if (ptp_register)
+	if (stmmac_init_ptp(priv) == 0 && ptp_register)
 		stmmac_ptp_register(priv);
 
 	if (priv->use_riwt) {
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
