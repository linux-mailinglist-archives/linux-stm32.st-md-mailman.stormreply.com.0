Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 889FF2C17DE
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Nov 2020 22:46:44 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7428EC56631;
	Mon, 23 Nov 2020 21:46:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7739CC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Nov 2020 21:46:41 +0000 (UTC)
Received: from localhost (cpc102334-sgyl38-2-0-cust884.18-2.cable.virginm.net
 [92.233.91.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47C43205F4;
 Mon, 23 Nov 2020 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606167999;
 bh=h1WrtCqHFEifntLejOukfoRyk+72OOTTFpb+0uydT44=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=hOY17cav9OLxzc4q5+yNWYMZC3qBgOxIfojY1YOrnf4XOvN5GnRqe2qoqBUGAZHBA
 ae4HOcBIcnqe12QMccsN8KNeGUyjqf7hrRyVVB3mMpwje/pQkISelRy2G91TIW7Vjv
 pu9FWfoprlxHwl7um2xKEdveD59KlqDgZhpU0KzY=
Date: Mon, 23 Nov 2020 21:46:16 +0000
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Alexandre Torgue <alexandre.torgue@st.com>,
 Olivier Moysan <olivier.moysan@st.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com
In-Reply-To: <20201116175133.402553-1-krzk@kernel.org>
References: <20201116175133.402553-1-krzk@kernel.org>
Message-Id: <160616797659.26421.3555642178452735947.b4-ty@kernel.org>
MIME-Version: 1.0
Cc: kernel test robot <lkp@intel.com>
Subject: Re: [Linux-stm32] [PATCH 1/4] ASoC: meson: depend on COMMON_CLK to
	fix compile tests
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

On Mon, 16 Nov 2020 18:51:30 +0100, Krzysztof Kozlowski wrote:
> The Meson SoC sound drivers use Common Clock Framework thus they cannot
> be built on platforms without it (e.g. compile test on MIPS with RALINK
> and SOC_RT305X):
> 
>     /usr/bin/mips-linux-gnu-ld: sound/soc/meson/aiu-encoder-spdif.o: in function `aiu_encoder_spdif_startup':
>     aiu-encoder-spdif.c:(.text+0x3a0): undefined reference to `clk_set_parent'
>     /usr/bin/mips-linux-gnu-ld: sound/soc/meson/axg-tdm-formatter.o: in function `axg_tdm_formatter_event':
>     (.text+0x7ec): undefined reference to `clk_set_parent'

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: meson: depend on COMMON_CLK to fix compile tests
      (no commit info)
[2/4] ASoC: sh: depend on COMMON_CLK to fix compile tests
      commit: c3d900dc905b78788c94f3a063b769bdbad16a98
[3/4] ASoC: stm: depend on COMMON_CLK to fix compile tests
      commit: 82ceffce96336ee9863f3dfde63aef5748ca4ab1
[4/4] ASoC: ti: depend on COMMON_CLK to fix compile tests
      commit: b3cf78e0dacb7fba50d0c1eb9dfa6f92d31529e2

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
