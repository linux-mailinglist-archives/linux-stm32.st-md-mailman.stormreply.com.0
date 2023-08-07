Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F56B771F24
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Aug 2023 13:02:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3D74C6B45C;
	Mon,  7 Aug 2023 11:02:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 049BEC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Aug 2023 11:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691406138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4tVoX28GTGtCUXdSQaBJtaWNWRKg0UVBLfIJI4oLwi0=;
 b=NJrnhYJGRWlO5rUN0x2qopozIC0xj/hk6xwurD0iKYW7hrL86ZbX+RrkVcFMCZbtDDYub1
 XJPErvTGHRpXGNpPDQQyJ7py3Ip9ExQsukBghigXL82Z38rbBq7MVbRNCzgT3AuWINy/3c
 9P2kSK9MPyjigoRJDaMuwc9wC+avn1A=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-qhG-lXXUMMyYnXjRTsilBA-1; Mon, 07 Aug 2023 07:02:14 -0400
X-MC-Unique: qhG-lXXUMMyYnXjRTsilBA-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-5218b9647a8so2922496a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 07 Aug 2023 04:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406133; x=1692010933;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4tVoX28GTGtCUXdSQaBJtaWNWRKg0UVBLfIJI4oLwi0=;
 b=iFdDBKSrp3aHYQUP9JM7iP3ocsE0e5iftLYbEOxYHSoGRU8dv2S2ZILt6OwEgMdyeH
 bvZOwATb3o6mkBDdvI8TgcxdVaMCopXcvWYOqILwAOOcIHeKoBw2Iht0ajZJ/rdv8AC3
 dsl+eUGckUkPO1NLBCUFLd/PfidXimTzEGbH7siii+odporrNKIGg4L4RPuvGJ/cdFhH
 RKF4vB7VVHdJtie2pJH/rTK/4eqEV0gIFM9JRnDJUg037q6TbbGOoytA/ljtPDbViaWm
 rdQ6d2GDDEdwjAJiCuXg6DG4ldjFC0BDEC6groQ8dEfpkWI7TCJaXCZ1Bni/U1B6+ATO
 wmaA==
X-Gm-Message-State: AOJu0YzVwwDpZIWJ2pg1QK0oeqBRDVgrw+Y+6CVYXmNPBjS3gTeRHE5Q
 CoUJaVuqF6t08yF9tY1u8D6dSu+10YC3KlibwXQwJpdslEtY6TzRWD6Y+Uo0aQCPRlyMz3upS42
 XyBqADclhHQdlD5Q43dYDG12eO7LfDMI8jSW0DTfj
X-Received: by 2002:aa7:da91:0:b0:523:f29:a912 with SMTP id
 q17-20020aa7da91000000b005230f29a912mr5825482eds.21.1691406133623; 
 Mon, 07 Aug 2023 04:02:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpV1CiOzHk73Q0S1VjzXSs0/DvHhdz0S3B8+70wxb75oVf2/18bmu8foLRZEbGwYEDxL6b1A==
X-Received: by 2002:aa7:da91:0:b0:523:f29:a912 with SMTP id
 q17-20020aa7da91000000b005230f29a912mr5825448eds.21.1691406133282; 
 Mon, 07 Aug 2023 04:02:13 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 t10-20020aa7d4ca000000b005226f281bc5sm5036828edr.25.2023.08.07.04.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 04:02:12 -0700 (PDT)
Message-ID: <145d7375-0e58-b7cf-6240-5d8bc16b0344@redhat.com>
Date: Mon, 7 Aug 2023 13:02:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@linux.intel.com>, Mark Gross
 <markgross@kernel.org>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 =?UTF-8?Q?Marek_Beh=c3=ban?= <kabel@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Wong Vee Khee
 <veekhee@apple.com>, Jon Hunter <jonathanh@nvidia.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>
References: <20230804084527.2082302-1-yong.liang.choong@linux.intel.com>
 <20230804084527.2082302-2-yong.liang.choong@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230804084527.2082302-2-yong.liang.choong@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-hwmon@vger.kernel.org, Tan Tee Min <tee.min.tan@linux.intel.com>,
 Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 1/5] platform/x86:
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi David,

On 8/4/23 10:45, Choong Yong Liang wrote:
> From: "David E. Box" <david.e.box@linux.intel.com>
> 
> - Exports intel_pmc_core_ipc() for host access to the PMC IPC mailbox
> - Add support to use IPC command allows host to access SoC registers
> through PMC firmware that are otherwise inaccessible to the host due to
> security policies.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Chao Qin <chao.qin@intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>

The new exported intel_pmc_core_ipc() function does not seem to
depend on any existing PMC code.

IMHO it would be better to put this in a new .c file under
arch/x86/platform/intel/ this is where similar helpers like
the iosf_mbi functions also live.

This also avoids Kconfig complications. Currently the
drivers/platform/x86/intel/pmc/core.c code is only
build if CONFIG_X86_PLATFORM_DEVICES and
CONFIG_INTEL_PMC_CORE are both set. So if a driver
wants to make sure this is enabled by selecting them
then it needs to select both.

Talking about Kconfig:

#if IS_ENABLED(CONFIG_INTEL_PMC_CORE)
int intel_pmc_core_ipc(struct pmc_ipc_cmd *ipc_cmd, u32 *rbuf);
#else
static inline int intel_pmc_core_ipc(struct pmc_ipc_cmd *ipc_cmd, u32 *rbuf)
{
	return -ENODEV;
}
#endif /* CONFIG_INTEL_PMC_CORE */

Notice that CONFIG_INTEL_PMC_CORE is a tristate, so pmc might be build as a module where as a consumer of intel_pmc_core_ipc() might end up builtin in which case this will not work without extra Kconfig protection. And if you are going to add extra Kconfig you might just as well select or depend on INTEL_PMC_CORE and drop the #if .

Regards,

Hans






> ---
>  MAINTAINERS                                   |  1 +
>  drivers/platform/x86/intel/pmc/core.c         | 60 +++++++++++++++++++
>  .../linux/platform_data/x86/intel_pmc_core.h  | 41 +++++++++++++
>  3 files changed, 102 insertions(+)
>  create mode 100644 include/linux/platform_data/x86/intel_pmc_core.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 069e176d607a..8a034dee9da9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10648,6 +10648,7 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-platform-intel-pmc
>  F:	drivers/platform/x86/intel/pmc/
> +F:	linux/platform_data/x86/intel_pmc_core.h
>  
>  INTEL PMIC GPIO DRIVERS
>  M:	Andy Shevchenko <andy@kernel.org>
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 5a36b3f77bc5..6fb1b0f453d8 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -20,6 +20,7 @@
>  #include <linux/pci.h>
>  #include <linux/slab.h>
>  #include <linux/suspend.h>
> +#include <linux/platform_data/x86/intel_pmc_core.h>
>  
>  #include <asm/cpu_device_id.h>
>  #include <asm/intel-family.h>
> @@ -28,6 +29,8 @@
>  
>  #include "core.h"
>  
> +#define PMC_IPCS_PARAM_COUNT           7
> +
>  /* Maximum number of modes supported by platfoms that has low power mode capability */
>  const char *pmc_lpm_modes[] = {
>  	"S0i2.0",
> @@ -53,6 +56,63 @@ const struct pmc_bit_map msr_map[] = {
>  	{}
>  };
>  
> +int intel_pmc_core_ipc(struct pmc_ipc_cmd *ipc_cmd, u32 *rbuf)
> +{
> +	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object params[PMC_IPCS_PARAM_COUNT] = {
> +		{.type = ACPI_TYPE_INTEGER,},
> +		{.type = ACPI_TYPE_INTEGER,},
> +		{.type = ACPI_TYPE_INTEGER,},
> +		{.type = ACPI_TYPE_INTEGER,},
> +		{.type = ACPI_TYPE_INTEGER,},
> +		{.type = ACPI_TYPE_INTEGER,},
> +		{.type = ACPI_TYPE_INTEGER,},
> +	};
> +	struct acpi_object_list arg_list = { PMC_IPCS_PARAM_COUNT, params };
> +	union acpi_object *obj;
> +	int status;
> +
> +	if (!ipc_cmd || !rbuf)
> +		return -EINVAL;
> +
> +	/*
> +	 * 0: IPC Command
> +	 * 1: IPC Sub Command
> +	 * 2: Size
> +	 * 3-6: Write Buffer for offset
> +	 */
> +	params[0].integer.value = ipc_cmd->cmd;
> +	params[1].integer.value = ipc_cmd->sub_cmd;
> +	params[2].integer.value = ipc_cmd->size;
> +	params[3].integer.value = ipc_cmd->wbuf[0];
> +	params[4].integer.value = ipc_cmd->wbuf[1];
> +	params[5].integer.value = ipc_cmd->wbuf[2];
> +	params[6].integer.value = ipc_cmd->wbuf[3];
> +
> +	status = acpi_evaluate_object(NULL, "\\IPCS", &arg_list, &buffer);
> +	if (ACPI_FAILURE(status))
> +		return -ENODEV;
> +
> +	obj = buffer.pointer;
> +	/* Check if the number of elements in package is 5 */
> +	if (obj && obj->type == ACPI_TYPE_PACKAGE && obj->package.count == 5) {
> +		const union acpi_object *objs = obj->package.elements;
> +
> +		if ((u8)objs[0].integer.value != 0)
> +			return -EINVAL;
> +
> +		rbuf[0] = objs[1].integer.value;
> +		rbuf[1] = objs[2].integer.value;
> +		rbuf[2] = objs[3].integer.value;
> +		rbuf[3] = objs[4].integer.value;
> +	} else {
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(intel_pmc_core_ipc);
> +
>  static inline u32 pmc_core_reg_read(struct pmc *pmc, int reg_offset)
>  {
>  	return readl(pmc->regbase + reg_offset);
> diff --git a/include/linux/platform_data/x86/intel_pmc_core.h b/include/linux/platform_data/x86/intel_pmc_core.h
> new file mode 100644
> index 000000000000..9bb3394fedcf
> --- /dev/null
> +++ b/include/linux/platform_data/x86/intel_pmc_core.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Intel Core SoC Power Management Controller Header File
> + *
> + * Copyright (c) 2023, Intel Corporation.
> + * All Rights Reserved.
> + *
> + * Authors: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> + *          David E. Box <david.e.box@linux.intel.com>
> + */
> +#ifndef INTEL_PMC_CORE_H
> +#define INTEL_PMC_CORE_H
> +
> +#define IPC_SOC_REGISTER_ACCESS			0xAA
> +#define IPC_SOC_SUB_CMD_READ			0x00
> +#define IPC_SOC_SUB_CMD_WRITE			0x01
> +
> +struct pmc_ipc_cmd {
> +	u32 cmd;
> +	u32 sub_cmd;
> +	u32 size;
> +	u32 wbuf[4];
> +};
> +
> +#if IS_ENABLED(CONFIG_INTEL_PMC_CORE)
> +/**
> + * intel_pmc_core_ipc() - PMC IPC Mailbox accessor
> + * @ipc_cmd:  struct pmc_ipc_cmd prepared with input to send
> + * @rbuf:     Allocated u32[4] array for returned IPC data
> + *
> + * Return: 0 on success. Non-zero on mailbox error
> + */
> +int intel_pmc_core_ipc(struct pmc_ipc_cmd *ipc_cmd, u32 *rbuf);
> +#else
> +static inline int intel_pmc_core_ipc(struct pmc_ipc_cmd *ipc_cmd, u32 *rbuf)
> +{
> +	return -ENODEV;
> +}
> +#endif /* CONFIG_INTEL_PMC_CORE */
> +
> +#endif /* INTEL_PMC_CORE_H */

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
