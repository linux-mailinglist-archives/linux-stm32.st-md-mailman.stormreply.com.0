Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 16311582B7
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 14:39:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ADE1EC08574;
	Thu, 27 Jun 2019 12:39:01 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A51CC09066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jun 2019 12:39:00 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5RCSSMi017826; Thu, 27 Jun 2019 14:38:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=iTvZ7Qy8oIibUwXAe/7zciOjWIyxXJ+MY9nuagG4AsE=;
 b=0L/NQri0TlBpqbJX16cjTEsFo83GNORuGL9CN/N7b8gRVYi/Hff95RmFuw47O6JCulXt
 5THgz0DrChKGm5EBWsS2nUIzpbGwqn0Y9F6npgtR6ggXwNMuWXZzCDU9+/C+nPiKbfQZ
 qti4BV0G/otIl/AFLcADEwVrnWPmzHLyMjf4RYVVHibljUPjfiwJ3eitVRWPc7ef5vfB
 PLA0nKk2kD1WhcF+vuSjus9iQOCJClokzdXdzvo1Y7etgAcLxHmEYHpeoXqt7cl/hs77
 XbRT6Fv0CBJ4fqChW9NIWPM78Tp6pCBRC/HW7kqDlRe0Hg+f4vPhhZtAh1NrMnfqem6w kg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2t9d2gpta0-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 27 Jun 2019 14:38:42 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DF9AF31;
 Thu, 27 Jun 2019 12:38:41 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5E49D27AE;
 Thu, 27 Jun 2019 12:38:41 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 27 Jun
 2019 14:38:41 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Thu, 27 Jun 2019 14:38:40 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Hans Verkuil <hverkuil@xs4all.nl>
Thread-Topic: [PATCH v2 0/3] DCMI bridge support
Thread-Index: AQHVJ4OqL2qtYdvbaESId3efmYQAfaaqeW6AgAOeMYCAAUJRAA==
Date: Thu, 27 Jun 2019 12:38:40 +0000
Message-ID: <b21efe64-7762-308b-c2e5-503589041c35@st.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <20190620161721.h3wn4nibomrvriw4@kekkonen.localdomain>
 <ae097d67-58fe-82d7-78d6-2445664f28db@st.com>
 <20190626172503.GB6118@pendragon.ideasonboard.com>
In-Reply-To: <20190626172503.GB6118@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
Content-ID: <9CC95BC9616EAA44ABD50C18309839EF@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_07:, , signatures=0
Cc: Mickael GUENE <mickael.guene@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
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

Hi Laurent,

Thanks for reviewing,

On 6/26/19 7:25 PM, Laurent Pinchart wrote:
> Hi Hugues,
> 
> On Mon, Jun 24, 2019 at 10:10:05AM +0000, Hugues FRUCHET wrote:
>> Hi Sakari,
>>
>>   > - Where's the sub-device representing the bridge itself?
>> This is pointed by [1]: drivers/media/i2c/st-mipid02.c
>>
>>   > - As the driver becomes MC-centric, crop configuration takes place
>> through
>>   >   V4L2 sub-device interface, not through the video device node.
>>   > - Same goes for accessing sensor configuration: it does not take place
>>   >   through video node but through the sub-device nodes.
>>
>> Our objective is to be able to support either a simple parallel sensor
>> or a CSI-2 sensor connected through a bridge without any changes on
>> userspace side because no additional processing or conversion involved,
>> only deserialisation is m.
>> With the proposed set of patches, we succeeded to do so, the same
>> non-regression tests campaign is passed with OV5640 parallel sensor
>> (STM32MP1 evaluation board) or OV5640 CSI-2 sensor (Avenger96 board with
>> D3 mezzanine board).
>>
>> We don't want driver to be MC-centric, media controller support was
>> required only to get access to the set of functions needed to link and
>> walk trough subdevices: media_create_pad_link(),
>> media_entity_remote_pad(), etc...
>>
>> We did a try with the v1 version of this patchset, delegating subdevices
>> handling to userspace, by using media-controller, but this require to
>> configure first the pipeline for each single change of resolution and
>> format before making any capture using v4l2-ctl or GStreamer, quite
>> heavy in fact.
>> Benjamin did another try using new libcamera codebase, but even for a
>> basic capture use-case, negotiation code is quite tricky in order to
>> match the right subdevices bus format to the required V4L2 format.
> 
> Why would it be trickier in userspace than in the kernel ? The V4L2
> subdev operations are more or less expose verbatim through the subdev
> userspace API.
> 
>> Moreover, it was not clear how to call libcamera library prior to any
>> v4l2-ctl or GStreamer calls.
> 
> libcamera isn't meant to be called before v4l2-ctl or GStreamer.
> Applications are supposed to be based directly on libcamera, or, for
> existing userspace APIs such as V4L2 or GStreamer, compatibility layers
> are supposed to be developed. For V4L2 it will take the form of a
> LD_PRELOAD-able .so that will intercept the V4L2 API calls, making most
> V4L2 applications work with libcamera unmodified (I said most as 100%
> compatibility will likely not be achievable). For GStreamer it will take
> the form of a GStreamer libcamera element that will replace the V4L2
> source element.
> 
>> Adding 100 lines of code into DCMI to well configure resolution and
>> formats fixes the point and allows us to keep backward compatibility
>> as per our objective, so it seems far more reasonable to us to do so
>> even if DCMI controls more than the subdevice it is connected to.
>> Moreover we found similar code in other video interfaces code like
>> qcom/camss/camss.c and xilinx/xilinx-dma.c, controlling the whole
>> pipeline, so it seems to us quite natural to go this way.
> 
> I can't comment on the qcom-camss driver as I'm not aware of its
> internals, but where have you found such code in the Xilinx V4L2 drivers
> ?
For ex. in xilinx/xilinx-dma.c, stream on/off is propagated to all 
subdevices within pipeline:
  * Walk the entities chain starting at the pipeline output video node 
static int xvip_pipeline_start_stop(struct xvip_pipeline *pipe, bool start)

Same for qcom/camss/camss-video.c:
static int video_start_streaming(struct vb2_queue *q, unsigned int count)

For resolution/format, in exynos4-is/fimc-capture.c:
static int fimc_pipeline_try_format(struct fimc_ctx *ctx,
...
	while (1) {
...
		/* set format on all pipeline subdevs */
		while (me != &fimc->vid_cap.subdev.entity) {
...
			ret = v4l2_subdev_call(sd, pad, set_fmt, NULL, &sfmt);

> 
>> To summarize, if we cannot do the negotiation within kernel, delegating
>> this to userspace implies far more complexity and breaks compatibility
>> with existing applications without adding new functionalities.
>>
>> Having all that in mind, what should be reconsidered in your opinion
>> Sakari ? Do you have some alternatives ?
> 
> First of all, let's note that your patch series performs to related but
> still independent changes: it enables MC support, *and* enables the V4L2
> subdev userspace API. The former is clearly needed and will allow you to
> use the MC API internally in the kernel, simplifying pipeline traversal.
> The latter then enables the V4L2 subdev userspace API, moving the
> pipeline configuration responsibility to userspace.
> 
> You could in theory move to the MC API inside the kernel, without
> enabling support for the V4L2 subdev userspace API. Configuring the
> pipeline and propagating the formats would then be the responsibility of
> the kernel driver.

Yes this is exactly what we want to do.
If I understand well, to disable the V4L2 subdev userspace API, I just 
have to remove the media device registry:
-	/* Register the media device */
-	ret = media_device_register(&dcmi->mdev);
-	if (ret) {
-		dev_err(dcmi->dev, "Failed to register media device (%d)\n",
-			ret);
-		goto err_media_device_cleanup;
-	}
Do you see any additional things to do ?


> However, this will limit your driver to the
> following:
> 
> - Fully linear pipelines only (single sensor)
> - No support for controls implemented by multiple entities in the
>    pipeline (for instance controls that would exist in both the sensor
>    and the bridge, such as gains)
> - No proper support for scaling configuration if multiple components in
>    the pipeline can scale
> 
> Are you willing to set those limitations in stone and give up on
> supporting those features ?
> 

The involved hardware do not have those features, no need of extra 
functionalities to be exposed to userspace, so this is fine.


I'll push a v3 with this change and the other fixes related to Sakari 
and Hans comments.

Please Sakari & Hans, also comment on that change that we can converge 
on v3.


Best regards,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
