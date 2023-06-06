Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9147A723FEE
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 12:44:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51B47C06F81;
	Tue,  6 Jun 2023 10:44:21 +0000 (UTC)
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0EFECC65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 10:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ioAQcLHmFe5lShDUAfyfXBw7PEQ13xYiSgOqhDs0xDo=; b=bk5CItPE2XxteW8CONPDrQoKne
 Njhw4e9GGxXqsJaMSzMU0RuGa/1oG3eKoMLeT1jYmUQ1iqQy4uEul+HXWDSWhoQIKMQlvj4fClfDW
 vHEXJifq3ecdxI38YesU/kxoJCCBteV0d1dCIG+j/sUF/QhMhEeL+YcXaBH3jRK5Zh5aCi9AuiKo1
 +//ZpfzNX0GT30XCVQhcRonJaKddPG9kgbdttsolWGkcgjBzC3lO9BQ2OZvjxzLIj7StI95tebPz4
 g8m8MquDOFiU1aQ29l7IIYZsjao+XxKXlbz9r0BhbnqMwMsDcAqi8XevXq8SGTHr7O+UZ3Qpi/QQF
 5e4K2lsg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48520)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <linux@armlinux.org.uk>)
 id 1q6UAd-0005Vy-Pi; Tue, 06 Jun 2023 11:44:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1q6UAa-000751-Ly; Tue, 06 Jun 2023 11:44:08 +0100
Date: Tue, 6 Jun 2023 11:44:08 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <ZH8N+GtRFcDV4eaI@shell.armlinux.org.uk>
References: <20230606064914.134945-1-maxime.chevallier@bootlin.com>
 <20230606064914.134945-2-maxime.chevallier@bootlin.com>
 <889297a0-88c3-90df-7752-efa00184859@linux-m68k.org>
 <ZH78uGBfeHjI4Cdn@shell.armlinux.org.uk>
 <20230606121311.3cc5aa78@pc-7.home>
 <ZH8JxF+TNuX0C1vC@shell.armlinux.org.uk>
 <CAMuHMdWnqmwT_rEe5G4e+yZYAeTQxjjE=Xqq7R6No9SAF16sdg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdWnqmwT_rEe5G4e+yZYAeTQxjjE=Xqq7R6No9SAF16sdg@mail.gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 alexis.lothore@bootlin.com, thomas.petazzoni@bootlin.com,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Simon Horman <simon.horman@corigine.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] net: stmmac: Add PCS_LYNX as
 a dependency for the whole driver
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

On Tue, Jun 06, 2023 at 12:35:23PM +0200, Geert Uytterhoeven wrote:
> Hi Russell,
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index fa07b0d50b46..1801f8cc8413 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -940,9 +940,6 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
> >         if (priv->hw->xpcs)
> >                 return &priv->hw->xpcs->pcs;
> >
> > -       if (priv->hw->lynx_pcs)
> > -               return priv->hw->lynx_pcs;
> > -
> >         return NULL;
> >  }
> 
> I think the above hunk is wrong, and should be replaced by a removal
> of the call to lynx_pcs_destroy()?

Indeed, and wrong file too. Thanks for spotting, I think we spotted
the mistake at almost the same time. Replacement patch sent.

It'd be good to have the patch thoroughly reviewed to make sure I
haven't missed anything else, bearing in mind that I don't know this
driver inside out and don't have the hardware.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
