Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B254D154A
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Mar 2022 11:58:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 75DD7C60469;
	Tue,  8 Mar 2022 10:58:24 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 833C8C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Mar 2022 10:58:23 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id bt26so11707639lfb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Mar 2022 02:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4MO/RRuWikHJmBYuiJ+R2IrUU7oSQM4tuZv70kuUbRI=;
 b=k3G503hqW26oHasEdtGWNmqrChEPSR064D0K46cqUj1wayPtOGD/xufqe5xAva/q2z
 Ffqx6+329fNYW9gSOuqz2AAXgGMHll/goOEg9fZEiNOXJXN8f8TRAfB8+UO0rvWEEp4U
 Rada8pn/BfE4qTuiNtbOiPIZ98UZ1PeaMGHmCpvaIGNVHsTrVX7eRs+r2Fdwhj1flLyK
 PCNHcxe7N27lE1Ji7giCwvePKEoMIlX4Opu0W6g/YgQw1tx/OpyFKDMvY0b0lAhyiXHp
 Qi2hTE7F3assUB0/w+hogn/mpzP4x+Wd4/vMzE+ib2IsK9gr64AAZp2LZS6s1kvowSL3
 22sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4MO/RRuWikHJmBYuiJ+R2IrUU7oSQM4tuZv70kuUbRI=;
 b=IvbYwiFCXr5/LyvvUZo4kC3f61FnONd8G2Uf9xBB1Gq9nIqbNMz35Bf7d53jbhem67
 tEGiwuHsV/FgQdYWWov9XuDltSTZXwKoSqi1PrS+D2eyR59AHjbsWU+5I3r2rEAkkDiK
 Fu8i2Zv9WPxHO9DAZ1Cf4lQFtYcbunMapbNmVn4VLAF6CTr0KwnVCzF8g5xIPAqTbSu8
 /iJiIkouy/qlGUQ8MoGl/N9Fb+doOwFDvTKvFR300nT69g0yZnEokB+WnhsclBxkR9jV
 +ia/mygFY8EheEeakn6pojfT5lQrY9b5oVhO+zoGoMXhnMNQ2tjIPqcUnKFiJ2xzS2hb
 zeXQ==
X-Gm-Message-State: AOAM530DQDMkNGFSUedl7glgJFA5ASN5vqPgDR0mtiOcqDDNolaShHNT
 ZNHLM4RXJXqmmQK2rGm3a3VZ4A5d7CAKs0pxD24MzA==
X-Google-Smtp-Source: ABdhPJw0ckIBbPI+QJkJYQsR/aHyPcFqI/Cbo2S1aK5o3fb6YXZSOQqQEvVnX9hlK1NxMKgitnE8GWNY+dSwqtFAvpc=
X-Received: by 2002:a05:6512:3e0c:b0:448:3480:1fe5 with SMTP id
 i12-20020a0565123e0c00b0044834801fe5mr4512406lfv.358.1646737102778; Tue, 08
 Mar 2022 02:58:22 -0800 (PST)
MIME-Version: 1.0
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
In-Reply-To: <20220304135134.47827-2-yann.gautier@foss.st.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 8 Mar 2022 11:57:46 +0100
Message-ID: <CAPDyKFq_TsBLjW2WxC-Fvu6qDs9MJ1=QPo9gOLRykJ5p2pJbGw@mail.gmail.com>
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

Hi Yann,

On Fri, 4 Mar 2022 at 14:52, Yann Gautier <yann.gautier@foss.st.com> wrote:
>
> On STMicroelectronics variant of PL18x, the DMA Linked Lists are supported
> starting from revision v2 of the peripheral. But it has limitations,
> as all the buffers should be aligned on block size (except the last one).
> But this cannot be guaranteed with SDIO. We should then have a property
> to disable the support of LLI.

Indeed, the buffer handling with SDIO is somewhat special, which also
has been discussed several times on LKML before. In principle, we need
the SDIO func drivers to respect buffer limitations that should be
specified by the mmc host drivers. Quite similar to what we already
have for block devices, like ->max_seg_size, ->max_seg, etc, that is
set per mmc host.

I realize that implementing something like the above requires bigger
changes, which is why mmc host drivers instead validates the sglists
and the elements. In some cases that means returning an error code and
in others it could mean falling back to a non-DMA based I/O mode.

For the stm32_sdmmc variant, it looks like the sglist validation is
being managed in sdmmc_idma_validate_data() already. Can it be
extended to cover this case too, rather than using a DT property?

Kind regards
Uffe

>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/mmc/arm,pl18x.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> index 1e69a5a42439..309a2c0426e5 100644
> --- a/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> +++ b/Documentation/devicetree/bindings/mmc/arm,pl18x.yaml
> @@ -145,6 +145,11 @@ properties:
>        driver to sample the receive data (for example with a voltage switch
>        transceiver).
>
> +  st,disable-dma-lli:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: ST Micro-specific property, disable DMA linked lists.
> +      It is used for SDIO.
> +
>    st,cmd-gpios:
>      maxItems: 1
>      description:
> --
> 2.25.1
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
