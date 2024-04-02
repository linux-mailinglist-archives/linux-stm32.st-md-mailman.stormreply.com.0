Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE1C894A8F
	for <lists+linux-stm32@lfdr.de>; Tue,  2 Apr 2024 06:43:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B864EC6B45B;
	Tue,  2 Apr 2024 04:43:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A107C69066
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Apr 2024 04:43:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17002106F;
 Mon,  1 Apr 2024 21:43:51 -0700 (PDT)
Received: from [10.163.56.225] (unknown [10.163.56.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8388C3F766;
 Mon,  1 Apr 2024 21:43:14 -0700 (PDT)
Message-ID: <d80f641e-47dc-4fe5-bdfc-61c500aac066@arm.com>
Date: Tue, 2 Apr 2024 10:13:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-arm-kernel@lists.infradead.org, suzuki.poulose@arm.com
References: <20240314055843.2625883-1-anshuman.khandual@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20240314055843.2625883-1-anshuman.khandual@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V7 00/11] coresight: Move remaining AMBA
 ACPI devices into platform driver
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



On 3/14/24 11:28, Anshuman Khandual wrote:
> This moves remaining AMBA ACPI devices into respective platform drivers for
> enabling ACPI based power management support. This series applies on latest
> coresight next. This series has been built, and boot tested on a DT based
> (RB5) and ACPI supported coresight platform (N1SDP).
> 
> https://git.gitlab.arm.com/linux-arm/linux-anshuman.git (amba_other_acpi_migration_v7)
> 
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: James Clark <james.clark@arm.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: linux-acpi@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: coresight@lists.linaro.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> 
> Changes in V7:
> 
> - Dropped reduntant 'drvdata' check in following functions
>   replicator_platform_remove()
>   funnel_platform_remove()
>   tpiu_platform_remove()
>   tmc_platform_remove()
>   catu_platform_remove()
>   catu_platform_probe()
>   debug_platform_remove()
>   debug_platform_probe()
> - Dropped struct resource check before devm_ioremap_resource()
> - Sorted the headers in alphabetic order

Hello Suzuki,

This series still applies cleanly on the latest v6.9-rc2. But please
do let me know if you need this to be posted again.

- Anshuman
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
