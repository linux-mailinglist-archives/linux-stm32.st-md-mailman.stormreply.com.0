Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A978B38409
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 15:50:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C1E4DC32E8D;
	Wed, 27 Aug 2025 13:50:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17F16C349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 13:50:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1ECC1688;
 Wed, 27 Aug 2025 06:50:20 -0700 (PDT)
Received: from bogus (unknown [10.57.57.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A11B23F694;
 Wed, 27 Aug 2025 06:50:11 -0700 (PDT)
Date: Wed, 27 Aug 2025 14:49:48 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Brian Masney <bmasney@redhat.com>
Message-ID: <20250827-abstract-maize-tanuki-d1bdcb@sudeepholla>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
 <20250827070933.GB18994@nxa18884-linux.ap.freescale.net>
 <aK8EbcEHz3Yzpa1W@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aK8EbcEHz3Yzpa1W@x1>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
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
 Jacky Huang <ychuang3@nuvoton.com>, Peng Fan <peng.fan@oss.nxp.com>,
 Ray Jui <rjui@broadcom.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, spacemit@lists.linux.dev,
 Cristian Marussi <cristian.marussi@arm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, asahi@lists.linux.dev,
 Sudeep Holla <sudeep.holla@arm.com>, Romain Perier <romain.perier@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
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
Subject: Re: [Linux-stm32] [PATCH 112/114] clk: scmi: remove round_rate() in
 favor of determine_rate()
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

On Wed, Aug 27, 2025 at 09:13:17AM -0400, Brian Masney wrote:
> On Wed, Aug 27, 2025 at 03:09:33PM +0800, Peng Fan wrote:
> > Hi Brian, Sudeep, Cristian
> > 
> > On Mon, Aug 11, 2025 at 11:19:44AM -0400, Brian Masney via B4 Relay wrote:
> > >From: Brian Masney <bmasney@redhat.com>
> > >
> > >This driver implements both the determine_rate() and round_rate() clk
> > >ops, and the round_rate() clk ops is deprecated. When both are defined,
> > >clk_core_determine_round_nolock() from the clk core will only use the
> > >determine_rate() clk ops, so let's remove the round_rate() clk ops since
> > >it's unused.
> > >
> > >Signed-off-by: Brian Masney <bmasney@redhat.com>
> > >---
> > > drivers/clk/clk-scmi.c | 30 ------------------------------
> > > 1 file changed, 30 deletions(-)
> > >
> > >diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> > >index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..6c6ddb92e7cf6a0cfac2c7e19c0f15f777bb8c51 100644
> > >--- a/drivers/clk/clk-scmi.c
> > >+++ b/drivers/clk/clk-scmi.c
> > >@@ -54,35 +54,6 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> > > 	return rate;
> > > }
> > > 
> > >-static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > >-				unsigned long *parent_rate)
> > >-{
> > 
> > I see the point of round_rate is not used if determine_rate is there.
> > But reading the code of round_rate, It might be better to rename
> > scmi_clk_round_rate to scmi_clk_determine_rate.
> > 
> > Anyway, need Sudeep and Cristian to comment.
> 
> In this case, yes the round_rate implementation is filled out, whereas
> the determine_rate lets the firmware handle it, and
> scmi_clk_recalc_rate() will later populate the rate the clock is running
> at.
> 
> I can convert round_rate over to determine_rate in this case, however it
> would be a change to what's there now, and risks a regression. Here's
> the relevant code from drivers/clk/clk.c where the determine_rate and
> round_rate ops are called:

I am inclined towards this. Determine rate was added recently when the
clock parent support was added IIUC, so I don't think it should regress
anything.

> 
>     static int clk_core_determine_round_nolock(struct clk_core *core,
>                                                struct clk_rate_request *req)
>     {
>     	...
>             if (clk_core_rate_is_protected(core)) {
>                     req->rate = core->rate;
>             } else if (core->ops->determine_rate) {
>                     return core->ops->determine_rate(core->hw, req);
>             } else if (core->ops->round_rate) {
>                     rate = core->ops->round_rate(core->hw, req->rate,
>                                                  &req->best_parent_rate);
>     	...
> 
> If Sudeep / Cristian want the round rate converted to determine rate in
> this driver, then I can do that in a v2.
> 

Yes please. Also please post it independent if it doesn't have to be in
the series. To many in cc and lots of patches to respin all.

-- 
Regards,
Sudeep
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
