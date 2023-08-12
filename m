Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C55CE77A049
	for <lists+linux-stm32@lfdr.de>; Sat, 12 Aug 2023 16:09:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60C98C6B45D;
	Sat, 12 Aug 2023 14:09:25 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6D0B2C65E58
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 12 Aug 2023 14:09:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1C21962474;
 Sat, 12 Aug 2023 14:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB08C433C8;
 Sat, 12 Aug 2023 14:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691849362;
 bh=z+m4uxf5uQXSYdBR7XRst5uEUqfj5OU0THhKy2Pgzw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NRcuuSwRkCingBsl/vsEZbgeFFYLrf1y+jccW0/5Yc5HDj+1VoVAME8JmLoRwatmv
 cq9vWxL4zAE9ZVUJLta84Dvv5Inw/EfKSi/yAs63VyBxmpmvFYbATcUsu77nljsk2A
 aA3VJilGgMOpA/ket7dhpg569WOR9pO165Aa92NCsdjCCxPdIgZY5ieRy7nbUuFLnh
 5IcBP4Gl/p7TKLadf1jSNE+GDBp+0bp0kFtLguMP/b1EWW/an8byu12FnBRohiFL9c
 uRJrWRUhrLp3tNfyj4R8So0k0XxPic0tJx3E0PAmnu0wkeyaegTrtitZo78/ruaSpI
 fW6TnxXPQeEnQ==
Date: Sat, 12 Aug 2023 16:09:12 +0200
From: Simon Horman <horms@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Message-ID: <ZNeSiFQGdOXbR+2S@vergenet.net>
References: <20230811100731.108145-1-gatien.chevallier@foss.st.com>
 <20230811100731.108145-6-gatien.chevallier@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230811100731.108145-6-gatien.chevallier@foss.st.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Fri, Aug 11, 2023 at 12:07:25PM +0200, Gatien Chevallier wrote:

...

> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
> new file mode 100644
> index 000000000000..900f3b052a66
> --- /dev/null
> +++ b/drivers/bus/stm32_firewall.c
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/bus/stm32_firewall_device.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +#include <linux/slab.h>
> +
> +#include "stm32_firewall.h"
> +
> +/* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall ID */
> +#define STM32_FIREWALL_MAX_ARGS		(STM32_FIREWALL_MAX_EXTRA_ARGS + 1)
> +
> +static LIST_HEAD(firewall_controller_list);
> +static DEFINE_MUTEX(firewall_controller_list_lock);
> +
> +/* Firewall device API */
> +int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
> +				unsigned int nb_firewall)
> +{
> +	struct stm32_firewall_controller *ctrl;
> +	struct of_phandle_iterator it;
> +	unsigned int i, j = 0;
> +	int err;
> +
> +	if (!firewall || !nb_firewall)
> +		return -EINVAL;
> +
> +	/* Parse property with phandle parsed out */
> +	of_for_each_phandle(&it, err, np, "feature-domains", "#feature-domain-cells", 0) {
> +		struct of_phandle_args provider_args;
> +		struct device_node *provider = it.node;
> +		const char *fw_entry;
> +		bool match = false;
> +
> +		if (err) {
> +			pr_err("Unable to get feature-domains property for node %s\n, err: %d",
> +			       np->full_name, err);
> +			of_node_put(provider);
> +			return err;
> +		}
> +
> +		if (j > nb_firewall) {
> +			pr_err("Too many firewall controllers");
> +			of_node_put(provider);
> +			return -EINVAL;
> +		}
> +
> +		provider_args.args_count = of_phandle_iterator_args(&it, provider_args.args,
> +								    STM32_FIREWALL_MAX_ARGS);
> +
> +		/* Check if the parsed phandle corresponds to a registered firewall controller */
> +		mutex_lock(&firewall_controller_list_lock);
> +		list_for_each_entry(ctrl, &firewall_controller_list, entry) {
> +			if (ctrl->dev->of_node->phandle == it.phandle) {
> +				match = true;
> +				firewall[j].firewall_ctrl = ctrl;
> +				break;
> +			}
> +		}
> +		mutex_unlock(&firewall_controller_list_lock);
> +
> +		if (!match) {
> +			firewall[j].firewall_ctrl = NULL;
> +			pr_err("No firewall controller registered for %s\n", np->full_name);
> +			of_node_put(provider);
> +			return -ENODEV;
> +		}
> +
> +		err = of_property_read_string_index(np, "feature-domain-names", j, &fw_entry);
> +		if (err == 0)
> +			firewall[j].entry = fw_entry;
> +
> +		/* Handle the case when there are no arguments given along with the phandle */
> +		if (provider_args.args_count < 0 ||
> +		    provider_args.args_count > STM32_FIREWALL_MAX_ARGS) {
> +			of_node_put(provider);
> +			return -EINVAL;
> +		} else if (provider_args.args_count == 0) {
> +			firewall[j].extra_args_size = 0;
> +			firewall[j].firewall_id = U32_MAX;
> +			j++;
> +			continue;
> +		}
> +
> +		/* The firewall ID is always the first argument */
> +		firewall[j].firewall_id = provider_args.args[0];
> +
> +		/* Extra args start at the third argument */
> +		for (i = 0; i < provider_args.args_count; i++)
> +			firewall[j].extra_args[i] = provider_args.args[i + 1];

Hi Gatien,

Above it is checked that the maximum value of provider_args.args_count is
STM32_FIREWALL_MAX_ARGS.
So here the maximum value of i is STM32_FIREWALL_MAX_ARGS - 1.

STM32_FIREWALL_MAX_ARGS is defined as STM32_FIREWALL_MAX_EXTRA_ARGS + 1
And STM32_FIREWALL_MAX_EXTRA_ARGS is defined as 5.
So the maximum value of i is (5 + 1 - 1) = 5.

firewall[j] is of type struct stm32_firewall.
And its args field has STM32_FIREWALL_MAX_EXTRA_ARGS (5) elements.
Thus the maximum valid index is (5 - 1) = 4.

But the line above may access index 5.

Flagged by Smatch.

> +
> +		/* Remove the firewall ID arg that is not an extra argument */
> +		firewall[j].extra_args_size = provider_args.args_count - 1;
> +
> +		j++;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(stm32_firewall_get_firewall);

...

> diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
> new file mode 100644
> index 000000000000..7b4450a8ec15
> --- /dev/null
> +++ b/include/linux/bus/stm32_firewall_device.h
> @@ -0,0 +1,141 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
> + */
> +
> +#ifndef STM32_FIREWALL_DEVICE_H
> +#define STM32_FIREWALL_DEVICE_H
> +
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/types.h>
> +
> +#define STM32_FIREWALL_MAX_EXTRA_ARGS		5
> +
> +/* Opaque reference to stm32_firewall_controller */
> +struct stm32_firewall_controller;
> +
> +/**
> + * struct stm32_firewall - Information on a device's firewall. Each device can have more than one
> + *			   firewall.
> + *
> + * @firewall_ctrl:		Pointer referencing a firewall controller of the device. It is
> + *				opaque so a device cannot manipulate the controller's ops or access
> + *				the controller's data
> + * @extra_args:			Extra arguments that are implementation dependent
> + * @entry:			Name of the firewall entry
> + * @extra_args_size:		Number of extra arguments
> + * @firewall_id:		Firewall ID associated the device for this firewall controller
> + */
> +struct stm32_firewall {
> +	struct stm32_firewall_controller *firewall_ctrl;
> +	u32 extra_args[STM32_FIREWALL_MAX_EXTRA_ARGS];
> +	const char *entry;
> +	size_t extra_args_size;
> +	u32 firewall_id;
> +};

...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
