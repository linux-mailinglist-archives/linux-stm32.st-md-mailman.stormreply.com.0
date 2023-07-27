Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5E57658C2
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jul 2023 18:33:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A30BC6B45C;
	Thu, 27 Jul 2023 16:33:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24A1BC6A5FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 16:33:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E499661EC3;
 Thu, 27 Jul 2023 16:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECC5C433C8;
 Thu, 27 Jul 2023 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690475583;
 bh=0bmDrqdBNU+lM91YHrJx1FgQFfSmuEoLzE5acnoZ0AQ=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=DTpkLFxlOF/4kUszccSnhwYDsaiSoP7K8U/SJo34OeH7WZcC+0rgIrQ3Sv0sQ+uj7
 Kk4ZS0QIJaSs/ugCAFEZAzzxL8YEH1+SIi9ln6mk7lUsK/EXNeItW1AEmISnPjnREN
 odyrHyvPuV7qubm8agHpQxXaUlIoPg4zIvH1oVMMdhw+8eOR5Z22JFh6xFGlXH0TWx
 apBfXxXx7DwKcO+ki3B2zKLKM1HxRefh/YB6Hb2NwwNCMSF/9bQ2kiUnTt9zRnG/JT
 mubfA0vLd7fuZQzs4ALxSwAdbseLD+nsdsRHCjRfayOI6LBCnxM742250Y1dpA0QU3
 oGvVN6XFlh/bg==
From: Mark Brown <broonie@kernel.org>
To: alain.volmat@foss.st.com, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, linux-spi@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230727110558.2904084-1-ruanjinjie@huawei.com>
References: <20230727110558.2904084-1-ruanjinjie@huawei.com>
Message-Id: <169047558136.125328.1094627140074117868.b4-ty@kernel.org>
Date: Thu, 27 Jul 2023 17:33:01 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-099c9
Subject: Re: [Linux-stm32] [PATCH -next] spi: stm32: Remove redundant
	dev_err_probe()
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

On Thu, 27 Jul 2023 11:05:58 +0000, Ruan Jinjie wrote:
> There is no need to call the dev_err_probe() function directly to print
> a custom message when handling an error from platform_get_irq() function as
> it is going to display an appropriate error message in case of a failure.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: Remove redundant dev_err_probe()
      commit: b505e2ecf31b6a2a62c76203558384d7646ab02f

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
