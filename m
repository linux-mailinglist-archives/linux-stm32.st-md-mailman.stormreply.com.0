Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9598680AE
	for <lists+linux-stm32@lfdr.de>; Mon, 26 Feb 2024 20:16:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 97C08C6B46B;
	Mon, 26 Feb 2024 19:16:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61B21C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Feb 2024 19:16:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D6A7612EA;
 Mon, 26 Feb 2024 19:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D98C433F1;
 Mon, 26 Feb 2024 19:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708974993;
 bh=SbNCXSNgmsHvZE9a2LpECzn1pLI8U+O6zKu8IEb7FC0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MIsnQmVDw/trVh09qDNojxvjYpsL03Abgycr+6i8gxKHJQ2+p7hYTIkhhGt+zGdxZ
 GX5Pal9Wugiq54uqjJuPA+s+XvZc4zKK8WN9kr+BSzta3JBokdfEiOFEjw5Cl+v9OU
 vXsBMXBarSnIvdFeGpgCRj3pgIXW3/WXBF+OGELbRJvRzzgBED4xFg/wTKPmfDDlEP
 Y7kjz8B9/n6PYRs4xUVhaMrliNQcA5/n9rn7f7+T+s4BusEFOFiOlZXyipdARz/SdZ
 DZsTIWpdTuL1dviT0qsVPKNV4Mg2qcM1I9a3MzhqGkjOPHcWVqq/ltyn8mPr7xtaNC
 xvvXJ1cDcT8Zw==
From: Mark Brown <broonie@kernel.org>
To: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
References: <20240219-mainline-spi-precook-message-v2-0-4a762c6701b9@baylibre.com>
Message-Id: <170897499057.117217.2960696908311224436.b4-ty@kernel.org>
Date: Mon, 26 Feb 2024 19:16:30 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-a684c
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julien Stephan <jstephan@baylibre.com>,
 David Jander <david@protonic.nl>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 linux-arm-kernel@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jonathan Cameron <jic23@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [Linux-stm32] (subset) [PATCH v2 0/5] spi: add support for
 pre-cooking messages
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

On Mon, 19 Feb 2024 16:33:17 -0600, David Lechner wrote:
> This is a follow-up to [1] where it was suggested to break down the
> proposed SPI offload support into smaller series.
> 
> This takes on the first suggested task of introducing an API to
> "pre-cook" SPI messages. This idea was first discussed extensively in
> 2013 [2][3] and revisited more briefly 2022 [4].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/5] spi: add spi_optimize_message() APIs
      commit: 7b1d87af14d9ae902ed0c5dc5fabf4eea5abdf02
[2/5] spi: move splitting transfers to spi_optimize_message()
      commit: fab53fea21a909e4e0656764a8ee7c356fe89d6f
[3/5] spi: stm32: move splitting transfers to optimize_message
      commit: c2bcfe7c6edf418d5adf731a7d60a8abd81e952f
[4/5] spi: axi-spi-engine: move message compile to optimize_message
      commit: 7dba2adb063bcf7a293eacb88980e0975b1fb1fd

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
