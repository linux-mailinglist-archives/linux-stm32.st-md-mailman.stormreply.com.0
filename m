Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E15739937
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jun 2023 10:18:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 438C4C65E4F;
	Thu, 22 Jun 2023 08:18:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58D43C5E2C2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 08:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687421912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9165t1I/uhRF5KMhHJE8BVUjT2kznhbBzSsVByfD1j8=;
 b=aRj4KFK5/humLU2syp7fRfgyAJtyqoWs2ZaLAq2SdHDWr1OYHIXa058i+cII8/3xoYI2HD
 9V1VtofAPbNjGy2CBaAhAXtSmYjArNiVye/Ccqozq2FiIivDBpYeh0pvqEg2DqWJROn6AH
 YEGmJQZuC9hsuTM531O5zd4IleNn0A0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-7CDo2PsMN-CumTmiWRQJvQ-1; Thu, 22 Jun 2023 04:18:28 -0400
X-MC-Unique: 7CDo2PsMN-CumTmiWRQJvQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-51a595bc30dso487088a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jun 2023 01:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687421907; x=1690013907;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9165t1I/uhRF5KMhHJE8BVUjT2kznhbBzSsVByfD1j8=;
 b=Anv14304Kock0qe9yxzcj6NXfmOmSRcspWxeWrbDMuiVFS4fLr7k78fKkIvFltT4/H
 Lc1uJUCLOPR0ITXOoxPzYbs806dsS60FxNeOfzS/y77ZvEoqAjlwqHilo+7RoNzEHmyk
 MwRwOi2BtUPlIMyPYYRQRoN7fXFHadBp8wxHvIDTjTfrarHXapxDHXxSrvdHcjDoGuo9
 Y8fwEL5mtTT3L6w2mBulSxQ6y9REDDolT2yIK+2Vmegk+epiHs7NhoX641QWiPkvyzAQ
 TEumyoomadrIidFoZGyQC9DWlt10bxexEW/PBo3jryOk9PQ/yfiI26z19oUYFnX7Cvkx
 mtQg==
X-Gm-Message-State: AC+VfDyvaG7bq5uQ+n4R2IqWQ/+wm3L43KLL3XBgAo0bXWJuNZYQA2N1
 RKAbEp/f7TygL6HqdkhqvJaMLf65xb0SPTsWjeHheGniSY/lnzZ/EwphdsFhGbBDRCsEbMgjNkq
 ls/PYWuujw5VV8GthLcOobiEh7w6d8nZzXS8WeHdu
X-Received: by 2002:a05:6402:1d49:b0:51b:d59f:8518 with SMTP id
 dz9-20020a0564021d4900b0051bd59f8518mr5910617edb.16.1687421907408; 
 Thu, 22 Jun 2023 01:18:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6g0HUfA5kMm9iiZnbdF5JVa1vaSBMAPniXZ2SxZ+md/CR90yZZSiif6KqMQdRlA4FZqjbJXg==
X-Received: by 2002:a05:6402:1d49:b0:51b:d59f:8518 with SMTP id
 dz9-20020a0564021d4900b0051bd59f8518mr5910591edb.16.1687421907045; 
 Thu, 22 Jun 2023 01:18:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a056402014600b0051bdf152295sm1639168edu.76.2023.06.22.01.18.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 01:18:26 -0700 (PDT)
Message-ID: <0652c9c8-27ee-0af9-9aa8-a2909142d405@redhat.com>
Date: Thu, 22 Jun 2023 10:18:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>, Mark Gross <markgross@kernel.org>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, =?UTF-8?Q?Marek_Beh=c3=ban?=
 <kabel@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>,
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
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Shenwei Wang <shenwei.wang@nxp.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Jochen Henneberg <jh@henneberg-systemdesign.com>
References: <20230622041905.629430-1-yong.liang.choong@linux.intel.com>
 <20230622041905.629430-2-yong.liang.choong@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230622041905.629430-2-yong.liang.choong@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Cc: linux-hwmon@vger.kernel.org, Tee Min <tee.min.tan@linux.intel.com>,
 Voon Wei Feng <weifeng.voon@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Lai Peter Jun Ann <jun.ann.lai@intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 6/22/23 06:19, Choong Yong Liang wrote:
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

This seem to be 2 patches in 1:

1. Move core.h to include/linux/intel_pmc_core.h
2. The actual adding of IPC mailbox accessor function and add SoC register access

I wonder if you really need to move the entire core.h ?

IMHO it would be better to just add a new header with just the bits
which you actually need to export the desired functionality.

If you do believe that you really need to move core.h please split
this into 2 separate patches and please place the header in a x86
specific place, e.g. : include/linux/platform_data/x86/



Also note that a somewhat big refactor, to add support for
multiple PMCs for Meteor Lake is on its way to linux-next.

Currently this is available in my review-hans branch:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Please base a next version of this on this.

There also is the question of how to merge this. Assuming this is
ready for merging once 6.5-rc1 is out then I can merge this intel_pmc_core
change into an immutable branch and send a pull-req to the net folks
for this.

Regards,

Hans






> ---
>  MAINTAINERS                                   |  1 +
>  drivers/platform/x86/intel/pmc/adl.c          |  2 +-
>  drivers/platform/x86/intel/pmc/cnp.c          |  2 +-
>  drivers/platform/x86/intel/pmc/core.c         | 63 ++++++++++++++++++-
>  drivers/platform/x86/intel/pmc/icl.c          |  2 +-
>  drivers/platform/x86/intel/pmc/mtl.c          |  2 +-
>  drivers/platform/x86/intel/pmc/spt.c          |  2 +-
>  drivers/platform/x86/intel/pmc/tgl.c          |  2 +-
>  .../core.h => include/linux/intel_pmc_core.h  | 27 +++++++-
>  9 files changed, 95 insertions(+), 8 deletions(-)
>  rename drivers/platform/x86/intel/pmc/core.h => include/linux/intel_pmc_core.h (95%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cb14589d14ab..bdb08a79a5f8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10581,6 +10581,7 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/ABI/testing/sysfs-platform-intel-pmc
>  F:	drivers/platform/x86/intel/pmc/
> +F:	include/linux/intel_pmc_core*
>  
>  INTEL PMIC GPIO DRIVERS
>  M:	Andy Shevchenko <andy@kernel.org>
> diff --git a/drivers/platform/x86/intel/pmc/adl.c b/drivers/platform/x86/intel/pmc/adl.c
> index 5cbd40979f2a..b6a376c536c0 100644
> --- a/drivers/platform/x86/intel/pmc/adl.c
> +++ b/drivers/platform/x86/intel/pmc/adl.c
> @@ -8,7 +8,7 @@
>   *
>   */
>  
> -#include "core.h"
> +#include <linux/intel_pmc_core.h>
>  
>  /* Alder Lake: PGD PFET Enable Ack Status Register(s) bitmap */
>  const struct pmc_bit_map adl_pfear_map[] = {
> diff --git a/drivers/platform/x86/intel/pmc/cnp.c b/drivers/platform/x86/intel/pmc/cnp.c
> index 7fb38815c4eb..504034cc5ec3 100644
> --- a/drivers/platform/x86/intel/pmc/cnp.c
> +++ b/drivers/platform/x86/intel/pmc/cnp.c
> @@ -8,7 +8,7 @@
>   *
>   */
>  
> -#include "core.h"
> +#include <linux/intel_pmc_core.h>
>  
>  /* Cannon Lake: PGD PFET Enable Ack Status Register(s) bitmap */
>  const struct pmc_bit_map cnp_pfear_map[] = {
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index da6e7206d38b..0d60763c5144 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -16,6 +16,7 @@
>  #include <linux/delay.h>
>  #include <linux/dmi.h>
>  #include <linux/io.h>
> +#include <linux/intel_pmc_core.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/slab.h>
> @@ -26,7 +27,9 @@
>  #include <asm/msr.h>
>  #include <asm/tsc.h>
>  
> -#include "core.h"
> +#define PMC_IPCS_PARAM_COUNT           7
> +
> +static const struct x86_cpu_id *pmc_cpu_id;
>  
>  /* Maximum number of modes supported by platfoms that has low power mode capability */
>  const char *pmc_lpm_modes[] = {
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
> +	if (!pmc_cpu_id || !ipc_cmd || !rbuf)
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
>  static inline u32 pmc_core_reg_read(struct pmc_dev *pmcdev, int reg_offset)
>  {
>  	return readl(pmcdev->regbase + reg_offset);
> @@ -1130,6 +1190,7 @@ static int pmc_core_probe(struct platform_device *pdev)
>  	mutex_init(&pmcdev->lock);
>  	core_init(pmcdev);
>  
> +	pmc_cpu_id = cpu_id;
>  
>  	if (lpit_read_residency_count_address(&slp_s0_addr)) {
>  		pmcdev->base_addr = PMC_BASE_ADDR_DEFAULT;
> diff --git a/drivers/platform/x86/intel/pmc/icl.c b/drivers/platform/x86/intel/pmc/icl.c
> index 2f11b1a6daeb..f18048ff9382 100644
> --- a/drivers/platform/x86/intel/pmc/icl.c
> +++ b/drivers/platform/x86/intel/pmc/icl.c
> @@ -8,7 +8,7 @@
>   *
>   */
>  
> -#include "core.h"
> +#include <linux/intel_pmc_core.h>
>  
>  const struct pmc_bit_map icl_pfear_map[] = {
>  	{"RES_65",		BIT(0)},
> diff --git a/drivers/platform/x86/intel/pmc/mtl.c b/drivers/platform/x86/intel/pmc/mtl.c
> index e8cc156412ce..7897f5fe9881 100644
> --- a/drivers/platform/x86/intel/pmc/mtl.c
> +++ b/drivers/platform/x86/intel/pmc/mtl.c
> @@ -9,7 +9,7 @@
>   */
>  
>  #include <linux/pci.h>
> -#include "core.h"
> +#include <linux/intel_pmc_core.h>
>  
>  const struct pmc_reg_map mtl_reg_map = {
>  	.pfear_sts = ext_tgl_pfear_map,
> diff --git a/drivers/platform/x86/intel/pmc/spt.c b/drivers/platform/x86/intel/pmc/spt.c
> index e16982236778..95ce490cf5d6 100644
> --- a/drivers/platform/x86/intel/pmc/spt.c
> +++ b/drivers/platform/x86/intel/pmc/spt.c
> @@ -8,7 +8,7 @@
>   *
>   */
>  
> -#include "core.h"
> +#include <linux/intel_pmc_core.h>
>  
>  const struct pmc_bit_map spt_pll_map[] = {
>  	{"MIPI PLL",			SPT_PMC_BIT_MPHY_CMN_LANE0},
> diff --git a/drivers/platform/x86/intel/pmc/tgl.c b/drivers/platform/x86/intel/pmc/tgl.c
> index c245ada849d0..a1719d809497 100644
> --- a/drivers/platform/x86/intel/pmc/tgl.c
> +++ b/drivers/platform/x86/intel/pmc/tgl.c
> @@ -8,7 +8,7 @@
>   *
>   */
>  
> -#include "core.h"
> +#include <linux/intel_pmc_core.h>
>  
>  #define ACPI_S0IX_DSM_UUID		"57a6512e-3979-4e9d-9708-ff13b2508972"
>  #define ACPI_GET_LOW_MODE_REGISTERS	1
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/include/linux/intel_pmc_core.h
> similarity index 95%
> rename from drivers/platform/x86/intel/pmc/core.h
> rename to include/linux/intel_pmc_core.h
> index 9ca9b9746719..82810e8b92a2 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/include/linux/intel_pmc_core.h
> @@ -250,7 +250,16 @@ enum ppfear_regs {
>  #define MTL_LPM_STATUS_OFFSET			0x1700
>  #define MTL_LPM_LIVE_STATUS_OFFSET		0x175C
>  
> -extern const char *pmc_lpm_modes[];
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
>  
>  struct pmc_bit_map {
>  	const char *name;
> @@ -427,4 +436,20 @@ static const struct file_operations __name ## _fops = {			\
>  	.release	= single_release,				\
>  }
>  
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
>  #endif /* PMC_CORE_H */

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
