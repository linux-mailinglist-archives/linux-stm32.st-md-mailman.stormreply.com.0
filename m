Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1BDB13627
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jul 2025 10:17:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 86E7AC36B2C;
	Mon, 28 Jul 2025 08:17:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8FDE1C36B24
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jul 2025 08:17:36 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56S78cGN007928;
 Mon, 28 Jul 2025 10:17:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 l/1C0ecdmCsSKInhz4z8SdSet/WiKzIt/u3FdhjILhQ=; b=C3cAEzX0Fw+6SVHZ
 E8pdcAyNbkxOsLM6zze7ldv5v6FI6fSHTEBYzrybHm4PPNdaQGX0wjYVgskvgYWc
 /FEfbHh5uPHrr++YWsgK3NiRUfZZQO/3Q3haGaO3CNNABtgHZpKphcAROYJGKkJV
 JsizCNbYoAZUmkl29WrI44TlHudLZ4xzQMq8UfIBeSpw8S4YMQwqh/n+u0ujmezW
 jZe8kBp9+IQIY9RtIQpR4lS+uvTQvj/insHisUxR3trrLvINZe76FKXp3iZZ7x/Z
 oitKiKvYlDvFswyryoFPxNAAPsOHg00F4c8IbFXMWSwyTtpRYVd5KYaivSAY47iS
 HqpYbw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484m58xx6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Jul 2025 10:17:12 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1565B40049;
 Mon, 28 Jul 2025 10:15:59 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07AEE6EF690;
 Mon, 28 Jul 2025 10:15:13 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Jul
 2025 10:15:12 +0200
Message-ID: <424f8bbd-10b2-468c-aac8-edc71296dabb@foss.st.com>
Date: Mon, 28 Jul 2025 10:15:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>
References: <20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com>
 <20250725172547.13d550a4@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250725172547.13d550a4@kernel.org>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Richard Cochran <richardcochran@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: allow
 generation of flexible PPS relative to MAC time
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


On 7/26/25 02:25, Jakub Kicinski wrote:
> On Thu, 24 Jul 2025 14:31:17 +0200 Gatien Chevallier wrote:
>> When doing some testing on stm32mp2x platforms(MACv5), I noticed that
>> the command previously used with a MACv4 for genering a PPS signal:
>> echo "0 0 0 1 1" > /sys/class/ptp/ptp0/period
>> did not work.
>>
>> This is because the arguments passed through this command must contain
>> the start time at which the PPS should be generated, relative to the
>> MAC system time. For some reason, a time set in the past seems to work
>> with a MACv4.
>>
>> Because passing such an argument is tedious, introduce
>> STMMAC_RELATIVE_FLEX_PPS config switch so that the MAC system time
>> is added to the args to the stmmac_ptp driver.
>>
>> Example to generate a flexible PPS signal that has a 1s period 3s
>> relative to when the command was entered before and after setting
>> STMMAC_RELATIVE_FLEX_PPS:
>>
>> Before: echo "0 175xxxxxxx 0 1 1" > /sys/class/ptp/ptp0/period
>>
>> After: echo "0 3 0 1 1" > /sys/class/ptp/ptp0/period
> 
> Kconfig doesn't seem like a great way of achieving the outcome.
> Some per-platform knob would be better.
> But ideally we wouldn't do either. Could we possibly guess which
> format user has chosen based on the values, at runtime?

Hello Jakub,

There are two reasons for which I chose this approach:
1) I did not want to affect other platforms and possibly
break scripts that work with the current behavior. Is it
acceptable to do otherwise? If so, maybe there's no need
for a config switch or a per-platform implementation.
2) SoCs may implement more than one MAC and the system
time for these MACs may or may not be synced + the system
time maintained by a MAC may not be a value that represents
a date.

For these reasons, I'm not sure we can rely on the values
that were given to stmmac_enable() to deduce what behavior
we choose. The ptp_clock_request() structure does not hold
loads of information as well.

Maybe we could compare the time to the current MAC system
time and, if the start time is in the past, consider the
value to be an offset. Therefore, any value set in the past
would be considered as an offset. I see some implementations
doing either that or replacing any value set in the past to
a safe start + a fixed offset.

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
