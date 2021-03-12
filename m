Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFA733982F
	for <lists+linux-stm32@lfdr.de>; Fri, 12 Mar 2021 21:26:39 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 18BFCC57B53;
	Fri, 12 Mar 2021 20:26:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52316C57192
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 12 Mar 2021 20:26:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DAF864F84;
 Fri, 12 Mar 2021 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615580796;
 bh=fu+kGgm4qzieFTmHcK/JuBsoyQPQ9nadDIEi+NM6t6c=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=j2rEo+64fdPsIc6zRy2N0lEMXUyr6i5VK307b1CxRlPikSAK5PIaSJi1kZFr9biJX
 jVVnBXXxtr+zQX/EfNPRyuklpH4tfIh++11DLAwpKrfxZD2PQTmivNJkiVGNwXbF+W
 CdyatQ30MHwHqlvAf+2Ac/pdlkawP7tY/RxLHwmgJNGAjf5XQgn1gCMPwQKWkZxIBe
 2fs00yBRz+cI2ODEXpO+T41z5OCqISH5mXyNB5TWyWt+fhX+aJGwZjjyUt1LWWP35W
 8aIObKUsUlxOKSN4yFVI49BvBMBLHp6DYgknGYo4CeFpsTJI7INWV65bjvjCjREACC
 c7jiXjdTfPSNQ==
From: Mark Brown <broonie@kernel.org>
To: amelie.delaunay@foss.st.com, Alain Volmat <alain.volmat@foss.st.com>
In-Reply-To: <1615545329-5496-1-git-send-email-alain.volmat@foss.st.com>
References: <1615545329-5496-1-git-send-email-alain.volmat@foss.st.com>
Message-Id: <161558072332.11700.9252088324748070873.b4-ty@kernel.org>
Date: Fri, 12 Mar 2021 20:25:23 +0000
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-spi@vger.kernel.org, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: avoid ifdef CONFIG_PM for pm
	callbacks
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

On Fri, 12 Mar 2021 11:35:29 +0100, Alain Volmat wrote:
> Avoid CONFIG_PM preprocessor check for pm suspend/resume
> callbacks and identify the functions with __maybe_unused.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: avoid ifdef CONFIG_PM for pm callbacks
      commit: 12ef51b116693bd77395a19ba135df68ee1673f0

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
