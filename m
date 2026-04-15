Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6JLeGRKL32l5VAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 14:56:50 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F8D40491B
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Apr 2026 14:56:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9542EC8F286;
	Wed, 15 Apr 2026 12:56:49 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A5D9C8F275
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Apr 2026 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H6Fvhuo4DkldsPVDo20mT9bIWk6orSSbm77N0GIMwrE=; b=dWBpN9W92CDVnlfI9sNMjT5Nup
 JZZr7ViAfsir0I9K6wpLBymyIbaZrNqLVEncxmeoyrEmefVQx7IhCxsxsA5RA+PPZr1Vp7/tPot+/
 CNq1cS1u1XN7i74+5/oWt2v3wIU+JnvA96qNZqXevQeFrcHyl4X+VDDYaJ6cxAeVdrkAaMG+we0FV
 ZXvq2uOOkLEjwBqqYmrl312E3o6thrmT8yV4ABjwsdjOte3koAReDrFLyf/P3jaVST3w0zHAYJura
 UxsOuj4rT/nTFDH/FrtIOzQmiXFoDo/SIH3tF+ckt/9k2qQ2dP1q+zdfdHxatZQjI9zf6Lt/ekFr+
 ZkJ1enaw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36538)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1wCznH-00000000267-27zv;
 Wed, 15 Apr 2026 13:56:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1wCznE-000000002ED-2SR5; Wed, 15 Apr 2026 13:56:32 +0100
Date: Wed, 15 Apr 2026 13:56:32 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sam Edwards <cfsworks@gmail.com>
Message-ID: <ad-LAB08-_rpmMzK@shell.armlinux.org.uk>
References: <20260415023947.7627-1-CFSworks@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415023947.7627-1-CFSworks@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>, linux-kernel@vger.kernel.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, stable@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Subject: Re: [Linux-stm32] [PATCH net v5] net: stmmac: Prevent NULL deref
 when RX memory exhausted
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:cfsworks@gmail.com,m:baruch@tkos.co.il,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:fancer.lancer@gmail.com,m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:netdev@vger.kernel.org,m:stable@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:peppe.cavallaro@st.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:ovidiu.panait.rb@renesas.com,m:fancerlancer@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[tkos.co.il,vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,gmail.com,bootlin.com,lunn.ch,google.com,st.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.871];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,armlinux.org.uk:url,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: F2F8D40491B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 07:39:47PM -0700, Sam Edwards wrote:
> The CPU receives frames from the MAC through conventional DMA: the CPU
> allocates buffers for the MAC, then the MAC fills them and returns
> ownership to the CPU. For each hardware RX queue, the CPU and MAC
> coordinate through a shared ring array of DMA descriptors: one
> descriptor per DMA buffer. Each descriptor includes the buffer's
> physical address and a status flag ("OWN") indicating which side owns
> the buffer: OWN=0 for CPU, OWN=1 for MAC. The CPU is only allowed to set
> the flag and the MAC is only allowed to clear it, and both must move
> through the ring in sequence: thus the ring is used for both
> "submissions" and "completions."
> 
> In the stmmac driver, stmmac_rx() bookmarks its position in the ring
> with the `cur_rx` index. The main receive loop in that function checks
> for rx_descs[cur_rx].own=0, gives the corresponding buffer to the
> network stack (NULLing the pointer), and increments `cur_rx` modulo the
> ring size. After the loop exits, stmmac_rx_refill(), which bookmarks its
> position with `dirty_rx`, allocates fresh buffers and rearms the
> descriptors (setting OWN=1). If it fails any allocation, it simply stops
> early (leaving OWN=0) and will retry where it left off when next called.
> 
> This means descriptors have a three-stage lifecycle (terms my own):
> - `empty` (OWN=1, buffer valid)
> - `full` (OWN=0, buffer valid and populated)
> - `dirty` (OWN=0, buffer NULL)
> 
> But because stmmac_rx() only checks OWN, it confuses `full`/`dirty`. In
> the past (see 'Fixes:'), there was a bug where the loop could cycle
> `cur_rx` all the way back to the first descriptor it dirtied, resulting
> in a NULL dereference when mistaken for `full`. The aforementioned
> commit resolved that *specific* failure by capping the loop's iteration
> limit at `dma_rx_size - 1`, but this is only a partial fix: if the
> previous stmmac_rx_refill() didn't complete, then there are leftover
> `dirty` descriptors that the loop might encounter without needing to
> cycle fully around. The current code therefore panics (see 'Closes:')
> when stmmac_rx_refill() is memory-starved long enough for `cur_rx` to
> catch up to `dirty_rx`.
> 
> Fix this by further tightening the clamp from `dma_rx_size - 1` to
> `dma_rx_size - stmmac_rx_dirty() - 1`, subtracting any remnant dirty
> entries and limiting the loop so that `cur_rx` cannot catch back up to
> `dirty_rx`. This carries no risk of arithmetic underflow: since the
> maximum possible return value of stmmac_rx_dirty() is `dma_rx_size - 1`,
> the worst the clamp can do is prevent the loop from running at all.
> 
> Fixes: b6cb4541853c7 ("net: stmmac: avoid rx queue overrun")
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221010
> Cc: stable@vger.kernel.org
> Signed-off-by: Sam Edwards <CFSworks@gmail.com>

Locally, while debugging my issues, I used this to prevent cur_rx
catching up with dirty_rx:

                status = stmmac_rx_status(priv, &priv->xstats, p);
                /* check if managed by the DMA otherwise go ahead */
                if (unlikely(status & dma_own))
                        break;

                next_entry = STMMAC_NEXT_ENTRY(rx_q->cur_rx,
                                               priv->dma_conf.dma_rx_size);
                if (unlikely(next_entry == rx_q->dirty_rx))
                        break;

                rx_q->cur_rx = next_entry;

If we care about the cost of reloading rx_q->dirty_rx on every
iteration, then I'd suggest that the cost we already incur reading and
writing rx_q->cur_rx is something that should be addressed, and
eliminating that would counter the cost of reading rx_q->dirty_rx. I
suspect, however, that the cost is minimal, as cur_tx and dirty_rx are
likely in the same cache line.

It looks like any fix to stmmac_rx() will also need a corresponding
fix for stmmac_rx_zc().

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
