Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B714342202
	for <lists+linux-stm32@lfdr.de>; Fri, 19 Mar 2021 17:37:12 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F0298C58D5B;
	Fri, 19 Mar 2021 16:37:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B66D8C56632
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 19 Mar 2021 16:37:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7CF526148E;
 Fri, 19 Mar 2021 16:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616171829;
 bh=vze3nZ9XGVQKBDHy8nsHBoCFG5qVh398Hqss19Pvgcs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZuDXGH84pbQdkB3SSfKOf0aSsTvCpyL0Mlax46k9BnxI/78JRYfBGQ2Qr2YtVdJn+
 +7goMlBb6oAJyl9Qb30pwkTAqQgWmQhNQjgXl8nb1a3ww1E/DwhVaGpthffkGr0xMt
 N2IGeaTnwA67m9c7v9kVMO/gt49gBoZGXgI/mqjnNOt+5PBKF5oZNWxR6MvsDRavEa
 PBb45JvsX0r0zNhl4PUDHvffqnE/q7fLzk1idS65IIgQaTkZgPHOBWzDKge8xsL+j1
 BbBFN0v6c04fP2PJj0cc6KD/0bqT+XX4wgAufxTc9NIiIv5Za2YZZ8/aslQq883f0v
 3/BDim9n61K6Q==
From: Mark Brown <broonie@kernel.org>
To: amelie.delaunay@foss.st.com,
	Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Mar 2021 16:37:03 +0000
Message-Id: <161617166734.9851.4969692619964809885.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1616052290-10887-1-git-send-email-alain.volmat@foss.st.com>
References: <1616052290-10887-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Cc: mcoquelin.stm32@gmail.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: Fix use-after-free on unbind
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

On Thu, 18 Mar 2021 08:24:50 +0100, Alain Volmat wrote:
> stm32_spi_remove() accesses the driver's private data after calling
> spi_unregister_master() even though that function releases the last
> reference on the spi_master and thereby frees the private data.
> 
> Fix by switching over to the new devm_spi_alloc_master() helper which
> keeps the private data accessible until the driver has unbound.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: Fix use-after-free on unbind
      commit: 79c6246ae8793448c05da86a4c82298eed8549b0

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
