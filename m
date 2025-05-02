Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 74244AA7111
	for <lists+linux-stm32@lfdr.de>; Fri,  2 May 2025 14:02:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 233E6C78025;
	Fri,  2 May 2025 12:02:05 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8C116C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 May 2025 12:02:03 +0000 (UTC)
Received: by mail-oo1-f48.google.com with SMTP id
 006d021491bc7-60219a77334so1007089eaf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 05:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746187320; x=1746792120;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MY8XikeU0AVzM/KkOL4D4V6UOM1fbLtQGUrNKfsnaxY=;
 b=vbRJgI9a1FW2hlryfbwCSdUrQ2dMUbYeBrk7IFtDaAHdZg85b+QzmGrEAWkYarqw5J
 IKqxQICROPtZmiT8Sjrh8dSOSRG9rKaCfRIV5yn5u5UDy9AfF+WdGjgv8shagpHKY1ir
 tiU7uWbu69+qKW9KKRfq/pWwsrZG00jkQTKZZcZG5DrIjGSim7ilNfKTRuTwzGW8Z+2k
 inxWP61k5ojM1cnJjDO5GlrDvPVjqbY6dn/t1GYOMwmqyPA0jdI+Drgu9Gm4ZRQhC+el
 knpwUafPt5kFUvlKK4l7tAV+lLnIYqYI5HeAsMaxMcSlmT2057sTE90xK7PTXkGDvwN8
 hGdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe6O3aBt2ZF/TgAx29GYuO2DIQze3sCmHmjWGyHrwagw6NZrMN6g6+DsZkV4Gj0SDaq+aVwWhf+/okFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzTvxHqzCwP3cEbuckDUAEitI1ov7f6+V9O6bttKxn294jo7VCu
 sdyP7LBxNQi7iLDKqdswOMIgy2fyC8mQZKLUiqKylEmcobjzLigBPa5X7bmz
X-Gm-Gg: ASbGncup7nM4nU2E52VfXTyCOvUXBUT0EaC8hkeVe3lJyshhi3oDwS/X72yALJWGMP/
 vjDLwoRHlwLI6iL5IdXw021PYHwFgzXHpivKycLEHTRB3pMUwZNgaZhwEd/iilCQLPvmStJwUYk
 N2pEKmNN8Z+qNF4/Xp38QBTOHUKLgkAvGQePdN4MSu8KtUE52oj4jTmKuEN+GdCPxfvir72jqoH
 Fg4GqRqrOjq5LJlJyLITp+txqzxls+yZyjMBtjQYJIFH91vuk4bIXXRXKEkdQfDR8gN8BCDhrFD
 PlKwhZr/dZWDVA4X+GpYNdt8Jkcfj6QfwiDQckpzBwm0tdqHIErdmKkXBqRhJfgvWWza7ikUQww
 NQ/muO/XupMG9bHwEKQ==
X-Google-Smtp-Source: AGHT+IEpuohKvEQHrtfB70g/bJWUJs0FRSuyJrEfIQ76+2CiZng9PLbm4MU/Lqyml8o6MhIYn+cWuA==
X-Received: by 2002:a05:6820:c8c:b0:603:f2f6:fd41 with SMTP id
 006d021491bc7-607ee7f84a0mr1413846eaf.3.1746187320495; 
 Fri, 02 May 2025 05:02:00 -0700 (PDT)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com.
 [209.85.167.180]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-607e7cab6f0sm498026eaf.5.2025.05.02.05.01.58
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 05:01:59 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3f7f7b70aebso1422207b6e.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 May 2025 05:01:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUPga+VqU6T5sito62IHD0RvXpscPlNwM9ydClAAHmImnMpikU2pOu3JxJ55DOSTNxLMFJrLSb/UZ2ZMQ==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6808:182a:b0:401:f4e4:5e0e with SMTP id
 5614622812f47-403414b6397mr1305952b6e.33.1746187318706; Fri, 02 May 2025
 05:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250501123709.56513-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250501123709.56513-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 14:01:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
X-Gm-Features: ATxdqUGawMLisO3F1rvM5sjYPkJMq15HZKLhxKiBy_fyPwGI47XSqoAGJERmrvE
Message-ID: <CAMuHMdUWCEgwQ39f8wN2FobZK+0BoyXNm=eKfmYs50sABwomvA@mail.gmail.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/2] clocksource/drivers/renesas-ostm:
 Enable OSTM reprobe for RZ/V2N SoC
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

On Thu, 1 May 2025 at 14:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add CONFIG_ARCH_R9A09G056 to the probe condition in renesas-ostm.c so that
> the OSTM platform driver can reprobe for the RZ/V2N (R9A09G056) SoC. Like
> RZ/G2L and RZ/V2H(P), the RZ/V2N contains the Generic Timer Module (OSTM)
> which requires its reset to be deasserted before any register access.
> Enabling the platform_device probe path ensures the driver defers until
> resets are available.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
>
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
>
> -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> +#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057) || defined(CONFIG_ARCH_R9A09G056)

What about simplifying this to a check for CONFIG_ARM64?
The only SoCs which don't want this are RZ/A1 and RZ/A2, because they
are Cortex-A9 and thus do not have the architectured timer, which is
mandatory on ARM64.

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
