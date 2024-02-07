Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2335384CDD9
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 16:21:21 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C19BCC6B476;
	Wed,  7 Feb 2024 15:21:20 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4B040C6B463
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 15:21:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1290E61856;
 Wed,  7 Feb 2024 15:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D03C433C7;
 Wed,  7 Feb 2024 15:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707319277;
 bh=G/nJs42QSxBHIw7VLRbyxA32VFnZ1LCXl9jq296Ee+M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AqBteE4VCBRnqMDjHLeEAuRUl6X5DlM2b4SEZk9IcJs68QVblBkvEamDC1UWi1CzI
 /TtyxHBeuFAW6vLpHOE082b4T/AfZ5nTX/FTMmcAs1vrsIat5LCraku5cprtFu6WKf
 PUIIS/1Si9Uc2wqccagfZ6kLudgtfkfpzr5TnwQZCYccwVjPZoYKps3Af+X76kf20m
 nNyUt+Uxy4lwljpPrhGXvKinxKkTmnMEYdH6utj98d9RrRiPVis3eNxL0tm7TkSYG/
 3sFqPDMEdiVvYdp8rog+GKYWfV3jkfNiR+pAswVMuGx82NhWYvqYH5zEiXaCo/yW4j
 naOiat9SGYTYg==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, David Lechner <dlechner@baylibre.com>
In-Reply-To: <20240206200648.1782234-1-dlechner@baylibre.com>
References: <20240206200648.1782234-1-dlechner@baylibre.com>
Message-Id: <170731927648.1061486.14426168465610494014.b4-ty@kernel.org>
Date: Wed, 07 Feb 2024 15:21:16 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-0438c
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: drop gpf arg from
	__spi_split_transfer_maxsize()
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

On Tue, 06 Feb 2024 14:06:46 -0600, David Lechner wrote:
> The __spi_split_transfer_maxsize() function has a gpf argument to allow
> callers to specify the type of memory allocation that needs to be used.
> However, this function only allocates struct spi_transfer and is not
> intended to be used from atomic contexts so this type should always be
> GFP_KERNEL, so we can just drop the argument.
> 
> Some callers of these functions also passed GFP_DMA, but since only
> struct spi_transfer is allocated and not any tx/rx buffers, this is
> not actually necessary and is removed in this commit.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: drop gpf arg from __spi_split_transfer_maxsize()
      commit: c0c0293cf7a0f21ef461956d44e4add718574f3f

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
