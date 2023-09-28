Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CB15B7B2189
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Sep 2023 17:44:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8739AC6B462;
	Thu, 28 Sep 2023 15:44:36 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A3F1C6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Sep 2023 15:44:35 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38SE466G015807; Thu, 28 Sep 2023 17:43:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=6T7vbZG0OatVCzrOUmocqe0etbqi1byTjrfN1YkQoYE=; b=fL
 9+e7J6OIfXQpnq6WHBL/m56cPdxye7XORHa4e/GNn4iRdwCB0xFD6o9ZYQAKjon0
 f5HUbpw4Ix0frpU2kvNOCKVFEwvWJkKOW73YVT5JyV0zLHgtzzUoWl3F6cNmAKyb
 UMJPEsjoC/guC48wUILQSbN7Si/bPAqspVm4Q3K3XGjySUlhB1Ii3rkoxn0sLfEZ
 QTCJA/iLyCDE7Z3wF+OtyrjFecFf1Iv05IMiVA3on6mQuM8jXNiIL8GzxWIOG19k
 bvhuhV8dKqjrhD3PqRPht1jClNa+HxVU65W9phEQjlLo203IyNwiok9UQGizuRnh
 T6hK4Mp3G6d5dheHFACg==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t9qbx76ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Sep 2023 17:43:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id F3259100057;
 Thu, 28 Sep 2023 17:43:48 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8F6EC24B8AC;
 Thu, 28 Sep 2023 17:43:48 +0200 (CEST)
Received: from [10.201.20.32] (10.201.20.32) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 28 Sep
 2023 17:43:46 +0200
Message-ID: <3c232c26-e03c-31ec-8ec8-f99c86a3ab83@foss.st.com>
Date: Thu, 28 Sep 2023 17:43:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Simon Horman <horms@kernel.org>
References: <20230811100731.108145-1-gatien.chevallier@foss.st.com>
 <20230811100731.108145-6-gatien.chevallier@foss.st.com>
 <ZNeSiFQGdOXbR+2S@vergenet.net>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <ZNeSiFQGdOXbR+2S@vergenet.net>
X-Originating-IP: [10.201.20.32]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_15,2023-09-28_02,2023-05-22_02
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 peng.fan@oss.nxp.com, herbert@gondor.apana.org.au,
 Frank Rowand <frowand.list@gmail.com>, hugues.fruchet@foss.st.com,
 lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alsa-devel@alsa-project.org, richardcochran@gmail.com,
 robh+dt@kernel.org, linux-serial@vger.kernel.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 05/11] firewall: introduce
	stm32_firewall framework
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



On 8/12/23 16:09, Simon Horman wrote:
> On Fri, Aug 11, 2023 at 12:07:25PM +0200, Gatien Chevallier wrote:
> 
> ...
> 
>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>> new file mode 100644
>> index 000000000000..900f3b052a66
>> --- /dev/null
>> +++ b/drivers/bus/stm32_firewall.c
>> @@ -0,0 +1,293 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
>> + */
>> +
>> +#include <linux/bitfield.h>
>> +#include <linux/bits.h>
>> +#include <linux/bus/stm32_firewall_device.h>
>> +#include <linux/device.h>
>> +#include <linux/err.h>
>> +#include <linux/init.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_platform.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/types.h>
>> +#include <linux/slab.h>
>> +
>> +#include "stm32_firewall.h"
>> +
>> +/* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall ID */
>> +#define STM32_FIREWALL_MAX_ARGS		(STM32_FIREWALL_MAX_EXTRA_ARGS + 1)
>> +
>> +static LIST_HEAD(firewall_controller_list);
>> +static DEFINE_MUTEX(firewall_controller_list_lock);
>> +
>> +/* Firewall device API */
>> +int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
>> +				unsigned int nb_firewall)
>> +{
>> +	struct stm32_firewall_controller *ctrl;
>> +	struct of_phandle_iterator it;
>> +	unsigned int i, j = 0;
>> +	int err;
>> +
>> +	if (!firewall || !nb_firewall)
>> +		return -EINVAL;
>> +
>> +	/* Parse property with phandle parsed out */
>> +	of_for_each_phandle(&it, err, np, "feature-domains", "#feature-domain-cells", 0) {
>> +		struct of_phandle_args provider_args;
>> +		struct device_node *provider = it.node;
>> +		const char *fw_entry;
>> +		bool match = false;
>> +
>> +		if (err) {
>> +			pr_err("Unable to get feature-domains property for node %s\n, err: %d",
>> +			       np->full_name, err);
>> +			of_node_put(provider);
>> +			return err;
>> +		}
>> +
>> +		if (j > nb_firewall) {
>> +			pr_err("Too many firewall controllers");
>> +			of_node_put(provider);
>> +			return -EINVAL;
>> +		}
>> +
>> +		provider_args.args_count = of_phandle_iterator_args(&it, provider_args.args,
>> +								    STM32_FIREWALL_MAX_ARGS);
>> +
>> +		/* Check if the parsed phandle corresponds to a registered firewall controller */
>> +		mutex_lock(&firewall_controller_list_lock);
>> +		list_for_each_entry(ctrl, &firewall_controller_list, entry) {
>> +			if (ctrl->dev->of_node->phandle == it.phandle) {
>> +				match = true;
>> +				firewall[j].firewall_ctrl = ctrl;
>> +				break;
>> +			}
>> +		}
>> +		mutex_unlock(&firewall_controller_list_lock);
>> +
>> +		if (!match) {
>> +			firewall[j].firewall_ctrl = NULL;
>> +			pr_err("No firewall controller registered for %s\n", np->full_name);
>> +			of_node_put(provider);
>> +			return -ENODEV;
>> +		}
>> +
>> +		err = of_property_read_string_index(np, "feature-domain-names", j, &fw_entry);
>> +		if (err == 0)
>> +			firewall[j].entry = fw_entry;
>> +
>> +		/* Handle the case when there are no arguments given along with the phandle */
>> +		if (provider_args.args_count < 0 ||
>> +		    provider_args.args_count > STM32_FIREWALL_MAX_ARGS) {
>> +			of_node_put(provider);
>> +			return -EINVAL;
>> +		} else if (provider_args.args_count == 0) {
>> +			firewall[j].extra_args_size = 0;
>> +			firewall[j].firewall_id = U32_MAX;
>> +			j++;
>> +			continue;
>> +		}
>> +
>> +		/* The firewall ID is always the first argument */
>> +		firewall[j].firewall_id = provider_args.args[0];
>> +
>> +		/* Extra args start at the third argument */
>> +		for (i = 0; i < provider_args.args_count; i++)
>> +			firewall[j].extra_args[i] = provider_args.args[i + 1];
> 
> Hi Gatien,
> 
> Above it is checked that the maximum value of provider_args.args_count is
> STM32_FIREWALL_MAX_ARGS.
> So here the maximum value of i is STM32_FIREWALL_MAX_ARGS - 1.
> 
> STM32_FIREWALL_MAX_ARGS is defined as STM32_FIREWALL_MAX_EXTRA_ARGS + 1
> And STM32_FIREWALL_MAX_EXTRA_ARGS is defined as 5.
> So the maximum value of i is (5 + 1 - 1) = 5.
> 
> firewall[j] is of type struct stm32_firewall.
> And its args field has STM32_FIREWALL_MAX_EXTRA_ARGS (5) elements.
> Thus the maximum valid index is (5 - 1) = 4.
> 
> But the line above may access index 5.
> 
> Flagged by Smatch.
> 

Hi Simon,

Thank you for pointing this out.

I'll correct it for V5.

Best regards,
Gatien
>> +
>> +		/* Remove the firewall ID arg that is not an extra argument */
>> +		firewall[j].extra_args_size = provider_args.args_count - 1;
>> +
>> +		j++;
>> +	}
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(stm32_firewall_get_firewall);
> 
> ...
> 
>> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
>> new file mode 100644
>> index 000000000000..7b4450a8ec15
>> --- /dev/null
>> +++ b/include/linux/bus/stm32_firewall_device.h
>> @@ -0,0 +1,141 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
>> + */
>> +
>> +#ifndef STM32_FIREWALL_DEVICE_H
>> +#define STM32_FIREWALL_DEVICE_H
>> +
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/types.h>
>> +
>> +#define STM32_FIREWALL_MAX_EXTRA_ARGS		5
>> +
>> +/* Opaque reference to stm32_firewall_controller */
>> +struct stm32_firewall_controller;
>> +
>> +/**
>> + * struct stm32_firewall - Information on a device's firewall. Each device can have more than one
>> + *			   firewall.
>> + *
>> + * @firewall_ctrl:		Pointer referencing a firewall controller of the device. It is
>> + *				opaque so a device cannot manipulate the controller's ops or access
>> + *				the controller's data
>> + * @extra_args:			Extra arguments that are implementation dependent
>> + * @entry:			Name of the firewall entry
>> + * @extra_args_size:		Number of extra arguments
>> + * @firewall_id:		Firewall ID associated the device for this firewall controller
>> + */
>> +struct stm32_firewall {
>> +	struct stm32_firewall_controller *firewall_ctrl;
>> +	u32 extra_args[STM32_FIREWALL_MAX_EXTRA_ARGS];
>> +	const char *entry;
>> +	size_t extra_args_size;
>> +	u32 firewall_id;
>> +};
> 
> ...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
