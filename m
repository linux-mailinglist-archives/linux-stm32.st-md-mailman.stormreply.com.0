Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A214501832
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Apr 2022 18:07:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6219CC60495;
	Thu, 14 Apr 2022 16:06:59 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D250FC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 16:06:58 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id k23so10977253ejd.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 09:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JZ9b/z89dch9gLvF5vASMxbmJ/Wzdwmfjy6OZsSqtqA=;
 b=L5sP55TAgL2AI4FDkJ+eMhfVeG1Y6n+mayllGbh7HAbtrbX8Kq31bKTjMTAqXQRdL+
 uxf5PF0+vennnKdDh1T5GXF47ae2ZFWslbFdRB1FcgBWFjZOP1tG9QRTiMQ5+OPvrUiI
 uvKkZBe1bmA87leVgy4H4aHNqAh9Ddz8maIOFpwfFldbi/9KASDbBidQAReNFKsRndjF
 mLrjHMWmyxtIw+DEVEBY5vPe4CNbEs7P2o7fRt23W0xo0/MlvZIRvflgp+6FVESYhKzj
 /+fwRMHo3W2c6bb3X30RDhJQAUPQQznabpXEXbKrWgIMGkIjBbescnE/2k5wlzkTPJ5D
 PnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JZ9b/z89dch9gLvF5vASMxbmJ/Wzdwmfjy6OZsSqtqA=;
 b=Sl5pTvDM/LfHFLEydTa2uebkWETZJv//eKyCgQRSUoGbIBLXQx2GhHVj8fyNQhv1+j
 WpVArMlgDXoJbT7Wz/e/0h4+7hzzgi51nVoTiZF387/CVhRinpaWJ362EfZ7MmNMqvU0
 FAdZUZZAUtRYHvRt6n24ofJQxYkymnL+HNZFoON45j0RCNWT8IU2D63H3KRz+awoLsRZ
 522Qwy0KwitXDgLp1HJpwp06E9kz+zGKNECZFSOFbxzgTIgJkTpE6OlJd3AEKOzYffsy
 ImDrzn7TjcRfUR0LRLIk5MV4s0/k2scJ9a57tuAFlGOja9Y90fwJQ8sGSFk0SgYQBeQB
 845A==
X-Gm-Message-State: AOAM530hbFsGGNr9wurbRr0+TKSdzwANyVCSd/2CocaMcISuN0i3vZ9m
 upbsYZe4Pb2TiszhQ74DcWWwSwaxtHibA0EwVbo=
X-Google-Smtp-Source: ABdhPJyF91NZOaGxS5Pl0tuT7o0nmwxyK0YmWaO6cyOAzEQDgBQtN5VcAICIZk16A9Jhgd3oPfGbcQ4Yyrca0dRmbw8=
X-Received: by 2002:a17:906:1692:b0:6e8:d245:44a9 with SMTP id
 s18-20020a170906169200b006e8d24544a9mr2933455ejd.639.1649952418435; Thu, 14
 Apr 2022 09:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <CGME20220414063849eucas1p126e41b53ff0d342f5c48408994b704e9@eucas1p1.samsung.com>
 <20220401103604.8705-12-andriy.shevchenko@linux.intel.com>
 <3a24ef01-3231-1bee-7429-dce5680c5682@samsung.com>
 <CAHp75VfMPpfeMpawRyLo_GtLR8+gVGgm8zW-fatp6=9a9wK18A@mail.gmail.com>
 <CAFBinCCCtZvdp+01DdEE=-f7rZ8V46O125wKDqE1muA645sdUg@mail.gmail.com>
In-Reply-To: <CAFBinCCCtZvdp+01DdEE=-f7rZ8V46O125wKDqE1muA645sdUg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Apr 2022 19:06:21 +0300
Message-ID: <CAHp75VcYaGmEruEsi2UUrLU4=k3OpBn2YV8B0LhyrhtQ=uCTXg@mail.gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>, Marc Zyngier <maz@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Nancy Yuen <yuenn@google.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Alim Akhtar <alim.akhtar@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [Linux-stm32] [PATCH v4 11/13] pinctrl: meson: Replace custom
 code by gpiochip_node_count() call
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

On Thu, Apr 14, 2022 at 6:32 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
> On Thu, Apr 14, 2022 at 3:51 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> [...]
> > > This patch landed in linux next-20220413 as commit 88834c75cae5
> > > ("pinctrl: meson: Replace custom code by gpiochip_node_count() call").
> > > Unfortunately it breaks booting of all my Amlogic-based test boards
> > > (Odroid C4, N2, Khadas VIM3, VIM3l). MMC driver is no longer probed and
> > > boards are unable to mount rootfs. Reverting this patch on top of
> > > linux-next fixes the issue.
> >
> > Thank you for letting me know, I'll withdraw it and investigate.
> If needed I can investigate further later today/tomorrow. I think the
> problem is that our node name doesn't follow the .dts recommendation.
>
> For GXL (arch/arm64/boot/dts/amlogic/meson-gxl.dtsi) the GPIO
> controller nodes are for example:
>   gpio: bank@4b0 {
>       ...
>   }
> and
>   gpio_ao: bank@14 {
>       ...
>   }
>
> See also:
> $ git grep -C6 gpio-controller arch/arm64/boot/dts/amlogic/*.dtsi
>
> Marek did not state which error he's getting but I suspect it fails
> with "no gpio node found".

Would be interesting to know that, yeah.

The subtle difference between the patched and unpatched version is
that the former uses only available nodes, it means that node is not
available by some reason and then the error would be the one you
guessed.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
