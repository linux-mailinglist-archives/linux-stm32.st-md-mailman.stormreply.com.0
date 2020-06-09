Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D981F3D94
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Jun 2020 16:07:35 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E4C04C36B29;
	Tue,  9 Jun 2020 14:07:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B4E67C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2020 14:07:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E6E31FB;
 Tue,  9 Jun 2020 07:07:31 -0700 (PDT)
Received: from [10.57.49.155] (unknown [10.57.49.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83BD23F66F;
 Tue,  9 Jun 2020 07:07:28 -0700 (PDT)
To: dillon.minfei@gmail.com, robh+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@st.com, linux@armlinux.org.uk,
 kstewart@linuxfoundation.org, allison@lohutok.net, info@metux.net,
 tglx@linutronix.de
References: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
 <1591605038-8682-3-git-send-email-dillon.minfei@gmail.com>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <90df5646-e0c4-fcac-d934-4cc922230dd2@arm.com>
Date: Tue, 9 Jun 2020 15:08:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1591605038-8682-3-git-send-email-dillon.minfei@gmail.com>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/2] arm-nommu: Add use_reserved_mem() to
 check if device support reserved memory
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

On 6/8/20 9:30 AM, dillon.minfei@gmail.com wrote:
> From: dillon min <dillon.minfei@gmail.com>
> 
> Currently, we use dma direct to request coherent memory for driver on armv7m
> platform if 'cacheid' is zero, but dma_direct_can_mmap() is return false,
> dma_direct_mmap() return -ENXIO for CONFIG_MMU undefined platform.
> 
> so we have to back to use 'arm_nommu_dma_ops', add use_reserved_mem() to check
> if device support global or device corherent memory. if yes, then call
> set_dma_ops()
> 
> Signed-off-by: dillon min <dillon.minfei@gmail.com>
> ---
>  arch/arm/mm/dma-mapping-nommu.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
> index 287ef898a55e..e1c213fec152 100644
> --- a/arch/arm/mm/dma-mapping-nommu.c
> +++ b/arch/arm/mm/dma-mapping-nommu.c
> @@ -14,6 +14,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/outercache.h>
>  #include <asm/cp15.h>
> +#include <linux/of.h>
>  
>  #include "dma.h"
>  
> @@ -188,6 +189,31 @@ const struct dma_map_ops arm_nommu_dma_ops = {
>  };
>  EXPORT_SYMBOL(arm_nommu_dma_ops);
>  
> +static bool use_reserved_mem(struct device *dev)
> +{
> +	struct device_node *np;
> +
> +	np = of_find_node_by_path("/reserved-memory/linux,dma");
> +
> +	if (np &&
> +		of_device_is_compatible(np, "shared-dma-pool") &&
> +		of_property_read_bool(np, "no-map") &&
> +		of_property_read_bool(np, "linux,dma-default")) {
> +		/* has global corherent mem support */
> +		of_node_put(np);
> +		return true;
> +	}
> +
> +	np = of_parse_phandle(dev->of_node, "memory-region", 0);
> +	if (np) {
> +		/* has dev corherent mem support */
> +		of_node_put(np);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>  			const struct iommu_ops *iommu, bool coherent)
>  {
> @@ -206,6 +232,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>  		dev->archdata.dma_coherent = (get_cr() & CR_M) ? coherent : true;
>  	}
>  
> -	if (!dev->archdata.dma_coherent)
> +	if (!dev->archdata.dma_coherent || use_reserved_mem(dev))
>  		set_dma_ops(dev, &arm_nommu_dma_ops);
>  }
> 

Sorry I have to NAK this hack :(

Digging git history reveled 79964a1c2972 ("ARM: 8633/1: nommu: allow mmap when !CONFIG_MMU")
which make me wonder if diff below does the trick for you

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 8f4bbda..8623b9e 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -456,14 +456,14 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
 #else /* CONFIG_MMU */
 bool dma_direct_can_mmap(struct device *dev)
 {
-	return false;
+	return true;
 }
 
 int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
 		void *cpu_addr, dma_addr_t dma_addr, size_t size,
 		unsigned long attrs)
 {
-	return -ENXIO;
+	return vm_iomap_memory(vma, vma->vm_start, (vma->vm_end - vma->vm_start));;
 }
 #endif /* CONFIG_MMU */

Cheers
Vladimir
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
