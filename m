Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5012126308C
	for <lists+linux-stm32@lfdr.de>; Wed,  9 Sep 2020 17:29:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 01EC8C3FAE2;
	Wed,  9 Sep 2020 15:29:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8B86EC36B33
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  9 Sep 2020 15:29:48 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FBFA218AC;
 Wed,  9 Sep 2020 15:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599665387;
 bh=iaxL3HEU+cBabmuk8z+IP+XmfUbX5MoYwJnbPV6NtJQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=anGxX1UXNy/Et78TTGsP8AaxvbA8M4nYhCYNKsBH/NlOvMei1b2I1ylRKIEYtB9w0
 XdOrisVwKh+fEE72/mhANbBGLN9zALQYlh28PIOlVmY2IUlMcCviM21oP+dOXyGXRZ
 tzwPGwkjVhjK4oSZXnl7LVuIyaSj1EKOzfXWATiQ=
Date: Wed, 09 Sep 2020 16:29:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Amelie Delaunay <amelie.delaunay@st.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
In-Reply-To: <20200909094304.GA420136@mwanda>
References: <20200909094304.GA420136@mwanda>
Message-Id: <159966533166.54485.8003134450461101966.b4-ty@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org,
 Alain Volmat <alain.volmat@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix pm_runtime_get_sync()
	error checking
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Wed, 9 Sep 2020 12:43:04 +0300, Dan Carpenter wrote:
> The pm_runtime_get_sync() can return either 0 or 1 on success but this
> code treats 1 as a failure.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: fix pm_runtime_get_sync() error checking
      commit: c170a5a3b6944ad8e76547c4a1d9fe81c8f23ac8

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
