Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EF053FBB9
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jun 2022 12:45:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6D5D7C5E2CC;
	Tue,  7 Jun 2022 10:45:36 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CC1E5C56630
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jun 2022 10:45:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 53A31B81F03;
 Tue,  7 Jun 2022 10:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5D83C385A5;
 Tue,  7 Jun 2022 10:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598734;
 bh=39oGiysk6PLHAMAwWPILJB+GlGqroBrBPZj4jX62IB4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=o94csVCXA+OwXNOQeRM+Bvnmap9v9MZ0rAAiHeWFL1aM57kgBrU8rl+uGc18tGsvV
 OftBZx5fImxQ8t3sK67imRGgDrbACv+1tfNjFJSYZQH75lX2K6zpSodINglcz8RvU+
 y/BDNnbQDVXBW+QLi8d6t9QHec23sag2Grd2XBIw5vX7JH8NREmorK7FZojhhpggmM
 sYpNTxGyyCn+sMbmOMuKkxPNZ8HuqI5Vg8RorUAYmxHJt7CDoEPTec9+M9s9ai9IJ4
 RSQIKbGzd0MiKsd3VajiCxndmGi+PAhrRBv9zkzyBcomvfix9A2E61F/+KkArL8QoP
 CClHN1pNEKXVQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, arnaud.pouliquen@foss.st.com, tangbin@cmss.chinamobile.com,
 alexandre.torgue@foss.st.com, lgirdwood@gmail.com, olivier.moysan@foss.st.com,
 mcoquelin.stm32@gmail.com, perex@perex.cz
In-Reply-To: <20220525135023.6792-1-tangbin@cmss.chinamobile.com>
References: <20220525135023.6792-1-tangbin@cmss.chinamobile.com>
Message-Id: <165459873158.301808.10178152616958894169.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:31 +0100
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm32: sai: Remove useless define
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

On Wed, 25 May 2022 21:50:23 +0800, Tang Bin wrote:
> STM_SAI_IS_SUB_B(x) and STM_SAI_BLOCK_NAME(x) are
> not being used, so remove them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: sai: Remove useless define
      commit: bf1ebcddcb19a1b6d6d8b75b75626197a5a76d4f

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
