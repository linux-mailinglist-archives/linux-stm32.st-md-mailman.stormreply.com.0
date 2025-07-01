Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7C1AF0667
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jul 2025 00:15:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51118C3F938;
	Tue,  1 Jul 2025 22:15:48 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A53E1C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jul 2025 22:15:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A8B89434F0;
 Tue,  1 Jul 2025 22:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05D7C4CEEE;
 Tue,  1 Jul 2025 22:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751408145;
 bh=4/b8oqiRmO+b+wUXBPdUv0i7HKBQMbmTAdJGmIM73J0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iFSHhob6VYlotEQFMnbn6Z/8/9kI+kAVa2ZTO38a/6avAy4RiCDdgRfKJI5XblMCF
 pYML2+zZlmGPQoP771B1+10lkm2+n4zASUeKtIIgpXk1N9PsRrowtfWiQxhMa3zwF0
 Nek4iXElagCPjfQzmQFV28fSUNXzkIN3ebbm+0R+4+/QnhkMXf1utFpJ2/6aA2oEVh
 gVFzRx5DtM5DhuCCp0AdBD2Cemhpn5WdPUAd71691epNKvg8Ohjyk2810C7ImljUlb
 rH1F9xu3fMctiylEoddORPaM//OSWMcPyiwcwvGESxdJZHyFqWRlAqbih+0h8yY+8R
 +PhiOjMvPgaIQ==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Antonio Quartulli <antonio@mandelbit.com>
In-Reply-To: <20250630081253.17294-1-antonio@mandelbit.com>
References: <20250630081253.17294-1-antonio@mandelbit.com>
Message-Id: <175140814365.710092.16438205627985189965.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 23:15:43 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: fix pointer-to-pointer
	variables usage
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

On Mon, 30 Jun 2025 10:12:53 +0200, Antonio Quartulli wrote:
> In stm32_spi_prepare_rx_dma_mdma_chaining() both rx_dma_desc
> and rx_mdma_desc are passed as pointer-to-pointer arguments.
> 
> The goal is to pass back to the caller the value returned
> by dmaengine_prep_slave_sg(), when it is not NULL.
> 
> However, these variables are wrongly handled as simple pointers
> during later assignments and checks.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: fix pointer-to-pointer variables usage
      commit: c4f2c05ab02952c9a56067aeb700ded95b183570

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
