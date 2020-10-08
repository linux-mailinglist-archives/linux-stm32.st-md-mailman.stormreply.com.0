Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF8C287115
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Oct 2020 10:59:16 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F370FC32EA8;
	Thu,  8 Oct 2020 08:59:15 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82C86C32E90
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Oct 2020 08:59:14 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0988qOFG029333; Thu, 8 Oct 2020 10:58:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ynVRILT2FMFg8Vu4WHMwSw6gaUxAXjOLWz9YnoTvjoI=;
 b=fHDRDR7fw5uOuKrcMPLMb18KgJhX4pzzurl1i1GsV6/tfgt2g2moQxXuJccwE169/jCL
 oztYGdsApMJ5LSyZfV7Gdv7dZvVVTBGdVtAfNLZ0qz29Z2QH8dER0S3OUUWVyA+O1JvK
 BvVaI977AHuQumG0Wno+o2ox6GSAT3qajhaRigA/CwTauqEPsEgNlChjgq3o6ts4WdZf
 J3jxDbUPd4Ew9Dk4ckJkLtWykHBZ4/e3AvpSwNsbuqJBryJPK6NZ3ewEEtSPZp2BItXk
 E1RHQ2P56tJI1Gb5IbBe77o2l7d/jK9tSREoSkWZl/PS+6sra0AaeY2IovBEj7q9IBzn MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 3402tk1n5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 08 Oct 2020 10:58:59 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CA99E10002A;
 Thu,  8 Oct 2020 10:58:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7301A2ADA09;
 Thu,  8 Oct 2020 10:58:58 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 8 Oct
 2020 10:58:11 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Thu, 8 Oct 2020 10:58:11 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Thread-Topic: [PATCH] media: ov5640: fix MIPI power sequence
Thread-Index: AQHWnLs/CuL/W9OdtE+ovGhzaFrmY6mNR06A
Date: Thu, 8 Oct 2020 08:58:11 +0000
Message-ID: <6507ea32-c8e7-fb3b-305a-26a0627bc06b@st.com>
References: <1602081798-17548-1-git-send-email-hugues.fruchet@st.com>
 <1602081798-17548-2-git-send-email-hugues.fruchet@st.com>
 <20201007150103.GN26842@paasikivi.fi.intel.com>
 <20201007150903.473gxynjyncok247@uno.localdomain>
In-Reply-To: <20201007150903.473gxynjyncok247@uno.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <A890AB273381DA47A38BC0D4664A6128@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-08_04:2020-10-08,
 2020-10-08 signatures=0
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain VOLMAT <alain.volmat@st.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] media: ov5640: fix MIPI power sequence
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

Hi Jacopo, Sakari,

As you want, let's drop this patch.

BR,
Hugues.

On 10/7/20 5:09 PM, Jacopo Mondi wrote:
> Hi Hugues, Sakari,
> 
> On Wed, Oct 07, 2020 at 06:01:03PM +0300, Sakari Ailus wrote:
>> Hi Hugues,
>>
>> On Wed, Oct 07, 2020 at 04:43:18PM +0200, Hugues Fruchet wrote:
>>> fixes: b1751ae652fb ("media: i2c: ov5640: Separate out mipi configuration from s_power")
>>
>> Fixes: ...
>>
>> And preferrably before Sob line.
>>
>>>
>>> Fix ov5640_write_reg()return value unchecked at power off.
>>> Reformat code to keep register access below the register description.
>>
>> If there's an error, I wouldn't stop turning things off, but just proceed.
>> The caller will ignore the error in that case anyway. This changes with the
>> patch.
> 
> Agreed, I think it's best to continue instead of bailing out as we're
> in a power-off path
> 
>>
>>>
>>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>>> Change-Id: I12db67c416c3d63eadee400a3c89aaf48c5b1469
>>
>> This was probably not intended to be here.
>>
>>> ---
>>>   drivers/media/i2c/ov5640.c | 17 ++++++-----------
>>>   1 file changed, 6 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>>> index 8d0254d..f34e62e 100644
>>> --- a/drivers/media/i2c/ov5640.c
>>> +++ b/drivers/media/i2c/ov5640.c
>>> @@ -1940,14 +1940,6 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>>>   {
>>>   	int ret;
>>>
>>> -	if (!on) {
>>> -		/* Reset MIPI bus settings to their default values. */
>>> -		ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x58);
>>> -		ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x04);
>>> -		ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x00);
>>> -		return 0;
>>> -	}
>>> -
>>>   	/*
>>>   	 * Power up MIPI HS Tx and LS Rx; 2 data lanes mode
>>>   	 *
>>> @@ -1958,7 +1950,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>>>   	 * [3] = 0	: Power up MIPI LS Rx
>>>   	 * [2] = 0	: MIPI interface disabled
>>>   	 */
>>> -	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
>>> +	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00,
>>> +			       on ? 0x40 : 0x58);
>>>   	if (ret)
>>>   		return ret;
>>>
>>> @@ -1969,7 +1962,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>>>   	 * [5] = 1	: Gate clock when 'no packets'
>>>   	 * [2] = 1	: MIPI bus in LP11 when 'no packets'
>>>   	 */
>>> -	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00, 0x24);
>>> +	ret = ov5640_write_reg(sensor, OV5640_REG_MIPI_CTRL00,
>>> +			       on ? 0x24 : 0x04);
>>>   	if (ret)
>>>   		return ret;
>>>
>>> @@ -1981,7 +1975,8 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
>>>   	 * [5] = 1	: MIPI data lane 1 in LP11 when 'sleeping'
>>>   	 * [4] = 1	: MIPI clock lane in LP11 when 'sleeping'
>>>   	 */
>>> -	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00, 0x70);
>>> +	ret = ov5640_write_reg(sensor, OV5640_REG_PAD_OUTPUT00,
>>> +			       on ? 0x70 : 0x00);
>>>   	if (ret)
>>>   		return ret;
>>>
>>
>> --
>> Kind regards,
>>
>> Sakari Ailus
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
