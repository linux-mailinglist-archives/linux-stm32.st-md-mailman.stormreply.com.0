Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A99CA88C682
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Mar 2024 16:14:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3EE34C6B45B;
	Tue, 26 Mar 2024 15:14:11 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 65A54C640E5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Mar 2024 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=3vWUrAA8SZ0bCLZDcJmAKQ5MfnH0TVI2Dv0Fp0kU2eA=; b=OCyyPqD9Qte/rxh7EbEj7wBpWD
 M0PVTxm3eD6v7qzfKYO1ZitDxFc7DSO1niSFC2uJ0tQx3oceXcrn9xDW/qsw0wUXosyACH5xid1hR
 z9AYNND2tXKNbwipMrvM1OSixeP96D746fZZMa9FgTBYgQWojfiPftbBwIXV0KQIdMUA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1rp8Uw-00BIGs-R1; Tue, 26 Mar 2024 16:13:58 +0100
Date: Tue, 26 Mar 2024 16:13:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christophe ROULLIER <christophe.roullier@foss.st.com>
Message-ID: <838d8e91-9b82-4185-8827-055fcaea8fcc@lunn.ch>
References: <20240326125849.226765-1-christophe.roullier@foss.st.com>
 <20240326125849.226765-2-christophe.roullier@foss.st.com>
 <0e14ad5d-3c25-40ab-981a-fbc4e245fc94@lunn.ch>
 <a19b20ae-d12a-47c8-9d1f-482a84924e6c@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a19b20ae-d12a-47c8-9d1f-482a84924e6c@foss.st.com>
Cc: Marek Vasut <marex@denx.de>, Jose Abreu <joabreu@synopsys.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Liam Girdwood <lgirdwood@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: net: add phy-supply
 property for stm32
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

On Tue, Mar 26, 2024 at 03:41:13PM +0100, Christophe ROULLIER wrote:
> 
> On 3/26/24 14:58, Andrew Lunn wrote:
> > On Tue, Mar 26, 2024 at 01:58:48PM +0100, Christophe Roullier wrote:
> > > Phandle to a regulator that provides power to the PHY. This
> > > regulator will be managed during the PHY power on/off sequence.
> > > 
> > > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
> > > ---
> > >   Documentation/devicetree/bindings/net/stm32-dwmac.yaml | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > > index fc8c96b08d7dc..80937b28fa046 100644
> > > --- a/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > > +++ b/Documentation/devicetree/bindings/net/stm32-dwmac.yaml
> > > @@ -82,6 +82,9 @@ properties:
> > >         Should be phandle/offset pair. The phandle to the syscon node which
> > >         encompases the glue register, and the offset of the control register
> > > +  phy-supply:
> > > +    description: PHY regulator
> > ~/linux/drivers/net/ethernet/stmicro/stmmac$ grep regulator_get *
> > dwmac-rk.c:	bsp_priv->regulator = devm_regulator_get(dev, "phy");
> > dwmac-sun8i.c:	gmac->regulator = devm_regulator_get_optional(dev, "phy");
> > dwmac-sunxi.c:	gmac->regulator = devm_regulator_get_optional(dev, "phy");
> > 
> > Maybe i'm missing something, but i don't see an actual implementation
> > of this binding?
> > 
> > 	Andrew
> 
> Hi Andrew,
> 
> You are right, my next step is to upstream support of Ethernet MP13 glue and
> some update like Phy regulator support

Then please make this binding patch part of the series which
implements the binding. They go together.

	Andrew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
