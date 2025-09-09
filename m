Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14098B50325
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Sep 2025 18:48:32 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CDA2FC3F93A;
	Tue,  9 Sep 2025 16:48:31 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EFCC4C3F939
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Sep 2025 16:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P6pOrzXSnREVsUpXI8UJFOiH+uik773tcHNfNYJrtr4=; b=Z+yN1BcFZIWMFmnBEU0ra4C/ve
 8tjeaxBpzUE343F5vRVJti+U0C1zOQUNJVSjmc0cvhLvjPmHUK4OrUL7lPCJqnZwFnj4B6z6DDJwo
 a1pMNVTc8oMNUeWPPNIHwnUa9nLoBKLpcFgQoEM8iqHcxKAAwi4m7s5W+iRmdw4AhKDUkYXTlOMh4
 y4jv9k60TNulSBCRrBEVuQJZG1YyKElHRKu8Q3/PZchamTlNAFsrB8MovwdCQW6pmfB9ntG71/m0Y
 NE9ZTTW88zjumtRYzGU3CxElTbDK6NsHYukE9yRktWBEK72zmtbS2iZS4zjSjWzXsNk1zGzwt14Lq
 wXGwspFQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43460 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uw1Vs-0000000005h-3qkr;
 Tue, 09 Sep 2025 17:48:13 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uw1Vp-00000004MCd-3bUh; Tue, 09 Sep 2025 17:48:09 +0100
In-Reply-To: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
References: <aMBaCga5UAXT03Bi@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uw1Vp-00000004MCd-3bUh@rmk-PC.armlinux.org.uk>
Date: Tue, 09 Sep 2025 17:48:09 +0100
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
Subject: [Linux-stm32] [PATCH net-next 09/11] net: stmmac: add
	stmmac_setup_ptp()
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

Add a function to setup PTP, which will enable the clock, initialise
the timestamping, and register with the PTP clock subsystem. Call this
when we want to register the PTP clock in stmmac_hw_setup(), otherwise
just call the

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 28 ++++++++++++-------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7cbac3ac2a9d..ea2d3e555fe8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -820,6 +820,20 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 	return 0;
 }
 
+static void stmmac_setup_ptp(struct stmmac_priv *priv)
+{
+	int ret;
+
+	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
+	if (ret < 0)
+		netdev_warn(priv->dev,
+			    "failed to enable PTP reference clock: %pe\n",
+			    ERR_PTR(ret));
+
+	if (stmmac_init_timestamping(priv) == 0)
+		stmmac_ptp_register(priv);
+}
+
 static void stmmac_release_ptp(struct stmmac_priv *priv)
 {
 	stmmac_ptp_unregister(priv);
@@ -3494,16 +3508,10 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 
 	stmmac_mmc_setup(priv);
 
-	if (ptp_register) {
-		ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
-		if (ret < 0)
-			netdev_warn(priv->dev,
-				    "failed to enable PTP reference clock: %pe\n",
-				    ERR_PTR(ret));
-	}
-
-	if (stmmac_init_timestamping(priv) == 0 && ptp_register)
-		stmmac_ptp_register(priv);
+	if (ptp_register)
+		stmmac_setup_ptp(priv);
+	else
+		stmmac_init_timestamping(priv);
 
 	if (priv->use_riwt) {
 		u32 queue;
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
