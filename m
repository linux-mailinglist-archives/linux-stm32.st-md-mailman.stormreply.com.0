Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04809723F03
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 12:13:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B02E4C65E70;
	Tue,  6 Jun 2023 10:13:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA92DC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 10:13:15 +0000 (UTC)
X-GND-Sasl: maxime.chevallier@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1686046395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RkbzNl9IfYOosD0T4TQy+60yjqN1tYHVKVHSGmiLV0c=;
 b=aMk1sVX/fUIK+Wi2jBs8zqKYJ/ZbN5EEiZR6MgBrlhP6ptv1tRLLheFfxr5A1NmcFN+S1q
 zCKpy2hNtEaMPiOiZfmq9nfxYUsrimD8UNSTtCwFnn5JByokY+YkdYNfgSqRBCLhI5DHqI
 ZidvgX5zn77fn3WLdZeY8HGDvsIXLsocSGL8Evunv1itRRlhr4GLLqWSoKXTvb4USc6awr
 vdwhf2lLhAkyQZgggss9qoyHSdOWH/tnPMeRN2RK9b5MTUkY5jqhJ6rfL/BYEwYZAhTaob
 8Z/vrpbdMEgr/pb4R8igKXW6CDD+TZItBVJj+ll7mjKa9vEGSEJztIL0gXYd+Q==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 840E56000A;
 Tue,  6 Jun 2023 10:13:12 +0000 (UTC)
Date: Tue, 6 Jun 2023 12:13:11 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20230606121311.3cc5aa78@pc-7.home>
In-Reply-To: <ZH78uGBfeHjI4Cdn@shell.armlinux.org.uk>
References: <20230606064914.134945-1-maxime.chevallier@bootlin.com>
 <20230606064914.134945-2-maxime.chevallier@bootlin.com>
 <889297a0-88c3-90df-7752-efa00184859@linux-m68k.org>
 <ZH78uGBfeHjI4Cdn@shell.armlinux.org.uk>
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

Hello Geert, Russell,

On Tue, 6 Jun 2023 10:30:32 +0100
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Tue, Jun 06, 2023 at 10:29:20AM +0200, Geert Uytterhoeven wrote:
> > 	Hi Maxime,
> > 
> > On Tue, 6 Jun 2023, Maxime Chevallier wrote:  
> > > Although pcs_lynx is only used on dwmac_socfpga for now, the cleanup
> > > path is in the generic driver, and triggers build issues for other
> > > stmmac variants. Make sure we build pcs_lynx in all cases too, as for
> > > XPCS.  
> > 
> > That seems suboptimal to me, as it needlesly increases kernel size for
> > people who do not use dwmac_socfpga.  Hence I made an alternative patch:
> > https://lore.kernel/org/7b36ac43778b41831debd5c30b5b37d268512195.1686039915.git.geert+renesas@glider.be  
> 
> A better solution would be to re-architect the removal code so that
> whatever creates the PCS is also responsible for removing it.
> 
> Also, dwmac_socfpga nees to be reorganised anyway, because it calls
> stmmac_dvr_probe() which then goes on to call register_netdev(),
> publishing the network device, and then after stmmac_dvr_probe(),
> further device setup is done. As the basic driver probe flow should
> be setup and then publish, the existing code structure violates that.
> 

I agree that this solution is definitely suboptimal, I wanted mostly to get it
fixed quickly as this breaks other stmmac variants.

Do we still go on with the current patch (as Geert's has issues) and then
consider reworking dwmac_socfpga ?

Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
