Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D5CCCAD70
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Dec 2025 09:21:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB26BC5663A;
	Thu, 18 Dec 2025 08:21:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 800C3C030AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Dec 2025 08:21:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 41B1541E52;
 Thu, 18 Dec 2025 08:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5581C4CEFB;
 Thu, 18 Dec 2025 08:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766046099;
 bh=lwZky4Sy93K9y11fSHxmJSRldxUDXgP06dp7jqDCMlI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cFSSX/HSJ7LZ6qlKgCo2crWokvtu3I43Toqfg195RazIZYiSnNKRTALn5hHHmDl64
 L+KgQbUDDi761XJ034i1NN+Q8JpzjSmZl/RJIZNTDcU/aH/Iwd+NpT3nZVh/GbCSnF
 1G7q/N81N5+whcxTysGOM0CphtEi9GFLqD5DvFK+bFF8TszGFNrGIVD0TNsXs3h74V
 Pg/gwwWhaLXK3NhiJSPGrm8CnosSoUyPeMLaiKbbhSfHqWygj730lm/iU/tciIUkGA
 /xbYtni/ICrsDfuG+fvgpo6Ygbm5e7sqnk4jVOjCu6giKSonfjVwltKPR2YjjbETB/
 b7IrGpzjtJYCQ==
From: Mark Brown <broonie@kernel.org>
To: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 Chen Ni <nichen@iscas.ac.cn>
In-Reply-To: <20251217023721.1684244-1-nichen@iscas.ac.cn>
References: <20251217023721.1684244-1-nichen@iscas.ac.cn>
Message-Id: <176604609753.49312.11376425894198542181.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 08:21:37 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-47773
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: Remove unneeded semicolon
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

On Wed, 17 Dec 2025 10:37:21 +0800, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-qspi: Remove unneeded semicolon
      commit: 7f7b350e4a65446f5d52ea8ae99e12eac8a972db

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
