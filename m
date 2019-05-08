Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3844617BC4
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2019 16:44:27 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D8A78C36B3F
	for <lists+linux-stm32@lfdr.de>; Wed,  8 May 2019 14:44:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95046C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 May 2019 14:44:25 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x48EfRWK016745; Wed, 8 May 2019 16:44:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=ujx99i/SdmhJJY/rTfyjZ25oaMJTjnJ2T2B83DEfQao=;
 b=NDBJhGUrF+5cuInlJHlGw+Wa11TeVKy9sCKxakUcQg4M/gC07uoIxkT24K1/ylLXCY5k
 Wqkzt57AQ4QQIWbdeDTm64k50D83HpQnavgmO3DPW3lFsa43MPtwtayz9mF9D0q6vOea
 Cv2pYd5EDB78dz4AIOFkcw3UEc1gqZcvm1DrQJfcuWPdA+G59vhtndIXoHLbKyIC9h2d
 0gjVQ+9DE8jS5lMkO35E8SA8A8VboazvOKB1Nl+eAUmASF8V5MofiqFSZz50jFA9fMOP
 Zfo6w4OdapO7LKAhrAa18JXran0E0YZ3FWsA3nNZK/0kg5Jqs6zDVyLeVp+csBDU6TcD Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2s94c3qnkd-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 08 May 2019 16:44:12 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0476338;
 Wed,  8 May 2019 14:44:10 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C010028CA;
 Wed,  8 May 2019 14:44:10 +0000 (GMT)
Received: from SFHDAG3NODE2.st.com (10.75.127.8) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 8 May
 2019 16:44:10 +0200
Received: from SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96]) by
 SFHDAG3NODE2.st.com ([fe80::b82f:1ce:8854:5b96%20]) with mapi id
 15.00.1347.000; Wed, 8 May 2019 16:44:10 +0200
From: Amelie DELAUNAY <amelie.delaunay@st.com>
To: Lee Jones <lee.jones@linaro.org>
Thread-Topic: [PATCH v5 2/9] mfd: Add ST Multi-Function eXpander (STMFX) core
 driver
Thread-Index: AQHU7qVAy3Bds8UGv0OmxPFvTsiQh6Zg82kAgABmwoA=
Date: Wed, 8 May 2019 14:44:10 +0000
Message-ID: <697597b2-088d-9ffb-54bd-e50b3ca8c012@st.com>
References: <1554794651-6874-1-git-send-email-amelie.delaunay@st.com>
 <1554794651-6874-3-git-send-email-amelie.delaunay@st.com>
 <20190508083622.GE3995@dell>
In-Reply-To: <20190508083622.GE3995@dell>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
Content-ID: <AA71AC5806FEE94686A2708FB6B887B8@st.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-08_08:, , signatures=0
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v5 2/9] mfd: Add ST Multi-Function
 eXpander (STMFX) core driver
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

On 5/8/19 10:36 AM, Lee Jones wrote:
> On Tue, 09 Apr 2019, Amelie Delaunay wrote:
> 
>> STMicroelectronics Multi-Function eXpander (STMFX) is a slave controller
>> using I2C for communication with the main MCU. Main features are:
>> - 16 fast GPIOs individually configurable in input/output
>> - 8 alternate GPIOs individually configurable in input/output when other
>> STMFX functions are not used
>> - Main MCU IDD measurement
>> - Resistive touchscreen controller
>>
>> Signed-off-by: Amelie Delaunay <amelie.delaunay@st.com>
>> ---
>>   drivers/mfd/Kconfig       |  13 ++
>>   drivers/mfd/Makefile      |   2 +-
>>   drivers/mfd/stmfx.c       | 566 ++++++++++++++++++++++++++++++++++++++++++++++
>>   include/linux/mfd/stmfx.h | 123 ++++++++++
>>   4 files changed, 703 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/mfd/stmfx.c
>>   create mode 100644 include/linux/mfd/stmfx.h
>>
>> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
>> index 3443f1a..9783e18 100644
>> --- a/drivers/mfd/Kconfig
>> +++ b/drivers/mfd/Kconfig
>> @@ -1907,6 +1907,19 @@ config MFD_STPMIC1
>>   	  To compile this driver as a module, choose M here: the
>>   	  module will be called stpmic1.
>>   
>> +config MFD_STMFX
>> +	tristate "Support for STMicroelectronics Multi-Function eXpander (STMFX)"
>> +	depends on I2C
>> +	depends on OF || COMPILE_TEST
>> +	select MFD_CORE
>> +	select REGMAP_I2C
>> +	help
>> +	  Support for the STMicroelectronics Multi-Function eXpander.
>> +
>> +	  This driver provides common support for accessing the device,
>> +	  additional drivers must be enabled in order to use the functionality
>> +	  of the device.
>> +
>>   menu "Multimedia Capabilities Port drivers"
>>   	depends on ARCH_SA1100
>>   
>> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
>> index b4569ed7..614eea8 100644
>> --- a/drivers/mfd/Makefile
>> +++ b/drivers/mfd/Makefile
>> @@ -246,4 +246,4 @@ obj-$(CONFIG_MFD_MXS_LRADC)     += mxs-lradc.o
>>   obj-$(CONFIG_MFD_SC27XX_PMIC)	+= sprd-sc27xx-spi.o
>>   obj-$(CONFIG_RAVE_SP_CORE)	+= rave-sp.o
>>   obj-$(CONFIG_MFD_ROHM_BD718XX)	+= rohm-bd718x7.o
>> -
>> +obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
>> diff --git a/drivers/mfd/stmfx.c b/drivers/mfd/stmfx.c
>> new file mode 100644
>> index 0000000..59f0a03
>> --- /dev/null
>> +++ b/drivers/mfd/stmfx.c
>> @@ -0,0 +1,566 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Driver for STMicroelectronics Multi-Function eXpander (STMFX) core
>> + *
>> + * Copyright (C) 2019 STMicroelectronics
>> + * Author(s): Amelie Delaunay <amelie.delaunay@st.com>.
>> + */
>> +#include <linux/bitfield.h>
>> +#include <linux/i2c.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/irq.h>
>> +#include <linux/mfd/core.h>
>> +#include <linux/mfd/stmfx.h>
>> +#include <linux/module.h>
>> +#include <linux/regulator/consumer.h>
> 
> [...]
> 
>> +static int stmfx_chip_init(struct i2c_client *client)
>> +{
>> +	struct stmfx *stmfx = i2c_get_clientdata(client);
>> +	u32 id;
>> +	u8 version[2];
>> +	int ret;
>> +
>> +	stmfx->vdd = devm_regulator_get_optional(&client->dev, "vdd");
>> +	if (IS_ERR(stmfx->vdd)) {
>> +		ret = PTR_ERR(stmfx->vdd);
>> +		if (ret != -ENODEV) {
>> +			if (ret != -EPROBE_DEFER)
>> +				dev_err(&client->dev,
>> +					"Can't get VDD regulator:%d\n", ret);
>> +			return ret;
>> +		}
> 
> Any reason you've decided to stick with this 3-layer nested if instead
> of going with my suggestion?
> 

Sorry, I didn't see your suggestion. I'll go with it in v6.

>> +	} else {
>> +		ret = regulator_enable(stmfx->vdd);
>> +		if (ret) {
>> +			dev_err(&client->dev, "VDD enable failed: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
> 
> [...]
> 
>> +#ifdef CONFIG_PM_SLEEP
>> +static int stmfx_backup_regs(struct stmfx *stmfx)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_raw_read(stmfx->map, STMFX_REG_SYS_CTRL,
>> +			      &stmfx->bkp_sysctrl, sizeof(stmfx->bkp_sysctrl));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_raw_read(stmfx->map, STMFX_REG_IRQ_OUT_PIN,
>> +			      &stmfx->bkp_irqoutpin,
>> +			      sizeof(stmfx->bkp_irqoutpin));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int stmfx_restore_regs(struct stmfx *stmfx)
>> +{
>> +	int ret;
>> +
>> +	ret = regmap_raw_write(stmfx->map, STMFX_REG_SYS_CTRL,
>> +			       &stmfx->bkp_sysctrl, sizeof(stmfx->bkp_sysctrl));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_raw_write(stmfx->map, STMFX_REG_IRQ_OUT_PIN,
>> +			       &stmfx->bkp_irqoutpin,
>> +			       sizeof(stmfx->bkp_irqoutpin));
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = regmap_raw_write(stmfx->map, STMFX_REG_IRQ_SRC_EN,
>> +			       &stmfx->irq_src, sizeof(stmfx->irq_src));
>> +	if (ret)
>> +		return ret;
>> +
>> +	return 0;
>> +}
>> +
>> +static int stmfx_suspend(struct device *dev)
>> +{
>> +	struct stmfx *stmfx = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = stmfx_backup_regs(stmfx);
>> +	if (ret) {
>> +		dev_err(stmfx->dev, "Registers backup failure\n");
>> +		return ret;
>> +	}
> 
> This doesn't need to be an extra function.  You're just adding more
> lines of code for no real gain in reusability/readability.
> 

I used a separate function to have only one dev_err in case of 
backup/restore failure.
But anyway, I'll drop backup/restore functions and put the code in 
suspend/resume.

>> +	if (!IS_ERR(stmfx->vdd)) {
>> +		ret = regulator_disable(stmfx->vdd);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int stmfx_resume(struct device *dev)
>> +{
>> +	struct stmfx *stmfx = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	if (!IS_ERR(stmfx->vdd)) {
>> +		ret = regulator_enable(stmfx->vdd);
>> +		if (ret) {
>> +			dev_err(stmfx->dev,
>> +				"VDD enable failed: %d\n", ret);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	ret = stmfx_restore_regs(stmfx);
>> +	if (ret) {
>> +		dev_err(stmfx->dev, "Registers restoration failure\n");
>> +		return ret;
>> +	}
> 
> This doesn't need to be an extra function.  You're just adding more
> lines of code for no real gain in reusability/readability.
> 
>> +	return 0;
>> +}
>> +#endif
> 
> [...]
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
