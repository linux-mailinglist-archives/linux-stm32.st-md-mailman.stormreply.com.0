Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB7B52F7C
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 13:10:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 42A69C349C1;
	Thu, 11 Sep 2025 11:10:30 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 063B1C36B14
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 11:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9b3//ARVpkHYjlQHOj5QLrD/YhlzfhZeBDi+nhBNlxA=; b=OnJM/tr7uvOtI8LIoe96orHO/U
 ZHhXIlzSuI28gUdueBPnlhiAJJ0waR4da+huO965Tzn0L9k2Fu9WWba86DxgnRNZKDr1GBYTjKqR4
 RreCb3YPGxCAhQZZwQSHbvua/a3SK9kk7BmiQggGBbWJNFzHk1nu0zjVnlHONvCoYrmssoyOfqs6o
 dle3njvggjxgNpP8UTpXPMONR1CfyDeghjLotnrJJx3u/+joehXUbi37Uac8Cj2pjNiRGxwIzpq9q
 fSGVAsoy9On7c0/DfKJWAxyFtV0nR0IiZxESccwohLVoYA6P5YOGqDs4TWKwaMYrMXWIL5OUtOyss
 j5mdSCnw==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51882 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1uwfBu-000000002uB-1zMM;
 Thu, 11 Sep 2025 12:10:14 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1uwfBt-00000004j98-0Tio; Thu, 11 Sep 2025 12:10:13 +0100
In-Reply-To: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
References: <aMKtV6O0WqlmJFN4@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1uwfBt-00000004j98-0Tio@rmk-PC.armlinux.org.uk>
Date: Thu, 11 Sep 2025 12:10:13 +0100
Cc: Richard Cochran <richardcochran@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 08/11] net: stmmac: rename
	stmmac_init_ptp()
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

Changes to the stmmac driver to fix various issues with PTP have made
stmmac_init_ptp() less about initialising the entire PTP block, and
now primarily deals with the packet timestamping support. The exception
to this is ptp_clk_freq_config(), which is an odditiy. It remains
as stmmac_init_ptp() is used both at .ndo_open() time and in the
resume paths.

However, restructuring this code to make it more easily readable makes
the continued use of "init_ptp" confusing.

In preparation to cleaning up the (re-)initialisation of timestamping,
rename the existing stmmac_init_ptp() to stmmac_init_timestamping()
which better reflects its functionality.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 716c7e21baf1..7cbac3ac2a9d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -773,13 +773,13 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 }
 
 /**
- * stmmac_init_ptp - init PTP
+ * stmmac_init_timestamping - initialise timestamping
  * @priv: driver private structure
  * Description: this is to verify if the HW supports the PTPv1 or PTPv2.
  * This is done by looking at the HW cap. register.
  * This function also registers the ptp driver.
  */
-static int stmmac_init_ptp(struct stmmac_priv *priv)
+static int stmmac_init_timestamping(struct stmmac_priv *priv)
 {
 	bool xmac = priv->plat->has_gmac4 || priv->plat->has_xgmac;
 	int ret;
@@ -3502,7 +3502,7 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 				    ERR_PTR(ret));
 	}
 
-	if (stmmac_init_ptp(priv) == 0 && ptp_register)
+	if (stmmac_init_timestamping(priv) == 0 && ptp_register)
 		stmmac_ptp_register(priv);
 
 	if (priv->use_riwt) {
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
