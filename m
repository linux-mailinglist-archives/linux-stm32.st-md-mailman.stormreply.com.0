Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJkmNbIciWnB2gQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 00:30:58 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587410A988
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 00:30:58 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E30F2C5A4C5;
	Sun,  8 Feb 2026 23:30:57 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 320F6C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  8 Feb 2026 23:30:56 +0000 (UTC)
Received: from killaraus.ideasonboard.com
 (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4B5B582A;
 Mon,  9 Feb 2026 00:30:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1770593410;
 bh=BqBwXlW1DYlKifkNzuD8EgN86/kfJHvciyDW4WXpDPg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a/R3LPSpkb93wFdSWlOX+/jeCfLOWluI9DhYaiJ+yJSYViQVHcpq2vU/8sQbNM8KW
 OzgvhCQDj4C29gAhRIz/QUtDJkAZwZ1B0An2C4xXoRtexqrXdGpW4BkrBAeKi/GBLD
 X7uukJHcWOKAMAPGF88XW8kAiir3KJ3mnbQTR9/M=
Date: Mon, 9 Feb 2026 01:30:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260208233054.GA1987960@killaraus.ideasonboard.com>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
 <aYE-gvuZdv7ezm7X@shell.armlinux.org.uk>
 <20260203231832.GB133801@killaraus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260203231832.GB133801@killaraus>
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Ovidiu Panait <ovidiu.panait.oss@gmail.com>, Rob Herring <robh@kernel.org>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Clark Wang <xiaoning.wang@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Wei Fang <wei.fang@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next] net: stmmac: provide flag to
	disable EEE
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
	R_DKIM_REJECT(1.00)[ideasonboard.com:s=mail];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[ideasonboard.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:imx@lists.linux.dev,m:edumazet@google.com,m:stefan.klug@ideasonboard.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:ovidiu.panait.oss@gmail.com,m:robh@kernel.org,m:ghidoliemanuele@gmail.com,m:kieran.bingham@ideasonboard.com,m:o.rempel@pengutronix.de,m:xiaoning.wang@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:dan.scally@ideasonboard.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:wei.fang@nxp.com,m:shawnguo@kernel.org,m:davem@davemloft.net,m:hkallweit1@gmail.com,m:ovidiupanaitoss@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lunn.ch,lists.linux.dev,google.com,ideasonboard.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,pengutronix.de,nxp.com,redhat.com,lists.infradead.org,vger.kernel.org,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.954];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6587410A988
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 01:18:33AM +0200, Laurent Pinchart wrote:
> On Tue, Feb 03, 2026 at 12:17:06AM +0000, Russell King (Oracle) wrote:
> > On Mon, Feb 02, 2026 at 10:23:45PM +0000, Russell King (Oracle) wrote:
> > > On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
> > > > If not, maybe this patch could be merged to add the flag that disables
> > > > EEE and I will just send a patch to disable EEE on our platforms as well.
> > > 
> > > We still need the flag to disable EEE for platforms where lpi_intr_o is
> > > logically OR'd with the other interrupts, so there's no way to ignore
> > > its persistent assertion.
> > 
> > I'll also state that we need both patches, but there's no point pushing
> > my original patch (to allow EEE to be disabled) unless Laurent is going
> > to also submit a patch to make use of the flag - the EEE disable and
> > Laurent's patch needs to be part of a series. We don't merge stuff that
> > adds facilities that have no users, because that's been proven time and
> > time again to be a recipe for accumulating cruft.
> 
> Sorry for having dropped the ball on this. Your patch arrived just when
> I travelled to Japan for a month, and then it got burried in my inbox.
> Now that it has resurfaced, and that an issue that prevented i.MX8MP
> from booting with v6.19-rc has been fixed, I'll rebase my kernel and
> finally fix that problem.

Done. https://lore.kernel.org/r/20260208232931.2272237-1-laurent.pinchart@ideasonboard.com

> Once again, thank you for all your help with this issue, you have been
> extremely helpful and I'm very grateful.
> 
> > So, at the moment, "net: stmmac: provide flag to disable EEE" ain't
> > going anywhere until there's a patch that makes use of the new flag.

-- 
Regards,

Laurent Pinchart
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
