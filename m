Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D750DF75
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 13:55:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EE90BC5F1F2;
	Mon, 25 Apr 2022 11:55:55 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EA859C5F1EE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 11:55:53 +0000 (UTC)
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MMXDj-1nQ37m1fZn-00JYsk for <linux-stm32@st-md-mailman.stormreply.com>; Mon,
 25 Apr 2022 13:55:53 +0200
Received: by mail-wr1-f44.google.com with SMTP id j15so7225690wrb.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 04:55:53 -0700 (PDT)
X-Gm-Message-State: AOAM5335oBEqC8RwU1Dt5+RHavRp74qHKhkOWSmwXpvFL3AX4pp7kMlM
 kHV30DtSZPzfN8v/z0uCG9mTFpWhLAvvpZblg5g=
X-Google-Smtp-Source: ABdhPJy6G1KFbKHEzOAredhlniFlHgR99fdfjjNVGzWiR1NENqqdvyAlm9QrDNMIfUNAfKR7gKHmCTAe8oiy/GkxXHY=
X-Received: by 2002:a5d:6da5:0:b0:20a:8805:6988 with SMTP id
 u5-20020a5d6da5000000b0020a88056988mr13310843wrs.317.1650887753050; Mon, 25
 Apr 2022 04:55:53 -0700 (PDT)
MIME-Version: 1.0
References: <Yk3nShkFzNJaI3/Z@robh.at.kernel.org> <YlVAy95eF/9b1nmu@orome>
 <c5fad2c0-598d-a90c-5272-398ce48399fe@nvidia.com>
In-Reply-To: <c5fad2c0-598d-a90c-5272-398ce48399fe@nvidia.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Apr 2022 13:55:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1fyibqtkNMXDA6JXFWc2856B40C6oD8hBaieR8jTD-Ng@mail.gmail.com>
Message-ID: <CAK8P3a1fyibqtkNMXDA6JXFWc2856B40C6oD8hBaieR8jTD-Ng@mail.gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
X-Provags-ID: V03:K1:iJiKb3a+4tLYPQi3wH0rKQiT4l3bztzK+RgYoMayPsNZWtbZP4B
 yHP1E4+nC+IqBaxZZcSriFqv8vNbbKS00RZGeE5QVp/Up6H6aWLk8wNXO1Pn37RlXIQF6rM
 y4lQQQIX/1ZCr9FbxNfDm32qSczq7v+Uw5//+a+mWOH7JveTUyM1+MJBwnWYGsKjNDJywQ0
 GcPh3I0Oib6NEaTyCJX+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WdIczUxjD/c=:imlb5xUp0JNhpnyKSekJnm
 FSjAzASPUe1R34A7bbwgY+2FW3JZACpy3vHwHfxfPc0m7OPTHLK3s9EGl0KPlWn7sNQ9jtfkI
 HqSvRJ/L0pJh3NViYJiYgkoUZk/szecfzJF3eJDrGTtbgvIjwg+Yhc1wpKIkwmYt1kjBvHKmN
 mLAOa5ohXt6J7Knn3qpIyAqz6feE/qYZdlR3yrr1pplO9Ygo75W0ugrOKIaNH0VNzfQFjzEB6
 XyUYBsJeK31YoJ+/1d654gRFLmucMU/V8x4necLpM51W30VchTKKDOMoFfHUBY0CYOCWb8DV8
 CLge7dlvUTOROrAcCqOkkA+pyhQqoYIgvUzXKPNQOVwtpMlQwm5SqIcyJlfMNN+y7LY5z9Xcr
 tsXZKpRxu0ZGGN+75jgEq8ZVXvK2AwojJZUjzaGU9APyzoCxi+q00oCMNe82ghgxg96hOY/CO
 AMiunJFquaOvcU9cZ74YtDMbnkmVTy3rGfKQejLFRsnhuVLb20dFxoLyTaNf7Wa9EhZ4Hh9Yw
 NwIjjaNACcWyRa1MNMRF958Y+2KEj+3jI5yHsfIuWGaVtCet1F/DGutog/B3ftE62mrdvKcEp
 qYx9oACWSJVr8hh8CUQr4kE0rcxwueAUfcMAUKhLSWghe7Z+Po4H6B1Qhgek9rdb6G7fJ2ovN
 fVmANPDMG+vQ2zd8j5X9lHyvYMZjx+G+AMfXb8fNaxuZ4dC9lQoAA0zCIOlOykPYViKA=
Cc: Rob Herring <robh@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, DTML <devicetree@vger.kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Nancy Yuen <yuenn@google.com>,
 SoC Team <soc@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tali Perry <tali.perry1@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Benjamin Fair <benjaminfair@google.com>
Subject: Re: [Linux-stm32] [RESEND PATCH] arm64: dts: tegra: Fix boolean
	properties with values
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

On Mon, Apr 25, 2022 at 1:20 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> On 12/04/2022 10:05, Thierry Reding wrote:
> > On Wed, Apr 06, 2022 at 02:17:30PM -0500, Rob Herring wrote:
> >> Boolean properties in DT are present or not present and don't take a value.
> >> A property such as 'foo = <0>;' evaluated to true. IOW, the value doesn't
> >> matter.
> >>
> >> It may have been intended that 0 values are false, but there is no change
> >> in behavior with this patch.
> >>
> >> Signed-off-by: Rob Herring <robh@kernel.org>
> >> ---
> >> Can someone apply this for 5.18.
> >>
> >>   arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi            | 8 ++++----
> >>   .../boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts    | 8 ++++----
> >>   arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi            | 6 +++---
> >>   arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi            | 6 +++---
> >>   arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi            | 6 +++---
> >>   arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi            | 8 ++++----
> >>   arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts        | 8 ++++----
> >>   arch/arm64/boot/dts/nvidia/tegra210-smaug.dts             | 4 ++--
> >>   8 files changed, 27 insertions(+), 27 deletions(-)
> >
> > This causes multiple regressions on Tegra boards. The reason for this is
> > that these properties are not in fact boolean, despite what the DT
> > bindings say. If you look at the code that handles these, you'll notice
> > that they are single-cell properties, typically with <0> and <1> values.
> > What may have led to the conclusion that these are boolean is that there
> > is also a special case where these can be left out, but the meaning of
> > that is not the "false" (<0>) value. Instead, leaving these out means
> > that the values should be left at whatever is currently in the register.
> >
> > See pinconf_generic_parse_dt_config() and parse_dt_cfg() specifically in
> > drivers/pinctrl/pinconf-generic.c.
> >
> > Arnd, can you please revert this so that these boards can be unbroken?
>
>
> Arnd, any feedback on this? A lot of Tegra boards are still not booting
> with v5.18-rc4.

I have reverted this commit now, sorry for missing the earlier report.
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/commit/?h=arm/fixes

> > Adding Bjorn for MSM, the Nuvoton and STM32 folks.

I'll wait for the others to reply, but I do agree that these are likely broken
as well. Could one of you propose a patch to make the binding
describe what the kernel code actually expects here?

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
