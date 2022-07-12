Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E20BD5714BB
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jul 2022 10:36:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9817DC640F9;
	Tue, 12 Jul 2022 08:36:03 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BAFD3C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 08:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657614961; x=1689150961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CMMOHSQnt4pXL7Lap1dzPhshjD8QGIMdroMSwJ1d4Sc=;
 b=GwqxQ9Y1iT2LSqsicyFiBv/NlgdNQGzwIOFpFBRvo5j8LWqViRr0S829
 r8ANpWWdQl3/XQf5i0liE11+uYkhiEoNTAFIUgZh7Tebkuc1gY6x1EYuy
 7JtUkTryVRNL/mwfya8Afv9xLbArEzzne38aV3Hm2X45echgBgpDu018/
 VG6iAd43APauxGG+7GAf4n2HzE05LRv1ZawXRgviKCOF9Vo9WfMsoX7Hn
 3P84t37LRlZwRSy/NY9YnUuyqOXJjdi3BKktdI+zGBTlsYBgpnMS0PBH0
 3VGQozusx/1vpJsf78SqLiV86Dn5k7NDgygXxDcndMMJBN4XvUM4vL0xt Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="282427817"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="282427817"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 01:35:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="737403368"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 12 Jul 2022 01:35:45 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 12 Jul 2022 11:35:45 +0300
Date: Tue, 12 Jul 2022 11:35:45 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <Ys0yYSqcJC4eJ/8A@kuha.fi.intel.com>
References: <20220711120122.25804-1-fabrice.gasnier@foss.st.com>
 <20220711120122.25804-3-fabrice.gasnier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220711120122.25804-3-fabrice.gasnier@foss.st.com>
Cc: devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, krzysztof.kozlowski+dt@linaro.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/4] usb: typec: ucsi: stm32g0: add
 support for stm32g0 i2c controller
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

Mon, Jul 11, 2022 at 02:01:20PM +0200, Fabrice Gasnier kirjoitti:
> STM32G0 provides an integrated USB Type-C and power delivery interface.
> It can be programmed with a firmware to handle UCSI protocol over I2C
> interface. A GPIO is used as an interrupt line.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes in v2:
> Christophe's remarks:
> - use kmalloc instead of kzalloc
> - Use-after-free of buf: directly print the offset
> ---
>  drivers/usb/typec/ucsi/Kconfig        |  10 ++
>  drivers/usb/typec/ucsi/Makefile       |   1 +
>  drivers/usb/typec/ucsi/ucsi_stm32g0.c | 218 ++++++++++++++++++++++++++
>  3 files changed, 229 insertions(+)
>  create mode 100644 drivers/usb/typec/ucsi/ucsi_stm32g0.c
> 
> diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> index 5e9b37b3f25e1..8f9c4b9f31f79 100644
> --- a/drivers/usb/typec/ucsi/Kconfig
> +++ b/drivers/usb/typec/ucsi/Kconfig
> @@ -48,4 +48,14 @@ config UCSI_ACPI
>  	  To compile the driver as a module, choose M here: the module will be
>  	  called ucsi_acpi
>  
> +config UCSI_STM32G0
> +	tristate "UCSI Interface Driver for STM32G0"
> +	depends on I2C
> +	help
> +	  This driver enables UCSI support on platforms that expose a STM32G0
> +	  Type-C controller over I2C interface.
> +
> +	  To compile the driver as a module, choose M here: the module will be
> +	  called ucsi_stm32g0.
> +
>  endif
> diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> index 8a8eb5cb8e0f0..480d533d762fe 100644
> --- a/drivers/usb/typec/ucsi/Makefile
> +++ b/drivers/usb/typec/ucsi/Makefile
> @@ -17,3 +17,4 @@ endif
>  
>  obj-$(CONFIG_UCSI_ACPI)			+= ucsi_acpi.o
>  obj-$(CONFIG_UCSI_CCG)			+= ucsi_ccg.o
> +obj-$(CONFIG_UCSI_STM32G0)		+= ucsi_stm32g0.o
> diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> new file mode 100644
> index 0000000000000..bb5271bf7cdcf
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
> @@ -0,0 +1,218 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +/*
> + * UCSI driver for STMicroelectronics STM32G0 Type-C PD controller
> + *
> + * Copyright (C) 2022, STMicroelectronics - All Rights Reserved
> + * Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "ucsi.h"
> +
> +struct ucsi_stm32g0 {
> +	struct i2c_client *client;
> +	struct completion complete;
> +	struct device *dev;
> +	unsigned long flags;
> +	struct ucsi *ucsi;
> +};
> +
> +static int ucsi_stm32g0_read(struct ucsi *ucsi, unsigned int offset, void *val, size_t len)
> +{
> +	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
> +	struct i2c_client *client = g0->client;
> +	u8 reg = offset;
> +	struct i2c_msg msg[] = {
> +		{
> +			.addr	= client->addr,
> +			.flags  = 0,
> +			.len	= 1,
> +			.buf	= &reg,
> +		},
> +		{
> +			.addr	= client->addr,
> +			.flags  = I2C_M_RD,
> +			.len	= len,
> +			.buf	= val,
> +		},
> +	};
> +	int ret;
> +
> +	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +	if (ret != ARRAY_SIZE(msg)) {
> +		dev_err(g0->dev, "i2c read %02x, %02x error: %d\n", client->addr, reg, ret);
> +
> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ucsi_stm32g0_async_write(struct ucsi *ucsi, unsigned int offset, const void *val,
> +				    size_t len)
> +{
> +	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
> +	struct i2c_client *client = g0->client;
> +	struct i2c_msg msg[] = {
> +		{
> +			.addr	= client->addr,
> +			.flags  = 0,
> +		}
> +	};
> +	unsigned char *buf;
> +	int ret;
> +
> +	buf = kmalloc(len + 1, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
> +	buf[0] = offset;
> +	memcpy(&buf[1], val, len);
> +	msg[0].len = len + 1;
> +	msg[0].buf = buf;
> +
> +	ret = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +	kfree(buf);
> +	if (ret != ARRAY_SIZE(msg)) {
> +		dev_err(g0->dev, "i2c write %02x, %02x error: %d\n", client->addr, offset, ret);
> +
> +		return ret < 0 ? ret : -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ucsi_stm32g0_sync_write(struct ucsi *ucsi, unsigned int offset, const void *val,
> +				   size_t len)
> +{
> +	struct ucsi_stm32g0 *g0 = ucsi_get_drvdata(ucsi);
> +	int ret;
> +
> +	set_bit(COMMAND_PENDING, &g0->flags);
> +
> +	ret = ucsi_stm32g0_async_write(ucsi, offset, val, len);
> +	if (ret)
> +		goto out_clear_bit;
> +
> +	if (!wait_for_completion_timeout(&g0->complete, msecs_to_jiffies(5000)))
> +		ret = -ETIMEDOUT;
> +
> +out_clear_bit:
> +	clear_bit(COMMAND_PENDING, &g0->flags);
> +
> +	return ret;
> +}
> +
> +static irqreturn_t ucsi_stm32g0_irq_handler(int irq, void *data)
> +{
> +	struct ucsi_stm32g0 *g0 = data;
> +	u32 cci;
> +	int ret;
> +
> +	ret = ucsi_stm32g0_read(g0->ucsi, UCSI_CCI, &cci, sizeof(cci));
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	if (UCSI_CCI_CONNECTOR(cci))
> +		ucsi_connector_change(g0->ucsi, UCSI_CCI_CONNECTOR(cci));
> +
> +	if (test_bit(COMMAND_PENDING, &g0->flags) &&
> +	    cci & (UCSI_CCI_ACK_COMPLETE | UCSI_CCI_COMMAND_COMPLETE))
> +		complete(&g0->complete);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct ucsi_operations ucsi_stm32g0_ops = {
> +	.read = ucsi_stm32g0_read,
> +	.sync_write = ucsi_stm32g0_sync_write,
> +	.async_write = ucsi_stm32g0_async_write,
> +};
> +
> +static int ucsi_stm32g0_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct ucsi_stm32g0 *g0;
> +	int ret;
> +
> +	g0 = devm_kzalloc(dev, sizeof(*g0), GFP_KERNEL);
> +	if (!g0)
> +		return -ENOMEM;
> +
> +	g0->dev = dev;
> +	g0->client = client;
> +	init_completion(&g0->complete);
> +	i2c_set_clientdata(client, g0);
> +
> +	g0->ucsi = ucsi_create(dev, &ucsi_stm32g0_ops);
> +	if (IS_ERR(g0->ucsi))
> +		return PTR_ERR(g0->ucsi);
> +
> +	ucsi_set_drvdata(g0->ucsi, g0);
> +
> +	/* Request alert interrupt */
> +	ret = request_threaded_irq(client->irq, NULL, ucsi_stm32g0_irq_handler, IRQF_ONESHOT,
> +				   dev_name(&client->dev), g0);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "request IRQ failed\n");
> +		goto destroy;
> +	}
> +
> +	ret = ucsi_register(g0->ucsi);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "ucsi_register failed\n");
> +		goto freeirq;
> +	}
> +
> +	return 0;
> +
> +freeirq:
> +	free_irq(client->irq, g0);
> +destroy:
> +	ucsi_destroy(g0->ucsi);
> +
> +	return ret;
> +}
> +
> +static int ucsi_stm32g0_remove(struct i2c_client *client)
> +{
> +	struct ucsi_stm32g0 *g0 = i2c_get_clientdata(client);
> +
> +	ucsi_unregister(g0->ucsi);
> +	free_irq(client->irq, g0);
> +	ucsi_destroy(g0->ucsi);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id __maybe_unused ucsi_stm32g0_typec_of_match[] = {
> +	{ .compatible = "st,stm32g0-typec" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ucsi_stm32g0_typec_of_match);
> +
> +static const struct i2c_device_id ucsi_stm32g0_typec_i2c_devid[] = {
> +	{"stm32g0-typec", 0},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(i2c, ucsi_stm32g0_typec_i2c_devid);
> +
> +static struct i2c_driver ucsi_stm32g0_i2c_driver = {
> +	.driver = {
> +		.name = "ucsi-stm32g0-i2c",
> +		.of_match_table = of_match_ptr(ucsi_stm32g0_typec_of_match),
> +	},
> +	.probe = ucsi_stm32g0_probe,
> +	.remove = ucsi_stm32g0_remove,
> +	.id_table = ucsi_stm32g0_typec_i2c_devid
> +};
> +module_i2c_driver(ucsi_stm32g0_i2c_driver);
> +
> +MODULE_AUTHOR("Fabrice Gasnier <fabrice.gasnier@foss.st.com>");
> +MODULE_DESCRIPTION("STMicroelectronics STM32G0 Type-C controller");
> +MODULE_LICENSE("Dual BSD/GPL");
> +MODULE_ALIAS("platform:ucsi-stm32g0");
> -- 
> 2.25.1

-- 
heikki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
