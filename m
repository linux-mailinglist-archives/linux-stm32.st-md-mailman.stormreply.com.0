Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E85D7EA3E6
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Nov 2023 20:40:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4CFA3C6B44B;
	Mon, 13 Nov 2023 19:40:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88C85C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Nov 2023 19:40:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 1184AB80ECE;
 Mon, 13 Nov 2023 19:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E15FC433C8;
 Mon, 13 Nov 2023 19:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699904450;
 bh=Sww/WWaJ51nm84r2fYUy70d6PRu+fd6AVzmVnWzJ8Js=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Kxr8pe7ZY2+J5nJ3lS//8qGM7EfFPIW/4giAq2x9J2xGT/AX4MkvGW4gLQXy1McRX
 3MLKYj2V/ljB5JAgItq/LeuArUb81ZxdqmnevzKXzxmcoYVzo9MAN17Swm5OQjG84y
 MfZYR2aJz0fr2LL5CMB/fTF9efF7mqgOE2YQzaTLmY5pY+Tz3EAA7xD1y6XNCTmMsR
 YrfyynmdlLaQNUtWhoja90G0TGrvyQGhrCwwDlIhckTlRkOdygohQFzvH/tLEZYg6G
 pVQ/jETK0OmYzkSVEZpNLZL2qjvURE7pIopB3zeZugdOMAAI0kT29kuVhAd/lXEAfy
 4q6CyN/Y+i/RA==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ben Wolsieffer <ben.wolsieffer@hefring.com>
In-Reply-To: <20231102193722.3042245-1-ben.wolsieffer@hefring.com>
References: <20231102193722.3042245-1-ben.wolsieffer@hefring.com>
Message-Id: <169990444654.3294163.14589555385933393439.b4-ty@kernel.org>
Date: Mon, 13 Nov 2023 19:40:46 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-0438c
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] (subset) [PATCH v2 0/5] Add STM32F7 SPI support
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

On Thu, 02 Nov 2023 15:37:17 -0400, Ben Wolsieffer wrote:
> This series adds support for SPI on STM32F7 processors. The STM32F7 SPI
> peripheral is nearly identical to the STM32F4, with the only significant
> differences being that it supports a wider range of word sizes, and the
> addition of 32-bit transmit and receive FIFOs.
> 
> v2:
>   - Add missing commit body
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/5] spi: stm32: rename stm32f4_* to stm32fx_*
      commit: adde8a55daf640515edd78b7ac5f3293c3960b8e
[2/5] spi: stm32: use callbacks for read_rx and write_tx
      commit: 247ba5ea058290824862902f7ee64c20a744c461
[3/5] dt-bindings: spi: add stm32f7-spi compatible
      commit: 09388379b6d7143ed12fc06900ec9db3bb82ca8f
[4/5] spi: stm32: add STM32F7 support
      commit: a84dcb410b5f928899a53ba79ec71108700872d6

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
