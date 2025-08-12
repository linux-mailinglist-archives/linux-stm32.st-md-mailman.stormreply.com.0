Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D61B224B8
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Aug 2025 12:39:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B287C3F931;
	Tue, 12 Aug 2025 10:39:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D28D3C3089F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 10:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754995191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZNmGluZMVEODqqLey7tscfNEcE8jZgnd0oIotEJMQE8=;
 b=S/w4E4vhnIv9g5/m9EpOWKn80bn4jOLxEYmhjX2Zk5jVtdrmkheWJ3H5FTJz+lA4GV7cpg
 0HdTqXuvrzYOKAK1KSgY9ClDl19f1K7v1Dh2PBKtF4pjpzlLSn3qdkp0A7yJsCCYKnMm92
 1h0YWugJgjLnJlwBhuZZdczNBgjsnjM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-A-u8ep2OOm-evZlxo6V7NQ-1; Tue, 12 Aug 2025 06:39:50 -0400
X-MC-Unique: A-u8ep2OOm-evZlxo6V7NQ-1
X-Mimecast-MFC-AGG-ID: A-u8ep2OOm-evZlxo6V7NQ_1754995190
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e7fc5f1e45so1103626785a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Aug 2025 03:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754995190; x=1755599990;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZNmGluZMVEODqqLey7tscfNEcE8jZgnd0oIotEJMQE8=;
 b=a7C9YDzChWmwxajfuSFLExCRJUZk/1UzBYknraOJsLwqc6x0tRSwMMbnYtmOJ/7sFp
 wQU17q6D85jrfYxohUbi/wOX5bDPH6tE0K35O9OeRSlZYDqN+VGm0MEO7VWSyMxOEuby
 mxFHys82EyBEhO0KuWTfe92Kba6CLoIeD77oL9AREmcG/Cup6tjEEbh/NgVNVTgXzqGH
 a0Ov/O7xZul+4KJB70cvyWT9WC9p652IHulbTruUWWLBC/j6uxHZAHChoKgMu0Htw48O
 hRbFkUaCjk5qukFF1gQFAC2q3/9LD+wDB5t6gPaTEWxDIpU7/lIdgB+XsAVZYQPz5YZI
 GxEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrd/89vmdp09ESxFy66mkA+3eE+Mm+Z46WHLIu+EDiH98rTweQceFqOfUIrHrOElpr0r4Sx0vT8IShng==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzCrpsuR0+/vOOauIdMz6qVK7IJJg6gz0FJQdPo+3hFRtHBUyP3
 Ib1Ez7eRgTHv5gjDb5KYz1CQGHxKupfk0mzOy/4UF5RwU0YzErPlBzU+BQdde9+7KOxQiCexrE9
 idQoCn4R/7FK1QpmIZl6w0en93T7E0q2xg/JB0smcSTyMhk4ag0jvmyyjMPkdQc/M9DEih753qH
 ps2+O/vQ==
X-Gm-Gg: ASbGnctePCrgKK6ETYTo3Zql5yvEWfxKJhnXLN1SzaZYIU8SrN7FWVOwBO7cHY7qx2I
 tg30CDRQ+wRGu01F7PgVqBAPbnUDgSIaLbzAv/rTNXyXdFsg4wga2WVNHQRrIwG6cLDkUG+V2s9
 8W8OquN2FMWerN1pkE4DnyBDgpq1KijohC5oBbzye+ueFswAV9LahJR9i10vb/IWyDxIM5ryTvt
 mHUeLNjC6fRSCgyC3DU2C6C+rjMpvf8niynhag0FzzhJQcv9kMqBJyvUTH+DKr+I/tJUOXNHfMB
 JkWp1GBFlXIjG5excKt+io//tXD63upORAjKaDIH/VhQJ+sDN7z2HeXdgOqhQFs=
X-Received: by 2002:a05:620a:126c:b0:7e8:15ce:bf9f with SMTP id
 af79cd13be357-7e8588b064emr355641085a.33.1754995189816; 
 Tue, 12 Aug 2025 03:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnBK/VwO9xaDEZqPIr5Ki0EDBjQlgku4qoR/ofUy7muXwNiOHVcU/4sdcTQibJSWhG5zm1ew==
X-Received: by 2002:a05:620a:126c:b0:7e8:15ce:bf9f with SMTP id
 af79cd13be357-7e8588b064emr355631785a.33.1754995188996; 
 Tue, 12 Aug 2025 03:39:48 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7e67f73101asm1727614485a.68.2025.08.12.03.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 03:39:47 -0700 (PDT)
Date: Tue, 12 Aug 2025 06:39:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil <paul@crapouillou.net>,
 Keguang Zhang <keguang.zhang@gmail.com>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>,
 UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Max Filippov <jcmvbkbc@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>,
 Andrea della Porta <andrea.porta@suse.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alex Helms <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
 asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Message-ID: <aJsZ7bs0OMXcrStU@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QGUaWAiWWG7vik0S9ZALyZ4rivNsFBy_CrkKKvnsWko_1754995190
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

On Mon, Aug 11, 2025 at 11:17:52AM -0400, Brian Masney via B4 Relay wrote:
> Once all of my conversion patches across the various trees in the kernel
> have been merged, I will post a small series that removes the
> round_rate() op from the clk core and the documentation. Here's the
> other patch series that are currently in flight that need to be merged
> before we can remove round_rate() from the core.
> 
> - arm32 (3): https://lore.kernel.org/linux-clk/20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com/T/
> - clk/tegra (6): https://lore.kernel.org/linux-clk/20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com/T/
> - clk/ti (7): https://lore.kernel.org/linux-clk/20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com/T/
> - clocksource (1): https://lore.kernel.org/linux-clk/20250810-clocksource-round-rate-v1-1-486ef53e45eb@redhat.com/T/
> - drm (9): https://lore.kernel.org/linux-clk/20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com/T/
> - drm/msm (7): https://lore.kernel.org/linux-clk/20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com/T/
> - i2c (1): https://lore.kernel.org/linux-clk/20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com/T/
> - media (4): https://lore.kernel.org/linux-clk/20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com/T/
> - mips (1): https://lore.kernel.org/linux-clk/20250810-mips-round-rate-v1-1-54e424c520dd@redhat.com/T/
> - net (1): https://lore.kernel.org/linux-clk/20250810-net-round-rate-v1-1-dbb237c9fe5c@redhat.com/T/
> - peci (1): https://lore.kernel.org/linux-clk/20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com/T/
> - phy (9): https://lore.kernel.org/linux-phy/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com/T/
> - pmdomain (1): https://lore.kernel.org/linux-clk/20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com/T/
> - tty (1): https://lore.kernel.org/linux-clk/20250810-tty-round-rate-v1-1-849009f3bdfd@redhat.com/T/

Konrad noticed on patch 90 the space after the cast. I thought I fixed
all of those by hand, but apparently not. I looked through this series
(and the others above) with `grep "u64) "` and `grep "long) "`, and found
4 other cases.

Patch 38: clk: nxp: lpc32xx: convert from round_rate() to determine_rate()
Patch 64: clk: x86: cgu: convert from round_rate() to determine_rate()
Patch 68: clk: zynqmp: divider: convert from round_rate() to determine_rate()
Patch 95: clk: rockchip: half-divider: convert from round_rate() to determine_rate()

Brian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
