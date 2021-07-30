Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD23DD366
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:51:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C17BC5AB6E;
	Mon,  2 Aug 2021 09:51:51 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D7EEEC57B6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 18:48:35 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id oz16so18469503ejc.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jul 2021 11:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uqEJ2tVk3zcOiShzikPvptoGMxHSTS5A52RutoFqS7U=;
 b=VNTu8gtySpaaA9sS+BurTr8F6HP1kt3TtaG4MO5SiuRWtmvH7Sakptp3Na+wiVsa/s
 2Y4mylYfnuM0mgcDzsgHIhomZVBtEHzHlkEeSaLecHZbynPSffYazJ8t0eP/i9csiEii
 6JL9U9aRmmywVGZ+XCUSFeMacWg/AVZaUvGaYkUlJbZyrqOu1KeesnWEl++Kv+O86JLA
 rPKlUEALxQp0A8anLlu/17bvg7zST/3nzp2t5YecKTzuyvXkoD7Wdv6XcNz2gL4SMQ7b
 o6MkSsXFpIE1XNLLI4CvNGbcJWKdiKgsMrbFf5eW5kDMsmD7ZJajr+a7NJDISKaaxgO1
 NLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uqEJ2tVk3zcOiShzikPvptoGMxHSTS5A52RutoFqS7U=;
 b=dn98hGpOiu1TisD7uNqasMZKWRrc49/EjjiomkgdhKXpn0mvrLIou2wJsAmy5kk06f
 UjRWF+ZNwPxtoKHVftjz0nX8cLXNvA7rr7bTcwSfRsesBBOwzyHWhx6JD07+J6svJpdS
 4pZuz4vTB6LGD/2mOEKsha90LTexTmhr6TTiCzEb+xQ7FuSfZV2378lI+fFBxvNQ3Bet
 NnDhoUS4N+vnYKE6ZGiOg0esyTGtxa6DPrQuJ8GElW06TIm94Jc0dYRmcgwizI6CCqSX
 I+Pj24M9fVYjmFFzigjePfqLpwDi/YPV28k9NtRNRGTcg31UhjvRsvJu8jmW3oDVblph
 rb1A==
X-Gm-Message-State: AOAM532Xbe936Lp+ISR9vXuyFbACp7DCeloOpKSKfdYxYw9+chDbZHD6
 feAR/DFXyvm5JAkcPk+t/A6E2+RGonHTUqWA6nM=
X-Google-Smtp-Source: ABdhPJxgQtN17xHqQ9vhmBTo79gnekMn6vV9DVxYUb4Z8lYNCc/M1ZY0V2WSXXxuXrzrj3X0lwDN3T2Pea8nFfVmiLw=
X-Received: by 2002:a17:907:7848:: with SMTP id
 lb8mr3992214ejc.494.1627670914923; 
 Fri, 30 Jul 2021 11:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210729201100.3994-1-linux.amoon@gmail.com>
 <20210729201100.3994-3-linux.amoon@gmail.com>
 <a360877260a877819ad8eef7f63c370e0c16c640.camel@pengutronix.de>
In-Reply-To: <a360877260a877819ad8eef7f63c370e0c16c640.camel@pengutronix.de>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 31 Jul 2021 00:18:23 +0530
Message-ID: <CANAwSgSHFfzq4BYZN4wRUWcfc8+G5X9MvTUJu86MGBGFfQPSYA@mail.gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:51:10 +0000
Cc: "David S. Miller" <davem@davemloft.net>,
 devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Emiliano Ingrassia <ingrassia@epigenesys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCHv1 2/3] ARM: dts: meson: Use new reset id
	for reset controller
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

Hi Philipp,

Thanks for your review comments.

On Fri, 30 Jul 2021 at 15:16, Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> On Fri, 2021-07-30 at 01:40 +0530, Anand Moon wrote:
> > Used new reset id for reset controller as it conflict
> > with the core reset id.
> >
> > Fixes: b96446541d83 ("ARM: dts: meson8b: extend ethernet controller description")
> >
> > Cc: Jerome Brunet <jbrunet@baylibre.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  arch/arm/boot/dts/meson8b.dtsi  | 2 +-
> >  arch/arm/boot/dts/meson8m2.dtsi | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
> > index c02b03cbcdf4..cb3a579d09ef 100644
> > --- a/arch/arm/boot/dts/meson8b.dtsi
> > +++ b/arch/arm/boot/dts/meson8b.dtsi
> > @@ -511,7 +511,7 @@ &ethmac {
> >       tx-fifo-depth = <2048>;
> >
> >       resets = <&reset RESET_ETHERNET>;
> > -     reset-names = "stmmaceth";
> > +     reset-names = "ethreset";
>
> This looks like an incompatible change. Is the "stmmaceth" reset not
> used? It is documented as "MAC reset signal" in [1]. So a PHY reset
> should be separate from this.
>
> [1] Documentation/devicetree/bindings/net/snps,dwmac.yaml
>
From the above device tree binding is been used below.
  reset-names:
    const: stmmaceth

While testing new reset driver changes I was getting conflict with
reset id, see the below links
hence I opted for a new reset-names = "ethreset".

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/stmicro/stmmac/stmmac.h?h=v5.14-rc3#n12
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c?h=v5.14-rc3#n598

> regards
> Philipp

Thanks

-Anand
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
