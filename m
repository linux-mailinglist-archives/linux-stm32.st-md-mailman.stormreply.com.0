Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E2A518442
	for <lists+linux-stm32@lfdr.de>; Tue,  3 May 2022 14:26:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4B8BC60467;
	Tue,  3 May 2022 12:26:18 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 338EFC5F1FB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 May 2022 12:26:17 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2438jkLk016074;
 Tue, 3 May 2022 14:25:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=47vTGwiYTxtIa15R2nQGwX54FUlIo/9LF6dDi/n3mKI=;
 b=vKnMCjo7utP6wU8DFbsi5wQm1OujYfjcHwuwdKU7Rn8JxDWCQW7ZwTZ2hk9C7lU/KdFd
 QJkO8LorREmPY21saT52zUS1Fz7UKRQHkGeE4yzyP2mkn9msd9eaRlBJx5OLNZpXPHKT
 QT3BnksozOemq9DoZkeCUaunnbEoE0AX73mf7GugWo1jOzcvsYUhtPas35tjKA1Lo+y4
 9ExSbuHZ0MUv5NHqZw5syiDCLaItxuxpt53weqR/K5oqDyfOau8y4JvoSxUSnSICAEk7
 P0is1jfGp0mTuxZ/EGYfBNfQufaK+vwbYe8gs40jSxiRsSsfdXOMIa1pvempEHgUN0Uy kA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3frv0g6yda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 14:25:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C01DE100034;
 Tue,  3 May 2022 14:25:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B921721BF66;
 Tue,  3 May 2022 14:25:39 +0200 (CEST)
Received: from [10.48.1.102] (10.75.127.49) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Tue, 3 May
 2022 14:25:38 +0200
Message-ID: <28627ccb-21ef-1b86-e5d7-460daf672d6d@foss.st.com>
Date: Tue, 3 May 2022 14:25:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron
 <jic23@kernel.org>
References: <20220413185656.21994-1-andriy.shevchenko@linux.intel.com>
 <20220428193304.016c46a3@jic23-huawei> <YnEB97YfPYpe2aCn@smile.fi.intel.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <YnEB97YfPYpe2aCn@smile.fi.intel.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_03,2022-05-02_03,2022-02-23_01
Cc: Lars-Peter Clausen <lars@metafoo.de>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v1 1/1] iio: trigger:
 stm32-lptimer-trigger: Make use of device properties
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



On 5/3/22 12:20, Andy Shevchenko wrote:
> On Thu, Apr 28, 2022 at 07:33:04PM +0100, Jonathan Cameron wrote:
>> On Wed, 13 Apr 2022 21:56:56 +0300
>> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
>>
>>> Convert the module to be property provider agnostic and allow
>>> it to be used on non-OF platforms.
>>>
>>> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>>
>> MAINTAINERS entry for this one uses extensive wild cards so may
>> escape scripts...
>>
>> +CC Fabrice.
> 
> Thanks!
> 
> Not sure it might break anything, it's quite straightforward conversion.

Hi Andy, Jonathan,

You can add my:
Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Best Regards,
Fabrice

> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
