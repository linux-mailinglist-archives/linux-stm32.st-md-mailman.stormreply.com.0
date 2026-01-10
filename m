Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 141C4D0DACE
	for <lists+linux-stm32@lfdr.de>; Sat, 10 Jan 2026 20:11:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B63CCC8F283;
	Sat, 10 Jan 2026 19:11:37 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0075FC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 10 Jan 2026 19:11:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D2D260168;
 Sat, 10 Jan 2026 19:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EEFC4CEF1;
 Sat, 10 Jan 2026 19:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768072294;
 bh=ifQtDtBDcokzLccqf8aQCht97s3eipcMMEmXbpDw6Aw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qCiyrFAU2xicKCibTXPIf3XhBQmk0g6ZWmSgHHXVP1B02QbrV77FWTZFOP1VjWDCw
 qjMrQb+XKb5f4XadhrY/24Ap8FT4i3zPkyp8Hq83pZ7Qd05yBLYY/SjBLAoBYN1J91
 tZcXYUR9WCowuaBnwQNH+5l+izoJ34YwXyJn9pNjN9mFqtBAcF6dVgtvosb5DN2PQH
 UkWDCIMetOEIB1XAkKVOYI7Wkyc0F3Lm5PBO/vh7rnB4GSTP0L4HqCSOjm7fLM7dry
 DJ/5zv35sUADTSmPEivxJvudoLJxOMiPSlaVLC0wreck+xhcPR7Tw1K+pdiPCNoYJW
 fAQibqBj2d1ug==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Date: Sat, 10 Jan 2026 13:11:17 -0600
Message-ID: <176807228457.3708332.10766520174431957453.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
MIME-Version: 1.0
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Shan-Chun Hung <schung@nuvoton.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 linux-rtc@vger.kernel.org, Samuel Holland <samuel@sholland.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chen Wang <unicorn_wang@outlook.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Orson Zhai <orsonzhai@gmail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, linux-sunxi@lists.linux.dev,
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
 Simona Vetter <simona@ffwll.ch>, Jacky Huang <ychuang3@nuvoton.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-actions@lists.infradead.org, Maxime Ripard <mripard@kernel.org>,
 Vladimir Zapolskiy <vz@mleia.com>, sophgo@lists.linux.dev,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Chen-Yu Tsai <wens@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Taichi Sugaya <sugaya.taichi@socionext.com>,
 Inochi Amaoto <inochiama@gmail.com>, linux-mips@vger.kernel.org,
 Jessica Zhang <jesszhan0024@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Takao Orito <orito.takao@socionext.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Linux-stm32] (subset) [PATCH 00/27] clk: remove deprecated API
	divider_round_rate() and friends
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


On Thu, 08 Jan 2026 16:16:18 -0500, Brian Masney wrote:
> Here's a series that gets rid of the deprecated APIs
> divider_round_rate(), divider_round_rate_parent(), and
> divider_ro_round_rate_parent() since these functions are just wrappers
> for the determine_rate variant.
> 
> Note that when I converted some of these drivers from round_rate to
> determine_rate, this was mistakenly converted to the following in some
> cases:
> 
> [...]

Applied, thanks!

[14/27] clk: qcom: alpha-pll: convert from divider_round_rate() to divider_determine_rate()
        commit: e1f08613e113f02a3ec18c9a7964de97f940acbf
[15/27] clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()
        commit: 35a48f41b63f67c490f3a2a89b042536be67cf0f
[16/27] clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()
        commit: b2f36d675e09299d9aee395c6f83d8a95d4c9441

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
