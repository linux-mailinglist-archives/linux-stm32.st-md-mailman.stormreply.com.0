Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8D3877CCD
	for <lists+linux-stm32@lfdr.de>; Mon, 11 Mar 2024 10:33:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D84BBC6DD9C;
	Mon, 11 Mar 2024 09:33:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5F24C6B45E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 Mar 2024 09:33:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 86557FEC;
 Mon, 11 Mar 2024 02:34:10 -0700 (PDT)
Received: from [10.162.42.8] (a077893.blr.arm.com [10.162.42.8])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7CBC03F762;
 Mon, 11 Mar 2024 02:33:30 -0700 (PDT)
Message-ID: <081eef3f-3b19-42d1-b70d-8916b867f766@arm.com>
Date: Mon, 11 Mar 2024 15:03:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Clark <james.clark@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20240222082142.3663983-1-anshuman.khandual@arm.com>
 <8ef57dd9-a16d-4847-89f5-a309c4ccb849@arm.com>
 <379bf6df-3568-43c0-9a68-4a5693bf5ccc@arm.com>
 <828d2109-7413-ffe5-da6a-56f15ed2f562@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <828d2109-7413-ffe5-da6a-56f15ed2f562@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sudeep Holla <sudeep.holla@arm.com>, coresight@lists.linaro.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH V5 00/11] coresight: Move remaining AMBA
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



On 3/11/24 14:55, James Clark wrote:
> 
> On 11/03/2024 06:04, Anshuman Khandual wrote:
>>
>> On 3/5/24 23:55, Suzuki K Poulose wrote:
>>> On 22/02/2024 08:21, Anshuman Khandual wrote:
>>>> This moves remaining AMBA ACPI devices into respective platform drivers for
>>>> enabling ACPI based power management support. This series applies on kernel
>>>> v6.8-rc5 release. This series has been built, and boot tested on a DT based
>>>> (RB5) and ACPI supported coresight platform (N1SDP).
>>> Please rebase your series on coresight next and fix build failures with the extra warnings turned ON (should be on by default with next).
>> I did rebase the series (which required some rebase related changes for some) on
>> coresight next i.e with the following commit as HEAD.
>>
>> a4f3057d19ff ("coresight-tpda: Change qcom,dsb-element-size to qcom,dsb-elem-bits")
>>
>> Although did not see any warning either with = m or = y based coresight options.
>> Is there any other particular config which needs to be enabled for these warnings
>> to come up ?
>>
> It doesn't apply cleanly on a4f305 for me, maybe you sent an old version
> after rebasing?

Ohh, I was not clear enough earlier. This series is NOT rebased against coresight next.
I am preparing V6 series respin which is rebased against the above mentioned commit on
coresight next branch instead.

> 
> This change in patch 5 is a warning for example, because not all members
> of the struct are initialised. No special config is required:
> 
> +	{"ARMHC98D", 0}, /* ARM CoreSight Dynamic Replicator */"

Right, will change the above as follows and fix other affected places as well.

	{"ARMHC98D", 0, 0, 0}, /* ARM CoreSight Dynamic Replicator */
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
