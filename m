Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AD227B560
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Sep 2020 21:36:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 79965C36B37;
	Mon, 28 Sep 2020 19:36:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5B547C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Sep 2020 19:36:22 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D39D2075F;
 Mon, 28 Sep 2020 19:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601321780;
 bh=X+U7EekVVRNsGlr/phtz445aMUi09ZRhF69ImwLNLwc=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=MSJg7BXkVstJd9vEovsX824VHx5efOh2soe6NlPya2/aNU3Wc3OtyqBFwvECyCPua
 kUi8a23q4fCBu2VgEALElrnnXdhdIZWj/cHHL6OpzjwAEjLtK3yrynoHIRx/xkJWXh
 qlrSnak79xvF5ea0WZw11p7XzwmQGQMaoBfCsNic=
Date: Mon, 28 Sep 2020 20:35:23 +0100
From: Mark Brown <broonie@kernel.org>
To: linux-iio@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
Message-Id: <160132172369.55460.9237357219623604216.b4-ty@kernel.org>
Cc: linux-ide@vger.kernel.org, Valdis Klētnieks <valdis.kletnieks@vt.edu>, David Lechner <david@lechnology.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-wireless@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-block@vger.kernel.org, linux-acpi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org, Joe Perches <joe@perches.com>, linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net, drbd-dev@lists.linbit.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH 00/18] use semicolons rather than commas
	to separate statements
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

On Sun, 27 Sep 2020 21:12:10 +0200, Julia Lawall wrote:
> These patches replace commas by semicolons.  This was done using the
> Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.
> 
> This semantic patch ensures that commas inside for loop headers will not be
> transformed.  It also doesn't touch macro definitions.
> 
> Coccinelle ensures that braces are added as needed when a single-statement
> branch turns into a multi-statement one.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: debugfs: use semicolons rather than commas to separate statements
      commit: 7f4a122d0b50b40c64d24a5cf7aafe26dd9487ee

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
