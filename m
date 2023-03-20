Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0AA6C204E
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Mar 2023 19:49:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B06D4C6A603;
	Mon, 20 Mar 2023 18:49:22 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6DA4C6A5F6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Mar 2023 18:49:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 934CF617B8;
 Mon, 20 Mar 2023 18:49:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AAFC433EF;
 Mon, 20 Mar 2023 18:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679338159;
 bh=CZ1ZHhw3PAwUSr1RFLcjb3EwDHIuncqBo8djo22GoX0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EYP4qmc6qfu6EjAznMtGQhzvJWIyu3VfimKLlctzdcfkx90GWy1byGmGknYl4Wy5g
 f+OLUhEcWq38tykmJqJIVnJz28QPzTaDnJ6XIYxqlkkp+9L2WfLHuAXUFWnBl5fsGx
 vVlpIjPg+eps9cXh5RCYhPtsN+fzjAfxxyGhriaE+Agzrw6x5xDP+/cxv++/m3krAL
 10jcJcCFpfXnnqwkt5hSPWszQX0vG7p+Eaw4x7M1nSqDFRZYaA6zPrTgxkQpLW1txu
 Mnw2mcHnjmIvUVv9qyzJ9JAlzkduVPg+8OWsNvJv0HSL8W707B0ZYzsevQ0j3gwXua
 oC8ObwL0L1waA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Saravanan Sekar <sravanhome@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Robert Marko <robert.marko@sartura.hr>, 
 Luka Perkov <luka.perkov@sartura.hr>, Rob Herring <robh@kernel.org>
In-Reply-To: <20230317233616.3968003-1-robh@kernel.org>
References: <20230317233616.3968003-1-robh@kernel.org>
Message-Id: <167933815234.201304.14593009652707828902.b4-ty@kernel.org>
Date: Mon, 20 Mar 2023 18:49:12 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-bd1bf
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] regulator: dt-bindings: Drop unneeded
	quotes
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

On Fri, 17 Mar 2023 18:36:14 -0500, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: dt-bindings: Drop unneeded quotes
      commit: cff5c895137cb5c3d48811881f111b17c444e2d5

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
