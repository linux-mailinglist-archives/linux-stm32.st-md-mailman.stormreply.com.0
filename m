Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC32E3FBCD4
	for <lists+linux-stm32@lfdr.de>; Mon, 30 Aug 2021 21:22:33 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77641C5A4D9;
	Mon, 30 Aug 2021 19:22:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 638F3C5A4D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 30 Aug 2021 19:22:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A2D0A60ED6;
 Mon, 30 Aug 2021 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630351350;
 bh=bD/PRX2r6uMy0nvYwzbiesOU91GqKICjrpxoivduALw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T19AiTfTnKyfwpgvpfv9IKG7CwFyVDnmV/mPUC0e6TOvWEVKVJ2wDB87Y1OSsUyfp
 KC0MT9n/MLMFT5iuHKDdyH/VntBfk1Jg5XJPrY0Jqz9VxRx2/HKQr7OmSRlCfjDqu0
 EmDjt9STRLwjYp4e9OssvkLkc5066zWAv58kfEt5NbMFmDshc7TJQjCBRHy0rOYc/t
 VgbS7EXNoOCRPvoJE8BAXvc2vkcdFwDkMDeQjovoP2al0ihfkyj48q6/OM78wjy8km
 SDqeV1LuqJ57ECSpg9ZCWsGehI/lfAYSC/s7DY5rIax/0tgbyi0Z2jHbAZm+jpfKzt
 cdwLBElFdT3Hw==
Date: Mon, 30 Aug 2021 15:22:29 -0400
From: Sasha Levin <sashal@kernel.org>
To: Michael Riesch <michael.riesch@wolfvision.net>
Message-ID: <YS0v9UbzoHkiU9om@sashalap>
References: <20210823143754.14294-1-michael.riesch@wolfvision.net>
 <CAGb2v67Duk_56fOKVwZsYn2HKJ99o8WJ+d4jetD2UjDsAt9BcA@mail.gmail.com>
 <568a0825-ed65-58d7-9c9c-cecb481cf9d9@wolfvision.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <568a0825-ed65-58d7-9c9c-cecb481cf9d9@wolfvision.net>
Cc: "David S . Miller" <davem@davemloft.net>, netdev <netdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 wens@kernel.org, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: dwmac-rk: fix unbalanced
 pm_runtime_enable warnings
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, Aug 30, 2021 at 09:57:51AM +0200, Michael Riesch wrote:
>Hi ChenYu,
>
>On 8/29/21 7:48 PM, Chen-Yu Tsai wrote:
>> Hi,
>>
>> On Mon, Aug 23, 2021 at 10:39 PM Michael Riesch
>> <michael.riesch@wolfvision.net> wrote:
>>>
>>> This reverts commit 2c896fb02e7f65299646f295a007bda043e0f382
>>> "net: stmmac: dwmac-rk: add pd_gmac support for rk3399" and fixes
>>> unbalanced pm_runtime_enable warnings.
>>>
>>> In the commit to be reverted, support for power management was
>>> introduced to the Rockchip glue code. Later, power management support
>>> was introduced to the stmmac core code, resulting in multiple
>>> invocations of pm_runtime_{enable,disable,get_sync,put_sync}.
>>>
>>> The multiple invocations happen in rk_gmac_powerup and
>>> stmmac_{dvr_probe, resume} as well as in rk_gmac_powerdown and
>>> stmmac_{dvr_remove, suspend}, respectively, which are always called
>>> in conjunction.
>>>
>>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>>
>> I just found that Ethernet stopped working on my RK3399 devices,
>> and I bisected it down to this patch.
>
>Oh dear. First patch in a kernel release for a while and I already break
>things.
>
>Cc: Sasha as this patch has just been applied to 5.13-stable.

I'll drop it for now, thanks for letting me know!

-- 
Thanks,
Sasha
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
