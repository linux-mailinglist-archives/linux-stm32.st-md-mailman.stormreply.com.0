Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 82980B2A111
	for <lists+linux-stm32@lfdr.de>; Mon, 18 Aug 2025 14:05:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E022EC3F93C;
	Mon, 18 Aug 2025 12:05:23 +0000 (UTC)
Received: from flow-b4-smtp.messagingengine.com
 (flow-b4-smtp.messagingengine.com [202.12.124.139])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B752AC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 Aug 2025 15:29:30 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailflow.stl.internal (Postfix) with ESMTP id 105C21300304;
 Thu, 14 Aug 2025 11:29:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Thu, 14 Aug 2025 11:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm2; t=1755185366; x=1755192566; bh=rkWnl6reuM
 6yvJ3xZDTKQK+EuArjQadhj3fE3KZMVRQ=; b=bk5vgVr1CLPZUpu/8yzDk9lb/A
 tHVYzQv9hTbjQ5kwcym7VsHTp19WAkg0Hpqa0wD+CqZ1Nd+U4CYQUhklsxcsM+gf
 +Z8ariB4+I6d0eYBWBqwN85t+DHDwDQ7fqbhoqiETlG6gco3KS7d4UK8VRBiyAAS
 6uQ21llXN+4WgyvPXd92zlyXucFtCItZdyaRf6rM974aMV78YFLsf5bYqI0hfslp
 WGrZ3W02q0h1GvDjIb47eJZZb/RoRsmrCwwgfK5H4wRRs0C8WqQHHYIrOMK0ZHVP
 aDBjLclEdxOpupQdAWDgeTb1M/iK05Vsaa408ZFpj/IrPd9EETcasajpGZrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1755185366; x=1755192566; bh=rkWnl6reuM6yvJ3xZDTKQK+EuArjQadhj3f
 E3KZMVRQ=; b=OgtRYyef+tMauOvZ4k9rGfwXDQPdj9klbG3t2P3cD1RmOS/9tKr
 ofSSHcPOA4xPenVBOXiV5FhURDpUSMTCxAaCfaGDs8djlJNyu+CDw00HGUTHuZE7
 iZZjz4ciUS7g9j3QlvnqXWnhLS9T0Hfr1vQzrZacIOAYqclBu7P8wHiQyBn3x1Tv
 3IRsTGZTVlX0WWvOsiM9n8XZ6hNCPKGYNq9gwZN2kX8ko8IOuG4Q8FPM4sUswTeC
 AgWkrih3zpy+BYFRHxDex0LNtVY1D6KtF6Lq5T4lYxyTSy86ct+fI6zX8qKxzdu/
 3y8kkYasdpgKe+p3NAh/zboekg1+6r4CeXQ==
X-ME-Sender: <xms:0ACeaPzCAtXgPuyqWluGHhM-MFgm73xya4MqxCsQTtBCktFBJqK7kg>
 <xme:0ACeaMERX6gx9_hULngxnLQfekqkXc4lLgLYc32ut3v9CMFW_su7guEwNB2tie5mH
 w5fawJBsHbwl2-YVLE>
X-ME-Received: <xmr:0ACeaLVGQlU6CrqqKVJitR-Q-KYnw8sFF555-uv-1ZSx_gltuJRQBRXFJYSpweaBmMTG7ASMGOfysdY55ljMVadCgzU7C0B0G9o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugedugeegucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
 rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
 gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
 ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
 ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
 drnhgvthdpnhgspghrtghpthhtohepkeekpdhmohguvgepshhmthhpohhuthdprhgtphht
 thhopegsmhgrshhnvgihsehrvgguhhgrthdrtghomhdprhgtphhtthhopehmthhurhhquh
 gvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepshgsohihugeskhgvrhhn
 vghlrdhorhhgpdhrtghpthhtohepshhuuggvvghprdhhohhllhgrsegrrhhmrdgtohhmpd
 hrtghpthhtoheptghrihhsthhirghnrdhmrghruhhsshhisegrrhhmrdgtohhmpdhrtghp
 thhtohepuhhnihgtohhrnhgpfigrnhhgsehouhhtlhhoohhkrdgtohhmpdhrtghpthhtoh
 epihhnohgthhhirghmrgesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlrghs
 rdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtoheprghlvgigrghnug
 hrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:0QCeaCmil7BHYfOOKicsmHxn_e78pk70Rk65CyKWeasaaevmqI2c1w>
 <xmx:0QCeaDoCeuybXqCAns088Q1xVlB3g1e970x8zyEDaKcok_TAC0lcKQ>
 <xmx:0QCeaEVFJkoSfREyDcMyNqqo6Jw3DXglTgApYi_wACt6wsNooYRRBw>
 <xmx:0QCeaBiIqVIoEzYCR8Pz3QPaA5HZY-DpDdZxQjhq8wajhutrO-oikw>
 <xmx:1gCeaFTE4FSOg2ZAQsli0z35YCTwrTgdlOhrp7ge8wLAulQpy-Pb8Suw>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 14 Aug 2025 11:29:19 -0400 (EDT)
Date: Thu, 14 Aug 2025 17:29:18 +0200
From: Janne Grunau <j@jannau.net>
To: bmasney@redhat.com
Message-ID: <20250814152918.GA854971@robin.jannau.net>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-75-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-75-b3bf97b038dc@redhat.com>
X-Mailman-Approved-At: Mon, 18 Aug 2025 12:05:23 +0000
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
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
 Liviu Dudau <liviu.dudau@arm.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Cercueil <paul@crapouillou.net>, Shan-Chun Hung <schung@nuvoton.com>,
 linux-riscv@lists.infradead.org, Chen Wang <unicorn_wang@outlook.com>,
 arm-scmi@vger.kernel.org,
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
Subject: Re: [Linux-stm32] [PATCH 075/114] clk: apple-nco: convert from
 round_rate() to determine_rate()
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

On Mon, Aug 11, 2025 at 11:19:07AM -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/clk-apple-nco.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)

Reviewed-by: Janne Grunau <j@jannau.net>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
