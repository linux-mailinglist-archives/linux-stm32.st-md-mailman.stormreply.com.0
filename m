Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D603AD26CA
	for <lists+linux-stm32@lfdr.de>; Mon,  9 Jun 2025 21:33:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3E5CC3F93B;
	Mon,  9 Jun 2025 19:33:44 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ADB8AC3F93A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Jun 2025 19:33:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ACFE1A4D466;
 Mon,  9 Jun 2025 19:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD30C4CEEB;
 Mon,  9 Jun 2025 19:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749497622;
 bh=8brKecVuvoIHo4faTS4qU03vkO3sVX0GBCpsE0YwiJI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JPHRbBW+6o7hCF/rretPK8Fd8mYgtfSi6r9mEsf5dWETA3XkHy1JsHUG/uPbVpE3q
 0aAf3FiJU6t+g9pOQNN38isOEIpeAYb8lSvcWfXEhFVC4uMRJMzrdvoZ0wvngkeQwG
 uumGElx9PT8QlDIRvs2UQI5lmYe9IdyZiSbdjjkaFQuixFyY6CHKNhxBsQwMb9yfus
 ow653GAYvLvM08es10JOZThS+rghLh2aH6BJRe7ccy1AC25RFtKKb7YJuzS0vcy+gd
 xO8cX796dvJeDTe1Fl2am8dXeTBaLCrcR2Rftg+bwq0r6eKDaVwLC7aM/RPbv3PABi
 PrQCoO7AcksUQ==
From: Mark Brown <broonie@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
In-Reply-To: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
References: <20250411-b4-upstream_ospi_reset_update-v2-0-4de7f5dd2a91@foss.st.com>
Message-Id: <174949762071.256775.12630399981085475300.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 20:33:40 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/2] reset: Add
 devm_reset_control_array_get_exclusive_released()
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

On Fri, 11 Apr 2025 14:41:09 +0200, Patrice Chotard wrote:
> Add the released variant of devm_reset_control_array_get_exclusive().
> Needed by spi-smt32-ospi driver as same reset line is also used also
> by stm32-omm driver.
> 
> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> Changes in v2:
>   - Rebased on spi/for-next (7a978d8fcf57).
>   - Remove useless check on reset.
>   - Add error handling on reset_control_acquire().
>   - Link to v1: https://lore.kernel.org/all/20250410-b4-upstream_ospi_reset_update-v1-0-74126a8ceb9c@foss.st.com/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] reset: Add devm_reset_control_array_get_exclusive_released()
      (no commit info)
[2/2] spi: stm32-ospi: Make usage of reset_control_acquire/release() API
      commit: cf2c3eceb757e3f28e6f1034f9bc178e1535f5cc

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
