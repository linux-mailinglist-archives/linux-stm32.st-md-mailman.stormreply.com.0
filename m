Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCD850E121
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 15:05:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 08E40C60462;
	Mon, 25 Apr 2022 13:05:52 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03642C5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 13:05:50 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id b17so11688265qvf.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 06:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1VvLmkVL+3wDUefmPwUcJ515cWbEyJqZs+5o404eNoY=;
 b=xBuXdNPpXt+o/vCnEPJUECTJgKaigrozvJ7KbgZqtP7qH9+PclqjNw+LtL1mhFklCQ
 Wz6FVoCzBAMkLLSHqoEVXualQ6ez/dp3rz0404OEnk271DCG9xDiUieFA/174tKz8oVV
 174YHo8GkgPjm1lTtxDXGQAdSJARjOroOhvRN/eZ8apjM6lCJZwLlhltQC5i4ZHBJ4vz
 iV67q7ZSVMGZxkSYqC65dYc375jFPbxgPb+M8Z7oZx4059QE9slBivZUVcKxvqNa1/pe
 cymi7Wj8r7CIESyu1MotiHgM8yOe2UmyHTFlHlir621VxcQzHf2DVL0xTKqom82JWFoy
 RSSA==
X-Gm-Message-State: AOAM530Zqn2OzvnvRRyhCV85s2Iky0Kqbl+EvTMoa0uiZh2CsPZjoj0N
 +hVD3i1GQxd2J/AjnC+4YyONAJPi2jOeXg==
X-Google-Smtp-Source: ABdhPJwpdYDYW7VTw1oS8/hThqzHvs6bA4zXvTfujOZ/7RtBV6ed3Iy9jKCM6HBeYznXEpyqQULMQw==
X-Received: by 2002:a05:6214:1c83:b0:443:6749:51f8 with SMTP id
 ib3-20020a0562141c8300b00443674951f8mr12516441qvb.74.1650891949526; 
 Mon, 25 Apr 2022 06:05:49 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 e26-20020ac84b5a000000b002f35d11c5dfsm5058658qts.65.2022.04.25.06.05.48
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 06:05:48 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-2f16645872fso147164217b3.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 06:05:48 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr16620681ywb.132.1650891947948; Mon, 25
 Apr 2022 06:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220423202452.148092-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220423202452.148092-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 25 Apr 2022 15:05:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQTV2i6_vetQbowRBLEp2fu+rCTMyT77wRngBowAPzfQ@mail.gmail.com>
Message-ID: <CAMuHMdXQTV2i6_vetQbowRBLEp2fu+rCTMyT77wRngBowAPzfQ@mail.gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chris Brandt <chris.brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: timer: renesas: ostm:
 Document Renesas RZ/G2UL OSTM
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

Hi Biju,

On Sat, Apr 23, 2022 at 10:25 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Document the General Timer Module(a.k.a OSTM) found on the RZ/G2UL SoC.
> OSTM module is identical to one found RZ/G2L SoC. No driver changes are
> required as generic compatible string "renesas,ostm" will be used as a
> fallback.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> +++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
> @@ -23,6 +23,7 @@ properties:
>        - enum:
>            - renesas,r7s72100-ostm  # RZ/A1H
>            - renesas,r7s9210-ostm   # RZ/A2M
> +          - renesas,r9a07g043-ostm # RZ/G2UL
>            - renesas,r9a07g044-ostm # RZ/G2{L,LC}
>            - renesas,r9a07g054-ostm # RZ/V2L
>        - const: renesas,ostm        # Generic

Please make the resets property required on RZ/G2UL.

With that fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
