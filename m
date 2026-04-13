Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPCACdU63Wk3awkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:49:57 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A283F23C0
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 20:49:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09DB7C3F944;
	Mon, 13 Apr 2026 18:49:56 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83DDFC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 18:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7/4Rz38FYHztW6Uw1aNeN0nYjBCQSBspRwjLSoc/tsM=; b=AGyOB4mgu+d1VyICZUwGFZYT7Y
 K5ED2R/bZWOpa+WMGx1kypTsJun3aoDxwDmxuspMMi8EcrLx1zd1lR8YLlhb6vKyT0RW5WvpZKuYq
 cxURkcwXpCCLK6PzcmdaXdvjY/fnwnH6ieYN/E/WxIgSs3Exs3lizWZqArxy6t4V4LSnl7kvTLdPi
 NKPNRBKpUga6LGv9FxnneG2EIS6+HJjFwAgo8/2b0g9npPpfKIpu8RmkZ8uMhMciskcsRToRnu9Wz
 iV7yFrXKyKrG90eT1uK1AjJuoACzDOrH/29hAbh8zTS44fWhJtdDYIe1zAkCWmVTUzk3GCYry9qXn
 0LkeLXpw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51338)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wCMM1-000000000Bu-2Naq;
 Mon, 13 Apr 2026 19:49:49 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wCMLy-000000000RD-22Jt; Mon, 13 Apr 2026 19:49:46 +0100
Date: Mon, 13 Apr 2026 19:49:46 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260413110222.49fc3759@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Sam Edwards <cfsworks@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: enable RPS and RBU
	interrupts
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:andrew@lunn.ch,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:cfsworks@gmail.com,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,vger.kernel.org,st-md-mailman.stormreply.com,google.com,gmail.com,redhat.com,davemloft.net,lists.infradead.org];
	NEURAL_SPAM(0.00)[0.888];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,armlinux.org.uk:url,shell.armlinux.org.uk:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: A9A283F23C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 13, 2026 at 11:02:22AM -0700, Jakub Kicinski wrote:
> On Fri, 10 Apr 2026 14:07:51 +0100 Russell King (Oracle) wrote:
> > Since we are seeing receive buffer exhaustion on several platforms,
> > let's enable the interrupts so the statistics we publish via ethtool -S
> > actually work to aid diagnosis. I've been in two minds about whether
> > to send this patch, but given the problems with stmmac at the moment,
> > I think it should be merged.
> 
> Sorry for a under-research response but wasn't there are person trying
> to fix the OOM starvation issue? Who was supposed to add a timer?
> Is your problem also OOM related or do you suspect something else?

It is not OOM related. I have this patch applied:

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 131ea887bedc..614d0e10e3e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -5095,14 +5095,18 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv, u32 queue)
 
 		if (!buf->page) {
 			buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
-			if (!buf->page)
+			if (!buf->page) {
+				netdev_err(priv->dev, "q%u: no buffer 1\n", queue);
 				break;
+			}
 		}
 
 		if (priv->sph_active && !buf->sec_page) {
 			buf->sec_page = page_pool_alloc_pages(rx_q->page_pool, gfp);
-			if (!buf->sec_page)
+			if (!buf->sec_page) {
+				netdev_err(priv->dev, "q%u: no buffer 2\n", queue);
 				break;
+			}
 
 			buf->sec_addr = page_pool_get_dma_addr(buf->sec_page);
 		}

and it is silent, so we are not suffering starvation of buffers.

However, the hardware hangs during iperf3, and because it triggers the
MAC to stream PAUSE frames, and my network uses Netgear GS108 and GS116
unmanaged switches that always use flow-control between them (there's no
way not to) it takes down the entire network - as we've discussed
before. So, this problem is pretty fatal to the *entire* network.

With this patch, the existing statistical counters for this condition
are incremented, and thus users can use ethtool -S to see what happened
and report whether they are seeing the same issue.

Without this patch applied, there are no diagnostics from stmmac that
report what the state is. ethtool -d doesn't list the appropriate
registers (as I suspect part of the problem is the number of queues
is somewhat dynamic - userspace can change that configuration through
ethtool).

Thus, one has to resort to using devmem2 to find out what's happened.
That's not user friendly.

For me, devmem2 shows:

Channel 0 status register:
Value at address 0x02491160: 0x00000484
bit 10: ETI early transmit interrupt - set
bit 9 : RWT receive watchdog - clear
bit 8 : RPS receieve process stopped - clear
bit 7 : RBU receive buffer unavailable - set
bit 6 : RI  receive interrupt - clear
bit 2 : TBU transmit buffer unavailable - set
bit 1 : TPS transmit process stopped - clear
bit 0 : TI  transmit interrupt - clear

Debug status register:
Value at address 0x0249100c: 0x00006300
TPS[3:0] = 6 = Suspended, Tx descriptor unavailable or Tx buffer
		underflow
RPS[3:0] = 3 = Running, waiting for Rx packet

Metal Queue 0 debug register:
Value at address 0x02490d38: 0x002e0020
PRXQ[13:0] = 0x2e = 46 packets in receive queue
RXQSTS[1:0] = 2 = Rx queue fill-level above flow-control activate
		threshold
RRCSTS[1:0] = 0 = Rx Queue Read Controller State = Idle

> Firing interrupts when Rx fill ring runs dry (which IIUC this patches
> dies?) is not a good idea.

Well, I'm thinking that at least on some platforms, such as the Jetson
Xavier NX, unless a different solution can be found, we need the RBU
interrupt to fire off a reset of the stmmac IP when this happens to
reduce the PAUSE frame flood on the network.

If we can't do that, then I think stmmac on these platforms needs to be
marked with CONFIG_BROKEN because right now there doesn't seem to be any
other viable solution.

My intention with this patch is merely to start collecting the already
existing statistics so other users can start seeing whether they are
hitting the same or similar problem. If we're not prepared to do that,
then we should delete the useless statistics from ethtool -S, but I
suspect they're now part of the UAPI, even though without this patch
they will remain stedfastly stuck at zero.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
