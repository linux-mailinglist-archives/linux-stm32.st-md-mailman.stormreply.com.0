Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BCA4EBE5E
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 12:08:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F399C6046A;
	Wed, 30 Mar 2022 10:08:34 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02054C60465
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 10:08:32 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id k7so16455389qvc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 03:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xxF35tmxxnkPH4ZK5NEAQj60FJRzpVvnSJO5oaHeufw=;
 b=ZavW8iCprWiNKv+6SyRthK8jxtXPZ4KKWqxqqj2nj5q2Ftya1Chba1+ekFdCm5jlKU
 36IOxL7V6NravJp8zYcJtW1Gorn94YFUjOifYfYDH91sglvhZCmhlYLN6x0LrEOuKbNh
 ux6njFBgnELAxr6ZIn8nlhR8nRd2tI/I/qrzzgyLcJ9ZXjS/CmSidZv8GHLNhtHsFbm+
 +9tkHchbKQWUsO3m911x3uE2uo5CUKS+PpyRv0a5/mthzAwo2kQMH1TtgHdnx/tA6pIk
 poLjCKMwIkkPB6WujP9TFVZr+6sWmZibDxNnpIk6sf61NobZa7OK83DxT7u6YfFN3LXX
 HDAw==
X-Gm-Message-State: AOAM5336+rHiQOGiYcEEgy0d+g3Iri4NkJ3ECLxYdnDu1jOARge6STVs
 4D0DAzeq7BA4cFOlUFLz0S8PDY7VUZNN2w==
X-Google-Smtp-Source: ABdhPJxetZkfuM83Njo0DYnwb4yKfGgUJ+/G1GSIyA5LHiw7L0JkDH9C4A9Za3LQWNqqMdT4s7G6Mw==
X-Received: by 2002:a05:6214:2343:b0:43d:684c:f538 with SMTP id
 hu3-20020a056214234300b0043d684cf538mr30552975qvb.58.1648634911689; 
 Wed, 30 Mar 2022 03:08:31 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 b21-20020a05620a04f500b0067b4895472esm10780245qkh.5.2022.03.30.03.08.31
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 03:08:31 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so212120937b3.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 03:08:31 -0700 (PDT)
X-Received: by 2002:a0d:ccd6:0:b0:2e7:98e2:a5a2 with SMTP id
 o205-20020a0dccd6000000b002e798e2a5a2mr28100571ywd.479.1648634538529; Wed, 30
 Mar 2022 03:02:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220329152926.50958-3-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 12:02:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFENTrXsYq3PKRFBqUL570-pPMG43Vct62=U9cyyF0yQ@mail.gmail.com>
Message-ID: <CAMuHMdWFENTrXsYq3PKRFBqUL570-pPMG43Vct62=U9cyyF0yQ@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Kevin Hilman <khilman@baylibre.com>,
 openbmc@lists.ozlabs.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Nancy Yuen <yuenn@google.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>
Subject: Re: [Linux-stm32] [PATCH v2 02/13] gpiolib: Introduce
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

Hi Andy,

On Tue, Mar 29, 2022 at 5:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> The gpiochip_node_count() helper iterates over the device child nodes that
> have the "gpio-controller" property set. It returns the number of such nodes
> under a given device.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/include/linux/gpio/driver.h
> +++ b/include/linux/gpio/driver.h
> @@ -755,4 +755,16 @@ static inline void gpiochip_unlock_as_irq(struct gpio_chip *gc,
>         device_for_each_child_node(dev, child)                                  \
>                 if (!fwnode_property_present(child, "gpio-controller")) {} else
>
> +static inline unsigned int gpiochip_node_count(struct device *dev)
> +{
> +       struct fwnode_handle *child;
> +       unsigned int count;

Preinitialize to zero?

> +
> +       count = 0;
> +       for_each_gpiochip_node(dev, child)
> +               count++;
> +
> +       return count;
> +}
> +
>  #endif /* __LINUX_GPIO_DRIVER_H */

Regardless:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
