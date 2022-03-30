Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6E24EC40C
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Mar 2022 14:30:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 45B9BC60467;
	Wed, 30 Mar 2022 12:30:04 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
 [209.85.221.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7C7EC01577
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 12:30:03 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id p143so11462630vkf.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 05:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UOWc2z4o6DC6pqDz0yydlogP1ndPfXTDpB2t/FafZMU=;
 b=dBJob2UMlN+MJrwOPjhSvDcQlRB+MjkrB/Oqgr8Hgm0ilh7w4OC2rONGw3/Ma4+IDo
 n2lX8tFXlLolZJ+Fu549fF+75EMzT/Mdw95Rb2R/czuKipJTtq7KpMOlYBP/VFisO1UY
 QBgMJtb/hNQGQJqyztS1hl+JyjL0MIH4ih55Xu2MFdcfB1g/NwEx2wpSHsscjvQgVndi
 wZ6Bu3XbAv0L1Kz2SQr3uZ1ZsfXYwkO27c8Q50unZQYJx61F3hiKc3k7AoBEsVXzbTOg
 33qwxMcKyhskwNoP3Wqid44AIjrkaxV5LjCvSwH7Jx9MPhZ7Yf+pcp+ZBpLtFA7EmD0v
 TPAw==
X-Gm-Message-State: AOAM533gCNAiD72Z6fWLflPVWVmbC+BXp5s9FjXGY3IYtWNslBDdJMyn
 Vjbyws727Q5quJa5y6m2jkMm+gfl5p8Luw==
X-Google-Smtp-Source: ABdhPJx0T4wacv9VDlEHYrA2A1HZAHNmQByX+YmapIZCZ0NngxB3Kzodkn5a8n+GgiNp4bvfARUb4w==
X-Received: by 2002:a05:6122:404:b0:343:32ef:2503 with SMTP id
 e4-20020a056122040400b0034332ef2503mr12088391vkd.27.1648643402261; 
 Wed, 30 Mar 2022 05:30:02 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44]) by smtp.gmail.com with ESMTPSA id
 m6-20020a056122138600b0033ff622c988sm1802509vkp.48.2022.03.30.05.30.02
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 05:30:02 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id k9so1077704uad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Mar 2022 05:30:02 -0700 (PDT)
X-Received: by 2002:a25:9e89:0:b0:63c:ad37:a5de with SMTP id
 p9-20020a259e89000000b0063cad37a5demr17071596ybq.342.1648642915183; Wed, 30
 Mar 2022 05:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-8-andriy.shevchenko@linux.intel.com>
 <CAMuHMdWs+OuxV0cO=XGYvOOJ0Mctwu6fKV5HnkdRBXNKkLE3uQ@mail.gmail.com>
 <YkRKI6W4vR/aCr8c@smile.fi.intel.com>
In-Reply-To: <YkRKI6W4vR/aCr8c@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Mar 2022 14:21:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWiL+R=9NSgpxo+9e+_8jj9zm4nGwcfejap5z3XdYYtwA@mail.gmail.com>
Message-ID: <CAMuHMdWiL+R=9NSgpxo+9e+_8jj9zm4nGwcfejap5z3XdYYtwA@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 07/13] pinctrl: renesas: rza1: Switch
 to use for_each_gpiochip_node() helper
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

On Wed, Mar 30, 2022 at 2:17 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, Mar 30, 2022 at 12:00:27PM +0200, Geert Uytterhoeven wrote:
> > On Tue, Mar 29, 2022 at 5:29 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > +       struct fwnode_reference_args of_args;
> >
> > fw_args?
>
> Perhaps just args as other drivers do?

Fine for me.

> > > -       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pOFn",
> > > -                                        np);
> > > +       chip->label     = devm_kasprintf(rza1_pctl->dev, GFP_KERNEL, "%pfw", fwnode);
> >
> > This changes the label from e.g. "/soc/pinctrl@fcfe3000/gpio-11" to "gpio-11".
>
> Hmm... It seems other way around, i.e. it changes from the name to full name.

Oops, sorry about that.
(I accidentally included the change from testing "%pfwP" ;-)

>
> > %pfwP?
>
> But conclusion here is correct. Good catch!

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
