Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0C97EC421
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Nov 2023 14:54:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88310C6B47E;
	Wed, 15 Nov 2023 13:54:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50943C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Nov 2023 13:54:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12847DA7;
 Wed, 15 Nov 2023 05:54:48 -0800 (PST)
Received: from [192.168.1.3] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBC473F641;
 Wed, 15 Nov 2023 05:54:00 -0800 (PST)
Message-ID: <92d6a66d-3270-3378-2ab9-9214c004d5c7@arm.com>
Date: Wed, 15 Nov 2023 13:53:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org, suzuki.poulose@arm.com
References: <20231027072943.3418997-1-anshuman.khandual@arm.com>
 <20231027072943.3418997-5-anshuman.khandual@arm.com>
From: James Clark <james.clark@arm.com>
In-Reply-To: <20231027072943.3418997-5-anshuman.khandual@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 4/7] coresight: tpiu: Move ACPI support
 from AMBA driver to platform driver
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



On 27/10/2023 08:29, Anshuman Khandual wrote:
> Add support for the tpiu device in the platform driver, which can then be
> used on ACPI based platforms. This change would now allow runtime power
> management for ACPI based systems. The driver would try to enable the APB
> clock if available.
> 
[...]
> +#ifdef CONFIG_ACPI
> +static const struct acpi_device_id tpiu_acpi_ids[] = {
> +	{"ARMHC979", 0}, /* ARM CoreSight TPIU */
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, tpiu_acpi_ids);
> +#endif
> +
> +static struct platform_driver tpiu_platform_driver = {
> +	.probe	= tpiu_platform_probe,
> +	.remove	= tpiu_platform_remove,
> +	.driver = {
> +		.name			= "coresight-tpiu-platform",
> +		.acpi_match_table	= ACPI_PTR(tpiu_acpi_ids),
> +		.suppress_bind_attrs	= true,
> +		.pm			= &tpiu_dev_pm_ops,
> +	},
> +};
> +module_platform_driver(tpiu_platform_driver);
> +

Is there a special build config where this works? I get an error here
because module_platform_driver() redefines things that are in
module_amba_driver() which is defined above:

  module_amba_driver(tpiu_driver);

This isn't a W=1 build or anything, just a normal one. And it applies to
most of the patches in this set.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
