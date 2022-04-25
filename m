Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 761C450E709
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 19:24:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2649BC60462;
	Mon, 25 Apr 2022 17:24:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AEA42C5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 17:24:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9972861584;
 Mon, 25 Apr 2022 17:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E85AC385AC;
 Mon, 25 Apr 2022 17:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650907491;
 bh=6XynIAUlKU+eIGdXdXHnMxNzWfnJXAp5GLggB05OTNI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tJvKNcYpc2VeO1yqs/QUZ6q3AoGTTb4kXSVUMT5rqCCKZIdvEzdlt2iVTOz0kVThG
 UBjz40RVxYTuclx2/V4ObQiVOX7W8w31gYmN7piMU0bhbJ4SKhmE3MCniKuxK04WiF
 i3uHJ7owWC+Ko7yjMedRHFnELWeQYUPHmHThBmwGf/WigV+hyNvt/HbLOwLazH0NGN
 R5el3RbcDhArM8DJF8B2I8iWyoLWZbW+QygJ2VpXJS3Da6Va9nDRLv7cBmMc73zqAE
 FuKTcAdoEnr8BmTAhLHkPhpWFcQIBtUfnm9jwuCil8JqtZgIo4qeZWvGWSVUaV+eAb
 hjCrOrjo4pjGA==
From: Mark Brown <broonie@kernel.org>
To: cgel.zte@gmail.com, alain.volmat@foss.st.com
In-Reply-To: <20220420090452.2588930-1-chi.minghao@zte.com.cn>
References: <20220420090452.2588930-1-chi.minghao@zte.com.cn>
Message-Id: <165090748917.584172.18257693792767365784.b4-ty@kernel.org>
Date: Mon, 25 Apr 2022 18:24:49 +0100
MIME-Version: 1.0
Cc: zealci@zte.com.cn, linux-kernel@vger.kernel.org, chi.minghao@zte.com.cn,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: using
	pm_runtime_resume_and_get instead of pm_runtime_get_sync
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

On Wed, 20 Apr 2022 09:04:52 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      commit: 1af2fb6283fb82755a6fe819f863e4c3d9772e69

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
