Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C19162B5CFB
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Nov 2020 11:37:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB2DEC3FADD;
	Tue, 17 Nov 2020 10:37:38 +0000 (UTC)
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7817EC3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 10:37:35 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id f16so18880854otl.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 02:37:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xlpCdbdwdgiAHLJ6o3j80s/A4tWrQRJFEA4CoHh+SMQ=;
 b=G1ur7bh1z9zc9bNURqCvnOBbEzkgReacjgPjj9Vr12vvYr1+IlVdEuRICJoccpx1G+
 cPvKJWx6M2oXkaOBaNfvcepT04X8DOYeRF9Eye6v4hsiygGN2K+KlOvVG0sTERzCHpHw
 NJ8RogCCsuWXWAkc8yrC1MhDVIpzJUEcu+UHlHCejjD4JyMiD90qzVe7vJAk4LbHSjrm
 b0QK+VbV1flUHgOpHOu/K2anKfjfyUpNWv+2gMZYM9Rtm54T5tXQBTfGslb/ZTjcDubk
 0PT79DpJY3rXyWlcU6jquENTeYO9wsObSWTdhSPOKSzIKP5Lp38ixDs/PAKo0HlSvgRp
 5w3g==
X-Gm-Message-State: AOAM531HLj0ZBmk0IoZg0uvr1eQufURrBlpCaDhihB6gDf4wfMqgHR2D
 +wPcMXMbm8LAYef9ERLj4QiGFj2C54+F/0TNE44=
X-Google-Smtp-Source: ABdhPJwdmx7r6I5zj8jodkYho7XnaytzF+QMp1QBc/itOa9ld+ji3I3oUftzlTM4p0M68kkeI24eiE8vpMn7CYfNO3c=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr2362156oti.107.1605609454288; 
 Tue, 17 Nov 2020 02:37:34 -0800 (PST)
MIME-Version: 1.0
References: <20201117103123.3938-1-chunfeng.yun@mediatek.com>
In-Reply-To: <20201117103123.3938-1-chunfeng.yun@mediatek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Nov 2020 11:37:23 +0100
Message-ID: <CAMuHMdXVXqj9k4FMFH5aiqKwNrWocJpjahYKA8k2e3Z2ji2hvQ@mail.gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 linux-realtek-soc@lists.infradead.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-unisoc@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: arm: add additionalProperties
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

Hi Chunfeng,

On Tue, Nov 17, 2020 at 11:32 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> Add an explicit "additionalProperties: true" to avoid
> dt_binding_check error caused by:
> 'additionalProperties' is a required property
>
> This will not change function, due to additionalProperties
> is true by default.
>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/arm/actions.yaml
> +++ b/Documentation/devicetree/bindings/arm/actions.yaml
> @@ -49,3 +49,5 @@ properties:
>            - enum:
>                - ucrobotics,bubblegum-96 # uCRobotics Bubblegum-96
>            - const: actions,s900
> +
> +additionalProperties: true

Looks very similar to commit 62298364bd489b06 ("dt-bindings: Explicitly
allow additional properties in board/SoC schemas") in v5.10-rc2?

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
