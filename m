Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB0CAAC488
	for <lists+linux-stm32@lfdr.de>; Tue,  6 May 2025 14:50:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5719C78F61;
	Tue,  6 May 2025 12:50:11 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DCF9C7802C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 May 2025 12:50:10 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-4c4f8799f8aso1563010137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 May 2025 05:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746535808; x=1747140608;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dR5SLyEuVXCgzfFmFtCWiF+tB6qj8RmfZjai3JkMnSo=;
 b=mYYbGvlqD9sdItEifoALacA3FpSooHMDdCj2ZdjdIvslRXkB+SnHKUSjjvwqcOGJ/q
 /cj3/TZin5gYq+UgAUDFfXSae5cwElWR61OW6gT/1uxlaC8hxvrVKCrD+LJkIQEXDWPZ
 GSoIxWJi07FRmXm9qNfBfIM8fA3i1VCe+rABOAoczKWoX1VJ2HoZF3xJNrtCOpNsK+pD
 lSmE8yUIUqHt6yyyrbMjAQcvtRQ/9NsxPkG7syUnNtG19DapI1N0uOeDaQzR04l9JRsX
 AMzFudq1qLU7VyAR6QmWMKyRKOHpEh/PLh3rRyYRxw9wSTyhSBRRFilTp+x22W+Bteyp
 nGxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFBj5iiKCY13aPLp9nWGvEVN+yLFGIAOPbylqrR3Dix6kwfLmiW3C93CKhy1th8ClHxJD00Xz8SQWEZw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxBycOp725J2MGyyF/dax7bfL6OTozd8lu7sIIwWowrAQUAdOVc
 JxaXcNze551tPZKzhSLw/94MTiFqZmfy5TW1cPGaE4DmvteiSAdgL+lovRxg
X-Gm-Gg: ASbGncuDAC1myJCkeb1c/PaMyh6k55VlIJWy+2lnvscBmAa0suNUKh5F4ADR5xrwSSk
 U+7MHLG4QSuD/1z9/96dU95evBBZiN+AYH5R8uQZAxti835/Fso6/jW9bmd8Voe/CKFneVqJ4WC
 jQJ7p2sZ/A8sT6ol8XnLhM2MkZYdfd1lW9IqC1FJ0z6vues8mWEddG4qK6iw+xfasV4pQB22Gof
 PKlls7eadodYgj6foVlkuUrBm/UAQuYyy6ie3IqEuGUTvxb5ZZCKe+7geyzcRgapr5WEgVswK+J
 3J7oFUAFoe+w4dNN7ed3tf+n2DM6n43OJHTZem3/cgUKQnpqEu+OT5CeHk+sMHKTrJYawOReKTD
 //yQ=
X-Google-Smtp-Source: AGHT+IHTxP4LyQs0DGq0s/pLpYgaO2kXFTLxOgI3nTZJ7j2AgCPK3X02DIdZ19Nir7vOprAxtlVvUQ==
X-Received: by 2002:a05:6102:504b:b0:4bb:9b46:3f87 with SMTP id
 ada2fe7eead31-4dc64fdc5ddmr1421816137.6.1746535808591; 
 Tue, 06 May 2025 05:50:08 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com.
 [209.85.222.51]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-52ae3ff5d88sm1916262e0c.2.2025.05.06.05.50.08
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 05:50:08 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-8783bce9f84so141041241.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 May 2025 05:50:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVO86wM1TvFgavvacdxx1wzK6l14RDy9BxmWSsFA7z0JA+2jZ0Bfm1mhLMUhPqjgg6F7loDMggtLPaAvw==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:330c:b0:4bb:dba6:99cd with SMTP id
 ada2fe7eead31-4dc64fe3d40mr1513226137.8.1746535808032; Tue, 06 May 2025
 05:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250506103152.109525-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250506103152.109525-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 May 2025 14:49:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbeZPCCxqqU2O3J5K38ygJb2zMbuNq7mD0CCjLEgtPxw@mail.gmail.com>
X-Gm-Features: ATxdqUGlzOJWAzAM_swPtywTszF9Wt5U6k2_C5syW23x2Dms_5uimTdgJSqV7NE
Message-ID: <CAMuHMdXbeZPCCxqqU2O3J5K38ygJb2zMbuNq7mD0CCjLEgtPxw@mail.gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v3 2/2] clocksource/drivers/renesas-ostm:
 Unconditionally enable reprobe support
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

On Tue, 6 May 2025 at 12:32, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Previously, the OSTM driver's platform probe path was only enabled for
> selected SoCs (e.g., RZ/G2L and RZ/V2H) due to issues on RZ/Ax (ARM32)
> SoCs, which encountered IRQ conflicts like:
>
>     /soc/timer@e803b000: used for clock events
>     genirq: Flags mismatch irq 16. 00215201 (timer@e803c000) vs. 00215201 (timer@e803c000)
>     Failed to request irq 16 for /soc/timer@e803c000
>     renesas_ostm e803c000.timer: probe with driver renesas_ostm failed with error -16
>
> These issues have since been resolved by commit 37385c0772a4
> ("clocksource/drivers/renesas-ostm: Avoid reprobe after successful early
> probe"), which prevents reprobe on successfully initialized early timers.
>
> With this fix in place, there is no longer a need to restrict platform
> probing based on SoC-specific configs. This change unconditionally enables
> reprobe support for all SoCs, simplifying the logic and avoiding the need
> to update the configuration for every new Renesas SoC with OSTM.
>
> RZ/A1 and RZ/A2 remain unaffected with this change.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Dropped config check and unconditionally enabled reprobe support for all
>   SoCs.
> - Dropped Reviewed-by tag from Geert

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Boots fine on RSK+RZA1 and RZA2MEVB.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
