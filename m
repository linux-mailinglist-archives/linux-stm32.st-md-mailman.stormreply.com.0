Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JPFOpI+gWk8FAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 01:17:22 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 810A0D2DF8
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 01:17:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03E9FC87EC6;
	Tue,  3 Feb 2026 00:17:22 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C6712C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 00:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cnbZIEEYc7qpXnHl4ZHTwHEJ9GmdouAAJMZTX/GpBdE=; b=VHco1eedf+GGw5ftuQkpadN50P
 7/H8FTN1MGUAxFL0qaQpqSUGBucDqIYDt2U6LLBoiqx7tvKS6VoTTBhrOYlT1RxPCi6HFdsETvIQp
 sXTZAAPd5royUP8fucUiITv0PgZWrzYozcBefdUuZQOxe2GyOcd6r+F67dWJJ3SFiTt1LB02rYw7V
 Pfll0qmBlvzg+6CwkRVObhvX8/S3fYitEX1qZyg0Dq3jn83YD/SjpS9v5OJyj6Us0yPmzm9hhgY8a
 pVqBbhlOEvLVREJxuvD4A86L1kSexJyTYxCFgGMK+cpZoLagFf11xaAlc550PdCWJ+aDfbmBgHihf
 j7NM+9ZA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52622)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vn46R-000000004UO-08eh;
 Tue, 03 Feb 2026 00:17:11 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vn46M-000000003qY-46I1; Tue, 03 Feb 2026 00:17:07 +0000
Date: Tue, 3 Feb 2026 00:17:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Message-ID: <aYE-gvuZdv7ezm7X@shell.armlinux.org.uk>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_RECIPIENTS(0.00)[m:ovidiu.panait.oss@gmail.com,m:andrew@lunn.ch,m:imx@lists.linux.dev,m:edumazet@google.com,m:laurent.pinchart@ideasonboard.com,m:stefan.klug@ideasonboard.com,m:festevam@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:ghidoliemanuele@gmail.com,m:kieran.bingham@ideasonboard.com,m:o.rempel@pengutronix.de,m:xiaoning.wang@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:s.hauer@pengutronix.de,m:dan.scally@ideasonboard.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:andrew+netdev@lunn.ch,m:kernel@pengutronix.de,m:wei.fang@nxp.com,m:shawnguo@kernel.org,m:davem@davemloft.net,m:hkallweit1@gmail.com,m:ovidiupanaitoss@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,lists.linux.dev,google.com,ideasonboard.com,gmail.com,st-md-mailman.stormreply.com,kernel.org,pengutronix.de,nxp.com,redhat.com,lists.infradead.org,vger.kernel.org,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 810A0D2DF8
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 10:23:45PM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
> > If not, maybe this patch could be merged to add the flag that disables
> > EEE and I will just send a patch to disable EEE on our platforms as well.
> 
> We still need the flag to disable EEE for platforms where lpi_intr_o is
> logically OR'd with the other interrupts, so there's no way to ignore
> its persistent assertion.

I'll also state that we need both patches, but there's no point pushing
my original patch (to allow EEE to be disabled) unless Laurent is going
to also submit a patch to make use of the flag - the EEE disable and
Laurent's patch needs to be part of a series. We don't merge stuff that
adds facilities that have no users, because that's been proven time and
time again to be a recipe for accumulating cruft.

So, at the moment, "net: stmmac: provide flag to disable EEE" ain't
going anywhere until there's a patch that makes use of the new flag.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
