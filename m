Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4329501498
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Apr 2022 17:32:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 68944C628A0;
	Thu, 14 Apr 2022 15:32:26 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7DF3C6049C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 15:32:25 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id bh17so10760748ejb.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 08:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zNo0g28tlK9vSNHNGKqqjmBjPaYSOEtIiawAODAYH3c=;
 b=cW++jIHdTWB0e/u7vyX0744QVnVIpLHeGh5WEu4BOxVM9uRZh7gq6XNbmyhxdiX0XR
 DnNObAKYV/atK29rtd9VDxytlGyydSI3GK7gv8UXn2s61BkOk7SirtAUukWezAkshDlq
 S/vxhU3aqvdD4Zqx1321bK8UkTZ5MlXIcTcawWigG3NoYBFnJf5STvdVx3TUpJBfsLar
 EQAclsSro41RYhUaHhwMeeWqdSJWbXVcjR24H6KwhSZsIWtZvTUOcbxQYsJQYQDPhirF
 VFdLgQ3N+EYyMsyuH2QM2c0kXC8IiDC08CHcYMnXhx4rxUrl3t3+RKGADf5TY3AHrxf3
 qKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zNo0g28tlK9vSNHNGKqqjmBjPaYSOEtIiawAODAYH3c=;
 b=Zd/9qi5cAOGu27eN8p9Cx63COvAS9VlRKWGOaKYv8iLhoqhPyZ79sKjvqCELNm3qP7
 iRfnDcKR5JNTN4U00gL6AQ8Qqy6J+druicqYN5qrXEq2wxngGaDz9I0kFCjwo25bDlcs
 OxankRQL+Gw3SLdH7quiGzYMe1kwnV0WA9lx7e4xn4h5AjyJ4n4VwftMZos8pLmCs9e+
 LoEVxOqlQqQdDx8cXmwKG4y6zyDHkYAYStwyE7G0OBI7dU9QFr5gHytugmDzwJJQC0+g
 zds5PoKs6CtcjLxzynfun4//PxNB14sr1mLTarEJ1Ngq03RG/p4WUHV8QSg+j63UlTLW
 8FVw==
X-Gm-Message-State: AOAM532yGiOsiE9ZZhU+7qHuhvVWP+gyRn8vVgzKq0l786BS5i9P3YEm
 XHLpGAfZYcHyVoe32K0TEhel2a5luUX/e+D+JXA=
X-Google-Smtp-Source: ABdhPJzbycImSsBidIp4JSSW5b5SF1qL/I1dfcfErig8MjQOErRGdzGC2WsE7sy1HibLlRHnfGkpr6ZwwcMbQbIMAXs=
X-Received: by 2002:a17:907:3f03:b0:6df:b04b:8712 with SMTP id
 hq3-20020a1709073f0300b006dfb04b8712mr2856347ejc.290.1649950345064; Thu, 14
 Apr 2022 08:32:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <CGME20220414063849eucas1p126e41b53ff0d342f5c48408994b704e9@eucas1p1.samsung.com>
 <20220401103604.8705-12-andriy.shevchenko@linux.intel.com>
 <3a24ef01-3231-1bee-7429-dce5680c5682@samsung.com>
 <CAHp75VfMPpfeMpawRyLo_GtLR8+gVGgm8zW-fatp6=9a9wK18A@mail.gmail.com>
In-Reply-To: <CAHp75VfMPpfeMpawRyLo_GtLR8+gVGgm8zW-fatp6=9a9wK18A@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 14 Apr 2022 17:32:14 +0200
Message-ID: <CAFBinCCCtZvdp+01DdEE=-f7rZ8V46O125wKDqE1muA645sdUg@mail.gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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

Hi Andy,

On Thu, Apr 14, 2022 at 3:51 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
[...]
> > This patch landed in linux next-20220413 as commit 88834c75cae5
> > ("pinctrl: meson: Replace custom code by gpiochip_node_count() call").
> > Unfortunately it breaks booting of all my Amlogic-based test boards
> > (Odroid C4, N2, Khadas VIM3, VIM3l). MMC driver is no longer probed and
> > boards are unable to mount rootfs. Reverting this patch on top of
> > linux-next fixes the issue.
>
> Thank you for letting me know, I'll withdraw it and investigate.
If needed I can investigate further later today/tomorrow. I think the
problem is that our node name doesn't follow the .dts recommendation.

For GXL (arch/arm64/boot/dts/amlogic/meson-gxl.dtsi) the GPIO
controller nodes are for example:
  gpio: bank@4b0 {
      ...
  }
and
  gpio_ao: bank@14 {
      ...
  }

See also:
$ git grep -C6 gpio-controller arch/arm64/boot/dts/amlogic/*.dtsi

Marek did not state which error he's getting but I suspect it fails
with "no gpio node found".


Best regards,
Martin
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
