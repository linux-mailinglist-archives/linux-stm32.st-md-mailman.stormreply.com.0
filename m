Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A537365BDE
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Apr 2021 17:07:11 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DC0A2C5719E;
	Tue, 20 Apr 2021 15:07:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77CE3C57195
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Apr 2021 15:07:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A3F760FF1;
 Tue, 20 Apr 2021 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618931225;
 bh=xNMcMUsfGio6rPsrbelG3fNcGLs63Q8YwKi3OLjPnPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=q+yY3Q0l9TIsa9rvbhDYFMT94L+nJvaK+YStTueNISG0ZYzsUOpstWhhUnS+jEb+E
 EaXoh2q/+iNoBAFDDZ2JXTchwWORAdOc2M86DpiuoKvuuqprHl81+ClJ0y+ux64VGi
 q6CajxjMH70EtBvTWhZnerNoclorMJdvMkGGCz+SZSJ7EalCc0bDmIRrTu4P7lvDMN
 OqckAQeyV8m7Sv3uK2w7cCUdZkAtGJkYv49ucm8UB3U4u/gGDQvIjdHg50NeAh8gdP
 lngyl6dv8JcINEB85wTiBeKx8QEkpCZV32lPbs+wpB2o1tjgQrUW3ikv28VS4160/H
 b6qhsOEIOBvGg==
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 20 Apr 2021 16:06:37 +0100
Message-Id: <161893071088.55669.5165788447992164184.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210420082103.1693-1-patrice.chotard@foss.st.com>
References: <20210420082103.1693-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] spi: stm32-qspi: Fix compilation warning in ARM64
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

On Tue, 20 Apr 2021 10:21:03 +0200, patrice.chotard@foss.st.com wrote:
> This fixes warnings detected when compiling in ARM64.
> Introduced by 'commit 18674dee3cd6 ("spi: stm32-qspi: Add dirmap support")'

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-qspi: Fix compilation warning in ARM64
      commit: 1b8a7d4282c038b3846f2485d86cb990c55c38d9

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
