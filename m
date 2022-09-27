Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3C25ECC61
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Sep 2022 20:48:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ABD99C63328;
	Tue, 27 Sep 2022 18:48:42 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98908C63325
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Sep 2022 18:48:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8184A61A01;
 Tue, 27 Sep 2022 18:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FEFBC433C1;
 Tue, 27 Sep 2022 18:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664304518;
 bh=DdiNQ6ubKx38dAQV29xM1ugIafN4xWawCAnztFVD/6c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=gjT4XcceYv7AuT1HcN8uPqr079VEGiZhNM+h8ESBi0D9G6LetQhKR2E+CBjvJAxus
 FiADT+J7pbBms5Kr2ColQhjbpwtdWbDIZcoS+P/8Izk+/bPqviikf91G16r2OmO/LW
 F4W1OJWgL15MNmMvj2Laf5ga7yYljhTuUs9bd3iW5S/vn5VrGMCiTglOFijmTcnLgL
 U8smJwZTMyp7KPJWMFTN3hMh+ouWHiedAUwTN7vr5aveZMtoRz3dI3TyxsMXGYhrfT
 M6NekLtUHGE5kGLcpBmENYtw6gIfNVrll/fg0hqjXQZxioWLLogTukx2PjCqPJqtZR
 RhLs601fconGQ==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, arnaud.pouliquen@foss.st.com,
 lgirdwood@gmail.com, mcoquelin.stm32@gmail.com, 
 Zhang Qilong <zhangqilong3@huawei.com>, olivier.moysan@foss.st.com
In-Reply-To: <20220927142640.64647-1-zhangqilong3@huawei.com>
References: <20220927142640.64647-1-zhangqilong3@huawei.com>
Message-Id: <166430451684.508490.13326782067739160405.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 19:48:36 +0100
MIME-Version: 1.0
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 -next] ASoC: stm: Fix PM disable depth
	imbalance in stm32_i2s_probe
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

On Tue, 27 Sep 2022 22:26:40 +0800, Zhang Qilong wrote:
> The pm_runtime_enable will increase power disable depth. Thus
> a pairing decrement is needed on the error handling path to
> keep it balanced according to context. We fix it by moving
> pm_runtime_enable to the endding of stm32_i2s_probe.
> 
> Fixes:32a956a1fadf ("ASoC: stm32: i2s: add pm_runtime support")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm: Fix PM disable depth imbalance in stm32_i2s_probe
      commit: 93618e5e05a3ce4aa6750268c5025bdb4cb7dc6e

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
