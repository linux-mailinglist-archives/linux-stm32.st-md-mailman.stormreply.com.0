Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C315076E4
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Apr 2022 19:57:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E602C6049A;
	Tue, 19 Apr 2022 17:57:15 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1E10C60494
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Apr 2022 17:57:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 647CBB818E8;
 Tue, 19 Apr 2022 17:57:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE04FC385A5;
 Tue, 19 Apr 2022 17:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650391032;
 bh=Lc9zJeVdQ8rSijbGWdZIUTMzP4mcZbhXcP12WkMoY0g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=t6vhbZRocd5W6GZWTR/08VvQ8eS+DwOpURNeDh2mGGxxKl4nJxOmcryDju8eejWpq
 e/TdCHwlEzdwlqqU3Z44aiHqfJOBhycK6uEKaI7iIlTdlOalUdVqf83aEsUt2syOW2
 NSClbiY03npA0NlvMW//IZnqpQf30OGX3d09/QP3Ky1zlAWAdhpUqsrKyVSCb6/XxW
 r+u1ZWNE6CQzAbaoaTnTg5iExYffGz9uw/dlKHrwzKNwBwWRT5OPLbsXLW5VtZJHCt
 ubd5uFE33c50r/gNM9ic2Sqyjy/laOJXT5u4joE9azVTb1gTcFeuWmFjqMSQiNn0jT
 Hif8cf/+yPCfw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, cgel.zte@gmail.com
In-Reply-To: <20220412071030.2532230-1-chi.minghao@zte.com.cn>
References: <20220412071030.2532230-1-chi.minghao@zte.com.cn>
Message-Id: <165039102938.1157438.13016498609633823663.b4-ty@kernel.org>
Date: Tue, 19 Apr 2022 18:57:09 +0100
MIME-Version: 1.0
Cc: zealci@zte.com.cn, chi.minghao@zte.com.cn, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] regulator: stm32-vrefbuf: using
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

On Tue, 12 Apr 2022 07:10:30 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: stm32-vrefbuf: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      commit: bfb5711e2455a239ad64dd5151fb16d195329d46

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
