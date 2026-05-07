Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EEmJAy+/GnSTAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 18:30:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A8E4EC3BC
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 18:30:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5741C8F289;
	Thu,  7 May 2026 16:30:03 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3409BC8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 16:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=kYKaL1jQ8LGdN9smjIQLGtIx8ZielLRVj4GVygHNyZw=; b=iWVScX3t1Vr7jT65EBijDEZtTC
 xR/IYFApXe/XCCjv6FXei/9xmMjJxEdUZzW87RUeUyhJcv+B3eVHQz9NAIK/eJD4bXgOtQg4e8bFF
 6Q7shNjm3ibz3YIv1APpxKSOp0zLPRl0qLPCWLDITqKG+x6Yq2AcgJxHUp5giJaS4zUk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1wL1b9-001qT0-IB; Thu, 07 May 2026 18:29:15 +0200
Date: Thu, 7 May 2026 18:29:15 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Thompson <daniel@riscstar.com>
Message-ID: <ef6df85f-11ac-404d-958a-8cf69b3b6bb6@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
 <afy34kj2hPxIlArO@aspen.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afy34kj2hPxIlArO@aspen.lan>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 chenchuangyu@xiaomi.com, edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 Alex Elder <elder@riscstar.com>, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: tc956x: add
 TC956x/QPS615 support
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
X-Rspamd-Queue-Id: 37A8E4EC3BC
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:daniel@riscstar.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a09872
 03069@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.214];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 05:03:46PM +0100, Daniel Thompson wrote:
> On Fri, May 01, 2026 at 09:04:58PM +0200, Andrew Lunn wrote:
> > > +static struct tc956x_mac_speed mac_speed[] = {
> > > +	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M, },
> >
> > That looks odd. Some vendors implemented 2500BaseX using SGMII
> > overclocked. But that is not strictly 2500BaseX. Having the 2500BASEX
> > entry suggests you have real 2500BASEX, so why have an SGMII entry
> > with SPEED_2500?
> 
> This is a consequence of the code that uses this lookup table being
> called both during initialization and from the fix_mac_speed() callback.
> 
> During initialization we only have the value in plat->phy_interface to
> go on so we run the lookup table using plat->phy_interface (which is
> typically PHY_INTERFACE_MODE_SGMII) and with the maximum permitted
> speed.

Something sounds wrong here. SGMII only supports 10/100/1G. You should
never be asked to do SGMII at 2500. It should ask for 2500BaseX.

> I haven't got detailed enough notes to allow me to double check but I
> think there were problems completing the initial MAC reset if we didn't
> write something sensible to the hardware during initialization.

> During fix_max_speed() we get told to adopt 2500base-x. Reviewing the
> code I can see we don't propagate that and just use
> plat->phy_interface for fix_mac_speed(). I will fix the code to that
> the requested interface propagates properly to the lookup table but I
> think we would still rely on the SGMII entry to get sane initial values
> to write to the hardware.

Getting sane values into the hardware is good, but 2500 SGMII is not
sane :-(

> > Doesn't that break any other dwxgmac301 in the system? Shouldn't you
> > be making a copy of the global structure, and then making
> > modifications to your copy? mac->dma then points to your copy?
> 
> That's exactly what this code does.
> 
> `*dma = dwxgmac301_dma_ops` is a structure copy, we never take a pointer
> to dwxgmac301_dma_ops (and if we did, dwxgmac301_dma_ops is const so I
> think we'd get a kernel oops if we tried to write to rodata).
> 
> Would to code be easier to read if we dropped the local `dma` variable
> since that would make it clearer that td->dma is not a pointer? More
> like:

> +       /* dwxgmac301_dma_ops needs extending to provide DMA address translation */
> +       td->dma = dwxgmac301_dma_ops;
> +       td->dma.init_rx_chan = tc956x_dma_init_rx_chan;
> +       td->dma.init_tx_chan = tc956x_dma_init_tx_chan;
> +       mac->dma = &dma;

Yes, that is better. I also think it is partially my problem. You
don't often see structure assignments, just pointer assignments. So
i'm somewhat blind to them.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
