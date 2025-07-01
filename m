Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F75AF066A
	for <lists+linux-stm32@lfdr.de>; Wed,  2 Jul 2025 00:15:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 647ABC3F933;
	Tue,  1 Jul 2025 22:15:52 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD9D9C3F938
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  1 Jul 2025 22:15:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 19DE8A52C54;
 Tue,  1 Jul 2025 22:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1633AC4CEEE;
 Tue,  1 Jul 2025 22:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751408149;
 bh=iOpsCmM3i8hcc7OLeyBEa+jHDCW59AkA6x9tZbiAt8M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=seT1dNqR/7PMoij3HFmGGEQKos1aaO23CoQRISQ33RsrgWD+2cZKJL0uqmdjHcRCy
 iX6M4ToLx7QfCLXmKVRcyErYw5qJY8W47yUuOpnisYPXG/V3H6PxRGFC+0CABvjNlV
 HauyL3osB8xSqwQdkm0z8WDm4E0YTuwz0EwdgeehG0DzjM8tiNTNLA8HAg8lia0yAN
 o3+erFF0cdbwCgJ/AyZZaDJcIYTpwg7qjI4C8yMMR7QvpFXEtP4BCBENkurtfEmDeb
 rre1PVilqChDuNpnYRkLifBzKkqtlHqlREImet2ivmKZcHI72vfXUit+wTj5fQeJ33
 gB2tqfcLD5ICA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
References: <2033b9fa-7b0f-4617-b94e-7b0a51c5c4b1@sabinyo.mountain>
Message-Id: <175140814783.710092.4550416995647009913.b4-ty@kernel.org>
Date: Tue, 01 Jul 2025 23:15:47 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-spi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: delete stray tabs in
 stm32h7_spi_data_idleness()
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

On Mon, 30 Jun 2025 14:35:25 -0500, Dan Carpenter wrote:
> These lines were indented one tab more than they should be.  Delete
> the stray tabs.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: delete stray tabs in stm32h7_spi_data_idleness()
      commit: 244bc18e5f1875401a4af87d2eae3f9376d9d720

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
