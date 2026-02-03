Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIY+NakXgmmZPAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 16:43:37 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFD2DB6DE
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 16:43:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 405D0C58D7A;
	Tue,  3 Feb 2026 15:43:37 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81DF5C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 15:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RzeM8oaESwR5f6Qc18NJENPAHewlAD17RZTiqrl1jUw=; b=Jt0kIIivMsAafQg+iXRknxBUz6
 F/yuYSd/CfJA/N0eRjBsL+4fi2Q3FsHCPR9M5rdXzRrQWKlPH7WnXlgXUnZ+b4s2MD5nHekUB2MCL
 ThA/6rkEuHK2KZyrXiR1bGbRYvoH8F+Oebt9U7lOWk9KSAjVk46UxW/ZQuv7wsyT8ttlaJj4xHac/
 NmW/h1b2jqJpPk1aEiB6Wq7N8sfvM6q6uH7JYE8wL++vKpFL9JkfmtzbAzrUz0ywT0dJ9TeABywca
 mJDKj6Oi3LUbfI1dsueqDjZK8SMsaRR6Ao9flVloipD9KuSGLQisEH6eWPU5dTZGh1qA4rE7OrvcP
 7nUacWuQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42522)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vnIYn-000000005EC-41oW;
 Tue, 03 Feb 2026 15:43:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vnIYk-000000004UW-1y5v; Tue, 03 Feb 2026 15:43:22 +0000
Date: Tue, 3 Feb 2026 15:43:22 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Message-ID: <aYIXmsIG_ZJO-cg4@shell.armlinux.org.uk>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
 <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
 <aYEj8VM5AfvcDHrl@shell.armlinux.org.uk>
 <ea2434e6-d1db-4ea2-90f4-0a77961b7918@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea2434e6-d1db-4ea2-90f4-0a77961b7918@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 7AFD2DB6DE
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 05:42:07PM +0200, Ovidiu Panait wrote:
> 
> Hi Russell,
> 
> On 2/3/26 12:23 AM, Russell King (Oracle) wrote:
> > On Mon, Feb 02, 2026 at 08:54:52PM +0200, Ovidiu Panait wrote:
> >>
> >> Hi Russell,
> >>
> >> On 11/24/25 1:27 PM, Russell King (Oracle) wrote:
> >>> Some platforms have problems when EEE is enabled, and thus need a way
> >>> to disable stmmac EEE support. Add a flag before the other LPI related
> >>> flags which tells stmmac to avoid populating the phylink LPI
> >>> capabilities, which causes phylink to call phy_disable_eee() for any
> >>> PHY that is attached to the affected phylink instance.
> >>>
> >>> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
> >>> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
> >>> to the receive clock domain, and takes four clock cycles to clear, this
> >>> leads to interrupt storms as the interrupt remains asserted for some
> >>> time after the LPI control and status register is read.
> >>>
> >>> This problem becomes worse when the receive clock from the PHY stops
> >>> when the receive path enters LPI state - which means that lpi_intr_o
> >>> can not deassert until the clock restarts. Since the LPI state of the
> >>> receive path depends on the link partner, this is out of our control.
> >>> We could disable RX clock stop at the PHY, but that doesn't get around
> >>> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
> >>>
> >>> Previously, iMX8MP worked around this by disabling gigabit EEE, but
> >>> this is insufficient - the problem is also visible at 100M speeds,
> >>> where the receive clock is slower.
> >>>
> >>> There is extensive discussion and investigation in the thread linked
> >>> below, the result of which is summarised in this commit message.
> >>>
> >>
> >> We are seeing the same lpi_intr_o interrupt storm on the Renesas RZ/V2H
> >> EVK (dwmac-renesas-gbeth.c). On this platform, lpi_intr_o is routed as a
> >> separate, dedicated interrupt line to the CPU rather than being OR'd
> >> with the main DWMAC interrupt as on iMX8MP. This corresponds to the
> >> "eth_lpi" interrupt in the stmmac bindings:
> >> """
> >> - description: The interrupt that occurs when Rx exits the LPI state
> >> const: eth_lpi
> >> """
> >>
> >> Looking through the other glue drivers/device-trees, it looks to me that
> >> every platform that defines a separate "eth_lpi" irq might have the
> >> interrupt storm problem.
> > 
> > That is highly likely.
> > 
> >> To fix this issue on these platforms, rather than disabling EEE
> >> altogether, would it be possible to just not request the eth_lpi
> >> interrupt and let EEE continue to work? Perhaps a new flag could let
> >> each platform decide.
> > 
> > Yes, because lpi_intr_o serves no purpose from a software point of
> > view - see the commit message below for the details. I do like
> > removing code from stmmac :)
> > 
> >> If not, maybe this patch could be merged to add the flag that disables
> >> EEE and I will just send a patch to disable EEE on our platforms as well.
> > 
> > We still need the flag to disable EEE for platforms where lpi_intr_o is
> > logically OR'd with the other interrupts, so there's no way to ignore
> > its persistent assertion.
> > 
> > 8<===
> > From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> > Subject: [PATCH net-next] net: stmmac: remove support for lpi_intr_o
> > 
> > The dwmac databook for v3.74a states that lpi_intr_o is a sideband
> > signal which should be used to ungate the application clock, and this
> > signal is synchronous to the receive clock. The receive clock can run
> > at 2.5, 25 or 125MHz depending on the media speed, and can stop under
> > the control of the link partner. This means that the time it takes to
> > clear is dependent on the negotiated media speed, and thus can be 8,
> > 40, or 400ns after reading the LPI control and status register.
> > 
> > It has been observed with some aggressive link partners, this clock
> > can stop while lpi_intr_o is still asserted, meaning that the signal
> > remains asserted for an indefinite period that the local system has
> > no direct control over.
> > 
> > The LPI interrupts will still be signalled through the main interrupt
> > path in any case, and this path is not dependent on the receive clock.
> > 
> > This, since we do not gate the application clock, and the chances of
> > adding clock gating in the future are slim due to the clocks being
> > ill-defined, lpi_intr_o serves no useful purpose. Remove the code which
> > requests the interrupt, and all associated code.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Thanks for fixing this. I did some testing on the Renesas RZ/V2H board
> with this patch and didn't see any issues:
> 
> Tested-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Would you say this is a regression or a new problem?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
