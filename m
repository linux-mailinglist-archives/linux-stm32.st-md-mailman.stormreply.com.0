Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B25573B065
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jun 2023 07:54:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1E150C65E42;
	Fri, 23 Jun 2023 05:54:38 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6739AC65048
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jun 2023 05:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687499676; x=1719035676;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=jX5Lr1tAqj4wwCuiTw/iPCwJsi56am7+vbPvNZh5aTg=;
 b=kNvjZd1KUNbRHV9AwlgLz61d1A23BXRPhSjR+gXeserluMOMyihm+j2w
 p7b+e+KGUxeZCe8AyO/RK7RgUjYZVswmUpWFULKCma4+zSLGAAojdt/rl
 d5k4OLDMWbiTo4tCUluS6Qbqda+sG6q1yJ4Snv2d4UPA6rM7TyaAGmtdL
 6Ehg1n6CGb3JbMsXBrpD1luya51lzhVBJ0iyc1gB5TjPfRHaxA7QyQuPW
 yuFNWHRCGs+3foSc5iQXRVR3glgdjF4ktgh+T4aDMBVsKNaxOeqGpfJxF
 3K/I5JnqbeNWqI0afUFU4rADUBlQ6mYHlgeWvfS4HCb/YRsnV+Rhkdg1g w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="358186457"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="358186457"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 22:54:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="828251468"
X-IronPort-AV: E=Sophos;i="6.01,151,1684825200"; d="scan'208";a="828251468"
Received: from choongyo-mobl.gar.corp.intel.com (HELO [10.215.253.116])
 ([10.215.253.116])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 22:54:24 -0700
Message-ID: <52021da4-c2a5-5350-0a7c-273d76a221c6@linux.intel.com>
Date: Fri, 23 Jun 2023 13:54:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Simon Horman <simon.horman@corigine.com>
References: <20230622041905.629430-1-yong.liang.choong@linux.intel.com>
 <20230622041905.629430-2-yong.liang.choong@linux.intel.com>
 <ZJRdllrXB4bi7oOQ@corigine.com>
From: Choong Yong Liang <yong.liang.choong@linux.intel.com>
In-Reply-To: <ZJRdllrXB4bi7oOQ@corigine.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Voon Wei Feng <weifeng.voon@intel.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 David E Box <david.e.box@intel.com>, Eric Dumazet <edumazet@google.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Jon Hunter <jonathanh@nvidia.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Tee Min <tee.min.tan@linux.intel.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Wong Vee Khee <veekhee@apple.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Jean Delvare <jdelvare@suse.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Revanth Kumar Uppala <ruppala@nvidia.com>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 platform-driver-x86@vger.kernel.org, Tan@web.codeaurora.org,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/6] platform/x86:
 intel_pmc_core: Add IPC mailbox accessor function and add SoC register
 access
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

Hi Simon,

Yes, you are right. I will add static in v2. Thank you.

On 22/6/2023 10:41 pm, Simon Horman wrote:
> On Thu, Jun 22, 2023 at 12:19:00PM +0800, Choong Yong Liang wrote:
>> From: "David E. Box" <david.e.box@linux.intel.com>
>>
>> - Exports intel_pmc_core_ipc() for host access to the PMC IPC mailbox
>> - Add support to use IPC command allows host to access SoC registers
>> through PMC firmware that are otherwise inaccessible to the host due to
>> security policies.
>>
>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
>> Signed-off-by: Chao Qin <chao.qin@intel.com>
>> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> 
> ...
> 
>> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
>> index da6e7206d38b..0d60763c5144 100644
>> --- a/drivers/platform/x86/intel/pmc/core.c
>> +++ b/drivers/platform/x86/intel/pmc/core.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/dmi.h>
>>   #include <linux/io.h>
>> +#include <linux/intel_pmc_core.h>
>>   #include <linux/module.h>
>>   #include <linux/pci.h>
>>   #include <linux/slab.h>
>> @@ -26,7 +27,9 @@
>>   #include <asm/msr.h>
>>   #include <asm/tsc.h>
>>   
>> -#include "core.h"
>> +#define PMC_IPCS_PARAM_COUNT           7
>> +
>> +static const struct x86_cpu_id *pmc_cpu_id;
>>   
>>   /* Maximum number of modes supported by platfoms that has low power mode capability */
>>   const char *pmc_lpm_modes[] = {
> 
> Hi Choong Yong Liang,
> 
> It looks like pmc_lpm_mode is used in this file and, as of this patch,
> has no declaration. Should it be static?
> 
> ...
> 
>> diff --git a/drivers/platform/x86/intel/pmc/core.h b/include/linux/intel_pmc_core.h
>> similarity index 95%
>> rename from drivers/platform/x86/intel/pmc/core.h
>> rename to include/linux/intel_pmc_core.h
>> index 9ca9b9746719..82810e8b92a2 100644
>> --- a/drivers/platform/x86/intel/pmc/core.h
>> +++ b/include/linux/intel_pmc_core.h
>> @@ -250,7 +250,16 @@ enum ppfear_regs {
>>   #define MTL_LPM_STATUS_OFFSET			0x1700
>>   #define MTL_LPM_LIVE_STATUS_OFFSET		0x175C
>>   
>> -extern const char *pmc_lpm_modes[];
>> +#define IPC_SOC_REGISTER_ACCESS			0xAA
>> +#define IPC_SOC_SUB_CMD_READ			0x00
>> +#define IPC_SOC_SUB_CMD_WRITE			0x01
>> +
>> +struct pmc_ipc_cmd {
>> +	u32 cmd;
>> +	u32 sub_cmd;
>> +	u32 size;
>> +	u32 wbuf[4];
>> +};
>>   
>>   struct pmc_bit_map {
>>   	const char *name;
> 
> ...
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
