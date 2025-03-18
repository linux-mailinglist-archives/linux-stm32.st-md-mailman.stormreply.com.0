Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 960C7A6768B
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 15:37:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D14DC71287;
	Tue, 18 Mar 2025 14:37:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24A28CFAC44
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 14:37:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B54B85C577E;
 Tue, 18 Mar 2025 14:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D910CC4CEEE;
 Tue, 18 Mar 2025 14:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742308656;
 bh=NX4c/xiPn8V+9BjqrR5JwjDS1CkFsXXkJIJk9bxYP4U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=sevystGn180FbiON8S/zJKGGF3BOsRnLdgGsUvnNWU8O3duETbTUCDSDd9Pmk9Drf
 wr27QJbX/SilnlDN6FyFay7AmoJATbfM3Tt6bauURmkos++yd/++F4mejG9zY9jnH2
 UIdFAZ7WN8cG/zXcs67XhDeUMgCPg0rIF5VpOIl00HEUVjyGGOjdkEV+MSpBD3tdOb
 +95FzuLkYxB7LsKvEWIgV1DFZnh1Rd/rhXkiTuGR3mVCDnwgMGr5/bDR4alrwGffgX
 3m7Mnnhadkp512WY+AAS5PKqGn/fG/JjEpmLJoY8042ibRznJKcqDC0FYWrXcz4cCm
 g6PTnACR8ZfRg==
From: Mark Brown <broonie@kernel.org>
To: mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
In-Reply-To: <20250318045549.1711502-1-peng.fan@oss.nxp.com>
References: <20250318045549.1711502-1-peng.fan@oss.nxp.com>
Message-Id: <174230865462.108912.8267700120820923591.b4-ty@kernel.org>
Date: Tue, 18 Mar 2025 14:37:34 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-1b0d6
Cc: linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-ospi: Include "gpio/consumer.h"
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

On Tue, 18 Mar 2025 12:55:49 +0800, Peng Fan (OSS) wrote:
> of_gpio.h should be deprecated, use "gpio/consumer.h".
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32-ospi: Include "gpio/consumer.h"
      commit: cc1273dfac2697545adc9418c890ac194f18f523

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
