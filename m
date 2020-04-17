Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 886631ADE2C
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Apr 2020 15:22:26 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A616C36B0D;
	Fri, 17 Apr 2020 13:22:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E86BC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Apr 2020 13:22:23 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F231E20724;
 Fri, 17 Apr 2020 13:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587129742;
 bh=ApBjG0GzABKPlb6hTloJ5iIZRTvdSJEPOLZX/3D9xdE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=aybB42pK1v8St7Ynd0lCznycB8uo8tw9o7vLKnthk6G+Nir90qAFjZiUGikUjSWaY
 Pjqeqk48sBzHh5XJN0uOkSvEj6N9muanljwWT9YOzpKd36mnD8UL1sDd6jV+ulGi3O
 7wN2ZI6jQwpvnhu6QzeM0YJ1TtfcbAPWIC3Sy1EY=
Date: Fri, 17 Apr 2020 14:22:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexandre Torgue <alexandre.torgue@st.com>,
 "patrice.chotard@st.com" <patrice.chotard@st.com>
In-Reply-To: <20200417121241.6473-1-patrice.chotard@st.com>
References: <20200417121241.6473-1-patrice.chotard@st.com>
Message-Id: <158712973998.35869.11870096143660307572.b4-ty@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] spi: stm32-qspi: Add pm_runtime support
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

On Fri, 17 Apr 2020 14:12:41 +0200, patrice.chotard@st.com wrote:
> From: Patrice Chotard <patrice.chotard@st.com>
> 
> By default, STM32_AUTOSUSPEND_DELAY is set to -1 which has for
> effect to prevent runtime suspends.
> Runtime suspends can be activated by setting autosuspend_delay_ms using
> sysfs entry :
> echo {delay_in_ms} > /sys/devices/platform/soc/58003000.spi/power/autosusp
> end_delay_ms)
> 
> [...]

Applied, thanks!

[1/1] spi: stm32-qspi: Add pm_runtime support
      commit: 9d282c17b023a97516a63255ce7f7ee65c39bec1

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
