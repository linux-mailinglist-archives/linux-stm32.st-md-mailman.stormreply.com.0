Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B446285D3D2
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 10:39:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 698F2C6B47A;
	Wed, 21 Feb 2024 09:39:41 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AA5C4C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 09:39:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7D2CF24000D;
 Wed, 21 Feb 2024 09:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1708508380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xr1h5K30G9MBY/JWOVj85ZQBdVlWSBtQJRX0YVGUwUU=;
 b=OJiEUiYWioWWVy7fpqJv/3WVpgZDBbegcbSmaG4Vm34r0L7mR1K6SgLIiMIYpK9Pcs1iiV
 22A26aitmZoSfA58c8LK37aXF36sli8Ho7vQushhwJRWseNe3tv6rY9SJl/otDqLGVvj1F
 mOyIL7jv8KQKbrZotC9sLIZnunnb1vKIGrx8NuFJuEIKCty43XsOH/6VFLzIPzSRDC/ndD
 3sTjT1yuTOznavogBz4bFwe1qvEvrNiqv9VVkpa5Q1zVL69izNF649QNMQuITL2X918AFo
 SkoumL/Z8whT/v0o1J1ZrdIhbzIsDJyMbdMkvRBEjgySLWBoXFb7r2cXCZD+QA==
Date: Wed, 21 Feb 2024 10:40:06 +0100 (CET)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20240212185332.2ebf2935@device-28.home>
Message-ID: <cc90a3d2-4a6a-7274-4ede-cf6ff2f9db17@bootlin.com>
References: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
 <20240212-rxc_bugfix-v3-7-e9f2eb6b3b05@bootlin.com>
 <20240212185332.2ebf2935@device-28.home>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Gantois <romain.gantois@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 linux-renesas-soc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 7/7] net: pcs: rzn1-miic: Init
 RX clock early if MAC requires it
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

Hi Maxime,

On Mon, 12 Feb 2024, Maxime Chevallier wrote:

> > +static int miic_pre_init(struct phylink_pcs *pcs)
> > +{
> > +	struct miic_port *miic_port = phylink_pcs_to_miic_port(pcs);
> > +	struct miic *miic = miic_port->miic;
> > +	u32 val;
> > +
> > +	/* Start RX clock if required */
> > +	if (pcs->rxc_always_on) {
> > +		/* In MII through mode, the clock signals will be driven by the
> > +		 * external PHY, which might not be initialized yet. Set RMII
> > +		 * as default mode to ensure that a reference clock signal is
> > +		 * generated.
> > +		 */
> > +		miic_port->interface = PHY_INTERFACE_MODE_RMII;
> 
> There's this check in miic_config :
> 
> 	if (interface != miic_port->interface) {
> 		val |= FIELD_PREP(MIIC_CONVCTRL_CONV_SPEED, speed);
> 		mask |= MIIC_CONVCTRL_CONV_SPEED;
> 		miic_port->interface = interface;
> 	}
> 
> As you set the interface to RMII and set the CONV_MODE below without
> really looking at the speed, is there any risk of a mismatch between
> the configured mode and the speed ?
Good point, it is probably necessary to set the default RMII speed in 
miic_pre_init(), since miic_config will not do it if the link mode hasn't 
changed in the meantime. However, this is only an issue if the link isn't 
already up when miic_config() is called. If the link is up, then that means that 
miic_link_up() has already been called and has set the appropriate speed anyway.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
