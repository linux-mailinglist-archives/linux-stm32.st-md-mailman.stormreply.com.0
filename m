Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 734651E3F5A
	for <lists+linux-stm32@lfdr.de>; Wed, 27 May 2020 12:46:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0F723C36B21;
	Wed, 27 May 2020 10:46:33 +0000 (UTC)
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43829C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 10:46:31 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id a14so23505983ilk.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 May 2020 03:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jV5qqlg6B+ZoGgVeaw+flUZDliIqHLZTV9SrChni80o=;
 b=mlA8n5ltaxaXU5Jzq9gQDdiAdLm7WHNtzEPDDmBFHHI5aY7Pd0ha50AJnDMF9b5/Xm
 Z2ZZRZAcqCMtYbCKXy3nceVZD3RnzhXQfF+FLoOHKH8bFRYpXfHoR4oHaf9m4htN+X4B
 kHOeUbi0Es6U1y5RBtZATXe0Vo/gA2fGm6nOOsrDYa+k5mwPj63ViOoY1u9rdK/cGq+8
 TNYJXlgXwwoTT32s8D0Fll3n5Ele44yw479wCHp13y6U/wV9kEPFVAgD6FH+dQ8sbV4q
 7hsp0Qisu5/+NRQsczixdYHaJcgLXXiFIaskLiZHmpQiPYObZI0OhYc25SDBa5uqdRto
 J8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jV5qqlg6B+ZoGgVeaw+flUZDliIqHLZTV9SrChni80o=;
 b=g6fAyOiqePs1Qes6R41xIHGXTmiHQMvqmBEZEDWpzUzQ31ErVgapaB5kdSEKThSBEY
 nFA0SDM6AcT3C7iT7Gx/V7NzhM9iYSz1qVVdv+cENQPr6KQe/v02TCSymf6E9LXl0yN7
 rEgYkc7gj5KtUo7pnxaLuCPYfD9ixBBNZm8ENSQn83F6kqbPXDpbOMgDt2VytPrSLNpm
 CT1Psmy5BwN+UtZs3gyAg+DLffx9iINDwfLMSxoaeQVTN77DXFSK4pIldQFSnO3KvmRW
 86R74UlH5DyNBGcPPJH+4zSU95J5lNtN51cuY9eWHHRjJCN/jgvV1Ez1ldA6u0oSQ7FA
 lCTA==
X-Gm-Message-State: AOAM533dPhrM1VyGjRP/RMDaU0K1qygg5F8ksxW7ipfGUwZJtxLLiYxA
 PWYKFV9231cT0gN3NaHJmBr+b36nYRwuavlgqDE=
X-Google-Smtp-Source: ABdhPJxI8DmrhVOnjKvhDVgxWJ8+FIMyXLu/ryLZET7ClD2+54nQb9OTeBYG7x2X1lNxLOkc/LfdMlqtuwE8cn4F3ds=
X-Received: by 2002:a92:dc85:: with SMTP id c5mr4964053iln.270.1590576390035; 
 Wed, 27 May 2020 03:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-9-git-send-email-dillon.minfei@gmail.com>
 <20200527095109.GA5308@sirena.org.uk>
In-Reply-To: <20200527095109.GA5308@sirena.org.uk>
From: dillon min <dillon.minfei@gmail.com>
Date: Wed, 27 May 2020 18:45:53 +0800
Message-ID: <CAL9mu0JA=XRTj_HONQGtj74X05TAV0__dW2At0AAeymwNvJhEw@mail.gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Hua Dillon <dillonhua@gmail.com>, p.zabel@pengutronix.de,
 linux-clk <linux-clk@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v6 8/9] spi: stm32: Add 'SPI_SIMPLEX_RX',
 'SPI_3WIRE_RX' support for stm32f4
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

On Wed, May 27, 2020 at 5:51 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, May 27, 2020 at 03:27:32PM +0800, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > in l3gd20 driver startup, there is a setup failed error return from
> > stm32 spi driver
>
> Please do not submit new versions of already applied patches, please
> submit incremental updates to the existing code.  Modifying existing
> commits creates problems for other users building on top of those
> commits so it's best practice to only change pubished git commits if
> absolutely essential.

Hi Mark,

sorry, forget to remove these two patch from this submits, will not
include it in later submits
which ack other's review result.

thanks.

best regards

Dillon,
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
