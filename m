Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BFAB26AA3
	for <lists+linux-stm32@lfdr.de>; Thu, 14 Aug 2025 17:17:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 283A0C35E2E;
	Thu, 14 Aug 2025 15:17:16 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D8EE4C35E00
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 15:17:14 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-30ccea8a199so1122999fac.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 08:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755184633; x=1755789433;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=umiR4j7DjLNlMEowdV58E6T5tLX87kYcXiEtAZnwsfI=;
 b=UTOIeNjis4H9xjfTQ26FE46SAAf3WcMAj5RuLlrCnPLnESfYoqM+1owHlYLof3NDXZ
 ezbm7ir3+IEEJwFIQljePjMdweh7RxCLbY9lqaVkVAvFwKr39M8SgLn4W4WsI2aEgha8
 8AClE2V/L65e1WnWt8XbSDI82EeN1z90d1Q1bggTlaysFcZBHU07on/LHiPtN7bDMJqB
 CuO0ngHG4TblasWRRpBdu8dvOypOWl6iGg/X+UV/T+mixNTDzMnd3BnLyYi/xe3jAilz
 WkQpdUygpRGaRQDgAG/bEWzwYLbSKgcnz03kKLHx/biywHcpLQcEKzW5Q5zNaXo/NWZt
 Gc2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhk3qQSpUkE0ebVpnnLk+q/XQZ1IQhkvGsPN+Jz9sMTmeqa2dhV3togIs3kGP/VwdUpGKvStR5ECg8pw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwJ67N+R9Igcd96Jw4CUuF/uUDhRD6SIbdHZ5MAj/BKxuCoZgxG
 Cw+5uzx062G2CU5rmU0m1oAStJeWnXNFZ461KmQqrQGy1mHYiho7MXB9JdKsvV+i
X-Gm-Gg: ASbGncuWDflUoARd48BoA7tPx+oBCa2vhD3FVb4HxIOjhAbReIq7YImv2pZuz1TTD+m
 NcND//HglwjvAvSu9FtMHjodnuEtjP19nGS4WMUa7UMso3bB6djH1WGqs+1svvRxI8rk9MFgsoP
 GPAvzVqD1U+ljjBMEgiWhwXtOKMus1emwnkRhWYgJbTGWoSd0ZwyvskNW4GkhN9pijKi6Mxq2Dr
 AXWyrvvv8t9BCTzvkhoAvdaxJl/9gjXd4ZbHz/2QveelPPMHoTMt9PsT6uzW7W39EXCv8RJ2U2d
 gbTvK/lFDWM+y6fcZch6n0RucrLhbH/FVsA6qLdgbxygGYYSugaO7BmYG9BxNzZakCXoHO+mnUG
 VkCmJP9Bfbk60iRixHbVqUI/fp3PMsVDByx9+5mDFNy0hqRQb5NiDxLuBx1gCxdEy3yhR6jM=
X-Google-Smtp-Source: AGHT+IEvyJV+pTGriPT5vetSMx95jRKDxo0KOIWbCgzV0PVVw2uqXORQMLmIi+C7KBvzEnT00mhOiw==
X-Received: by 2002:a05:6870:f694:b0:30b:66b0:becd with SMTP id
 586e51a60fabf-30cd135a8c7mr2271660fac.27.1755184633283; 
 Thu, 14 Aug 2025 08:17:13 -0700 (PDT)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com.
 [209.85.210.50]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-30cd018da90sm704968fac.32.2025.08.14.08.17.13
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 08:17:13 -0700 (PDT)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-74381f217e7so744937a34.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 08:17:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWLVYFxjmjY+Yc+LLKYyLP2x1VaD603Knvq7yukXhe6SjKk9ALPJ+BJbTCyUL9DCUhLvE8rxBMiBZzCtg==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:4192:b0:4fc:1484:5500 with SMTP id
 ada2fe7eead31-50feb4013d9mr1289391137.21.1755184278470; Thu, 14 Aug 2025
 08:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-93-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-93-b3bf97b038dc@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Aug 2025 17:11:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUpmdSzNcUOgjWLJhH6+5FkPEF9uruqGqbk-u0SC5z5wg@mail.gmail.com>
X-Gm-Features: Ac12FXzyDBZHsviTnjmg5miZS8Vof98mQ5mu_iqWAq-BW-zvBlKCQTg0qFd90xs
Message-ID: <CAMuHMdUpmdSzNcUOgjWLJhH6+5FkPEF9uruqGqbk-u0SC5z5wg@mail.gmail.com>
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
Subject: Re: [Linux-stm32] [PATCH 093/114] clk: renesas: rzv2h-cpg: remove
 round_rate() in favor of determine_rate()
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

On Mon, 11 Aug 2025 at 17:18, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
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
