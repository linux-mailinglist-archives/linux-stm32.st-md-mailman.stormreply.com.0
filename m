Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 87217724310
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 14:50:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34DB7C65E70;
	Tue,  6 Jun 2023 12:50:53 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51E50C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 12:50:51 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686055851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vPlrY3WjDY7pFW/27RY/fg0u0Ufgp/HpEKChnaNVaNo=;
 b=WtSRmpezbXnrGJhJIzu7g1Jf7sUfirjn2Sx/wTtuHm+1CFCn0L8nfIoZU1LeRZgY387uDi
 EfWWXvnWDucY3AsQaXso6txoCy/SNcy8eUwu73eUwE3o+pqdg9yC3DpKyisoAemNUVUoHS
 y834jecnDNCTIdmEDxCioxJZ4GgZG8gOy3SqCArK3YEaEqX/OYti1UI3RaeZ3c+hPyGbtL
 ZYrKf79UvScvA8tJ4zXXLg2g8uKvZO8Mnu9r/uJ4byT8lWHSIVvRZxbGBLWCivNPJtwFPM
 vszTHIETNYRH6txrFEQaln3FlAz9j39pJEZFG3i4LkhyQTcmZtYg7KXSlHl26g==
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
X-GND-Sasl: maxime.chevallier@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6719DC0006;
 Tue,  6 Jun 2023 12:50:47 +0000 (UTC)
Date: Tue, 6 Jun 2023 14:50:46 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20230606145046.7181bfae@pc-7.home>
In-Reply-To: <ZH8N+GtRFcDV4eaI@shell.armlinux.org.uk>
References: <20230606064914.134945-1-maxime.chevallier@bootlin.com>
 <20230606064914.134945-2-maxime.chevallier@bootlin.com>
 <889297a0-88c3-90df-7752-efa00184859@linux-m68k.org>
 <ZH78uGBfeHjI4Cdn@shell.armlinux.org.uk>
 <20230606121311.3cc5aa78@pc-7.home>
 <ZH8JxF+TNuX0C1vC@shell.armlinux.org.uk>
 <CAMuHMdWnqmwT_rEe5G4e+yZYAeTQxjjE=Xqq7R6No9SAF16sdg@mail.gmail.com>
 <ZH8N+GtRFcDV4eaI@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
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

On Tue, 6 Jun 2023 11:44:08 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Tue, Jun 06, 2023 at 12:35:23PM +0200, Geert Uytterhoeven wrote:
> > Hi Russell,
> >   
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > index fa07b0d50b46..1801f8cc8413 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > @@ -940,9 +940,6 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
> > >         if (priv->hw->xpcs)
> > >                 return &priv->hw->xpcs->pcs;
> > >
> > > -       if (priv->hw->lynx_pcs)
> > > -               return priv->hw->lynx_pcs;
> > > -
> > >         return NULL;
> > >  }  
> > 
> > I think the above hunk is wrong, and should be replaced by a removal
> > of the call to lynx_pcs_destroy()?  
> 
> Indeed, and wrong file too. Thanks for spotting, I think we spotted
> the mistake at almost the same time. Replacement patch sent.
> 
> It'd be good to have the patch thoroughly reviewed to make sure I
> haven't missed anything else, bearing in mind that I don't know this
> driver inside out and don't have the hardware.

I will give it a try righ-away,

Thanks,

Maxime

> Thanks.
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
