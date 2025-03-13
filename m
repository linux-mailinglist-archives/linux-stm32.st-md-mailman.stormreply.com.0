Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45538A5ED10
	for <lists+linux-stm32@lfdr.de>; Thu, 13 Mar 2025 08:34:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0AE4AC78F83;
	Thu, 13 Mar 2025 07:34:13 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C067C78F6E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 13 Mar 2025 07:34:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 953A95C4C25;
 Thu, 13 Mar 2025 07:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB9FC4CEF2;
 Thu, 13 Mar 2025 07:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741851250;
 bh=n7oj+3BMVatFUBrwyBY2k5vyym+icTWhFSlMuR1riQQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SWEMnlQEFBJ8GwE92hn7JMZ2dVjqBKlPftKjdsyQ5qcJ/CEJKL/tM2IRMpZhqsUTP
 grm9zrIZ8uUvdNwcZTZj2x0qs2juS8xDrW+08tHPfFHWVYO6Hoq6tpor6R3ytf3cH6
 cGaOZ456RyvR3B66rM5267AYTY1T9yzuJzpBfL9gPcu/SaJcJkyYXcTXF0/MlnkIiB
 SJhVnfddaYr1bk7Xf+RfaW/AQrCmxayUuii7KXFH2Jfc4UjlKUbWDdIwgIfOgODEML
 SYeidepb6r/SZX1tQsD5EmCtUQiklQ/nhj0Jh9E/sCVK2ITQg/EBx/neYjTqKQo2RM
 +e5Ch+aHBc4wg==
Message-ID: <ac119dba-6e73-496c-97e1-d59ac0fe4a27@kernel.org>
Date: Thu, 13 Mar 2025 08:33:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20250219080059.367045-1-patrice.chotard@foss.st.com>
 <20250219080059.367045-5-patrice.chotard@foss.st.com>
 <eaf1ecca-4fde-4128-8590-6013c3a13a04@kernel.org>
 <8b1b7df5-07f4-4f95-88e7-4e95ee909ffd@foss.st.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <8b1b7df5-07f4-4f95-88e7-4e95ee909ffd@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/8] memory: Add STM32 Octo Memory
	Manager driver
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

On 12/03/2025 15:23, Patrice CHOTARD wrote:
>>> +static int stm32_omm_disable_child(struct device *dev)
>>> +{
>>> +	struct stm32_omm *omm = dev_get_drvdata(dev);
>>> +	struct reset_control *reset;
>>> +	int ret;
>>> +	u8 i;
>>> +
>>> +	for (i = 0; i < omm->nb_child; i++) {
>>> +		ret = clk_prepare_enable(omm->child[i].clk);
>>> +		if (ret) {
>>> +			dev_err(dev, "Can not enable clock\n");
>>> +			return ret;
>>> +		}
>>> +
>>> +		reset = of_reset_control_get_exclusive(omm->child[i].node, 0);
>>> +		if (IS_ERR(reset)) {
>>> +			dev_err(dev, "Can't get child reset\n");
>>
>> Why do you get reset of child? Parent is not suppposed to poke there.
>> You might not have the reset there in the first place and it would not
>> be an error.
> 
> By ressetting child (OSPI), we ensure they are disabled and in a known state.
> See the comment below.
> 
>>
>>
>>> +			return PTR_ERR(reset);
>>> +		};
>>> +
>>> +		/* reset OSPI to ensure CR_EN bit is set to 0 */
>>> +		reset_control_assert(reset);
>>> +		udelay(2);
>>> +		reset_control_deassert(reset);
>>
>> No, the child should handle this, not parent.
> 
> Octo Memory Manager can only be configured if both child are disabled.
> That's why here, parent handles this.

So if device by any chance started and is doing some useful work, then
you cancel that work and reset it?

And what if child does not have reset line? Your binding allows that, so
how is it supposed to work then?

This also leads me to questions about bindings - if you need to assert
some reset, doesn't it mean that these resets are also coming through
this device so they are part of this device node?


> 
>>
>>> +
>>> +		reset_control_put(reset);
>>> +		clk_disable_unprepare(omm->child[i].clk);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int stm32_omm_probe(struct platform_device *pdev)
>>> +{
>>> +	struct platform_device *vdev;
>>> +	struct device *dev = &pdev->dev;
>>> +	struct stm32_omm *omm;
>>> +	struct clk *clk;
>>> +	int ret;
>>> +	u8 child_access_granted = 0;
>>
>> Keep inits/assignments together
> 
> ok
> 
>>
>>> +	u8 i, j;
>>> +	bool child_access[OMM_CHILD_NB];
>>> +
>>> +	omm = devm_kzalloc(dev, sizeof(*omm), GFP_KERNEL);
>>> +	if (!omm)
>>> +		return -ENOMEM;
>>> +
>>> +	omm->io_base = devm_platform_ioremap_resource_byname(pdev, "regs");
>>> +	if (IS_ERR(omm->io_base))
>>> +		return PTR_ERR(omm->io_base);
>>> +
>>> +	omm->mm_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "memory_map");
>>> +	if (IS_ERR(omm->mm_res))
>>> +		return PTR_ERR(omm->mm_res);
>>> +
>>> +	/* check child's access */
>>> +	for_each_child_of_node_scoped(dev->of_node, child) {
>>> +		if (omm->nb_child >= OMM_CHILD_NB) {
>>> +			dev_err(dev, "Bad DT, found too much children\n");
>>> +			ret = -E2BIG;
>>> +			goto err_clk_release;
>>> +		}
>>> +
>>> +		if (!of_device_is_compatible(child, "st,stm32mp25-ospi")) {
>>> +			ret = -EINVAL;
>>> +			goto err_clk_release;
>>> +		}
>>> +
>>> +		ret = stm32_omm_check_access(dev, child);
>>> +		if (ret < 0 && ret != -EACCES)
>>> +			goto err_clk_release;
>>> +
>>> +		child_access[omm->nb_child] = false;
>>> +		if (!ret) {
>>> +			child_access_granted++;
>>> +			child_access[omm->nb_child] = true;
>>> +		}
>>> +
>>> +		omm->child[omm->nb_child].node = child;
>>> +
>>> +		clk = of_clk_get(child, 0);
>>
>> Why are you taking children clock? And why with this API, not clk_get?
> 
> I need children's clock to reset them.


The device driver should reset its device. It is not a discoverable bus,
that would explain power sequencing from the parent.

> Why of_clk_get() usage is a problem here ? i can't get your point ?

Because it is not the API which device drivers should use. You should
use clk_get or devm_clk_get.


> 
>> This looks like mixing clock provider in the clock consumer.
>>
>>> +		if (IS_ERR(clk)) {
>>> +			dev_err(dev, "Can't get child clock\n");
>>
>> Syntax is always return dev_err_probe (or ret = dev_err_probe).
> 
> ok
> 
>>
>>> +			ret = PTR_ERR(clk);
>>> +			goto err_clk_release;
>>> +		};
>>> +
>>> +		omm->child[omm->nb_child].clk = clk;
>>> +		omm->nb_child++;
>>> +	}
>>> +
>>> +	if (omm->nb_child != OMM_CHILD_NB) {
>>> +		ret = -EINVAL;
>>> +		goto err_clk_release;
>>> +	}
>>> +
>>> +	platform_set_drvdata(pdev, omm);
>>> +
>>> +	pm_runtime_enable(dev);
>>> +
>>> +	/* check if OMM's resource access is granted */
>>> +	ret = stm32_omm_check_access(dev, dev->of_node);
>>> +	if (ret < 0 && ret != -EACCES)
>>> +		goto err_clk_release;
>>> +
>>> +	if (!ret && child_access_granted == OMM_CHILD_NB) {
>>> +		/* Ensure both OSPI instance are disabled before configuring OMM */
>>> +		ret = stm32_omm_disable_child(dev);
>>> +		if (ret)
>>> +			goto err_clk_release;
>>> +
>>> +		ret = stm32_omm_configure(dev);
>>> +		if (ret)
>>> +			goto err_clk_release;
>>> +	} else {
>>> +		dev_dbg(dev, "Octo Memory Manager resource's access not granted\n");
>>> +		/*
>>> +		 * AMCR can't be set, so check if current value is coherent
>>> +		 * with memory-map areas defined in DT
>>> +		 */
>>> +		ret = stm32_omm_set_amcr(dev, false);
>>> +		if (ret)
>>> +			goto err_clk_release;
>>> +	}
>>> +
>>> +	/* for each child, if resource access is granted and status "okay", probe it */
>>> +	for (i = 0; i < omm->nb_child; i++) {
>>> +		if (!child_access[i] || !of_device_is_available(omm->child[i].node))
>>
>> If you have a device available, why do you create one more platform device?
>>
>>> +			continue;
>>> +
>>> +		vdev = of_platform_device_create(omm->child[i].node, NULL, NULL);
>>
>> Why you cannot just populate the children?
> 
> I can't use of_platform_populate(), by default it will populate all OMM's child.
> Whereas here, we want to probe only the OMM's child which match our criteria.  


Why wouldn't you populate everyone? The task of bus driver is not to
filter out DT. If you got such DT - with all device nodes - you are
expected to populate all of them. Otherwise, if you do not want all of
them, it is expected that firmware or bootloader will give you DT
without these nodes.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
