Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 784658283E6
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jan 2024 11:22:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2A9F9C6DD73;
	Tue,  9 Jan 2024 10:22:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3F32AC6B476
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jan 2024 10:22:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41BAFC15;
 Tue,  9 Jan 2024 02:23:04 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 211BC3F73F;
 Tue,  9 Jan 2024 02:22:16 -0800 (PST)
Message-ID: <1dcfd28c-78d8-4790-8c99-27e15989ca40@arm.com>
Date: Tue, 9 Jan 2024 10:22:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: James Clark <james.clark@arm.com>, coresight@lists.linaro.org
References: <20231212155407.1429121-1-james.clark@arm.com>
 <20231212155407.1429121-7-james.clark@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20231212155407.1429121-7-james.clark@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 6/8] coresight: Move all sysfs code to
	sysfs file
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

On 12/12/2023 15:54, James Clark wrote:
> At the moment the core file contains both sysfs functionality and
> core functionality, while the Perf mode is in a separate file in
> coresight-etm-perf.c
> 
> Many of the functions have ambiguous names like
> coresight_enable_source() which actually only work in relation to the
> sysfs mode. To avoid further confusion, move everything that isn't core
> functionality into the sysfs file and append  _sysfs to the ambiguous
> functions.
> 
> Signed-off-by: James Clark <james.clark@arm.com>

The changes look good to me. One minor comment below.

...

> +struct device_type coresight_dev_type[] = {
> +	{
> +		.name = "sink",
> +		.groups = coresight_sink_groups,
> +	},
> +	{
> +		.name = "link",
> +	},
> +	{
> +		.name = "linksink",
> +		.groups = coresight_sink_groups,
> +	},
> +	{
> +		.name = "source",
> +		.groups = coresight_source_groups,
> +	},
> +	{
> +		.name = "helper",
> +	}
> +};
> +/* Ensure the enum matches the names and groups */
> +static_assert(ARRAY_SIZE(coresight_dev_type) == CORESIGHT_DEV_TYPE_MAX);

As a general cleanup, while you are at it, could we please replace this 
with explicit member initialisers as a follow up patch ?

i.e.,

struct device_typ coresight_dev_type[CORESIGHT_DEV_TYPE_MAX] = {
	[CORESIGHT_DEV_TYPE_SINK] = {
			.name = "sink",
			.groups = coresight_sink_groups,
	},
	[CORESIGHT_DEV_TYPE_LINK] =
...

}

Thanks
Suzuki
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
