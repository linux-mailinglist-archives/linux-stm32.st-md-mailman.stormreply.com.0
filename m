Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FF5206FEC
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Jun 2020 11:24:34 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5CABBC36B0C;
	Wed, 24 Jun 2020 09:24:34 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 53F0DC36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Jun 2020 09:24:29 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05O9N6Ho021353; Wed, 24 Jun 2020 11:24:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ssvOIg3uf+Y7fFCRNZYw1uNfjtvZaLuNG9I1iTHaSIk=;
 b=MNfBeITfEL5tkWXv55qt47atccS2aJRvMrq8CgEknMojqeFqrDBkxNm214FXY9XzskM8
 5qi5HftLVtI0ukxnp1Z7w11PgFKc1vfYganUaZkSrS3ZJm/956y8f+0aqPrHIRCWCvc4
 osvhu9VJo0jaunO3DFQADl40Tl6Gg/YXiCS+c0NzjarRrCX4nFVFK8QDh3p69DqCaKZS
 XehoJcN2NojWnKy4lDCZ2lhzEFhnhzOiAM+gIVbUk3z2iJJHquGkIDX6/xLw+WkT8Co/
 lH8SLtTlXspawLnPJIMP6XN1MhNdxPbX9AUIeKdRzK+F80XPbzq7hhsgKPgHJoWdY0Jo jw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 31uuucaudm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 11:24:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E717010002A;
 Wed, 24 Jun 2020 11:24:17 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CF6892B1F3B;
 Wed, 24 Jun 2020 11:24:17 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 24 Jun
 2020 11:24:17 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Wed, 24 Jun 2020 11:24:17 +0200
From: Hugues FRUCHET <hugues.fruchet@st.com>
To: Benjamin GAIGNARD <benjamin.gaignard@st.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "mcoquelin.stm32@gmail.com"
 <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>
Thread-Topic: [PATCH v6 2/3] media: stm32-dcmi: Set minimum cpufreq requirement
Thread-Index: AQHWPyIrF62OlRYyaE21U2OFV83I4KjncrQA
Date: Wed, 24 Jun 2020 09:24:17 +0000
Message-ID: <b40a7312-9ea8-098f-8ba8-f080b3f57b5f@st.com>
References: <20200610122500.4304-1-benjamin.gaignard@st.com>
 <20200610122500.4304-3-benjamin.gaignard@st.com>
In-Reply-To: <20200610122500.4304-3-benjamin.gaignard@st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.47]
Content-ID: <4756B529E6D8DB4180B69598F07D3C97@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_04:2020-06-24,
 2020-06-24 signatures=0
Cc: "vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
 "rjw@rjwysocki.net" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "valentin.schneider@arm.com" <valentin.schneider@arm.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH v6 2/3] media: stm32-dcmi: Set minimum
	cpufreq requirement
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


Hi Benjamin,

test condition in set_min_frequency() to fix, appart from that:
Acked-by: Hugues Fruchet <hugues.fruchet@st.com>

BR,
Hugues.

On 6/10/20 2:24 PM, Benjamin Gaignard wrote:
> Before start streaming set cpufreq minimum frequency requirement.
> The cpufreq governor will adapt the frequencies and we will have
> no latency for handling interrupts.
> The frequency requirement is retrieved from the device-tree node.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 6:
> - come back to version 4 and follow Valentin's suggestions about notifier
> - add Valentin's comment about notifier set/unset
> 
> version 5:
> - add a mutex to protect dcmi_irq_notifier_notify()
> - register notifier a probe time
> 
> version 4:
> - simplify irq affinity handling by using only dcmi_irq_notifier_notify()
> 
> version 3:
> - add a cpumask field to track boosted CPUs
> - add irq_affinity_notify callback
> - protect cpumask field with a mutex
> 
>   drivers/media/platform/stm32/stm32-dcmi.c | 138 ++++++++++++++++++++++++++++--
>   1 file changed, 130 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c b/drivers/media/platform/stm32/stm32-dcmi.c
> index b8931490b83b..382df6e7c864 100644
> --- a/drivers/media/platform/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
> @@ -13,10 +13,13 @@
>   
>   #include <linux/clk.h>
>   #include <linux/completion.h>
> +#include <linux/cpufreq.h>
> +#include <linux/cpumask.h>
>   #include <linux/delay.h>
>   #include <linux/dmaengine.h>
>   #include <linux/init.h>
>   #include <linux/interrupt.h>
> +#include <linux/irq.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/of.h>
> @@ -99,6 +102,8 @@ enum state {
>   
>   #define OVERRUN_ERROR_THRESHOLD	3
>   
> +static DEFINE_PER_CPU(struct freq_qos_request, qos_req);
> +
>   struct dcmi_graph_entity {
>   	struct v4l2_async_subdev asd;
>   
> @@ -133,6 +138,7 @@ struct stm32_dcmi {
>   	struct resource			*res;
>   	struct reset_control		*rstc;
>   	int				sequence;
> +	int				irq;
>   	struct list_head		buffers;
>   	struct dcmi_buf			*active;
>   
> @@ -173,6 +179,11 @@ struct stm32_dcmi {
>   	struct media_device		mdev;
>   	struct media_pad		vid_cap_pad;
>   	struct media_pipeline		pipeline;
> +
> +	struct mutex			freq_lock;
> +	u32				min_frequency;
> +	cpumask_var_t			boosted;
> +	struct irq_affinity_notify	notify;
>   };
>   
>   static inline struct stm32_dcmi *notifier_to_dcmi(struct v4l2_async_notifier *n)
> @@ -722,6 +733,99 @@ static void dcmi_pipeline_stop(struct stm32_dcmi *dcmi)
>   	dcmi_pipeline_s_stream(dcmi, 0);
>   }
>   
> +static void dcmi_get_min_frequency(struct stm32_dcmi *dcmi)
> +{
> +	struct device_node *np = dcmi->mdev.dev->of_node;
> +
> +	dcmi->min_frequency = FREQ_QOS_MIN_DEFAULT_VALUE;
> +
> +	of_property_read_u32(np, "st,stm32-dcmi-min-frequency",
> +			     &dcmi->min_frequency);
> +}
> +
> +static void dcmi_irq_notifier_notify(struct irq_affinity_notify *notify,
> +				     const cpumask_t *mask)
> +{
> +	struct stm32_dcmi *dcmi = container_of(notify,
> +					       struct stm32_dcmi,
> +					       notify);
> +	struct cpufreq_policy *p;
> +	int cpu;
> +
> +	mutex_lock(&dcmi->freq_lock);
> +	/*
> +	 * For all boosted CPUs check if it is still the case
> +	 * if not remove the request
> +	 */
> +	for_each_cpu(cpu, dcmi->boosted) {
> +		if (cpumask_test_cpu(cpu, mask))
> +			continue;
> +
> +		p = cpufreq_cpu_get(cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_remove_request(&per_cpu(qos_req, cpu));
> +		cpumask_andnot(dcmi->boosted, dcmi->boosted, p->cpus);
> +
> +		cpufreq_cpu_put(p);
> +	}
> +
> +	/*
> +	 * For CPUs in the mask check if they are boosted if not add
> +	 * a request
> +	 */
> +	for_each_cpu(cpu, mask) {
> +		if (cpumask_test_cpu(cpu, dcmi->boosted))
> +			continue;
> +
> +		p = cpufreq_cpu_get(cpu);
> +		if (!p)
> +			continue;
> +
> +		freq_qos_add_request(&p->constraints, &per_cpu(qos_req, cpu),
> +				     FREQ_QOS_MIN, dcmi->min_frequency);
> +		cpumask_or(dcmi->boosted, dcmi->boosted, p->cpus);
> +		cpufreq_cpu_put(p);
> +	}
> +
> +	mutex_unlock(&dcmi->freq_lock);
> +}
> +
> +static void dcmi_irq_notifier_release(struct kref *ref)
> +{
> +	/*
> +	 * This is required by affinity notifier. We don't have anything to
> +	 * free here.
> +	 */
> +}
> +
> +static void dcmi_set_min_frequency(struct stm32_dcmi *dcmi, s32 freq)
> +{
> +	struct irq_affinity_notify *notify = &dcmi->notify;
> +	struct cpumask clear;
> +
> +	if (freq) {

if (freq != FREQ_QOS_MIN_DEFAULT_VALUE)

> +		/*
> +		 * Register the notifier before doing any change, so the
> +		 * callback can be queued if an affinity change happens *while*
> +		 * we are requesting the boosts.
> +		 */
> +		irq_set_affinity_notifier(dcmi->irq, notify);
> +		dcmi_irq_notifier_notify(notify,
> +					 irq_get_affinity_mask(dcmi->irq));
> +	} else {
> +		/*
> +		 * Unregister the notifier before clearing the boost requests,
> +		 * as we don't want to boost again if an affinity change happens
> +		 * *while* we are clearing the requests
> +		 */
> +		irq_set_affinity_notifier(dcmi->irq, NULL);
> +		cpumask_clear(&clear);
> +		dcmi_irq_notifier_notify(notify, &clear);
> +	}
> +}
> +
>   static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>   {
>   	struct stm32_dcmi *dcmi = vb2_get_drv_priv(vq);
> @@ -736,11 +840,13 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>   		goto err_release_buffers;
>   	}
>   
> +	dcmi_set_min_frequency(dcmi, dcmi->min_frequency);
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
> @@ -835,7 +941,8 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
>   err_media_pipeline_stop:
>   	media_pipeline_stop(&dcmi->vdev->entity);
>   
> -err_pm_put:
> +err_drop_qos:
> +	dcmi_set_min_frequency(dcmi, FREQ_QOS_MIN_DEFAULT_VALUE) >   	pm_runtime_put(dcmi->dev);
>   
>   err_release_buffers:
> @@ -863,6 +970,8 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
>   
>   	media_pipeline_stop(&dcmi->vdev->entity);
>   
> +	dcmi_set_min_frequency(dcmi, FREQ_QOS_MIN_DEFAULT_VALUE);
> +
>   	spin_lock_irq(&dcmi->irqlock);
>   
>   	/* Disable interruptions */
> @@ -1834,11 +1943,11 @@ static int dcmi_probe(struct platform_device *pdev)
>   	struct device_node *np = pdev->dev.of_node;
>   	const struct of_device_id *match = NULL;
>   	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
> +	struct irq_affinity_notify *notify;
>   	struct stm32_dcmi *dcmi;
>   	struct vb2_queue *q;
>   	struct dma_chan *chan;
>   	struct clk *mclk;
> -	int irq;
>   	int ret = 0;
>   
>   	match = of_match_device(of_match_ptr(stm32_dcmi_of_match), &pdev->dev);
> @@ -1879,9 +1988,9 @@ static int dcmi_probe(struct platform_device *pdev)
>   	dcmi->bus.bus_width = ep.bus.parallel.bus_width;
>   	dcmi->bus.data_shift = ep.bus.parallel.data_shift;
>   
> -	irq = platform_get_irq(pdev, 0);
> -	if (irq <= 0)
> -		return irq ? irq : -ENXIO;
> +	dcmi->irq = platform_get_irq(pdev, 0);
> +	if (dcmi->irq <= 0)
> +		return dcmi->irq ? dcmi->irq : -ENXIO;
>   
>   	dcmi->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>   	if (!dcmi->res) {
> @@ -1895,11 +2004,12 @@ static int dcmi_probe(struct platform_device *pdev)
>   		return PTR_ERR(dcmi->regs);
>   	}
>   
> -	ret = devm_request_threaded_irq(&pdev->dev, irq, dcmi_irq_callback,
> +	ret = devm_request_threaded_irq(&pdev->dev, dcmi->irq,
> +					dcmi_irq_callback,
>   					dcmi_irq_thread, IRQF_ONESHOT,
>   					dev_name(&pdev->dev), dcmi);
>   	if (ret) {
> -		dev_err(&pdev->dev, "Unable to request irq %d\n", irq);
> +		dev_err(&pdev->dev, "Unable to request irq %d\n", dcmi->irq);
>   		return ret;
>   	}
>   
> @@ -1922,6 +2032,7 @@ static int dcmi_probe(struct platform_device *pdev)
>   	spin_lock_init(&dcmi->irqlock);
>   	mutex_init(&dcmi->lock);
>   	mutex_init(&dcmi->dma_lock);
> +	mutex_init(&dcmi->freq_lock);
>   	init_completion(&dcmi->complete);
>   	INIT_LIST_HEAD(&dcmi->buffers);
>   
> @@ -1930,6 +2041,13 @@ static int dcmi_probe(struct platform_device *pdev)
>   	dcmi->state = STOPPED;
>   	dcmi->dma_chan = chan;
>   
> +	if (!alloc_cpumask_var(&dcmi->boosted, GFP_KERNEL))
> +		return -ENODEV;
> +
> +	notify = &dcmi->notify;
> +	notify->notify = dcmi_irq_notifier_notify;
> +	notify->release = dcmi_irq_notifier_release;
> +
>   	q = &dcmi->queue;
>   
>   	dcmi->v4l2_dev.mdev = &dcmi->mdev;
> @@ -2022,6 +2140,8 @@ static int dcmi_probe(struct platform_device *pdev)
>   
>   	dev_info(&pdev->dev, "Probe done\n");
>   
> +	dcmi_get_min_frequency(dcmi);
> +
>   	platform_set_drvdata(pdev, dcmi);
>   
>   	pm_runtime_enable(&pdev->dev);
> @@ -2049,6 +2169,8 @@ static int dcmi_remove(struct platform_device *pdev)
>   
>   	pm_runtime_disable(&pdev->dev);
>   
> +	free_cpumask_var(dcmi->boosted);
> +
>   	v4l2_async_notifier_unregister(&dcmi->notifier);
>   	v4l2_async_notifier_cleanup(&dcmi->notifier);
>   	media_entity_cleanup(&dcmi->vdev->entity);
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
