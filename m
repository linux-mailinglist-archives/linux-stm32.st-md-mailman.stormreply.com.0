Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89947BF8258
	for <lists+linux-stm32@lfdr.de>; Tue, 21 Oct 2025 20:52:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C67ECC5C842;
	Tue, 21 Oct 2025 18:52:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 68C9EC3F95B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 Oct 2025 18:52:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E251545B5F;
 Tue, 21 Oct 2025 18:52:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAADFC4CEF5;
 Tue, 21 Oct 2025 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761072739;
 bh=/CjlmkvSVehb9uKQ22ITRCOwatYs4Z+DyN9C4O9799g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=F411smwqWcOG0d2J5NZJxXys/QHFqMqfadrXHqCOrLNcMA8WW8cRWSk5m/BcXF9zx
 jZCozPqw0LLbKMe9Xg/7Q/5qNkvpUcFxLmVtHtolTatemNDXN1nSJTjrUI9VuvXwq7
 WKFwmr+7x/pp0G6AK4RBsvqGwJnVh2cymY/fGszwyWytaKA9KDj4sVfS+KG78BgSZY
 bcEELUX1vIfLE0lvoGBje+ts88QjDTQ9wZrrgDSKAnoSPNtxc3GvyBNpQxBQo8hSIt
 06Xj4Zp0li6SsLoBTKYt5YN1COKgyPPPWPNwy3+TOWEwT4Yde6TiJdiW4MfOXFPNpO
 KQR4u8ujsV9Eg==
From: Mark Brown <broonie@kernel.org>
To: devicetree@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
Message-Id: <176107273462.196841.10566474992325623883.b4-ty@kernel.org>
Date: Tue, 21 Oct 2025 19:52:14 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-2a268
Cc: imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Srinivas Kandagatla <srini@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] (subset) [PATCH 0/4] dt-bindings: treewide: don't
 check node names
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

On Mon, 20 Oct 2025 08:09:49 +0200, Wolfram Sang wrote:
> Node names are already and properly checked by the core schema. No need
> to do it again.
> 
> These are all occurrences I found in linux-next as of 20251015. I did
> run dt_bindings_check successfully. I haven't done a way to run
> dtbs_check yet because I would need to identify the proper architecture
> first, right? Is there some tool which tests all DTs of a certain
> binding? At least build bot is happy, I don't know if it checks DTs as
> well, though.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[3/4] ASoC: dt-bindings: don't check node names
      commit: 6a4f29bc66294d44d61a294e5bdc623eae74587b

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
