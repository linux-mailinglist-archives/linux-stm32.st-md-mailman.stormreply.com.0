Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNzXOWWTsmnONgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 11:20:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BC527047E
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 11:20:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B511C8F28E;
	Thu, 12 Mar 2026 10:20:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 868B3C8F26C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7M4qvN4KUZhWeHz0+r2If9XfOaCaAnmKNLe00xCAwms=; b=AgHfX0ywq0f8GgRoj9tWRutBkV
 9wnzNsFoonOhOX5BtxqwJQH+uO0MYHFSue9LQlpxcby+RMPfwLaOaUudOEeJT3ZHeQw+J+oN+MLbS
 GfDdQ15a8DgIlOxl5s3wzciXSFUYvALymQDHArQ/jCrfLayRWv+X6gn66l1K7m8gQsTQe+Ob0IKjX
 jXcVj2jLqKYgyNZB6o0rKLA/vv8W7rlQ0xzLocuArRZfaOe71f08qAm7U7iQRxdcigPGIyKRe1cxz
 Jwj4caBAZ1Io7HuLhixt/2utknZkHkT92OyiZ6hxxnJaOcXPhg4lA5igrPkaj4/gfG0E7frtUZQ8Q
 AJglKbMA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:54042 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <rmk@armlinux.org.uk>) id 1w0czU-000000007bH-3XYl;
 Thu, 12 Mar 2026 10:10:05 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1w0czP-0000000CzHE-1hSo; Thu, 12 Mar 2026 10:09:59 +0000
In-Reply-To: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
References: <abKQWloxp9_4OuJh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1w0czP-0000000CzHE-1hSo@rmk-PC.armlinux.org.uk>
Date: Thu, 12 Mar 2026 10:09:59 +0000
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH net-next v2 14/15] net: stmmac: remove
	tx_tail_addr
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:hawk@kernel.org,m:daniel@iogearbox.net,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:ast@kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:sdf@fomichev.me,m:kuba@kernel.org,m:bpf@vger.kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[rmk@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.996];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[rmk-PC.armlinux.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,armlinux.org.uk:email,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 99BC527047E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is only one place where tx_q->tx_tail_addr is used - the new
stmmac_set_queue_tx_tail_ptr(). Make this a local variable and remove
it from struct stmmac_tx_queue.

This commit does not change the semantics - the hardware relies upon
the descriptor ring not crossing a 4GiB boundary as the high address
bits are programmed into a separate register via stmmac_init_tx_chan().
Hence, truncating the DMA address to 32-bit is fine as the register it
will be programmed into is 32-bit, and the high bits are handled
elsewhere.

Also change the type of desc_size to size_t, as this variable is
initialised from sizeof().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 1 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index d1f8383d1c04..7cc5967aecd7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -79,7 +79,6 @@ struct stmmac_tx_queue {
 	unsigned int cur_tx;
 	unsigned int dirty_tx;
 	dma_addr_t dma_tx_phy;
-	dma_addr_t tx_tail_addr;
 	u32 mss;
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4521469c5e1d..55b79e9e637f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -389,12 +389,13 @@ static void stmmac_set_queue_tx_tail_ptr(struct stmmac_priv *priv,
 					 struct stmmac_tx_queue *tx_q,
 					 unsigned int chan, unsigned int index)
 {
-	int desc_size;
+	size_t desc_size;
+	u32 tx_tail_addr;
 
 	desc_size = stmmac_get_tx_desc_size(priv, tx_q);
 
-	tx_q->tx_tail_addr = tx_q->dma_tx_phy + index * desc_size;
-	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_q->tx_tail_addr, chan);
+	tx_tail_addr = tx_q->dma_tx_phy + index * desc_size;
+	stmmac_set_tx_tail_ptr(priv, priv->ioaddr, tx_tail_addr, chan);
 }
 
 static size_t stmmac_get_rx_desc_size(struct stmmac_priv *priv)
-- 
2.47.3

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
