Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D16EC4E7AA0
	for <lists+linux-stm32@lfdr.de>; Fri, 25 Mar 2022 21:12:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80C2EC628AD;
	Fri, 25 Mar 2022 20:12:22 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B90CC628A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Mar 2022 20:12:21 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-2e6ceb45174so54611577b3.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 25 Mar 2022 13:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YT2o1xxdFf9OVHBJJGoL9aS2UVDgV96wgaPQnf59u3A=;
 b=iUDT/G3LEcGf/5tagjP8eFjsGsyOBph1oCwiAU9SRpn47LJA8MWoC2ZnwxrjbSPjMm
 NMgbwZLb++g0JJFq9rSNRDfuiuAAY8Rb8mEl15bFUi/1axDz0mqVDBjWIOF7rWkJktPB
 GVLthy7ZRekp5ux4Y2DFI5hfRTVn6an7IoJvpEJSJ/9e6g+VV6/TIh6v+e0YKsPg/ANl
 u9+Q/qattDvEkHp5i6SesaOU1SOYG0BE3BKYCSAklaOO+5ljSccec5A3gP/LLOHHRLHW
 2IrIx4x8ygD2EPSpIa9BNu8dVIUcFM2jbwLpeByGektKecBFHNoOwvOwoDpGWDgslNFr
 atGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YT2o1xxdFf9OVHBJJGoL9aS2UVDgV96wgaPQnf59u3A=;
 b=GSiVSZWs9zC+Ey8Kr5fgXDFu+FnR2mtbTo29NWdz4uCKXSlyRky4MBhnsW3b0HYJmR
 7aQhK3q1mW/eojykx5OsX/el8anh9AaZ2Ko4LXLKIKtGpj42XIOSGchySmavcEWgPpXk
 uo7pJoYIYUFc5gWwHEuoO/yZXzs/Nq+7hu4HJk1CGanH8Vca8AbCMWWeFX/RAvT4bxz3
 HlMnt4Gl2A3DO3DM3/wq56CgHLnvsx1oIHK1QfzZmjPl730Qxf9M3AxbW/kAyxRuosM/
 7urohhv2nNfum25JKSYl7gTxRl1snbcX0EBeFCJ0GH/q/PxPJkP846+Ae+o/JEpX66gD
 q2Tg==
X-Gm-Message-State: AOAM530de0wSb7lSt8mg041rpltxpDjQiyUSYN/p2f2JotWGHIa2OQer
 +714EImydk5EZeg6E1tD/lQ6yR9vqkhFB/bD4uzTHQ==
X-Google-Smtp-Source: ABdhPJxUBffdaPMdxHWCaYq0Qr6rteF2S4TUamYdP1nuniOmrgv1lq5txO6UeJxGVYZr0OiLkvNRfbesOoqWq1bIo24=
X-Received: by 2002:a81:164a:0:b0:2e6:8e4b:7487 with SMTP id
 71-20020a81164a000000b002e68e4b7487mr12654258yww.437.1648239140546; Fri, 25
 Mar 2022 13:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220304135134.47827-1-yann.gautier@foss.st.com>
 <20220304135134.47827-2-yann.gautier@foss.st.com>
 <CACRpkdYQz+-im3n-r0_8RKL7so2bHS=aZobty4BbzixmPzms-Q@mail.gmail.com>
 <0bc53018-fce4-4104-fa47-6e60d2367d69@foss.st.com>
In-Reply-To: <0bc53018-fce4-4104-fa47-6e60d2367d69@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 25 Mar 2022 21:12:09 +0100
Message-ID: <CACRpkdYMWXEX6dpT0aUrCrFd-8-U35OG9Zmpkfty=zMH=mQqbA@mail.gmail.com>
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

On Tue, Mar 15, 2022 at 9:26 AM Yann Gautier <yann.gautier@foss.st.com> wrote:

> The STM32 variant uses an internal DMA, and the DMA functions are in its
> dedicated file. So I was planning to do the same as what is done in
> meson-gx-mmc.c: using a bounce buffer to copy from/to in case DMA
> constraints are not fulfilled. Not sure it can help for Ux500.
>
> Ulf, before I send my new series (although it is not ready yet), would
> you be OK with the bounce buffer idea?

Would it not be better if the bounce buffer is something available
for all MMCI variants and not restricted to the STM32 DMA add-on?

What I'm thinking is that this is a problem with the MMCI hardware
rather than with the DMA hardware, so the problem kind of gets
fixed in the wrong place if the bounce buffer is in the DMA add-on
code.

Maybe this is how you fixed it in later patches, I'll take a look.

Yours,
Linus Walleij
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
