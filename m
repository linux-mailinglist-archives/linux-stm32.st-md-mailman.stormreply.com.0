Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 970D670EBE2
	for <lists+linux-stm32@lfdr.de>; Wed, 24 May 2023 05:31:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55A24C6B454;
	Wed, 24 May 2023 03:31:06 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB5A7C6A61E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 May 2023 03:31:04 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 77F3E846F3;
 Wed, 24 May 2023 05:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1684899064;
 bh=9sZDzeq4edg2YZc0Sc/2LYLWX+7rCP6fiNsmkjGOrQI=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=BZH54kYiwSkOeSzpj/B7xzYErex9rvPnGW0o1Swn0c9qFgzUn36B14puNgceRXSXt
 zPg9UnpWxBerlFbK2AXXHUqqJCKN3rUqRm7i06Oy8vg4So6u2ZfSFrIxT79aygxU0G
 gTNR07D/iHfH0quWGj2ttCrsN0OHmJFqrQMBphUDY4F9qLBCaCPA1tro2u4dAYc3Gq
 8xRpeTmiI0r2y/snhVkwf2moiM9MpNedlGl/x6oHNNALYFLc0ELF4mBDXjHuH2OItV
 N5ixWcetat2ycnNUmAGw90B+C/WjNzvfN2fWqTypLkGbIzMPSig9mZ9oD3RGRRScBY
 O60J7KGbE4Mnw==
Message-ID: <2bfd38fc-b804-e9cd-3f98-4e810386bf5d@denx.de>
Date: Wed, 24 May 2023 05:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Marek Vasut <marex@denx.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20230517152513.27922-1-marex@denx.de>
 <20230517152513.27922-2-marex@denx.de>
 <e7859392-fd52-e4ba-d7b2-f77ede98e0e1@linaro.org>
Content-Language: en-US
In-Reply-To: <e7859392-fd52-e4ba-d7b2-f77ede98e0e1@linaro.org>
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com
Subject: Re: [Linux-stm32] [PATCH v2 2/3] nvmem: syscon: Add syscon backed
	nvmem driver
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

On 5/18/23 16:22, Krzysztof Kozlowski wrote:

[...]

>> +++ b/drivers/nvmem/nvmem-syscon.c
>> @@ -0,0 +1,105 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
>> + *
>> + * Based on snvs_lpgpr.c .
>> + */
>> +
>> +#include <linux/mfd/syscon.h>
>> +#include <linux/module.h>
>> +#include <linux/nvmem-provider.h>
>> +#include <linux/of_device.h>
>> +#include <linux/regmap.h>
>> +
>> +struct nvmem_syscon_priv {
>> +	struct device_d		*dev;
>> +	struct regmap		*regmap;
>> +	struct nvmem_config	cfg;
>> +	unsigned int		off;
>> +};
>> +
>> +static int nvmem_syscon_write(void *context, unsigned int offset, void *val,
>> +			      size_t bytes)
>> +{
>> +	struct nvmem_syscon_priv *priv = context;
>> +
>> +	return regmap_bulk_write(priv->regmap, priv->off + offset,
>> +				 val, bytes / 4);
>> +}
>> +
>> +static int nvmem_syscon_read(void *context, unsigned int offset, void *val,
>> +			     size_t bytes)
>> +{
>> +	struct nvmem_syscon_priv *priv = context;
>> +
>> +	return regmap_bulk_read(priv->regmap, priv->off + offset,
>> +				val, bytes / 4);
>> +}
>> +
>> +static int nvmem_syscon_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct device_node *node = dev->of_node;
>> +	struct device_node *syscon_node;
>> +	struct nvmem_syscon_priv *priv;
>> +	struct nvmem_device *nvmem;
>> +	struct nvmem_config *cfg;
>> +	int ret;
>> +
>> +	if (!node)
>> +		return -ENOENT;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	ret = of_property_read_u32_index(node, "reg", 0, &priv->off);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = of_property_read_u32_index(node, "reg", 1, &priv->cfg.size);
>> +	if (ret)
>> +		return ret;
>> +
>> +	syscon_node = of_get_parent(node);
> 
> This does not look correct. You hard-code dependency that it must be a
> child of syscon node. This is weird requirement and not explained in the
> bindings.
> 
> Why this cannot be then generic MMIO node? Why it has to be a child of
> syscon?

Because I already have a syscon node and I want to expose only a subset 
of it to userspace (bootcounter in my case) . See 1/3, I replied there, 
let's continue the discussion there.

I fixed the rest in prep for V3, sorry for the horrid delays in replies.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
