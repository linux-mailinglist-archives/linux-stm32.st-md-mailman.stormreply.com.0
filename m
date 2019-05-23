Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EA128A03
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 21:54:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64CDFCD5F97
	for <lists+linux-stm32@lfdr.de>; Thu, 23 May 2019 19:54:34 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9ABACD5F96
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 May 2019 19:54:33 +0000 (UTC)
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 915DD240004;
 Thu, 23 May 2019 19:54:26 +0000 (UTC)
Date: Thu, 23 May 2019 21:54:26 +0200
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>
Message-ID: <20190523195426.jmlpmofvm3mqw247@flea>
References: <74d98cc3c744d53710c841381efd41cf5f15e656.1558605170.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqJnFUt55b+AGpcNNjvsKsHNz9PY+b7FJ4+6CMNppzb3vg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJnFUt55b+AGpcNNjvsKsHNz9PY+b7FJ4+6CMNppzb3vg@mail.gmail.com>
User-Agent: NeoMutt/20180716
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Antoine =?utf-8?Q?T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 1/8] dt-bindings: net: Add YAML schemas
 for the generic Ethernet options
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

Hi Rob,

Thanks for the review,

On Thu, May 23, 2019 at 08:10:22AM -0500, Rob Herring wrote:
> > +  fixed-link:
> > +    allOf:
> > +      - if:
> > +          type: array
> > +        then:
> > +          minItems: 1
> > +          maxItems: 1
> > +          items:
> > +            type: array
> > +            minItems: 5
> > +            maxItems: 5
> > +          description:
> > +            An array of 5 cells, with the following accepted values
> > +              - At index 0, the emulated PHY ID, choose any but but
> > +                unique to the all specified fixed-links, from 0 to 31
> > +              - at index 1, duplex configuration with 0 for half duplex
> > +                or 1 for full duplex
> > +              - at index 2, link speed in Mbits/sec, accepted values are
> > +                10, 100 and 1000
> > +              - at index 3, pause configuration with 0 for no pause, 1
> > +                for pause
> > +              - at index 4, asymmetric pause configuration with 0 for no
> > +                asymmetric pause, 1 for asymmetric pause
>
> Looks like constraints to me:
>
> items:
>   - minimum: 0
>     maximum: 31
>   - enum: [ 0, 1 ]
>   - enum: [ 10, 100, 1000 ]
> ...

Yeah, we should definitely do something like that. I tried and failed,
but that looks like the right solution.

> > +
> > +
> > +      - if:
>
> Couldn't this be an 'else' and avoid the allOf?

I don't really know, we could go both ways. Which one would be the
more verbose in the case where someone would just have a boolean
instead of the node or the array?

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
