Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DAC4DC379
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Mar 2022 11:00:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0E5C5C60467;
	Thu, 17 Mar 2022 10:00:50 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43B50C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Mar 2022 10:00:48 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id bx44so5913ljb.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Mar 2022 03:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QhShUoe84DPn/qSDuJss4yxswaSum21NgfxRVJizeNM=;
 b=JaGzOhhUBuH/BXOUzMz78R/tXpFW9PtxKjjthc7yAtoRV6cTPvWodM23mwl4m2cLfp
 H1RGlDUWy2wa6JsIy60+qH5vCdemKBd2v0gUqAOPGoUbBDFr2pSFr3wgSR0o6N7mRYzO
 wqRnXRK0iyG7WAANNYpOotSjtLLrnpazC+7XUP4/c+n+VArSv8HHCpDqk/CdTCIdtvlc
 Whhnb9w3pm0GpqFL4VQLkt++CeRY50VzPSRwyn6+NfTW5Q3/YwGhr2VhWXGPecyL+sAY
 hQ3BkMs88cXhYCv3eLILGmoc5xS9UP96DNEiRvnSgeBYP3ot7ItwtkAcBoYP5gTjlXVE
 csCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QhShUoe84DPn/qSDuJss4yxswaSum21NgfxRVJizeNM=;
 b=Hja3L39ClAbpuTvlGqh9sKGOa28D3YErCseXT+Jo1CEcSBvk7jYShgsHJEIPtrSpQ1
 w+Ve4YVIaSV2pGkktv/iUni9lnFSljN28kdebkPB3Ixr64h1OQMHfkPcag3ci1ZsiFpS
 jnEXRal5vJYeAYF0SQ8Qr0c/W9OhBleNBUPcV7zM5px6tJxItK8xBAzZxMj0CozrNwe9
 pv1LTP3Mc0ImsvBSOdkiKvUDw4bc7jSR1URrUbUQgVInXC1qDuR5sg5d5YJmWG4txWVb
 JfmujtKj+k1iWgKPNpH+bGBgdVFEvLfK2mc4u6Pe7uT77Fy+hkEmig20MgV/iwLwggZV
 yGLg==
X-Gm-Message-State: AOAM530PA4oS7TwAUCnZuWuKhu3Z4KJvI6OIz2aG/DlXeVEcm273WlzG
 ltwUbya++w8pXSn+cMTbZdyHGoNnHwuyREi5pKeVeg==
X-Google-Smtp-Source: ABdhPJzGP/6VJ+sfVftD7foeJ61GzofJGTWadnmk9/XhbBJ6gkiCtzjkDLFBkPAu3NbN9QU6HJH517gTjYEZt7di0FI=
X-Received: by 2002:a2e:5009:0:b0:247:d738:3e90 with SMTP id
 e9-20020a2e5009000000b00247d7383e90mr2393121ljb.229.1647511247546; Thu, 17
 Mar 2022 03:00:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
 <CACRpkdYQz+-im3n-r0_8RKL7so2bHS=aZobty4BbzixmPzms-Q@mail.gmail.com>
 <0bc53018-fce4-4104-fa47-6e60d2367d69@foss.st.com>
In-Reply-To: <0bc53018-fce4-4104-fa47-6e60d2367d69@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 17 Mar 2022 11:00:10 +0100
Message-ID: <CAPDyKFqgQZFH3LT1Z+G9N0MVfhFwoiUr9N2sKFaejTWcH+dNXg@mail.gmail.com>
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

On Tue, 15 Mar 2022 at 09:26, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> On 3/14/22 23:43, Linus Walleij wrote:
> > "On Fri, Mar 4, 2022 at 2:52 PM Yann Gautier <yann.gautier@foss.st.com> wrote:
> >
> >> On STMicroelectronics variant of PL18x, the DMA Linked Lists are supported
> >> starting from revision v2 of the peripheral. But it has limitations,
> >> as all the buffers should be aligned on block size (except the last one).
> >> But this cannot be guaranteed with SDIO. We should then have a property
> >> to disable the support of LLI.
> >>
> >> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> >
> > Actually I think this is present also on the ux500 variants. See:
> > commit 2253ed4b36dc876d1598c4dab5587e537ec68c34
> > "mmc: mmci: Support any block sizes for ux500v2 and qcom variant"
> >
> > Spot the variant data "dma_power_of_2".
> >
> > So whatever property you add
> > to the variant data (not in the device tree please) should
> > be added to the ux500 variants as well, it will *VERY* likely
> > have a problem with LLI elements not being a power of 2
> > as it is the ancestor of later STMicro variants.
> >
> > It might actually be the reason for some annoying WiFi error
> > messages I have seen :/
> >
> > Yours,
> > Linus Walleij
>
> Hi Linus,
>
> The STM32 variant uses an internal DMA, and the DMA functions are in its
> dedicated file. So I was planning to do the same as what is done in
> meson-gx-mmc.c: using a bounce buffer to copy from/to in case DMA
> constraints are not fulfilled. Not sure it can help for Ux500.

We already have a bounce buffer in mmci_pio_read(), but we need one in
mmc_pio_write() too, which hasn't been implemented yet.

>
> Ulf, before I send my new series (although it is not ready yet), would
> you be OK with the bounce buffer idea?

Yes, that works for me.

On the other hand, it would be even better if we could specify the
buffer limitations per mmc host instance, so upper layers (SDIO func
drivers) could conform to these - and use better buffers, to achieve a
better performance.

>
>
> Best regards,
> Yann

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
