Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E9654336
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Dec 2022 15:34:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64509C6904C;
	Thu, 22 Dec 2022 14:34:54 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09946C64109
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 14:34:52 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BMED0A2026702; Thu, 22 Dec 2022 15:34:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=67fzNKXCkBzoxXsOTsF9p1AcsrU4OSEoaRnEhq/v5Jk=;
 b=bDcJQ0x0Z3/kK3cGayQHg9jkb1RZrqRpzT/DnKLH0FDC1iaD7ALHU1r50ewhPeywwbbK
 6BG6EgDUpC2xDFF4xrfqXZ5RwK9UbORel4Lcx/PCk1VT8UEfWZ3vvKkkCjqvMIW3nkOl
 MH901dSAqFm41vXdgb65H/k2aopeIqgC1L0B7Ho9Qzco7kb0u4m9BvhS5v7S4Cd+KuA8
 G5bCIQ77H6nYI7sh0NAuodEiXoTxjRDIKrWltCV80lcgJi/IqNzMQw54uZUBLi7iLsQx
 h4R6+b/zYHzoGw5NKD/vlfrkKa6buKzglzbFgvocrSV1mH3sj5OyYbKnZPy0OjRn+vpO XQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3mkc8jffr6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Dec 2022 15:34:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 08A2C100038;
 Thu, 22 Dec 2022 15:32:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 88901229A83;
 Thu, 22 Dec 2022 15:30:15 +0100 (CET)
Received: from [10.201.21.217] (10.201.21.217) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Thu, 22 Dec
 2022 15:30:14 +0100
Message-ID: <e2086a52-4db8-e247-43de-c78ffa479634@foss.st.com>
Date: Thu, 22 Dec 2022 15:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, <alexandre.torgue@foss.st.com>,
 <robh+dt@kernel.org>, <Oleksii_Moisieiev@epam.com>,
 <linus.walleij@linaro.org>, <gregkh@linuxfoundation.org>
References: <20221221173055.11719-1-gatien.chevallier@foss.st.com>
 <20221221173055.11719-6-gatien.chevallier@foss.st.com>
 <ed8aa4d3-9570-eb72-a7d4-3b690adc3a6d@kernel.org>
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ed8aa4d3-9570-eb72-a7d4-3b690adc3a6d@kernel.org>
X-Originating-IP: [10.201.21.217]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-22_07,2022-12-22_03,2022-06-22_01
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [RFC PATCH 5/7] bus: stm32_sys_bus: add support
 for STM32MP15 and STM32MP13 system bus
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 12/22/22 11:28, Krzysztof Kozlowski wrote:
> On 21/12/2022 18:30, Gatien Chevallier wrote:
>> This driver is checking the access rights of the different
>> peripherals connected to the system bus. If access is denied,
>> the associated device tree node is skipped so the platform bus
>> does not probe it.
>>
>> Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>   MAINTAINERS                 |   6 ++
>>   drivers/bus/Kconfig         |   9 ++
>>   drivers/bus/Makefile        |   1 +
>>   drivers/bus/stm32_sys_bus.c | 180 ++++++++++++++++++++++++++++++++++++
>>   4 files changed, 196 insertions(+)
>>   create mode 100644 drivers/bus/stm32_sys_bus.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 886d3f69ee64..768a8272233e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -19522,6 +19522,12 @@ L:	linux-spi@vger.kernel.org
>>   S:	Maintained
>>   F:	drivers/spi/spi-stm32.c
>>   
>> +ST STM32 SYS BUS DRIVER
>> +M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/bus/st,sys-bus.yaml
>> +F:	drivers/bus/stm32_sys_bus.c
>> +
>>   ST STPDDC60 DRIVER
>>   M:	Daniel Nilsson <daniel.nilsson@flex.com>
>>   L:	linux-hwmon@vger.kernel.org
>> diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
>> index 7bfe998f3514..638bf5839cb0 100644
>> --- a/drivers/bus/Kconfig
>> +++ b/drivers/bus/Kconfig
>> @@ -163,6 +163,15 @@ config QCOM_SSC_BLOCK_BUS
>>   	  i2c/spi/uart controllers, a hexagon core, and a clock controller
>>   	  which provides clocks for the above.
>>   
>> +config STM32_SYS_BUS
>> +	bool "STM32 System bus controller"
>> +	depends on ARCH_STM32
> 
> || COMPILE_TEST

Sure, I will add this in V3

> 
>> +	default MACH_STM32MP157 || MACH_STM32MP13
>> +	help
>> +	  Say y to enable device access right verification before device probing.
>> +	  If access not granted, device won't be probed and an error message will
>> +	  provide the reason.
> 
> (...)
> 
>> +
>> +static int stm32_sys_bus_probe(struct platform_device *pdev)
>> +{
>> +	struct sys_bus_data *pdata;
>> +	struct resource *res;
>> +	void __iomem *mmio;
>> +	struct stm32_sys_bus_match_data *mdata;
>> +	struct device_node *np = pdev->dev.of_node;
>> +
>> +	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>> +	if (!pdata)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	mmio = devm_ioremap_resource(&pdev->dev, res);
> 
> Use helper for these two.

Ok, I will use devm_platform_ioremap_resource()

> 
>> +	if (IS_ERR(mmio))
>> +		return PTR_ERR(mmio);
>> +
>> +	pdata->sys_bus_base = mmio;
>> +
>> +	mdata = (struct stm32_sys_bus_match_data *)of_device_get_match_data(&pdev->dev);
> 
> Why do you need the cast?

I do not :) TBH, mdata is not useful at all. Changing to directly assign 
to pdata->pconf, that is now const there is no reason to modify it.

> 
>> +	if (!mdata)
> 
> Can you explain the case when this can actually happen? If it can, you
> have bug in ID table.

No I cannot as the driver is probed. It is only a sanity check, I can 
remove it for V3. However the function can return NULL... Would you 
prefer an explicit check on NULL or a simple removal?

> 
>> +		return -EINVAL;
>> +
>> +	pdata->pconf = mdata;
>> +	pdata->dev = &pdev->dev;
>> +
>> +	platform_set_drvdata(pdev, pdata);
>> +
>> +	stm32_sys_bus_populate(pdata);
>> +
>> +	/* Populate all available nodes */
>> +	return of_platform_populate(np, NULL, NULL, &pdev->dev);
>> +}
>> +
>> +static const struct stm32_sys_bus_match_data stm32mp15_sys_bus_data = {
>> +	.max_entries = STM32MP15_ETZPC_ENTRIES,
>> +	.sys_bus_get_access = stm32_etzpc_get_access,
>> +};
>> +
>> +static const struct stm32_sys_bus_match_data stm32mp13_sys_bus_data = {
>> +	.max_entries = STM32MP13_ETZPC_ENTRIES,
>> +	.sys_bus_get_access = stm32_etzpc_get_access,
> 
> It's the same as previous, drop.

Yes, ops is useless, I will directly call stm32_etzpc_get_access() in V3.

> 
>> +};
>> +
>> +static const struct of_device_id stm32_sys_bus_of_match[] = {
>> +	{ .compatible = "st,stm32mp15-sys-bus", .data = &stm32mp15_sys_bus_data },
>> +	{ .compatible = "st,stm32mp13-sys-bus", .data = &stm32mp13_sys_bus_data },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, stm32_sys_bus_of_match);
>> +
>> +static struct platform_driver stm32_sys_bus_driver = {
>> +	.probe  = stm32_sys_bus_probe,
>> +	.driver = {
>> +		.name = "stm32-sys-bus",
>> +		.of_match_table = stm32_sys_bus_of_match,
>> +	},
>> +};
>> +
>> +static int __init stm32_sys_bus_init(void)
>> +{
>> +	return platform_driver_register(&stm32_sys_bus_driver);
>> +}
>> +arch_initcall(stm32_sys_bus_init);
>> +
> 
> Best regards,
> Krzysztof
> 

Best regards,
Gatien
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
