Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEBjLJdpoWkUsgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:53:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7691B596A
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 10:53:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C061C87EC5;
	Fri, 27 Feb 2026 09:53:27 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 465C0C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MajI2INaGiZS8Z4dAUbnmtLgqBRNyA8jeruIw1WQWZ8=; b=wY5ite8kqx5wlkeJQJDnVlllb1
 DyI2KVjDE8pIk+rzkIO2TbV0hNqgWeDgHz67LoZgMaz55JyKXrttA8sbPewy6MvXXnyUMNggmDlBp
 6M9V9+QtxcLYuIAy9F+cZLGd4iQk5a7nEl4SXL9n/qiypMqhNs1w1+jm8B5s7UfMrO1WcKY35qudU
 NEb8/V6hxUIzb6zzGJW9hfQsNLqjhjtxegfbrDv+92/xckys8id7veS2ndOv++3O0z7lFzDqSagVd
 i17VovN1Xsuu6qv9eMrPSGUemLhRwU/Yx3vnvMnq/EdfG05Ydl3+zZBSDt/kuxytH/kvWPU17weWp
 f4hk8k8g==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43832 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1vvuX9-000000000cM-3mHE;
 Fri, 27 Feb 2026 09:53:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1vvuX9-0000000Avml-08Lo; Fri, 27 Feb 2026 09:53:19 +0000
In-Reply-To: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
References: <aaFpZvuIzOLaNM0m@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1vvuX9-0000000Avml-08Lo@rmk-PC.armlinux.org.uk>
Date: Fri, 27 Feb 2026 09:53:19 +0000
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next 03/14] net: stmmac: remove
	.get_tx_owner()
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
	NEURAL_HAM(-0.00)[-0.818];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 5E7691B596A
X-Rspamd-Action: no action

No code calls stmmac_get_tx_owner(). Remove the macro, its associated
function pointer, and all implementations.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c   | 6 ------
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c | 6 ------
 drivers/net/ethernet/stmicro/stmmac/enh_desc.c       | 6 ------
 drivers/net/ethernet/stmicro/stmmac/hwif.h           | 3 ---
 drivers/net/ethernet/stmicro/stmmac/norm_desc.c      | 6 ------
 5 files changed, 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
index e226dc6a1b17..b8fe4ad883e5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
@@ -176,11 +176,6 @@ static int dwmac4_rd_get_tx_len(struct dma_desc *p)
 	return (le32_to_cpu(p->des2) & TDES2_BUFFER1_SIZE_MASK);
 }
 
-static int dwmac4_get_tx_owner(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des3) & TDES3_OWN) >> TDES3_OWN_SHIFT;
-}
-
 static void dwmac4_set_tx_owner(struct dma_desc *p)
 {
 	p->des3 |= cpu_to_le32(TDES3_OWN);
@@ -552,7 +547,6 @@ const struct stmmac_desc_ops dwmac4_desc_ops = {
 	.tx_status = dwmac4_wrback_get_tx_status,
 	.rx_status = dwmac4_wrback_get_rx_status,
 	.get_tx_len = dwmac4_rd_get_tx_len,
-	.get_tx_owner = dwmac4_get_tx_owner,
 	.set_tx_owner = dwmac4_set_tx_owner,
 	.set_rx_owner = dwmac4_set_rx_owner,
 	.get_tx_ls = dwmac4_get_tx_ls,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 41e5b420a215..8bf373513930 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -45,11 +45,6 @@ static int dwxgmac2_get_tx_len(struct dma_desc *p)
 	return (le32_to_cpu(p->des2) & XGMAC_TDES2_B1L);
 }
 
-static int dwxgmac2_get_tx_owner(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des3) & XGMAC_TDES3_OWN) > 0;
-}
-
 static void dwxgmac2_set_tx_owner(struct dma_desc *p)
 {
 	p->des3 |= cpu_to_le32(XGMAC_TDES3_OWN);
@@ -356,7 +351,6 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.tx_status = dwxgmac2_get_tx_status,
 	.rx_status = dwxgmac2_get_rx_status,
 	.get_tx_len = dwxgmac2_get_tx_len,
-	.get_tx_owner = dwxgmac2_get_tx_owner,
 	.set_tx_owner = dwxgmac2_set_tx_owner,
 	.set_rx_owner = dwxgmac2_set_rx_owner,
 	.get_tx_ls = dwxgmac2_get_tx_ls,
diff --git a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
index 8f6993c8bcae..77b2cb34aa0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/enh_desc.c
@@ -277,11 +277,6 @@ static void enh_desc_init_tx_desc(struct dma_desc *p, int mode, int end)
 		enh_desc_end_tx_desc_on_ring(p, end);
 }
 
-static int enh_desc_get_tx_owner(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des0) & ETDES0_OWN) >> 31;
-}
-
 static void enh_desc_set_tx_owner(struct dma_desc *p)
 {
 	p->des0 |= cpu_to_le32(ETDES0_OWN);
@@ -448,7 +443,6 @@ const struct stmmac_desc_ops enh_desc_ops = {
 	.get_tx_len = enh_desc_get_tx_len,
 	.init_rx_desc = enh_desc_init_rx_desc,
 	.init_tx_desc = enh_desc_init_tx_desc,
-	.get_tx_owner = enh_desc_get_tx_owner,
 	.release_tx_desc = enh_desc_release_tx_desc,
 	.prepare_tx_desc = enh_desc_prepare_tx_desc,
 	.set_tx_ic = enh_desc_set_tx_ic,
diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
index 0db96a387259..50ca8dcea2fd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
+++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
@@ -51,7 +51,6 @@ struct stmmac_desc_ops {
 			unsigned int tcppayloadlen);
 	/* Set/get the owner of the descriptor */
 	void (*set_tx_owner)(struct dma_desc *p);
-	int (*get_tx_owner)(struct dma_desc *p);
 	/* Clean the tx descriptor as soon as the tx irq is received */
 	void (*release_tx_desc)(struct dma_desc *p, int mode);
 	/* Clear interrupt on tx frame completion. When this bit is
@@ -116,8 +115,6 @@ struct stmmac_desc_ops {
 	stmmac_do_void_callback(__priv, desc, prepare_tso_tx_desc, __args)
 #define stmmac_set_tx_owner(__priv, __args...) \
 	stmmac_do_void_callback(__priv, desc, set_tx_owner, __args)
-#define stmmac_get_tx_owner(__priv, __args...) \
-	stmmac_do_callback(__priv, desc, get_tx_owner, __args)
 #define stmmac_release_tx_desc(__priv, __args...) \
 	stmmac_do_void_callback(__priv, desc, release_tx_desc, __args)
 #define stmmac_set_tx_ic(__priv, __args...) \
diff --git a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
index 859cb9242a52..e9face06b950 100644
--- a/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/norm_desc.c
@@ -141,11 +141,6 @@ static void ndesc_init_tx_desc(struct dma_desc *p, int mode, int end)
 		ndesc_end_tx_desc_on_ring(p, end);
 }
 
-static int ndesc_get_tx_owner(struct dma_desc *p)
-{
-	return (le32_to_cpu(p->des0) & TDES0_OWN) >> 31;
-}
-
 static void ndesc_set_tx_owner(struct dma_desc *p)
 {
 	p->des0 |= cpu_to_le32(TDES0_OWN);
@@ -294,7 +289,6 @@ const struct stmmac_desc_ops ndesc_ops = {
 	.get_tx_len = ndesc_get_tx_len,
 	.init_rx_desc = ndesc_init_rx_desc,
 	.init_tx_desc = ndesc_init_tx_desc,
-	.get_tx_owner = ndesc_get_tx_owner,
 	.release_tx_desc = ndesc_release_tx_desc,
 	.prepare_tx_desc = ndesc_prepare_tx_desc,
 	.set_tx_ic = ndesc_set_tx_ic,
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
