Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 46569500FC5
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Apr 2022 15:51:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B904AC60495;
	Thu, 14 Apr 2022 13:51:57 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6D9CC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 13:51:55 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id t11so10130655eju.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Apr 2022 06:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VkVkOAS9A0MIQPbsfpNua8Mc2ZR7CENLAnkVniIdPoc=;
 b=CXFcqAASxG+Z7VaPl8afDddAJZU3KVfQsH4a1JGZ1EjQwUWtZOh58dCXqu1CRt0nRH
 GbroBEhSONj1yEyS1nlMjO2dTZs5iIHj3amuNDroTKV8vuWjGlUxmp6N8l0rJzVuL9iS
 SK1pfqweFFp8qNmsy1ouvojo1qwb0OkgYbmw5cI1wWa07tZDoFoyAqHiu63K1oCpvGXv
 JCFOxbvoB1FH365GTO/MeElQ0rQQ182PE1dbIz0Nw0J7NGFvquCeeFsdv6sqLOE6QIn0
 C7C+hEmjvWZeIfvuZm9FyH27VeOaKjraYed4fP9gI2wtI0kf1Yw8FEPqUkn+IykqKHnl
 lMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VkVkOAS9A0MIQPbsfpNua8Mc2ZR7CENLAnkVniIdPoc=;
 b=62tXKmvWU7QmaGirHyGKB1l8I0VO1zPbZxtH9HX2o53TRfcSoM3c+rnYD3iyUGFpw0
 kKDMrZd6mV9mqmOkgVmNKdO0QbZpAxAlZQoXnEOC03BhnkWYnVtmQ3wc9uAHatfhZQXW
 icYk2bMR8xJ0hJFMzCGbT31+/NP/kvoF3q4Ah0SmgR92nOUxU6dyXR/uERRk0vlRHim6
 7NcBD5yAZm7t4XC1Wi5Gg7WX2c02kCGzWKvMwe7siy4j+v4W4pSm4qZiRHOpF0ej+4G2
 C3PoPWXsHvgn+TRpAU66NK1m7hZA51SdTlP8vUII5GG9yMc+RyvIo1NAPHorsD29JwbK
 Ja7Q==
X-Gm-Message-State: AOAM530d/Wfd8FhVYh1R38LSds2ZEE95Z974NDnz+C+vxXqiLhPhw2Rj
 fdknjlh0OPTOR7WfUPFWsIYGQdao2hHmzF0k+nA=
X-Google-Smtp-Source: ABdhPJxL5jFoyaZVlB5dK/sqGFzMiTnpEAX7i3HpaSvcMs3Sr81F+WGQbyWSGSsYbk2dWKrwQ76KhtaYazmSqwcH7pQ=
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id
 nd14-20020a170907628e00b006d9c6fa6168mr2412944ejc.132.1649944315429; Thu, 14
 Apr 2022 06:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220401103604.8705-1-andriy.shevchenko@linux.intel.com>
 <CGME20220414063849eucas1p126e41b53ff0d342f5c48408994b704e9@eucas1p1.samsung.com>
 <20220401103604.8705-12-andriy.shevchenko@linux.intel.com>
 <3a24ef01-3231-1bee-7429-dce5680c5682@samsung.com>
In-Reply-To: <3a24ef01-3231-1bee-7429-dce5680c5682@samsung.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 14 Apr 2022 16:51:19 +0300
Message-ID: <CAHp75VfMPpfeMpawRyLo_GtLR8+gVGgm8zW-fatp6=9a9wK18A@mail.gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
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
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Qianggui Song <qianggui.song@amlogic.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
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

On Thu, Apr 14, 2022 at 12:44 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> On 01.04.2022 12:36, Andy Shevchenko wrote:
> > Since we have generic function to count GPIO controller nodes
> > under a given device, there is no need to open code it. Replace
> > custom code by gpiochip_node_count() call.

...

> This patch landed in linux next-20220413 as commit 88834c75cae5
> ("pinctrl: meson: Replace custom code by gpiochip_node_count() call").
> Unfortunately it breaks booting of all my Amlogic-based test boards
> (Odroid C4, N2, Khadas VIM3, VIM3l). MMC driver is no longer probed and
> boards are unable to mount rootfs. Reverting this patch on top of
> linux-next fixes the issue.

Thank you for letting me know, I'll withdraw it and investigate.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
