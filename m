Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B06F32B91D
	for <lists+linux-stm32@lfdr.de>; Wed,  3 Mar 2021 17:13:18 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E512C57B64;
	Wed,  3 Mar 2021 16:13:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 485D6C56634
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  3 Mar 2021 16:13:15 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 123FwEbn019267; Wed, 3 Mar 2021 17:12:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=oBSCDr6pumMwSnGjMzBLCyN+aCiMW9l6k6rqZVXJZes=;
 b=Sffuk4F0omnhhqQs067z32mOava1pBdl9ucUV/nkNIvDmNfFWpRvE3TWp5LmICU4J3L5
 KuXSOsQsIVU8ltoGaunltqhVK+ZuSy6w7XWfBVP9iZkgjfVi8PiazbdgD7Y9wfb7MXEN
 vjo+/ZTLUK2XC2z1+XnI5jMoZYvoYEkXcpaBUsY6fTCpbJABbVp6KMwUnHUn2wlJEc4g
 cf2NrzpF+pdQji7F7muYRDXK24Ayu+D/39h4LnKfYxj35mUykhKIEBgRCIxg9TD0NQHC
 h2k03Tm66SI0ddsWRPOa7lCi5yzi0kGpztrjlORCR5gTUIlqK045c/VqocMMB7BCCZ6E IA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 36yf9q9xvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 17:12:10 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C0039100034;
 Wed,  3 Mar 2021 17:12:09 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AA90E252AEC;
 Wed,  3 Mar 2021 17:12:09 +0100 (CET)
Received: from [10.211.2.167] (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 3 Mar
 2021 17:12:00 +0100
To: William Breathitt Gray <vilhelm.gray@gmail.com>
References: <1614696235-24088-1-git-send-email-fabrice.gasnier@foss.st.com>
 <YD5SLrdttn+95M7N@shinobu> <e54d1446-b583-9625-1ab3-09e54d6a7456@foss.st.com>
 <YD7NZiqCtmtmqJGg@shinobu>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <adc63e37-6eae-decd-99bc-a49787d9670a@foss.st.com>
Date: Wed, 3 Mar 2021 17:11:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YD7NZiqCtmtmqJGg@shinobu>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-03_05:2021-03-03,
 2021-03-03 signatures=0
Cc: linux-iio@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jic23@kernel.org, david@lechnology.com
Subject: Re: [Linux-stm32] [PATCH] counter: stm32-timer-cnt: fix ceiling
	write max value
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

On 3/3/21 12:42 AM, William Breathitt Gray wrote:
> On Tue, Mar 02, 2021 at 06:03:25PM +0100, Fabrice Gasnier wrote:
>> On 3/2/21 3:56 PM, William Breathitt Gray wrote:
>>> Side question: if priv->ceiling is tracking the current ceiling
>>> configuration, would it make sense to change stm32_count_ceiling_read()
>>> to print the value of priv->ceiling instead of doing a regmap_read()
>>> call?
>>
>> Hi William,
>>
>> Thanks for reviewing.
>>
>> I'd be fine either way. So no objection to move to the priv->ceiling
>> (cached) value. It could also here here.
>> By looking at this, I figured out there's probably another thing to fix
>> here, for initial conditions.
>>
>> At probe time priv->ceiling is initialized to max value (ex 65535 for a
>> 16 bits counter). But the register content is 0 (clear by mfd driver at
>> probe time).
>>
>> - So, reading ceiling from sysfs currently reports 0 (regmap_read())
>> after booting and probing.
>>
>> I see two cases at this point:
>> - In case the counter gets enabled without any prior configuration, it
>> won't count: ceiling value (e.g. 65535) should be written to register
>> before it is enabled, so the counter will actually count. So there's
>> room for a fix here.
>>
>> - In case function gets set (ex: quadrature x4), priv->ceiling (e.g.
>> 65535) gets written to the register (although it's been read earlier as
>> 0 from sysfs).
>> This could be fixed by reading the priv->ceiling in
>> stm32_count_ceiling_read() as you're asking (provided 1st case has been
>> fixed as well)
>>
>> I'll probably prepare one or two patches for the above cases, if you agree ?
>>
>> Best Regards,
>> Fabrice
> 
> Looking through the driver, it doesn't seem like priv->ceiling is used
> in any performance critical code, just the callbacks for count_write()
> and function_set(). It might make more sense to remove priv->ceiling and
> replace it with the regmap_read() calls where necessary so that we
> always get the most current ceiling value from the device when needed.

Hi William,

Ok, I'll look into this.

> 
> As for the default ceiling value for the device at probe time, this
> should probably be set to the max value because that is what a normal
> user would expect when loading a Counter driver (a ceiling value of 0 at
> startup is somewhat unintuitive).

Yes, I agree. In fact, the default (reset) value is the maximum. The 0
value is forced in ARR register by the mfd driver [1], after reading the
max_arr value. I see no rationale for this.
I think the fix should probably be done there: I'd prefer to backup and
restore ARR value in the mfd, instead of unconditionally clearing it.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/mfd/stm32-timers.c?h=v5.11#n167

> 
> If you prepare those two patches, then that should resolve this.

I'll prepare this.

Thanks for your advices,
Best Regards,
Fabrice

> 
> William Breathitt Gray
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
