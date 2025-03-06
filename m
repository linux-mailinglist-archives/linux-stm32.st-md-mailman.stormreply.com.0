Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF4FA55630
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Mar 2025 20:09:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BDD6EC78F6D;
	Thu,  6 Mar 2025 19:09:47 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD7FFC7802C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Mar 2025 19:09:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A425E5C12ED;
 Thu,  6 Mar 2025 19:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F50BC4CEE0;
 Thu,  6 Mar 2025 19:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741288185;
 bh=4gUFR0sw4nvaIHYvLbMR5g7jzOxVgrFF7Jlbd+HjFT0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=o5KIu1omqX47y3cQX8KbvJ5UFo1R84Uh3XRliXwF6CU9WGGUI7Qw5M/XTzsFqYebY
 OkNV/ONwZe+58SepWv9QhN33zIB78e9ZMa1PFtKepcj3aO43hB4rav939frg2/rjFa
 BVrLGbQ1LQ/cICb69LZfWlCVRg8z1KnjkZOkrchRdlg50WGnM/+2Bh/CwQ1poaw7on
 breaoY/R8U2sb8b7Dz8tVwlOi/XCYb5rfegBsVUQNfbv1zG/9Tj9ixXEVO/Q59+BWX
 RP3eVpOEo0/pL8cAgaXwDmMwIDNd8aOVm77sycsB84A6/fhxwIymQj4wiV1PkzuGCT
 HgU1x4cZQnQsA==
From: Mark Brown <broonie@kernel.org>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20250306024716.27856-1-jiapeng.chong@linux.alibaba.com>
References: <20250306024716.27856-1-jiapeng.chong@linux.alibaba.com>
Message-Id: <174128818323.185591.2600414701558020572.b4-ty@kernel.org>
Date: Thu, 06 Mar 2025 19:09:43 +0000
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-1b0d6
Cc: Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] spi: stm32: Remove unnecessary
 print function dev_err()
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

On Thu, 06 Mar 2025 10:47:16 +0800, Jiapeng Chong wrote:
> The print function dev_err() is redundant because platform_get_irq()
> already prints an error.
> 
> ./drivers/spi/spi-stm32-ospi.c:798:2-9: line 798 is redundant because platform_get_irq() already prints an error.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: Remove unnecessary print function dev_err()
      commit: 3707fd9c383fc7ae19733a3ad2e5a82bf86370a0

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
