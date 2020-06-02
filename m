Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8AA1EBA88
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jun 2020 13:38:01 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4FE48C36B21;
	Tue,  2 Jun 2020 11:38:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7EA40C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2020 11:37:58 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 052BW8ED005146; Tue, 2 Jun 2020 13:37:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=zCgvAD2DnYOr6cNN/ctfmZUAkv+2YxaNhKI0IMJVfkE=;
 b=v8kkOlsyPyNieJG4nr+2nQ1vF144Qa7s0rS59Pqqo2j3rSHaEJO45M0H4pEoMSq8B8CS
 1oecrhJFDDONdjO01uKRH6A2z94ikNRrBlvVYoTJBDpZzMOCDE4oiyBWLOEzvg9s3fIl
 zcrAx+zuRUP6bsCtiu0MrjrrOmR07S5KrkFAdd5C7DL3ARzu/f+xavux99vZuwjyEVy5
 wrjvsdwrM13ZNFZDx1q2cYGQCqSJ0RiHUnHyQXAKNtovBht9ffBZQQaeRxMdBk4Mdssw
 G0hghBJU8K3yS0eSayQfL7CeeyWZPOHYoPFOXzvIlvWwJOit0N54YN6aXF6C0n7VIDdY XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31bcy0e6ph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 13:37:40 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 141D110002A;
 Tue,  2 Jun 2020 13:37:39 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D53C72B5C35;
 Tue,  2 Jun 2020 13:37:39 +0200 (CEST)
Received: from SFHDAG3NODE3.st.com (10.75.127.9) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 2 Jun
 2020 13:37:39 +0200
Received: from SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476]) by
 SFHDAG3NODE3.st.com ([fe80::3507:b372:7648:476%20]) with mapi id
 15.00.1347.000; Tue, 2 Jun 2020 13:37:39 +0200
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Thread-Topic: [PATCH] media: stm32-dcmi: Set minimum cpufreq requirement
Thread-Index: AQHWNDnEPjQ+BLRck0Okhc2Oie/dNajE9yuAgAAjSoA=
Date: Tue, 2 Jun 2020 11:37:39 +0000
Message-ID: <f95ce45f-7a1c-0feb-afa8-203ddb500f2f@st.com>
References: <20200527151613.16083-1-benjamin.gaignard@st.com>
 <jhjpnahizkm.mognet@arm.com>
In-Reply-To: <jhjpnahizkm.mognet@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <783800331E8056488681241E76EAEE3C@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_13:2020-06-02,
 2020-06-02 signatures=0
Cc: "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: Set minimum cpufreq
	requirement
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



On 6/2/20 11:31 AM, Valentin Schneider wrote:
> Hi Benjamin,
>
> On 27/05/20 16:16, Benjamin Gaignard wrote:
>> Before start streaming set cpufreq minimum frequency requirement.
>> The cpufreq governor will adapt the frequencies and we will have
>> no latency for handling interrupts.
>>
> Few comments below from someone oblivious to your platform, they may not
> be all that relevant but I figured I'd pitch in anyway.
>
>> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
>> ---
>>   drivers/media/platform/stm32/stm32-dcmi.c | 29 ++++++++++++++++++++++++++++-
>>   1 file changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
>> index b8931490b83b..97c342351569 100644
>> --- a/drivers/media/platform/stm32/stm32-dcmi.c
>> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
>> @@ -13,6 +13,7 @@
>>
>>   #include <linux/clk.h>
>>   #include <linux/completion.h>
>> +#include <linux/cpufreq.h>
>>   #include <linux/delay.h>
>>   #include <linux/dmaengine.h>
>>   #include <linux/init.h>
>> @@ -99,6 +100,8 @@ enum state {
>>
>>   #define OVERRUN_ERROR_THRESHOLD	3
>>
>> +#define DCMI_MIN_FREQ	650000 /* in KHz */
>> +
> This assumes the handling part is guaranteed to always run on the same CPU
> with the same performance profile (regardless of the platform). If that's
> not guaranteed, it feels like you'd want this to be configurable in some
> way.
Yes I could add a st,stm32-dcmi-min-frequency (in KHz) parameter the 
device tree node.

>
>>   struct dcmi_graph_entity {
>>        struct v4l2_async_subdev asd;
>>
> [...]
>> @@ -2020,6 +2042,8 @@ static int dcmi_probe(struct platform_device *pdev)
>>                goto err_cleanup;
>>        }
>>
>> +	dcmi->policy = cpufreq_cpu_get(0);
>> +
> Ideally you'd want to fetch the policy of the CPU your IRQ (and handling
> thread) is affined to; The only compatible DTS I found describes a single
> A7, which is somewhat limited in the affinity area...
If I move this code just before start streaming and use get_cpu(), would 
it works ?

Benjamin
>
>>        dev_info(&pdev->dev, "Probe done\n");
>>
>>        platform_set_drvdata(pdev, dcmi);
>> @@ -2049,6 +2073,9 @@ static int dcmi_remove(struct platform_device *pdev)
>>
>>        pm_runtime_disable(&pdev->dev);
>>
>> +	if (dcmi->policy)
>> +		cpufreq_cpu_put(dcmi->policy);
>> +
>>        v4l2_async_notifier_unregister(&dcmi->notifier);
>>        v4l2_async_notifier_cleanup(&dcmi->notifier);
>>        media_entity_cleanup(&dcmi->vdev->entity);
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
