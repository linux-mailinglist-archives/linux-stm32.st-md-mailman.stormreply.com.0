Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FAD3307B
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 15:03:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C813BCB4A72
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2019 13:03:53 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDB31CB4A70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2019 13:03:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x53D29gj007830; Mon, 3 Jun 2019 15:03:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=Yw1hBtZR78FRlvaY6GGctzL2o+O10Y/M0xnj+n+p2Bc=;
 b=hp+ZYfxxfJeIuT/RaytPDswUXx+ds5iGHjF2orcdEDZur/sIDfUbb85B9EQGs4KkmZ5f
 KyGWLZ3dGw5KVOu2jhV2/nxv5zvNfcLL605UUPvG+ZyM9FEPm+xK5+zETprDYxSNetBK
 67WbBy9piiuojVicOol5hKWDMHkO5ajhMmdwq60YeRFvAmxtmj84JC5QzN5vlNI02N/z
 gAGV0P6Y6Fa6f/V2PZYnjsYsob6dwUJkUY91V5z2yYA+uYvcQWvUkfZ3LoAuIa63inCd
 rC6Fr75jQrNQJ5ychX3YNpFTi7pJ+xtYLoa+uuB3+2KnId4alxfXj5ZYAN6AuVL9Q/ip Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2sunmeaess-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 03 Jun 2019 15:03:41 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D35C13F;
 Mon,  3 Jun 2019 13:03:40 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node2.st.com [10.75.127.14])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A223D2434;
 Mon,  3 Jun 2019 13:03:40 +0000 (GMT)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG5NODE2.st.com
 (10.75.127.14) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 3 Jun
 2019 15:03:40 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1347.000; Mon, 3 Jun 2019 15:03:40 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hugues FRUCHET
 <hugues.fruchet@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, Pavel Machek <pavel@denx.de>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH] media: stm32-dcmi: fix irq = 0 case
Thread-Index: AQHVF5HP7OIc+eCgyUyFjdbkSczlYqaJswGAgAAV2oA=
Date: Mon, 3 Jun 2019 13:03:40 +0000
Message-ID: <dd4ca76b-9f93-5ddc-e878-25b9905e0cd2@st.com>
References: <1559294295-20573-1-git-send-email-fabien.dessenne@st.com>
 <46944972-1f88-ef3b-fef9-8e37753c0ffe@xs4all.nl>
In-Reply-To: <46944972-1f88-ef3b-fef9-8e37753c0ffe@xs4all.nl>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <16FAE0F28C0E154C942967FC70244FEE@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-03_10:, , signatures=0
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: fix irq = 0 case
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

Hi Hans


"platform_get_irq() = 0" shall be considered as an error. See these 
discussions:
https://patchwork.kernel.org/patch/10006651/
https://yarchive.net/comp/linux/zero.html

BR

Fabien

On 03/06/2019 1:45 PM, Hans Verkuil wrote:
> On 5/31/19 11:18 AM, Fabien Dessenne wrote:
>> Manage the irq = 0 case, where we shall return an error.
>>
>> Fixes: b5b5a27bee58 ("media: stm32-dcmi: return appropriate error codes during probe")
>> Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
>> ---
>>   drivers/media/platform/stm32/stm32-dcmi.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
>> index b9dad0a..d855e9c 100644
>> --- a/drivers/media/platform/stm32/stm32-dcmi.c
>> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
>> @@ -1702,7 +1702,7 @@ static int dcmi_probe(struct platform_device *pdev)
>>   	if (irq <= 0) {
> Shouldn't this be 'irq < 0' instead of '<=' ?
>
> AFAICT irq == 0 can be a valid irq and isn't an error.
>
> Regards,
>
> 	Hans
>
>>   		if (irq != -EPROBE_DEFER)
>>   			dev_err(&pdev->dev, "Could not get irq\n");
>> -		return irq;
>> +		return irq ? irq : -ENXIO;
>>   	}
>>   
>>   	dcmi->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
