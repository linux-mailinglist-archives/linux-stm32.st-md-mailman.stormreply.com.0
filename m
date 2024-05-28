Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC8E8D1DBB
	for <lists+linux-stm32@lfdr.de>; Tue, 28 May 2024 15:57:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 03B55C6B47E;
	Tue, 28 May 2024 13:57:20 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 234CDCFAC7F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 May 2024 13:57:13 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SDcObZ029891;
 Tue, 28 May 2024 15:56:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3iMyPRzAl6P/YSbrLht+RjqstDWVPqn81XuUkiZnR+I=; b=vEk1bhIc8n7CjGg5
 x2HRcAASI53sQW4Pcc6zc9FV9e2nzcgQQPX7sUXXq9BYBepj3HtTXkaB3LvmgXZL
 IkinWSTPRbA+pXMPuE8us9knYU+ciDlyF5RgTRinULTJans/MSjaNaDdQbt6cK//
 vCjS5wXGjlVBdgMPQL4K6h83j/VmvbIE6t6+uKRYMWqvZ8jZ7HPODpq48n+h3C7E
 WtuQG2U0/0m1N3GHVWN/yaC25PahAIdohjRloO16/0zW5KtyihJEm1tHD5n7G8UN
 SGnj8JWqRjyvMhAsDC0REHgpLFCpxRVF49Ha9GsTMiOR9u1OUOj+P3fJWBHOeFMD
 JNKvmg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yb9yjcdpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 May 2024 15:56:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A161240044;
 Tue, 28 May 2024 15:56:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B107921A91B;
 Tue, 28 May 2024 15:55:26 +0200 (CEST)
Received: from [10.48.87.204] (10.48.87.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 28 May
 2024 15:55:25 +0200
Message-ID: <47ed8f22-fc8c-4fb4-89c5-7d8ef7e8e728@foss.st.com>
Date: Tue, 28 May 2024 15:55:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-crypto@vger.kernel.org>
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
 <0a37659a-1c5e-4bff-ab8e-9c777c0520d5@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <0a37659a-1c5e-4bff-ab8e-9c777c0520d5@denx.de>
X-Originating-IP: [10.48.87.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_10,2024-05-28_01,2024-05-17_01
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



On 5/21/24 12:27, Marek Vasut wrote:
> On 5/17/24 5:39 PM, Gatien CHEVALLIER wrote:
> 
> Hi,
> 
>>> Possibly. I use script as init which contains basically #!/bin/sh , 
>>> mount of a few filesystems like dev, proc, sys, and then the pm_test 
>>> sequence to avoid wasting time booting full userspace.
>>>
>> Ok,
>>
>> The strangest thing is not being to enable the clock, maybe there's
>> something on the clock driver side. Tracking clock enable/disable
>> may lead to something.
> 
> I suspect the problem is that rng_read and runtime suspend/resume can 
> run in parallel, that's why this problem occurs.
> 

Hum, this looks strange... This would need to be confirmed in your
use case. That would mean that flags aren't synced at the entry of these
functions?

>>>> FYI, I have been running your script with (echo devices > 
>>>> /sys/power/pm_test) for 5 hours now and haven't been able to 
>>>> reproduce the issue.
>>>
>>> Maybe the 'devices' test is not enough and the deeper pm_test states 
>>> have some sort of impact ?
>>>
>>
>> Maybe, I don't have the knowledge to confirm or invalidate this.
>> Tasks should be frozen before drivers are put to sleep so my instinct
>> would say no but you can't take it for granted :)
> 
> Could it be the kernel that requires randomness ?

That can be confirmed by adding traces to the entry point in random.c.
Maybe activating CONFIG_WARN_ALL_UNSEEDED_RANDOM will help investigate
this. It will add verbosity if crng isn't ready.

Or maybe try calling directely rng_is_initialized() to see if the crng
is ready when your issue occurs.

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
