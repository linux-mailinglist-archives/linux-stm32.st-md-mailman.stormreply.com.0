Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3967E956D
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Nov 2023 04:23:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D77DDC6C831;
	Mon, 13 Nov 2023 03:23:58 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43D97C6B47C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Nov 2023 03:23:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 662CCB80B6C;
 Mon, 13 Nov 2023 03:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23FFBC4339A;
 Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699845835;
 bh=M3Qhhjk/BU+r9ygb4BrBodry+Iy+/+c1KAZvoMB6Rjg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=tXXHDD4vc13CqUYQaDnEhtGLHW1POo2WeYIwiz7RivcXeGCX56ZEHdMgH4lWjscCu
 TRYnwpJvawaBHgmt3cJfhHfVuEEyj9Z4oVfuW4J44Vk+fwBuqUmSiItgpGhvBEvQWa
 uUY+5xo82BA1kb1ChCxUiL+iwRg+RpcI0uc8TxmBIlmhU8AqiNRK+dsRlb77FjXT/g
 wQmKVPKgIAbBig2lnZ0zl7BxNArqSB9iMwH9Hasgm6eV8Xb3HRP1Y0E25pUR2iuJfO
 qIWWcsuFRmJ/kI0wDOLJTjshHmYrPMDwNu0Rpk8xwHufp8wdnYSlDWWi5G6haP8284
 LAsQGZ+w47fZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 E412EE32714; Mon, 13 Nov 2023 03:23:54 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <169984583492.27851.676337627622488866.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:23:54 +0000
References: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230919174931.1417681-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: alexandre.belloni@bootlin.com, jernej.skrabec@gmail.com, heiko@sntech.de,
 groeck@chromium.org, linux-iio@vger.kernel.org, trix@redhat.com,
 linus.walleij@linaro.org, claudiu.beznea@tuxon.dev, sean@geanix.com,
 idosch@nvidia.com, chrome-platform@lists.linux.dev, dmitry.torokhov@gmail.com,
 alim.akhtar@samsung.com, srinivas.pandruvada@linux.intel.com,
 gnstark@sberdevices.ru, andreas@kemnade.info, sravanhome@gmail.com,
 damien.lemoal@opensource.wdc.com, festevam@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jbrunet@baylibre.com,
 robh@kernel.org, lars@metafoo.de, benjaminfair@google.com,
 marek.vasut@gmail.com, khilman@baylibre.com, ruanjinjie@huawei.com,
 rafael.j.wysocki@intel.com, tmaimon77@gmail.com, andy.shevchenko@gmail.com,
 haibo.chen@nxp.com, daniel.lezcano@linaro.org, yuenn@google.com, wens@csie.org,
 agross@kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-imx@nxp.com,
 yangyingliang@huawei.com, konrad.dybcio@linaro.org, zhang_shurong@foxmail.com,
 linux-sunxi@lists.linux.dev, mcoquelin.stm32@gmail.com,
 linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
 tali.perry1@gmail.com, aidanmacdonald.0x0@gmail.com, frank.li@vivo.com,
 martin.blumenstingl@googlemail.com, rjui@broadcom.com, s.hauer@pengutronix.de,
 jikos@kernel.org, eugen.hristev@collabora.com, vz@mleia.com,
 bleung@chromium.org, linux-samsung-soc@vger.kernel.org, cai.huoqing@linux.dev,
 ak@it-klinger.de, linux-amlogic@lists.infradead.org,
 andriy.shevchenko@linux.intel.com, alexander.sverdlin@gmail.com,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 jkluo@hust.edu.cn, sbranden@broadcom.com, avifishman70@gmail.com,
 venture@google.com, andersson@kernel.org, samuel@sholland.org,
 nicolas.ferre@microchip.com, peda@axentia.se, nuno.sa@analog.com,
 hsweeten@visionengravers.com, krzysztof.kozlowski@linaro.org,
 dzm91@hust.edu.cn, broonie@kernel.org, kernel@pengutronix.de,
 ktsai@capellamicro.com, shawnguo@kernel.org, openbmc@lists.ozlabs.org,
 jic23@kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/49] iio: Convert to platform remove
	callback returning void
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

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Jonathan Cameron <Jonathan.Cameron@huawei.com>:

On Tue, 19 Sep 2023 19:48:42 +0200 you wrote:
> this series converts all platform drivers below drivers/iio to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side. As all platform drivers return zero unconditionally in their
> remove callback up to now, the conversions are "trivial".
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> [...]

Here is the summary with links:
  - [45/49] iio: proximity: cros_ec_mkbp: Convert to platform remove callback returning void
    https://git.kernel.org/chrome-platform/c/2df694f710d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
