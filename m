Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 57763339831
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 21:26:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2378FC57B53;
	Fri, 12 Mar 2021 20:26:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A40F4C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 20:26:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BE30F64F77;
 Fri, 12 Mar 2021 20:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615580802;
 bh=HMAWEpXbDWhHEH9FS42YarcqzmocgPc+LFqgRCF50I0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZWX7Y52PFS7sgaQBbr3Hd4Hqx6V1tG5wsQe8aAkKsPWatvju4dD++RLnnzRh0wo1F
 t/v4l7ZzRIaecOSsKazeBMS5rUWPjZTUYryTqwpHFvwj1wQklUNf4Qv25NzN289X+I
 XIsvi5LvtY47JBVl+P5YdqHZiHgtd5Pc7kOofkzWnvu0PjXU14djNtsPeEKBxEWbwO
 PQYFJTTNfW/dGHgKBf7BfpZPiOL5tz6lSNMwexyRNJ1hDgUNWYQSGd1NVb+rsD5iKa
 uURI/bHL3D6YT/ez6MjUvtYUPHKkmIvs0cIMlfMcLsV/3mqWANtlPQRIZjvxdI8Dpe
 C1qmAgK4O4TWA==
From: Mark Brown <broonie@kernel.org>
To: amelie.delaunay@foss.st.com, Alain Volmat <alain.volmat@foss.st.com>
In-Reply-To: <1615545286-5395-1-git-send-email-alain.volmat@foss.st.com>
References: <1615545286-5395-1-git-send-email-alain.volmat@foss.st.com>
Message-Id: <161558072331.11700.1813208094032197257.b4-ty@kernel.org>
Date: Fri, 12 Mar 2021 20:25:23 +0000
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-spi@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: drop devres version of
	spi_register_master
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

On Fri, 12 Mar 2021 11:34:46 +0100, Alain Volmat wrote:
> A call to spi_unregister_master() triggers calling remove()
> for all the spi devices binded to the spi master.
> 
> Some spi device driver requires to "talk" with the spi device
> during the remove(), e.g.:
> - a LCD panel like drivers/gpu/drm/panel/panel-lg-lg4573.c
>   will turn off the backlighting sending a command over spi.
> This implies that the spi master must be fully functional when
> spi_unregister_master() is called, either if it is called
> explicitly in the master's remove() code or implicitly by the
> devres framework.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: drop devres version of spi_register_master
      commit: 8d559a64f00b59af9cc02b803ff52f6e6880a651

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
