Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CD221B496A1
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Sep 2025 19:12:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32D4AC3F95B;
	Mon,  8 Sep 2025 17:12:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D8C4C3F95A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Sep 2025 17:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757351527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N0Ew5uLxMWlX2hxvzxeMznJDWzQfwf1IVExLfD9g+8c=;
 b=ZuHq0bgQveon6kp40mnKKhpBoBWJdfWnY67qlHPz9++SQVij9nh/gwl/t2W/HG+saDFKCf
 nvUu2YmR1+yWvLYAD9GVp8F/2TrLvwdYw19ooinDxC9ot27Edcn566GZjiykKj8LSVundK
 qnXN8C67pACLu9F+Y4Rld4u7G6QuGtc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-1bqXodOBOL-ZSi5vWB1MjA-1; Mon, 08 Sep 2025 13:12:06 -0400
X-MC-Unique: 1bqXodOBOL-ZSi5vWB1MjA-1
X-Mimecast-MFC-AGG-ID: 1bqXodOBOL-ZSi5vWB1MjA_1757351526
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b60dd9634dso34031291cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Sep 2025 10:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757351526; x=1757956326;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N0Ew5uLxMWlX2hxvzxeMznJDWzQfwf1IVExLfD9g+8c=;
 b=viuEsRkyjdM4dLqkHrqzjloK8fZj1ieNt6lMraIwS1fY0DQnTYrAx9WakA8Ib3fyfA
 08jd9PkCDo1hEuW6jv2RggdSlBtklgIbYJjjIZa4pRZGer07L74uCOlQrG/8mkXN7hjd
 Yfs9ZRAy73wyjzIfbJHcyrz7VX6etkvnWdgzzBaUd96JawizagpkF5RN2pUFECjxY3H4
 Cx/TRZwZdhVFOr+xUxmNJPbEVZanqXpQgpExrllx6VbmIBvinw4lURTql44DWe0XCdUM
 +dHAFSGKUWKiATkxat8x46DlUqbqb2ovqzbRjBzHbWuGl3D6SyzYbuPXX3Wnj/D9yMXz
 E75w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBgHn78KNZKboTw6WOFvQst3oOuaxieSc6W2juNW6MAEn02DThRXW2lE82pA6zELweIJEUXDGqVU1sRg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy+xWPymjgyMpuA9rkyRD7sfWzW7Ijcx/3w2Tj/J/5+p6QEPu0K
 p6CvGeM84/LhI/zD+I7F0AwusgpTRVjTdPZ9jsOex4daVAm3wQsyOW8XNYeLULdgWV/KjtvPZAO
 HQP0fMRJ9v0GNkPzLFubCWoa75ZJpDZCzsGuR/5jtKeDjuKvPs3H7MzCw61aEjKl9DQkIgGzrj/
 zA9tdODQ==
X-Gm-Gg: ASbGncvhGCNHy2JcXZES3ZKWoyTbRcBf4IuvinLdSBGdSJ6+Vhj82cbQlh1zRQTK+kY
 SsYG86cBUJZRvI+aGih4UahrrDDI9Ealc5UZxGDb9VNa1hXqbbm1yptX2rUiL4uOX7qQXby9sCt
 jM9CgF87ngQghWUG7t4ftBFzs0mX7tA9Z94UUL4wsuapaSAgckm2q8HGgUhnmgqhO8Bh6TvZuWX
 XONxeXUn9Qzl4IzvGEhUymXhAycsw8yhE8HM94FLShAKyOJoiBLthThqV4UdVynywNijnAK8Qfu
 b03GYskRHK/XqmtDpTInCsJZOOToLT6oeUsQCBb+q4pFTCBAmqqMkaR2vFU=
X-Received: by 2002:ac8:5a12:0:b0:4b5:d739:6273 with SMTP id
 d75a77b69052e-4b5f8490345mr93489091cf.75.1757351525399; 
 Mon, 08 Sep 2025 10:12:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVez0JttMWAhr/EpA5S3LWdvkJoIrJRGLs+fJ0AEeH7TgyS1UoHb0txwN7TUYVZQswHIwQlA==
X-Received: by 2002:ac8:5a12:0:b0:4b5:d739:6273 with SMTP id
 d75a77b69052e-4b5f8490345mr93488361cf.75.1757351524739; 
 Mon, 08 Sep 2025 10:12:04 -0700 (PDT)
Received: from x1 ([2600:382:8507:870e:b6f8:ee72:4f09:a16a])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-80aab5a062fsm1122872785a.48.2025.09.08.10.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 10:12:04 -0700 (PDT)
Date: Mon, 8 Sep 2025 13:11:57 -0400
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
Message-ID: <aL8OXeFC4N-J_kvC@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7FR4niQkCODpajCche0tiOokN4TehP8haxPBmBBPnSE_1757351526
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

I included a subset of these patches in this pull request to Stephen:
https://lore.kernel.org/linux-clk/aL8MXYrR5uoBa4cB@x1/T/#u

Brian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
