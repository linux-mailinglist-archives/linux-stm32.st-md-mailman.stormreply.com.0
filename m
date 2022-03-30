Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6324EBE35
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 12:01:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3CD0C60467;
	Wed, 30 Mar 2022 10:01:09 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3B0C7C01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 10:01:09 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id hu11so16442446qvb.7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 03:01:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eWVEyP8xb0gTFVWSPikhwxNAnBSVX8r5lpCe0its8eQ=;
 b=zt1B9fVZORpzyBjWrW3KKntuhxqPCFn55CiW1yUpuHvGQR/I9L4jmp64yn3WqGTWnt
 K0r6Zje0dG5q+6Tp4Z496yVlvTe8evv39+PfYthfJHi9yCq2GsiEqPtXOOm6flvne8l2
 GiUcLGO+gQ1E80WBLwZMH+RBCDQQZUgNymgtnFP1Tzaavpz46zFbU3rCmGbLhVd/dTC0
 Lj4og58VbaQDn+6MQMd4Nj2IabVSsdF8l4YUZlwvd+q66TlQm845/4lv6mAdCvfNqWWi
 uN8DUI9PmbA8XaGciyR8jKc2N3rox9dwTm0WtoI0jyz4tuk5XSdTaQcOOCqz1XN2Cyet
 x3Hw==
X-Gm-Message-State: AOAM531teb+Y9CN04l9SYYE+OXGk+XfXZye8MOsoFnOMdC7zmU07Gcs/
 Puen+UKuXybcFlrXkirnzxcEEfr15GOqnA==
X-Google-Smtp-Source: ABdhPJymlwSpiskdOtgUGOkWokwIS+N0WdXVyDYHjpVg/WDJe4akMZxogB9UKw1Ia4aIuSnDrBgEgw==
X-Received: by 2002:a05:6214:3004:b0:434:ec44:a4aa with SMTP id
 ke4-20020a056214300400b00434ec44a4aamr30263526qvb.82.1648634467623; 
 Wed, 30 Mar 2022 03:01:07 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com.
 [209.85.128.171]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac85cd0000000b002e1ed82f1e5sm17950729qta.75.2022.03.30.03.01.06
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 03:01:07 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-2e68c95e0f9so212678427b3.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 03:01:06 -0700 (PDT)
X-Received: by 2002:a25:aa0e:0:b0:633:7c3b:94a0 with SMTP id
 s14-20020a25aa0e000000b006337c3b94a0mr33028380ybi.546.1648634466403; Wed, 30
 Mar 2022 03:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220329152926.50958-2-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 12:00:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXhiLi8YxxG0f9hBfBkwds3LAdJNSOBSR9FYE4_z=RvcA@mail.gmail.com>
Message-ID: <CAMuHMdXhiLi8YxxG0f9hBfBkwds3LAdJNSOBSR9FYE4_z=RvcA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 01/13] gpiolib: Introduce
	for_each_gpiochip_node() loop helper
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
> Introduce for_each_gpiochip_node() loop helper which iterates over
> the GPIO controller child nodes of a given device.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
