Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A3A0B64E
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 13:05:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3821EC78018;
	Mon, 13 Jan 2025 12:05:42 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EB346C030CB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 12:05:34 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so2125661f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 04:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736769934; x=1737374734;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eVtNiN/5nBBT9gWYseRrzePL91kV9DsufoqzndJ0u3c=;
 b=LVgAWGKPVQZVjtOQ2KU/fIDHvVGDsQ+EKnTxBcG6/ulNXNzeUeklupfaSPYA48+mlL
 P03QTH8wjnnieo9e0JpUNSY5DZxLNRcoiOX99+uiG1N6oTk7Lg9BQlrPsKmpDoZbvGf/
 i41eN+pT0L+2puI6+VBGCDvLqyJ34t6PSl0uGVkGquOe94JQbPlGyH4bFmBjRMo3e4Jv
 CNfhf3yt8YP0BzBIKrWfMBkL5qbkPIO6D0yfZwcpw8k9EAdVcuXvyDg+R6EfW3iftV1S
 PUQ4U+qLhjX89ekkP1fKqe52p6GJxKhTfinN7YcamLmzMgGSWU7BSUJqeb2kv65DjviE
 UDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736769934; x=1737374734;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eVtNiN/5nBBT9gWYseRrzePL91kV9DsufoqzndJ0u3c=;
 b=T1buddOeUkWdtyGKC1JLeuU0g1yupBFAXmCCisOBr1PCnsRRh9Db9qT+i5e/68SNEe
 50b/eGCyKHf/C7Iu5Bg+UZkHfVx4V/LVbFqaH3QrJ8YbdYU+9vPIk27OHPYdntFGdX9D
 hRqEOkXNmH4UaPvPd7dplLBb6nPIgx9orJeizeOOqHuli25/nU1R/M4KmqU+i+kiIqL4
 1DjDt/M7O9LrpPQbaLxjO6o3QSBdLUWx3rpWt1A4uxhTnBu77fqWxRPuI6FZTsF0t7LC
 7du53Bk53JXpz7vUYNhVw5XDcTG7TRtGpmQM6w11rQnWXINv9u1WzfPt8GgO9INfDDoS
 f3IQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWSq5hbLlwu5f5Zn/YYvrZARUZ5auqip6jhUfc3KPHKPWkK/qrAF8WMJdg7kRvmMpXtBModCjV/9yoGg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyIXvufOQTSStE6N27IyyJxcSzZ4+JTdNYbZ0gVn1/9O6c1zvFs
 qoYRIEq3JYPh4ZqR+cy/6Mnxad28oEB7hiTsHUdydyV53vtiKDnGn5W7ItRVTxc=
X-Gm-Gg: ASbGnct+6Px4tcY61zy7dlSS95ZzQwDnZKQBj/kQo6sK3O1OqlGLmLJLiepklUpT19D
 s3P1Zd1I8X4A9FYOU9MWfMOEahy1SavDR2VOLl+qFqSEc250UgbB8mbbW0Rkt37kMwhnkqkQjYU
 63q42Ei6shq+NKu7VLWAHnXMDcgVemySXQAuSxD1fWTT5wfz+VSKaOUgeiVDAIjN0KrWYfiljAv
 v05dLIt3BxdUcXhISawDrzonXolsnr6TmhvC7d7LjqZv7iygnUngFWwiTG7gBT+TYOC
X-Google-Smtp-Source: AGHT+IFsb3yGZvvP2wEwLT0wiKxlNzjlKgWTeZfG9mQp1rnTYe/EhMN71/DxU9unKU0hxtWa58Y2ig==
X-Received: by 2002:a05:6000:4615:b0:385:e013:39ef with SMTP id
 ffacd0b85a97d-38a872f6993mr16400128f8f.6.1736769934185; 
 Mon, 13 Jan 2025 04:05:34 -0800 (PST)
Received: from [192.168.68.163] ([212.105.145.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80d4sm11698622f8f.85.2025.01.13.04.05.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 04:05:33 -0800 (PST)
Message-ID: <5d8df2d3-41b9-4c21-ba63-c184bad50041@linaro.org>
Date: Mon, 13 Jan 2025 12:05:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jie Gan <quic_jiegan@quicinc.com>
References: <20241226011022.1477160-1-quic_jiegan@quicinc.com>
 <20241226011022.1477160-5-quic_jiegan@quicinc.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20241226011022.1477160-5-quic_jiegan@quicinc.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, Jinlong Mao <quic_jinlmao@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Tingwei Zhang <quic_tingweiz@quicinc.com>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH v8 4/5] Coresight: Add Coresight TMC
	Control Unit driver
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



On 26/12/2024 1:10 am, Jie Gan wrote:
> The Coresight TMC Control Unit hosts miscellaneous configuration registers
> which control various features related to TMC ETR sink.
> 
> Based on the trace ID, which is programmed in the related CTCU ATID
> register of a specific ETR, trace data with that trace ID gets into
> the ETR buffer, while other trace data gets dropped.
> 
> Enabling source device sets one bit of the ATID register based on
> source device's trace ID.
> Disabling source device resets the bit according to the source
> device's trace ID.
> 
> Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
> ---
>   drivers/hwtracing/coresight/Kconfig          |   8 +
>   drivers/hwtracing/coresight/Makefile         |   1 +
>   drivers/hwtracing/coresight/coresight-ctcu.c | 273 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-ctcu.h |  21 ++
>   include/linux/coresight.h                    |   3 +-
>   5 files changed, 305 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
>   create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h
> 
> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
> index 06f0a7594169..152eab0b9b2a 100644
> --- a/drivers/hwtracing/coresight/Kconfig
> +++ b/drivers/hwtracing/coresight/Kconfig
> @@ -133,6 +133,14 @@ config CORESIGHT_STM
>   	  To compile this driver as a module, choose M here: the
>   	  module will be called coresight-stm.
>   
> +config CORESIGHT_CTCU
> +	tristate "CoreSight TMC Control Unit driver"
> +	help
> +	  This driver provides support for CoreSight TMC Control Unit
> +	  that hosts miscellaneous configuration registers. This is
> +	  primarily used for controlling the behaviors of the TMC
> +	  ETR device.
> +
>   config CORESIGHT_CPU_DEBUG
>   	tristate "CoreSight CPU Debug driver"
>   	depends on ARM || ARM64
> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/hwtracing/coresight/Makefile
> index 4ba478211b31..1b7869910a12 100644
> --- a/drivers/hwtracing/coresight/Makefile
> +++ b/drivers/hwtracing/coresight/Makefile
> @@ -51,3 +51,4 @@ coresight-cti-y := coresight-cti-core.o	coresight-cti-platform.o \
>   		   coresight-cti-sysfs.o
>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
> +obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.c b/drivers/hwtracing/coresight/coresight-ctcu.c
> new file mode 100644
> index 000000000000..7650dbe9a41e
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.c
> @@ -0,0 +1,273 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/coresight.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "coresight-ctcu.h"
> +#include "coresight-priv.h"
> +#include "coresight-trace-id.h"
> +
> +DEFINE_CORESIGHT_DEVLIST(ctcu_devs, "ctcu");
> +
> +#define ctcu_writel(drvdata, val, offset)	__raw_writel((val), drvdata->base + offset)
> +#define ctcu_readl(drvdata, offset)		__raw_readl(drvdata->base + offset)
> +
> +/* The TMC Coresight Control Unit uses four ATID registers to control the data filter function based
> + * on the trace ID for each TMC ETR sink. The length of each ATID register is 32 bits. Therefore,
> + * the ETR has a related field in CTCU that is 128 bits long. Each trace ID is represented by one
> + * bit in that filed.
> + * e.g. ETR0ATID0 layout, set bit 5 for traceid 5
> + *                                           bit5
> + * ------------------------------------------------------
> + * |   |28|   |24|   |20|   |16|   |12|   |8|  1|4|   |0|
> + * ------------------------------------------------------
> + *
> + * e.g. ETR0:
> + * 127                     0 from ATID_offset for ETR0ATID0
> + * -------------------------
> + * |ATID3|ATID2|ATID1|ATID0|
> + *
> + */
> +#define CTCU_ATID_REG_OFFSET(traceid, atid_offset) \
> +		((traceid / 32) * 4 + atid_offset)
> +
> +#define CTCU_ATID_REG_BIT(traceid)	(traceid % 32)
> +#define CTCU_ATID_REG_SIZE		0x10
> +
> +struct ctcu_atid_config {
> +	const uint32_t atid_offset;
> +	const uint32_t port_num;
> +};
> +
> +struct ctcu_config {
> +	const struct ctcu_atid_config *atid_config;
> +	int num_atid_config;
> +};
> +
> +static const struct ctcu_atid_config sa8775p_atid_cfgs[] = {
> +	{0xf8,  0},
> +	{0x108, 1},
> +};
> +
> +static const struct ctcu_config sa8775p_cfgs = {
> +	.atid_config		= sa8775p_atid_cfgs,
> +	.num_atid_config	= ARRAY_SIZE(sa8775p_atid_cfgs),
> +};
> +
> +/*
> + * __ctcu_set_etr_traceid: Set bit in the ATID register based on trace ID when enable is true.
> + * Reset the bit of the ATID register based on trace ID when enable is false.
> + *
> + * @csdev:	coresight_device struct related to the device
> + * @traceid:	trace ID of the source tracer.
> + * @enable:	True for set bit and false for reset bit.
> + *
> + * Returns 0 indicates success. Non-zero result means failure.
> + */
> +static int __ctcu_set_etr_traceid(struct coresight_device *csdev,
> +				  u8 traceid,
> +				  int port_num,
> +				  bool enable)
> +{
> +	uint32_t atid_offset, reg_offset, val;
> +	struct ctcu_drvdata *drvdata;
> +	int bit;
> +
> +	if (!IS_VALID_CS_TRACE_ID(traceid))
> +		return -EINVAL;

Minor point, but this was already done in the calling function.

> +
> +	drvdata = dev_get_drvdata(csdev->dev.parent);
> +	if (IS_ERR_OR_NULL(drvdata))
> +		return -EINVAL;
> +
> +	atid_offset = drvdata->atid_offset[port_num];
> +	if (atid_offset == 0)
> +		return -EINVAL;
> +
> +	guard(raw_spinlock_irqsave)(&drvdata->spin_lock);
> +	CS_UNLOCK(drvdata->base);
> +
> +	bit = CTCU_ATID_REG_BIT(traceid);
> +	reg_offset = CTCU_ATID_REG_OFFSET(traceid, atid_offset);

The locks only need to be around the read/write below. bit and 
reg_offset are all local and shouldn't be affected. Doesn't really make 
a difference but makes the code a bit more readable.

> +	if (reg_offset - atid_offset > CTCU_ATID_REG_SIZE) {
> +		CS_LOCK(drvdata);
> +		return -EINVAL;
> +	}
> +
> +	val = ctcu_readl(drvdata, reg_offset);
> +	if (enable)
> +		val = val | BIT(bit);
> +	else
> +		val = val & ~BIT(bit);
> +
> +	ctcu_writel(drvdata, val, reg_offset);
> +	CS_LOCK(drvdata->base);
> +
> +	return 0;
> +}
> +
> +static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
> +{
> +	int i;
> +
> +	for (i = 0; i < sink->pdata->nr_outconns; ++i) {
> +		if (sink->pdata->out_conns[i]->dest_dev)
> +			return sink->pdata->out_conns[i]->dest_port;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +/*
> + * ctcu_set_etr_traceid: Retrieve the ATID offset and trace ID.
> + *
> + * Returns 0 indicates success. None-zero result means failure.
> + */
> +static int ctcu_set_etr_traceid(struct coresight_device *csdev,
> +				struct cs_sink_data *sink_data,
> +				bool enable)
> +{
> +	int port_num;
> +
> +	if (!IS_VALID_CS_TRACE_ID(sink_data->traceid) ||
> +	    (sink_data->sink == NULL)) {
> +		dev_err(&csdev->dev, "Invalid parameters\n");
> +		return -EINVAL;
> +	}
> +
> +	port_num = ctcu_get_active_port(sink_data->sink, csdev);
> +	if (port_num < 0)
> +		return -EINVAL;
> +
> +	dev_dbg(&csdev->dev, "traceid is %d\n", sink_data->traceid);
> +
> +	return __ctcu_set_etr_traceid(csdev, sink_data->traceid, port_num, enable);
> +}
> +
> +static int ctcu_enable(struct coresight_device *csdev, enum cs_mode mode,
> +		       void *data)
> +{
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +
> +	return ctcu_set_etr_traceid(csdev, sink_data, true);
> +}
> +
> +static int ctcu_disable(struct coresight_device *csdev, void *data)
> +{
> +	struct cs_sink_data *sink_data = (struct cs_sink_data *)data;
> +
> +	return ctcu_set_etr_traceid(csdev, sink_data, false);
> +}
> +
> +static const struct coresight_ops_helper ctcu_helper_ops = {
> +	.enable = ctcu_enable,
> +	.disable = ctcu_disable,
> +};
> +
> +static const struct coresight_ops ctcu_ops = {
> +	.helper_ops = &ctcu_helper_ops,
> +};
> +
> +static int ctcu_probe(struct platform_device *pdev)
> +{
> +	int i;
> +	void __iomem *base;
> +	struct device *dev = &pdev->dev;
> +	struct coresight_platform_data *pdata;
> +	struct ctcu_drvdata *drvdata;
> +	struct coresight_desc desc = { 0 };
> +	const struct ctcu_config *cfgs;
> +	const struct ctcu_atid_config *atid_cfg;
> +
> +	desc.name = coresight_alloc_device_name(&ctcu_devs, dev);
> +	if (!desc.name)
> +		return -ENOMEM;
> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	pdata = coresight_get_platform_data(dev);
> +	if (IS_ERR(pdata))
> +		return PTR_ERR(pdata);
> +	dev->platform_data = pdata;
> +
> +	base = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	if (!base)
> +		return -ENOMEM;
> +
> +	drvdata->apb_clk = coresight_get_enable_apb_pclk(dev);
> +	if (IS_ERR(drvdata->apb_clk))
> +		return -ENODEV;
> +
> +	cfgs = of_device_get_match_data(dev);
> +	if (cfgs) {
> +		if (cfgs->num_atid_config <= ATID_MAX_NUM) {
> +			for (i = 0; i < cfgs->num_atid_config; i++) {
> +				atid_cfg = &cfgs->atid_config[i];
> +				drvdata->atid_offset[i] = atid_cfg->atid_offset;
> +			}
> +		}
> +	}
> +
> +	drvdata->base = base;
> +	drvdata->dev = dev;
> +	platform_set_drvdata(pdev, drvdata);
> +
> +	desc.type = CORESIGHT_DEV_TYPE_HELPER;
> +	desc.subtype.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU;
> +	desc.pdata = pdata;
> +	desc.dev = dev;
> +	desc.ops = &ctcu_ops;
> +
> +	drvdata->csdev = coresight_register(&desc);
> +	if (IS_ERR(drvdata->csdev)) {
> +		if (!IS_ERR_OR_NULL(drvdata->apb_clk))
> +			clk_put(drvdata->apb_clk);
> +
> +		return PTR_ERR(drvdata->csdev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void ctcu_remove(struct platform_device *pdev)
> +{
> +	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
> +
> +	coresight_unregister(drvdata->csdev);
> +	if (!IS_ERR_OR_NULL(drvdata->apb_clk))
> +		clk_put(drvdata->apb_clk);
> +}
> +
> +static const struct of_device_id ctcu_match[] = {
> +	{.compatible = "qcom,sa8775p-ctcu", .data = &sa8775p_cfgs},
> +	{}
> +};
> +
> +static struct platform_driver ctcu_driver = {
> +	.probe          = ctcu_probe,
> +	.remove         = ctcu_remove,
> +	.driver         = {
> +		.name   = "coresight-ctcu",
> +		.of_match_table = ctcu_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +module_platform_driver(ctcu_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("CoreSight TMC Control Unit driver");
> diff --git a/drivers/hwtracing/coresight/coresight-ctcu.h b/drivers/hwtracing/coresight/coresight-ctcu.h
> new file mode 100644
> index 000000000000..fc85f3377872
> --- /dev/null
> +++ b/drivers/hwtracing/coresight/coresight-ctcu.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef _CORESIGHT_CTCU_H
> +#define _CORESIGHT_CTCU_H
> +
> +#define ATID_MAX_NUM 5
> +
> +struct ctcu_drvdata {
> +	void __iomem		*base;
> +	struct clk		*apb_clk;
> +	phys_addr_t		pbase;
> +	struct device		*dev;
> +	struct coresight_device	*csdev;
> +	raw_spinlock_t		spin_lock;
> +	uint32_t		atid_offset[ATID_MAX_NUM];
> +};
> +
> +#endif
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index 1929f0088c0f..18bb4de1d1e4 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -71,7 +71,8 @@ enum coresight_dev_subtype_source {
>   
>   enum coresight_dev_subtype_helper {
>   	CORESIGHT_DEV_SUBTYPE_HELPER_CATU,
> -	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI
> +	CORESIGHT_DEV_SUBTYPE_HELPER_ECT_CTI,
> +	CORESIGHT_DEV_SUBTYPE_HELPER_CTCU,
>   };
>   
>   /**

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
