Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B1753FBD2
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jun 2022 12:46:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9502DC5EC56;
	Tue,  7 Jun 2022 10:46:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 54408C5E2C6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jun 2022 10:46:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 48BA261555;
 Tue,  7 Jun 2022 10:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F1CC385A5;
 Tue,  7 Jun 2022 10:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598806;
 bh=0XbIFrMxz3J5HCy9+gf4RCodZycEv9+xgNZt/QFGOT8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RvTsaVHpVrxLyCqoN3OqP6I5RvBLFqnyRRCM/ZrDvSxdHEotVyNTlHVeQU6XvRyLz
 KT3R3++Q0CPyn+LXqZpjWcXBLDmDmms6NP5jlGoYLePioqIpeRlKY0Yo1xiuYc2i7y
 hsk9ZeEm2+jGKJp8kpSlsnGpHgPLBUSPEPE0NhpeZZKAh4LryiNwthoY8x8tMoV4rd
 YItPN64avShfiNMbSNN7ZtkT+HdXjyhJ/SkvIJuCc6gv4OZL3xpGS6mmOWwmNdwjrV
 dcAs/wgO9OxVnNy2DP+MNEGPmFrHlP4mmPQMA1ZPe5EIErt640bJodo8IyYtPv02fi
 WDC/YWP+fLJPA==
From: Mark Brown <broonie@kernel.org>
To: alexandre.torgue@foss.st.com, patrice.chotard@foss.st.com
In-Reply-To: <20220602092540.369604-1-patrice.chotard@foss.st.com>
References: <20220602092540.369604-1-patrice.chotard@foss.st.com>
Message-Id: <165459880493.302078.4977236000024044341.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:46:44 +0100
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/3] spi: stm32-qspi: Remove unused
	parameters
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

On Thu, 2 Jun 2022 11:25:37 +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> This series cleans up spi-stm32-qspi driver by removing unused parameters
> 
> Changes since v1:
>   _ add missing patch which removes unused param for stm32_qspi_wait_poll_status()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: stm32-qspi: Remove stm32_qspi_get_mode() unused parameter
      commit: 5945ff905764ceba7eb721bac7f61c7c5ce16a50
[2/3] spi: stm32-qspi: Remove stm32_qspi_wait_cmd() unused parameter
      commit: 75c28a43a43f2c09f8feeb58413449d65a77968b
[3/3] spi: stm32-qspi: Remove stm32_qspi_wait_poll_status() unused parameter
      commit: 6ce7061a75f7edeebe8710502042810109698619

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
