Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFF112D05
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2019 13:59:08 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 275C1C54B33
	for <lists+linux-stm32@lfdr.de>; Fri,  3 May 2019 11:59:08 +0000 (UTC)
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
 [209.85.166.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E2C81C54B32
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  3 May 2019 11:59:05 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id l140so8609834itb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 03 May 2019 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vDgYOPNAs5a7jn6rrh+mqlUAcW/QL6gqLTt3pqvnNY8=;
 b=Y6srGshKU+8ofVAzr5oXPRlANIBEkdOrCHKBPiE3tUswNgNowbNADcWMckRUE5gkSL
 9ukukehth9mBJJ/QJCpdkUMMW2+iAg10JbBAKpi7BjWy2OQ+HfalsNh4xdNDSsHWnKVY
 6bANvGQZzE11Hw3Y7RiWx/Sk3RaGiUf3o+mJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vDgYOPNAs5a7jn6rrh+mqlUAcW/QL6gqLTt3pqvnNY8=;
 b=Ap5wotgkTubXEbb7NOD+oMqhMYXPHlAhivIPEgVyARHT9B+2rYvuPCS4br8UwrETKA
 b/2rd7D1C0BVZNizfDCoK3EeDXDGdUE44Bh3PS8dRvhXpZogGA24RA21afGvzmmDuM+A
 AxRJm8K3nsjexE9BA7H5fSaav8MphZt/Gg0XJL56LbCka8VohyMLVYHbKmSQt9frz4q5
 59Bli0aSVZwZbR6Nwgdf5YJ2MPK42WnndxOmmMYUsjRvlfAjwZcQs/UL6G62wAB5CTWB
 PHt6n2UN3rVEH7M59uMqp84AvgPPTRP/qBp8Jp3Cf238nyXr4sjss2le1Y0qVdNoeT/r
 /Nqg==
X-Gm-Message-State: APjAAAWQ3iDIE4715D+GYAXlKEbh0aBs7d3le4ECqdnZDmuChEY542qW
 EyRiaK+Nbz6JK7vJuss3o6+k6P9p+vSKRiBvnvCj6A==
X-Google-Smtp-Source: APXvYqxogbylovsed3LC9Wji6QY3Bj1N0GsCs2SPDNY1RvVGOuqXHQj+rfQkbvVmWscSed3alM3kokBhRmxHN3Y8JlY=
X-Received: by 2002:a24:70d5:: with SMTP id f204mr6307014itc.32.1556884744596; 
 Fri, 03 May 2019 04:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190413165418.27880-1-megous@megous.com>
 <20190413165418.27880-6-megous@megous.com>
In-Reply-To: <20190413165418.27880-6-megous@megous.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Fri, 3 May 2019 17:28:53 +0530
Message-ID: <CAMty3ZDx6NXyYhQehYT9geeGwAk2PZidiVMwVw1nnZJa3zwyOg@mail.gmail.com>
To: megous@megous.com
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 devicetree <devicetree@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, netdev@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, Chen-Yu Tsai <wens@csie.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-gpio@vger.kernel.org,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "David S. Miller" <davem@davemloft.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [linux-sunxi] [PATCH v4 5/9] arm64: dts:
 allwinner: orange-pi-3: Enable ethernet
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

On Sat, Apr 13, 2019 at 10:24 PM megous via linux-sunxi
<linux-sunxi@googlegroups.com> wrote:
>
> From: Ondrej Jirman <megous@megous.com>
>
> Orange Pi 3 has two regulators that power the Realtek RTL8211E. According
> to the phy datasheet, both regulators need to be enabled at the same time,
> but we can only specify a single phy-supply in the DT.
>
> This can be achieved by making one regulator depedning on the other via
> vin-supply. While it's not a technically correct description of the
> hardware, it achieves the purpose.
>
> All values of RX/TX delay were tested exhaustively and a middle one of the
> working values was chosen.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  .../dts/allwinner/sun50i-h6-orangepi-3.dts    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> index 17d496990108..6d6b1f66796d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
> @@ -15,6 +15,7 @@
>
>         aliases {
>                 serial0 = &uart0;
> +               ethernet0 = &emac;
>         };
>
>         chosen {
> @@ -44,6 +45,27 @@
>                 regulator-max-microvolt = <5000000>;
>                 regulator-always-on;
>         };
> +
> +       /*
> +        * The board uses 2.5V RGMII signalling. Power sequence to enable
> +        * the phy is to enable GMAC-2V5 and GMAC-3V3 (aldo2) power rails
> +        * at the same time and to wait 100ms.
> +        */
> +       reg_gmac_2v5: gmac-2v5 {
> +               compatible = "regulator-fixed";
> +               regulator-name = "gmac-2v5";
> +               regulator-min-microvolt = <2500000>;
> +               regulator-max-microvolt = <2500000>;
> +               startup-delay-us = <100000>;
> +               enable-active-high;
> +               gpio = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
> +
> +               /* The real parent of gmac-2v5 is reg_vcc5v, but we need to
> +                * enable two regulators to power the phy. This is one way
> +                * to achieve that.
> +                */
> +               vin-supply = <&reg_aldo2>; /* GMAC-3V3 */

The actual output supply pin name is GMAC-3V which has an input of
VCC3V3-MAC (ie aldo2), if we compatible to schematics better to use
the same, IMHO.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
