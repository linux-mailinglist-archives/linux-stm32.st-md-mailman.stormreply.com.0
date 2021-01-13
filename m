Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 415CA2F4E8A
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Jan 2021 16:29:07 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EB0BEC5660F;
	Wed, 13 Jan 2021 15:29:06 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D66BEC424BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Jan 2021 15:29:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F54F233EA;
 Wed, 13 Jan 2021 15:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610551744;
 bh=bWsINNChrgBVID6nsVHR+SPM6eCH/SYMN0yzKSvyWLI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=XMP2/xx8ExtxJfyOqTZWgN0c/YBvqPnFh8VaLHcBswHGtFWbgsfN9YKpB0TMerCPJ
 yZPW+qv5gJ/qfncbHsAQF/GFt7RVJfeQcEDveTY3ijkQvRuzkNktbhUZBIN20nTlFF
 gQi3LJbBcBuK3+6tckwmyRd2NGuLS7rqIcUE8tS1412Or/Q6oXaHbFmfn5YZA+PrUA
 oBhZuSnErzsjj1IKDV3NJUVn9/y8Ju1SI0U6gUbaCyCCBNAzqCm/rmePtfkfF7bDQg
 T/h0UOeT7daQN8SuwBrygx1o8UiK58yhPOZQMbSxVjA5JybE/zIG6Tg4EYZMmM6EQG
 d9xq+l1SD+iZw==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, Marek Vasut <marex@denx.de>
In-Reply-To: <20210104123114.261596-1-marex@denx.de>
References: <20210104123114.261596-1-marex@denx.de>
Message-Id: <161055171029.21847.15772313801435250449.b4-ty@kernel.org>
Date: Wed, 13 Jan 2021 15:28:30 +0000
MIME-Version: 1.0
Cc: Alain Volmat <alain.volmat@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Roman Guskov <rguskov@dh-electronics.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: Simplify
	stm32h7_spi_prepare_fthlv()
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

On Mon, 4 Jan 2021 13:31:14 +0100, Marek Vasut wrote:
> Simplify stm32h7_spi_prepare_fthlv() function implementation,
> no functional change intended.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: Simplify stm32h7_spi_prepare_fthlv()
      commit: 970e8eaa08195a26ba99ec0843968cbc7ad8e947

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
