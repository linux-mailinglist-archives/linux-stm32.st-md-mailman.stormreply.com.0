Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D47B0230487
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jul 2020 09:48:22 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A9AAC36B27;
	Tue, 28 Jul 2020 07:48:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39029C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 07:48:21 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S7lixs021797; Tue, 28 Jul 2020 09:48:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=NkOHTuIum3uJvQxrbwjluQtz8Ukz7QuQntHgqGitDlw=;
 b=bojODVCblJyp8S4KJpH6pSb/TKSHi0RXB7DGidnYw1C6ywC2eUcka5l6Y0c5/IyQwKrY
 sWfnyugYKcJlPg6+ge0GlvzoseuKAyWY9gcVm1c5m8GYcROqZMzXTZr3KcYF00/6YlLE
 0lnZFPwsC+rV1lZVAd195muEDXv6DrWLq28lNmA0fRog8KRmXEojSnpuFKm3zq0QYaUa
 A43rcrPfMr0UajwkhpN4cQGk2AW+Au8pW/tPBA52KPIlYC1JbnD6k5KKrOAx0Dqt0Rcl
 8DQMcpfyE01+bI64/+HqmSskt3F0K7T3lwh9s1zYvPGJsW4a7oTeclfJ0dYmneGsqHhY CQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagv4yy8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 09:48:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E828610002A;
 Tue, 28 Jul 2020 09:48:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D2CFA21FEA2;
 Tue, 28 Jul 2020 09:48:11 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 28 Jul
 2020 09:48:11 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 09:48:11 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Alain VOLMAT <alain.volmat@st.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>
Thread-Topic: [PATCH 1/2] media: stm32-dcmi: create video dev within notifier
 bound
Thread-Index: AQHWZKm2hQlOt6e2MkK9C4kMLjRhyqkce/UA
Date: Tue, 28 Jul 2020 07:48:11 +0000
Message-ID: <5650a872-3352-64cb-2f35-94e2be3b187f@st.com>
References: <1595918278-9724-1-git-send-email-alain.volmat@st.com>
 <1595918278-9724-2-git-send-email-alain.volmat@st.com>
In-Reply-To: <1595918278-9724-2-git-send-email-alain.volmat@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <0E5966DDEF578E4E9CEA2E6722F65B2D@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_01:2020-07-27,
 2020-07-28 signatures=0
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Yannick FERTRE <yannick.fertre@st.com>,
 "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH 1/2] media: stm32-dcmi: create video dev
 within notifier bound
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

Reviewed-by: Hugues Fruchet <hugues.fruchet@st.com>

On 7/28/20 8:37 AM, Alain Volmat wrote:
> In case of an error during the initialization of the sensor,
> the video device is still available since created at the
> probe of the dcmi driver. Moreover the device wouldn't
> be released even when removing the module since the release
> is performed as part of the notifier unbind callback
> (not called if no sensor is properly initialized).
> 
> This patch move the video device creation with the v4l2 notifier
> bound handler in order to avoid having a video device created when
> an error happen during the pipe (dcmi - sensor) initialization.
> 
> This also makes the video device creation symmetric with the
> release which is already done within the notifier unbind handler.
> 
> Fixes: 37404f91ef8b ("[media] stm32-dcmi: STM32 DCMI camera interface driver")
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>   drivers/media/platform/stm32/stm32-dcmi.c | 23 ++++++++++++-----------
>   1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index b8931490b83b..5e60d4c6eeeb 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -1747,6 +1747,15 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
>   
>   	dev_dbg(dcmi->dev, "Subdev \"%s\" bound\n", subdev->name);
>   
> +	ret = video_register_device(dcmi->vdev, VFL_TYPE_VIDEO, -1);
> +	if (ret) {
> +		dev_err(dcmi->dev, "Failed to register video device\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(dcmi->dev, "Device registered as %s\n",
> +		video_device_node_name(dcmi->vdev));
> +
>   	/*
>   	 * Link this sub-device to DCMI, it could be
>   	 * a parallel camera sensor or a bridge
> @@ -1759,10 +1768,11 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
>   				    &dcmi->vdev->entity, 0,
>   				    MEDIA_LNK_FL_IMMUTABLE |
>   				    MEDIA_LNK_FL_ENABLED);
> -	if (ret)
> +	if (ret) {
>   		dev_err(dcmi->dev, "Failed to create media pad link with subdev \"%s\"\n",
>   			subdev->name);
> -	else
> +		video_unregister_device(dcmi->vdev);
> +	} else
>   		dev_dbg(dcmi->dev, "DCMI is now linked to \"%s\"\n",
>   			subdev->name);
>   
> @@ -1974,15 +1984,6 @@ static int dcmi_probe(struct platform_device *pdev)
>   	}
>   	dcmi->vdev->entity.flags |= MEDIA_ENT_FL_DEFAULT;
>   
> -	ret = video_register_device(dcmi->vdev, VFL_TYPE_VIDEO, -1);
> -	if (ret) {
> -		dev_err(dcmi->dev, "Failed to register video device\n");
> -		goto err_media_entity_cleanup;
> -	}
> -
> -	dev_dbg(dcmi->dev, "Device registered as %s\n",
> -		video_device_node_name(dcmi->vdev));
> -
>   	/* Buffer queue */
>   	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
>   	q->io_modes = VB2_MMAP | VB2_READ | VB2_DMABUF;
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
