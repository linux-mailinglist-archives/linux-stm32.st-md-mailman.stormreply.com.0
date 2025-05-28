Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E364AC69D7
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 14:54:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 34BD8C36B35;
	Wed, 28 May 2025 12:54:58 +0000 (UTC)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com
 [209.85.221.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0AA19C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 12:54:56 +0000 (UTC)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-52eec011ff2so1377493e0c.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 05:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748436894; x=1749041694;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IbSvaL2uho5iBNc6UnxSmb8ikoxZVNAuMK5QOEf9/rc=;
 b=qmKgtbqdbax/+oAn1czkl343C7G2bM/pAsPxo+OA+u5THXZIPF/n1aV23iUkSM/El8
 GbrQiCUb1dJgQbY/XLZL2rfdb58ZvliKAIsBKV+SVE1YTKmchkJ2el9t+qqClkBT6uXY
 iqGrpgIT/4ro6QsuxOefyv2jIhq+/HDcr3ItUX/MgsdjVUyiImpyaj7J2ZZrME5Fed/O
 cmM96+AhEAKLBKxPAZ3Xu9VPvdSY2WU338hIPpBion5PB+6hUcgkB6ySjpw7D2VkbcVq
 5DglolQKCcdDLGo5/uzImEflvGsyU+RcmIfOnTPoakcm/3tfrie29fhblMQ4tinP0h6q
 N6BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQjvd5wSRwMCWXxdr55SAik8Hh4SQSy0qEoMN00QvDjU8GhUljks97L+ET1kFjPoMth04K4ihGrotiWg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxnRmtC1pCMsgtIchkOzJiddEBEUNaPoQptNF7m6YIQ5JomcSXo
 wyk2UtodlkPR+5aicAs9NAQPLXDF87M99lyJ2ar9QYMHctED7xYXcBhb5Uuy5BSv
X-Gm-Gg: ASbGncsjdnPh50EV7HT0DL1yJzhAAqdhO+SFGW4hregnngs9Zr6y+DE41wifrffTJpZ
 1VIRc3ZzHz/thdzB5k68Dto+l1/8RRwUrWSuD/Cs85DRs/MBTa15gZ2pU76pc68n4dKpQqIZdNR
 aZ9zlmcYShd9eZK+EFarYmI7kRY0yYEyTUSJx43snoucyrqcoX1LLjBphYzEBDX30A6Q4FqDlqu
 rrwv6wi6Y+jDbHbGTZaHpBsYz4lvoZW8XOPm9pc1+U2vkwjcBRLNa9ov4NiKK6KcF9TJPep6pER
 UTa1RCMCA2ExShmSFU6SbP6K+d1XSxSJ6cp87etkluIJkB4Ym1dn7AMho6G1ORgflWQDzzJRHJH
 wOQc5C2jNHTIuoA==
X-Google-Smtp-Source: AGHT+IHC0x1ocUlqX0WJPNlj4xAM4b/3zHLwtHXzWcRTR1N75XSNZrVA8tR6LiRRWAbyOr3OVInkPw==
X-Received: by 2002:a05:6122:2986:b0:530:6bcb:c97f with SMTP id
 71dfb90a1353d-5306bcbcb83mr631464e0c.8.1748436894120; 
 Wed, 28 May 2025 05:54:54 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com.
 [209.85.217.51]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-53066843ed9sm912687e0c.7.2025.05.28.05.54.53
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 05:54:53 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id
 ada2fe7eead31-4e5962a0f20so465291137.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 05:54:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCW2dQOSW4ZPFn+jAu/pLdfTgysjoTBVaMfOod1jQuLc2tSE3WoLzVEjE7wlMKmNv6LvjbTqDDCUnMstJw==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:2911:b0:4df:93e0:fb7 with SMTP id
 ada2fe7eead31-4e42419b8c0mr12541235137.25.1748436893682; Wed, 28 May 2025
 05:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:54:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com>
X-Gm-Features: AX0GCFu5yojjEPsbiWTwjJJQ5khyE5KBTwGS5B0aqZkGtvZvOhYOGPRkjlMB-4Q
Message-ID: <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tali Perry <tali.perry1@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-aspeed@lists.ozlabs.org, Emil Renner Berthing <kernel@esmil.dk>,
 linux-rtc@vger.kernel.org, Jesper Nilsson <jesper.nilsson@axis.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, Hal Feng <hal.feng@starfivetech.com>,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Scott Branden <sbranden@broadcom.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com
Subject: Re: [Linux-stm32] [PATCH 14/17] pinctrl: renesas: Move fixed
 assignments to 'pinctrl_desc' definition
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

Hi Krzysztof,

On Wed, 28 May 2025 at 12:42, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Assign 'struct pinctrl_desc' .pins and .npins members in definition to
> make clear that number of pins is fixed and have less code in the probe.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c
> @@ -680,6 +680,8 @@ static struct pinctrl_desc rzn1_pinctrl_desc = {

This structure could be made const...

>         .pmxops = &rzn1_pmx_ops,
>         .confops = &rzn1_pinconf_ops,
>         .owner = THIS_MODULE,
> +       .pins = rzn1_pins,
> +       .npins = ARRAY_SIZE(rzn1_pins),
>  };
>
>  static int rzn1_pinctrl_parse_groups(struct device_node *np,
> @@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
>
>         ipctl->dev = &pdev->dev;
>         rzn1_pinctrl_desc.name = dev_name(&pdev->dev);

... if you would replace this assignment by a hardcoded name
like "pinctrl-rzn1".

> -       rzn1_pinctrl_desc.pins = rzn1_pins;
> -       rzn1_pinctrl_desc.npins = ARRAY_SIZE(rzn1_pins);
>
>         ret = rzn1_pinctrl_probe_dt(pdev, ipctl);
>         if (ret) {

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
