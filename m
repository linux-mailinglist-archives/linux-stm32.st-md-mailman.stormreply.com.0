Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B3010B7E4
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Nov 2019 21:38:02 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D12A8C36B0B;
	Wed, 27 Nov 2019 20:38:01 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D192AC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 20:38:00 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id z25so20296171oti.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Nov 2019 12:38:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=14vyCpwlco5dNMekZ671HzsQ/qD/jZMl32Sz5ULoC/U=;
 b=Cm4hMmDp0N9hKiKHmBxsQoECXJNdVYRnX2XUBPIxZG5xyrTWZ0EOBhyE93n9zmmCmT
 e7SNqP8+ml5XH34cgmUwMtdxqgC335OVaMCxNT8d253p1toFoHVxe+ctrxxvl2yDr0WV
 F1+ENB+9PJRj7OZCO5Far2zkVlXrJuFIhs2scAve47jAZk/EGT9RlYux+rgNNa+NFXXZ
 ITNEeJdmZbcQo9xYZImAcRa2DutB2o4To6DkxzYB0a0vgtKWPEZGtqsUirfCZkIMuJCN
 7lXkjkZNiIJ+KIzToSy7XIvJ9go18Zpg5HxLXer98wILxGYsxjSukLLNF71Cp6oRc3aG
 Ielw==
X-Gm-Message-State: APjAAAVEjV1pSZdWT5ccb35Xv9mAw+zjMYRExRRIvvb8hGsQgy5qv6dr
 VctRt7p/XduR2114E43GcI41p4znL83iO9TXtho=
X-Google-Smtp-Source: APXvYqyekyFnyyTzxDAaVF4lh76x3pVg0AJcETDtG/R5UDB8kyib7ugeAakdgVvr7ZJMAAkTJwIUv0P5kqimosEUmPw=
X-Received: by 2002:a9d:2073:: with SMTP id n106mr5117337ota.145.1574887078997; 
 Wed, 27 Nov 2019 12:37:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1574871463.git.nishadkamdar@gmail.com>
 <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
In-Reply-To: <5a7ed2e4b58ba7ff2f0638a2435a3a1e1c62c9f6.1574871463.git.nishadkamdar@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Nov 2019 21:37:47 +0100
Message-ID: <CAMuHMdUqfRioTBV27AKx9zv9YuSqEod6x+A4aguf=h20TDXr6w@mail.gmail.com>
To: Nishad Kamdar <nishadkamdar@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>,
 Sean Wang <sean.wang@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Joe Perches <joe@perches.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 4/5] pinctrl: sh-pfc: Use the correct
 style for SPDX License Identifier
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

Hi Nishad,

On Wed, Nov 27, 2019 at 5:46 PM Nishad Kamdar <nishadkamdar@gmail.com> wrote:
> This patch corrects the SPDX License Identifier style in
> header files related to Reneses Soc pinctrl driver.
> It assigns explicit block comment for the SPDX License Identifier.

Is it incorrect to not have an explicit block comment?
Other recommendations have been to integrate the SPDX comment line
into an existing comment header, if it exists....

> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46.
>
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>
> ---
>  drivers/pinctrl/sh-pfc/core.h   | 4 ++--
>  drivers/pinctrl/sh-pfc/sh_pfc.h | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/core.h b/drivers/pinctrl/sh-pfc/core.h
> index b5b1d163e98a..5ad0ab8f9e14 100644
> --- a/drivers/pinctrl/sh-pfc/core.h
> +++ b/drivers/pinctrl/sh-pfc/core.h
> @@ -1,5 +1,5 @@
> -/* SPDX-License-Identifier: GPL-2.0
> - *
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
>   * SuperH Pin Function Controller support.
>   *
>   * Copyright (C) 2012  Renesas Solutions Corp.
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
> index 640d2a4cb838..fff9cbb7a0f8 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -1,5 +1,5 @@
> -/* SPDX-License-Identifier: GPL-2.0
> - *
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
>   * SuperH Pin Function Controller Support
>   *
>   * Copyright (c) 2008 Magnus Damm

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
