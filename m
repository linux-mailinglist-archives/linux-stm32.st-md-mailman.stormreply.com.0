Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8475E3AB6C2
	for <lists+linux-stm32@lfdr.de>; Thu, 17 Jun 2021 17:01:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39E44C597AE;
	Thu, 17 Jun 2021 15:01:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2F7B8C58D5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 17 Jun 2021 15:01:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9029F6113E;
 Thu, 17 Jun 2021 15:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623942110;
 bh=syZJZA6AiFXTfA5Kku0tqi/215ifUvvmL7TjrjU9VjU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cx3WU0KdGMt/U2Y8hhk/VDOEd3hdXveR1n9wgR3io3a0Zn0OebqZZgkdUsY3JinlD
 m4A89dIpspVDIrjlCNgcFZgFt4BM2IWhUOihH80inMR+tbdX/LgLRFiVS4fLzfjExH
 bxuqszWSMzTLXXT2Gf7neO53EK5eMcbgErNPyqs28DARd9i4Q/MjtAsTU+tj8ARCnS
 ODBZPLMqWJG1sGnK925teM75T4eDYiPWGRtBLbprXUbZc2fKAIvIRRL887rHvMJHlU
 1yIH8WwW7q39PXJi+rUu9/lCtjLr1+fACWtyEG3J3Aakx0Ond8QYPoONx+pW6JNsm/
 crfcQlPPOUnBw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Yang Yingliang <yangyingliang@huawei.com>, alsa-devel@alsa-project.org
Date: Thu, 17 Jun 2021 16:01:16 +0100
Message-Id: <162394075660.19104.17632705011154431628.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210617043847.1113092-1-yangyingliang@huawei.com>
References: <20210617043847.1113092-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Cc: Mark Brown <broonie@kernel.org>
Subject: Re: [Linux-stm32] [PATCH -next 0/3] ASoC: stm32: Use
	devm_platform_get_and_ioremap_resource()
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

On Thu, 17 Jun 2021 12:38:44 +0800, Yang Yingliang wrote:
> Use devm_platform_get_and_ioremap_resource() to simplify
> code.
> 
> Yang Yingliang (3):
>   ASoC: stm32: i2s: Use devm_platform_get_and_ioremap_resource()
>   ASoC: stm32: sai: Use devm_platform_get_and_ioremap_resource()
>   ASoC: stm32: spdifrx: Use devm_platform_get_and_ioremap_resource()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: stm32: i2s: Use devm_platform_get_and_ioremap_resource()
      commit: 2f1776691978dfab30717548ffec0f3fa4ad0981
[2/3] ASoC: stm32: sai: Use devm_platform_get_and_ioremap_resource()
      commit: 003ee640abaeeaa7d11f931e5bb86bdc4becb594
[3/3] ASoC: stm32: spdifrx: Use devm_platform_get_and_ioremap_resource()
      commit: f3babad47e0db3daec301975b46de5bfadc15dd4

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
