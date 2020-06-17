Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 573421FCE6A
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2020 15:31:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9EEFC36B0D;
	Wed, 17 Jun 2020 13:31:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 46B23C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 13:31:14 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 675DF207E8;
 Wed, 17 Jun 2020 13:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592400672;
 bh=Yrztuz9ss1JEyzxZFF5ooU4M0q3ngs+arYrIpm6e7Xc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=bIqxN4xUykm3IEHS25CVNFIBUx6gWacOpy/eCd1RTBwaOXcKUG8Iz390Y6AyhfgUV
 z0aSSPKhiphwcXVXM244AQwFq51JEKjun6NumaC962lxSrcwDRgFIue2pIK+IoWBD2
 uThNmfZkWwzugDpuyCHWE3iOIh6DObfcABjIkC4c=
Date: Wed, 17 Jun 2020 14:31:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 "patrice.chotard@st.com" <patrice.chotard@st.com>
In-Reply-To: <20200616113035.4514-1-patrice.chotard@st.com>
References: <20200616113035.4514-1-patrice.chotard@st.com>
Message-Id: <159240067072.19521.18133995970522150258.b4-ty@kernel.org>
Cc: mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] spi: stm32-qspi: Fix error path in case of
	-EPROBE_DEFER
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Tue, 16 Jun 2020 13:30:35 +0200, patrice.chotard@st.com wrote:
> In case of -EPROBE_DEFER, stm32_qspi_release() was called
> in any case which unregistered driver from pm_runtime framework
> even if it has not been registered yet to it. This leads to:
> 
> stm32-qspi 58003000.spi: can't setup spi0.0, status -13
> spi_master spi0: spi_device register error /soc/spi@58003000/mx66l51235l@0
> spi_master spi0: Failed to create SPI device for /soc/spi@58003000/mx66l51235l@0
> stm32-qspi 58003000.spi: can't setup spi0.1, status -13
> spi_master spi0: spi_device register error /soc/spi@58003000/mx66l51235l@1
> spi_master spi0: Failed to create SPI device for /soc/spi@58003000/mx66l51235l@1
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-qspi: Fix error path in case of -EPROBE_DEFER
      commit: 35700e221b18fa53401e5f315be90af9e0bbcdca

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
