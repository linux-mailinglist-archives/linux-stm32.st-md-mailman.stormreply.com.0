Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 69685D0D8DF
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Jan 2026 16:47:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44A01C8F283;
	Sat, 10 Jan 2026 15:47:41 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D091EC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jan 2026 15:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nUHVAoAREYLF1TzcvPdgfaRGlq1lrNPziR3WwRPXhq4=; b=A0iYr7prmMiASSL1AOz8/XgGnp
 ovZha2vbY0r/bjN1U7KLi7QQ95Ls88EQ7rWpiXyuL4qd5r5L5sAxP6f18XrMYnZfdbPpXk+CATM+k
 7hyz++Y0TvK6+c6JaSPTlVYElOR7Ov9sUzc4dGjAtrF6+Mc8Ev73r4UOwQBLJdlJaVVlaOk9Yz91e
 0EFZdcfLSQC9+VcyGqk7RdkISvlDd9/jUERKYAM1CLejmpG+vYtP50qQE3HqPSiGJ4gsrh0MS5trN
 Pk1sI854m9fkkLK88dF6pD/ZIrKSKrM6I04zOdgPRGmSAfZgxygS1zea+BnrP0mGVUT8dwzXKd7Bt
 lbHi5hXQ==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53048)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.98.2)
 (envelope-from <linux@armlinux.org.uk>) id 1vebBV-000000004qn-3BkF;
 Sat, 10 Jan 2026 15:47:25 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1vebBR-000000004Mx-2YK5; Sat, 10 Jan 2026 15:47:21 +0000
Date: Sat, 10 Jan 2026 15:47:21 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Stefan Eichenberger <eichest@gmail.com>
Message-ID: <aWJ0iV6-_4XqpeHD@shell.armlinux.org.uk>
References: <20260105100245.19317-1-eichest@gmail.com>
 <6ee0d55a-69de-4c28-8d9d-d7755d5c0808@bootlin.com>
 <aVuxv3Pox-y5Dzln@eichest-laptop>
 <a597b9d6-2b32-461f-ac90-2db5bb20cdb2@lunn.ch>
 <aVvp70S2Lr3o_jyB@eichest-laptop>
 <aVvwOYce1CFOLiBk@shell.armlinux.org.uk>
 <aVv7wD2JFikGkt3F@eichest-laptop> <aWC_ZDu0HipuVhQS@eichest-laptop>
 <8f70bd9d-747f-4ffa-b0f2-1020071b5adc@bootlin.com>
 <aWJXNSiDLHLFGV8F@eichest-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWJXNSiDLHLFGV8F@eichest-laptop>
Cc: robh@kernel.org, Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, imx@lists.linux.dev, festevam@gmail.com,
 s.hauer@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com,
 francesco.dolcini@toradex.com, andrew+netdev@lunn.ch, edumazet@google.com,
 kernel@pengutronix.de, netdev@vger.kernel.org, kuba@kernel.org,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>, pabeni@redhat.com,
 shawnguo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND net-next v2] net: stmmac: dwmac:
 Add a fixup for the Micrel KSZ9131 PHY
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

On Sat, Jan 10, 2026 at 02:42:13PM +0100, Stefan Eichenberger wrote:
> Hi Maxime,
> 
> Not problem, thanks a lot for the feedback and the discussion. I will
> then proceed with the current approach and send a new version with an
> updated commit message.

We could add a flag to:

/* Generic phy_device::dev_flags */
#define PHY_F_NO_IRQ            0x80000000
#define PHY_F_RXC_ALWAYS_ON     0x40000000

indicating that the MAC requires the full preamble, which the PHY can
then test for and configure appropiately.

The question is, whether the requirement for the full preamble applies
to many MACs, and whether there are PHYs that default to producing
short preambles.

Looking at Marvell 88e151x, the only control it has is to pad odd
nibbles of preambles on copper (page 2, register 16, bit 6.)

AR8035 seems to make no mention of preamble for the MII interfaces, so
I guess it has no control over it.

I've not looked further than that.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
