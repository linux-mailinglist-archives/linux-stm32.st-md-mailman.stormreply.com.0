Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8308C6FD2
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 03:06:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FC31C6C83A;
	Thu, 16 May 2024 01:06:47 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B20A5C6C838
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 01:06:39 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 5A66788315;
 Thu, 16 May 2024 03:06:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1715821599;
 bh=QJClC+6WzxyR+x/of3D+2g2KGiCN9dKIFtkmnvUL3Cw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=p1poIYCKox4lkyXS2IuXta+JnRamo/j5s20s1kPHFSGHMeU/w/JGI/aDqrnf2+WRB
 cuPlPE/OqHJY7v+agA0rfVl5d9pxqY/c21A7AkoBq3SUoRitIgGFo0iT1+76rdJxco
 pyFutT1/YvNBk/2Y9/9ZLjVtFpvPCOxoWEkoO3VC9Uinm3ulTLANE5P/ZdBs4yvzwZ
 rv5e24kdEu7Z4uCmxSI8I/pFIiADoLJuqNzG4voJOOecqSBoHfNiDzQAkacrl0w7+0
 RoNFyXfWrfmUtt/2uogkqKsb2ahoLZDJOr8JGAIYJiqhY0Abn34+eIYzFeM402C2/m
 fPkPJaV0ssqNg==
Message-ID: <3257e8f8-5bb0-4c75-a3a3-e5685b65de2a@denx.de>
Date: Thu, 16 May 2024 03:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 linux-crypto@vger.kernel.org
References: <20240513220349.183568-1-marex@denx.de>
 <b2d0dfcb-37d6-4375-a4ad-ca96a5339840@foss.st.com>
 <cc6f98eb-f6b2-4a34-a8ed-c0f759fa4c79@denx.de>
 <51951dd4-8e8c-4e67-89f6-6a710022e34f@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <51951dd4-8e8c-4e67-89f6-6a710022e34f@foss.st.com>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Olivia Mackall <olivia@selenic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] [RFC] clk: stm32mp1: Keep RNG1 clock
	always running
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

On 5/15/24 11:16 AM, Gatien CHEVALLIER wrote:

Hi,

>>> What if you add a trace in a random generation function in random.c?
>>
>> Do you have a function name or line number for me ?
> 
> I put a trace in _get_random_bytes() in drivers/char/random.c. I'm not
> 100% sure but this should be the entry point when getting a random number.

You're right, there is a read attempt right before the hang, and 
__clk_is_enabled() returns 0 in stm32_read_rng() . In fact, it is the 
pm_runtime_get_sync() which is returning -EACCES instead of zero, and 
this is currently not checked so the failure is not detected before 
register access takes place, to register file with clock disabled, which 
triggers a hard hang.

I'll be sending a patch shortly, thanks for this hint !

>>> After this, I'll try to reproduce the issue.
>>
>> If you have a minute to test it on some ST MP15 board, that would be 
>> real nice. Thanks !
> 
> I tried to reproduce the issue you're facing on a STM32MP157C-DK2 no
> SCMI on the 6.9-rc7 kernel tag. I uses OP-TEE and TF-A in the bootchain
> but this should not have an impact here.
> 
> How did you manage to test using "echo core > /sys/power/pm_test"?
> In kernel/power/suspend.c, enter_state(). If the pm_test_level is core,
> then an error is fired with the following trace:
> "Unsupported test mode for suspend to idle, please choose 
> none/freezer/devices/platform."

Could this be firmware related ?

> I've tried using "echo devices > /sys/power/pm_test" so that I can at 
> least test that the driver is put to sleep then wakes up. I do not
> reproduce your issue.

Can you try 'processors' ?

I did also notice it sometimes takes much longer than a minute to hang, 
but eventually it does hang. Maybe let it cycle for an hour or a few ?

[...]

-- 
Best regards,
Marek Vasut
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
