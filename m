Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7A4FE997
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Apr 2022 22:43:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1115C60495;
	Tue, 12 Apr 2022 20:43:38 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3D11DC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Apr 2022 20:43:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A433DB81CA2;
 Tue, 12 Apr 2022 20:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6889C385A5;
 Tue, 12 Apr 2022 20:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649796216;
 bh=Cmw8wmLgMEm8YJZuVKcAlwoKMyj8hH9LZ8YJbZn6dfM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GvOYUPMSkR39kxQKaw0TQCI0PjxuXpOpFHVMIfeP7m5k5YZQLJIC1sGObDUBJ97JH
 8zp8urhr371YvawcSwzW2E7uspGz0uK2sVE2Of7JnSRoEY6KECPedYOQKxuXp6myS9
 Vu6tBniFKYdwZ1xywAB+GG9/DrBVXhMo9yo9BMQzLmMMzHY+yVH0fw9gJiPMpa1pMw
 MPc0y+sd8iIMQGXuGqpDRjZlX96bsHFa+6P3Lkvk2JjB5v5cB15n3OGbSKo85mR7kx
 /QDEgymq7Z3pqqPGyoFI/9fgb2TDpQRmNSG9LBpcRgSGK+yhm4isRim8Y6/6U+C4eE
 /JYwt6ZpNTJ8A==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com
In-Reply-To: <20220412070906.2532091-1-chi.minghao@zte.com.cn>
References: <20220412070906.2532091-1-chi.minghao@zte.com.cn>
Message-Id: <164979621440.474093.2676903357878820514.b4-ty@kernel.org>
Date: Tue, 12 Apr 2022 21:43:34 +0100
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, zealci@zte.com.cn, chi.minghao@zte.com.cn,
 linux-spi@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: spi-stm32-qspi: using
	pm_runtime_resume_and_get instead of pm_runtime_get_sync
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

On Tue, 12 Apr 2022 07:09:06 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-stm32-qspi: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      commit: c6cf1fafb65dda10f3babcec76991cbc304d02b9

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
