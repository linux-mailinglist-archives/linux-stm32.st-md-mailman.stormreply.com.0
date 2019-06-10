Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF8F3BC4D
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 20:59:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44412CF240F
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Jun 2019 18:59:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1713DCF240D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 18:59:43 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9C46920859
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 18:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560193181;
 bh=NiQ6TSS68zMVARMk1UxtRrBtgarpzq8OIbKEFYq7Nyw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PZy7xeMMzhmsda1hjKJ29ExmrhdZQYjnrUmbMWO8BP81vJK3DXvIkdTzD9GV/r1Ta
 QEwqvvJUFE93GJeXm1+pobl+zg78XWx5FA1zDP9ROVKQooOyrpWOkm9JmoyVZS0fRR
 MUiMJ+kawdHnnw7xPP3a2XNiVFIPhPOLiKhjgY48=
Received: by mail-qt1-f173.google.com with SMTP id i34so11662721qta.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Jun 2019 11:59:41 -0700 (PDT)
X-Gm-Message-State: APjAAAV3nhgVe65uXBmojDzA4tvVA2t/5gw9iB8uwvWRiPT4NUfafQnb
 MI/KTpiHtKEj2i6eftZ4W2N0KhbEex1C0PlBZQ==
X-Google-Smtp-Source: APXvYqwCmscLJYNa3hNvdJokj1iSTo/T0hJq/eoSYOtoTwBoqS29ewgLPnrTr6A8IxSA+xvJ3iYP3g7C2lZ8C89tCMA=
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr61317703qtc.300.1560193180904; 
 Mon, 10 Jun 2019 11:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <91618c7e9a5497462afa74c6d8a947f709f54331.1560158667.git-series.maxime.ripard@bootlin.com>
 <d198d29119b37b2fdb700d8992b31963e98b6693.1560158667.git-series.maxime.ripard@bootlin.com>
 <20190610143139.GG28724@lunn.ch>
In-Reply-To: <20190610143139.GG28724@lunn.ch>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 10 Jun 2019 12:59:29 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJahCJcdu=+fA=ewbGezuEJ2W6uwMVxkQpdY6w+1OWVVA@mail.gmail.com>
Message-ID: <CAL_JsqJahCJcdu=+fA=ewbGezuEJ2W6uwMVxkQpdY6w+1OWVVA@mail.gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev <netdev@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Antoine_T=C3=A9nart?= <antoine.tenart@bootlin.com>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 05/11] dt-bindings: net: sun4i-emac:
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

On Mon, Jun 10, 2019 at 8:31 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - phy
> > +  - allwinner,sram
>
> Quoting ethernet.txt:
>
> - phy: the same as "phy-handle" property, not recommended for new bindings.
>
> - phy-handle: phandle, specifies a reference to a node representing a PHY
>   device; this property is described in the Devicetree Specification and so
>   preferred;
>
> Can this be expressed in Yaml? Accept phy, but give a warning. Accept
> phy-handle without a warning? Enforce that one or the other is
> present?

The common schema could have 'phy: false'. This works as long as we've
updated (or plan to) all the dts files to use phy-handle. The issue is
how far back do you need kernels to work with newer dtbs.

Rob
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
