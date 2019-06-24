Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5749750755
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2019 12:10:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0869DCC589B
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jun 2019 10:10:35 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C35B7CC589A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jun 2019 10:10:33 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5OA62I3032026; Mon, 24 Jun 2019 12:10:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=f7nKa6SlB25HuKxpO9ORVYe76aQxcf81fhY3D6AwPCY=;
 b=qVAS3sfAEQKMyPUYW5onOQocf3HQ1xMc8a9OD35wBW1ET4c0Z+4Dm3+rqFboLskfsnvq
 L8mMSSDW3Cwvjy3glbyAwXs6v05wRZy+NzeQ83Zf3S24eyII1+VfHuj/zjb5mblxv1Iv
 UO0OC8n4axKvQk5Ek1PG8cU8IxqL6PNFQ/CPrT1/+Z6u7yJEeCdnZ9YrJPn6XMhHtMbI
 eQJVmp3lvfvasGSVYBAR2Lebs7rZy2l/a381BzqK3tcgn6RHHFO4f3TjrST9Cf9oJAB1
 FPe6EN0eDxbQHR9+LqDu5Ja2axh+NPg3/kTx550GNqA2g+DFAnNpKo9yB7QJJwZ4JER7 Qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2g29h3-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 24 Jun 2019 12:10:08 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 541973A;
 Mon, 24 Jun 2019 10:10:06 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 16CA22661;
 Mon, 24 Jun 2019 10:10:06 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 24 Jun
 2019 12:10:05 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Mon, 24 Jun 2019 12:10:05 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Thread-Topic: [PATCH v2 0/3] DCMI bridge support
Thread-Index: AQHVJ4OqL2qtYdvbaESId3efmYQAfaaqeW6A
Date: Mon, 24 Jun 2019 10:10:05 +0000
Message-ID: <ae097d67-58fe-82d7-78d6-2445664f28db@st.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <20190620161721.h3wn4nibomrvriw4@kekkonen.localdomain>
In-Reply-To: <20190620161721.h3wn4nibomrvriw4@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <85607FCBA25C3B4296E8D683984E4084@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_08:, , signatures=0
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 Mickael GUENE <mickael.guene@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philippe CORNU <philippe.cornu@st.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 0/3] DCMI bridge support
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

 > - Where's the sub-device representing the bridge itself?
This is pointed by [1]: drivers/media/i2c/st-mipid02.c

 > - As the driver becomes MC-centric, crop configuration takes place
through
 >   V4L2 sub-device interface, not through the video device node.
 > - Same goes for accessing sensor configuration: it does not take place
 >   through video node but through the sub-device nodes.

Our objective is to be able to support either a simple parallel sensor
or a CSI-2 sensor connected through a bridge without any changes on 
userspace side because no additional processing or conversion involved, 
only deserialisation is m.
With the proposed set of patches, we succeeded to do so, the same 
non-regression tests campaign is passed with OV5640 parallel sensor 
(STM32MP1 evaluation board) or OV5640 CSI-2 sensor (Avenger96 board with 
D3 mezzanine board).

We don't want driver to be MC-centric, media controller support was 
required only to get access to the set of functions needed to link and
walk trough subdevices: media_create_pad_link(), 
media_entity_remote_pad(), etc...

We did a try with the v1 version of this patchset, delegating subdevices 
handling to userspace, by using media-controller, but this require to 
configure first the pipeline for each single change of resolution and 
format before making any capture using v4l2-ctl or GStreamer, quite 
heavy in fact.
Benjamin did another try using new libcamera codebase, but even for a 
basic capture use-case, negotiation code is quite tricky in order to
match the right subdevices bus format to the required V4L2 format.
Moreover, it was not clear how to call libcamera library prior to any
v4l2-ctl or GStreamer calls.

Adding 100 lines of code into DCMI to well configure resolution and 
formats fixes the point and allows us to keep backward compatibility
as per our objective, so it seems far more reasonable to us to do so
even if DCMI controls more than the subdevice it is connected to.
Moreover we found similar code in other video interfaces code like 
qcom/camss/camss.c and xilinx/xilinx-dma.c, controlling the whole 
pipeline, so it seems to us quite natural to go this way.

To summarize, if we cannot do the negotiation within kernel, delegating
this to userspace implies far more complexity and breaks compatibility
with existing applications without adding new functionalities.

Having all that in mind, what should be reconsidered in your opinion 
Sakari ? Do you have some alternatives ?

Best regards,
Hugues.


On 6/20/19 6:17 PM, Sakari Ailus wrote:
> Hi Hugues,
> 
> On Tue, Jun 11, 2019 at 10:48:29AM +0200, Hugues Fruchet wrote:
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
> 
> General notes on the set, not related to any single patch:
> 
> - Where's the sub-device representing the bridge itself?
> 
> - As the driver becomes MC-centric, crop configuration takes place through
>    V4L2 sub-device interface, not through the video device node.
> 
> - Same goes for accessing sensor configuration: it does not take place
>    through video node but through the sub-device nodes.
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
