Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98C4EBD00
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 10:55:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5BCAC60467;
	Wed, 30 Mar 2022 08:55:05 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DBA45C60464
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 08:55:03 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id a11so17471372qtb.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 01:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5TjfE/nqlbc8hvQ5iunfZ0y6JZjtbfEsmjFPKu69VzU=;
 b=KlTLIsUYCNrpu8kAfYW1HTPALqAD7kqDN30XSpuv/bGss230d8EyGHgbfEkWPPhcOB
 sJkq8FE9ot42XKOcXX1Y1G241ruGjIbgnjX8oYYFivZljCHZ7g56V7Pgi9UrpH2iVeJj
 3/swz7GuGx9kEa1E+w5rEruh0sT94y+8WGgxrO+YO7a3ulS+RQykAk/qkcE0WWDDgnub
 76zJJYl20v/5aBtrheMTFivUjmXVkDOmGsrVuB3BVH/hqIUIsRcnBI61TCr8oqL+vdXO
 52VIrpV3G6sCRuDM3IM4lF6wzwImuCmZRREQ8m4bPOjrvMeLw87sz3lzOqjCeamKRTA5
 5dBQ==
X-Gm-Message-State: AOAM532YBwN3MAn4JfMYoV6MK161qyxwl9OGlLlr4FeE3EXbyQTcvVW/
 eQKAOqXK0Keea2Cd8CG8JRL2TkxCPkKlxg==
X-Google-Smtp-Source: ABdhPJwvcV+01gK3xjOEjaUHS23yYeFpjBGPm+9phkkF+yaGL7JnYVz53sOw+rzlWT9YauPSfA0z1g==
X-Received: by 2002:ac8:5c83:0:b0:2e0:afe8:7aaa with SMTP id
 r3-20020ac85c83000000b002e0afe87aaamr31689329qta.466.1648630502168; 
 Wed, 30 Mar 2022 01:55:02 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com.
 [209.85.128.170]) by smtp.gmail.com with ESMTPSA id
 s13-20020a05620a0bcd00b0067afe7dd3ffsm11227668qki.49.2022.03.30.01.55.01
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 01:55:01 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so209878427b3.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 01:55:01 -0700 (PDT)
X-Received: by 2002:a81:c703:0:b0:2d0:cc6b:3092 with SMTP id
 m3-20020a81c703000000b002d0cc6b3092mr34737611ywi.449.1648630500868; Wed, 30
 Mar 2022 01:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
 <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
 <YkM22GwhxV+YKl8l@smile.fi.intel.com>
In-Reply-To: <YkM22GwhxV+YKl8l@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 10:54:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
Message-ID: <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 09/13] pinctrl: meson: Rename REG_* to
	MREG_*
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

On Tue, Mar 29, 2022 at 6:47 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Mar 29, 2022 at 06:13:19PM +0200, Neil Armstrong wrote:
> > On 29/03/2022 17:29, Andy Shevchenko wrote:
> > > Rename REG_* to * as a prerequisite for enabling COMPILE_TEST.
> >
> > What error do you hit ?
>
> arch/x86/include/asm/arch_hweight.h:9:17: error: expected identifier before string constant
> 9 | #define REG_OUT "a"
>   |                 ^~~

Perhaps REG_{OUT,IN} in arch/x86/include/asm/arch_hweight.h should be
renamed instead, as this is a generic header file that can be included
anywhere, while the REG_{OUT,IN} definitions are only used locally,
in the header file?

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
