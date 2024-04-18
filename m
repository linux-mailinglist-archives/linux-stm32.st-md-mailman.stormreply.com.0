Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2479F8A9BA3
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Apr 2024 15:52:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C96B6C6DD66;
	Thu, 18 Apr 2024 13:52:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCEE2C6C859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Apr 2024 13:52:31 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C2C281BF209;
 Thu, 18 Apr 2024 13:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713448351;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8wUOi164P3lAmjE1ClSdezuP19LGck9A7BJ4c8R2rWo=;
 b=RmxsbDgxhNpNQOPoFlayXDpwdP+tytqkGF2OJI6z52D3jvdH0BINaMaSOJABYa6/o6WxeC
 ghog+bvm/6xdvqTf7B+xQM1u8PJB3QGicA2yN5ueeF17yS8iO+LMOt3yX/95A/69vx0wFU
 cWHL5OJ6Vcw7APt18HuFE96l5gziHKoup8zj+aF3KookZJxRSzPjCOjoJAU1e0WxFzVysT
 v/WQR3MUr8UJwvigXjjQu2WXU9bhHEg4YS9NtOcNTo94oqfGuwGimoaaP5yb6TJK1bx/Ff
 aiZo6SsBfRs+qKWkz/kuZH1VCi7XUvW5NuGt7bGVzPZKfEQBmV9RD8UVbJaq/w==
Date: Thu, 18 Apr 2024 15:53:07 +0200 (CEST)
From: Romain Gantois <romain.gantois@bootlin.com>
To: Serge Semin <fancer.lancer@gmail.com>
In-Reply-To: <eqfta73ost45nbzz3aoa2tw5tasg3geehf4fgphu4teq5yfvar@ngif2e6j5j2k>
Message-ID: <c99b452b-be35-3a67-1c87-042dbc5fce49@bootlin.com>
References: <20240415-rzn1-gmac1-v3-0-ab12f2c4401d@bootlin.com>
 <20240415-rzn1-gmac1-v3-4-ab12f2c4401d@bootlin.com>
 <xp34tp5cjmdshefxjczltz2prqtiikagfspf4lobznzypvsyah@ihpmwfynwzhh>
 <232e3b0c-ca55-2da0-1c9f-47520a1bcfbd@bootlin.com>
 <eqfta73ost45nbzz3aoa2tw5tasg3geehf4fgphu4teq5yfvar@ngif2e6j5j2k>
MIME-Version: 1.0
X-GND-Sasl: romain.gantois@bootlin.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Eric Dumazet <edumazet@google.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?ISO-8859-15?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/5] net: stmmac: add support
 for RZ/N1 GMAC
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

On Thu, 18 Apr 2024, Serge Semin wrote:

> On Thu, Apr 18, 2024 at 01:57:47PM +0200, Romain Gantois wrote:
> > Hi Serge,
> > 
> > On Tue, 16 Apr 2024, Serge Semin wrote:
> > 
> > > > +static int rzn1_dwmac_pcs_init(struct stmmac_priv *priv,
> > > 
> > > > +			       struct mac_device_info *hw)
> > > 
> > > AFAICS hw is unused, and the mac_device_info instance is reached via
> > > the priv pointer. What about dropping the unused argument then?
> > 
> 
> > Unfortunately, this is an implementation of the pcs_init() callback, which is 
> > also used by socfpga (see patch 4/6 in this series). The socfpga implementations 
> > use the hw parameter for both pcs_init() and pcs_exit() so I can't remove it.
> 
> I had that patch content in mind when was writing my comment. There is
> no point in passing the hw-pointer there either because you already
> have the stmmac_priv pointer. There is stmmac_priv::hw field which you
> can use instead in the same way as you do in this patch. Here is the
> respective change for your SoCFPGA patch:
> 

You're right, I'll remove the parameter.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
