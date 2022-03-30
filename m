Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 090AB4EBE25
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 11:58:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A7AF5C60467;
	Wed, 30 Mar 2022 09:58:47 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com
 [209.85.160.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 781DCC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 09:58:46 +0000 (UTC)
Received: by mail-oa1-f43.google.com with SMTP id
 586e51a60fabf-df26ea5bfbso3946486fac.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 02:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e6Qd1JdMt3NwzWK7NAVAPGEjLMWhB8qclJNlYrQ8idw=;
 b=xXjDdCIO1CWti0X22iOZruO2kHLkWLwYy/ciJgiwQjia8blL4H/zg/fFv0JSq0doFk
 4xx0hIbwoKihnV2gWT2WLWnV6YWcQzIkOagEBHnWVEoL04A1rS77lgkscMd5uE0vf5RH
 XgzIP1O8bfUdifFcL6xYpkaZr1nJtYGukyY7UxcA6Ow0LKDD0qYxsQ0mk5m1R7d80i/l
 lnX8gHFMx4tkGZSjeFT8dzLA9OczqGuq/71kBG2MJ/k+Jhg4Lfc20TfF26aQ/MegKLW8
 UG1jDvpWPENdSb1gktj/jxZxZHx5g9xdGLEOl2w3txpGfDZjYJhtYdY3066xNh6g1Skp
 uPYg==
X-Gm-Message-State: AOAM5315wD/bNj23i3A0TzpAPsCn8XtWft/aj878A/glwgqZ8kHYvNer
 JLUwz+Nf3iDZqraC+P7WjRYuLmm9ciAg/w==
X-Google-Smtp-Source: ABdhPJwFyrFqBoN27CQ8SwNNB9BbY7wkhKR8xZlUeyzRO3CROWdomdwz+vsEZFYnzgR3xF1MEmyOIQ==
X-Received: by 2002:a05:6870:40ce:b0:da:5b07:231c with SMTP id
 l14-20020a05687040ce00b000da5b07231cmr1750303oal.284.1648634325123; 
 Wed, 30 Mar 2022 02:58:45 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
 [209.85.210.42]) by smtp.gmail.com with ESMTPSA id
 f4-20020a056870d30400b000da71ab35e0sm9373308oag.44.2022.03.30.02.58.44
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 02:58:45 -0700 (PDT)
Received: by mail-ot1-f42.google.com with SMTP id
 k25-20020a056830151900b005b25d8588dbso14567283otp.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 02:58:44 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr34863152ywi.449.1648633890723; Wed, 30
 Mar 2022 02:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220329152926.50958-7-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 11:51:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVSBh7Tnf5pnCfzf7=h5sttX2qH5j4kOkvvcuCMydmeYw@mail.gmail.com>
Message-ID: <CAMuHMdVSBh7Tnf5pnCfzf7=h5sttX2qH5j4kOkvvcuCMydmeYw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 06/13] pinctrl: renesas: rza1: Replace
 custom code by gpiochip_node_count() call
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

On Tue, Mar 29, 2022 at 5:29 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Since we have generic function to count GPIO controller nodes
> under a given device, there is no need to open code it. Replace
> custom code by gpiochip_node_count() call.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
