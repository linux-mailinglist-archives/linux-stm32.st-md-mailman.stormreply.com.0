Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0481C57E81
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:49 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDF33C57B67
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:48 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4718EC9A3FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2019 07:08:07 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id i21so541717ljj.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Jun 2019 00:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WQJinh/xC2bOeYFsYlUlkNYdlsn0JSMzJ6+7ugAlLz8=;
 b=Bnh/8fyB55glW2C/tqhjzZ/g0n75O49PaOtWeXvInWWiyEvED44PTUrKlfNLSqNMi0
 oar3zVdm8wF0GmxM6z9ThNK13dTnaGyjeeQnGIcpePLycOK/rtCwMvZKkn+KCXGHCBld
 XnSkcw5FcJqLVK1kRKFeBieM5F9sQVTIqjqwXebiwvNn/QwcfjZRS6i39THbRKajB5ys
 vv3ICMAsQVzoNOPd4ZzjPsZ31L2WBO0b0nSVGGC/RexBsMSjBhic6uCBrt/siVl3Fm49
 gWLsqh37eLLfP+AAQH+Dyrq9z+83xQN6+MAEbbyVklPKBNxGCubQWSHRtFgWjf+vSU+J
 5SFQ==
X-Gm-Message-State: APjAAAXInlb1htiG47LRciRIm8GQNfqMmxwRj0R0cyGkqzox4Wsykf58
 lF+PK6OI5dkMU5keykjInRCOMtXAmDkuNJpk6hk=
X-Google-Smtp-Source: APXvYqypxYOxQMw1wVILyzLBXGz+DJuPq5TH5W+toycfqpB93xioye3d2NaNp9HP84cOJVmXrpIamDZiegLE7qs7sEM=
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr1410332ljg.65.1559545686497;
 Mon, 03 Jun 2019 00:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190601032242.10405-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190601032242.10405-1-yamada.masahiro@socionext.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Jun 2019 09:07:54 +0200
Message-ID: <CAMuHMdXXbEr=oU0amKLbEkTm3cZ=jyQuk1-aZa5L4JL_dUmYMw@mail.gmail.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: Kishon Vijay Abraham I <kishon@ti.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kees Cook <keescook@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Takashi Iwai <tiwai@suse.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Joe Perches <joe@perches.com>, linux-spdx@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] treewide: fix typos of
	SPDX-License-Identifier
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

Hi Yamada-san,

On Sat, Jun 1, 2019 at 5:24 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Prior to the adoption of SPDX, it was difficult for tools to determine
> the correct license due to incomplete or badly formatted license text.
> The SPDX solves this issue, assuming people can correctly spell
> "SPDX-License-Identifier" although this assumption is broken in some
> places.
>
> Since scripts/spdxcheck.py parses only lines that exactly matches to
> the correct tag, it cannot (should not) detect this kind of error.
>
> If the correct tag is missing, scripts/checkpatch.pl warns like this:
>
>  WARNING: Missing or malformed SPDX-License-Identifier tag in line *
>
> So, people should notice it before the patch submission, but in reality
> broken tags sometimes slip in. The checkpatch warning is not useful for
> checking the committed files globally since large number of files still
> have no SPDX tag.
>
> Also, I am not sure about the legal effect when the SPDX tag is broken.
>
> Anyway, these typos are absolutely worth fixing. It is pretty easy to
> find suspicious lines by grep.
>
>   $ git grep --not -e SPDX-License-Identifier --and -e SPDX- -- \
>     :^LICENSES :^scripts/spdxcheck.py :^*/license-rules.rst
>   arch/arm/kernel/bugs.c:// SPDX-Identifier: GPL-2.0
>   drivers/phy/st/phy-stm32-usbphyc.c:// SPDX-Licence-Identifier: GPL-2.0
>   drivers/pinctrl/sh-pfc/pfc-r8a77980.c:// SPDX-Lincense-Identifier: GPL 2.0
>   lib/test_stackinit.c:// SPDX-Licenses: GPLv2
>   sound/soc/codecs/max9759.c:// SPDX-Licence-Identifier: GPL-2.0
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks for your patch!

>  drivers/pinctrl/sh-pfc/pfc-r8a77980.c | 2 +-

For the sh-pfc change:
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
