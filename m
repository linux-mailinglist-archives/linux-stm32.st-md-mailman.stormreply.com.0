Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BDEB24C7B
	for <lists+linux-stm32@lfdr.de>; Wed, 13 Aug 2025 16:52:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 95FF1C36B16;
	Wed, 13 Aug 2025 14:52:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8A837C36B15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 13 Aug 2025 14:52:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 38BC443E5B;
 Wed, 13 Aug 2025 14:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075F7C4CEEB;
 Wed, 13 Aug 2025 14:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755096761;
 bh=W1MMJYOB6Rx7MR8HcE10hp/kPBnLLfMgHsge1n6PciY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fyGEgX4iOkFrB8UgIV9irDO0K00ZAaqgc+PnUKHiIwq7lQoqtY0uwKZSbzQ6uS/8i
 k3u/HvfLPPVF9n1PGcHXqw8Kv5zSqGrgwOI+UkL8iSQgxlhUbMBMtGr5WGOb973Vey
 wXEraOj4i6ju1TxMC1/qRCIqDaGxpKcPUYOzCoG5qbGkxFo3l2XLnIPTS7FDXaoiHi
 C2fIxy4B3rUxToAizViCSzv/EQzeL+wdgRCThZRdLG66rrAh5d7ajZbD+xeZht8B2L
 amWMuOf0657Ii8/Dx42pEbA6R2taULadoTrj8RovUtmj07TqMBricr0E1UQUr2rd/g
 o8qoAWyJZzoEg==
From: Mark Brown <broonie@kernel.org>
To: olivier.moysan@foss.st.com, arnaud.pouliquen@foss.st.com, 
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 Sergio Perez Gonzalez <sperezglz@gmail.com>
In-Reply-To: <20250729020052.404617-1-sperezglz@gmail.com>
References: <20250729020052.404617-1-sperezglz@gmail.com>
Message-Id: <175509675878.70774.11170404842428656670.b4-ty@kernel.org>
Date: Wed, 13 Aug 2025 15:52:38 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] ASoC: stm: stm32_i2s: Fix calc_clk_div()
 error handling in determine_rate()
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

On Mon, 28 Jul 2025 20:00:49 -0600, Sergio Perez Gonzalez wrote:
> calc_clk_div() will only return a non-zero value (-EINVAL)
> in case of error. On the other hand, req->rate is an unsigned long.
> It seems quite odd that req->rate would be assigned a negative value,
> which is clearly not a rate, and success would be returned.
> 
> Reinstate previous logic, which would just return error.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm: stm32_i2s: Fix calc_clk_div() error handling in determine_rate()
      commit: 0ebbab41fba1bae6ccd96c0eec17026700ac6534

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
