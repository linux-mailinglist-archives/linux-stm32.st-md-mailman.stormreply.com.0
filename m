Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD0299AF3
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Oct 2020 00:45:50 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F70FC36B37;
	Mon, 26 Oct 2020 23:45:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8265C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 23:45:44 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E02C420872;
 Mon, 26 Oct 2020 23:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755943;
 bh=yizclJtwFHsgpdbAeytsLNpgwGTh0czj9w5bj6puFao=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=HM/xoo0iHClbn3JNr7iBUB8MqDDL+S3IgGq4nMlUf5NisfoG+WdcI3CdUZKBkFTLW
 vj+Yue/oLQuqXpd9x3pvqu/Xlhytm1uOixd5CTmdsDFw6H1bnnuFJtIpKSiq918E62
 bpYGx+6MTtYDUlL6yIXNHJcizQe1K0Rx7S7LumfQ=
Date: Mon, 26 Oct 2020 23:45:39 +0000
From: Mark Brown <broonie@kernel.org>
To: mark.rutland@arm.com, lgirdwood@gmail.com, robh@kernel.org, perex@perex.cz,
 tiwai@suse.com, alexandre.torgue@st.com,
 Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20201020155709.2621-1-olivier.moysan@st.com>
References: <20201020155709.2621-1-olivier.moysan@st.com>
Message-Id: <160375592348.31132.11289357992457782423.b4-ty@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] dt-bindings: stm32: convert audio
	dfsdm to json-schema
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

On Tue, 20 Oct 2020 17:57:07 +0200, Olivier Moysan wrote:
> Some audio properties documented in st,stm32-adfsdm.txt are already documented
> in Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml bindings.
> Move remaining properties from st,stm32-adfsdm.txt to st,stm32-dfsdm-adc.yaml,
> and remove st,stm32-adfsdm.txt.
> 
> Changes in v2:
> - Complete st,stm32-dfsdm-adc.yaml rather than converting st,stm32-adfsdm.txt
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] dt-bindings: stm32: dfsdm: update audio properties
      commit: f24fd10bea5961629f22e1da0f56e8c918bdb2da
[2/2] ASoC: dt-bindings: stm32: dfsdm: remove stm32-adfsdm.txt binding
      commit: ea8650730332ee3c707883a2de37756ea9122981

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
