Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B019C5FB7ED
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 18:08:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 634DBC640F3;
	Tue, 11 Oct 2022 16:08:10 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C554C63327
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 16:08:08 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id a24so980846qto.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 09:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GWYVEJdoqXnCQWtfT0bzkIP+70WLbsk9ZN19JnMQZx0=;
 b=knWzrFxaglSBiHlwLMrZK+zOgKEtnU3K72eEGnOpfBMOKDwTCB1o5DFjMAX/q0UhNY
 QtDdN11oGw+99XS3Ki30jbEV3wnK3M/RZFgBzC756EJj6Qzp7bRwpx0xVlVivFLLMSoT
 OeFfvcAMzeUvMG2gk+zcXMcyojW/wbwfJ302GKQQDum8iO4SLMQHN5VVV6Lek8K2nrim
 ey4zQ7XwZHcjBefqfLYDvCN8aZemyW2QsFCvMONV+AY8yi+43sfWfso0dPvhCbF12v5/
 Zm2LP1ZxvniRrJK8KUjh3/YEL2QeZJReWqzdLohiEOSis5AiXvm/BDGrcU0o48e583KX
 k3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GWYVEJdoqXnCQWtfT0bzkIP+70WLbsk9ZN19JnMQZx0=;
 b=l5uqSVKwvw+ezlFBUvhKxck/tPQZnItZiX3k8vrxCvIPEUz5POynog/2yyHQpr9IUl
 bQgfwtVvPRBezZHGox8cOM5I6jnzp1TCIEOAM4gOeTOEjHC7un2sl24aAe0TFkc9PAPr
 DviSv3Auq/TdQYcVY3eyGgVliMQi7gf94EoP8fBsYg0EMxozSrS2dsDycHKMao4Wmm1M
 k2u5d8fqBhxYGOi7gUx0pcHNJIRtPVnOqZPN2Oyn9DJ7Q4X0kqV1YH47I7UCu00/1i0h
 +xhxl3qoD5tg43qtyDCUoqYLp9kgjjv00qh073N5vHE2ss0h7ORVP9Tgdl3LYpPA9CGQ
 p3jw==
X-Gm-Message-State: ACrzQf0CPEUqN5qFGy9MIwF+gbvCaZ4IOwtpnneg1Kwl+ZctijL9schs
 1nfRHYrIFdtEBNLzT6hCcL1/Tg==
X-Google-Smtp-Source: AMsMyM4tb/82A1JDAzYalVciziTjce/S19vvHsKcNbs5jARqscG7vKxacamXR2e1H5XtfAKSXhInbA==
X-Received: by 2002:ac8:7d49:0:b0:399:d201:840b with SMTP id
 h9-20020ac87d49000000b00399d201840bmr9746570qtb.309.1665504487275; 
 Tue, 11 Oct 2022 09:08:07 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com.
 [72.225.192.120]) by smtp.gmail.com with ESMTPSA id
 w8-20020ac84d08000000b00399813f4d5bsm5725686qtv.72.2022.10.11.09.08.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 09:08:06 -0700 (PDT)
Message-ID: <a9e5197d-78aa-4395-23bc-d7c3141f109a@linaro.org>
Date: Tue, 11 Oct 2022 12:05:51 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marc Zyngier <maz@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Kent Gibson <warthog618@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Thomas Gleixner
 <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Samuel Holland <samuel@sholland.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Prathamesh Shete <pshete@nvidia.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, linux-gpio@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-21-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221010201453.77401-21-andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jacky Bai <ping.bai@nxp.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, soc@kernel.org,
 Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Orson Zhai <orsonzhai@gmail.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Shevchenko <andy@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Scott Branden <sbranden@broadcom.com>, Andrew Jeffery <andrew@aj.id.au>,
 Patrick Venture <venture@google.com>, Sean Wang <sean.wang@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Avi Fishman <avifishman70@gmail.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] [PATCH v2 20/36] pinctrl: samsung: Add missed
	header(s)
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

On 10/10/2022 16:14, Andy Shevchenko wrote:
> Do not imply that some of the generic headers may be always included.
> Instead, include explicitly what we are direct user of.
> 
> While at it, sort headers alphabetically.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 11 ++++++-----


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
