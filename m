Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94377B3837C
	for <lists+linux-stm32@lfdr.de>; Wed, 27 Aug 2025 15:13:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35133C32E8D;
	Wed, 27 Aug 2025 13:13:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A650AC349C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 13:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756300416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=13LJOrVZbt5/bZNb1010AyPGLHEYUJgw1i+wJLdf1Rs=;
 b=b6sfeUg1k3h/K+rZmCBUqdC1FVC3pux6Pf71g5GAHVPKij43CoMeWsKftGJGlQ2rVh/VIU
 GNhyysNGbqz463uou7EP4x7eermxMXYMWOpw1FeWeae0EoMlEWddLDqD5f62BMOvA8VYnW
 1qLigQxwP30H/zuiYKHCE2PNHwA7ggc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-wF1ldRDCMFuFf4oeh6Lgig-1; Wed, 27 Aug 2025 09:13:35 -0400
X-MC-Unique: wF1ldRDCMFuFf4oeh6Lgig-1
X-Mimecast-MFC-AGG-ID: wF1ldRDCMFuFf4oeh6Lgig_1756300415
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7f2942a1aa1so237814285a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 27 Aug 2025 06:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756300405; x=1756905205;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=13LJOrVZbt5/bZNb1010AyPGLHEYUJgw1i+wJLdf1Rs=;
 b=bS0g1cw9ffafdBvBBH/H7G4JmRZQyC/WEhRBzvOFYY1IAoWrCrxUnwh25caXlB28iG
 hPaHH6DUUmHh484mVpZdMOV20HAFzP4tasMYsu1boFi3ARXZylkW+ZAG5d/hzDjhZIzX
 nUasG8csXUu5EhVYmAs6XnJSAzLR/RMGT4ED/kOrV0AM0smUPYZgHAP7iYFxqSQE3z2Z
 Tk7CczDoG/QvKLriCmwuPAqcsoyWrEZolRVaM5QfpYxgs0LP4JEkOpDDMXkmgWJDLDWP
 A/RYaq5e5ibQYSp+NCo0RqlrIX1048xvwgKx97DRdq1wj6TtD/lndHwJV67GjbL78XE9
 oCRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP9N6YG9XYUx+oT7Gwh8VcXbyZQWg6+LFPfchzCoLB5s18zGZuoPgLHfw9cwRHw/FQhyfXN0s0I8+sUQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwfD+sLVM3JYrt4e/KKvKvD7iuXwqdm9i6Hg0Zr6y0g23AvOsyE
 rXZmjYPH1KybotmomRuAT/GxP51MTxiwEJvmpPL3Vv7nevE5ipJgOvcnzPVeFZF3OGIb+hXLxr3
 Mqk5wgZSeTlnm6n4OI3/FqefOJ5Sf1IyOJBkXT1yFMGCqXee7vW5pyiP3YDde4JkgqTczfvgi+8
 I+ACz0EA==
X-Gm-Gg: ASbGncvfKFPFo43/imsPxWiGsYvweoYU4oWTipE+pO/jSUNuvlicVzEBal2+LPZy2lD
 WgL3CKznrfIT/Qsjrq8KbhpfMpxMfNiswJJxIOQ8/nugR/wmPRA78if9b234wIhRoRBwlMmi7yT
 VXLGWLt7nhDk1GvwBwt/S4k9p6w4JWUfEmWFWNST2BXdTYImVRj1gQ1ty1mhHO5d1qjzjp+QN/Q
 Tc/0vzqwelEj+H8q4LAxzghxxgmAeGUXbUyUcy8y+DpBxK6vCdvuFTOxAHqjNYk7XzWTh8bARJG
 9svI8Qs6vkfu0+fj3e3GBAQOH3xTvY5tqMKdkRKbIq8tZHLYVkhVQ5+FdpIRsNIv/N5miaC03Sc
 eO8QpLQP04HeIPEFPywY=
X-Received: by 2002:a05:620a:7101:b0:7ed:92c8:7d16 with SMTP id
 af79cd13be357-7f58d941f59mr592252385a.31.1756300404972; 
 Wed, 27 Aug 2025 06:13:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG//kDH7SoWg5eCSBiMLHP3nCnmfnmaReGS2V45T15TfIErjBPeekutHDc1uHZhw0fUtcQytQ==
X-Received: by 2002:a05:620a:7101:b0:7ed:92c8:7d16 with SMTP id
 af79cd13be357-7f58d941f59mr592238785a.31.1756300403878; 
 Wed, 27 Aug 2025 06:13:23 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ebeca23e10sm885475785a.6.2025.08.27.06.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 06:13:22 -0700 (PDT)
Date: Wed, 27 Aug 2025 09:13:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Message-ID: <aK8EbcEHz3Yzpa1W@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
 <20250827070933.GB18994@nxa18884-linux.ap.freescale.net>
MIME-Version: 1.0
In-Reply-To: <20250827070933.GB18994@nxa18884-linux.ap.freescale.net>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l8RQn51up7uJE5AwnRcMCvwsg-2OcQNUXbwSINCQmpA_1756300415
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
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

On Wed, Aug 27, 2025 at 03:09:33PM +0800, Peng Fan wrote:
> Hi Brian, Sudeep, Cristian
> 
> On Mon, Aug 11, 2025 at 11:19:44AM -0400, Brian Masney via B4 Relay wrote:
> >From: Brian Masney <bmasney@redhat.com>
> >
> >This driver implements both the determine_rate() and round_rate() clk
> >ops, and the round_rate() clk ops is deprecated. When both are defined,
> >clk_core_determine_round_nolock() from the clk core will only use the
> >determine_rate() clk ops, so let's remove the round_rate() clk ops since
> >it's unused.
> >
> >Signed-off-by: Brian Masney <bmasney@redhat.com>
> >---
> > drivers/clk/clk-scmi.c | 30 ------------------------------
> > 1 file changed, 30 deletions(-)
> >
> >diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> >index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..6c6ddb92e7cf6a0cfac2c7e19c0f15f777bb8c51 100644
> >--- a/drivers/clk/clk-scmi.c
> >+++ b/drivers/clk/clk-scmi.c
> >@@ -54,35 +54,6 @@ static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
> > 	return rate;
> > }
> > 
> >-static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> >-				unsigned long *parent_rate)
> >-{
> 
> I see the point of round_rate is not used if determine_rate is there.
> But reading the code of round_rate, It might be better to rename
> scmi_clk_round_rate to scmi_clk_determine_rate.
> 
> Anyway, need Sudeep and Cristian to comment.

In this case, yes the round_rate implementation is filled out, whereas
the determine_rate lets the firmware handle it, and
scmi_clk_recalc_rate() will later populate the rate the clock is running
at.

I can convert round_rate over to determine_rate in this case, however it
would be a change to what's there now, and risks a regression. Here's
the relevant code from drivers/clk/clk.c where the determine_rate and
round_rate ops are called:

    static int clk_core_determine_round_nolock(struct clk_core *core,
                                               struct clk_rate_request *req)
    {
    	...
            if (clk_core_rate_is_protected(core)) {
                    req->rate = core->rate;
            } else if (core->ops->determine_rate) {
                    return core->ops->determine_rate(core->hw, req);
            } else if (core->ops->round_rate) {
                    rate = core->ops->round_rate(core->hw, req->rate,
                                                 &req->best_parent_rate);
    	...

If Sudeep / Cristian want the round rate converted to determine rate in
this driver, then I can do that in a v2.

Brian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
