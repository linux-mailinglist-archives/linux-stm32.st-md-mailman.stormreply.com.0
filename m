Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F3235571676
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jul 2022 12:02:31 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A5869C640F8;
	Tue, 12 Jul 2022 10:02:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61BFDC03FC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 10:02:30 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C6WEvi008293;
 Tue, 12 Jul 2022 12:01:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=KF13UsJuH9FTtje1DJFmMEELOXum2Enp56A8RtBO74Q=;
 b=y3QVFV/Clt6H73yNNAmt4XtFzYhzmyrkIsngLxHSJPAux3x5gl9pUMf340CnWYX6tF6s
 0QpU/WhbKk7SO5f7bDQ3ZM88l8EHneQbPJ62W9zq5GxPwebEbHFfd7N18IJHZNoSuGAa
 dD85chRFEIDcaUbwjBarZ+M30Y6L7zyaPuZKa7lrVAqBvJGVkpIAYO7s9RazCUs7USqD
 av+DDenbFbqxcLH8+Gy5ixad1brgEDLB0OMCi9OlJCnaUs8xiTOlsDHme868I4nQ6O4t
 3Xx5fBvzvu8uu5d8u//dTtnYXWAV+lHzsEmC+VMCC7/8nHUGdKviPBneZO6Lg/yXKF+M ZQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3h71128h8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 12:01:38 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 910C610002A;
 Tue, 12 Jul 2022 12:01:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 670BB216EDB;
 Tue, 12 Jul 2022 12:01:37 +0200 (CEST)
Received: from [10.48.1.102] (10.75.127.49) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Tue, 12 Jul
 2022 12:01:35 +0200
Message-ID: <51369b07-dade-7b56-bc9c-bc21b161916e@foss.st.com>
Date: Tue, 12 Jul 2022 12:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20220711120122.25804-1-fabrice.gasnier@foss.st.com>
 <20220711120122.25804-5-fabrice.gasnier@foss.st.com>
 <Ys03QgD0aIF1Zl9R@kuha.fi.intel.com>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <Ys03QgD0aIF1Zl9R@kuha.fi.intel.com>
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_05,2022-07-12_01,2022-06-22_01
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 4/4] usb: typec: ucsi: stm32g0: add
 support for power management
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

On 7/12/22 10:56, Heikki Krogerus wrote:
> Hi,
> 
> Mon, Jul 11, 2022 at 02:01:22PM +0200, Fabrice Gasnier kirjoitti:
>> Type-C connector can be used as a wakeup source (typically to detect
>> changes on the port, attach or detach...).
>> Add suspend / resume routines to enable wake irqs, and signal a wakeup
>> event in case the IRQ has fired while in suspend.
>> The i2c core is doing the necessary initialization when the "wakeup-source"
>> flag is provided.
>> Note: the interrupt handler shouldn't be called before the i2c bus resumes.
>> So, the interrupts are disabled during suspend period, and re-enabled
>> upon resume, to avoid i2c transfer while suspended, from the irq handler.
>>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 
> Does this really need a separate patch? Does the support depend on the
> second patch somehow?

Hi Heikki,

There's no dependency. I did a separate patch mainly to ease the review.

> 
> If not, then just merge this into the first patch. That
> g0->in_bootloader check you can add in the second patch.

Ok, I'll merge this into the first patches as you suggest, and add your
Acked-by.

Thanks for reviewing,
Best Regards,
Fabrice

> 
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
>> ---
>>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 52 +++++++++++++++++++++++++++
>>  1 file changed, 52 insertions(+)
>>
>> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
>> index b1d891c9a92c0..061551d464f12 100644
>> --- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
>> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
>> @@ -66,6 +66,8 @@ struct ucsi_stm32g0 {
>>  	unsigned long flags;
>>  	const char *fw_name;
>>  	struct ucsi *ucsi;
>> +	bool suspended;
>> +	bool wakeup_event;
>>  };
>>  
>>  /*
>> @@ -416,6 +418,9 @@ static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
>>  	u32 cci;
>>  	int ret;
>>  
>> +	if (g0->suspended)
>> +		g0->wakeup_event = true;
>> +
>>  	ret = ucsi_stm32g0_read(g0->ucsi, UCSI_CCI, &cci, sizeof(cci));
>>  	if (ret)
>>  		return IRQ_NONE;
>> @@ -696,6 +701,52 @@ static int ucsi_stm32g0_remove(struct i2c_client *client)
>>  	return 0;
>>  }
>>  
>> +static int ucsi_stm32g0_suspend(struct device *dev)
>> +{
>> +	struct ucsi_stm32g0 *g0 = dev_get_drvdata(dev);
>> +	struct i2c_client *client = g0->client;
>> +
>> +	if (g0->in_bootloader)
>> +		return 0;
>> +
>> +	/* Keep the interrupt disabled until the i2c bus has been resumed */
>> +	disable_irq(client->irq);
>> +
>> +	g0->suspended = true;
>> +	g0->wakeup_event = false;
>> +
>> +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
>> +		enable_irq_wake(client->irq);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ucsi_stm32g0_resume(struct device *dev)
>> +{
>> +	struct ucsi_stm32g0 *g0 = dev_get_drvdata(dev);
>> +	struct i2c_client *client = g0->client;
>> +
>> +	if (g0->in_bootloader)
>> +		return 0;
>> +
>> +	if (device_may_wakeup(dev) || device_wakeup_path(dev))
>> +		disable_irq_wake(client->irq);
>> +
>> +	enable_irq(client->irq);
>> +
>> +	/* Enforce any pending handler gets called to signal a wakeup_event */
>> +	synchronize_irq(client->irq);
>> +
>> +	if (g0->wakeup_event)
>> +		pm_wakeup_event(g0->dev, 0);
>> +
>> +	g0->suspended = false;
>> +
>> +	return 0;
>> +}
>> +
>> +static DEFINE_SIMPLE_DEV_PM_OPS(ucsi_stm32g0_pm_ops, ucsi_stm32g0_suspend, ucsi_stm32g0_resume);
>> +
>>  static const struct of_device_id __maybe_unused ucsi_stm32g0_typec_of_match[] = {
>>  	{ .compatible = "st,stm32g0-typec" },
>>  	{},
>> @@ -712,6 +763,7 @@ static struct i2c_driver ucsi_stm32g0_i2c_driver = {
>>  	.driver = {
>>  		.name = "ucsi-stm32g0-i2c",
>>  		.of_match_table = of_match_ptr(ucsi_stm32g0_typec_of_match),
>> +		.pm = pm_sleep_ptr(&ucsi_stm32g0_pm_ops),
>>  	},
>>  	.probe = ucsi_stm32g0_probe,
>>  	.remove = ucsi_stm32g0_remove,
>> -- 
>> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
