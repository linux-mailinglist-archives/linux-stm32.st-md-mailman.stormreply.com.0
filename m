Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AC13F5A3FCB
	for <lists+linux-stm32@lfdr.de>; Sun, 28 Aug 2022 23:04:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52CDAC5A4FD;
	Sun, 28 Aug 2022 21:04:05 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B64CCC03FC7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 28 Aug 2022 21:04:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 44190B80BA6;
 Sun, 28 Aug 2022 21:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574FAC433D6;
 Sun, 28 Aug 2022 21:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661720643;
 bh=FnUF9rYTJcPc77tbf/1+ZcTqjLp8rtPouSJhLcvpwFc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GXlQZ5TPGNr54tov+iA1ZRxY0LRGw0mZhlRimWThCDrV4vjGaJGoqtFbHux65UALs
 mISfyRR3HkmsvHlvUkjwWjwVNIGMEokNahHK8vofLJ64NSG18a77iLx7g0nRV+WnAQ
 tAy/vfQm25A90bipbJnu6r7+0OfKHkabrx8czRdvuuOnSD/yjfQpSMAa2Bo+By4uN1
 RYWaJK/AHf6wALAA6o/5oue4UTCXXRgrlUtY/AKfJJsg9iVZbEjcyJC+5wntfkyL5A
 Y56USxiHMCYFIuLaZQSxISA+UlPaaTBPLtbmIFZe6jjzH60c4yyYjafudeiIOfZAgi
 l6Q9LaTakgXDw==
From: Mark Brown <broonie@kernel.org>
To: patrice.chotard@foss.st.com
In-Reply-To: <20220826092031.1393430-1-patrice.chotard@foss.st.com>
References: <20220826092031.1393430-1-patrice.chotard@foss.st.com>
Message-Id: <166172064098.600371.16580591348148311786.b4-ty@kernel.org>
Date: Sun, 28 Aug 2022 22:04:00 +0100
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 dan.carpenter@oracle.com
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: Fix
	stm32_qspi_transfer_one_message() error path
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

On Fri, 26 Aug 2022 11:20:31 +0200, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> The patch a557fca630cc: "spi: stm32_qspi: Add transfer_one_message()
> spi callback" from Aug 23, 2022, leads to the following Smatch static
> checker warning:
> 
> drivers/spi/spi-stm32-qspi.c:627 stm32_qspi_transfer_one_message()
> error: uninitialized symbol 'ret'.Fix the following Smatch static checker warning:
> 
> [...]

Applied to

   broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-qspi: Fix stm32_qspi_transfer_one_message() error path
      commit: 56ec456293239b3c5dfb0e4dcf22972b1b8c571d

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
