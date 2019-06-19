Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E944C281
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 22:44:29 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0950C5CB5A
	for <lists+linux-stm32@lfdr.de>; Wed, 19 Jun 2019 20:44:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2ADB3C5CB27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 20:44:28 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2FAD217D9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 20:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560977066;
 bh=PtdbT4+WZVrSzw4byKsl98ZDeoGvcEoZe9NmCjzp7NY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SmxtmjKiyfEWKKyjPAThNkWlA5SttyK01pMv/kTD8l61XVCe/7BjNti98SwgjiM/T
 Q/ahTcG4e9SA1rQsFe1ZB5NVqF2LhqmjCO1o/p9OPoT0RoY5z/E168ZjUBv83d197K
 Ta3vGJjMlOIct4TbSa/GiCtdVq8NU897XITaTlQ4=
Received: by mail-qt1-f169.google.com with SMTP id d17so684902qtj.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 19 Jun 2019 13:44:26 -0700 (PDT)
X-Gm-Message-State: APjAAAWv/ja6Nmm4EWuVKdYjNX3BqYHkopsEPzdlzMhcnR9OcVn0CfcR
 g7drdRbzrgmyy3odzVrGiD6i45BArgjsAoG8xg==
X-Google-Smtp-Source: APXvYqyVAwxgOJDLFwnKUkBgoRpv1RMyh0FtU2bURQqffQhs//0pjSXX6+r6qT6fEnddczKAAfSd98UZabnH3BaOarM=
X-Received: by 2002:ac8:3908:: with SMTP id s8mr106885352qtb.224.1560977065877; 
 Wed, 19 Jun 2019 13:44:25 -0700 (PDT)
MIME-Version: 1.0
References: <27aeb33cf5b896900d5d11bd6957eda268014f0c.1560937626.git-series.maxime.ripard@bootlin.com>
 <e7c13fc3c4e287df6292dbee27ae1caeca0c06c4.1560937626.git-series.maxime.ripard@bootlin.com>
 <CAL_Jsq+A+jspyCpu9USL6FQ9y5qL_yqYS=DTE=aM5YzyeZwd0w@mail.gmail.com>
In-Reply-To: <CAL_Jsq+A+jspyCpu9USL6FQ9y5qL_yqYS=DTE=aM5YzyeZwd0w@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 19 Jun 2019 14:44:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLUDKi8jcJ=eZOAR9-ECX0bo9F8+d59sokWGOJzph_q7w@mail.gmail.com>
Message-ID: <CAL_JsqLUDKi8jcJ=eZOAR9-ECX0bo9F8+d59sokWGOJzph_q7w@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 netdev <netdev@vger.kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v3 06/16] dt-bindings: net: sun4i-emac:
 Convert the binding to a schemas
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

On Wed, Jun 19, 2019 at 8:46 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Jun 19, 2019 at 3:48 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> >
> > Switch our Allwinner A10 EMAC controller binding to a YAML schema to enable
> > the DT validation.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> >
> > ---
> >
> > Changes from v2:
> >   - Switch from the deprecated phy property to phy-handle
> > ---
> >  Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt      | 19 -------------------
> >  2 files changed, 55 insertions(+), 19 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/net/allwinner,sun4i-emac.txt
> >
> > diff --git a/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
> > new file mode 100644
> > index 000000000000..2ff9e605cd26
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/allwinner,sun4i-a10-emac.yaml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/allwinner,sun4i-a10-emac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Allwinner A10 EMAC Ethernet Controller Device Tree Bindings
> > +
> > +allOf:
> > +  - $ref: "ethernet-controller.yaml#"
> > +
> > +maintainers:
> > +  - Chen-Yu Tsai <wens@csie.org>
> > +  - Maxime Ripard <maxime.ripard@bootlin.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: allwinner,sun4i-a10-emac
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  allwinner,sram:
> > +    description: Phandle to the device SRAM
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - phy-handle
>
> Doesn't this throw an error if not listed in properties?

NM, it doesn't.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
