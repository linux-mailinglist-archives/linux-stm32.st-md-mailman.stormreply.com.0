Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5674F4BFCA5
	for <lists+linux-stm32@lfdr.de>; Tue, 22 Feb 2022 16:32:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05F88C60463;
	Tue, 22 Feb 2022 15:32:43 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15A28C5A4FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 22 Feb 2022 15:32:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD59561647;
 Tue, 22 Feb 2022 15:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C803C340F4;
 Tue, 22 Feb 2022 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645543959;
 bh=faAoL7FirSWjNy55jYu7eqkfiUMVq2Vo5OiepkX3N08=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bl+UEg5QaJZxoajp2TaskeWeTKSrLzWyByqmHkRk1Km7HkHqMwDqQiw9GaHleloTU
 oTcnGOP6qt5aQB1NRQhifAF+GXjzL5MWPP68puZ7HG4IZE3+qsghyK1oLk6SMrRtlx
 zl/VjUm0bgy5n78ywoMGHz2oBvQAGi0g7gxR9lsyuCMbHvQzJ9SpmDt2CAhBFFM2UQ
 xRoPPLxE7oHJ9Ysmt2rb6jGt+g6Y44njJBPk18lNXVrK0aHe62IjJh9ldfkS0kUBZl
 LS+yWz18iqtbx+wXDEeCoIWn+FnJHmHqHBihLrxgnniq5WP8QjsgTG11jzSGbFsrDP
 KhaweSV8YFPcA==
From: Mark Brown <broonie@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
In-Reply-To: <20220201115142.3999860-1-a.fatoum@pengutronix.de>
References: <20220201115142.3999860-1-a.fatoum@pengutronix.de>
Message-Id: <164554395470.3556326.18373522553071948963.b4-ty@kernel.org>
Date: Tue, 22 Feb 2022 15:32:34 +0000
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel@pengutronix.de, Dillon Min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFT PATCH] spi: stm32: ignore Rx queue not empty
	in stm32f4 Tx only mode
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

On Tue, 1 Feb 2022 12:51:41 +0100, Ahmad Fatoum wrote:
> STM32F4_SPI_SR_RXNE and STM32F4_SPI_SR_OVR are distinct bits in the same
> status register.  ~STM32F4_SPI_SR_OVR | STM32F4_SPI_SR_RXNE is thus
> equal to ~STM32F4_SPI_SR_OVR.
> 
> The original intention was likely for transmission-only transfers to
> ignore interrupts both for when the Rx queue has bytes (RXNE) as well
> as when these bytes haven't been read in time (OVR).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: ignore Rx queue not empty in stm32f4 Tx only mode
      commit: 5741150c808b2bbeb1017609f3029daf6651b7d5

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
