Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8015F90DCFB
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jun 2024 22:00:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27AEDC71282;
	Tue, 18 Jun 2024 20:00:58 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0C1BC6B460
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jun 2024 20:00:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8CBFD61978;
 Tue, 18 Jun 2024 20:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC022C3277B;
 Tue, 18 Jun 2024 20:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718740849;
 bh=fAhiLVURfgay222nRJe4+GfOvxzl6P/qliqGaISmi6o=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=k/+jn9BmLRHP49qv6veutBe42+CoigaB41DD3vIzqtznwjPDHmxPL0lxZyJq4ocXB
 U2yriGLN6gYLfLyEG0Le5P3Q0jMFzRk41ssCFR+pH9YUJEL4xP8aeMBL0omD0SPnr0
 TosWu/EsHyKnd/XPvk2B8nX9BKL1w8gh+2dHPcE+XODRg77Zm+XYdq6P4bBstrKurf
 5EDOAcq1U8Dle4axeJVrKBKAxJ8JxaHqUfOvx+6VgArq9UFnYGR8Embf92i6PyWxVe
 GEFsFiCRfiI+ak5kK+6QkBm8ZyfSL/yV99+bCNIddJlSnUn9MyOe0RcdeINLkiH8/Q
 bfSu6ZhYLOn/A==
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
In-Reply-To: <20240618132951.2743935-1-patrice.chotard@foss.st.com>
References: <20240618132951.2743935-1-patrice.chotard@foss.st.com>
Message-Id: <171874084769.162949.15399594588029522021.b4-ty@kernel.org>
Date: Tue, 18 Jun 2024 21:00:47 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14-dev-d4707
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] (subset) [PATCH 0/3] spi: OCTAL mode fixes
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

On Tue, 18 Jun 2024 15:29:48 +0200, patrice.chotard@foss.st.com wrote:
> During tests performed using spidev_test in OCTAL mode with spi-stm32-qspi.c,
> several issues has been found :
>   _ OCTAL mode wasn't supported in spi.c
>   _ CCR register wasn't set correctly when OCTAL mode is set in spi-stm32-qspi.c.
>   _ Fix dual flash mode sanity test in spi-stm32-qspi.c
> 
> Patrice Chotard (3):
>   spi: stm32: qspi: Fix dual flash mode sanity test in
>     stm32_qspi_setup()
>   spi: stm32: qspi: Clamp stm32_qspi_get_mode() output to CCR_BUSWIDTH_4
>   spi: add OCTAL mode support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: stm32: qspi: Fix dual flash mode sanity test in stm32_qspi_setup()
      commit: c2bd0791c5f02e964402624dfff45ca8995f5397
[2/3] spi: stm32: qspi: Clamp stm32_qspi_get_mode() output to CCR_BUSWIDTH_4
      commit: 63deee52811b2f84ed2da55ad47252f0e8145d62
[3/3] spi: add OCTAL mode support
      commit: d6a711a898672dd873aab3844f754a3ca40723a5

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
