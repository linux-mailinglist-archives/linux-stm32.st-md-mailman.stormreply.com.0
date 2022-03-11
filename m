Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5674D64D7
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Mar 2022 16:45:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 70604C628A8;
	Fri, 11 Mar 2022 15:45:59 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1CF0AC628A4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Mar 2022 15:45:58 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id l12so12500126ljh.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Mar 2022 07:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=10XF3Sb+t0GCaPOcQ9XoyXqUIC9CjyYdWscRYcObAxw=;
 b=MqSyuOe34h+f5EWwR/oM3slrJ38qINF04yiqUGK9i44Eg7rBVyesJHW1EnFC5kq8Fz
 lk+2YfR6+b43HpQckMotOid77fcXOQCYnCzxj1VBwif0v7RCPtuA/XLZTOUL3TGLQ5aP
 rQQEfHcA3U6Ckvf/b/iG+3oXnpYqaTOumz8wAkXkJ28WbzSqpcBZIFq8ncUer5twWgks
 FOJuSVG0lF2of7EiLc6kYvyyb0pg3ayR7my6BVOGNSBBms3Z+ikWZdLDJdqgvWdJqhJe
 L4QlwgEkOq4Qz46/Q/RRjPefsiQTSwFPLy5q6vZRgKOnqEz3+Npwf2GWlZojgDZgRcgm
 baow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=10XF3Sb+t0GCaPOcQ9XoyXqUIC9CjyYdWscRYcObAxw=;
 b=PJDNgAkgWsvyWoY+1HOSkt56G4jqsdK+CB5VzNHGlrbtAHCcyKmpZlWUQYA/9yps5V
 QyARRkVGWQc6Gg/uvSl+khxbAvaFOW4Y+A/dzL2Op1wLVZtJuIt563512FEpIrp0IU7i
 k8D1dYebdJMm8SkTeMjxu8z8JyVvXVnheyGgdgcQSReiAL/ii4fuzDmUcCOXUwftMTj8
 ydDoNlTiFqkOT+fwgxxE9OLoQrm4wr7Yp/mdd9MkmIoBmyX3zT02Jddz6EgJnuY5CEdB
 jr31OOkkiZEGUs7AHyDJhTQ6GmoQxQ5VvaXhQoJkdnRXVUoyo2q0Oevt3odEmMGz/XrQ
 LLlg==
X-Gm-Message-State: AOAM531NMf48Vkq+LtqfXZq4Jsaefl7DjPNfIcj13IclV5gqvSBYWwI4
 NJ6gQa2kcxurB/+WWHuM2tkFgPIce6zV7mi/AM2KTA==
X-Google-Smtp-Source: ABdhPJyKLXL/cjixS70H+wB5WRjtfcEBo2CKEa89VicVYZWBqrQ7uCDzqe5Ilvrer3zvBAGc4wkBHELro4zTjGulY/w=
X-Received: by 2002:a2e:8603:0:b0:246:24c:b79c with SMTP id
 a3-20020a2e8603000000b00246024cb79cmr6543962lji.367.1647013557376; Fri, 11
 Mar 2022 07:45:57 -0800 (PST)
MIME-Version: 1.0
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
 <CAPDyKFq_TsBLjW2WxC-Fvu6qDs9MJ1=QPo9gOLRykJ5p2pJbGw@mail.gmail.com>
 <b465353f-9291-f159-ba0b-4cd9577fc676@foss.st.com>
In-Reply-To: <b465353f-9291-f159-ba0b-4cd9577fc676@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 11 Mar 2022 16:45:21 +0100
Message-ID: <CAPDyKFqu_Y2ixbw380t5qA_rXTPLMWasqpBmaMqP0nHUOqzQhw@mail.gmail.com>
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

On Thu, 10 Mar 2022 at 17:00, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> On 3/8/22 11:57, Ulf Hansson wrote:
> > Hi Yann,
> >
> > On Fri, 4 Mar 2022 at 14:52, Yann Gautier <yann.gautier@foss.st.com> wrote:
> >>
> >> On STMicroelectronics variant of PL18x, the DMA Linked Lists are supported
> >> starting from revision v2 of the peripheral. But it has limitations,
> >> as all the buffers should be aligned on block size (except the last one).
> >> But this cannot be guaranteed with SDIO. We should then have a property
> >> to disable the support of LLI.
> >
> > Indeed, the buffer handling with SDIO is somewhat special, which also
> > has been discussed several times on LKML before. In principle, we need
> > the SDIO func drivers to respect buffer limitations that should be
> > specified by the mmc host drivers. Quite similar to what we already
> > have for block devices, like ->max_seg_size, ->max_seg, etc, that is
> > set per mmc host.
> >
> > I realize that implementing something like the above requires bigger
> > changes, which is why mmc host drivers instead validates the sglists
> > and the elements. In some cases that means returning an error code and
> > in others it could mean falling back to a non-DMA based I/O mode.
> >
> > For the stm32_sdmmc variant, it looks like the sglist validation is
> > being managed in sdmmc_idma_validate_data() already. Can it be
> > extended to cover this case too, rather than using a DT property?
> >
> > Kind regards
> > Uffe
>
> Hi Ulf,
>
> OK, I'll check what can be done for this. Patches 1 and 2 can be
> dropped, they will be reworked.

Okay.

> But patch 3 of this series could be taken, as not linked to LLI
> management. Should I push it again alone, or could you review it directly?

I have some comments/questions on it, but perhaps it makes it easier
for people to follow the discussion if it is done separately. So
please push it alone, then I will review it.

[...]

Kind regards
Uffe
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
