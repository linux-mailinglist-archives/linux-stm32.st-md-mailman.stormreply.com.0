Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA43A83C4
	for <lists+linux-stm32@lfdr.de>; Tue, 15 Jun 2021 17:15:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0CE86C597B0;
	Tue, 15 Jun 2021 15:15:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 84F65C58D5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 15 Jun 2021 15:15:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2306261601;
 Tue, 15 Jun 2021 15:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623770126;
 bh=MYHkuK3uOLVum0xq/JwRmdO5KG2CRJaEP6NvhWxooE8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TPSx70679wc2SPyTAXJQTTB8qN/99EfO0JW9u82hiEOlZk/mk2Ajj6KRPrMYgPvTy
 D8sLD5KFGZ6nmWRWqDMcUnXauquzMCPTEkw7GtweMvRgcC10pNUaJERbACHXBZ5VTF
 byb47NodJuZy5YeECNhOvspv9SwipYRLohFH3gGp7zwqJOYshex5Lk5qgABCmHfUXr
 E8yIgsVmy5SVqbdpPHN1NOR81f2o61M85v65BG/GShv6W8iUM5/0sEdc1ikwz+E5Rk
 GDu6qw8xu8WRAdYaZmRYa5yoAq2/vdBYnQZcZoAnWxkKCpuNVHTREm63329dAmmmu8
 ApHmeyGMyOG8g==
From: Mark Brown <broonie@kernel.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 patrice.chotard@foss.st.com
Date: Tue, 15 Jun 2021 16:15:05 +0100
Message-Id: <162376589204.36516.7751226518675364305.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615090115.30702-1-patrice.chotard@foss.st.com>
References: <20210615090115.30702-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: Remove unused qspi field
	of struct stm32_qspi_flash
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

On Tue, 15 Jun 2021 11:01:15 +0200, patrice.chotard@foss.st.com wrote:
> Remove struct stm32_qspi_flash's field qspi which is not used.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-qspi: Remove unused qspi field of struct stm32_qspi_flash
      commit: 6a5976f23dc38749afcb62cc3acf5e3e2b53d5ba

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
