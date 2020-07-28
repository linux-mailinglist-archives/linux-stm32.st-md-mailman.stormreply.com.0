Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E602823048B
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jul 2020 09:48:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AE9D0C36B27;
	Tue, 28 Jul 2020 07:48:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ACE2C36B0C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jul 2020 07:48:45 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06S7ldf8021363; Tue, 28 Jul 2020 09:48:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=K8k0zl+hckRk71X66ed2zVcHgkK+3OE2huqwQBclzAo=;
 b=Go+KLXnCVHieo8OSjaKSblmt6ax6QuHgRWTjj4MLI/FqxVfNFjTdaIgM1Dgt1j5VwbLh
 v12+EI4kmYCzm7+YFtwmBMDM4VZO4v10ngKjvlNVPj16vEvuM6rjmgxvmzPnFCuQhNns
 Lct3oosVSQ5vsSXPA1bdbpVJqgxc5H999dCQetxp/Yd1KISa9bfqch6cWCblP9SvBqsq
 AviUd/IEAlL1MKO892vh0hRxkLTKEQyUpjMuW8GOVblSGsqhg6fzOViv2uC3sobhiWwD
 Aaj9dfX0aGw74+Amx1CuP5q4DlZEqyeU9isTIiF5j3Ch1cXLtMrySaqJqlGt3XKvTedn yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 32gagv501h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 09:48:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BEB2100034;
 Tue, 28 Jul 2020 09:48:38 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 47C1B21FEA5;
 Tue, 28 Jul 2020 09:48:38 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 09:48:38 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Tue, 28 Jul 2020 09:48:37 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Alain VOLMAT <alain.volmat@st.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>
Thread-Topic: [PATCH 2/2] media: stm32-dcmi: fix probe error path & module
 remove
Thread-Index: AQHWZKm2R+1D/3BXVEaElbeITuX1IakcfCUA
Date: Tue, 28 Jul 2020 07:48:37 +0000
Message-ID: <bb74d188-44d4-629a-f04a-a46cb3fb773b@st.com>
References: <1595918278-9724-1-git-send-email-alain.volmat@st.com>
 <1595918278-9724-3-git-send-email-alain.volmat@st.com>
In-Reply-To: <1595918278-9724-3-git-send-email-alain.volmat@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
Content-ID: <8C5571533AC1A1428F5147E2E3957DED@st.com>
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
Subject: Re: [Linux-stm32] [PATCH 2/2] media: stm32-dcmi: fix probe error
 path & module remove
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
> This commit add missing vb2_queue_release calls with the
> probe error path and module remove.
> Missing v4l2_async_notifier_unregister is also added within
> the probe error path
> 
> Fixes: 37404f91ef8b ("[media] stm32-dcmi: STM32 DCMI camera interface driver")
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>   drivers/media/platform/stm32/stm32-dcmi.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index 5e60d4c6eeeb..57830ee691be 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -2004,7 +2004,7 @@ static int dcmi_probe(struct platform_device *pdev)
>   
>   	ret = dcmi_graph_init(dcmi);
>   	if (ret < 0)
> -		goto err_media_entity_cleanup;
> +		goto err_vb2_queue_release;
>   
>   	/* Reset device */
>   	ret = reset_control_assert(dcmi->rstc);
> @@ -2030,7 +2030,10 @@ static int dcmi_probe(struct platform_device *pdev)
>   	return 0;
>   
>   err_cleanup:
> +	v4l2_async_notifier_unregister(&dcmi->notifier);
>   	v4l2_async_notifier_cleanup(&dcmi->notifier);
> +err_vb2_queue_release:
> +	vb2_queue_release(q);
>   err_media_entity_cleanup:
>   	media_entity_cleanup(&dcmi->vdev->entity);
>   err_device_release:
> @@ -2052,6 +2055,7 @@ static int dcmi_remove(struct platform_device *pdev)
>   
>   	v4l2_async_notifier_unregister(&dcmi->notifier);
>   	v4l2_async_notifier_cleanup(&dcmi->notifier);
> +	vb2_queue_release(&dcmi->queue);
>   	media_entity_cleanup(&dcmi->vdev->entity);
>   	v4l2_device_unregister(&dcmi->v4l2_dev);
>   	media_device_cleanup(&dcmi->mdev);
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
