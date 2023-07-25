Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A66A76233A
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Jul 2023 22:23:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE004C6A61A;
	Tue, 25 Jul 2023 20:23:52 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC347C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Jul 2023 20:23:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1A87618D1;
 Tue, 25 Jul 2023 20:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 416C9C433CA;
 Tue, 25 Jul 2023 20:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690316630;
 bh=bAPwr4oBlSXM0dnPii56CMBcIkg2vVhTYEVrEg979Gs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=krZN915mn+2jqoxVKm7VrGO92pziVq1OXYpPTgV06kJWrU0APlZ1eYC+4Jsy062xK
 sC3UhnY/juEDDGNx4rH3g8gHugS/z93fPdcAgrdNsSW9JhhDOKCJjKf/Dxy1AIU6fZ
 jF6NokCuRkA39FPD9Xh+Y8MBuWD0CZFWvlBU9419TR639lBktF9Qg09H5mm640uls5
 qjXsItZeVnhvmbmwYnoWaOnDKewJZZMLliVQpOc/F7G7UL7s+S8k0SabwRk7BD+c0c
 z/gHLIHvl6kVrhEh4SKLNFyz6DdWpKIUL7+z4oBttwIuwtQWnWBsavsvygywOda/g2
 yot35sb9ni5Bw==
From: Mark Brown <broonie@kernel.org>
To: Saravanan Sekar <sravanhome@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Robin Gong <yibin.gong@nxp.com>, ChiYuan Huang <cy_huang@richtek.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, - <patches@opensource.cirrus.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725105421.99160-1-krzysztof.kozlowski@linaro.org>
References: <20230725105421.99160-1-krzysztof.kozlowski@linaro.org>
Message-Id: <169031662597.1614869.18358065114286958861.b4-ty@kernel.org>
Date: Tue, 25 Jul 2023 21:23:45 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] regulator: dt-bindings: add missing
 unevaluatedProperties for each regulator
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

On Tue, 25 Jul 2023 12:54:20 +0200, Krzysztof Kozlowski wrote:
> Each regulator node, which references common regulator.yaml schema,
> should disallow additional or unevaluated properties.  Otherwise
> mistakes in properties will go unnoticed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/2] regulator: dt-bindings: add missing unevaluatedProperties for each regulator
      (no commit info)
[2/2] regulator: dt-bindings: mps,mpq7920: drop incorrect ref to regulator.yaml
      commit: 55c8b8ddc0d95912c7b0d066aaa4bbac146e3c42

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
