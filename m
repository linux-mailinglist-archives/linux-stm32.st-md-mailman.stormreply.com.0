Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7EDCFA1CA
	for <lists+linux-stm32@lfdr.de>; Tue, 06 Jan 2026 19:25:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9923CC8F279;
	Tue,  6 Jan 2026 18:25:49 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 81A3FC8F277
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jan 2026 18:25:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7CFDA6013D;
 Tue,  6 Jan 2026 18:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36CEC116C6;
 Tue,  6 Jan 2026 18:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767723947;
 bh=slrVtXqGp2rp8qqJMjz0DpynF+Z6Or1Xuns3k46Q1B8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Rq/W70gkO2HuPi2yJnnK1gFp7NtCie2ZrAlZQ37kEFnObCPHO69ZHUXn7r9VfI+5x
 9f0UdgZCrPIYV0/or6CkdnLp0AHqGatHy6Jcjt1z1okYaNQsg5vQUX8iJHfNEK4rje
 An7i1I3Z0Gay4gmzHrrxviHMf/XB70zmVfQw7Dgodz2WL4jmCLB+ZMEuaM9N3p2scy
 y3/F7Ne8pjcv1A4YF2NM30mC4RNyDbMPeTpbyXRHDD6WQnz1oeAGV17tmge2XC/gmw
 VB4yZE/VP/Qap7eqiLDx//H1ajk+74Z7ERkTORw93N8iO3a7pC5F9pGkXpabZfPhZ1
 nHQ2mY3eYNFgw==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>
In-Reply-To: <20260106-spi_st_maybe_unused_removal-v1-0-8f5ca7136e96@foss.st.com>
References: <20260106-spi_st_maybe_unused_removal-v1-0-8f5ca7136e96@foss.st.com>
Message-Id: <176772394559.309686.18171199857083341971.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 18:25:45 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/4] drivers: spi: st: use pm_ptr and
 remove __maybe_unused
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

On Tue, 06 Jan 2026 13:14:16 +0100, Alain Volmat wrote:
> Update ST related SPI drivers in order to remove the __maybe_unused
> statements on pm related functions thanks to the usage of pm_ptr.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/4] drivers: spi: st: remove __maybe_unused for suspend/resume
      commit: d4469e4ee5da0a93eabfcb89a8c6ecdf7cf1e9be
[2/4] drivers: spi: stm32-ospi: avoid __maybe_unused and use pm_ptr
      commit: 2a2d7187f5a7238582c2bbd4a6da7595c20e55a9
[3/4] drivers: spi: stm32-qspi: avoid __maybe_unused and use pm_ptr
      commit: 10a6d7507791a667fe1d327056ac3f72934cc7de
[4/4] drivers: spi: stm32: avoid __maybe_unused and use pm_ptr
      commit: 75d208bddcca55ec31481420fbb4d6c9703ba195

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
