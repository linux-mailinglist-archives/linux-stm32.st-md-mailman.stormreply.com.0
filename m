Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6C92979F5
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Oct 2020 02:28:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BD3FC424BA;
	Sat, 24 Oct 2020 00:28:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B6B87C424B3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Oct 2020 00:28:56 +0000 (UTC)
Received: from localhost (cpc102338-sgyl38-2-0-cust404.18-2.cable.virginm.net
 [77.102.33.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B76A42225E;
 Sat, 24 Oct 2020 00:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603499335;
 bh=+FhP76HiOXe3pLSCqtvML2xh8BV++5Vbe3/EWxwGkS0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dQ4WtqDRR9mWnKyBXxnLs1n5kJnoMWQ+fNdXS+7h3F1eWUPtwmG/YfyflQSUmTckJ
 xSD5QvPO5yw1C+LiYg1Az8ytrcMrDCZHcvBxNpCoKDe+qMjjf6bR40myzgnrLgS6QJ
 XP5lQqGlOZopAoGcU4sp8UyUKud4YuN/z10SQ0s4=
Date: Sat, 24 Oct 2020 01:28:53 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, perex@perex.cz, Olivier Moysan <olivier.moysan@st.com>,
 alexandre.torgue@st.com, tiwai@suse.com, arnaud.patard@rtp-net.org
In-Reply-To: <20201020150109.482-1-olivier.moysan@st.com>
References: <20201020150109.482-1-olivier.moysan@st.com>
Message-Id: <160349931941.28438.14503960964995572782.b4-ty@kernel.org>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2] ASoC: cs42l51: manage mclk shutdown
	delay
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

On Tue, 20 Oct 2020 17:01:09 +0200, Olivier Moysan wrote:
> A delay must be introduced before the shutdown down of the mclk,
> as stated in CS42L51 datasheet. Otherwise the codec may
> produce some noise after the end of DAPM power down sequence.
> The delay between DAC and CLOCK_SUPPLY widgets is too short.
> Add a delay in mclk shutdown request to manage the shutdown delay
> explicitly. From experiments, at least 10ms delay is necessary.
> Set delay to 20ms as recommended in Documentation/timers/timers-howto.rst
> when using msleep().

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l51: manage mclk shutdown delay
      commit: 20afe581c9b980848ad097c4d54dde9bec7593ef

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
