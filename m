Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DBDA27250
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Feb 2025 13:57:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8B79CC78F7F;
	Tue,  4 Feb 2025 12:57:59 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 507EAC78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Feb 2025 19:15:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 168875C6791;
 Mon,  3 Feb 2025 19:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CC92C4CED2;
 Mon,  3 Feb 2025 19:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738610125;
 bh=BDPM7u1CRvEI1Kn3lZuF8kskwCiEX3Kitywmg+8MwZU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=hYhm3W1QYCkDsN1crFMcC5vC3MonK+qkCAOz+WwdhOVUHZ0HLjZTQAsg3tl7o9s8H
 BU+bqi9jyOYbxwC9ei76Mq8ptcXqsd5SOh/+8og70lDYJL3RqtnPerGIZTHCANkamQ
 Yckq82B8xZnfo+4rNvq7hQkLnKU+EQGYkdYhQiJAOqj4uCdhBQcjpFfp1P/bTDp3Yi
 HOV2GGByqpfdPESu++AwzdFyQr0pmhKP6IC3N45Oo9VeJUx9wz3qUds6G2jzdwYpTR
 CH+85Ld4snwX3gUvih7vhRHBGwI6rZla+uTR8mjJBtjlPBw44r3zYQ1Yg3dnH2nSQb
 8qk8l0+zUOkqw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 EB437380AA67; Mon,  3 Feb 2025 19:15:53 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173861015275.3409359.13632354633861115390.git-patchwork-notify@kernel.org>
Date: Mon, 03 Feb 2025 19:15:52 +0000
References: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
In-Reply-To: <20250103-wake_irq-v2-0-e3aeff5e9966@nxp.com>
To: Peng Fan <peng.fan@oss.nxp.com>
X-Mailman-Approved-At: Tue, 04 Feb 2025 12:57:58 +0000
Cc: linux-rtc@vger.kernel.org, len.brown@intel.com,
 alexandre.belloni@bootlin.com, peng.fan@nxp.com, mcoquelin.stm32@gmail.com,
 rafael@kernel.org, daire.mcnamara@microchip.com, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, dmitry.torokhov@gmail.com,
 linux-kernel@vger.kernel.org, conor.dooley@microchip.com, pavel@ucw.cz,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 00/12] pm: Introduce
	devm_pm_set_wake_irq
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

This series was applied to riscv/linux.git (fixes)
by Rafael J. Wysocki <rafael.j.wysocki@intel.com>:

On Fri, 03 Jan 2025 16:41:12 +0800 you wrote:
> This was a retry to address [1][2], to let common code handle
> dev_pm_clear_wake_irq. Then no need to call dev_pm_clear_wake_irq
> in each driver.remove() hook and error handling path.
> 
> In this patchset, I include input and rtc patches to show the usage
> to avoid introducing an API without users. There are still
> other places using dev_pm_clear_wake_irq. If this patchset is
> good for you, I could start to clean up other drivers such as mmc and
> etc.
> 
> [...]

Here is the summary with links:
  - [v2,01/12] PM: sleep: wakeirq: Introduce device-managed variant of dev_pm_set_wake_irq
    https://git.kernel.org/riscv/c/fd8318a32573
  - [v2,02/12] input: keyboard: ep93xx_keypad: Use devm_pm_set_wake_irq
    (no matching commit)
  - [v2,03/12] input: keyboard: omap4_keypad: Use devm_pm_set_wake_irq
    (no matching commit)
  - [v2,04/12] input: misc: nxp-bbnsm-pwrkey: Use resource managed API to simplify code
    (no matching commit)
  - [v2,05/12] input: touchscreen: ti_am335x_tsc: Use resource managed API to simplify code
    (no matching commit)
  - [v2,06/12] rtc: stm32: Use resource managed API to simplify code
    (no matching commit)
  - [v2,07/12] rtc: nxp-bbnsm: Use resource managed API to simplify code
    (no matching commit)
  - [v2,08/12] rtc: ds1343: Use devm_pm_set_wake_irq
    (no matching commit)
  - [v2,09/12] rtc: pm8xxx: Use devm_pm_set_wake_irq
    (no matching commit)
  - [v2,10/12] rtc: ab8500: Use resource managed API to simplify code
    (no matching commit)
  - [v2,11/12] rtc: mpfs: Use devm_pm_set_wake_irq
    (no matching commit)
  - [v2,12/12] rtc: pl031: Use resource managed API to simplify code
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
