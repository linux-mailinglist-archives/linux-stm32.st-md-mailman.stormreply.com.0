Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMu0NSQDtGnCfAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 13:29:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B80AD282F76
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 13:29:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7EA68C8F29C;
	Fri, 13 Mar 2026 12:29:24 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 04F56C87ED6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 12:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dkwtyxaeu1TFqzHLC2kV5Q12F42JPNGj6LMN8t6hACM=; b=HjBD/CCfYqxGD/pb4IMfhjW1W9
 tDRIbO82u46aCto2MchWsDPU51AjBH74AcuILEpngO3swH0diPPFjBHBXe94ZzCWiT2fTXRoEu4qc
 vYvZNYpHC8v1DTcyzdQsKbliQseG5qN3s2vyzr9wbL353IcyeTN9a/zw47mBA0YBYkGITcNTIJmyh
 BL8H9CS89Mnle5WIOwTk3oaV+ErPkI66dPumu8gcQgpGN1Su2P+6SZFAnzQSfSG22khkItEr+jW34
 yHd9iGrJggKH1zywvgsWe7iQaRfYHAerMmSGJdBmY4xbOtINEUJoOGJbZPCD6HgVMOwDNWRNPnbHO
 6vY3NK+w==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:55736 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w11dg-000000000vJ-1OlU;
 Fri, 13 Mar 2026 12:29:12 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w11df-0000000DEiG-1ilq; Fri, 13 Mar 2026 12:29:11 +0000
In-Reply-To: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w11df-0000000DEiG-1ilq@rmk-PC.armlinux.org.uk>
Date: Fri, 13 Mar 2026 12:29:11 +0000
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 4/8] net: stmmac: use integrated PCS
	for BASE-X modes
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[kernel];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,bootlin.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,rmk-PC.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: B80AD282F76
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dwmac-qcom-ethqos supports SGMII and 2500BASE-X using the integrated
PCS, so we need to expand the PCS support to include support for
BASE-X modes.

Add support to the prereset configuration to detect 2500BASE-X, and
arrange for stmmac_mac_select_pcs() to return the integrated PCS if
its supported_interfaces bitmap reports support for the interface mode.

This results in priv->hw->pcs now being write-only, so remove it.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/common.h      | 4 ----
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/common.h b/drivers/net/ethernet/stmicro/stmmac/common.h
index f1628de8ed18..c9dac55d0c02 100644
--- a/drivers/net/ethernet/stmicro/stmmac/common.h
+++ b/drivers/net/ethernet/stmicro/stmmac/common.h
@@ -278,9 +278,6 @@ struct stmmac_safety_stats {
 #define FLOW_TX		2
 #define FLOW_AUTO	(FLOW_TX | FLOW_RX)
 
-/* PCS defines */
-#define STMMAC_PCS_SGMII	(1 << 1)
-
 #define SF_DMA_MODE 1		/* DMA STORE-AND-FORWARD Operation Mode */
 
 /* DMA HW feature register fields */
@@ -632,7 +629,6 @@ struct mac_device_info {
 	unsigned int unicast_filter_entries;
 	unsigned int mcast_bits_log2;
 	unsigned int rx_csum;
-	unsigned int pcs;
 	unsigned int num_vlan;
 	u32 vlan_filter[32];
 	bool vlan_fail_q_en;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 11150bddd872..9e6d7f0e88d5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -946,11 +946,8 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
 			return pcs;
 	}
 
-	/* The PCS control register is only relevant for SGMII, TBI and RTBI
-	 * modes. We no longer support TBI or RTBI, so only configure this
-	 * register when operating in SGMII mode with the integrated PCS.
-	 */
-	if (priv->hw->pcs & STMMAC_PCS_SGMII && priv->integrated_pcs)
+	if (priv->integrated_pcs &&
+	    test_bit(interface, priv->integrated_pcs->pcs.supported_interfaces))
 		return &priv->integrated_pcs->pcs;
 
 	return NULL;
@@ -1209,7 +1206,6 @@ static void stmmac_check_pcs_mode(struct stmmac_priv *priv)
 
 	if (priv->dma_cap.pcs && interface == PHY_INTERFACE_MODE_SGMII) {
 		netdev_dbg(priv->dev, "PCS SGMII support enabled\n");
-		priv->hw->pcs = STMMAC_PCS_SGMII;
 
 		switch (speed) {
 		case SPEED_10:
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
