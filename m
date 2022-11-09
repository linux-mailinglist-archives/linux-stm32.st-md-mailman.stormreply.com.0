Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B65F623356
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Nov 2022 20:19:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE5FDC6504E;
	Wed,  9 Nov 2022 19:19:48 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B3020C5F1ED
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Nov 2022 19:19:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7039261C1E;
 Wed,  9 Nov 2022 19:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B427DC433C1;
 Wed,  9 Nov 2022 19:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668021585;
 bh=KjkKpABDy8OeBeVkXUOWJR/+NxgUIP0eVBrO0CIT2pg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=O7wiuRzJgFuqH/LSvl6UcOtawT2jlc4AtjpSI1SQ9Bbh0Wv0YDrx2B13Q1LA2Pu+h
 EsR+Jum1+/cfBQ6+cPuQiUwwv/HPN+ip+HdXlybqhnyUWm+Db3PBUg0nPlC5MdQopi
 RJ4xAZd8Cghqg8V2MdG2muGzdFzJULKnpoVo6tZp385JXrhmpGw4U36HCJdHyi1kNY
 6qzv6jXZl6TOvpJvYqZwQUNUM7lqTT/zfw2r+OvVZ1Z6V/kaLv8K4LNRGD/p9PjbWn
 naUMJU2xuQelSVtJ6wUegtPVMRlYSK6amfowqnPN03YCBoEo81ZhqBS+abpRXC2efH
 4V2wUGIdmiLHQ==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20221109170849.273719-1-olivier.moysan@foss.st.com>
References: <20221109170849.273719-1-olivier.moysan@foss.st.com>
Message-Id: <166802158345.681172.6341903177442237519.b4-ty@kernel.org>
Date: Wed, 09 Nov 2022 19:19:43 +0000
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: dfsdm: manage cb buffers
	cleanup
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

On Wed, 9 Nov 2022 18:08:49 +0100, Olivier Moysan wrote:
> Ensure that resources allocated by iio_channel_get_all_cb()
> are released on driver unbind.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: dfsdm: manage cb buffers cleanup
      commit: 7d945b046be3d2605dbb1806e73095aadd7ae129

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
