Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D913AD7080
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jun 2025 14:33:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9FA9C32E8E;
	Thu, 12 Jun 2025 12:33:32 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 77E2DC36B20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jun 2025 12:33:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 75CBCA509DF;
 Thu, 12 Jun 2025 12:33:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FC6BC4CEEA;
 Thu, 12 Jun 2025 12:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749731610;
 bh=XHmQstvfanfzC7FHLXlVhn+/xiU+w0Rr72xmTwR0M/0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=uzy2FMc79vbPGrR43FVIRsW3RKK2BWPs5tvdvyhHo3bDQ9dYV1OHot8dEKGiUkv5i
 Vqd0z7T4DoLAo0ylOfrW6XYtXff+4qksm5pM3IlbUma2a4N6zgutsOVo0gcn4BxX4P
 wZhj86qHv1QQJaiAPvNRQxw9YGjrzkiRp0jyXX1mjZ38k0/buFdv72Gj3J6YtwdeYW
 076BPvDjjiFIua3RTBbG+piMmTiimVwTcf26gBMTxO/YIobw71ZckdQmWjWvoaAHwy
 XXN4WEJU6aRr80V42EPitKowp3AuPZPS9nFYBQtBNu3i9hI2yu3LUOOxDxvwvzracR
 dDU2DcbQC2NXw==
From: Mark Brown <broonie@kernel.org>
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <aEmAGTUzzKZlLe3K@stanley.mountain>
References: <aEmAGTUzzKZlLe3K@stanley.mountain>
Message-Id: <174973160798.39704.11177150841033836429.b4-ty@kernel.org>
Date: Thu, 12 Jun 2025 13:33:27 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-c25d1
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH next] spi: stm32-ospi: clean up on error
	in probe()
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

On Wed, 11 Jun 2025 16:09:45 +0300, Dan Carpenter wrote:
> If reset_control_acquire() fails, then we can't return directly.
> We need to do a little clean up first.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: clean up on error in probe()
      commit: 83f066fac3c231e58e9adf3b307e96fee172dfb3

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
