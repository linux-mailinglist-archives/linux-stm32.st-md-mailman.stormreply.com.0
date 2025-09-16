Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B984CB597D0
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Sep 2025 15:37:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B38BC3087A;
	Tue, 16 Sep 2025 13:37:42 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9B5F9C32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 13:37:41 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-77d253914d0so19252796d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 06:37:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758029860; x=1758634660;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aDQooxDkD5fz4sLWBIH6i0SDIPVUTbpTi303GssaIAI=;
 b=Qq8nWq2XWNMnhQ/KhurDCj2TyOW12CPBY65Q4bFM5g35DY1wzKHTBLtsKNj9XcytEK
 jPPKHSy1A4yB8GAEg4bIWBqcQ4fY2yuxuMulYdJXvuzyI/90B5RfqfD8Arbnj6bmtd5H
 g9fJVJVRkAJLh/LKkmZGHDUxX+fmqX4xvYv32z0q39ZRd+dMoTHEPqxD64Z808RUeI/L
 bUthvWOdGEu3TwxBYyOAeDgNRADH9XzuNg+MHYiGPmpQuqCUO9l3Ccm+j3Gez139ONIb
 wda/oCTJpM9/0Un6gK22nkOurAtFt+Yz/4I+jiPEK4A7Q74+/iwxPZirW2+4Qc/1wsek
 RjOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWToMAc+yy9pJ1lp3ePHxg7KEVcPIZtNWtDtzX1ssiNH2AQwYjubF7uZ84SsqSmhew/nAnD6AsUrZMK8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxcEgsYYsv350Do1TSSNXSsY2Uh1bGGT6RUBh1iYZJjI0qP0adT
 BFEqpZZKrJXGhA2qX/HP+6oDD9poZpmiFGnHo6jdxK0w+mRndOcSD/KGRxEjMYjP
X-Gm-Gg: ASbGncsGlPhOLoZt+HIKUapsUEbap3VijaCo2vcESUxI0nDBh1tClY2MPqyWImmYKgh
 P4iXzEw2ZWrAfdTkp18uGihu8JdUWe9aeGdA61gtDKZCC7qB4USaopRzLbMwqi5ETNJehuzvrz6
 rpgC0ljA0VID0BphBP+LU7u86DRbMHS4T1GTNtvAa2PTwVi1xPUGRGbyyHbsjOQHoY9p2OLK2M5
 aSbj0olkrOwIJZPEffEPPTd4OUStBK/bjnIa0nyQnerob9CIJM9/bclKYl2bne0Ho676dv3As2W
 Bz2ErhFl8nbwia44pmpLOWxLMBjHkd07BNmcTnBXVUYyk4uiOZXA5NYuDODzLYq2ULK5NlVcL39
 MO7XQ7bXcjTkXOwiy4Oi1hw4u2nK26JL/ITRuJklEt4tgxlslqRVIx6FbH5Fl
X-Google-Smtp-Source: AGHT+IHlHAZe1TtdOGKFpt26fo1LErAET23abIupSd8UYpk5RoWImGDhhgax2CVgEY3Swwj3sykRzA==
X-Received: by 2002:a05:6214:194c:b0:78e:102f:f596 with SMTP id
 6a1803df08f44-78e10300195mr8857306d6.12.1758029859959; 
 Tue, 16 Sep 2025 06:37:39 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com.
 [209.85.219.44]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-77759a82905sm54608636d6.55.2025.09.16.06.37.39
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 06:37:39 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-776e2e357abso26424376d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Sep 2025 06:37:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWa71kdTtcryxk3JZLHdCkHp3ckySUNteirX/C/g/ETacOENcqrVn9GQA2zo1cpm+ShwvZJb5hODfUcpA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6122:1d8c:b0:53b:174d:98f2 with SMTP id
 71dfb90a1353d-54a16b20009mr5200853e0c.3.1758029474999; Tue, 16 Sep 2025
 06:31:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aMlgg_QpJOEDGcEA@monster>
In-Reply-To: <aMlgg_QpJOEDGcEA@monster>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Sep 2025 15:31:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWVXd5FauMYNq0yXgQa87F4Z9HcGOu2O_ercQg48GNoQ@mail.gmail.com>
X-Gm-Features: AS18NWCih78Z1mvXR97O_iR6cJDURxsOD6O73Iub1rATQe0jxKnm2iY0iJuCAa8
Message-ID: <CAMuHMdXWVXd5FauMYNq0yXgQa87F4Z9HcGOu2O_ercQg48GNoQ@mail.gmail.com>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, linux-renesas-soc@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v3 3/3] net: stmmac:
 dwmac-renesas-gbeth: Add support for RZ/T2H SoC
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

Hi Anders,

On Tue, 16 Sept 2025 at 15:05, Anders Roxell <anders.roxell@linaro.org> wrote:
> On 2025-09-08 11:59, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Extend the Renesas GBETH stmmac glue driver to support the RZ/T2H SoC,
> > where the GMAC is connected through a MIIC PCS. Introduce a new
> > `has_pcs` flag in `struct renesas_gbeth_of_data` to indicate when PCS
> > handling is required.
> >
> > When enabled, the driver parses the `pcs-handle` phandle, creates a PCS
> > instance with `miic_create()`, and wires it into phylink. Proper cleanup
> > is done with `miic_destroy()`. New init/exit/select hooks are added to
> > `plat_stmmacenet_data` for PCS integration.
> >
> > Update Kconfig to select `PCS_RZN1_MIIC` when building the Renesas GBETH
> > driver so the PCS support is always available.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Dropped passing STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag in stmmac_flags
> >   as it is always set for all the SoCs.
> > - Updated Kconfig to include RZ/T2H and RZ/N2H.
> >
> > v1->v2:
> > - No changes.
>
> The following warning is seen when doing a defconfig build (make
> defconfig) for arm64 on the Linux next-20250915 tag.
>
> First seen on next-20250915
> Good: next-20250912
> Bad: next-20250915
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Build regression: WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> This is the build warning:
> WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
>   Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
>   Selected by [m]:
>   - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])
>
> WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
>   Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
>   Selected by [m]:
>   - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])
> I: config: PASS in 0:00:01.592356

Thanks for your report!

    config DWMAC_RENESAS_GBETH
        depends on OF && (ARCH_RENESAS || COMPILE_TEST)
        select PCS_RZN1_MIIC

    config PCS_RZN1_MIIC
        depends on ARCH_RZN1 || ARCH_R9A09G077 || ARCH_R9A09G087 || COMPILE_TEST

"ARCH_RENESAS" is wider than "ARCH_RZN1 || ARCH_R9A09G077 || ARCH_R9A09G087".
I would just change the latter to ARCH_RENESAS.

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
