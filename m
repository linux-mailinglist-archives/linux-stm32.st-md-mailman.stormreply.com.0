Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CCC2DBD2B
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Dec 2020 09:59:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64783C3087A;
	Wed, 16 Dec 2020 08:59:39 +0000 (UTC)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C609BC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Dec 2020 08:59:37 +0000 (UTC)
Date: Wed, 16 Dec 2020 11:59:34 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Message-ID: <20201216085934.tlp5axhauyshb2st@mobilestation>
References: <20201214091616.13545-1-Sergey.Semin@baikalelectronics.ru>
 <20201214091616.13545-4-Sergey.Semin@baikalelectronics.ru>
 <20201215172240.GA4047815@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215172240.GA4047815@robh.at.kernel.org>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Joao Pinto <jpinto@synopsys.com>, netdev@vger.kernel.org,
 Lars Persson <larper@axis.com>, linux-stm32@st-md-mailman.stormreply.com,
 Johan Hovold <johan@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Ripard <mripard@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Vyacheslav Mitrofanov <Vyacheslav.Mitrofanov@baikalelectronics.ru>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Subject: Re: [Linux-stm32] [PATCH 03/25] dt-bindings: net: dwmac: Fix the
 TSO property declaration
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

On Tue, Dec 15, 2020 at 11:22:40AM -0600, Rob Herring wrote:
> On Mon, Dec 14, 2020 at 12:15:53PM +0300, Serge Semin wrote:
> > Indeed the STMMAC driver doesn't take the vendor-specific compatible
> > string into account to parse the "snps,tso" boolean property. It just
> > makes sure the node is compatible with DW MAC 4.x, 5.x and DW xGMAC
> > IP-cores. Fix the conditional statement so the TSO-property would be
> > evaluated for the compatibles having the corresponding IP-core version.
> > 
> > While at it move the whole allOf-block from the tail of the binding file
> > to the head of it, as it's normally done in the most of the DT schemas.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Note this won't break the bindings description, since the "snps,tso"
> > property isn't parsed by the Allwinner SunX GMAC glue driver, but only
> > by the generic platform DT-parser.
> 

> But still should be valid for Allwinner?

I don't know. It seems to me that even the original driver developer
didn't know what DW MAC IP has been used to create the Allwinner
EMAC, since in the cover letter to the original patch he said:
"During the development, it appeared that in fact the hardware was
a modified version of some dwmac." (See https://lwn.net/Articles/721459/)
Most likely Maxime Ripard also didn't know that when he was converting
the legacy bindings to the DT schema.

What I do know the TSO is supported by the driver only for IP-cores with
version higher than 4.00. (See the stmmac_probe_config_dt() method
implementation). Version is determined by checking whether the DT
device node compatible property having the "snps,dwmac-*" or
"snps,dwxgmac" strings. Allwinner EMAC nodes aren't defined with
those strings, so they won't have the TSO property parsed and set.

> 
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   | 52 +++++++++----------
> >  1 file changed, 24 insertions(+), 28 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index e084fbbf976e..0dd543c6c08e 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -37,6 +37,30 @@ select:
> >    required:
> >      - compatible
> >  
> > +allOf:
> > +  - $ref: "ethernet-controller.yaml#"
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - snps,dwmac-4.00
> > +              - snps,dwmac-4.10a
> > +              - snps,dwmac-4.20a
> > +              - snps,dwmac-5.10a
> > +              - snps,dwxgmac
> > +              - snps,dwxgmac-2.10
> > +
> > +      required:
> > +        - compatible
> > +    then:
> > +      properties:
> > +        snps,tso:
> > +          $ref: /schemas/types.yaml#definitions/flag
> > +          description:
> > +            Enables the TSO feature otherwise it will be managed by
> > +            MAC HW capability register.
> 

> BTW, I prefer that properties are defined unconditionally, and then 
> restricted in conditional schemas (or ones that include this schema).

Are you saying that it's ok to have all the properties unconditionally
defined in some generic schema and then being un-defined (like redefined
to a false-schema) in a schema including (allOf-ing) it?

> 
> > +
> >  properties:
> >  
> >    # We need to include all the compatibles from schemas that will
> > @@ -314,34 +338,6 @@ dependencies:
> >    snps,reset-active-low: ["snps,reset-gpio"]
> >    snps,reset-delay-us: ["snps,reset-gpio"]
> >  
> > -allOf:
> > -  - $ref: "ethernet-controller.yaml#"
> > -  - if:
> > -      properties:
> > -        compatible:
> > -          contains:
> > -            enum:
> > -              - allwinner,sun7i-a20-gmac
> 

> This does not have a fallback, so snps,tso is no longer validated. I 
> didn't check the rest.

Until the DT node is having a compatible string with the DW MAC
IP-core version the property won't be checked by the driver anyway.
AFAICS noone really knows what IP was that. So most likely the
allwinner emacs have been added to this conditional schema by
mistake...

-Sergey

> 
> > -              - allwinner,sun8i-a83t-emac
> > -              - allwinner,sun8i-h3-emac
> > -              - allwinner,sun8i-r40-emac
> > -              - allwinner,sun8i-v3s-emac
> > -              - allwinner,sun50i-a64-emac
> > -              - snps,dwmac-4.00
> > -              - snps,dwmac-4.10a
> > -              - snps,dwmac-4.20a
> > -              - snps,dwxgmac
> > -              - snps,dwxgmac-2.10
> > -              - st,spear600-gmac
> > -
> > -    then:
> > -      properties:
> > -        snps,tso:
> > -          $ref: /schemas/types.yaml#definitions/flag
> > -          description:
> > -            Enables the TSO feature otherwise it will be managed by
> > -            MAC HW capability register.
> > -
> >  additionalProperties: true
> >  
> >  examples:
> > -- 
> > 2.29.2
> > 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
