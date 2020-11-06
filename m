Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 847512A9223
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 10:11:17 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 486AFC3FAD4
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 09:11:17 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8AE5DC36B36
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 09:11:14 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A698C8Y027456; Fri, 6 Nov 2020 10:11:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=OIxqUeyyKEzLBcLjzM/IbizYsmrpr5gy6hnhfU5LGzc=;
 b=okDqn205z9JQwRUVb7RMqH4Kz1u+/JNAVb3GH1seYZdIhNK+eqBezBSZnhrC0C8Qg/1L
 JP+2xh/539YI26WyXzCV77W6pZttlpHVDkaxziP2IZ4cPyiIokXeFra4yPisjtmc4lkD
 MC3VMc8K4ly0xYXjNzdC90EZCejO6pLa4V8XckHj5BNKWSVA5GTnM1wewWVx1EOAiK1L
 ducmvck5T/x4JVlITq3apjDXfpaBs0Pk19zs60c+9Vh4ktCC55tQWo3NEdnjLHSTSjeQ
 8dQqsOV/jSDNvHqI6ZTPpwgTY2ek6Jkn2ENbLf4kAhk8uFAN9ol52hYUreWIW2GLmBWz vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34gywrd6n1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Nov 2020 10:11:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3BABC10002A;
 Fri,  6 Nov 2020 10:11:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2E583233854;
 Fri,  6 Nov 2020 10:11:09 +0100 (CET)
Received: from [10.211.1.197] (10.75.127.44) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 10:11:08 +0100
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
References: <e8c99989-f018-dd90-2144-e09c05a3731b@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@st.com>
Message-ID: <f9f26c15-f214-0fa5-3d12-10a5ec3b6202@st.com>
Date: Fri, 6 Nov 2020 10:11:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e8c99989-f018-dd90-2144-e09c05a3731b@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-06_03:2020-11-05,
 2020-11-06 signatures=0
Cc: linux-iio@vger.kernel.org, William Breathitt Gray <vilhelm.gray@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] Counter device Interface for reading out input
	capture
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

Hi Ahmad,

On 11/5/20 7:46 PM, Ahmad Fatoum wrote:
> Hello Benjamin,
> Hello Fabrice,
> 
> In the stm32-timer-cnt driver I find unused #defines for TIM_CCMR_MASK and
> TIM_CCER_MASK, which to me hint that support for the "input capture mode"[1]
> was implemented but removed prior to upstreaming.

Indeed, I'm not sure why such defines have been added in
stm32-timer-cnt. They could probably be removed (and are possibly
redundant with other definitions in STM32 PWM/capture driver...)

> 
> It doesn't look like the counter device API is yet made to support such
> an input capture mode (latching a counter value on an external event, e.g.
> to timestamp incoming rising edges to measure jitter between pulses).

Regarding recent updates for the counter device API, maybe William could
bring some hints (I haven't checked or had time to follow this up :-().

> 
> I am still very new to this, so I figured I ask whether you already have
> thoughts (or maybe code to share) on how to best integrate this with the
> counter device API.

FYI, The only use of the STM32 timer input capture mode currently
implemented (in STM32 timer Linux drivers) is through the PWM capture
interface (drivers/pwm/pwm-stm32.c).
It's using 40.3.8 PWM input mode which is a particular case of input
capture mode you point in [1].
Not sure if this can help for time-stamping (at best as code example?).

One though I have is: a particular timer will be able to do either
quadrature encoder or input capture... So likely timestamping would
require an additional timer. But I haven't really checked how this could
be implemented in the hardware or driver.

May I ask a bit more information regarding your needs here?

Regards,
Fabrice
> 
> I've added linux-iio/linux-stm32 to the CC as well, so if someone else
> has an idea how to best do this, please share.
> 
> [1]: 40.3.7 in RM0436 rev 3
> 
> Cheers,
> Ahmad
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
