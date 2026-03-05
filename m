Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFglLDFeqWlc6QAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 11:42:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9292C20FE23
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 11:42:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58DF1C8F26E;
	Thu,  5 Mar 2026 10:42:57 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B34B7C8F26D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 10:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7TWPZWgjMflG60hVdURSGE4ETIH+Z1lgrcFU4tilmE4=; b=rnYTDL+VPPXkxkx3fywXg0xsQs
 rsT4M8x8rF/inmBpp17f971/cy+VhazhiDS6M/sP8dBQQeZ25GQ7z986P58LD9yIiy32wPt+RzZ9Y
 pxVig1uAuwYpXZJf7wKgvfOxwNed7EGOJy/4QrOf1Jnv6+6nkt5wE59+cQnaVeRdeFQqSts+F5AJQ
 YFNXf0pmBeHzJiIsKN4iQmgVUixKbNMWoBLOUUeY8gjURpdzizI2h8qzJ0VUI9g4/vHf0lZ9MfCMm
 9DAdnRdFY/fz5CD58lnwgoxeG4wH7DRjCriKW2qogf5HbPVuZX6bY0d48UvFRZg6l+pVjSXzQKjFN
 wdu1pK2g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58682 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vy6AK-000000007nu-37rd;
 Thu, 05 Mar 2026 10:42:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vy6AJ-0000000Btx1-1teC; Thu, 05 Mar 2026 10:42:47 +0000
In-Reply-To: <aald--qJquWGIvmO@shell.armlinux.org.uk>
References: <aald--qJquWGIvmO@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vy6AJ-0000000Btx1-1teC@rmk-PC.armlinux.org.uk>
Date: Thu, 05 Mar 2026 10:42:47 +0000
Cc: Paolo Abeni <pabeni@redhat.com>, Samuel Holland <samuel@sholland.org>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 5/8] net: stmmac: use u32 for MDIO
 register field masks
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
X-Rspamd-Queue-Id: 9292C20FE23
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:pabeni@redhat.com,m:samuel@sholland.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.682];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

MDIO registers are 32-bit, so use u32 to describe the masks for these
registers. Convert the GENMASK() initialisers to GENMASK_U32() for
type compatibility.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h         |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c    |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c    |  6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c  | 12 ++++++------
 7 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index 978f90065681..46454e2886ce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -608,9 +608,9 @@ struct mac_link {
 struct mii_regs {
 	unsigned int addr;	/* MII Address */
 	unsigned int data;	/* MII Data */
-	unsigned int addr_mask;		/* MII address mask */
-	unsigned int reg_mask;		/* MII reg mask */
-	unsigned int clk_csr_mask;
+	u32 addr_mask;		/* MII address mask */
+	u32 reg_mask;		/* MII reg mask */
+	u32 clk_csr_mask;
 };
 
 struct mac_device_info {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 6dfccc969d0e..a6f8e78856aa 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -369,7 +369,7 @@ static int loongson_dwmac_setup(void *apriv, struct mac_device_info *mac)
 	mac->mii.data = GMAC_MII_DATA;
 	mac->mii.addr_mask = 0x0000F800;
 	mac->mii.reg_mask = 0x000007C0;
-	mac->mii.clk_csr_mask = GENMASK(5, 2);
+	mac->mii.clk_csr_mask = GENMASK_U32(5, 2);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 6b18072112db..3ce03b059277 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1063,9 +1063,9 @@ static int sun8i_dwmac_setup(void *ppriv, struct mac_device_info *mac)
 	mac->link.duplex = EMAC_DUPLEX_FULL;
 	mac->mii.addr = EMAC_MDIO_CMD;
 	mac->mii.data = EMAC_MDIO_DATA;
-	mac->mii.reg_mask = GENMASK(8, 4);
-	mac->mii.addr_mask = GENMASK(16, 12);
-	mac->mii.clk_csr_mask = GENMASK(22, 20);
+	mac->mii.reg_mask = GENMASK_U32(8, 4);
+	mac->mii.addr_mask = GENMASK_U32(16, 12);
+	mac->mii.clk_csr_mask = GENMASK_U32(22, 20);
 	mac->unicast_filter_entries = 8;
 
 	/* Synopsys Id is not available */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 10acca806f4f..4ea55be04c5c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -498,7 +498,7 @@ int dwmac1000_setup(struct stmmac_priv *priv)
 	mac->mii.data = GMAC_MII_DATA;
 	mac->mii.addr_mask = 0x0000F800;
 	mac->mii.reg_mask = 0x000007C0;
-	mac->mii.clk_csr_mask = GENMASK(5, 2);
+	mac->mii.clk_csr_mask = GENMASK_U32(5, 2);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
index 911753b9889e..7c91ea2775d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac100_core.c
@@ -186,7 +186,7 @@ int dwmac100_setup(struct stmmac_priv *priv)
 	mac->mii.data = MAC_MII_DATA;
 	mac->mii.addr_mask = 0x0000F800;
 	mac->mii.reg_mask = 0x000007C0;
-	mac->mii.clk_csr_mask = GENMASK(5, 2);
+	mac->mii.clk_csr_mask = GENMASK_U32(5, 2);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 0e87590c806b..602771e19d0f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -1030,9 +1030,9 @@ int dwmac4_setup(struct stmmac_priv *priv)
 	mac->link.speed_mask = GMAC_CONFIG_FES | GMAC_CONFIG_PS;
 	mac->mii.addr = GMAC_MDIO_ADDR;
 	mac->mii.data = GMAC_MDIO_DATA;
-	mac->mii.addr_mask = GENMASK(25, 21);
-	mac->mii.reg_mask = GENMASK(20, 16);
-	mac->mii.clk_csr_mask = GENMASK(11, 8);
+	mac->mii.addr_mask = GENMASK_U32(25, 21);
+	mac->mii.reg_mask = GENMASK_U32(20, 16);
+	mac->mii.clk_csr_mask = GENMASK_U32(11, 8);
 	mac->num_vlan = stmmac_get_num_vlan(priv->ioaddr);
 
 	return 0;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index ba98e22f1c12..915e7c2ab11f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1551,9 +1551,9 @@ int dwxgmac2_setup(struct stmmac_priv *priv)
 
 	mac->mii.addr = XGMAC_MDIO_ADDR;
 	mac->mii.data = XGMAC_MDIO_DATA;
-	mac->mii.addr_mask = GENMASK(20, 16);
-	mac->mii.reg_mask = GENMASK(15, 0);
-	mac->mii.clk_csr_mask = GENMASK(21, 19);
+	mac->mii.addr_mask = GENMASK_U32(20, 16);
+	mac->mii.reg_mask = GENMASK_U32(15, 0);
+	mac->mii.clk_csr_mask = GENMASK_U32(21, 19);
 	mac->num_vlan = stmmac_get_num_vlan(priv->ioaddr);
 
 	return 0;
@@ -1591,9 +1591,9 @@ int dwxlgmac2_setup(struct stmmac_priv *priv)
 
 	mac->mii.addr = XGMAC_MDIO_ADDR;
 	mac->mii.data = XGMAC_MDIO_DATA;
-	mac->mii.addr_mask = GENMASK(20, 16);
-	mac->mii.reg_mask = GENMASK(15, 0);
-	mac->mii.clk_csr_mask = GENMASK(21, 19);
+	mac->mii.addr_mask = GENMASK_U32(20, 16);
+	mac->mii.reg_mask = GENMASK_U32(15, 0);
+	mac->mii.clk_csr_mask = GENMASK_U32(21, 19);
 
 	return 0;
 }
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
