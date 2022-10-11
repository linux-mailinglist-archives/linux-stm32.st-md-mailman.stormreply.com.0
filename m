Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 433455FBC79
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 22:56:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E40CAC640F5;
	Tue, 11 Oct 2022 20:56:18 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 16769C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 20:56:18 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id b15so13547765pje.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 13:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AcPVh42qVgkJBf4RM2Ey0P8OhTX4x5A+uHddaUsQ6Co=;
 b=DlfaPAoLX/0Jb1SsUAFBMfuYimfDeLB1Gs+lotFCf5wX/xRNwwaeEjZ5ki70F0YSfL
 rO7wa9sBAK38Fitsjr8wWeGaTbB17rWj/5uv6Qggo2NMYLqZ3T8nbfHPEpUJcQu2bQ5S
 2uJcOyvVHU3GCMrUVyQTjgWU857w+EEMu3KOOXzRP0sBYb9WpwXPa+bHwKfdWnDYL1IZ
 sjB2VBMKHp8LTg0LYEtI3ZlOLTHkYjnwE1T4zHOamUMrxkhqgzXrSXOnblYNQPKxo6AV
 GmstnP6z2i66RfbJJQ1IzTNkzjBUrVnp0pu77wz8fvzBSAWlB5mtP7EKE8gyxWRookcL
 WWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AcPVh42qVgkJBf4RM2Ey0P8OhTX4x5A+uHddaUsQ6Co=;
 b=R1YXPM6PrQ9RoBvMF9SAJR+z9UCg78lLj6G6CarOskc/qDi8XQErft/jJ4Tg/ikgcx
 3lQwh+0OwFjjjayWtAX2iGGwHhYlD8eeiUywBRxlVfI1L/d56lSi0Yvn8C2oUNgMvOJx
 p6OkZGKPz0EdGEApT3XU0HsMhVycYOKn0dLfTCgX5AMsGsO7jFdiXSsrfPXYQy/oZZ7b
 X4P0mEckD2hliTxCiddH/R8X5sL+Uo3iEvjM+e0a9sOOS/XLdPpPLm8LXHDyowUW1jZh
 TWg928Ueuk3k/Vh5LGx2VKoE6GZzJsu5SWFoxDjk5UDvBQ7pvtiEF3S/Uf0YDhDFryoH
 0cog==
X-Gm-Message-State: ACrzQf3LZAeTv0vhzVNF6W+hHQ2fU8FZW2z+53L3dCjG/lOS9TMJpHdZ
 ASCtLdr8zD13tihlDDwTmqs=
X-Google-Smtp-Source: AMsMyM5pIEdsgeht0NOYcyruIBhuS4NISKYBTrmuG1I0+RU2v1LFNfTy+oB9jcY4eA/I6+ThSmPvTg==
X-Received: by 2002:a17:90b:1bc9:b0:20d:75b8:ee5d with SMTP id
 oa9-20020a17090b1bc900b0020d75b8ee5dmr1171628pjb.147.1665521776548; 
 Tue, 11 Oct 2022 13:56:16 -0700 (PDT)
Received: from ?IPV6:2600:8802:b00:4a48:7467:a6d1:4211:7f63?
 ([2600:8802:b00:4a48:7467:a6d1:4211:7f63])
 by smtp.gmail.com with ESMTPSA id
 k207-20020a6284d8000000b00537eacc8fa6sm9403022pfd.40.2022.10.11.13.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Oct 2022 13:56:15 -0700 (PDT)
Message-ID: <0684f480-2092-d520-2c8e-bd9a2dca47e3@gmail.com>
Date: Tue, 11 Oct 2022 13:56:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
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
 Tomer Maimon <tmaimon77@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 soc@kernel.org, Viresh Kumar <vireshk@kernel.org>,
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
Subject: Re: [Linux-stm32] [rft,
	PATCH v2 00/36] pinctrl: Clean up and add missed headers
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 10/10/2022 1:14 PM, Andy Shevchenko wrote:
> Currently the header inclusion inside the pinctrl headers seems more arbitrary
> than logical. This series is basically out of two parts:
> - add missed headers to the pin control drivers / users
> - clean up the headers of pin control subsystem
> 
> The idea is to have this series to be pulled after -rc1 by the GPIO and
> pin control subsystems, so all new drivers will utilize cleaned up headers
> of the pin control.
> 
> Please, review and comment.

Did you really need to split this on a per-driver basis as opposed to 
just a treewide drivers/pinctrl, drivers/media and drivers/gpiolib patch 
set?

36 patches seems needlessly high when 4 patches could have achieve the 
same outcome.
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
