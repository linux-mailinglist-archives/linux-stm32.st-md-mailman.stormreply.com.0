Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0328C7239
	for <lists+linux-stm32@lfdr.de>; Thu, 16 May 2024 09:45:01 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9F56C6C83A;
	Thu, 16 May 2024 07:45:00 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1860CC69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 May 2024 07:44:53 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44FLuDT2005399;
 Thu, 16 May 2024 09:43:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=fGbR8sYV9QIn7SFPWuDEizW7wFbyJ157IMhZGWfECk8=; b=oY
 qfZv8rDdRNbMc7CuGM5totYTdN9MafA0OvTOD5Bg8sANV7hrr5gE+FzkxDU36Waj
 GZgSqPWrLU9QEO0tgCZh9XoJSVUXHGvM4veRgE+AphbOHcaWPUr46euV2l67MbY3
 79iR7SfUEbRcjoNwffonPiTxIhlRchgK3KbHRHkINnZeOcIYYKRAVfbZR0BSBZ7H
 OC7hJx5YYF/kslkbMKZfXNw8OSEFmLEg4mlJzvOX/1hq4zjC8LdgMs6ClFejYjMd
 mqX3Uxp6rN62bL09ZKrBStE0nXilBa5dETimsczq3HDcs2fuJuk6ugVHm07GaVhO
 PiS051HwTsAgndN36Wkg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4symc615-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 May 2024 09:43:59 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 494D140046;
 Thu, 16 May 2024 09:43:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F791211958;
 Thu, 16 May 2024 09:42:57 +0200 (CEST)
Received: from [10.48.87.204] (10.48.87.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 09:42:55 +0200
Message-ID: <5b39b5b6-7008-4362-a578-3faab87cd23b@foss.st.com>
Date: Thu, 16 May 2024 09:42:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-crypto@vger.kernel.org>
References: <20240513220349.183568-1-marex@denx.de>
 <b2d0dfcb-37d6-4375-a4ad-ca96a5339840@foss.st.com>
 <cc6f98eb-f6b2-4a34-a8ed-c0f759fa4c79@denx.de>
 <51951dd4-8e8c-4e67-89f6-6a710022e34f@foss.st.com>
 <3257e8f8-5bb0-4c75-a3a3-e5685b65de2a@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <3257e8f8-5bb0-4c75-a3a3-e5685b65de2a@denx.de>
X-Originating-IP: [10.48.87.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_03,2024-05-15_01,2023-05-22_02
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

Hi Marek

On 5/16/24 03:06, Marek Vasut wrote:
> On 5/15/24 11:16 AM, Gatien CHEVALLIER wrote:
> 
> Hi,
> 
>>>> What if you add a trace in a random generation function in random.c?
>>>
>>> Do you have a function name or line number for me ?
>>
>> I put a trace in _get_random_bytes() in drivers/char/random.c. I'm not
>> 100% sure but this should be the entry point when getting a random 
>> number.
> 
> You're right, there is a read attempt right before the hang, and 
> __clk_is_enabled() returns 0 in stm32_read_rng() . In fact, it is the 
> pm_runtime_get_sync() which is returning -EACCES instead of zero, and 
> this is currently not checked so the failure is not detected before 
> register access takes place, to register file with clock disabled, which 
> triggers a hard hang.
> 
> I'll be sending a patch shortly, thanks for this hint !
> 

Great news, indeed the return code isn't checked. Let's use
pm_runtime_resume_and_get().

>>>> After this, I'll try to reproduce the issue.
>>>
>>> If you have a minute to test it on some ST MP15 board, that would be 
>>> real nice. Thanks !
>>
>> I tried to reproduce the issue you're facing on a STM32MP157C-DK2 no
>> SCMI on the 6.9-rc7 kernel tag. I uses OP-TEE and TF-A in the bootchain
>> but this should not have an impact here.
>>
>> How did you manage to test using "echo core > /sys/power/pm_test"?
>> In kernel/power/suspend.c, enter_state(). If the pm_test_level is core,
>> then an error is fired with the following trace:
>> "Unsupported test mode for suspend to idle, please choose 
>> none/freezer/devices/platform."
> 
> Could this be firmware related ?
> 
>> I've tried using "echo devices > /sys/power/pm_test" so that I can at 
>> least test that the driver is put to sleep then wakes up. I do not
>> reproduce your issue.
> 
> Can you try 'processors' ?
> 

Given this:
#ifdef CONFIG_PM_DEBUG
		if (pm_test_level != TEST_NONE && pm_test_level <= TEST_CPUS) {
			pr_warn("Unsupported test mode for suspend to idle, please choose 
none/freezer/devices/platform.\n");
			return -EAGAIN;
		}
#endif

and this

static const char * const pm_tests[__TEST_AFTER_LAST] = {
	[TEST_NONE] = "none",
	[TEST_CORE] = "core",
	[TEST_CPUS] = "processors",
	[TEST_PLATFORM] = "platform",
	[TEST_DEVICES] = "devices",
	[TEST_FREEZER] = "freezer",
};

I'm getting the error as well.

> I did also notice it sometimes takes much longer than a minute to hang, 
> but eventually it does hang. Maybe let it cycle for an hour or a few ?
> 

I'll let it loop for some time then for device pm state.

> [...]
> 

Thanks for investigating this.

Cheers,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
