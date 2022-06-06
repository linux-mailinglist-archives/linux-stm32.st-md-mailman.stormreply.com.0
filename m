Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FB053E5A6
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jun 2022 18:13:37 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FE08C57B6C;
	Mon,  6 Jun 2022 16:13:37 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2636DC0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jun 2022 16:13:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C781160C1C;
 Mon,  6 Jun 2022 16:13:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA68C3411D;
 Mon,  6 Jun 2022 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654532014;
 bh=WtLr248+J7VRb1dQKlsA2bJrbWka+yrYlrb3vKRa3bk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rOiSpAV8rl4fpjVsZ2A+wbNptvo9Rt0NP8DnKg4Ob9JjuyMnef2usBKN1lEpg2SbJ
 8/z62jfj9z+BAd0yDqDOZqLFGS65aHTMlEzG4o3+wpraI0RJpJz+5TXhKAmnfWLc7p
 PFnYKBBtbTy6+x2HKVtuzR3te00KOPG7KoD+Jst1Q3E4iwve0miQGDsaO+hEQ7Vrv4
 qQnGdQG6gGWJ0OV8/NevHANxoJ43N8JuT/3kZLhrGfSV+u+afy59ueKFeBPq16+9pj
 doKdSQUWhFAESksZzp4i3X70816DTWZWnAKFyU72OsJMbYuqBq3Vu2LAnFYyhtutyR
 KBPY0hcTQMOFA==
From: Mark Brown <broonie@kernel.org>
To: alexandre.torgue@foss.st.com, patrice.chotard@foss.st.com
In-Reply-To: <20220602091022.358127-1-patrice.chotard@foss.st.com>
References: <20220602091022.358127-1-patrice.chotard@foss.st.com>
Message-Id: <165453201241.2010189.6032534787869283638.b4-ty@kernel.org>
Date: Mon, 06 Jun 2022 17:13:32 +0100
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/1] spi: spi-mem: Fix
	spi_mem_poll_status()
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

On Thu, 2 Jun 2022 11:10:22 +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> In spi_mem_exec_op(), in case cs_gpiod descriptor is set, exec_op()
> callback can't be used.
> The same must be applied in spi_mem_poll_status(), poll_status()
> callback can't be used, we must use the legacy path using
> read_poll_timeout().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: spi-mem: Fix spi_mem_poll_status()
      commit: 2283679f4c468df367830b7eb8f22d48a6940e19

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
