Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65492B072EA
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Jul 2025 12:14:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 19E2BC32EB5;
	Wed, 16 Jul 2025 10:14:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 52C12C32E93
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Jul 2025 10:14:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1D62C5C5B28;
 Wed, 16 Jul 2025 10:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8949BC4CEF6;
 Wed, 16 Jul 2025 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752660889;
 bh=ZAJ4hltXuvDrA1GGiGb4i5399iwHMLmhNwupb9CXkxs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hOKeeCU/pjKMC2NPJSWQ8DxIWEIVjScFWz7ziwxLtCmiGmFGtOzcvx0qzFB0gHEwj
 y3OAaC7OkmqXklzm5qmGZyMddX5ZvHHv6x+F8EQa/5mf4t3Mz5v5IEQeyFH6uJt1ox
 8JIoXzdurcQ2DS5bSHmAiKnPPw2A5jNQca/KpbXj5/OACZlCbUj5ZZ5D78mG3bNOZA
 sWqPKHNfcwDb0aWX6xKZge46mh1CzDsLdG5AUcSzkBQQnYVSWO+9DZSBhXDlIqmFIC
 GJPGPGNigitGA8Jm2ggCFE+WNxwyG1EwuLnzjfEH4VMMs58WUl3jzo8TV/TU7g1oyn
 JYN71CvwLzciQ==
From: Mark Brown <broonie@kernel.org>
To: Support Opensource <support.opensource@diasemi.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
Message-Id: <175266088527.17737.6588270584150732640.b4-ty@kernel.org>
Date: Wed, 16 Jul 2025 11:14:45 +0100
MIME-Version: 1.0
X-Mailer: b4 0.15-dev-cff91
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/6] sound: convert from clk round_rate()
 to determine_rate()
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

On Thu, 10 Jul 2025 11:51:06 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the rtc subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Coccinelle semantic patch:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] sound: soc: codecs: da7219: convert from round_rate() to determine_rate()
      commit: 8a4d73121d6bd9a70895e65d6d1014ed6b0a6c8e
[2/6] sound: soc: codecs: rt5682: convert from round_rate() to determine_rate()
      commit: 4e15a10f6fb254e33d73a6da3c4d00e3e64d2eb8
[3/6] sound: soc: codecs: rt5682s: convert from round_rate() to determine_rate()
      commit: a37d9c8aef1c78876eff0bc8980a889c083de89d
[4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert from round_rate() to determine_rate()
      commit: fc62ed665eb2e8fb0f1e12ab9cdb578666704a76
[5/6] sound: soc: stm: stm32_i2s: convert from round_rate() to determine_rate()
      commit: afd529d740028a41fa750d4491b106cecbccba3e
[6/6] sound: soc: stm: stm32_sai_sub: convert from round_rate() to determine_rate()
      commit: d5f317fd5cd9dfdf5bbe11384001817760c12b75

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
