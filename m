Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F0B91FBA
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Aug 2019 11:13:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25D9BC35E01;
	Mon, 19 Aug 2019 09:13:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D54C6C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Aug 2019 09:13:40 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7J9C44g008020; Mon, 19 Aug 2019 11:13:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=qPtY65syNbZPgYlU9jqqgNS94oIfK9I+q4XLxKpjhnI=;
 b=d41pUUzNDUnezdRr90IZ61ONsJ21G4K5DZYJtf2bZZGzywRpRuiz+oGVHnaedJSLmdFm
 O8vLW82Rc0hzYKWwP/S/Lr8VYzhKTxYU+y/hIG45CCgRWVyjLtKaGzI7xIYeuJasIaUt
 lq4oGEx23LCbjfWsVQhtSaF98k/ajKzTwtXgF/hcmrlNzR9BNb5WhNOTpDpXvX4uoNNO
 SiyR0mTaR5Lj3HKIfhp7ZSXmOgwSCMxrVVuHGRDfrHYqb1LhDSLo7igN3D642yM22FzR
 mLCEY8IVjtuAfFWoY52vkRfU92aA6Qt037akHvkcwsJ/HN4GNvnBRIVTZpO3qXYyJ8nY eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2ue720tdyj-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 19 Aug 2019 11:13:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 743E634;
 Mon, 19 Aug 2019 09:13:29 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 620CA2CA5CE;
 Mon, 19 Aug 2019 11:13:29 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 19 Aug
 2019 11:13:29 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Mon, 19 Aug 2019 11:13:29 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Alexandre TORGUE
 <alexandre.torgue@st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Sakari Ailus" <sakari.ailus@linux.intel.com>
Thread-Topic: [PATCH v7 0/4] DCMI bridge support
Thread-Index: AQHVVmonZD9iAGFT80+FGsi2F1VjYqcCDlyA
Date: Mon, 19 Aug 2019 09:13:28 +0000
Message-ID: <5d36f437-0de5-1aa0-09bf-51d3a415ad2f@st.com>
References: <1566204081-19051-1-git-send-email-hugues.fruchet@st.com>
 <0cd073d9-3d25-9e22-f243-f72e395e9e96@xs4all.nl>
In-Reply-To: <0cd073d9-3d25-9e22-f243-f72e395e9e96@xs4all.nl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.49]
Content-ID: <7454236525196C4ABD655304CB57FFD8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-19_02:, , signatures=0
Cc: Mickael GUENE <mickael.guene@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v7 0/4] DCMI bridge support
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

Hi Hans, Sakari,

OK to push separately the 80 char fix.

There was pending related changes on st-mipid02 and ov5640 (listed 
below), do you think it's possible to take them also ?


media: st-mipid02: add support of V4L2_CID_LINK_FREQ 
https://patchwork.linuxtv.org/patch/56969/
State	Accepted

[v2,1/3] media: st-mipid02: add support of RGB565
https://patchwork.linuxtv.org/patch/56970/
State	Accepted

[v2,2/3] media: st-mipid02: add support of YUYV8 and UYVY8
https://patchwork.linuxtv.org/patch/56971/
State	Accepted

[v2,3/3] media: st-mipid02: add support of JPEG 
https://patchwork.linuxtv.org/patch/56973/
State	Accepted


[v2] media: ov5640: add support of V4L2_CID_LINK_FREQ
https://patchwork.linuxtv.org/patch/57215/
State	Changes Requested
=> This change is needed to make it work the whole setup.
=> I don't know what to change here, even if this 384MHz fixed value 
seems strange, it works fine on my setup, on my opinion it's better than 
nothing. We could come back on this later on when other OV5640 CSI 
interfaces will require V4L2_CID_LINK_FREQ value.

Sakari, what do you think about this ?


BR,
Hugues.

On 8/19/19 10:43 AM, Hans Verkuil wrote:
> On 8/19/19 10:41 AM, Hugues Fruchet wrote:
>> This patch serie allows to connect non-parallel camera sensor to
>> DCMI thanks to a bridge connected in between such as STMIPID02 [1].
>>
>> Media controller support is introduced first, then support of
>> several sub-devices within pipeline with dynamic linking
>> between them.
>> In order to keep backward compatibility with applications
>> relying on V4L2 interface only, format set on video node
>> is propagated to all sub-devices connected to camera interface.
>>
>> [1] https://www.spinics.net/lists/devicetree/msg278002.html
>>
>> ===========
>> = history =
>> ===========
>> version 7:
>>    - minor fix on 80 char trace message
> 
> v6 is already in a pending PR. I don't really want to make a new
> PR just for a 80 char warning.
> 
> It can always be done in a follow-up patch.
> 
> Regards,
> 
> 	Hans
> 
>>
>> version 6:
>>    - As per Sakari remark: add a FIXME explaining that this
>>      version only supports subdevices which expose RGB & YUV
>>      "parallel form" mbus code (_2X8)
>>    - Add some trace around subdev_call(s_fmt) error & format
>>      changes to debug subdev which only expose serial mbus code
>>    - Conform to "<name>":<pad index> when tracing subdev infos
>>
>> version 5:
>>    - Remove remaining Change-Id
>>    - Add Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>> version 4:
>>    - Also drop subdev nodes registry as suggested by Hans:
>>      https://www.spinics.net/lists/arm-kernel/msg743375.html
>>
>> version 3:
>>    - Drop media device registry to not expose media controller
>>      interface to userspace as per Laurent' suggestion:
>>      https://www.spinics.net/lists/linux-media/msg153417.html
>>    - Prefer "source" instead of "sensor" and keep it in
>>      dcmi_graph_entity struct, move asd as first member
>>      of struct as per Sakari' suggestion:
>>      https://www.spinics.net/lists/linux-media/msg153119.html
>>    - Drop dcmi_graph_deinit() as per Sakari' suggestion:
>>      https://www.spinics.net/lists/linux-media/msg153417.html
>>
>> version 2:
>>    - Fix bus_info not consistent between media and V4L:
>>      https://www.spinics.net/lists/arm-kernel/msg717676.html
>>    - Propagation of format set on video node to the sub-devices
>>      chain connected on camera interface
>>
>> version 1:
>>    - Initial submission
>>
>> Hugues Fruchet (4):
>>    media: stm32-dcmi: improve sensor subdev naming
>>    media: stm32-dcmi: trace the supported fourcc/mbus_code
>>    media: stm32-dcmi: add media controller support
>>    media: stm32-dcmi: add support of several sub-devices
>>
>>   drivers/media/platform/Kconfig            |   2 +-
>>   drivers/media/platform/stm32/stm32-dcmi.c | 318 +++++++++++++++++++++++++-----
>>   2 files changed, 268 insertions(+), 52 deletions(-)
>>
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
