Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4956C1EB75E
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Jun 2020 10:29:55 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6080C36B22;
	Tue,  2 Jun 2020 08:29:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE514C36B0D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2020 08:29:52 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0528SDJr026270; Tue, 2 Jun 2020 10:29:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=6XTqD4oSlrbjM9/x3g1YaVOoeoVL9aa2OTi5ThyuPwU=;
 b=k09ef3UywWNyT67MNoGBHI4ZPUwtwJR6gOuT1+2KnA+ifAvFV6a5VYVL0hKX/ckO5/o4
 ITQgyRe7JF5o7ZEaY/b1mlOGAFz/E0tg5kJK7kFMAOmk/EOXFpLEAWKDuhvQLm+RqLp3
 BKCKTERRngN/N5C0LLulBMBorgDnpzZxUkf9d50rwRvujWBreb+2x7yMUdokyUYi0uDN
 4ZEy3o5LEBlH+qmPrVYeIDiq+MO6JpndyQmfmiekY3L9MGNgkviKgp6ZF/W8iyPRA0ks
 qqShYb1lUKr+Me++2/IKQ0VMnvQgSOaAdxZVQFLp8EBQk8G+Tj32Y1mZ1BE+a6a9VshR Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31bcy0dbp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Jun 2020 10:29:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id D80D410002A;
 Tue,  2 Jun 2020 10:29:36 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A661A2AAD1F;
 Tue,  2 Jun 2020 10:29:36 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 2 Jun
 2020 10:29:36 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Tue, 2 Jun 2020 10:29:36 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>
Thread-Topic: [PATCH] media: stm32-dcmi: Set minimum cpufreq requirement
Thread-Index: AQHWNDnEu2gs2ws6JUCiuNPgKFH4kKjE5e6A
Date: Tue, 2 Jun 2020 08:29:36 +0000
Message-ID: <c53ca6f9-5350-0234-eb52-2c656ffab79c@st.com>
References: <20200527151613.16083-1-benjamin.gaignard@st.com>
In-Reply-To: <20200527151613.16083-1-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
Content-ID: <5C415AA3C357474291DF12AFD1D350E4@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-02_11:2020-06-01,
 2020-06-02 signatures=0
Cc: "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "valentin.schneider@arm.com" <valentin.schneider@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] media: stm32-dcmi: Set minimum cpufreq
	requirement
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

Acked-by: Hugues Fruchet <hugues.fruchet@st.com>

On 5/27/20 5:16 PM, Benjamin Gaignard wrote:
> Before start streaming set cpufreq minimum frequency requirement.
> The cpufreq governor will adapt the frequencies and we will have
> no latency for handling interrupts.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>   drivers/media/platform/stm32/stm32-dcmi.c | 29 ++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index b8931490b83b..97c342351569 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -13,6 +13,7 @@
>   
>   #include <linux/clk.h>
>   #include <linux/completion.h>
> +#include <linux/cpufreq.h>
>   #include <linux/delay.h>
>   #include <linux/dmaengine.h>
>   #include <linux/init.h>
> @@ -99,6 +100,8 @@ enum state {
>   
>   #define OVERRUN_ERROR_THRESHOLD	3
>   
> +#define DCMI_MIN_FREQ	650000 /* in KHz */
> +
>   struct dcmi_graph_entity {
>   	struct v4l2_async_subdev asd;
>   
> @@ -173,6 +176,10 @@ struct stm32_dcmi {
>   	struct media_device		mdev;
>   	struct media_pad		vid_cap_pad;
>   	struct media_pipeline		pipeline;
> +
> +	/* CPU freq contraint */
> +	struct cpufreq_policy		*policy;
> +	struct freq_qos_request		qos_req;
>   };
>   
>   static inline struct stm32_dcmi *notifier_to_dcmi(struct v4l2_async_notifier *n)
> @@ -736,11 +743,20 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>   		goto err_release_buffers;
>   	}
>   
> +	if (dcmi->policy) {
> +		ret = freq_qos_add_request(&dcmi->policy->constraints,
> +					   &dcmi->qos_req, FREQ_QOS_MIN,
> +					   DCMI_MIN_FREQ);
> +
> +		if (ret < 0)
> +			goto err_pm_put;
> +	}
> +
>   	ret = media_pipeline_start(&dcmi->vdev->entity, &dcmi->pipeline);
>   	if (ret < 0) {
>   		dev_err(dcmi->dev, "%s: Failed to start streaming, media pipeline start error (%d)\n",
>   			__func__, ret);
> -		goto err_pm_put;
> +		goto err_drop_qos;
>   	}
>   
>   	ret = dcmi_pipeline_start(dcmi);
> @@ -835,6 +851,9 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>   err_media_pipeline_stop:
>   	media_pipeline_stop(&dcmi->vdev->entity);
>   
> +err_drop_qos:
> +	if (dcmi->policy)
> +		freq_qos_remove_request(&dcmi->qos_req);
>   err_pm_put:
>   	pm_runtime_put(dcmi->dev);
>   
> @@ -863,6 +882,9 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
>   
>   	media_pipeline_stop(&dcmi->vdev->entity);
>   
> +	if (dcmi->policy)
> +		freq_qos_remove_request(&dcmi->qos_req);
> +
>   	spin_lock_irq(&dcmi->irqlock);
>   
>   	/* Disable interruptions */
> @@ -2020,6 +2042,8 @@ static int dcmi_probe(struct platform_device *pdev)
>   		goto err_cleanup;
>   	}
>   
> +	dcmi->policy = cpufreq_cpu_get(0);
> +
>   	dev_info(&pdev->dev, "Probe done\n");
>   
>   	platform_set_drvdata(pdev, dcmi);
> @@ -2049,6 +2073,9 @@ static int dcmi_remove(struct platform_device *pdev)
>   
>   	pm_runtime_disable(&pdev->dev);
>   
> +	if (dcmi->policy)
> +		cpufreq_cpu_put(dcmi->policy);
> +
>   	v4l2_async_notifier_unregister(&dcmi->notifier);
>   	v4l2_async_notifier_cleanup(&dcmi->notifier);
>   	media_entity_cleanup(&dcmi->vdev->entity);
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
