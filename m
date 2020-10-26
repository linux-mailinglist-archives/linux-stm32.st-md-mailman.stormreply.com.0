Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEF9299AED
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Oct 2020 00:45:41 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51EE5C36B37;
	Mon, 26 Oct 2020 23:45:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B4BEEC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 26 Oct 2020 23:45:39 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C4A1820809;
 Mon, 26 Oct 2020 23:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603755938;
 bh=k1zrWp9O22qh+WuKS8rpiY1h0T+j/FYSrPVkMy4dspw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=myP7uDKxoFHaZTQufI/w7gt5mGhd5IKADw2XCX+IEerj7nZ6LmVRP0QYc5oOU89nl
 hL998deP4S1ZUAOpVX/yhkmvkFqwBtcfD7Y035+MLEvDZRXceuggABVPKLXMSJYZx5
 Ijh8i+fMGeqmfavLlPxtAugRsKSgYgaG81pLgsOk=
Date: Mon, 26 Oct 2020 23:45:33 +0000
From: Mark Brown <broonie@kernel.org>
To: mark.rutland@arm.com, lgirdwood@gmail.com, robh@kernel.org, perex@perex.cz,
 tiwai@suse.com, alexandre.torgue@st.com,
 Olivier Moysan <olivier.moysan@st.com>
In-Reply-To: <20201009141051.27365-1-olivier.moysan@st.com>
References: <20201009141051.27365-1-olivier.moysan@st.com>
Message-Id: <160375592347.31132.11608590385209657603.b4-ty@kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] ASoC: dt-bindings: stm32: convert sai
	to json-schema
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

On Fri, 9 Oct 2020 16:10:51 +0200, Olivier Moysan wrote:
> Convert the STM32 SAI bindings to DT schema format using json-schema.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: stm32: convert sai to json-schema
      commit: 49491418c1dceb11ccb2ab841e4e5590e844378c

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
