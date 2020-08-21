Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916924DB78
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Aug 2020 18:40:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3B31FC3FAD7;
	Fri, 21 Aug 2020 16:40:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E625EC32E91
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Aug 2020 16:40:48 +0000 (UTC)
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3BC872076E;
 Fri, 21 Aug 2020 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598028046;
 bh=EvjYX8VGFAkdYRMoROfW5zmgZVwotJ8Uvmvse9ytBIQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=CeUhHNdBc9hId5eHJUHIDLQrdIWsAKSe02c8cGLV+g1ypbuJjt0Y8Ef7aZ8jnEFtj
 Wph7/zFTp9CimZU/MqWma8jD//zRYkCxXgVrZMvXTeOQO0Ks6Rukt6sAZ4EjO1RpFh
 TrfJrle1LosE+gzUk+697ian3F4pCfZsxwZGbrQg=
Date: Fri, 21 Aug 2020 17:40:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Icenowy Zheng <icenowy@aosc.io>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andy Gross <agross@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Alexandre Torgue <alexandre.torgue@st.com>
In-Reply-To: <20200821111135.0b958d3a@xhacker.debian>
References: <20200821111135.0b958d3a@xhacker.debian>
Message-Id: <159802800846.25815.3400807374016781922.b4-ty@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 00/15] regulator: Fix W=1 build warning
	when CONFIG_OF=n
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

On Fri, 21 Aug 2020 11:11:35 +0800, Jisheng Zhang wrote:
> Fixing W=1 build warning when no support for device tree is there.
> 
> Since v1:
>   - fix the warning with __maybe_unused instead of CONFIG_OF macro
>   - add 3 more patches to fix the same issue
> 
> Jisheng Zhang (15):
>   regulator: 88pg86x: Fix W=1 build warning when CONFIG_OF=n
>   regulator: da9210: Fix W=1 build warning when CONFIG_OF=n
>   regulator: fan53555: Fix W=1 build warning when CONFIG_OF=n
>   regulator: fixed: Fix W=1 build warnings when CONFIG_OF=n
>   regulator: ltc3589: Fix W=1 build warning when CONFIG_OF=n
>   regulator: ltc3676: Fix W=1 build warning when CONFIG_OF=n
>   regulator: max1586: Fix W=1 build warning when CONFIG_OF=n
>   regulator: max77826: Fix W=1 build warning when CONFIG_OF=n
>   regulator: pwm: Fix W=1 build warning when CONFIG_OF=n
>   regulator: stm32-pwr: Fix W=1 build warning when CONFIG_OF=n
>   regulator: stm32-vrefbuf: Fix W=1 build warning when CONFIG_OF=n
>   regulator: sy8106a: Fix W=1 build warning when CONFIG_OF=n
>   regulator: qcom-rpmh: Fix W=1 build warning when CONFIG_OF=n
>   regulator: stm32-booster: Fix W=1 build warning when CONFIG_OF=n
>   regulator: tps65023: Fix W=1 build warning when CONFIG_OF=n
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[01/15] regulator: 88pg86x: Fix W=1 build warning when CONFIG_OF=n
        commit: e11e068ccbdb038e21e24ad2ee0157c902e3c9fc
[02/15] regulator: da9210: Fix W=1 build warning when CONFIG_OF=n
        commit: 2d2a84ae30a3bda57a22b283c55be8e9e6fd158b
[03/15] regulator: fan53555: Fix W=1 build warning when CONFIG_OF=n
        commit: 5e97d7e809a1fd8a2401429df13e0410b77d2142
[04/15] regulator: fixed: Fix W=1 build warnings when CONFIG_OF=n
        commit: 0f037255008386f4ac15a201678e8e4565cd91a3
[05/15] regulator: ltc3589: Fix W=1 build warning when CONFIG_OF=n
        commit: 8ece31564f1964d52eb1180ee33314c63533947e
[06/15] regulator: ltc3676: Fix W=1 build warning when CONFIG_OF=n
        commit: 1d4c1e02b96ea579f68412980ee1fe5f2ce57d8c
[07/15] regulator: max1586: Fix W=1 build warning when CONFIG_OF=n
        commit: 44bc5d168dc209bddafb3269f72a74c3cbb0d820
[08/15] regulator: max77826: Fix W=1 build warning when CONFIG_OF=n
        commit: 7bf0a29c354fc1855dc478916211b5194bab4393
[09/15] regulator: pwm: Fix W=1 build warning when CONFIG_OF=n
        commit: dc8c5ea3574e08e3c7105bbba5af5bb9c055903b
[10/15] regulator: stm32-pwr: Fix W=1 build warning when CONFIG_OF=n
        commit: a94a11ce0d5235e53bb74d54bbd5399c23abfd87
[11/15] regulator: stm32-vrefbuf: Fix W=1 build warning when CONFIG_OF=n
        commit: d5579e7a2c6aa49a183440eb4e199f4a71543762
[12/15] regulator: sy8106a: Fix W=1 build warning when CONFIG_OF=n
        commit: bbe26107204eb64e7be1b3433e8b2252edc0b375
[13/15] regulator: qcom-rpmh: Fix W=1 build warning when CONFIG_OF=n
        commit: a2508eeb8dbdf621518f8c3538d3adcb6960619c
[14/15] regulator: stm32-booster: Fix W=1 build warning when CONFIG_OF=n
        commit: b461ac1cc6c0a0bc4a788d5d65cfd82e5f3bd856
[15/15] regulator: tps65023: Fix W=1 build warning when CONFIG_OF=n
        commit: 8536bf811dd7a25d90d9128f9db98b5ed8e5bd5c

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
