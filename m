Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6392B387D90
	for <lists+linux-stm32@lfdr.de>; Tue, 18 May 2021 18:32:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2151AC57B75;
	Tue, 18 May 2021 16:32:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9CDC6C57B6F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 May 2021 16:32:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A795C611CE;
 Tue, 18 May 2021 16:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621355541;
 bh=9zV/zMdMZXIyt5TkKZX1Al7bQhnvofQXn9jJ+4sXY+c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Pw3L+NQ2oddAs5hIATArPiccMlZv2fpWGbgAh7F9385tgwppOTdazeSioMpWtV/Xk
 Zgkdiz3wwjFc0ZpZH6QfO71lSMKIR+ylhALYwN/f4Dggy8ujFiqXpam6nulUjm98pA
 xCsFLT/5x9NMDmswjKOxXJ1UBgmrm4HPUynoDHxg2eYMbqOHxjtdw5Hxbp/RS46FUS
 pZR4z6gbISoHHCDv+BSbFyvO4CCP+0Z41SglqrI3LUhJ1vYSx4FV4J/Y/B3pfZinRT
 X6IgBa7GHb0AHRv8wxk1z6zGFzoW8xaD8EMPQRNUS445YR0I7juqBWgFbTVuOFxPPA
 vaJUnU+O6rwRA==
From: Mark Brown <broonie@kernel.org>
To: amelie.delaunay@foss.st.com,
	Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 18 May 2021 17:31:26 +0100
Message-Id: <162135545749.38023.1433793383274689045.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1620796842-23546-1-git-send-email-alain.volmat@foss.st.com>
References: <1620796842-23546-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Cc: alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, mcoquelin.stm32@gmail.com,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] MAINTAINERS: Add Alain Volmat as STM32
	SPI maintainer
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

On Wed, 12 May 2021 07:20:42 +0200, Alain Volmat wrote:
> Add Alain Volmat as STM32 SPI maintainer.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] MAINTAINERS: Add Alain Volmat as STM32 SPI maintainer
      commit: d7aed20d446d8c87f5e13adf73281056b0064a45

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
