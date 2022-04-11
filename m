Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B174FB6DD
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Apr 2022 11:04:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69D5AC628A6;
	Mon, 11 Apr 2022 09:04:15 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F3F0EC6049E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 09:04:13 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id r25so2425806qtp.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 02:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9TRi0bNPoJj9i+0TdWcYotMzzdlJV8VxAkudB/T4n5g=;
 b=1U5TnUlKAnK+OgFwTrDCtKBW7arHV4ncgEvayQgE1ukGslVlR1ET5YZBZHBkRN1u8G
 p6x0Y8L42ZvQJOgmj2yw8vcGH6FcFdD+scSRf9ZxjU0lbCOXCVy7H4cpisVqButd9T7k
 19lu8C0ZfzBwtc2NTq0HjEuo/ELIC75Ihsx5BB2oPOO8ahtqnjCYriE5EXzzdg4vtYLD
 UPlPLY7Xni23KSByRPhytmLU1+aDbZ5KviLwBoQSYw1jMTD2JTxL9sXwSkuGUP30CdpB
 T35obgwI3y/scFxe/XIJ2QKkNLzH8y8O9Pv3Jt8DnrwL2fyZYIbtk5pfFm1OIyizFGiN
 0M+A==
X-Gm-Message-State: AOAM5309DV7x24M8mK//GyI6buM2l9pLFva3uZQRd67e5mvV4OvPc+Op
 S8QOXGBPSbQ4JO0BKR6PdahLILkl1iss3w==
X-Google-Smtp-Source: ABdhPJwVH5tB1SiLoRHHoH+13w0aKaSxb1PF++gn1nCeaEmrAcCMCM3xyhDqNoc1I7d8+0xeetAhlg==
X-Received: by 2002:ac8:546:0:b0:2ed:f7c4:cd7d with SMTP id
 c6-20020ac80546000000b002edf7c4cd7dmr3521904qth.12.1649667852481; 
 Mon, 11 Apr 2022 02:04:12 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 g4-20020ac87d04000000b002e06b4674a1sm24904078qtb.61.2022.04.11.02.04.11
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 02:04:11 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-2db2add4516so157588557b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Apr 2022 02:04:11 -0700 (PDT)
X-Received: by 2002:a0d:e743:0:b0:2eb:3106:9b32 with SMTP id
 q64-20020a0de743000000b002eb31069b32mr25689449ywe.512.1649667851285; Mon, 11
 Apr 2022 02:04:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <20220401103604.8705-10-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220401103604.8705-10-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Apr 2022 11:04:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8zWA-3_=Je7sB_72G8Ky7-syqCH-RXGxNMazUipW-2g@mail.gmail.com>
Message-ID: <CAMuHMdX8zWA-3_=Je7sB_72G8Ky7-syqCH-RXGxNMazUipW-2g@mail.gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Marc Zyngier <maz@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Alim Akhtar <alim.akhtar@samsung.com>,
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
 Kevin Hilman <khilman@baylibre.com>, openbmc@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH v4 09/13] pinctrl: meson: Rename REG_* to
	MESON_REG_*
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

On Fri, Apr 1, 2022 at 12:36 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Currently compilation test fails on x86 due to name collision. The usual
> way to fix that is to move both conflicting parts to their own namespaces.
>
> Rename REG_* to MESON_REG_* as a prerequisite for enabling COMPILE_TEST.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -63,12 +63,12 @@ struct meson_reg_desc {
>   * enum meson_reg_type - type of registers encoded in @meson_reg_desc
>   */
>  enum meson_reg_type {
> -       REG_PULLEN,
> -       REG_PULL,
> -       REG_DIR,
> -       REG_OUT,
> -       REG_IN,
> -       REG_DS,
> +       MESON_REG_PULLEN,
> +       MESON_REG_PULL,
> +       MESON_REG_DIR,
> +       MESON_REG_OUT,
> +       MESON_REG_IN,
> +       MESON_REG_DS,
>         NUM_REG,

MESON_NUM_REG?

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
