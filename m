Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E212536852A
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Apr 2021 18:49:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9811C57B53;
	Thu, 22 Apr 2021 16:49:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7C487C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Apr 2021 16:49:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8F8D4613DC;
 Thu, 22 Apr 2021 16:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619110163;
 bh=SjrDwa5HJKSmqApWHKXOGHB5NmIYxys0EV24y2IGHu4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CT0atzPmpRW6GtOZuadbObQ6Ukku/pp90uYtiqqA69dmZiWIzIV6whzZ08rdFLCdP
 sFi4ph2boeAncsngQE8DR5RfPazbARCiFDzUD2kwNg/G5KIbnX0GpQ9VRJTuqX2L6F
 lpSmepneXBhh3Mc5pml7AYayg1HB3sPe2B9nJqqxzUkxCimqyJqzKEAPIboWnIXffh
 aLvEFgNiqlBRJiNL1SHdINKxsz6yNm+mu235ddjOX1XWxwoKw5eppaekNhTHCs4w8M
 iDDF6w8VcXsq1FepXQ+3RF7bfBWtDYjP2N6AAd/nOh46TVaiY4KoIAnpNiP1DJOJuN
 rM637+dmyi21g==
From: Mark Brown <broonie@kernel.org>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnd Bergmann <arnd@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>
Date: Thu, 22 Apr 2021 17:48:46 +0100
Message-Id: <161911005747.37738.11400279333623304352.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210421140653.3964725-1-arnd@kernel.org>
References: <20210421140653.3964725-1-arnd@kernel.org>
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, Zhang Qilong <zhangqilong3@huawei.com>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: fix debug format string
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

On Wed, 21 Apr 2021 16:06:48 +0200, Arnd Bergmann wrote:
> Printing size_t needs a special %zd format modifier to avoid a
> warning like:
> 
> drivers/spi/spi-stm32-qspi.c:481:41: note: format string is defined here
>   481 |         dev_dbg(qspi->dev, "%s len = 0x%x offs = 0x%llx buf = 0x%p\n", __func__, len, offs, buf);

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-qspi: fix debug format string
      commit: 14ef64ebdc2a4564893022780907747567452f6c

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
