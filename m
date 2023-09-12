Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CDC79D029
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Sep 2023 13:38:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20C07C6B46F;
	Tue, 12 Sep 2023 11:38:20 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E0B6EC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Sep 2023 11:38:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0FDACCE1A30;
 Tue, 12 Sep 2023 11:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D6EC433C7;
 Tue, 12 Sep 2023 11:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694518695;
 bh=PJj+NB24qGj8OVTKKzav3otPXDkniuIk97R5xoR//QY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=nUTGLWVbPda4UyLtV2EZbX9+g8D2tnomB2NpVhWSeEjwBWiOnAPTgqauYgKgrvDUz
 C/aKFhz6YYhCDUnT1zq251Qa0YKdlxNS2N62OMj5q9zI7V+Mx+mWLhQvP1O1Ck/3Uh
 YAM5IByK6aRL3XAVTSlC0bJGaQWAVfoHm9LbJpz4EQO97TYhTDURJthkR4oRJ85Hsv
 IPvqplteBNPhjUfpOOf95fx84JZyzEjhEyduKSZEMw4BO1zQu8pcXoXNJQt9ZLeiQ3
 oukPGb97sZSHNj5No73sSkGpZXJ/83a7ITe6ZT21tOc6GfdatZtzBe75ZsBGz1SPvj
 qDznyDuGj1pBg==
From: Mark Brown <broonie@kernel.org>
To: Valentin Caron <valentin.caron@foss.st.com>
In-Reply-To: <20230906132735.748174-1-valentin.caron@foss.st.com>
References: <20230906132735.748174-1-valentin.caron@foss.st.com>
Message-Id: <169451869294.2398433.12354327819600702705.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 12:38:12 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: add a delay before SPI disable
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

On Wed, 06 Sep 2023 15:27:35 +0200, Valentin Caron wrote:
> As explained in errata sheet, in section "2.14.5 Truncation of SPI output
> signals after EOT event":
> On STM32MP1x, EOT interrupt can be thrown before the true end of
> communication.
> 
> So we add a delay of a half period to wait the real end of the
> transmission.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: add a delay before SPI disable
      commit: 6de8a70c84ee0586fdde4e671626b9caca6aed74

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
