Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 060D54D8FB9
	for <lists+linux-stm32@lfdr.de>; Mon, 14 Mar 2022 23:43:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA311C60469;
	Mon, 14 Mar 2022 22:43:37 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84627C5F1F2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 22:43:35 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id u61so33761378ybi.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 14 Mar 2022 15:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zBz4KR/tbzFCQ7Rg6AbL2tIN/kz8QPBlTu1AMO28qtU=;
 b=r7NNd/At5KMqFw3i9SvlUx564e3HPd17qxW7CY1V/KYHkMDg2c205EYOqfvZ+Feie0
 k78b8IkyX6wYfgmqwiJYaa+1N2M3Tc3DuQd210amcQeoZkCentBLNGI7opmuGm1zFmpo
 kXCRTEs3pkdklEykPP7O3IbVmZrH84YOUuGa9bsDHpjS94GVCLF+z1R6OdlcMcwhpKM9
 ZCEfs1XlbOpMBbRh6nRznEnzHtaiMfaHSIK4invfukZGxDmq7l6EgYHLk76Efz86Bed0
 cYcdgIHO4n6h2Ms4mnZJKpewAoUOD+al7/xMp/5P2wRBwOJ3B1tjADUlF3+iqwg3HNZE
 jjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBz4KR/tbzFCQ7Rg6AbL2tIN/kz8QPBlTu1AMO28qtU=;
 b=eR3LXBiXmAvSJHRk2MjvaeCyUqu/NG/W7PMgEfAvjcY1phDegPbtpvYEB8zm+bQxg1
 5e4fK17Ntv6ZUQ//H9QP7vKGD8W3QNeeJUXPgrTiO7Ywdv3fU6WrhHv/CWaq16CPzxx9
 udt9xxnAVlmUWXemubg+sSKZtiVrcLtz3GsgAceUAPmY8rYAsXwDJV/Z4ah/DR6Y+Tkx
 XhBg5HQFLCUWdbYAgPfexqshYe/hghPd0ExIbgzJa6TuFtON9BLeTdE+8hr3ElWVAuMq
 6vjY7rSvVTuHk3HmszsSBX8KON8e/Sa1JAc0PszAagIGA/N7d0V32mkn9zRFbwie/smr
 WwpQ==
X-Gm-Message-State: AOAM531HN3V1yVum2PGgfAnOTdgYM7u+rpsXJwpkdJD3OlvW5cXphayQ
 qktFCikDBtijxvpQeGLKvY8jOcRGiLg2rd129V/dIg==
X-Google-Smtp-Source: ABdhPJzdH5EAlui5zL/pWz9DIDbKqOBoB1cvh3rT4dgsBx/UFynGgA6bujxHdHry3cd2exdH6seuYB8+4pdVXpKfX60=
X-Received: by 2002:a25:ab64:0:b0:633:6d02:ebc8 with SMTP id
 u91-20020a25ab64000000b006336d02ebc8mr2106711ybi.492.1647297814409; Mon, 14
 Mar 2022 15:43:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
In-Reply-To: <20220304135134.47827-2-yann.gautier@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Mar 2022 23:43:22 +0100
Message-ID: <CACRpkdYQz+-im3n-r0_8RKL7so2bHS=aZobty4BbzixmPzms-Q@mail.gmail.com>
To: Yann Gautier <yann.gautier@foss.st.com>
Cc: Ludovic Barre <ludovic.barre@foss.st.com>, devicetree@vger.kernel.org,
 Ulf Hansson <ulf.hansson@linaro.org>, Marek Vasut <marex@denx.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
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

"On Fri, Mar 4, 2022 at 2:52 PM Yann Gautier <yann.gautier@foss.st.com> wrote:

> On STMicroelectronics variant of PL18x, the DMA Linked Lists are supported
> starting from revision v2 of the peripheral. But it has limitations,
> as all the buffers should be aligned on block size (except the last one).
> But this cannot be guaranteed with SDIO. We should then have a property
> to disable the support of LLI.
>
> Signed-off-by: Yann Gautier <yann.gautier@foss.st.com>

Actually I think this is present also on the ux500 variants. See:
commit 2253ed4b36dc876d1598c4dab5587e537ec68c34
"mmc: mmci: Support any block sizes for ux500v2 and qcom variant"

Spot the variant data "dma_power_of_2".

So whatever property you add
to the variant data (not in the device tree please) should
be added to the ux500 variants as well, it will *VERY* likely
have a problem with LLI elements not being a power of 2
as it is the ancestor of later STMicro variants.

It might actually be the reason for some annoying WiFi error
messages I have seen :/

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
