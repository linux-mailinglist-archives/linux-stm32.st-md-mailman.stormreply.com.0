Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E06053F2E3E
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Aug 2021 16:39:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7DE48C57B60;
	Fri, 20 Aug 2021 14:39:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 153D3C424AF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Aug 2021 14:39:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F07F061102;
 Fri, 20 Aug 2021 14:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629470378;
 bh=rmyft8QAhVGJOYziap1b+7B6+E/IRplRFw/aa+Gh8nY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WAxY8SX0UxjbIOyvwqkL0vbhS1OaLHeFQqw40ioYh4f3Hg3sUxLI/RtEIC/gVgFuj
 2xEfQqyIt7nRunuagJ3QLKjDpimG1OOnXay4cdkB1rhXq9Pdudtp7VQ1i9Tfx0/+Nb
 pKhDGGIJgW/x5VoPp03+pj7Gq1FIcuJiDLcPr8xrRBr07vzAEUz2v9AqaYYMf8ANuT
 DkjfyIcuEQXQLtghqe0yO2XMRVftel7vgcaa2XBJ8esIRHOFxVX2bBSOTKX/bSw+qM
 oiWI1DmYpI9bYIiay8/65hIfNIjDnjrfHbT2QaENSaDoKQAUYRLGONalG78sGiMsNM
 SD23/20MbsRoQ==
From: Mark Brown <broonie@kernel.org>
To: kernel test robot <lkp@intel.com>, Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 20 Aug 2021 15:39:09 +0100
Message-Id: <162947034008.30978.4693258068045674131.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713191004.GA14729@5eb5c2cbef84>
References: <202107140345.xyOobAtH-lkp@intel.com>
 <20210713191004.GA14729@5eb5c2cbef84>
MIME-Version: 1.0
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-spi@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: fix excluded_middle.cocci
	warnings
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

On Wed, 14 Jul 2021 03:10:04 +0800, kernel test robot wrote:
> From: kernel test robot <lkp@intel.com>
> 
> drivers/spi/spi-stm32.c:915:23-25: WARNING !A || A && B is equivalent to !A || B
> 
> 
>  Condition !A || A && B is equivalent to !A || B.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: fix excluded_middle.cocci warnings
      commit: 7a4697b201a617907e4b440ae34df601d4755bef

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
