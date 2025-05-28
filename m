Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B8AC6969
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 14:36:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA444C36B35;
	Wed, 28 May 2025 12:36:37 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BC84C36B31
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 12:36:36 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-4c4fa0bfca2so1224270137.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 05:36:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748435794; x=1749040594;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EttMl+UEO23MQ5/zgKZh51X1fkqP6brx9qDrKYFmyoA=;
 b=mWD+9PFsTwB4qz/Xe6i1KE4f8M2d6KQ2rg4Vqp7+qiMpNqCas0qL3v7+P+f4EeSM5h
 8az6Vd7LcghOmaIPuDOxR/W+tj1R/Gr9mi7856eLkmf38SX5lEid02b9V5GjXIw3S5ka
 e37MlRILqN2z1155rFhWPcfQMPtGVmfZxDsgQUxtVMIvT9n0bx0BuVPBrq1mww0izzd0
 6bWcqvA8y7VRoGnsIaG+ynZuR4jk9COO3WRgkXJBExpxZQi+BX8u5h20oFY1lNULfm20
 or2Ri4ihBC01dnKBsHwq4yOOXI/lnqeJSiSFiUeb1likluAURWIKOm4X5jM4fLhAOeSQ
 LLOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxOdLhvQEtotfAETmsmHidqJESaJA1VG+VwX2CrnnJgswOTPiNIvPkCGSdBBWuH85sRNAG/wN+enXQgA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxjgD9DB2kjLdkiypk5mG1B8Jr5SNG0yoIN/BdYkn4KvYiOyXRc
 jcn0I4axyoaTWY/+fkdhXwNgxNfh90TAlMLM6jBpI8wHIWcg7V0KipZ3NHgZWsUB
X-Gm-Gg: ASbGnctefnucCe50TLKR+5GbAKmtcY1hZouKnLqCS57H4oHa+8YQB9o0s2URdFs4M9R
 AZFfJnnP5mwKlWiyOFnSDwIOZfe7X1QxmaKQkbHuIW4rpxCE0e4QBYZ/2hkAaL2pLyDRWlk9fPj
 BAIqfHSP4EMZBa707GRniY4Clrebq+44Pd8P1D5aJeSFksA2kck5WUwtui2fo+QGHyrFqAz3Hul
 1hJFbi8S8HE9ut4i5bL+EEbSf/9AG3V5qMkO37i//EhY9OUDaA6DKbqThIdADSxRL5nofp3CuPZ
 n9e9I/7WTmd4oRIxxCzdtDLvmHHMKriJOKoyE6nUl1Xf35c5Xrcd3nv9YLKbxe48Rxw1vNs3wTI
 4/sMQMZ82D/zQMg==
X-Google-Smtp-Source: AGHT+IFvXQ6Ob/7SxNDSHcV5y65c+84RaMHCSAX0K6YcdQ2Y1uyVDBN5eb0mN0cg1GtZ6+50Po/zPA==
X-Received: by 2002:a05:6102:6f09:b0:4e5:996d:f23c with SMTP id
 ada2fe7eead31-4e5996df9bbmr3347810137.20.1748435793722; 
 Wed, 28 May 2025 05:36:33 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com.
 [209.85.222.44]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87e1efd0ed0sm740651241.7.2025.05.28.05.36.33
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 05:36:33 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-87de8a14cd7so1290248241.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 05:36:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUweCFBAv14qzbcZBswlyLIlIvBk0Dd3mH/aVGOx7TSPD2T7HJB5+uK9xiz0BR7Ja/FE0eGmyQdMN7MYQ==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:3e95:b0:4c5:1c2e:79f5 with SMTP id
 ada2fe7eead31-4e42415db7dmr12024574137.16.1748435792883; Wed, 28 May 2025
 05:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
In-Reply-To: <20250528-pinctrl-const-desc-v1-1-76fe97899945@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 14:36:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
X-Gm-Features: AX0GCFvOxqSsQb6hAAUjvGh24-ydFSS3wze_W2Lj6wpwfm4mEoNhN1lAYOnpqvg
Message-ID: <CAMuHMdX7krbAssbYpJ1RA1EkpOP26nUhuhmtSW8X9nJkB5amBQ@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 01/17] pinctrl: starfive: Allow compile
	testing on other platforms
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

On Wed, 28 May 2025 at 12:41, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Always descent to drivers/pinctrl/starfive/ because limiting it with
> SOC_STARFIVE is redundant since all of its Kconfig entries are already

... since its Makefile doesn't build anything if no Starfive-specific
pin control Kconfig options are enabled?

> have "depends on SOC_STARFIVE".  This allows compile testing on other
> architectures with allyesconfig.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/pinctrl/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index ac27e88677d14f1c697e0d0be9f295c746556f4d..dcede70b25660833a158c298d1269d6ecea9dd8b 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -82,7 +82,7 @@ obj-y                         += sophgo/
>  obj-y                          += spacemit/
>  obj-$(CONFIG_PINCTRL_SPEAR)    += spear/
>  obj-y                          += sprd/
> -obj-$(CONFIG_SOC_STARFIVE)     += starfive/
> +obj-y                          += starfive/
>  obj-$(CONFIG_PINCTRL_STM32)    += stm32/
>  obj-y                          += sunplus/
>  obj-$(CONFIG_PINCTRL_SUNXI)    += sunxi/

The actual change LGTM, so
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
