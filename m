Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D74374F2F6A
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Apr 2022 14:13:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9BE53C6047C;
	Tue,  5 Apr 2022 12:13:20 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BBB2C60467
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Apr 2022 12:13:19 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bh17so26268659ejb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Apr 2022 05:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w/Z5VzjPaah7N0YUbtAhapqjSjMXfGCadaBASbAspD0=;
 b=7dOiBFDRRvuhX8nNQguHmbWm8+QE2DPP5lE6QQD4Pd+x55V/KnhDuzAmKXTJfOARUL
 v+TNzqGFPW3+EGqiUCPOVmiDKgZxsGTSTnC0X5ZQVtl974YDs4B5Iz5CXjBqWbou2Awp
 yWqAzw62kex2Pk0y9GpVAT1Se8ZGHdxfLA76vbdm1RNCzc9+ANL/kg7ntkI2zIpHTr/m
 Llp/luaTI55RpNSJ/yjFbyWKipC98B7qcWuHW98I4ksMx0B2VYan5xfJEd3fz9r65Fbo
 yYv+658/+ggJ1eqVFoc8k39bYRCt6XFnmBAmyIWw26HtjOd8PhMgKFU8rHcLxqexneSl
 iQZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w/Z5VzjPaah7N0YUbtAhapqjSjMXfGCadaBASbAspD0=;
 b=ZyGN/QFik4e20wz+KVKJtn1oBGOo3q9REj015FV28FBkJ1IbD4YOWtDFCfzteyFZ8i
 Fy933qO7CwhT3lVgBBGA5lXn/CdcCVM9RJwq/9rcMu7KdPbKT/NK8BIINfTUvaTWKWNv
 2kXZsT7pH75G4v6fshqTdIfqpGtpQ0jrHYQQK7burA6pe/6OD7tiYTowfVKRYpvX2koy
 KNRPWAdmJFOBdpiRNLgB7L0ucGV0Pl6+/uBSUdhX6rOl0s2W6tnow9oVDc9l7qLI887f
 30NmImjqNDZGZqtdh0Mla5wBa+gB3DeTvn3xGAhmlLkVX5mKlyXgS8C87fQ5UshLn4Z9
 c8bA==
X-Gm-Message-State: AOAM531ztbyiHw2rcTT6fb9Q2FkrI689XDPGqDy2WRJIBrQVjlyDwVRk
 UBRgJB5FEgUToiDbBE7YYorpjkHZSuT808QhZi1ppw==
X-Google-Smtp-Source: ABdhPJxVvhV5WZmApCq0DsgEovGa26+9MHznvNSVzqBc6ACt4ofBrfoHmbUA4s/kOIOSyV1hrsGZJlqKWGVuGtI+4qo=
X-Received: by 2002:a17:906:6a1d:b0:6e8:35a:4439 with SMTP id
 qw29-20020a1709066a1d00b006e8035a4439mr3387538ejc.734.1649160799105; Tue, 05
 Apr 2022 05:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220401103604.8705-3-andriy.shevchenko@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 5 Apr 2022 14:13:08 +0200
Message-ID: <CAMRc=MeaSC6kvwfGAhX7XbeFvaw7MiozTj1p+ThZYCHZFppSzg@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>,
 Marc Zyngier <maz@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [Linux-stm32] [PATCH v4 02/13] gpiolib: Introduce
	gpiochip_node_count() helper
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

On Fri, Apr 1, 2022 at 12:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> The gpiochip_node_count() helper iterates over the device child nodes that
> have the "gpio-controller" property set. It returns the number of such nodes
> under a given device.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/linux/gpio/driver.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
> index bfc91f122d5f..12de0b22b4ef 100644
> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -755,4 +755,15 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
>         device_for_each_child_node(dev, child)                                  \
>                 if (!fwnode_property_present(child, "gpio-controller")) {} else
>
> +static inline unsigned int gpiochip_node_count(struct device *dev)
> +{
> +       struct fwnode_handle *child;
> +       unsigned int count = 0;
> +
> +       for_each_gpiochip_node(dev, child)
> +               count++;
> +
> +       return count;
> +}
> +
>  #endif /* __LINUX_GPIO_DRIVER_H */
> --
> 2.35.1
>

Acked-by: Bartosz Golaszewski <brgl@bgdev.pl>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
