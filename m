Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4039AA39
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Jun 2021 20:42:21 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3443C57B6B;
	Thu,  3 Jun 2021 18:42:20 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AE8DC57196
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Jun 2021 18:42:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07DA5613EE;
 Thu,  3 Jun 2021 18:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622745736;
 bh=WQrPHRQ4Uy6mv7zGw5EJ9wsQksZq35+9fQzYLsvFDgg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=e1XTFevauO+76U45l2+gkVxOyE8b+lA2ZEG8V1VwuxLFozPpkdsltBw1qcnFjAa1e
 wQCDGKOq7A4slp3QfctGw+BtbnHJQ8Zt/OQtLNvLTMBUKf+D5VcSdmgo+uj3nqUKFu
 mtiKfwRoDljhf1UoAIZN0F0cA4ehR2K4VvAXd7PJXP3l3ETy9+SYIfd2Em2DCtIHU5
 bfEsyYei9fe7c8ckUkMZQSXsFg+XukcLIFyj1K74uBQXdwUtvkp2tEgs/nFtNEQGTc
 68oIJq2uFpnlgjM4/x80vHZMoDxsDGchA4javhUp0yRGrHyXrohc0lrLEpvy2h8IrV
 C+VC2hnmQi7Aw==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 patrice.chotard@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 linux-mtd@lists.infradead.org
Date: Thu,  3 Jun 2021 19:41:44 +0100
Message-Id: <162274571326.15050.6494166618231849468.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518162754.15940-1-patrice.chotard@foss.st.com>
References: <20210518162754.15940-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Cc: Mark Brown <broonie@kernel.org>
Subject: Re: [Linux-stm32] [PATCH v5 0/3] MTD: spinand: Add
	spi_mem_poll_status() support
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

On Tue, 18 May 2021 18:27:51 +0200, patrice.chotard@foss.st.com wrote:
> This series adds support for the spi_mem_poll_status() spinand
> interface.
> Some QSPI controllers allows to poll automatically memory
> status during operations (erase, read or write). This allows to
> offload the CPU for this task.
> STM32 QSPI is supporting this feature, driver update are also
> part of this series.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: spi-mem: add automatic poll status functions
      commit: c955a0cc8a286e5da1ebb88c19201e9bab8c2422
[2/3] mtd: spinand: use the spi-mem poll status APIs
      commit: 8941cd8d295e40f8ea1c0a5045d6d068b8e33eec
[3/3] spi: stm32-qspi: add automatic poll status feature
      commit: 86d1c6bbae32122c5f703b2d8acccf5d4258f2bb

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
