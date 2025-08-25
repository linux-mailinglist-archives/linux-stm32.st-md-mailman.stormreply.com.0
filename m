Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A0B339BF
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Aug 2025 10:44:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 393A8C36B2A;
	Mon, 25 Aug 2025 08:44:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1D1AEC36B29
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 08:40:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 34199601F4;
 Mon, 25 Aug 2025 08:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A433C4CEED;
 Mon, 25 Aug 2025 08:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756111245;
 bh=aL0MAVPP+baLaUpSwr0jfz0k4rjTubYNQV6vSJB6OP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FhTSsXLtwO6EYA8rIZFKJgEf1O0j/6AFVpaIb7+0szOlxeqEkxITba+wS9KfZ+kjH
 dJ4D0usUwHPH2GWzU3dXYRelvBK6F/Z+h883XsJq3lJG4gwBDPoq7M/8L4HEjQ78Vz
 uw/bRo0VNtHxfdkgkl90Rnhxn0zOB4RalzhxYxbJGexY8w9QaG1wwgcVo4YigkvXdQ
 HQavQb3MOaV1ehg5AV6v7VNw85VJa0JTCzNxPuL1pTIJOwcfLGwF2EeUKXrxIt0vRt
 UCzCy8PTNnoYCOQUG/lUyh80qq0nQtE3jstm5jDssnnjYRZ8hsuFayTUr3+h+B+cyD
 ob0l8lzfNS6fA==
Date: Mon, 25 Aug 2025 16:40:43 +0800
From: Yixun Lan <dlan@kernel.org>
To: bmasney@redhat.com
Message-ID: <20250825084043-GYA1096417@kernel.org>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-49-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-49-b3bf97b038dc@redhat.com>
X-Mailman-Approved-At: Mon, 25 Aug 2025 08:44:17 +0000
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
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
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
Subject: Re: [Linux-stm32] [PATCH 049/114] clk: spacemit: ccu_ddn: convert
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

Hi Brian,

  Thanks for doing this

  I will give my rb to 49-51 for SpacemiT, and here we face same
issue as Krzysztof did for samsung, to avoid potential conflicts
we will route the clk patches through SpacemiT SoC tree..

On 11:18 Mon 11 Aug     , Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
> 
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  drivers/clk/spacemit/ccu_ddn.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
> index be311b045698e95a688a35858a8ac1bcfbffd2c7..02b68ea84db9bd3ecdde41f8013c48263edbd917 100644
> --- a/drivers/clk/spacemit/ccu_ddn.c
> +++ b/drivers/clk/spacemit/ccu_ddn.c
> @@ -39,13 +39,16 @@ static unsigned long ccu_ddn_calc_best_rate(struct ccu_ddn *ddn,
>  	return ccu_ddn_calc_rate(prate, *num, *den);
>  }
>  
> -static long ccu_ddn_round_rate(struct clk_hw *hw, unsigned long rate,
> -			       unsigned long *prate)
> +static int ccu_ddn_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
>  {
>  	struct ccu_ddn *ddn = hw_to_ccu_ddn(hw);
>  	unsigned long num, den;
>  
> -	return ccu_ddn_calc_best_rate(ddn, rate, *prate, &num, &den);
> +	req->rate = ccu_ddn_calc_best_rate(ddn, req->rate,
> +					   req->best_parent_rate, &num, &den);
> +
> +	return 0;
>  }
>  
>  static unsigned long ccu_ddn_recalc_rate(struct clk_hw *hw, unsigned long prate)
> @@ -78,6 +81,6 @@ static int ccu_ddn_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  const struct clk_ops spacemit_ccu_ddn_ops = {
>  	.recalc_rate	= ccu_ddn_recalc_rate,
> -	.round_rate	= ccu_ddn_round_rate,
> +	.determine_rate = ccu_ddn_determine_rate,
>  	.set_rate	= ccu_ddn_set_rate,
>  };
> 
> -- 
> 2.50.1
> 
> 

-- 
Yixun Lan (dlan)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
