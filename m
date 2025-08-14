Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2C2B26A93
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 17:14:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CA9BCC35E2E;
	Thu, 14 Aug 2025 15:14:08 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90CFFC35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 15:14:07 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-30cce50b75aso665215fac.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 08:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755184446; x=1755789246;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n9du/Bs1Vwkuk15qOOpl62+YeIchI37tbTZ/WdEUy2s=;
 b=CNOs2Y0sepMboHXpS9jJFOj7htS+ZMuIOYIZFmYI3JthoqGS1QRzNxum/K/x0n18Mk
 8v2cT8RDr3jMraetwRGaEJnbsPYE0n1jWIVGCzLUhDtZEUqMCK/gVUel/Qy0nFUPmrLi
 S65Q5eZeXhYrnxxPZtegP3waqvTJK/gnsYyJJpFxcQp9CMBtpOqxqYh0hlt7PbASJrSn
 O00t97FjRfLyRBEq75OVajb/z7b26MZv2h8deqHrltNSP6b6+jTfKsPti4ln/lJ2Ze6V
 /HxNC3RNzWzxs9XybxRPQO6/YOsQ/zw1rkErkWDsZSca6oIayyHk4IiJcjqFEI0WUUdv
 60bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7syVFLDEW55Iz/e1p45EYFo3dGRdW9Aq96TO9G9LqwysTH6i5gU96v8o0773o7yUNwxzddYxaa96Nag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUfAukvKFg9zMYFZauCJVX43uLiVMk3u0ZqF8CkWkjXSTLtwUj
 lfhJViErr9UmMA27yFr5izdjmu+QZIpXuyPPOji0TRC8voMAS8jciXzDFIXSK96j
X-Gm-Gg: ASbGncvjrpX9D8F8e+gmvUj5E6EDm9T7r3Zep5PzZqoISWEncWjmR6ejifSYkuPHKtn
 aONMAPF6/xbCTnMXfYICxEGKXuw+k1qVCsPVdaZvn6N+z8XuVAhgcaUa9xK+xmeiunw/+la9S21
 w1VMyUXEB5s4nw7uoHfNZnpz24QezPHlvmDaCoPvEgL2KBs++LCnKJFhjY+8uUaENIaZJ81YdeR
 gIrUUTmCvxi+L8h5ZljpTHGcau+XmELL3hXGcjO61w3dw4Nf2zj7oWkwIrvWH6p5O0h1iMCZ5Ss
 A5AnDesAAgxbRaYBGXz+gWJt6JDziESnvCILhy6qV8fmkjdFEtOdOlWx+MJoliusPRPPDIxwa1G
 ZXCCPRZqluyIdjjbWmw/vnBx7zzj1pDtByWV1AQspuHu1XlQf3l0tB4sjrBsZGGDPA5UJU9Q=
X-Google-Smtp-Source: AGHT+IHFS+evJjv6fmn1Ada/KEwPfQhb+kpZZKGNnJoBAmw0azA74iublzMw6tZtzp/nLp+phwXpug==
X-Received: by 2002:a05:6871:821:b0:2d5:336f:1b5c with SMTP id
 586e51a60fabf-30cd132f931mr2201308fac.34.1755184445913; 
 Thu, 14 Aug 2025 08:14:05 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
 [209.85.210.51]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30ccfdf50c9sm716971fac.3.2025.08.14.08.14.05
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 08:14:05 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id
 46e09a7af769-74381dd4c61so494678a34.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 08:14:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWuyundyPlNzIZHGrfoY8OeO39K08MMMmjalh+gY0/MKPK+BFg4ZQa27XphPJ2TBNNujP1u/S71pdKGVA==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:690c:700b:b0:719:f582:be17 with SMTP id
 00721157ae682-71d635fe81bmr48846567b3.35.1755183986689; Thu, 14 Aug 2025
 08:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-92-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-92-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:06:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUR9phiPyhi9=f3gdA_f5oRmaX=ucj8SUquXQEq7bUTkg@mail.gmail.com>
X-Gm-Features: Ac12FXzt8_e3pGt50aBSDpwDZhCGVBhDLrUDheSmsSXHpMoy_pb5BR_R7aHtEdE
Message-ID: <CAMuHMdUR9phiPyhi9=f3gdA_f5oRmaX=ucj8SUquXQEq7bUTkg@mail.gmail.com>
To: bmasney@redhat.com
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Daniel Machon <daniel.machon@microchip.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, sophgo@lists.linux.dev,
 Alex Helms <alexander.helms.jy@renesas.com>, Sven Peter <sven@kernel.org>,
 Qin Jian <qinjian@cqplus1.com>, Scott Branden <sbranden@broadcom.com>,
 linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Inochi Amaoto <inochiama@gmail.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Daniel Palmer <daniel@thingy.jp>, soc@lists.linux.dev,
 Viresh Kumar <vireshk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org, Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>, UNGLinuxDriver@microchip.com,
 linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 imx@lists.linux.dev, Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Fabio Estevam <festevam@gmail.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Orson Zhai <orsonzhai@gmail.com>, Keguang Zhang <keguang.zhang@gmail.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Ray Jui <rjui@broadcom.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 spacemit@lists.linux.dev, Cristian Marussi <cristian.marussi@arm.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, asahi@lists.linux.dev,
 Sudeep Holla <sudeep.holla@arm.com>, Romain Perier <romain.perier@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Shan-Chun Hung <schung@nuvoton.com>,
 linux-riscv@lists.infradead.org, Janne Grunau <j@jannau.net>,
 Chen Wang <unicorn_wang@outlook.com>, arm-scmi@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Takao Orito <orito.takao@socionext.com>, linux-mediatek@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yixun Lan <dlan@gentoo.org>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 092/114] clk: renesas: rzg2l-cpg: convert
 from round_rate() to determine_rate()
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

On Mon, 11 Aug 2025 at 17:19, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.18.

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
