Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 329969F13A0
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Dec 2024 18:29:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6A07C78011;
	Fri, 13 Dec 2024 17:29:14 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B102C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Dec 2024 17:29:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B246AC0006;
 Fri, 13 Dec 2024 17:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734110947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qh9Zm1VmGUbfUfimsR2fhN/wfQpXtijhFkCUNze7318=;
 b=AQalMVSihDbNV7GO0/TcVv+Jhxil4XJ9NFon+gfZ3+6jeSdAs/h2D5x4du/rqyku1zjsEV
 jHledJm9X3nJ9w/4ZYxXw0VGSJimYUxqJ2s7zL1IRogsrEsmFXny/JyaNE4JgKPxUltoXy
 bbOy0xSAhT1e+eUsKmwMHTGP17gg9mYmUQW4nwllTH/iqF08QdwVGr37xpWqsLFGtsWoW5
 jZshQRSQEbs4NovEj0tT4w4O937zHMToa5TiLjA7aQyKPOnG8nS8dGnN/uSWCG71EeKxtF
 Gm+ZyztxUyEfCuw6id5w3/SylvJxbMdvOSj166I4N4yZfmDzMOv0yGa8ls6Z4A==
Date: Fri, 13 Dec 2024 18:29:04 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20241213182904.55eb2504@fedora.home>
In-Reply-To: <Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
References: <20241213090526.71516-1-maxime.chevallier@bootlin.com>
 <20241213090526.71516-3-maxime.chevallier@bootlin.com>
 <Z1wnFXlgEU84VX8F@shell.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: maxime.chevallier@bootlin.com
Cc: linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 2/2] net: stmmac: dwmac-socfpga:
 Set interface modes from Lynx PCS as supported
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

Hi Russell,

On Fri, 13 Dec 2024 12:22:45 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Fri, Dec 13, 2024 at 10:05:25AM +0100, Maxime Chevallier wrote:
> > On Socfpga, the dwmac controller uses a variation of the Lynx PCS to get
> > additional support for SGMII and 1000BaseX. The switch between these
> > modes may occur at runtime (e.g. when the interface is wired to an SFP
> > cage). In such case, phylink will validate the newly selected interface
> > between the MAC and SFP based on the internal "supported_interfaces"
> > field.
> > 
> > For now in stmmac, this field is populated based on :
> >  - The interface specified in firmware (DT)
> >  - The interfaces supported by XPCS, when XPCS is in use.
> > 
> > In our case, the PCS in Lynx and not XPCS.
> > 
> > This commit makes so that the .pcs_init() implementation of
> > dwmac-socfpga populates the supported_interface when the Lynx PCS was
> > successfully initialized.  
> 
> I think it would also be worth adding this to Lynx, so phylink also
> gets to know (via its validation) which PHY interface modes the PCS
> can support.
> 
> However, maybe at this point we need to introduce an interface bitmap
> into struct phylink_pcs so that these kinds of checks can be done in
> phylink itself when it has the PCS, and it would also mean that stmmac
> could do something like:
> 
> 	struct phylink_pcs *pcs;
> 
> 	if (priv->hw->xpcs)
> 		pcs = xpcs_to_phylink_pcs(priv->hw->xpcs);
> 	else
> 		pcs = priv->hw->phylink_pcs;
> 
> 	if (pcs)
> 		phy_interface_or(priv->phylink_config.supported_interfaces,
> 				 priv->phylink_config.supported_interfaces,
> 				 pcs->supported_interfaces);
> 
> and not have to worry about this from individual PCS or platform code.

I like the idea, I will give it a go and send a series for that if
that's ok :)

Thanks,

Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
