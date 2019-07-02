Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 464D95D2E6
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2019 17:30:07 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2B17C6EB78
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jul 2019 15:30:06 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22AFEC6EB76
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jul 2019 15:30:06 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x62FRTot004763; Tue, 2 Jul 2019 17:29:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=vhsVIm+Xi0EYX8Boo/wukzQXiDvby4b9xhmKvwmlzLM=;
 b=oXOtHYzvNLLc4XuWqpUbgVzZie65IcT4ppC1a3Y9opZkhg8ESCgNog68W8Ty4r9ulJoi
 Eg0Ifxps64J6nKrPPZww5F09UJvTidIfph7v4O9DG41SzfE+RGDKmqeC0cD86grv07HV
 c2MKb658Zp776YwSPbmIO4t37ip8emF7D0iixERzBffwJKg3hl1PUJ0FsytD59CqhAEe
 XuWRactPej2xOdhTyDh7I4ZUMNWx+iwU/8aOF2fyOn+KqQ4J1L9V2JBK5eL7Kpc7lmTS
 r2+vbi4B11HHRNWaQN7rl262fv6HJvB5Zr0BWn+Pr+9jIj4VXoD5aAVbKrYh7FsWnFAC zQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tdwruvxcw-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Tue, 02 Jul 2019 17:29:56 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8AF0331;
 Tue,  2 Jul 2019 15:29:55 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag5node1.st.com [10.75.127.13])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5971E2D45;
 Tue,  2 Jul 2019 15:29:55 +0000 (GMT)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG5NODE1.st.com
 (10.75.127.13) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 2 Jul
 2019 17:29:54 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1347.000; Tue, 2 Jul 2019 17:29:54 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Thread-Topic: [PATCH v2 2/3] media: stm32-dcmi: add media controller support
Thread-Index: AQHVJ4MSX3VDRyykMUmSGPlvZRClvaa3ZXEA
Date: Tue, 2 Jul 2019 15:29:54 +0000
Message-ID: <06b699b8-1bfb-5f05-416f-b2fbcc2c832e@st.com>
References: <1560242912-17138-1-git-send-email-hugues.fruchet@st.com>
 <1560242912-17138-3-git-send-email-hugues.fruchet@st.com>
 <20190620161318.zfcdp3jb5erwhjo6@kekkonen.localdomain>
In-Reply-To: <20190620161318.zfcdp3jb5erwhjo6@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
Content-ID: <F4D753D7D82C454B9329D210EA7419E4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_08:, , signatures=0
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 Mickael GUENE <mickael.guene@st.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/3] media: stm32-dcmi: add media
	controller support
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

On 6/20/19 6:13 PM, Sakari Ailus wrote:
> Hi Hugues,
> 
> On Tue, Jun 11, 2019 at 10:48:31AM +0200, Hugues Fruchet wrote:
>> Add media controller support to dcmi.
>>
>> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
>> ---
>>   drivers/media/platform/Kconfig            |  2 +-
>>   drivers/media/platform/stm32/stm32-dcmi.c | 83 +++++++++++++++++++++++--------
>>   2 files changed, 63 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
>> index 8a19654..de7e21f 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -121,7 +121,7 @@ config VIDEO_S3C_CAMIF
>>   
>>   config VIDEO_STM32_DCMI
>>   	tristate "STM32 Digital Camera Memory Interface (DCMI) support"
>> -	depends on VIDEO_V4L2 && OF
>> +	depends on VIDEO_V4L2 && OF && MEDIA_CONTROLLER
> 
> Ok, if the intent is to require MC from now on, then I think you could
> simply rely on media_entity_remote_pad() in finding the image source.
> 
>>   	depends on ARCH_STM32 || COMPILE_TEST
>>   	select VIDEOBUF2_DMA_CONTIG
>>   	select V4L2_FWNODE
>> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
>> index 7a4d559..3a69783 100644
>> --- a/drivers/media/platform/stm32/stm32-dcmi.c
>> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
>> @@ -170,6 +170,9 @@ struct stm32_dcmi {
>>   
>>   	/* Ensure DMA operations atomicity */
>>   	struct mutex			dma_lock;
>> +
>> +	struct media_device		mdev;
>> +	struct media_pad		vid_cap_pad;
>>   };
>>   
>>   static inline struct stm32_dcmi *notifier_to_dcmi(struct v4l2_async_notifier *n)
>> @@ -1545,21 +1548,12 @@ static int dcmi_graph_notify_complete(struct v4l2_async_notifier *notifier)
>>   		dev_err(dcmi->dev, "Could not get sensor bounds\n");
>>   		return ret;
>>   	}
>> -
>>   	ret = dcmi_set_default_fmt(dcmi);
>>   	if (ret) {
>>   		dev_err(dcmi->dev, "Could not set default format\n");
>>   		return ret;
>>   	}
>>   
>> -	ret = video_register_device(dcmi->vdev, VFL_TYPE_GRABBER, -1);
>> -	if (ret) {
>> -		dev_err(dcmi->dev, "Failed to register video device\n");
>> -		return ret;
>> -	}
>> -
>> -	dev_dbg(dcmi->dev, "Device registered as %s\n",
>> -		video_device_node_name(dcmi->vdev));
>>   	return 0;
>>   }
>>   
>> @@ -1648,6 +1642,12 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
>>   	return 0;
>>   }
>>   
>> +static void dcmi_graph_deinit(struct stm32_dcmi *dcmi)
>> +{
>> +	v4l2_async_notifier_unregister(&dcmi->notifier);
>> +	v4l2_async_notifier_cleanup(&dcmi->notifier);
> 
> I'd just leave the calls where they are now. This doesn't improve
> readability of the code, rather the opposite.
> 

fixed in v3.

>> +}
>> +
>>   static int dcmi_probe(struct platform_device *pdev)
>>   {
>>   	struct device_node *np = pdev->dev.of_node;
>> @@ -1752,10 +1752,27 @@ static int dcmi_probe(struct platform_device *pdev)
>>   
>>   	q = &dcmi->queue;
>>   
>> +	dcmi->v4l2_dev.mdev = &dcmi->mdev;
>> +
>> +	/* Initialize media device */
>> +	strscpy(dcmi->mdev.model, DRV_NAME, sizeof(dcmi->mdev.model));
>> +	snprintf(dcmi->mdev.bus_info, sizeof(dcmi->mdev.bus_info),
>> +		 "platform:%s", DRV_NAME);
>> +	dcmi->mdev.dev = &pdev->dev;
>> +	media_device_init(&dcmi->mdev);
>> +
>> +	/* Register the media device */
>> +	ret = media_device_register(&dcmi->mdev);
>> +	if (ret) {
>> +		dev_err(dcmi->dev, "Failed to register media device (%d)\n",
>> +			ret);
>> +		goto err_media_device_cleanup;
>> +	}
>> +
>>   	/* Initialize the top-level structure */
>>   	ret = v4l2_device_register(&pdev->dev, &dcmi->v4l2_dev);
>>   	if (ret)
>> -		goto err_dma_release;
>> +		goto err_media_device_unregister;
>>   
>>   	dcmi->vdev = video_device_alloc();
>>   	if (!dcmi->vdev) {
>> @@ -1775,6 +1792,25 @@ static int dcmi_probe(struct platform_device *pdev)
>>   				  V4L2_CAP_READWRITE;
>>   	video_set_drvdata(dcmi->vdev, dcmi);
>>   
>> +	/* Media entity pads */
>> +	dcmi->vid_cap_pad.flags = MEDIA_PAD_FL_SINK;
>> +	ret = media_entity_pads_init(&dcmi->vdev->entity,
>> +				     1, &dcmi->vid_cap_pad);
>> +	if (ret) {
>> +		dev_err(dcmi->dev, "Failed to init media entity pad\n");
>> +		goto err_device_unregister;
>> +	}
>> +	dcmi->vdev->entity.flags |= MEDIA_ENT_FL_DEFAULT;
>> +
>> +	ret = video_register_device(dcmi->vdev, VFL_TYPE_GRABBER, -1);
>> +	if (ret) {
>> +		dev_err(dcmi->dev, "Failed to register video device\n");
>> +		goto err_media_entity_cleanup;
>> +	}
>> +
>> +	dev_dbg(dcmi->dev, "Device registered as %s\n",
>> +		video_device_node_name(dcmi->vdev));
>> +
>>   	/* Buffer queue */
>>   	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>>   	q->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
>> @@ -1790,18 +1826,18 @@ static int dcmi_probe(struct platform_device *pdev)
>>   	ret = vb2_queue_init(q);
>>   	if (ret < 0) {
>>   		dev_err(&pdev->dev, "Failed to initialize vb2 queue\n");
>> -		goto err_device_release;
>> +		goto err_media_entity_cleanup;
>>   	}
>>   
>>   	ret = dcmi_graph_init(dcmi);
>>   	if (ret < 0)
>> -		goto err_device_release;
>> +		goto err_media_entity_cleanup;
>>   
>>   	/* Reset device */
>>   	ret = reset_control_assert(dcmi->rstc);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "Failed to assert the reset line\n");
>> -		goto err_cleanup;
>> +		goto err_graph_deinit;
>>   	}
>>   
>>   	usleep_range(3000, 5000);
>> @@ -1809,7 +1845,7 @@ static int dcmi_probe(struct platform_device *pdev)
>>   	ret = reset_control_deassert(dcmi->rstc);
>>   	if (ret) {
>>   		dev_err(&pdev->dev, "Failed to deassert the reset line\n");
>> -		goto err_cleanup;
>> +		goto err_graph_deinit;
>>   	}
>>   
>>   	dev_info(&pdev->dev, "Probe done\n");
>> @@ -1820,13 +1856,16 @@ static int dcmi_probe(struct platform_device *pdev)
>>   
>>   	return 0;
>>   
>> -err_cleanup:
>> -	v4l2_async_notifier_cleanup(&dcmi->notifier);
>> -err_device_release:
>> -	video_device_release(dcmi->vdev);
>> +err_graph_deinit:
>> +	dcmi_graph_deinit(dcmi);
>> +err_media_entity_cleanup:
>> +	media_entity_cleanup(&dcmi->vdev->entity);
>>   err_device_unregister:
>>   	v4l2_device_unregister(&dcmi->v4l2_dev);
>> -err_dma_release:
>> +err_media_device_unregister:
>> +	media_device_unregister(&dcmi->mdev);
>> +err_media_device_cleanup:
>> +	media_device_cleanup(&dcmi->mdev);
>>   	dma_release_channel(dcmi->dma_chan);
>>   
>>   	return ret;
>> @@ -1838,9 +1877,11 @@ static int dcmi_remove(struct platform_device *pdev)
>>   
>>   	pm_runtime_disable(&pdev->dev);
>>   
>> -	v4l2_async_notifier_unregister(&dcmi->notifier);
>> -	v4l2_async_notifier_cleanup(&dcmi->notifier);
>> +	dcmi_graph_deinit(dcmi);
>> +	media_entity_cleanup(&dcmi->vdev->entity);
>>   	v4l2_device_unregister(&dcmi->v4l2_dev);
>> +	media_device_unregister(&dcmi->mdev);
> 
> Please unregister the media device first before unregistering anything else
> it depends on (i.e. async notifier or the entity).
> 
Media device registry is dropped in v3 to not expose media controller
interfaces to userspace as discussed here:
https://www.spinics.net/lists/linux-media/msg153417.html

>> +	media_device_cleanup(&dcmi->mdev);
>>   
>>   	dma_release_channel(dcmi->dma_chan);
>>   
> 

BR,
Hugues.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
