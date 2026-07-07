Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uGMzNYbxTGqRsQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 14:31:02 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0F771B5F9
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 14:31:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=lunn.ch header.s=20171124 header.b=XIu7VbCJ;
	dmarc=fail reason="SPF not aligned (strict)" header.from=lunn.ch (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C738C8F273;
	Tue,  7 Jul 2026 12:31:01 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80816C01FB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 12:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=cbADDMxZOUl90eLH+497cEm5EOEWvROIQWQdHvcJbd0=; b=XIu7VbCJJ5FSDP+kiIZr7v7aZQ
 cWr5G4/+cmIowfkA/MRJl9l/ONJvX97HXe6BAvm3DSf4gZp8V8N/dRLpCvb2IS0Sq7aYqKcq0m1Vj
 QoIUOqLBlgAoyCzv7QKT6cyQvcXTgjpmzw2DIWuzfEhwV3fR82NxlcEnjcWy3udvAGIg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1wh4wm-00B9uK-EB; Tue, 07 Jul 2026 14:30:44 +0200
Date: Tue, 7 Jul 2026 14:30:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Thompson <daniel@riscstar.com>
Message-ID: <9f949b97-da81-4bdc-8be5-68f7883d768c@lunn.ch>
References: <20260706-tc956x-stmmac-no_irq_teardown-v1-1-df009d0272bf@riscstar.com>
 <akzLgrzsw4xYmnLH@aspen.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <akzLgrzsw4xYmnLH@aspen.lan>
Cc: linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Alex Elder <elder@riscstar.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Avoid freeing and
 re-requesting IRQ during XDP set prog
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[lunn.ch:s=20171124];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lunn.ch : SPF not aligned (strict),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel@riscstar.com,m:linux-kernel@vger.kernel.org,m:hawk@kernel.org,m:daniel@iogearbox.net,m:elder@riscstar.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:john.fastabend@gmail.com,m:ast@kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:sdf@fomichev.me,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:bpf@vger.kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:johnfastabend@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,iogearbox.net,riscstar.com,st-md-mailman.stormreply.com,gmail.com,lunn.ch,google.com,fomichev.me,redhat.com,davemloft.net,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB0F771B5F9

On Tue, Jul 07, 2026 at 10:48:50AM +0100, Daniel Thompson wrote:
> On Mon, Jul 06, 2026 at 05:17:58PM +0100, Daniel Thompson wrote:
> > Currently stmmac will run a full cycle of IRQ tear down and setup when
> > setting up a new XDP program. This makes tuning TSN systems difficult
> > because whenever a new XDP program is installed then the irq threads will
> > be stopped and restarted which will undo any thread tuning.
> >
> > The problem is avoided by removing stmmac_free_irq()/stmmac_request_irq()
> > from stmmac_xdp_release()/stmmac_xdp_open().
> >
> > stmmac_free_irq() implicitly synchronizes interrupts and, with that
> > removed, I was unable to prove that later actions in
> > stmmac_xdp_release() are safe when there are concurrent interrupts. To
> > avoid problems let's also move the code to disable DMA interrupts earlier
> > in the sequence and explicitly sync the interrupts handler(s).
> >
> > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > <snip>
> > @@ -7156,10 +7201,8 @@ int stmmac_xdp_open(struct net_device *dev)
> >  	stmmac_reset_queues_param(priv);
> >
> >  	/* DMA CSR Channel configuration */
> > -	for (chan = 0; chan < dma_csr_ch; chan++) {
> > +	for (chan = 0; chan < dma_csr_ch; chan++)
> >  		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
> > -		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
> > -	}
> 
> Sashiko picked up that stmmac_init_chan() has the effect of enabling DMA
> irqs, making this code unsafe.
> 
> Given stmmac_xdp_open() can only be called on a running interface (and that
> stmmac_xdp_open() explicitly sets sph) then re-initializing with stmmac_init_chan()
> should have no effect and we can drop that as well.

Something i like to see is symmetry. In theory, stmmac_xdp_open() and
stmmac_xdp_release() should be mirrors of each other. But i don't see
anything like the opposite of stmmac_init_chan() in
stmmac_xdp_release(). So i can well understand that something is
wrong.

Maybe rather than just fixing this IRQ issue, you can look at both
functions and see about making them symmetric? I've no idea what that
actually entails, it could be a can of worms, which is not so uncommon
with stmmmac.

     Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
