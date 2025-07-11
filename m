Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EF3B013FA
	for <lists+linux-stm32@lfdr.de>; Fri, 11 Jul 2025 09:04:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 871BBC32EBF;
	Fri, 11 Jul 2025 07:04:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 639E7C32EB5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 11 Jul 2025 07:04:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EF82F611BD;
 Fri, 11 Jul 2025 07:04:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7B7C4CEEF;
 Fri, 11 Jul 2025 07:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752217463;
 bh=uK5/A21fH/ybXkIrVUNquGOGWtk5qo5hMSx0pRcrghQ=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=ozfb4Ymiyjz9klNEQNJ7+XMATYrXDol/mZYRFbfu5CreWryhHBADzdHTjmGWT6pCI
 2LI8Hg3YRs0dd48sDHV7Eivso+OTPLMGaTu1Xav9SaYjTT9eRvxnnxhOL1kS6k7eTQ
 bXrKPl8f85Qk1zPAVj+UGD9+AU58t3/QWCmFB06enVeBKPHHaplP5gj24nlTkj0deB
 Iopp5WPNP9nBuHVUExF+gSTKayUaynoxmromiXtiwoLlEmTz0YeOmQC4EfcF9HVpeZ
 ex81Qyb0Ajht4BpSAF2dNL7n5bqyR5EY+VeBDQjOBjZSiSFHbzueV2hpjJqv5B0JRX
 AsYgFP/435ZLg==
Message-ID: <1513c2dd4793403c32ccbbef4b5774e3@kernel.org>
Date: Fri, 11 Jul 2025 07:04:21 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
References: <20250710-drm-clk-round-rate-v1-8-601b9ea384c3@redhat.com>
Cc: imx@lists.linux.dev, Linus
 Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Marijn
 Suijten <marijn.suijten@somainline.org>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Simona Vetter <simona@ffwll.ch>,
 Samuel
 Holland <samuel@sholland.org>, David Airlie <airlied@gmail.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, linux-clk@vger.kernel.org, Chen-Yu
 Tsai <wens@csie.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, linux-sunxi@lists.linux.dev,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime
 Ripard <mripard@kernel.org>, Abhinav
 Kumar <abhinav.kumar@linux.dev>, Rob Clark <robin.clark@oss.qualcomm.com>, Sean
 Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Dmitry
 Baryshkov <lumag@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Stephen
 Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Yannick
 Fertre <yannick.fertre@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, freedreno@lists.freedesktop.org
Subject: Re: [Linux-stm32] [PATCH 8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Thu, 10 Jul 2025 13:43:09 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
