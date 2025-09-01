Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33434B3DF27
	for <lists+linux-stm32@lfdr.de>; Mon,  1 Sep 2025 11:57:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41EE4C3F949;
	Mon,  1 Sep 2025 09:57:52 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 60D31C36B11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  1 Sep 2025 09:57:50 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4b32c1fdcb4so13807441cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Sep 2025 02:57:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756720669; x=1757325469;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5tFy+S32zcH8SOQI+WY2rqVzMFSU7CQi//EUuweLF5I=;
 b=icEYc0csj5sGmHsSs54IK7nUELt3azhTJeSm37gg+9fg/L6tpJYadB++/Mhg4YgYkH
 OcwGVnedd+yO+Q+HdItP3CtjGj9HXM35ktuzb6H87Fit+Qy1+iZJcYFH/dKn/dlCm+bd
 XTz+y8kexT6X4+G4N4MvN7kTvDGe05CcPDy4VMBYJgoFawKA0QYGVKDzv3+fQNIaOGzz
 3hfS8gvpsLGbfPLzE7x2DQs14LjAT4M9r+lxKmwhoyGRkIkY3XTz0AigSfc+6ivVf6Ni
 H2UKTSS/0dPzLItVOLnnhOCxkc2LCOanxl90C/60WThu3XvylQRQR+QzI+akEb6fohbG
 8SKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+8rCjACB9ftdb9aT95Hj83SF1dycfvOSScZri3PZqwO7J3aPr0dhJTAlOpz48i/XZkJoiYObu+T0wAg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyWHBTze+XkvYj0gLKlODn9lhnv108/RwdfDvj92ekSCJS3T5cy
 3MJwGF1xmu8cCuSa1MwsFB0fzvEej5hGPR+K7OEMpKdEk/bZnZWQEYGoR7yiI0pw
X-Gm-Gg: ASbGnct6+lX+MWrnZ4W3EfMXIZV9FLqQwP1f8QoTrt4WBN6kmBtz/UTNlUBghZGMZg0
 EwTeUerhdq2rIlPvNluwihWWfxedDrEsmkyCRbvVGj7MCjCK54oYrYu5lU23DcvIMhfiQYzAGiI
 bE7bvKPejZ0UbEsC4roHuTOcLd8kPlZb0z/WCHWhN4M1MvD1N0K6uCOPUDsMEUvesRMj5Bl/lQg
 rvnVZhRuHF4ZJDMOn+7Kt3/Fd7eHPIF/OfG+RNv4xiXUfBFmd5jYlr8lMdyq1b0vaOaG5QE3XO/
 5TCK4U/bxr56j6zi7pJt0M+DUY+ps9P1MfWY/yKdUk2xG8FOUbDL7fyzuzZC91Jfu9mXkAwUBT3
 rjSoFnVeMEf6K4dfZ4OQai5j47GFtI9wrEUYa/PqJoHfSW1H9W9BGX24hvPdi6eOWc00A2vE=
X-Google-Smtp-Source: AGHT+IGSxjfGCpDbzVjxy68HxJhNbtAh1wfPUZTznQG2tOVSQtGIO+XjNPJPbc9zUq5VFEKk+DISIw==
X-Received: by 2002:a05:622a:148:b0:4b2:9a53:7c10 with SMTP id
 d75a77b69052e-4b31b98c963mr85943831cf.23.1756720668878; 
 Mon, 01 Sep 2025 02:57:48 -0700 (PDT)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com.
 [209.85.219.46]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7fc14754ee8sm621496085a.32.2025.09.01.02.57.48
 for <linux-stm32@st-md-mailman.stormreply.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 02:57:48 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-70df4418f98so36696256d6.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 01 Sep 2025 02:57:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVpYd4mt8KsF2o8byneqqyLGUPHXSWrIrTetLaIBxN9qgvwvV18+ylgJL7UvpUGOqXtMnU7VYcNxsOOng==@st-md-mailman.stormreply.com
X-Received: by 2002:a05:6102:5e8e:b0:50d:feb0:316e with SMTP id
 ada2fe7eead31-52aeb7798e1mr2104974137.2.1756720196368; Mon, 01 Sep 2025
 02:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <1907e1c7-2b15-4729-8497-a7e6f0526366@kernel.org> <aKhVVJPEPxCoKKjI@x1>
 <4d31df9e-62c9-4988-9301-2911ff7de229@kernel.org> <aKhr8NYhei59At0s@x1>
 <7c6cc42c-fc76-4300-b0d2-8dabf54cf337@kernel.org>
In-Reply-To: <7c6cc42c-fc76-4300-b0d2-8dabf54cf337@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 11:49:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUB4QGBaMk5r5eNRCPriUWAY+LBE2C7kVEkE9eCNE1TUA@mail.gmail.com>
X-Gm-Features: Ac12FXwQn8nZWuX__OUteos14KQ8Ceq7TOY9AfEwCR3rwgzCn6YxJiejdZ6ywp8
Message-ID: <CAMuHMdUB4QGBaMk5r5eNRCPriUWAY+LBE2C7kVEkE9eCNE1TUA@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
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
 Takao Orito <orito.takao@socionext.com>, Brian Masney <bmasney@redhat.com>,
 linux-mediatek@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andrea della Porta <andrea.porta@suse.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yixun Lan <dlan@gentoo.org>, Taichi Sugaya <sugaya.taichi@socionext.com>,
 patches@opensource.cirrus.com, Bjorn Andersson <andersson@kernel.org>,
 linux-mips@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [Linux-stm32] [PATCH 000/114] clk: convert drivers from
 deprecated round_rate() to determine_rate()
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

On Sat, 23 Aug 2025 at 18:43, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 22/08/2025 15:09, Brian Masney wrote:
> > On Fri, Aug 22, 2025 at 02:23:50PM +0200, Krzysztof Kozlowski wrote:
> >> On 22/08/2025 13:32, Brian Masney wrote:
> >>> 7 of the 114 patches in this series needs a v2 with a minor fix. I see
> >>> several paths forward to merging this. It's ultimately up to Stephen how
> >>> he wants to proceed.
> >>>
> >>> - I send Stephen a PULL request with all of these patches with the minor
> >>>   cleanups to the 7 patches. Depending on the timing, Stephen can merge
> >>>   the other work first, and I deal with cleaning up the merge conflicts.
> >>>   Or he can if he prefers to instead.
> >>>
> >>> - Stephen applies everyone else's work first to his tree, and then the
> >>>   good 107 patches in this series. He skips anything that doesn't apply
> >>>   due to other people's work and I follow up with a smaller series.
> >>
> >> Both cause cross tree merge conflicts. Anyway, please document clearly
> >> the dependencies between patches.
> >
> > This series only touches drivers/clk, so it shouldn't cause any issues
> > with other subsystems, unless there's a topic branch somewhere, or I'm
> > missing something?
>
> Individual maintainers handle subdirectories.

FWI(still)W, I have taken the Renesas SoC-specific patches through
the renesas-clk tree...

> > There are some drivers under drivers/clk/ where there is an entry in the
> > MAINTAINERS file that's not Stephen, although it wasn't clear to me if
> > all of those people will send PULL requests to Stephen. I described on
> > the cover how how the series was broken up.
> >
> >   - Patches 4-70 are for drivers where there is no clk submaintainer
> >   - Patches 71-110 are for drivers where this is an entry in MAINTAINERS
> >     (for drivers/clk)
>
> It's hidden between multiple other descriptions of patches, so I really
> would not think that this means that it is okay by individual maintainer
> to take the patch.
>
> This really should be the one most important part of the cover letter
> for something like this.
> ..

It was indeed rather implicit:

   "Once all of my conversion patches across the various trees in the kernel
    have been merged, I will post a small series that removes the
    round_rate() op from the clk core and the documentation. Here's the
    other patch series that are currently in flight that need to be merged
    before we can remove round_rate() from the core. [...]"

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
