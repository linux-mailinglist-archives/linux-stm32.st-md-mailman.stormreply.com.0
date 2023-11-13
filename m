Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3837D7E9571
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Nov 2023 04:24:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E855DC6C831;
	Mon, 13 Nov 2023 03:24:01 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 24E17C6C837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Nov 2023 03:24:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 93832CE1045;
 Mon, 13 Nov 2023 03:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 237CAC43397;
 Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699845835;
 bh=JUnsdCqz3WfcCEsI96srKVFHvE5WeW6CUmBQHypg64Y=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=XO7mD6UAKN8nq9R3JWrzb+MBw4dFmYjxoxrNYghN50KIXOlV60EmzVBfvQ0+AlgDc
 XfW5zTWEKZPq+rKMzhXIdAt+MO/E0SSsyGPf7VYnsNVTQQp//wiUXSUx6v5CGw9zeq
 qp/vpUaxdR7poqBfDmTGDUH8jpnioZBTu6xqlsk+NwKyssls6oUttDfD2hYCpYIX7U
 HQe83dMKkKzgxekRaXlogD/lilBR3eWyWxZ4FnrXsjrolDHYDNvofy4MP32EjM96SY
 cswxKh4OIVaH/0u+uG5EOjXEvFGrHasdc9yWUpWLrF6ogOLjmthl585KREFlRVmnu5
 NoBmqT6APGTPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 0458BE32713; Mon, 13 Nov 2023 03:23:55 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <169984583501.27851.815318901545645450.git-patchwork-notify@kernel.org>
Date: Mon, 13 Nov 2023 03:23:55 +0000
References: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230920125829.1478827-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: lee@kernel.org, linus.walleij@linaro.org, rafael.j.wysocki@intel.com,
 pavel@ucw.cz, groeck@chromium.org, windhl@126.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel.lezcano@linaro.org,
 chrome-platform@lists.linux.dev, arnd@arndb.de, samuel@sholland.org,
 o2g.org.ru@gmail.com, michal.simek@amd.com, ruanjinjie@huawei.com,
 frank.li@vivo.com, jernej.skrabec@gmail.com, joewu@msi.com, mitr@volny.cz,
 robert.jarzmik@free.fr, wens@csie.org, agross@kernel.org,
 linux-input@vger.kernel.org, jeff@labundy.com, linux-sunxi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, mcoquelin.stm32@gmail.com,
 michael.hennerich@analog.com, robh@kernel.org, ye.xingchen@zte.com.cn,
 kvalo@kernel.org, rostedt@goodmis.org, hdegoede@redhat.com, lis8215@gmail.com,
 christophe.jaillet@wanadoo.fr, Jonathan.Cameron@huawei.com,
 andriy.shevchenko@linux.intel.com, bleung@chromium.org,
 linux-arm-kernel@lists.infradead.org, pabeni@redhat.com,
 support.opensource@diasemi.com, chenjun102@huawei.com,
 gregkh@linuxfoundation.org, mkorpershoek@baylibre.com,
 dmitry.torokhov@gmail.com, konrad.dybcio@linaro.org,
 krzysztof.kozlowski@linaro.org, kernel@pengutronix.de,
 patches@opensource.cirrus.com, dmitry.baryshkov@linaro.org, corbet@lwn.net,
 andersson@kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/52] input: Convert to platform remove
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
by Dmitry Torokhov <dmitry.torokhov@gmail.com>:

On Wed, 20 Sep 2023 14:57:37 +0200 you wrote:
> Hello,
> 
> this series converts all platform drivers below drivers/input to use
> remove_new. The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.
> 
> [...]

Here is the summary with links:
  - [02/52] input: cros_ec_keyb - Convert to platform remove callback returning void
    https://git.kernel.org/chrome-platform/c/63ef64cb6453

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
