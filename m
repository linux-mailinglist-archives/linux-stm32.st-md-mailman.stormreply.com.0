Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 840BDB41998
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Sep 2025 11:09:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 23E4DC3F956;
	Wed,  3 Sep 2025 09:09:37 +0000 (UTC)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F71EC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Sep 2025 09:09:35 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-89018e9f902so4048613241.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Sep 2025 02:09:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756890574; x=1757495374;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oj9gesqCWEZX1N1hZgTvpmSqcv2Iw8bLBhaQ9r1RKbk=;
 b=oHdeEi6oFcF24epQ9UUpmM9AXR2Hik5zIQGAZT8T6XAMUodXDdPu1SjzxWUb9sfRei
 FeSlXrZhfIzqsYo0mP4wI4oxDK/e8inMV5ZO++2JSbMuP+sbHmLnyF8yQBzuBTeQs62z
 nIOaD+/MsKLmZxsrUcftsZsK3ovt8JcVGtp1YvX0w8Ip5flsnqHP7Q2cu0+VA6MUuG+7
 kuA0LjA7/oxiqeOot1oA/QmUiNAj+ocnR5SXnPyyN+/iP1sZfFe3MOuts2v1T+LcM270
 VXqV3HX2pS6VMr4gDEniuXPsztrUba8Sv7P2vae6vp9v+Fk87KYvYD8/hATvBKmDL8LG
 koXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx1A/95C9q/CkkHUyoihze3t4f57ebm4sU5tFXqKoYRZCxbs7BxwLa8cxDXVUbD79BByn9JnGyjf8S3g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxpC0pc0L4B04bg9kzlutA1XApykAFezhxIGJD3eWp8/PkRPHEw
 2kCLw7swDYkOnRzadP2aYDDQtOlC6MdpJcX/8G5bRE8xCFABONvGqg22lcAx9qqM
X-Gm-Gg: ASbGncsQJt76k5rIiLQ+KxPVX5W3TiDi4QDsVssfu2ag+NnPYBtI0RHjdTQIOFew/J+
 M7pFe1l3UcRNt+GByug7EE0d0lACEUGxl+UIEMINqdxmHsuM6rA3wSRzjORmzB+Gl7CsJyoZ5bf
 2RG/azyEoYyo/6n7DTphGalby925W+rECWEqCLjECWE+ixXbmjVuqcFeIxHNRlCNdNzTPpsPU4a
 VKlis4FYvHdsj/x2efomCh065WutKzyCDaVF/vvEYXXHNepRovJ36olEx2OzfQKJ+XL2RBsHZ1S
 4rfA5p5JPA0jyUFMIJHU7VpdPyNBdiV0TFBvcgP1zSYd5UeO9XRLUbNYcV+ev9G/wZKVGcwxdGm
 WkB88fes9HZCoPALHvG38UDqhl4FUHdAZk+TpdZSUCx6S/dql663ybLgPssXQhOfi/LUPeKw=
X-Google-Smtp-Source: AGHT+IEAz/rUxSJ9AahcAFKoZ00shelA5YHoCtWWdqGQU8cZ+LXzcd29FiXxCRuUyr/r5QaevVwkXg==
X-Received: by 2002:a05:6122:21a7:b0:53c:7ecb:2f40 with SMTP id
 71dfb90a1353d-544a0197d5dmr4670456e0c.2.1756890573787; 
 Wed, 03 Sep 2025 02:09:33 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-544912c7d07sm6642134e0c.4.2025.09.03.02.09.33
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 02:09:33 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-52b7402151eso1845603137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 03 Sep 2025 02:09:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUIRYeOhfeplbc+hCeNGmCopOSmzEfL3mr1og0HxhQeNIpmkBrf/pHFu7gKvf+buNcLtBEsCtLDBDcOkA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:3581:b0:524:5266:f74c with SMTP id
 ada2fe7eead31-52b1c8811fdmr4553436137.31.1756890572867; Wed, 03 Sep 2025
 02:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250902001302.3823418-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250902001302.3823418-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 11:09:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
X-Gm-Features: Ac12FXxX9lgyaKAr8UpWw-SXRvkRdNef9IMOHkwD6ZbZ-DdxK6PzWj_7-XFm7Aw
Message-ID: <CAMuHMdU_BHtHznN8C7s0Yf=nxBaXb94MLFD-Pcz73W8hJhxc-w@mail.gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 2/4] dt-bindings: net: renesas,
 rzv2h-gbeth: Document Renesas RZ/T2H and RZ/N2H SoCs
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

Hi Prabhakar,

Thanks for your patch!

On Tue, 2 Sept 2025 at 02:13, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the Ethernet MAC (GMAC) IP present on the Renesas RZ/T2H
> (R9A09G077) and RZ/N2H (R9A09G087) SoCs. The GMAC IP on RZ/N2H is
> identical to that found on the RZ/T2H SoC.
>
> While the RZ/V2H(P), RZ/T2H, and RZ/N2H SoCs all integrate the Synopsys
> DesignWare MAC (version 5.20), the hardware is synthesized with different
> options compared to the RZ/V2H(P):
>   - RZ/T2H requires only 3 clocks instead of 7
>   - RZ/T2H supports 8 RX/TX queue pairs instead of 4
>   - RZ/T2H needs 2 reset controls with reset-names property, vs. a single
>     unnamed reset
>   - RZ/T2H has the split header feature enabled, while it is disabled on
>     RZ/V2H(P)
>
> To accommodate these differences, introduce a new generic compatible
> string `renesas,rzt2h-gbeth`, used as a fallback for both RZ/T2H and
> RZ/N2H SoCs.

Until now, we didn't have any family-specific "renesas,rzt2h-*"
compatible values.  Instead, we always used " renesas,r9a09g077-<foo>"
as a fallback for "renesas,r9a09g087-<foo>".
Is there any good reason to start deviating from this?

> The DT schema is updated to validate the clocks, resets, reset-names,
> interrupts, and interrupt-names properties accordingly. Also extend
> `snps,dwmac.yaml` with the new `renesas,rzt2h-gbeth` compatible.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

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
