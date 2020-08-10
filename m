Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF33D240D41
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Aug 2020 20:58:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AA2D6C36B26;
	Mon, 10 Aug 2020 18:58:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D031C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Aug 2020 18:58:43 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6604120774;
 Mon, 10 Aug 2020 18:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597085921;
 bh=24U7VqkQ+pHnnq6Bw4WtCe+NRWb+V7m3I56c0o8d7bk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JYLRru3ojJbQ8xF0AaEov1jm87ZY8B6yICkfUwSLpMIaBVeLpqeW45krSd4yeLP2c
 aOWU34+15Ag1eWjRzxAC31bKtHTRV0COAN6Odi65SYJchR5IGKWpmkUJMu5MP3L6II
 xZK9cklpg0S7MtGbNFtoSnUjOox4/MGEY2lIDAVs=
Date: Mon, 10 Aug 2020 19:58:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@st.com>, amelie.delaunay@st.com
In-Reply-To: <1597043558-29668-1-git-send-email-alain.volmat@st.com>
References: <1597043558-29668-1-git-send-email-alain.volmat@st.com>
Message-Id: <159708588098.21609.2579059133743645332.b4-ty@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, fabrice.gasnier@st.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/5] spi: stm32: various driver fixes
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

On Mon, 10 Aug 2020 09:12:33 +0200, Alain Volmat wrote:
> This serie is a reduced version of the serie
> [spi: stm32: various driver enhancements] previously sent.
> 
> Alain Volmat (1):
>   spi: stm32: always perform registers configuration prior to transfer
> 
> Amelie Delaunay (3):
>   spi: stm32: fix fifo threshold level in case of short transfer
>   spi: stm32: fix stm32_spi_prepare_mbr in case of odd clk_rate
>   spi: stm32: fixes suspend/resume management
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/5] spi: stm32h7: fix race condition at end of transfer
      commit: 135dd873d3c76d812ae64c668adef3f2c59ed27f
[2/5] spi: stm32: fix fifo threshold level in case of short transfer
      commit: 3373e9004acc0603242622b4378c64bc01d21b5f
[3/5] spi: stm32: fix stm32_spi_prepare_mbr in case of odd clk_rate
      commit: 9cc61973bf9385b19ff5dda4a2a7e265fcba85e4
[4/5] spi: stm32: fixes suspend/resume management
      commit: db96bf976a4fc65439be0b4524c0d41427d98814
[5/5] spi: stm32: always perform registers configuration prior to transfer
      commit: 60ccb3515fc61a0124c70aa37317f75b67560024

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
