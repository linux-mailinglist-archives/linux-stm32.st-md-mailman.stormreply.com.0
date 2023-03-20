Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA566C10F4
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 12:38:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4F1AAC6A5EF;
	Mon, 20 Mar 2023 11:38:34 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C285C65068
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 11:38:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF99FB80E56;
 Mon, 20 Mar 2023 11:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714C1C433EF;
 Mon, 20 Mar 2023 11:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679312311;
 bh=YfQJfApGvnHfGU8gi0gNukjaGzsg84xu5lWbeqt0lnw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eb0R3e1JjZqoZgzBIBGjddsyzF5oRvdKqX4zJzfcsM0/DnTdJPwvylLD+N+LKBRzx
 IUP4xObd68HKq8F/Qvpt1W8+ib5Odyumu8IK77yOV7UrOlBps49shv9e9/SC/xo2kz
 m0aAW+ll4AWGsB8I2maII0LRP6fC/xl2FJLRDWSewz86h49su8evjRUcjYOvGhEqEP
 OqxjJPCWzSjGCbGJ72Q91R07MKL6mi3EU3EI8GH5XvBh3WyMEz82QnPL2OuhZKfQhY
 kOBto01PJnNfY6OWt0wG8oiBvRdeyp56uvftv10KL3GXZXlc50hUNdkT6jkk/wjKoa
 ZZVIoO4TNk3KQ==
Date: Mon, 20 Mar 2023 17:08:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZBhFsyXyN4wHV5BB@matsya>
References: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230307115900.2293120-1-u.kleine-koenig@pengutronix.de>
Cc: Miaoqian Lin <linmq006@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-arm-msm@vger.kernel.org,
 Al Cooper <alcooperx@gmail.com>, Yuan Can <yuancan@huawei.com>,
 dri-devel@lists.freedesktop.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Justin Chen <justinpopo6@gmail.com>, linux-phy@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Dan Carpenter <error27@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-renesas-soc@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>,
 Icenowy Zheng <uwu@icenowy.me>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 linux-arm-kernel@lists.infradead.org, Swapnil Jakhade <sjakhade@cadence.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Matt Ranostay <mranostay@ti.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-tegra@vger.kernel.org, Rahul T R <r-ravikumar@ti.com>,
 Liu Ying <victor.liu@nxp.com>, Andre Przywara <andre.przywara@arm.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Lv Ruyi <lv.ruyi@zte.com.cn>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sinthu Raja <sinthu.raja@ti.com>,
 Roger Quadros <rogerq@kernel.org>, kernel@pengutronix.de,
 Allison Randal <allison@lohutok.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, JC Kuo <jckuo@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, Tanmay Patil <t-patil@ti.com>,
 linux-sunxi@lists.linux.dev, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-mediatek@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [Linux-stm32] [PATCH 00/31] phy: Convert to platform remove
 callback returning void
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 07-03-23, 12:58, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> this patch series adapts the platform drivers below drivers/phy to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver c=
ore
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warnin=
g. The
> device is removed anyhow and an early return from .remove() usually yield=
s a
> resource leak.
> =

> By changing the remove callback to return void driver authors cannot
> reasonably assume any more that there is some kind of cleanup later.
> =

> All drivers in drivers/spmi returned zero unconditionally in their remove
> callback, so they could all be converted trivially to .remove_new().
> =

> Note that this series depends on commit 5c5a7680e67b ("platform: Provide
> a remove callback that returns no value") which is included in v6.3-rc1.

Applied, thanks

-- =

~Vinod
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
