Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DC899C51908
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Nov 2025 11:09:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F3F8C628D3;
	Wed, 12 Nov 2025 10:09:32 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 206AFC57B41
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Nov 2025 07:42:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0E03C60142;
 Mon, 10 Nov 2025 07:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20230C116B1;
 Mon, 10 Nov 2025 07:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762760525;
 bh=eoQpss3r6FYo/VoSTS5AtWz2fEfHuakzCuCNoTPYihE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SkY1ybXw4AE6CFT9Tnb2fjXUIAbi+gLXED5B4FtiMQLdokuofcghcxD+xY8/DB3dJ
 RsFOoMuXNQq3d5SOBbdv5jiaHYA5OLCtdNUvt1z1m1Cfg0fR6V8suAOhTd7pG+PJlt
 mgyglzWBw2jENzcWsjico9PyLr+Y+XkjC7+xTM9+tplbMS+EV9IAIe56PThbWWCukY
 2dSGCF9Ip5CDKH+ldtwdtxsvV8pavZqjVHWAST1KoYe7bzXRRpYAvYCUY/8Y7iMYpx
 z/6yPHa9cE79YCuAb2g/xvHnjCKsj4bj9ba/mmWaFKT0WkrJS/k1D54JNUOK67LcBG
 HHreGSjFECDgA==
From: Srinivas Kandagatla <srini@kernel.org>
To: devicetree@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
In-Reply-To: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
References: <20251020060951.30776-6-wsa+renesas@sang-engineering.com>
Message-Id: <176276050899.18134.7729831344719556570.b4-ty@kernel.org>
Date: Mon, 10 Nov 2025 07:41:48 +0000
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Mailman-Approved-At: Wed, 12 Nov 2025 10:09:31 +0000
Cc: imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 linux-sunxi@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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

Applied, thanks!

[2/4] dt-bindings: nvmem: don't check node names
      commit: 65c1bc002b27d1ac398e37ce031a45d59999cb13

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
