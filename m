Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4367F946
	for <lists+linux-stm32@lfdr.de>; Sat, 28 Jan 2023 16:58:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DFBCDC6907A;
	Sat, 28 Jan 2023 15:58:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BFC48C69053
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Jan 2023 15:58:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 728A460B4D;
 Sat, 28 Jan 2023 15:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC8FC433D2;
 Sat, 28 Jan 2023 15:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674921508;
 bh=7R+Y0pFZ9qQaQE2Of8Zyt01fF+w51NH/3ezIsAynqvk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d4enHA5MJ371GrPucjk++EVvYqWfJUb0Rmdj7ygsHD6FdJSuKLpmLKZObRmyoduRb
 F7/rgXbXthLnxMVJdAyroI/3tQf7IL+wc3TYMiY9DLLWZ9lgFPGplKFOxflb3tFuNt
 UtYcUlsjz0il95gmiB3mk4Bvk/TbRiYPJ9FjEivIPmpDedLPGd1WcinaLHdellNT7Y
 g/L7fp8K98T+nO5sT29tqenfN8c3UVjvN0Ncbjl4SfTpSGVwHHakRtS6Y7/70MN4yc
 AsRCXMaJ9yLeFgwHKcot/dcC5xFelUPaBwh2MZkhTt1C1Gr3icbGZaQVBWurLjEUVb
 0mCC0mntbHQgQ==
Date: Sat, 28 Jan 2023 16:12:17 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <20230128161217.0e79436e@jic23-huawei>
In-Reply-To: <20230127164040.1047583-5-gatien.chevallier@foss.st.com>
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-5-gatien.chevallier@foss.st.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, edumazet@google.com,
 Oleksii_Moisieiev@epam.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 herbert@gondor.apana.org.au, kuba@kernel.org, arnaud.pouliquen@foss.st.com,
 pabeni@redhat.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 4/6] bus: stm32_sys_bus: add support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, 27 Jan 2023 17:40:38 +0100
Gatien Chevallier <gatien.chevallier@foss.st.com> wrote:

> This driver is checking the access rights of the different
> peripherals connected to the system bus. If access is denied,
> the associated device tree node is skipped so the platform bus
> does not probe it.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Signed-off-by: Loic PALLARDY <loic.pallardy@st.com>

Hi Gatien,

A few comments inline,

Thanks,

Jonathan

> diff --git a/drivers/bus/stm32_sys_bus.c b/drivers/bus/stm32_sys_bus.c
> new file mode 100644
> index 000000000000..c12926466bae
> --- /dev/null
> +++ b/drivers/bus/stm32_sys_bus.c
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +
> +/* ETZPC peripheral as firewall bus */
> +/* ETZPC registers */
> +#define ETZPC_DECPROT			0x10
> +
> +/* ETZPC miscellaneous */
> +#define ETZPC_PROT_MASK			GENMASK(1, 0)
> +#define ETZPC_PROT_A7NS			0x3
> +#define ETZPC_DECPROT_SHIFT		1

This define makes the code harder to read.  What we care about is
the number of bits in the register divided by number of entries.
(which is 2) hence the shift by 1. See below for more on this.


> +
> +#define IDS_PER_DECPROT_REGS		16

> +#define STM32MP15_ETZPC_ENTRIES		96
> +#define STM32MP13_ETZPC_ENTRIES		64

These defines just make the code harder to check.
They aren't magic numbers, but rather just telling us how many
entries there are, so I would just put them in the structures directly.
Their use make it clear what they are without needing to give them a name.


> +struct stm32_sys_bus_match_data {

Comment on naming of this below.

> +	unsigned int max_entries;
> +};
> +

+static int stm32_etzpc_get_access(struct sys_bus_data *pdata, struct device_node *np)
+{
+	int err;
+	u32 offset, reg_offset, sec_val, id;
+
+	err = stm32_sys_bus_get_periph_id(pdata, np, &id);
+	if (err)
+		return err;
+
+	/* Check access configuration, 16 peripherals per register */
+	reg_offset = ETZPC_DECPROT + 0x4 * (id / IDS_PER_DECPROT_REGS);
+	offset = (id % IDS_PER_DECPROT_REGS) << ETZPC_DECPROT_SHIFT;

Use of defines in here is actively unhelpful when it comes to review. I would suggest letting
the maths be self explanatory (even if it's more code).

	offset = (id % IDS_PER_DECPROT_REGS) * (sizeof(u32) * BITS_PER_BYTE / IDS_PER_DECPROT_REGS);

Or if you prefer have a define of

#define DECPROT_BITS_PER_ID (sizeof(u32) * BITS_PER_BYTE / IDS_PER_DECPROT_REGS)

and
	offset = (id % IDS_PER_DECPROT_REGS) * DECPROT_BITS_PER_ID;

+
+	/* Verify peripheral is non-secure and attributed to cortex A7 */
+	sec_val = (readl(pdata->sys_bus_base + reg_offset) >> offset) & ETZPC_PROT_MASK;
+	if (sec_val != ETZPC_PROT_A7NS) {
+		dev_dbg(pdata->dev, "Invalid bus configuration: reg_offset %#x, value %d\n",
+			reg_offset, sec_val);
+		return -EACCES;
+	}
+
+	return 0;
+}
+
...

> +static int stm32_sys_bus_probe(struct platform_device *pdev)
> +{
> +	struct sys_bus_data *pdata;
> +	void __iomem *mmio;
> +	struct device_node *np = pdev->dev.of_node;

I'd be consistent. You use dev_of_node() accessor elsewhere, so should
use it here as well.

> +
> +	pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> +	if (!pdata)
> +		return -ENOMEM;
> +
> +	mmio = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mmio))
> +		return PTR_ERR(mmio);
> +
> +	pdata->sys_bus_base = mmio;
> +	pdata->pconf = of_device_get_match_data(&pdev->dev);
> +	pdata->dev = &pdev->dev;
> +
> +	platform_set_drvdata(pdev, pdata);

Does this get used? I can't immediately spot where but maybe I just
missed it.

> +
> +	stm32_sys_bus_populate(pdata);
> +
> +	/* Populate all available nodes */
> +	return of_platform_populate(np, NULL, NULL, &pdev->dev);

As np only used here, I'd not bother with the local variable in this function.

> +}
> +
> +static const struct stm32_sys_bus_match_data stm32mp15_sys_bus_data = {

Naming a structure after where it comes from is a little unusual and
confusion when a given call gets it from somewhere else.

I'd expect it to be named after what sort of thing it contains.
stm32_sys_bus_info or something like that.

> +	.max_entries = STM32MP15_ETZPC_ENTRIES,
> +};
> +
> +static const struct stm32_sys_bus_match_data stm32mp13_sys_bus_data = {
> +	.max_entries = STM32MP13_ETZPC_ENTRIES,
> +};
> +
> +static const struct of_device_id stm32_sys_bus_of_match[] = {
> +	{ .compatible = "st,stm32mp15-sys-bus", .data = &stm32mp15_sys_bus_data },
> +	{ .compatible = "st,stm32mp13-sys-bus", .data = &stm32mp13_sys_bus_data },

Alphabetical order usually preferred when there isn't a strong reason for
another choice.

> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, stm32_sys_bus_of_match);
> +
> +static struct platform_driver stm32_sys_bus_driver = {
> +	.probe  = stm32_sys_bus_probe,
> +	.driver = {
> +		.name = "stm32-sys-bus",
> +		.of_match_table = stm32_sys_bus_of_match,
> +	},
> +};
> +
> +static int __init stm32_sys_bus_init(void)
> +{
> +	return platform_driver_register(&stm32_sys_bus_driver);
> +}
> +arch_initcall(stm32_sys_bus_init);
> +

Unwanted trailing blank line.


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
