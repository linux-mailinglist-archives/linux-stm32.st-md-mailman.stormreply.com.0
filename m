Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B264DC3F2
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Mar 2022 11:28:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDC0DC60467;
	Thu, 17 Mar 2022 10:28:56 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5523C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Mar 2022 10:28:54 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id bt26so8238291lfb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Mar 2022 03:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=evVQCysX6Rx7a3D/7RcWBO7GE40bsv+u7P/uPmKpk7M=;
 b=yKC/4m1t5uLvBlxgP+/XKZr+12jY9AhZH/djhFxd3lkoc97/kNbZTWObla3KwnoYx3
 dIZdi8z4NJ+Rf6jO3NiyaYvTGBZP3cFr2WuOVqbhi+PvwOttk8Ulx5uaxbum1aiqX8zf
 14jYMo1VA+grUCtwiN+UcvP0vgUaCdgZixnkAhpIpV2ryO+w+acFBdJm/eb0BnjcbYTN
 EA9Fe/nevFd6S7NoJ2W17oaJB2EnuNHAUdhO/kNpQ6Lfu1wfA5LQ2ugJuHuJrrz7VxNX
 BjTkgvJsRP3Nzu+YuH2rsYMcSkOasI+Zxy/7GZ0NnbhFX/K/rDxUOq/5Y9ZxtB/fReNu
 +L9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=evVQCysX6Rx7a3D/7RcWBO7GE40bsv+u7P/uPmKpk7M=;
 b=N3QT/ehRihEePD/ahitb2iQT52zL/WtMbn0j81wmDhU7HZ+xargpM3l/04Oy/BghLd
 hNcqqmuZaud2ox7rvFqh7sSZKCAVJNC6L9MRX3Lr5iJGv3Z0YGRsthPUKmE3caPoRWR4
 YQGjhdanWUOYnhv4G3kUBGc81gG0aRPLZa7T9ZLAme9QBU6Cj53IRaWw50wREnbwGfRd
 EIAKsE2zsxwXYD6gRuh/EdVR0Ikp6WMrFCPzsDSonToltCslUPDa405Qlob3X+cGOSLF
 0eiRJQtais+H2GPTS8yjG+wVLG28UKh2SCnIwPrQJh6iEJeyf7cLEkYp25Tln6lx1CXi
 /zNA==
X-Gm-Message-State: AOAM533Z0qf8gZ4QfH+23QRBlFSq0hPM7RxNI6AyHu3TonKf1dxEO0hq
 ll17bAfRQyYHlnmHNmIBnJGiM72F9lK3R14an+qlAw==
X-Google-Smtp-Source: ABdhPJxOxpMGtMW4kX0cLix6E7EHQ8pGbUJbmoU5EspHj5uKWZwuPoe9PovuhtKY9BYniV4wXPDSe7/ByKWjTJQYCmw=
X-Received: by 2002:ac2:4e98:0:b0:448:3039:d170 with SMTP id
 o24-20020ac24e98000000b004483039d170mr2632125lfr.233.1647512934185; Thu, 17
 Mar 2022 03:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
 <CACRpkdYQz+-im3n-r0_8RKL7so2bHS=aZobty4BbzixmPzms-Q@mail.gmail.com>
 <0bc53018-fce4-4104-fa47-6e60d2367d69@foss.st.com>
 <CAPDyKFqgQZFH3LT1Z+G9N0MVfhFwoiUr9N2sKFaejTWcH+dNXg@mail.gmail.com>
 <6bfade04-36b4-98c3-2796-ebeaa230f52e@foss.st.com>
In-Reply-To: <6bfade04-36b4-98c3-2796-ebeaa230f52e@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 17 Mar 2022 11:28:18 +0100
Message-ID: <CAPDyKFpE7yUvfyGSBpaZf2Vy3VbNm6PEzFcnYAupc0wg+49_zA@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, devicetree@vger.kernel.org,
 Marek Vasut <marex@denx.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Grzegorz Szymaszek <gszymaszek@short.pl>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 kernel@dh-electronics.com, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] dt-bindings: mmc: mmci: add a
	property to disable DMA LLI
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

On Thu, 17 Mar 2022 at 11:18, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> On 3/17/22 11:00, Ulf Hansson wrote:
> > On Tue, 15 Mar 2022 at 09:26, Yann Gautier <yann.gautier@foss.st.com> wrote:
> >>
> >> On 3/14/22 23:43, Linus Walleij wrote:
> >>> "On Fri, Mar 4, 2022 at 2:52 PM Yann Gautier <yann.gautier@foss.st.com> wrote:
> >>>
> >>>> On STMicroelectronics variant of PL18x, the DMA Linked Lists are supported
> >>>> starting from revision v2 of the peripheral. But it has limitations,
> >>>> as all the buffers should be aligned on block size (except the last one).
> >>>> But this cannot be guaranteed with SDIO. We should then have a property
> >>>> to disable the support of LLI.
> >>>>
> >>>> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> >>>
> >>> Actually I think this is present also on the ux500 variants. See:
> >>> commit 2253ed4b36dc876d1598c4dab5587e537ec68c34
> >>> "mmc: mmci: Support any block sizes for ux500v2 and qcom variant"
> >>>
> >>> Spot the variant data "dma_power_of_2".
> >>>
> >>> So whatever property you add
> >>> to the variant data (not in the device tree please) should
> >>> be added to the ux500 variants as well, it will *VERY* likely
> >>> have a problem with LLI elements not being a power of 2
> >>> as it is the ancestor of later STMicro variants.
> >>>
> >>> It might actually be the reason for some annoying WiFi error
> >>> messages I have seen :/
> >>>
> >>> Yours,
> >>> Linus Walleij
> >>
> >> Hi Linus,
> >>
> >> The STM32 variant uses an internal DMA, and the DMA functions are in its
> >> dedicated file. So I was planning to do the same as what is done in
> >> meson-gx-mmc.c: using a bounce buffer to copy from/to in case DMA
> >> constraints are not fulfilled. Not sure it can help for Ux500.
> >
>
> Hi Ulf,
>
> > We already have a bounce buffer in mmci_pio_read(), but we need one in
> > mmc_pio_write() too, which hasn't been implemented yet.
>
> The idea is to keep using our internal DMA, and not switch to pio mode.

Okay, but doesn't that become awfully inefficient, especially if we
end up with several smaller sg-list-elements.

The switch to pio would only be temporary for the particular request
that has "bogus" buffers.

>
> >
> >>
> >> Ulf, before I send my new series (although it is not ready yet), would
> >> you be OK with the bounce buffer idea?
> >
> > Yes, that works for me.
> I have patches almost ready, I'll send that soon.

Okay!

>
> >
> > On the other hand, it would be even better if we could specify the
> > buffer limitations per mmc host instance, so upper layers (SDIO func
> > drivers) could conform to these - and use better buffers, to achieve a
> > better performance.
>
> We've seen things that could be improved in the wifi driver. I'll check
> what could be done.

Great!

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
