Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5728B34
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 22:02:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0789FCD5FA3
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 20:02:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31332CD5FA2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 20:02:01 +0000 (UTC)
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 6398FC0006;
 Thu, 23 May 2019 20:01:53 +0000 (UTC)
Date: Thu, 23 May 2019 22:01:52 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <20190523200152.c2sz6mrzxgblslya@flea>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <aa5ec90854429c2d9e2c565604243e1b10cfd94b.1558605170.git-series.maxime.ripard@bootlin.com>
 <20190523143744.GB19369@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523143744.GB19369@lunn.ch>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/8] dt-bindings: net: Add a YAML schemas
 for the generic PHY options
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

Hi Andrew,

(Sorry for not CC'ing you on this)

On Thu, May 23, 2019 at 04:37:44PM +0200, Andrew Lunn wrote:
> On Thu, May 23, 2019 at 11:56:45AM +0200, Maxime Ripard wrote:
> > The networking PHYs have a number of available device tree properties that
> > can be used in their device tree node. Add a YAML schemas for those.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> > ---
> >  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 148 +++++++++-
> >  Documentation/devicetree/bindings/net/phy.txt           |  80 +-----
> >  2 files changed, 149 insertions(+), 79 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/net/ethernet-phy.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> > new file mode 100644
> > index 000000000000..eb79ee6db977
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
> > @@ -0,0 +1,148 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Ethernet PHY Generic Binding
> > +
> > +maintainers:
> > +  - David S. Miller <davem@davemloft.net>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^ethernet-phy(@[a-f0-9])?$"
> > +
> > +  compatible:
> > +    oneOf:
>
> I don't know the language. It is valid to have both
> ethernet-phy-ieee802.3-c45 and
> ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$".  Does this oneOf prevent
> multiple compatible strings?

I haven't tested it, I will make sure it works

> Also, the general case is no compatible at all.

This is covered already. The description here just mentions the values
available if the property is set.

The required keyword a bit later lists the required property. In this
case, compatible is omitted so we just list the available values for
the compatible property.

> > +      - const: ethernet-phy-ieee802.3-c22
> > +        description: PHYs that implement IEEE802.3 clause 22
> > +      - const: ethernet-phy-ieee802.3-c45
> > +        description: PHYs that implement IEEE802.3 clause 45
> > +      - pattern: "^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$"
> > +        description:
> > +          The first group of digits is the 16 bit Phy Identifier 1
> > +          register, this is the chip vendor OUI bits 3:18. The
> > +          second group of digits is the Phy Identifier 2 register,
> > +          this is the chip vendor OUI bits 19:24, followed by 10
> > +          bits of a vendor specific ID.
>
> Could we try to retain:
>
> > -  If the PHY reports an incorrect ID (or none at all) then the
> > -  "compatible" list may contain an entry with the correct PHY ID in the
>      ...
>
> Using it is generally wrong, and that is not clear in the new text.

Ok, I'll add it back.

> > +
> > +  reg:
> > +    maxItems: 1
> > +    minimum: 0
> > +    maximum: 31
> > +    description:
> > +      The ID number for the PHY.
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  max-speed:
> > +    enum:
> > +      - 10
> > +      - 100
> > +      - 1000
>
> This is outdated in the text description. Any valid speed is
> supported, currently 10 - 200000, as listed in phy_setting settings().

Ack, I'll update it

Thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
