Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SAKENn/NummfcAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 17:06:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C022BEF80
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 17:06:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5EC05C87ED8;
	Wed, 18 Mar 2026 16:06:23 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1EB8BC87EC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Mar 2026 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nRn1H2bcEQZCC/0NKqsdFFm8gqOiKPTT8gIJOFUCakM=; b=DLhMFO7aQjNEfQxA95DoaFu6GY
 VmEiavw1VqKeX1lQYV+fCmLYs+ZZG/ML3tDPh9KEvvPblLPuFX0rqRUdENKL7g/doexBQB563TytS
 KSTCV+kABjJw8upSd31EmzxE7qCsW9x5Z+gtsgWDkzbdz6+OxJ4CbJTm40WC/H+t0UD+pCh2xZMqz
 xq2Xom2FViVIAQPGaUvrq48oQUc4UjjkbH2LoWi1s2D0iIdRl3S8Wgm5m79A1pY/9SHuPlBPjS9r9
 QdwHKrdriGVaMtlArtI0ke4tCrvCQotUPv4qdpYdecK6YHLPMEImwjuSvSZXQ1psYEPrsSuEl3d5Z
 qzbaDCoQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47262 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w2tPV-000000003ed-05G4;
 Wed, 18 Mar 2026 16:06:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w2tPU-0000000DYAd-0ssk; Wed, 18 Mar 2026 16:06:16 +0000
In-Reply-To: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
References: <abrNYVfZ1Iwff2EI@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w2tPU-0000000DYAd-0ssk@rmk-PC.armlinux.org.uk>
Date: Wed, 18 Mar 2026 16:06:16 +0000
Cc: Vinod Koul <vkoul@kernel.org>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 maybe? 2/5] net: stmmac: add
 struct stmmac_pcs_info
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
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:vkoul@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.477];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Queue-Id: 95C022BEF80
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

We need to describe one more register (offset and field bitmask) to
the PCS code. Move the existing PCS offset and interrupt enable bits
to a new struct and pass that in to stmmac_integrated_pcs_init().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c | 9 ++++++---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c    | 8 ++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c     | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h     | 9 +++++++--
 4 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index 01f8353eb6ef..c851e3b88ce5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -22,14 +22,17 @@
 #include "stmmac_ptp.h"
 #include "dwmac1000.h"
 
+static const struct stmmac_pcs_info dwmac1000_pcs_info = {
+	.pcs_offset = GMAC_PCS_BASE,
+	.int_mask = GMAC_INT_DISABLE_PCSLINK | GMAC_INT_DISABLE_PCSAN,
+};
+
 static int dwmac1000_pcs_init(struct stmmac_priv *priv)
 {
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
-					  GMAC_INT_DISABLE_PCSLINK |
-					  GMAC_INT_DISABLE_PCSAN);
+	return stmmac_integrated_pcs_init(priv, &dwmac1000_pcs_info);
 }
 
 static void dwmac1000_core_init(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index 4c6fed3ecbcf..ba5393beb7bb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -22,13 +22,17 @@
 #include "dwmac4.h"
 #include "dwmac5.h"
 
+static const struct stmmac_pcs_info dwmac4_pcs_info = {
+	.pcs_offset = GMAC_PCS_BASE,
+	.int_mask = GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE,
+};
+
 static int dwmac4_pcs_init(struct stmmac_priv *priv)
 {
 	if (!priv->dma_cap.pcs)
 		return 0;
 
-	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE,
-					  GMAC_INT_PCS_LINK | GMAC_INT_PCS_ANE);
+	return stmmac_integrated_pcs_init(priv, &dwmac4_pcs_info);
 }
 
 static void dwmac4_core_init(struct mac_device_info *hw,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 88fa359ea716..2695e0b9ed03 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -90,8 +90,8 @@ int stmmac_integrated_pcs_get_phy_intf_sel(struct phylink_pcs *pcs,
 	return -EINVAL;
 }
 
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
-			       u32 int_mask)
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
+			       const struct stmmac_pcs_info *pcs_info)
 {
 	struct stmmac_pcs *spcs;
 
@@ -100,8 +100,8 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 		return -ENOMEM;
 
 	spcs->priv = priv;
-	spcs->base = priv->ioaddr + offset;
-	spcs->int_mask = int_mask;
+	spcs->base = priv->ioaddr + pcs_info->pcs_offset;
+	spcs->int_mask = pcs_info->int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 23bbd4f10bf8..f1ee473d8e3e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -27,6 +27,11 @@
 
 struct stmmac_priv;
 
+struct stmmac_pcs_info {
+	unsigned int pcs_offset;
+	u32 int_mask;
+};
+
 struct stmmac_pcs {
 	struct stmmac_priv *priv;
 	void __iomem *base;
@@ -44,8 +49,8 @@ void stmmac_integrated_pcs_irq(struct stmmac_priv *priv, u32 status,
 			       struct stmmac_extra_stats *x);
 int stmmac_integrated_pcs_get_phy_intf_sel(struct phylink_pcs *pcs,
 					   phy_interface_t interface);
-int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
-			       u32 int_mask);
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv,
+			       const struct stmmac_pcs_info *pcs_info);
 
 /**
  * dwmac_ctrl_ane - To program the AN Control Register.
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
