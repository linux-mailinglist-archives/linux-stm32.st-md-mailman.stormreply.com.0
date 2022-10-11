Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED35FADE2
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 09:58:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 799CBC640F2;
	Tue, 11 Oct 2022 07:58:58 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 23BB0C63326
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 07:58:57 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id d13so1690645qko.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 11 Oct 2022 00:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jtn0EbueANzZWmHhe026bL4j5UVXLCdEUZ6RI8X4Iek=;
 b=aFDkaZ06eZIgNFDxYionyNjY54l3Jb8vc7xn8wqjYQg1G9prm3n/2iXgEXWGBySUYj
 pUlP9IplzOTLfdLVRJz2t64MEmWecbibwULcfH1pwRAhbzCUT0Qx8U3TYW66eGI4q6/c
 sBvA0JvIhzc4RrdJL1sC9mPLjvy5VKqBEtTknHO0sMPYsfXsHYgIFaeCifqn0QnJJCl8
 OtBD3hPGMvPap0eZdfXpScnJLFNtPJhYwQFzne+QiOxyRp0IMpjBBfzOvlF4jI3+xG4z
 TUQ5g3ho7KFLZehSEHD2JDhbDLF2SiZoJYtH+PqXJlhKnSGV+QNcPoRddxhrYbCrFF/w
 G1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jtn0EbueANzZWmHhe026bL4j5UVXLCdEUZ6RI8X4Iek=;
 b=s4v/342CUjrmycgnKtkYpw3pcfnMukLRrgwJ8kUUw5ybekoToPtEBEHCX9crgYJbWb
 YzxyefzZwkfBFiHNMCeJ62zfwGontBcYKV/p87qI/37JEBwC0dlDaUHaYmAayIzEkjSN
 xvrgNya7syX6tHvU4PJM4T8QJFIp0xHkRsjm+tSHCOmsg/O+wPZM5nqrRRL4ucAkRFuJ
 Q36Z4g1uFQNt7Y0jICBtXbGbn1IYEqYZBl+FZ2oU0aqyLvPAgdHqTGCKXK8BvwkwkSw0
 Gky8e91aMIweNU/9nV63Qx5giIlWA+4F/6ZfTvh5x62r9O+iv+Jah0Wgsx2X7oowGqCO
 a9BA==
X-Gm-Message-State: ACrzQf0cL3yXPVSDANeLJE4upY9xA5CEmWgAUBvrkPf1xQH7xCu0Byb0
 hwEnqd9EetRNm10fpAc812g7I+Eqm1RN16icxjU=
X-Google-Smtp-Source: AMsMyM58o2OPTuU9XUs+E07S0aK+hkv1wCI8/ogPlxh2cys3d+2tzM6MqnusgKv+Ub7ymEh97egvoHmX2MHd+yvD55U=
X-Received: by 2002:a05:620a:d58:b0:6df:ba25:4f5e with SMTP id
 o24-20020a05620a0d5800b006dfba254f5emr15325513qkl.320.1665475135994; Tue, 11
 Oct 2022 00:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-13-andriy.shevchenko@linux.intel.com>
 <4630d457-2d3b-6f66-7be5-54c84bdf80b4@wdc.com>
In-Reply-To: <4630d457-2d3b-6f66-7be5-54c84bdf80b4@wdc.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 11 Oct 2022 10:58:19 +0300
Message-ID: <CAHp75VcghxT6nS1kLjYbj5N3EBj2CukJ3zGKvFSb-Z1paj3-ZQ@mail.gmail.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Kent Gibson <warthog618@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@xilinx.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 NXP Linux Team <linux-imx@nxp.com>, Tali Perry <tali.perry1@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Scott Branden <sbranden@broadcom.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Thierry Reding <thierry.reding@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "linux-actions@lists.infradead.org" <linux-actions@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@kernel.org" <soc@kernel.org>,
 "linux-rpi-kernel@lists.infradead.org" <linux-rpi-kernel@lists.infradead.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jacky Bai <ping.bai@nxp.com>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Fair <benjaminfair@google.com>, Nancy Yuen <yuenn@google.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Chen-Yu Tsai <wenst@chromium.org>,
 Orson Zhai <orsonzhai@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Tony Lindgren <tony@atomide.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Marc Zyngier <maz@kernel.org>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Prathamesh Shete <pshete@nvidia.com>, Andy Gross <agross@kernel.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 Sean Wang <sean.wang@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [Linux-stm32] [PATCH v2 12/36] pinctrl: k210: Add missed
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

On Tue, Oct 11, 2022 at 1:33 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2022/10/11 5:15, Andy Shevchenko wrote:
> > Do not imply that some of the generic headers may be always included.
> > Instead, include explicitly what we are direct user of.
> >
> > While at it, sort headers alphabetically.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Looks OK to me, but the patch title should be:
>
> pinctrl: k210: Add missing header(s)
>
> Same remark for the entire series. You need s/missed/missing in all patch titles.

Oh, the missing word 'missing' :-) I will replace it locally (I won't
resend it because of that).

> With that fixed,
>
> Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Thanks!

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
