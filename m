Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D11898CACB6
	for <lists+linux-stm32@lfdr.de>; Tue, 21 May 2024 12:53:16 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9C81DC6C820;
	Tue, 21 May 2024 10:53:16 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0CF8ACFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 21 May 2024 10:53:15 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 177D388743;
 Tue, 21 May 2024 12:53:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1716288794;
 bh=LzviPdFToe7N+N7RSM3aJIgPadrGjL45EsO5NgIiyEk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YIqtsrZdXQE3n0QlNZ0Es8ETEVpS9tDNxjGGX9B7kMfO1ElngRmOewRZKt04EMBwI
 vjaCvSyuIkLN5u1qJBQfCFrrjZrtKt3idMAXZB32C5GJ680x62jdIN3gDd8So+g/62
 5wSBA6muhwquFD2sYPdxAeUcckWsQkLfef0D6LcLir47CR4zps5im2TDbNwRJc2Bih
 vE+TQ0U5yHY7Vdff5n3il+RpjA0oly2PeCUX4A9gYvkFsOUQljM4tOeZuOA9Uq7aBo
 v6v7akauVsED0GgD40WFzvJVyWHb1gjjU0JzgO4Y9eZ4NZF6y5T+QffOpBpRoB5x4Z
 MmGhzTkSrbX3A==
Message-ID: <0a37659a-1c5e-4bff-ab8e-9c777c0520d5@denx.de>
Date: Tue, 21 May 2024 12:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
 linux-crypto@vger.kernel.org
References: <20240513220349.183568-1-marex@denx.de>
 <b2d0dfcb-37d6-4375-a4ad-ca96a5339840@foss.st.com>
 <cc6f98eb-f6b2-4a34-a8ed-c0f759fa4c79@denx.de>
 <51951dd4-8e8c-4e67-89f6-6a710022e34f@foss.st.com>
 <3257e8f8-5bb0-4c75-a3a3-e5685b65de2a@denx.de>
 <5b39b5b6-7008-4362-a578-3faab87cd23b@foss.st.com>
 <2eb2b80e-8650-46cf-9d8f-6dd6a884558a@denx.de>
 <eb3a2581-efc6-40c3-a7ea-551865017d40@foss.st.com>
 <c28e39e3-64d8-4ed7-a2e5-48ee124ef8e3@denx.de>
 <07d54026-5d2a-49a3-9211-bfc6e62afec3@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <07d54026-5d2a-49a3-9211-bfc6e62afec3@foss.st.com>
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

On 5/17/24 5:39 PM, Gatien CHEVALLIER wrote:

Hi,

>> Possibly. I use script as init which contains basically #!/bin/sh , 
>> mount of a few filesystems like dev, proc, sys, and then the pm_test 
>> sequence to avoid wasting time booting full userspace.
>>
> Ok,
> 
> The strangest thing is not being to enable the clock, maybe there's
> something on the clock driver side. Tracking clock enable/disable
> may lead to something.

I suspect the problem is that rng_read and runtime suspend/resume can 
run in parallel, that's why this problem occurs.

>>> FYI, I have been running your script with (echo devices > 
>>> /sys/power/pm_test) for 5 hours now and haven't been able to 
>>> reproduce the issue.
>>
>> Maybe the 'devices' test is not enough and the deeper pm_test states 
>> have some sort of impact ?
>>
> 
> Maybe, I don't have the knowledge to confirm or invalidate this.
> Tasks should be frozen before drivers are put to sleep so my instinct
> would say no but you can't take it for granted :)

Could it be the kernel that requires randomness ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
