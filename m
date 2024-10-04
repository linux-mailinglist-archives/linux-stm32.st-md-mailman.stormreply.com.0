Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5769900CF
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Oct 2024 12:21:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 02134C78025;
	Fri,  4 Oct 2024 10:21:41 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 996FBC78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Oct 2024 10:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=btihpCL0vUh1N7+vGVV6qF1UsDzMDCL36GJO4Y2gy+Y=; b=wc6uvFeCMjSi9nKAvG9zyLmnnd
 /II+7rH8cSHKbjwufJqlw6rsxakwSrS9ApcP9Ua5y78fjLI90z9TDNVfTjXRk80o1uMOyOo1Vbf5a
 ZatVuK48pu0iCJFWJXn1WTOJ9TAGkgCR3+XNxkEFhhWdAaL5KVv2GGNWsxmEzFn4fmKYXcKqs2jDT
 0FX2WCZaoIgdW0XQKZ1dv2BFr4cOF2qqn6iYgy2uj0UYoXOcvQftlSufFSJ1Uz40nidJK/ycPYM90
 Y57hnv1qDrqeoEE5I4Yrn+/NXTtiDe1izFaOZDNN1sG3KPqmpvSiHrWeK2dA8IkErn5AtSJ6fGBJh
 K2hzJvEg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45040 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <rmk@armlinux.org.uk>) id 1swfRB-0001iW-2E;
 Fri, 04 Oct 2024 11:21:29 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1swfR9-006Dfs-Ee; Fri, 04 Oct 2024 11:21:27 +0100
In-Reply-To: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1swfR9-006Dfs-Ee@rmk-PC.armlinux.org.uk>
Date: Fri, 04 Oct 2024 11:21:27 +0100
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 10/13] net: pcs: xpcs: convert to use
 read_poll_timeout()
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

Convert the xpcs driver to use read_poll_timeout() when waiting for
reset to complete, rather than open-coding this.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/pcs/pcs-xpcs.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 5ac8262ac264..06a495135418 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -220,18 +220,15 @@ static int xpcs_modify_vpcs(struct dw_xpcs *xpcs, int reg, u16 mask, u16 val)
 
 static int xpcs_poll_reset(struct dw_xpcs *xpcs, int dev)
 {
-	/* Poll until the reset bit clears (50ms per retry == 0.6 sec) */
-	unsigned int retries = 12;
-	int ret;
+	int ret, val;
 
-	do {
-		msleep(50);
-		ret = xpcs_read(xpcs, dev, MDIO_CTRL1);
-		if (ret < 0)
-			return ret;
-	} while (ret & MDIO_CTRL1_RESET && --retries);
+	ret = read_poll_timeout(xpcs_read, val,
+				val < 0 || !(val & MDIO_CTRL1_RESET),
+				50000, 600000, true, xpcs, dev, MDIO_CTRL1);
+	if (val < 0)
+		ret = val;
 
-	return (ret & MDIO_CTRL1_RESET) ? -ETIMEDOUT : 0;
+	return ret;
 }
 
 static int xpcs_soft_reset(struct dw_xpcs *xpcs,
-- 
2.30.2

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
