Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CB18BC194
	for <lists+linux-stm32@lfdr.de>; Sun,  5 May 2024 17:03:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32BB6C71283;
	Sun,  5 May 2024 15:03:33 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4BB8AC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  5 May 2024 15:03:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5A35BCE0A6A;
 Sun,  5 May 2024 15:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86834C4AF67;
 Sun,  5 May 2024 15:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1714921400;
 bh=+msvvbhi0Hm6QR6CtJbWTfEdCEiJNKIExOn3H/A3k6E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hCC8jSVyLmHpWLgo/GE1Eb1SGZItAGBNaWpJUqACd3lPLTK0Ho6NxAl0A35HGapnk
 LANQIw3keMP6DkzhCu4Lz5j1i5peDWoYyHX/vhZQ5OdEss6W5kKAIioMzY4p9Rxf/g
 9clPTmP5w5q95h0B/GACg9eRH4iI34BMKXFEp470H1q32KEmEHM9iritVBrR2siwvB
 8LOITczpHNWz/kO/TFi8uNvoFv6/LM3z2ql8XyzEDJTurYAC7Z1klDwjNU8X49p0Ma
 bG8FRKdXfs1MzRoJdQMaCrLAs07gq6ZZ0dyWFyV0eZfosa02JSiaV7IFj8mP9kDiiQ
 T5dVOc+rhTZDQ==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-spi@vger.kernel.org, 
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
In-Reply-To: <20240424135237.1329001-2-ben.wolsieffer@hefring.com>
References: <20240424135237.1329001-2-ben.wolsieffer@hefring.com>
Message-Id: <171492139831.1933695.13403053334190518230.b4-ty@kernel.org>
Date: Mon, 06 May 2024 00:03:18 +0900
MIME-Version: 1.0
X-Mailer: b4 0.14-dev
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2] spi: stm32: enable controller before
	asserting CS
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

On Wed, 24 Apr 2024 09:52:38 -0400, Ben Wolsieffer wrote:
> On the STM32F4/7, the MOSI and CLK pins float while the controller is
> disabled. CS is a regular GPIO, and therefore always driven. Currently,
> the controller is enabled in the transfer_one() callback, which runs
> after CS is asserted.  Therefore, there is a period where the SPI pins
> are floating while CS is asserted, making it possible for stray signals
> to disrupt communications. An analogous problem occurs at the end of the
> transfer when the controller is disabled before CS is released.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: enable controller before asserting CS
      commit: 52b62e7a5d4fb53ae3db3c83aee73683e5f3d2d2

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
