Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KQfL59poWkUsgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:53:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EEF1B5971
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:53:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29D47C87EC5;
	Fri, 27 Feb 2026 09:53:35 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 030A2C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 09:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HpbjwxiELUOxPGAuBvAylWWMUmFWvkZ3ZUdWMaGoq20=; b=eldennK8xmhR/G1rhdaVlU1iJp
 E1RgEodT8Zl8VOw8xFedxN7SSIvTvbDRvElc0u/+edz/wVN2Q1S0h/EE5JLSUSTh14zmBSg0WXuFR
 v/d6bhZuOrSB8ZtuQG+MHM2dfgFIiWQdfYwt386Sxr6FrDbWj7dXkXVr+P/DqNTL6x4jwth+ewhqC
 yxPMRbUSLu31zeJ6JIXNAjbt4LgPGEmEPZS7cO6dPVxIytcNZhu2MTkDqOtZqxUYh1vdHwCQKUU7u
 OuqEuCO7nO32wRjy5TtHJ7LN8SKEQf+00NHzVoGUWMyKwfY0rL7QsfkP7Z4CX6LtpX5nMYTz4f3/k
 un0sENcQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43848 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vvuXG-000000000cf-09tT;
 Fri, 27 Feb 2026 09:53:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vvuXE-0000000Avmr-0eB0; Fri, 27 Feb 2026 09:53:24 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vvuXE-0000000Avmr-0eB0@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:24 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 04/14] net: stmmac: remove
	.get_tx_ls()
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
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.813];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 64EEF1B5971
X-Rspamd-Action: no action

No code calls stmmac_get_tx_ls(). Remove this macro, its associated
function pointer, and all implementations.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c   | 7 -------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ------
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c       | 6 ------
 drivers/net/ethernet/stmicro/stmmac/hwif.h           | 4 ----
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c      | 6 ------
 5 files changed, 29 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index b8fe4ad883e5..56a88b71def9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -191,12 +191,6 @@ static void dwmac4_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 	p->des3 |= cpu_to_le32(flags);
 }
 
-static int dwmac4_get_tx_ls(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des3) & TDES3_LAST_DESCRIPTOR)
-		>> TDES3_LAST_DESCRIPTOR_SHIFT;
-}
-
 static u16 dwmac4_wrback_get_rx_vlan_tci(struct dma_desc *p)
 {
 	return (le32_to_cpu(p->des0) & RDES0_VLAN_TAG_MASK);
@@ -549,7 +543,6 @@ const struct stmmac_desc_ops dwmac4_desc_ops = {
 	.get_tx_len = dwmac4_rd_get_tx_len,
 	.set_tx_owner = dwmac4_set_tx_owner,
 	.set_rx_owner = dwmac4_set_rx_owner,
-	.get_tx_ls = dwmac4_get_tx_ls,
 	.get_rx_vlan_tci = dwmac4_wrback_get_rx_vlan_tci,
 	.get_rx_vlan_valid = dwmac4_wrback_get_rx_vlan_valid,
 	.get_rx_frame_len = dwmac4_wrback_get_rx_frame_len,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 8bf373513930..f5deceb052d7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -60,11 +60,6 @@ static void dwxgmac2_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 	p->des3 |= cpu_to_le32(flags);
 }
 
-static int dwxgmac2_get_tx_ls(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des3) & XGMAC_RDES3_LD) > 0;
-}
-
 static u16 dwxgmac2_wrback_get_rx_vlan_tci(struct dma_desc *p)
 {
 	return le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG_MASK;
@@ -353,7 +348,6 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.get_tx_len = dwxgmac2_get_tx_len,
 	.set_tx_owner = dwxgmac2_set_tx_owner,
 	.set_rx_owner = dwxgmac2_set_rx_owner,
-	.get_tx_ls = dwxgmac2_get_tx_ls,
 	.get_rx_vlan_tci = dwxgmac2_wrback_get_rx_vlan_tci,
 	.get_rx_vlan_valid = dwxgmac2_wrback_get_rx_vlan_valid,
 	.get_rx_frame_len = dwxgmac2_get_rx_frame_len,
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 77b2cb34aa0e..3c241c5699ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -287,11 +287,6 @@ static void enh_desc_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 	p->des0 |= cpu_to_le32(RDES0_OWN);
 }
 
-static int enh_desc_get_tx_ls(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des0) & ETDES0_LAST_SEGMENT) >> 29;
-}
-
 static void enh_desc_release_tx_desc(struct dma_desc *p, int mode)
 {
 	int ter = (le32_to_cpu(p->des0) & ETDES0_END_RING) >> 21;
@@ -446,7 +441,6 @@ const struct stmmac_desc_ops enh_desc_ops = {
 	.release_tx_desc = enh_desc_release_tx_desc,
 	.prepare_tx_desc = enh_desc_prepare_tx_desc,
 	.set_tx_ic = enh_desc_set_tx_ic,
-	.get_tx_ls = enh_desc_get_tx_ls,
 	.set_tx_owner = enh_desc_set_tx_owner,
 	.set_rx_owner = enh_desc_set_rx_owner,
 	.get_rx_frame_len = enh_desc_get_rx_frame_len,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 50ca8dcea2fd..e317f64a0fcc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -56,8 +56,6 @@ struct stmmac_desc_ops {
 	/* Clear interrupt on tx frame completion. When this bit is
 	 * set an interrupt happens as soon as the frame is transmitted */
 	void (*set_tx_ic)(struct dma_desc *p);
-	/* Last tx segment reports the transmit status */
-	int (*get_tx_ls)(struct dma_desc *p);
 	/* Get the tag of the descriptor */
 	u16 (*get_rx_vlan_tci)(struct dma_desc *p);
 	/* Get the valid status of descriptor */
@@ -119,8 +117,6 @@ struct stmmac_desc_ops {
 	stmmac_do_void_callback(__priv, desc, release_tx_desc, __args)
 #define stmmac_set_tx_ic(__priv, __args...) \
 	stmmac_do_void_callback(__priv, desc, set_tx_ic, __args)
-#define stmmac_get_tx_ls(__priv, __args...) \
-	stmmac_do_callback(__priv, desc, get_tx_ls, __args)
 #define stmmac_get_rx_vlan_tci(__priv, __args...) \
 	stmmac_do_callback(__priv, desc, get_rx_vlan_tci, __args)
 #define stmmac_get_rx_vlan_valid(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index e9face06b950..621bc1deb4e5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -151,11 +151,6 @@ static void ndesc_set_rx_owner(struct dma_desc *p, int disable_rx_ic)
 	p->des0 |= cpu_to_le32(RDES0_OWN);
 }
 
-static int ndesc_get_tx_ls(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des1) & TDES1_LAST_SEGMENT) >> 30;
-}
-
 static void ndesc_release_tx_desc(struct dma_desc *p, int mode)
 {
 	int ter = (le32_to_cpu(p->des1) & TDES1_END_RING) >> 25;
@@ -292,7 +287,6 @@ const struct stmmac_desc_ops ndesc_ops = {
 	.release_tx_desc = ndesc_release_tx_desc,
 	.prepare_tx_desc = ndesc_prepare_tx_desc,
 	.set_tx_ic = ndesc_set_tx_ic,
-	.get_tx_ls = ndesc_get_tx_ls,
 	.set_tx_owner = ndesc_set_tx_owner,
 	.set_rx_owner = ndesc_set_rx_owner,
 	.get_rx_frame_len = ndesc_get_rx_frame_len,
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
