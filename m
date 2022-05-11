Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E15C5523CDA
	for <lists+linux-stm32@lfdr.de>; Wed, 11 May 2022 20:50:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99F6AC57B6C;
	Wed, 11 May 2022 18:50:02 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E1B4CC035BE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 May 2022 18:50:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64FB2B8221B;
 Wed, 11 May 2022 18:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1788C340EE;
 Wed, 11 May 2022 18:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652294999;
 bh=1/F7wsDez0z3wrk2Ax/t4Z3pU9oQk4PfJkSQFlB07kQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cDqvRFyyAsMQPyM+khdB7N1GbvetpBwd8gw7x9bIgfAfpQNYRE1n6r/kuH2fdisZg
 p6jpzPYr30KC6DqpclR9v9tZzG3vbscidCN78WL38Zp/YbYgW9yuhxEIs2nsboIgqQ
 3QQiJYl798OmTnUS2DFlN9Q9dDg5IbLRLTf83HeaBWc9XcA3f08TWaM02S4KzVJ6ek
 wsW2nF2upA4jm84EIDyps12Xb/KmAt4HSQdsiEk4m41cC7Cb92dZG71GNa0L0kfyFv
 f/S1UTOD3IuHq0s76crG73KqsbLA5u1mEwBb3RQBYFh+VvNaZUbZI3T9I30fLo2uog
 0cNAkNhAZ0Ncg==
From: Mark Brown <broonie@kernel.org>
To: alexandre.torgue@foss.st.com, patrice.chotard@foss.st.com
In-Reply-To: <20220511074644.558874-1-patrice.chotard@foss.st.com>
References: <20220511074644.558874-1-patrice.chotard@foss.st.com>
Message-Id: <165229499740.364474.10772649163744226308.b4-ty@kernel.org>
Date: Wed, 11 May 2022 19:49:57 +0100
MIME-Version: 1.0
Cc: linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/3] spi: stm32-qspi: flags management
	fixes
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

On Wed, 11 May 2022 09:46:41 +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> This series update flags management in the following cases:
>   - In APM mode, don't take care of TCF and TEF flags
>   - Always check TCF flag in stm32_qspi_wait_cmd()
>   - Don't check BUSY flag when sending new command
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: stm32-qspi: Fix wait_cmd timeout in APM mode
      commit: d83d89ea68b4726700fa87b22db075e4217e691c
[2/3] spi: stm32-qspi: Always check SR_TCF flags in stm32_qspi_wait_cmd()
      commit: 0cf8d32600cf5660ee45d421f1b6e3a129ca58b6
[3/3] spi: stm32-qspi: Remove SR_BUSY bit check before sending command
      commit: ae16cc18f37bcdea7d4ef57a5e526a60b09a1506

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
