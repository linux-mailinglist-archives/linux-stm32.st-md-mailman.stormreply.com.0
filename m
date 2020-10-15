Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C4328F603
	for <lists+linux-stm32@lfdr.de>; Thu, 15 Oct 2020 17:42:10 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21156C424AF;
	Thu, 15 Oct 2020 15:42:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72ACFC32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 15 Oct 2020 15:42:08 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FFWPqM021470; Thu, 15 Oct 2020 17:41:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=5M9z+VJHpdMPslK5yQUX1WHh1hOOIDzT8UXdnP4viN8=;
 b=rpRhMwqOI8skSMIeeESJ2ENU7YmRahj/fKUC0OAR/VDOxL070/IAzAqpEuYaRtN83gR9
 xrhSVQPms7Vnmzq3WZHd06k/3/EW958yp6ioJC1FT1G7m+wVHLe5tnbCJYcrrzcoeJ6X
 Xzu6dJdsXq4uAa5aoZ6PheBdfCFMUvIQfZ7+Y1beFVRfJrdYzZOu35vj7QDJDrpvkJk5
 2XyIVmPX3nQejPZZCer29rV97V7osWxtr4o8W1zAAY3urVsjT+06R5menn7YGm3c0+uM
 hIjLHbTGllfkYiuidDP8/B3W9FZW59/gxweGeoEs40Z9xyqlm/XsJPgJUv3+KXahV4Qa Jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34353wqrkk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 17:41:56 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C3BF1100034;
 Thu, 15 Oct 2020 17:41:55 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A14452CA82E;
 Thu, 15 Oct 2020 17:41:55 +0200 (CEST)
Received: from SFHDAG1NODE1.st.com (10.75.127.1) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Oct
 2020 17:41:55 +0200
Received: from SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f]) by
 SFHDAG1NODE1.st.com ([fe80::91:9840:ca1f:420f%20]) with mapi id
 15.00.1473.003; Thu, 15 Oct 2020 17:41:55 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Thread-Topic: [PATCH] media: stm32-dcmi: add support of BT656 bus
Thread-Index: AQHWoUBkV9IGF/l+kUSwjdCwug2yKamYr2IA
Date: Thu, 15 Oct 2020 15:41:55 +0000
Message-ID: <1e1eb9d1-75af-c560-7d06-14d25bb52b3f@st.com>
References: <1602087290-18020-1-git-send-email-hugues.fruchet@st.com>
 <20201013090704.GL6413@valkosipuli.retiisi.org.uk>
In-Reply-To: <20201013090704.GL6413@valkosipuli.retiisi.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <126D0E0F6D08C44292F7D889E518AF9A@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_09:2020-10-14,
 2020-10-15 signatures=0
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Alain VOLMAT <alain.volmat@st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: add support of BT656
	bus
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

Hi Sakari,

Thanks for reviewing,

On 10/13/20 11:07 AM, Sakari Ailus wrote:
> Hi Hugues,
> 
> On Wed, Oct 07, 2020 at 06:14:50PM +0200, Hugues Fruchet wrote:
>> Add support of BT656 embedded synchronization bus.
>> This mode allows to save hardware synchro lines hsync & vsync
>> by replacing them with synchro codes embedded in data stream.
>> This bus type is only compatible with 8 bits width data bus.
>> Due to reserved values 0x00 & 0xff used for synchro codes,
>> valid data only vary from 0x1 to 0xfe, this is up to sensor
>> to clip accordingly pixel data. As a consequence of this
>> clipping, JPEG is not supported when using this bus type.
>> DCMI crop feature is also not available with this bus type.
> 
> You can have more than 62 characters per line. In fact, 75 is the
> recommended maximum.
> 
> You should also amend the bindings to cover BT.656 mode. Also bus-type
> should probably be made mandatory, too.
Will do both.

> 
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>> ---
>>   drivers/media/platform/stm32/stm32-dcmi.c | 37 +++++++++++++++++++++++++++++--
>>   1 file changed, 35 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
>> index fd1c41c..d7d7cdb 100644
>> --- a/drivers/media/platform/stm32/stm32-dcmi.c
>> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
>> @@ -157,6 +157,7 @@ struct stm32_dcmi {
>>   	struct vb2_queue		queue;
>>   
>>   	struct v4l2_fwnode_bus_parallel	bus;
>> +	enum v4l2_mbus_type		bus_type;
>>   	struct completion		complete;
>>   	struct clk			*mclk;
>>   	enum state			state;
>> @@ -777,6 +778,23 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	if (dcmi->bus.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>>   		val |= CR_PCKPOL;
>>   
>> +	/*
>> +	 * BT656 embedded synchronisation bus mode.
>> +	 *
>> +	 * Default SAV/EAV mode is supported here with default codes
>> +	 * SAV=0xff000080 & EAV=0xff00009d.
>> +	 * With DCMI this means LSC=SAV=0x80 & LEC=EAV=0x9d.
>> +	 */
>> +	if (dcmi->bus_type == V4L2_MBUS_BT656) {
>> +		val |= CR_ESS;
>> +
>> +		/* Unmask all codes */
>> +		reg_write(dcmi->regs, DCMI_ESUR, 0xffffffff);/* FEC:LEC:LSC:FSC */
>> +
>> +		/* Trig on LSC=0x80 & LEC=0x9d codes, ignore FSC and FEC */
>> +		reg_write(dcmi->regs, DCMI_ESCR, 0xff9d80ff);/* FEC:LEC:LSC:FSC */
>> +	}
>> +
>>   	reg_write(dcmi->regs, DCMI_CR, val);
>>   
>>   	/* Set crop */
>> @@ -1067,8 +1085,9 @@ static int dcmi_set_fmt(struct stm32_dcmi *dcmi, struct v4l2_format *f)
>>   	if (ret)
>>   		return ret;
>>   
>> -	/* Disable crop if JPEG is requested */
>> -	if (pix->pixelformat == V4L2_PIX_FMT_JPEG)
>> +	/* Disable crop if JPEG is requested or BT656 bus is selected */
>> +	if (pix->pixelformat == V4L2_PIX_FMT_JPEG &&
>> +	    dcmi->bus_type != V4L2_MBUS_BT656)
>>   		dcmi->do_crop = false;
>>   
>>   	/* pix to mbus format */
>> @@ -1592,6 +1611,11 @@ static int dcmi_formats_init(struct stm32_dcmi *dcmi)
>>   			if (dcmi_formats[i].mbus_code != mbus_code.code)
>>   				continue;
>>   
>> +			/* Exclude JPEG if BT656 bus is selected */
>> +			if (dcmi_formats[i].fourcc == V4L2_PIX_FMT_JPEG &&
>> +			    dcmi->bus_type == V4L2_MBUS_BT656)
>> +				continue;
>> +
>>   			/* Code supported, have we got this fourcc yet? */
>>   			for (j = 0; j < num_fmts; j++)
>>   				if (sd_fmts[j]->fourcc ==
>> @@ -1873,9 +1897,18 @@ static int dcmi_probe(struct platform_device *pdev)
>>   		dev_err(&pdev->dev, "CSI bus not supported\n");
>>   		return -ENODEV;
>>   	}
>> +
>> +	if (ep.bus_type == V4L2_MBUS_BT656 &&
>> +	    ep.bus.parallel.bus_width != 8) {
>> +		dev_err(&pdev->dev, "BT656 bus conflicts with %d bits bus width (8 bits required)\n",
>> +			ep.bus.parallel.bus_width);
> 
> bus_width is unsigned here.
I will fix it.

> 
>> +		return -ENODEV;
>> +	}
>> +
>>   	dcmi->bus.flags = ep.bus.parallel.flags;
>>   	dcmi->bus.bus_width = ep.bus.parallel.bus_width;
>>   	dcmi->bus.data_shift = ep.bus.parallel.data_shift;
>> +	dcmi->bus_type = ep.bus_type;
>>   
>>   	irq = platform_get_irq(pdev, 0);
>>   	if (irq <= 0)
> 

BR,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
