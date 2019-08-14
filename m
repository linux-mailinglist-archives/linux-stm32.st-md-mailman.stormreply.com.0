Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F798D5C5
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Aug 2019 16:17:25 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 532B6C35E01;
	Wed, 14 Aug 2019 14:17:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6BA37C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Aug 2019 14:17:24 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7EEBQT5021331; Wed, 14 Aug 2019 16:17:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=864BMKlRVFujYQCq26+1g0K4hmq2aALb8dEnOteiolo=;
 b=J174bcZrkmVeJ7AJOl9VCKXBznmKRNGKuDznEEXShutR8zIKsYb3zZoJjmj7dK6hhK86
 pa2BHJKexcG++kpNZuT8ZtR3NgdSxFyIVq9wwvVFLbzz3smt+NVNYNSMNPz4yFx+41DE
 ARk9qY87/HMVJkZkFzWdH4htlaFv8ubQe8cLNPkXvh0nO4z1+2A/pa7zefqWKmafwPFx
 jyZvovgQIZXEd3rDaFel6SwqEZvhDThUrlZcBFE7yTwlDRUCQvKmyFumyleQApn39Dj2
 cEq8L+o0Xnx9k1l32qgFnjOWTRQ3vsPwt48I7z3O+7TwRnV2noQXt0wn56rdHAzUyzh3 TA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2u9kpuwtjn-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 14 Aug 2019 16:17:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D312534;
 Wed, 14 Aug 2019 14:17:13 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C0FDC2B910C;
 Wed, 14 Aug 2019 16:17:13 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Aug
 2019 16:17:13 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Wed, 14 Aug 2019 16:17:13 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Verkuil
 <hverkuil@xs4all.nl>
Thread-Topic: [PATCH v4 1/3] media: stm32-dcmi: improve sensor subdev naming
Thread-Index: AQHVTsvbNiH8ciXV5ESmNTxaXVzk1ab6ls8A
Date: Wed, 14 Aug 2019 14:17:13 +0000
Message-ID: <ca92a856-98fc-f82b-fa0a-62b9f44e266c@st.com>
References: <1564577783-18627-1-git-send-email-hugues.fruchet@st.com>
 <1564577783-18627-2-git-send-email-hugues.fruchet@st.com>
 <20190809160121.GA6194@paasikivi.fi.intel.com>
In-Reply-To: <20190809160121.GA6194@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <EDF4C1A0C930AF4EB3EB2E6088AF5865@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_05:, , signatures=0
Cc: Mickael GUENE <mickael.guene@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v4 1/3] media: stm32-dcmi: improve sensor
	subdev naming
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

Hi Sakari, Hans,

I've just pushed a v6 with the FIXME we discussed on IRC about
"parallel" mbus code versus "serial" mbus code. I have also added
some traces to help in debugging if such case occurs.

version 6:
   - As per Sakari remark: add a FIXME explaining that this
     version only supports subdevices which expose RGB & YUV
     "parallel form" mbus code (_2X8)
   - Add some trace around subdev_call(s_fmt) error & format
     changes to debug subdev which only expose serial mbus code
   - Conform to "<name>":<pad index> when tracing subdev infos


Best regards,
Hugues.

On 8/9/19 6:01 PM, Sakari Ailus wrote:
> Hi Hugues,
> 
> Thanks for teh update.
> 
> On Wed, Jul 31, 2019 at 02:56:21PM +0200, Hugues Fruchet wrote:
>> Rename "subdev" entity struct field to "source"
>> to prepare for several subdev support.
>> Move asd field on top of entity struct.
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>> Change-Id: I1545a1a29a8061ee67cc6e4b799e9a69071911e7
> 
> No Change-Id tags in the kernel, please. Check the other two as well.
> 
> With that fixed,
> 
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
