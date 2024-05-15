Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039A8C6386
	for <lists+linux-stm32@lfdr.de>; Wed, 15 May 2024 11:18:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 994DFC6C838;
	Wed, 15 May 2024 09:18:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8BC3BC5E2D1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 May 2024 09:18:36 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F8vps7015034;
 Wed, 15 May 2024 11:17:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=P9HRaZf/HRKRXBcbWf8Sn90169F5hwUmhun9zIpDsWM=; b=bC
 aJ0EHaE+ojA0V//atzBk13ngDco8uuvmuN+y9BFUod9zjThwH1UaqjldeeiA+cii
 1lfbdDm4DMvb8qY03rJiohJtiJIK8Xu0u+J7b4YlADMfrrOnrCbaT2PLuE7vEjZQ
 nazJ8mlv9O5uORtlqV+wgcdgKTIHyIM3Atsy0NLT7CbWbqTTd4naVhGaKansTTML
 7sAwpQVMdyPbtafbLTG9J8fCMkyHa5za/o09TgFx4ml8w33YhBIqya9s0WkQ4byy
 QsxZ2jwmRr/PxLChuDZ60cq9t932VQ3SaHGkRYf2JpgUbicCWCWpca1U5dM56Uyo
 m9m6eAGXIuvwMlTbgeaA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4sxv0420-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 May 2024 11:17:58 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 421864002D;
 Wed, 15 May 2024 11:17:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1B8DB214D3B;
 Wed, 15 May 2024 11:16:52 +0200 (CEST)
Received: from [10.48.87.204] (10.48.87.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 15 May
 2024 11:16:51 +0200
Message-ID: <51951dd4-8e8c-4e67-89f6-6a710022e34f@foss.st.com>
Date: Wed, 15 May 2024 11:16:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@denx.de>, <linux-crypto@vger.kernel.org>
References: <20240513220349.183568-1-marex@denx.de>
 <b2d0dfcb-37d6-4375-a4ad-ca96a5339840@foss.st.com>
 <cc6f98eb-f6b2-4a34-a8ed-c0f759fa4c79@denx.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <cc6f98eb-f6b2-4a34-a8ed-c0f759fa4c79@denx.de>
X-Originating-IP: [10.48.87.204]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_04,2024-05-14_01,2023-05-22_02
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

Hi Marek,

On 5/14/24 16:37, Marek Vasut wrote:
> On 5/14/24 10:10 AM, Gatien CHEVALLIER wrote:
>> Hi Marek,
> 
> Hi,
> 
>> Strange indeed.
> 
> Yes.
> 
>> A potential reason that comes to my mind would be that something tries 
>> to get a random number after the driver suspended and fails to do so.
> 
> Possibly.
> 
>> Else it might just be a bad clock balance.
> 
> I don't think so, this would be reported by the kernel and it would show 
> up in /sys/kernel/debug/clk/clk_summary as incrementing use count. It 
> would also not happen in a non-deterministic manner like this happens 
> here, the hang doesn't always happen after well defined suspend/resume 
> cycle count.
> 
>> Can you describe the software ecosystem that you're running please?
>> (SCMI/no SCMI)?
> 
> STM32MP157C DHCOM PDK2 with mainline U-Boot 2024.07-rc2 , no SCMI.
> 
>> Do you have the 3 fixes of stm32_rng.c that you've sent recently in your
>> software when testing?
> 
> Yes, but this happens even without them.
> 
>> What if you add a trace in a random generation function in random.c?
> 
> Do you have a function name or line number for me ?

I put a trace in _get_random_bytes() in drivers/char/random.c. I'm not
100% sure but this should be the entry point when getting a random number.

> 
>> After this, I'll try to reproduce the issue.
> 
> If you have a minute to test it on some ST MP15 board, that would be 
> real nice. Thanks !

I tried to reproduce the issue you're facing on a STM32MP157C-DK2 no
SCMI on the 6.9-rc7 kernel tag. I uses OP-TEE and TF-A in the bootchain
but this should not have an impact here.

How did you manage to test using "echo core > /sys/power/pm_test"?
In kernel/power/suspend.c, enter_state(). If the pm_test_level is core,
then an error is fired with the following trace:
"Unsupported test mode for suspend to idle, please choose 
none/freezer/devices/platform."

I've tried using "echo devices > /sys/power/pm_test" so that I can at 
least test that the driver is put to sleep then wakes up. I do not
reproduce your issue.

[  169.026421] Filesystems sync: 0.013 seconds
[  169.031087] Freezing user space processes
[  169.036562] Freezing user space processes completed (elapsed 0.002 
seconds)
[  169.042238] OOM killer disabled.
[  169.045383] Freezing remaining freezable tasks
[  169.051408] Freezing remaining freezable tasks completed (elapsed 
0.001 seconds)
[  169.238226] dwc2 49000000.usb-otg: suspending usb gadget 
configfs-gadget.g1
[  169.270236] In stm32_rng_suspend
[  169.275501] PM: suspend debug: Waiting for 5 second(s).
[  174.283418] In stm32_rng_resume
[  174.284291] stm32-dwmac 5800a000.ethernet end0: configuring for 
phy/rgmii-id link mode
[  174.337714] dwmac4: Master AXI performs any burst length
[  174.341699] stm32-dwmac 5800a000.ethernet end0: No Safety Features 
support found
[  174.349138] stm32-dwmac 5800a000.ethernet end0: IEEE 1588-2008 
Advanced Timestamp supported
[  174.363442] dwc2 49000000.usb-otg: resuming usb gadget configfs-gadget.g1
[  174.667669] onboard-usb-hub 2-1: reset high-speed USB device number 2 
using ehci-platform
[  174.989075] OOM killer enabled.
[  174.990848] Restarting tasks ... done.
[  175.003976] random: crng reseeded on system resumption
[  175.009464] PM: suspend exit
[  175.011473] random: ASKING FOR 96 BYTES
[  175.011468] random: ASKING FOR 96 BYTES
[  175.015747] random: ASKING FOR 16 BYTES
[  175.044933] random: ASKING FOR 96 BYTES
[  175.059399] random: ASKING FOR 96 BYTES
[  175.070925] random: ASKING FOR 16 BYTES
[  175.079285] random: ASKING FOR 96 BYTES
[  175.082113] random: ASKING FOR 16 BYTES
[  175.096759] random: ASKING FOR 16 BYTES
[  175.098674] random: ASKING FOR 96 BYTES
[  175.295584] random: ASKING FOR 16 BYTES
[  175.302357] random: ASKING FOR 96 BYTES
[  175.311525] random: ASKING FOR 16 BYTES
[  175.312989] random: ASKING FOR 16 BYTES


Can you give it another shot with the trace so that we can ensure that
no random is asked after the driver is suspended in your case please?

Thanks,
Gatien



_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
