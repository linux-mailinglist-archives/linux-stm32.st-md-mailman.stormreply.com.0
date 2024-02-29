Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E19786D44E
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Feb 2024 21:36:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 039F8C6C83D;
	Thu, 29 Feb 2024 20:36:19 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5F461C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Feb 2024 20:36:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B195CCE1A80;
 Thu, 29 Feb 2024 20:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40823C433C7;
 Thu, 29 Feb 2024 20:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709238975;
 bh=ZsVI6ulKl3T7yhn4W9VMHmXsIE6Urv1VYjHT9iHu+fc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lV4Ea4112hZJR3UCTEQmvQCrmFaWfIHmxUqhl+yyWZJLwhOYyUFg50r2JCFJdRLph
 lTgQA+pvJv7EqefW8AisKcTS/uKVLTbLQ6HrcfaeChzB/suJDS3kVwbHwD0MFfah/K
 d2OngZ+1i9y5TIr+DgRzyudvBa0Is3wMjHnE3Spl6/7uxR1i+/YXZHvv73JG7bEDtU
 Yf+kAqyF8MAu78JBtuQD7Pu8+cjek0z8o8w5QWV4icdLxDnKtOPvXHgBsbjXjpBaiK
 tK/Yv/aeb/Y4G0EFWKhzLwMcZ1M8mHHxcBZxQuObZs/tn5sxvtBbgJQVsLSGUZdce6
 g9VOvcsWPzAFA==
From: Mark Brown <broonie@kernel.org>
To: linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240228194632.3606563-1-andriy.shevchenko@linux.intel.com>
References: <20240228194632.3606563-1-andriy.shevchenko@linux.intel.com>
Message-Id: <170923897279.237390.7206796794798995947.b4-ty@kernel.org>
Date: Thu, 29 Feb 2024 20:36:12 +0000
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-a684c
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v1 1/1] spi: stm32-qspi: Replace of_gpio.h
 by proper one
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

On Wed, 28 Feb 2024 21:46:32 +0200, Andy Shevchenko wrote:
> of_gpio.h is deprecated and subject to remove.
> The driver doesn't use it directly, replace it
> with what is really being used.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-qspi: Replace of_gpio.h by proper one
      commit: bc9c0a9967fea2c0333bea26ab1bbb66c2bff31a

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
