Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CCF5A34F
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Jun 2019 20:17:31 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 040A4C35E01;
	Fri, 28 Jun 2019 18:17:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C1D7C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 18:17:29 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E6876208CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 18:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561745848;
 bh=WEewm/I8ZtGtlarCL0Kn+22mM26dscf3xRKcIsgTilY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KdZqIh+/dbl2KM/DglLXMr8RRiF37wmqzDnSBG0OOrZm88FHZLWeqoZJTAXBew0vE
 RCjqZ8i+TzSFRbw7sKBA+6RRhbA97gu7+V4Kjj7mLzdGTmlYNbqAlR4UNizwRRdYH1
 NqBARTsG3cRq5LJPstp9NwRsswNJMgDrC0qinUmI=
Received: by mail-qk1-f180.google.com with SMTP id t8so5625930qkt.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 28 Jun 2019 11:17:27 -0700 (PDT)
X-Gm-Message-State: APjAAAW7SAhlqgXk5YyKfeYo8GvDOVSEwcc4COay3WWjv+kLcM67XelW
 QZjDKYSA4DjawGeEDs0nd+RllwL0iQ4PzsHHYA==
X-Google-Smtp-Source: APXvYqy3MzvCjB+KLt1OVmFltrR2WiZ5cZ+Oh3r7gZHAGRF19j+S/sbA4Erqc/j0sd6VdXSFeTDa8FH7AclbdRhxYJg=
X-Received: by 2002:a05:620a:1447:: with SMTP id
 i7mr10092989qkl.254.1561745847189; 
 Fri, 28 Jun 2019 11:17:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.e80da8845680a45c2e07d5f17280fdba84555b8a.1561649505.git-series.maxime.ripard@bootlin.com>
 <e99ff7377a0d3d140cf62200fd9d62c108dac24e.1561649505.git-series.maxime.ripard@bootlin.com>
 <CAL_JsqKQoj6x-8cMxp2PFQLcu93aitGO2wALDYaH2h72cPSyfg@mail.gmail.com>
 <20190627155708.myxychzngc3trxhc@flea>
 <CAL_JsqLhUP62vP=RY8Bn_0X92hFphbk_gLqi4K48us56Gxw7tA@mail.gmail.com>
 <20190628134553.l445r5idtejwlryl@flea>
In-Reply-To: <20190628134553.l445r5idtejwlryl@flea>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 28 Jun 2019 12:17:15 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+OCN6Mbcc0ztheVc7OS2SF12h-=t_7ZGrcqj93x4m08Q@mail.gmail.com>
Message-ID: <CAL_Jsq+OCN6Mbcc0ztheVc7OS2SF12h-=t_7ZGrcqj93x4m08Q@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v4 03/13] dt-bindings: net: Add a YAML
 schemas for the generic MDIO options
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

On Fri, Jun 28, 2019 at 7:46 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Thu, Jun 27, 2019 at 10:06:57AM -0600, Rob Herring wrote:
> > On Thu, Jun 27, 2019 at 9:57 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
> > > > > +
> > > > > +        reset-gpios = <&gpio2 5 1>;
> > > > > +        reset-delay-us = <2>;
> > > > > +
> > > > > +        ethphy0: ethernet-phy@1 {
> > > > > +            reg = <1>;
> > > >
> > > > Need a child node schema to validate the unit-address and reg property.
> > >
> > > This should be already covered by the ethernet-phy.yaml schemas
> > > earlier in this series.
> >
> > Partially, yes.
> >
> > > Were you expecting something else?
> >
> > That would not prevent having a child node such as 'foo {};'  or
> > 'foo@bad {};'. It would also not check valid nodes named something
> > other than 'ethernet-phy'.
>
> Right, but listing the nodes won't either, since we can't enable
> additionalProperties in that schema. So any node that wouldn't match
> ethernet-phy@.* wouldn't be validated, but wouldn't generate a warning
> either.

Perhaps I wasn't clear, but it was missing or incorrect 'reg' property
and unit-address format checks that I was thinking about. Just like we
have for SPI.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
