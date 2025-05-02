Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF18AA751C
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 16:37:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 499BCC78F83;
	Fri,  2 May 2025 14:37:58 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com
 [209.85.217.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08FF5C78F7D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 14:37:56 +0000 (UTC)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-4dae6255c73so520520137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 07:37:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746196675; x=1746801475;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=djH4HCkZ8fHRpSMq+w9X5Wtnm+h0rA+LbETzrFeQVdY=;
 b=CkP+hyW4Z4G8mCcHPsckRcxPwODMOYdvtFbSJqR7n0T6fOWYXtjq5ims+wDDMZY+2w
 a2XbSty9T60XnDDgX1f6XyxVVfbkJx9k8OIkypyVJlRJM0ctHbcXrHnlGQ1RKaZVCPDi
 zNfrHepRYtt4k4EbAevWPpkmINKbfE3Hwku9tLWgz2KdA39Bgtdu1Q0DzLO6/CXdR60P
 5mx97kAWvNSqMcATIe6JQ+PYMRrma7Qhps+5xrD2EsV1dgWYvHxAdA4kjKfNtm/FD4E9
 ouftel6u2+S/ue9oh8cSmvGQly3R0z0KuXScDeT4q71EYL4RQ58OX5lxP5a4mDJD/yv8
 Q+CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFpXrs15O+2O7GBJvoDEAj159CGxhTQNSUW+dPmhpX9Ha7mXCvesHvQGWlThqIlkg0aGKrKoeAiB664A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz3j6eshwu2VTz+pfwqQ33qSfBeeT6bZdtyQu0yG5tjczsHdtna
 BaLjoPxKr3a1rJxFnHKBu3bJWcPDQkqtXN62wB370nrz56d5AeHymhJhR2oP
X-Gm-Gg: ASbGncvrYbFMl6vvv21uhM+rtN+tiugeWrjq98qzd+IbSHVCwixtwe4vfWd68Cv094I
 NPk6CD/bKDJaaXdq7uR5ynFYVPehLeaYURs9V3XfPF3elffGHW+A2XHDvoSKjUjGV9JysCr05xl
 jj+q6IUV3+RGhPLyAu7oMhsBzyqPBGfERUXZxSw1afIEhErxhbTOo+WjufdRVbCtMhdhbPOoehA
 0+N7yOctM7ot1GRfHVHSepfbyQllEoI+/lJkLS7tGsSJU94emh8tM9gUt4dfXZKnydBFTX99VSY
 hrpeDfRj54pUnvJsRIntdays0XvwavUG/xY6Hqeay9TK/W5IxlXsl+RBp3+hOd0ufllwwQHfMpo
 X5Ys=
X-Google-Smtp-Source: AGHT+IHVeMfMdX7+MxQ+Fe8r+N3lgHQk4CQ4AFQcPVurz5n4YS636qt0D6IB2x1/PQK9aQtuI+dPSg==
X-Received: by 2002:a05:6102:3c88:b0:4bb:d394:46cd with SMTP id
 ada2fe7eead31-4dafb66e4d8mr2149528137.18.1746196674530; 
 Fri, 02 May 2025 07:37:54 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com.
 [209.85.217.47]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-8780b293ed7sm297667241.30.2025.05.02.07.37.53
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 07:37:54 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id
 ada2fe7eead31-4c3036845c0so556784137.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 07:37:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXW37SAlB+ZpclhERow2tOVcLmTDaw7SwgPq/GkeRQ2VNZAjJDLeeq36jJgI1zEg++kYTO1tjkqfpq+pw==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:3ca0:b0:4c3:64bd:5405 with SMTP id
 ada2fe7eead31-4dafb4e491amr2229877137.9.1746196673576; Fri, 02 May 2025
 07:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 16:37:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
X-Gm-Features: ATxdqUGHGVa5bIvq47sWpJM4d0i9BJCZPMZeIzvLmuPiSn_UaSOHz6YGgg0iKKU
Message-ID: <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH v2 2/2] clocksource/drivers/renesas-ostm:
 Enable reprobe for all ARM64 SoCs
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

On Fri, 2 May 2025 at 14:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Change the OSTM driver's probe condition to `CONFIG_ARM64` so that the
> platform driver will defer and reprobe on any ARM64 Renesas SoC once its
> reset controller is available. Previously, only RZ/G2L and RZ/V2H(P)
> were covered.
>
> By matching on `CONFIG_ARM64`, this avoids adding a new config entry
> for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (ARM32)
> are unaffected-they still use OSTM but do not define a resets property,
> so the deferred reprobe mechanism is unnecessary.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Hi Geert,
> I've restored the Reviewed-by tag from v1 with your suggestions applied.
> I hope you're okay with this.
> Cheers, Prabhakar
>
> v1->v2:
> - Instead of adding config for new SoC, changed the probe condition to
>   `CONFIG_ARM64`.
> - Updated commit message
> - Added a Reviewed-by tag from Geert.
> ---
>  drivers/clocksource/renesas-ostm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
> index 3fcbd02b2483..6a5785f9c9c1 100644
> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
>
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
>
> -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> +#if defined(CONFIG_ARM64)

Sorry, I've just realized RZ/Five also wants this.

"#ifndef CONFIG_ARM"?

>  static int __init ostm_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;

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
