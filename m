Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1A3AC89D3
	for <lists+linux-stm32@lfdr.de>; Fri, 30 May 2025 10:14:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E50B5C3089E;
	Fri, 30 May 2025 08:14:36 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 641D1C3089D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 08:14:35 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-4064ec636a4so1000362b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 01:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748592874; x=1749197674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UODADZBFNNuhdOjNi7w1d1lWaPaCSwIUX58mKie6mVI=;
 b=Wxp78LOt3qelr9J1fY+HcJQvYSyovJsdTAoUWVvLdyJxcngtacrwKRd51W//GiQyxp
 kUCTos6dWRVOjGdhn6uc2h1lGCGDRxPM0zV1Q/8/alvsASU9Kk7bY//aClUt+K8mV78M
 dcWAsXiKnkt1Z14VzXtstNUIxIy/TPP4nGRh8uFUBD9FG7TfnmNnwUSHrD2AO8fBIv14
 HeDgiaFz6DbdnWVtIO2Mol9a5dNZL5U2DOgBatri3EItbMXWoeEgVH6CIHsEQGRknMOS
 Fw0eSeRNzoqT2V/SfhWVzL0aVXX3Ah3eg8Xshdl6EmVUqEaVNsnB007J7ENQZDgfIkJv
 x1Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCUp/QpYPiOgoJt+9KFenl+1HUBhPc4gy3wo4WzMVLsaMuXUw1IOF3S3K+A3hOq+8RzMzsuj7LCrTTnaSQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzQr1ClEu2hddKDRzsf2mZGwQWn4KlErVE58g1Y0wIyEHsVhgts
 HriqYsQHaYfRwY8b9BcBydh8SWL1mQRxo0+WXJeBaOAoULhFzqHd3AkjOFF71SFY
X-Gm-Gg: ASbGnctSoJGAdADA2fBNYDAmaMc1E9fS+3ZDcrSRn8L66OYQlFlHTP6Aq9rSVkvwOPF
 3eooc9o4AKjpdg9coY49Scp6xE79Un+5zUWAhCYxKV0PVlyloDaYdhbsNzUpaEukrXRhuxyzYL/
 VtyFSUD/CgX1ZJ/C/i+6k02QmdguJuXxtMpyhJKQGjb8989uY3BnWkPJZwHb3+Z3YOCJMO8HKt+
 EN9QFWDTYN6QE0Vo9nOqJxmjMjA0VtYQd3+ht0a9AP+FxwOydaTZ2VTnSu8gN0VQu5S/cbTgpxo
 pM7vP6isfZdMHtpMiwDM6EJg8hAy/DJODrmqXUJ3uT4UgLvOS0G3pUIpKSFQ69xJy2zMEeIs6HC
 Ba3kIr0eRZZhdFA==
X-Google-Smtp-Source: AGHT+IEJNDeVyecpeTlooKj3vsnx7dv4WMxJXJOugnroxpipvUyWjw8FNkova614Spi7l5IJrYaVIg==
X-Received: by 2002:a05:6808:6b8c:b0:406:67b7:8b62 with SMTP id
 5614622812f47-40679778baemr1422624b6e.38.1748592873737; 
 Fri, 30 May 2025 01:14:33 -0700 (PDT)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com.
 [209.85.160.42]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-40678bf36e7sm322792b6e.1.2025.05.30.01.14.33
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 May 2025 01:14:33 -0700 (PDT)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-2db2f23f174so922149fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 May 2025 01:14:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUCZHUnJBNrJw1A6NN+yU69DCWshDCzES5zzV2F5VtmplYaI72dr4+KYlkBtCAwoykxtselvbr4u6uGUw==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6122:17aa:b0:530:677b:1e93 with SMTP id
 71dfb90a1353d-53080df1088mr2012964e0c.0.1748592388616; Fri, 30 May 2025
 01:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
 <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com>
 <b6b7fb61-878e-4407-b964-564efb3524b1@linaro.org>
In-Reply-To: <b6b7fb61-878e-4407-b964-564efb3524b1@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 May 2025 10:06:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUHyLYk0oSN8XDNCXUvLQLe2u0k0noVJLbR+pYWDTB4+w@mail.gmail.com>
X-Gm-Features: AX0GCFuCNZIpijI8V-LFtD11RdEuCtx09JrM6Rph_c1WT65W3SrLJtlImd30cUI
Message-ID: <CAMuHMdUHyLYk0oSN8XDNCXUvLQLe2u0k0noVJLbR+pYWDTB4+w@mail.gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tali Perry <tali.perry1@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
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

CC wsa

On Wed, 28 May 2025 at 19:55, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On 28/05/2025 14:54, Geert Uytterhoeven wrote:
> >>         .pmxops = &rzn1_pmx_ops,
> >>         .confops = &rzn1_pinconf_ops,
> >>         .owner = THIS_MODULE,
> >> +       .pins = rzn1_pins,
> >> +       .npins = ARRAY_SIZE(rzn1_pins),
> >>  };
> >>
> >>  static int rzn1_pinctrl_parse_groups(struct device_node *np,
> >> @@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
> >>
> >>         ipctl->dev = &pdev->dev;
> >>         rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
> >
> > ... if you would replace this assignment by a hardcoded name
> > like "pinctrl-rzn1".
>
> I saw it, but this would not be equivalent. dev_name includes platform
> bus id, e.g. pinctrl-rzn1.0 which might matter here - conflict of names.
> Are you sure this would work fine?

There can be only one anyway.
Most drivers used a fixed name:

drivers/pinctrl/renesas/pinctrl-rza1.c: rza1_pctl->desc.name = DRIVER_NAME;
drivers/pinctrl/renesas/pinctrl-rza2.c: priv->desc.name = DRIVER_NAME;
drivers/pinctrl/renesas/pinctrl-rzg2l.c: pctrl->desc.name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl-rzn1.c: rzn1_pinctrl_desc.name =
dev_name(&pdev->dev);
drivers/pinctrl/renesas/pinctrl-rzt2h.c: desc->name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl-rzv2m.c: pctrl->desc.name = DRV_NAME;
drivers/pinctrl/renesas/pinctrl.c: pmx->pctl_desc.name = DRV_NAME;

It might change the path in debugfs (/sys/kernel/debug/pinctrl/) though.
Wolfram?

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
