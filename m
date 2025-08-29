Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10819B3B00A
	for <lists+linux-stm32@lfdr.de>; Fri, 29 Aug 2025 02:48:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B866C3F95F;
	Fri, 29 Aug 2025 00:48:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 66683C3F931
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 Aug 2025 00:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756428477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MySjf1dNQ+QFblxbzgcBLucxms+md0OmiOz5lWF0b/w=;
 b=eRIyUMrsdAYkfHt4XKCp6uZVcaF8eYVW5PQTWDPnRfcFh/fZ/OCQknkdaU2gTo+kNSqclk
 KzFj050q9fo6aXu7Xs7kbYSaiSI49YudDmWSTgD9iJoxx+XvlV4TYN/0OL56J4V7l+IoYq
 yJFrdmdnuvJZ5NGYRkAj9b78M2tCnOs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-qA8B5cqCNACJxmvYFTIcxA-1; Thu, 28 Aug 2025 20:47:55 -0400
X-MC-Unique: qA8B5cqCNACJxmvYFTIcxA-1
X-Mimecast-MFC-AGG-ID: qA8B5cqCNACJxmvYFTIcxA_1756428474
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7fc5584a2e5so95612385a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Aug 2025 17:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756428474; x=1757033274;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MySjf1dNQ+QFblxbzgcBLucxms+md0OmiOz5lWF0b/w=;
 b=R22zcRvCs6wfgHixnplqw/jSU4r8Y2mVvq/8PSqhOtnS6Rbdjpt1412lIJx/TMaJjJ
 r2gRMvHWmr9RjC4lEapOopF4qGEjuZC6IarEkZgF4/wiJoj8Fq8M6j9ujAiVfXjkIC2X
 J+/ZhGBf926CQQ3nphdvfbGtKeoT+0fSYwNzJ6RyTb7Oq243LUTh2gcxBL2sTllNKFgm
 a2nIu9HjBrVkkJEhG9YTdIbpIEY+ZXnIw3Jnc0zeMJu5eVsm3N1T8wQc14H1vexrUgVb
 5CGo6/8SiCXWTZI+bUiaSRVVBDqe5tQtClVQC2/8EttfCkXXC7KQPSltnrfZgOPKD2Fc
 mbBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqKpgiJ6JOSbSUpN6K7F4VFmCB2ilzMiGhbrlaPhAaL/6JvxCx5CV9MrLq08Q5/CMG0Auk4mP3Bfy2Dg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzwjTsBmWoi6SzjVjPZ57nyYOO3GIwWja3CM31r2D21cktRAGut
 9UMKqvxL2vV/gcjbUhvZ4bZDGZLhvlCTmtsSKIdYIQO92Q9Gp9oZb8Qro9n6HckmVbXsSvtnjeb
 z0dnimzR47SWC0Q6Y3R4UEjvW8ghP/vyWG2fUW6R8NlWCyMXT5gwjYKt4wSvtgNaHaTAME9F1cs
 xfSyFByA==
X-Gm-Gg: ASbGncuiD/tAy7UeCfJM+Ch2+lOv6uJvuuL541RJvX7F/+D1S9b7sQe8FY4FM9r8EnT
 cdvytv+KPyV7CW6qC5K8iiQ86z47u5KiZfjIKhaSKgMV/WMUqEbF9CMiF9atpMdZVurZF17CM6r
 b1vyKI8UEDyaxOnv06iM8J2rIDFZ3MC3DiWo3w34iQ2iFUzE2ggusC6FuXacBPHNBNWZf2XyofA
 Y3cGSVrAxCt840l5HKni+o/10t+M1NdPUVcftXRjFSOs4BEiNpHzgWOfwCzRNsdip7xtWs54gZP
 z3nCP8UC0i8oBttc6+c8wVmI7PNQ3APSYrZE1rsfNiX6iyYym71HiAh/20OwZQ68RzLyvWTnGiU
 sw39kT3F70oKTwnxoZJ0=
X-Received: by 2002:a05:620a:408a:b0:7f3:caf0:8412 with SMTP id
 af79cd13be357-7f3caf08452mr1587636185a.46.1756428474371; 
 Thu, 28 Aug 2025 17:47:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjCgf4If/yLnG9xLRPpSvaRiEUxzvfevF39cHGHA+NM0Oih06WQG6xkNf8xHsAsX5EmFe8lQ==
X-Received: by 2002:a05:620a:408a:b0:7f3:caf0:8412 with SMTP id
 af79cd13be357-7f3caf08452mr1587627285a.46.1756428473789; 
 Thu, 28 Aug 2025 17:47:53 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7fc14754ee8sm80548485a.32.2025.08.28.17.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 17:47:53 -0700 (PDT)
Date: Thu, 28 Aug 2025 20:47:47 -0400
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
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Message-ID: <aLD4s0sGEaQKD9PQ@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v5L12XTkK9OalgauF8d-P12q-Urx8vww2UslyF40Sfs_1756428474
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: imx@lists.linux.dev, soc@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 arm-scmi@vger.kernel.org, patches@opensource.cirrus.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-actions@lists.infradead.org,
 asahi@lists.linux.dev, sophgo@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Aug 11, 2025 at 11:17:52AM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> various clk drivers using the Coccinelle semantic patch posted below.
> I did a few minor cosmetic cleanups of the code in a few cases.

I posted a v2 patch series with 8 patches from this series that needed a
v2 to:

https://lore.kernel.org/linux-clk/20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com/T/

Sorry I didn't put PATCH v2 in the subject. I noticed as soon as it
started to send.

In summary, it fixes one merge conflict introduced in linux-next, remove
one case of &*, fix a comment, and removes unnecessary space after a
cast on 5 patches.

There are currently 7 patches from this series that's currently in
linux-next (renesas, spacemit, samsung). 

The relevant remaining 99 patches from this series waiting to be merged
can be grabbed with this command:

b4 am --add-link \
	--cherry-pick 1-37,39-47,52-63,65-67,69-89,91-91,94-94,96-96,100-112,114-114 \
	20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com

There's no dependencies with the other series.

Brian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
