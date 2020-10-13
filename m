Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAA328CA7F
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Oct 2020 10:48:52 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2B2AC3FADE;
	Tue, 13 Oct 2020 08:48:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 675B6C36B37
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Oct 2020 08:48:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09D8g6iq024216; Tue, 13 Oct 2020 10:48:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=xOgaCDjt5T9hXv05hEcKe/2aDU5DihgAgwhe86Z/AUk=;
 b=wlbeQ9sv+Af7UNIVEpmXkJT7xOAi5nobEKaeEaMqpEGrdx1bFygtKhlPjJ3N9J6UbJWh
 NFhJNeWNdd7HdO3S8e4sNAJxilhAS5oLTiAsIRDeD6MaZncF90aJOLsDuOgEUpymo50D
 3PPy2DRewrZGrkxm4dk3kFmjA6Mbo/fSyNXyHSalCH5I/LPWzsKNJTDYmJp/Y6d/zOKo
 PHpH6TObEe0AwvA2XEhPSSmEyeuCiyVLifoC2bUE1kl/pHS2qhKlxeQplVb8EgCuYwp6
 hF0pB38hGaYrnd1oaPaEuCJTE1Uk2ZcFIc8iUisywWTfX0s4S/9yhneqFOOQ3QSkbmSf xw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353w60pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 10:48:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40344100034;
 Tue, 13 Oct 2020 10:48:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2F6832AA9DB;
 Tue, 13 Oct 2020 10:48:42 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 13 Oct
 2020 10:48:41 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Tue, 13 Oct 2020 10:48:41 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Jacopo Mondi <jacopo@jmondi.org>
Thread-Topic: [PATCH v3] media: ov5640: add support of 160x120 resolution
Thread-Index: AQHWnU0iMA+Pbyv+dEe39LLhQPAwvKmT/q0AgAEgfQA=
Date: Tue, 13 Oct 2020 08:48:41 +0000
Message-ID: <aeb90bb7-d0b4-0620-c7ae-d1ba2f4186a3@st.com>
References: <1602145756-4354-1-git-send-email-hugues.fruchet@st.com>
 <20201012153608.mex6m7qmjv7vy4s5@uno.localdomain>
In-Reply-To: <20201012153608.mex6m7qmjv7vy4s5@uno.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <A6C3D5CB7729E543A95D706F499671C2@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-13_02:2020-10-13,
 2020-10-13 signatures=0
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Alain VOLMAT <alain.volmat@st.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v3] media: ov5640: add support of 160x120
	resolution
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

Hi Jacopo,

On 10/12/20 5:36 PM, Jacopo Mondi wrote:
> Hi Hugues,
> 
> On Thu, Oct 08, 2020 at 10:29:16AM +0200, Hugues Fruchet wrote:
>> Add support of 160x120 resolution.
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> 
> Looks good, the new mode works for me on a CSI-2 2 lanes setup
> 
> Tested-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
>> ---
>> version 3:
>>    - fix wrong array affectation
>>
>> version 2:
>>    - fix missing max framerate
>>
>>   drivers/media/i2c/ov5640.c | 26 +++++++++++++++++++++++++-
>>   1 file changed, 25 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
>> index 8d0254d..40d6983 100644
>> --- a/drivers/media/i2c/ov5640.c
>> +++ b/drivers/media/i2c/ov5640.c
>> @@ -98,7 +98,8 @@
>>   #define OV5640_REG_AVG_READOUT		0x56a1
>>
>>   enum ov5640_mode_id {
>> -	OV5640_MODE_QCIF_176_144 = 0,
>> +	OV5640_MODE_QQVGA_160_120 = 0,
>> +	OV5640_MODE_QCIF_176_144,
>>   	OV5640_MODE_QVGA_320_240,
>>   	OV5640_MODE_VGA_640_480,
>>   	OV5640_MODE_NTSC_720_480,
>> @@ -416,6 +417,24 @@ static const struct reg_value ov5640_setting_QVGA_320_240[] = {
>>   	{0x3824, 0x02, 0, 0}, {0x5001, 0xa3, 0, 0},
>>   };
>>
>> +static const struct reg_value ov5640_setting_QQVGA_160_120[] = {
>> +	{0x3c07, 0x08, 0, 0},
>> +	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>> +	{0x3814, 0x31, 0, 0},
>> +	{0x3815, 0x31, 0, 0}, {0x3800, 0x00, 0, 0}, {0x3801, 0x00, 0, 0},
>> +	{0x3802, 0x00, 0, 0}, {0x3803, 0x04, 0, 0}, {0x3804, 0x0a, 0, 0},
>> +	{0x3805, 0x3f, 0, 0}, {0x3806, 0x07, 0, 0}, {0x3807, 0x9b, 0, 0},
>> +	{0x3810, 0x00, 0, 0},
>> +	{0x3811, 0x10, 0, 0}, {0x3812, 0x00, 0, 0}, {0x3813, 0x06, 0, 0},
>> +	{0x3618, 0x00, 0, 0}, {0x3612, 0x29, 0, 0}, {0x3708, 0x64, 0, 0},
>> +	{0x3709, 0x52, 0, 0}, {0x370c, 0x03, 0, 0}, {0x3a02, 0x03, 0, 0},
>> +	{0x3a03, 0xd8, 0, 0}, {0x3a08, 0x01, 0, 0}, {0x3a09, 0x27, 0, 0},
>> +	{0x3a0a, 0x00, 0, 0}, {0x3a0b, 0xf6, 0, 0}, {0x3a0e, 0x03, 0, 0},
>> +	{0x3a0d, 0x04, 0, 0}, {0x3a14, 0x03, 0, 0}, {0x3a15, 0xd8, 0, 0},
>> +	{0x4001, 0x02, 0, 0}, {0x4004, 0x02, 0, 0},
>> +	{0x4407, 0x04, 0, 0}, {0x5001, 0xa3, 0, 0},
>> +};
>> +
>>   static const struct reg_value ov5640_setting_QCIF_176_144[] = {
>>   	{0x3c07, 0x08, 0, 0},
>>   	{0x3c09, 0x1c, 0, 0}, {0x3c0a, 0x9c, 0, 0}, {0x3c0b, 0x40, 0, 0},
>> @@ -552,6 +571,11 @@ static const struct ov5640_mode_info ov5640_mode_init_data = {
>>
>>   static const struct ov5640_mode_info
>>   ov5640_mode_data[OV5640_NUM_MODES] = {
>> +	{OV5640_MODE_QQVGA_160_120, SUBSAMPLING,
>> +	 160, 1896, 120, 984,
> 
> These values do not match what's actually applied on the sensor, but
> this is not only related to this patch.
> 
> See ff66ea3a-bd2e-9bd6-894c-bf372de69a31@ti.com
> I should try to re-submit Tomi's patch and the on-top clock rework.

Thanks Jacopo, but there is a problem with link above about Tomi's patch.

> 
> You have a CSI-2 setup too, right ?
Yes I have, it's an Avenger 96board running STM32MP1 & an ST MIPID02 
bridge with D3 engineering OV5640 CSI-2 mezzanine.

> 
> Thanks
>    j
> 
>> +	 ov5640_setting_QQVGA_160_120,
>> +	 ARRAY_SIZE(ov5640_setting_QQVGA_160_120),
>> +	 OV5640_30_FPS},
>>   	{OV5640_MODE_QCIF_176_144, SUBSAMPLING,
>>   	 176, 1896, 144, 984,
>>   	 ov5640_setting_QCIF_176_144,
>> --
>> 2.7.4
>>

BR,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
