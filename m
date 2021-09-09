Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB1D405A42
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Sep 2021 17:39:37 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63D27C5A4D5;
	Thu,  9 Sep 2021 15:39:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A485EC59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Sep 2021 15:39:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BD1C61101;
 Thu,  9 Sep 2021 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631201973;
 bh=T/mw/UbjbrrOlnUVot7WIwHPaeG3mY6jLafZbnQXNto=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i8P0a3DYUqvolCsgpd39ALimrV04sYugsuGLc5z5sEQyVPkWyJFfAxH7cg9M1R2z5
 R/MKKdhX6Q7jDQZ7CZI/XES508M3xPOjd2XQuoSAilrOegH5H66zULlkHCLu0SFYJG
 DjLdUAQ8UPe5bXX2KeP3Q/qK0WC46Mb32vGS7fSBdcLt8MKvNiLCHRgEHg7CVBrlvH
 GiwtibH8jKOviM/abCb6w4QW1kXZRdpuONi+172Esj+bnZTO6ogtN+SF/yEYr0zjl/
 yGOvVIO5gTOh4eNh5pILwXnsMvc6/jxgChwt9ygrGCtKOrIw9u1L95SbNUDk9qtME7
 iUj+hTgHtlBTA==
From: Mark Brown <broonie@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Thu,  9 Sep 2021 16:38:51 +0100
Message-Id: <163120168200.50116.15964820004324884962.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210909145449.24388-1-arnaud.pouliquen@foss.st.com>
References: <20210909145449.24388-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] MAINTAINERS: fix update references to
	stm32 audio bindings
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

On Thu, 9 Sep 2021 16:54:49 +0200, Arnaud Pouliquen wrote:
> The 00d38fd8d2524 ("MAINTAINERS: update references to stm32 audio bindings")
> commit update the bindings reference, by
> removing bindings/sound/st,stm32-adfsdm.txt, to set the
> new reference to bindings/iio/adc/st,stm32-*.yaml.
> 
> This leads to "get_maintainer finds" the match for the
> Documentation/devicetree/bindings/iio/adc/st,stm32-dfsdm-adc.yaml,
> but also to the IIO bindings
> Documentation/devicetree/bindings/iio/adc/st,stm32-adc.yaml
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] MAINTAINERS: fix update references to stm32 audio bindings
      commit: 26be23af1866eead5a29f8501f9d774ac277d0bd

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
