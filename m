Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C9756631A95
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Nov 2022 08:49:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 525E4C65065;
	Mon, 21 Nov 2022 07:49:13 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A896C6507A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 19 Nov 2022 06:50:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B256EB82713;
 Sat, 19 Nov 2022 06:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5944BC433D6;
 Sat, 19 Nov 2022 06:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668840616;
 bh=ak6M5fgrTHQ1MM2vf+n5AubLq+AMYqmK/RRzz3/3gig=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=seXipkg9CAyFA9/DRpiD01V8ITXAB4g0Feuk+M72plAUXo40561rs1dMVurztjC0R
 UGqXlOdf3JC5VrI2IWVezRWqsbHRKhLTyD3mEBicEAh2WBWvOY+SAmQ5aoJgjdz1Vk
 5aq4YUvgNncdPRSw5IsP6xY0s8PudX8SdTsR/EyWyOmZxNi+pkZtOu70losD9BrvnB
 Du21LerJzoVvVs4d9eSLNMvDcUU7T0jOw29zyRduMgSnRBWCRcfu03u6uXJN2UHbLy
 DMpzJwBt86Z35Odc5hTd6y/3r7eqH4zheZmOWuKtOuYVHcjUBHn5l00sWabdAIfdsG
 FRNiHf2EtKUDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 37F78E29F44; Sat, 19 Nov 2022 06:50:16 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: <166884061622.19423.870710096225259467.git-patchwork-notify@kernel.org>
Date: Sat, 19 Nov 2022 06:50:16 +0000
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
In-Reply-To: <20221118224540.619276-1-uwe@kleine-koenig.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cuwe=40kleine-koenig=2Eorg=3E?=@ci.codeaurora.org
X-Mailman-Approved-At: Mon, 21 Nov 2022 07:49:11 +0000
Cc: alsa-devel@alsa-project.org, linux-staging@lists.linux.dev,
 linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-fbdev@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org, lee.jones@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, grant.likely@linaro.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
 ang.iglesiasg@gmail.com, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, openipmi-developer@lists.sourceforge.net,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@puri.sm, patches@opensource.cirrus.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, wsa@kernel.org,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 000/606] i2c: Complete conversion to
	i2c_probe_new
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
by Tzung-Bi Shih <tzungbi@kernel.org>:

On Fri, 18 Nov 2022 23:35:34 +0100 you wrote:
> Hello,
> 
> since commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type") from 2016 there is a "temporary" alternative probe
> callback for i2c drivers.
> 
> This series completes all drivers to this new callback (unless I missed
> something). It's based on current next/master.
> A part of the patches depend on commit 662233731d66 ("i2c: core:
> Introduce i2c_client_get_device_id helper function"), there is a branch that
> you can pull into your tree to get it:
> 
> [...]

Here is the summary with links:
  - [512/606] platform/chrome: cros_ec: Convert to i2c's .probe_new()
    https://git.kernel.org/chrome-platform/c/f9e510dc92df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
