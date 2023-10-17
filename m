Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADE77CD0F4
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Oct 2023 01:41:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1EEB6C6C837;
	Tue, 17 Oct 2023 23:41:44 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 50504C6C831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Oct 2023 23:41:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id B1552B82113;
 Tue, 17 Oct 2023 23:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF443C433C8;
 Tue, 17 Oct 2023 23:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697586101;
 bh=cosGpqTPBP8SyGB5H3DKe/jNOoJkAxcsVXoEDGMqP/M=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Q7nuLFDt00WV1OayCAu2PTX6zT0gcHiWi6Rbc92RpYMc7tzlRkm196nRGWk2m177n
 qQOfJj/YaIwe656Gqv/l6WaX0hpyvsCjYZCE8+sD75vr3HHC8KgRdsM/+WVI0Lci8o
 MEUdmpO9uHLnV6loWfgwk1KHPEQE23PFxPxD/cGOTSiwMaay7U8gqSo9/gvMwtn8Nh
 5SuCB9MCMiTRa6WR21Nm3c5MXvP4Cn/F4ob2gk+o+e1BwXsoZ0IGyAJa2rIJW3zgAe
 dO1JI29+yBS2HJqz1f6Fqf1wpId8c4Ry0JtM50zHc8cPcBWGAtEpIaLkRgDlF8Pxcg
 nLOk6lWqh7+Ig==
From: Mark Brown <broonie@kernel.org>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>
In-Reply-To: <20231017203352.2698326-1-robh@kernel.org>
References: <20231017203352.2698326-1-robh@kernel.org>
Message-Id: <169758609942.3230802.8032777106804469822.b4-ty@kernel.org>
Date: Wed, 18 Oct 2023 00:41:39 +0100
MIME-Version: 1.0
X-Mailer: b4 0.13-dev-0438c
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [RESEND PATCH] spi: stm32: Explicitly include
 correct DT includes
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

On Tue, 17 Oct 2023 15:33:51 -0500, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: Explicitly include correct DT includes
      commit: 692225015c82d3eece55a07d16cd24c4dc63a6a5

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
