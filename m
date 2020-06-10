Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 051DA1F5028
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Jun 2020 10:19:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 927E4C36B21;
	Wed, 10 Jun 2020 08:19:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 615D2C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Jun 2020 08:19:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A88C1F1;
 Wed, 10 Jun 2020 01:19:49 -0700 (PDT)
Received: from [10.57.43.21] (unknown [10.57.43.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E74FE3F6CF;
 Wed, 10 Jun 2020 01:19:46 -0700 (PDT)
To: Christoph Hellwig <hch@infradead.org>
References: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
 <1591605038-8682-3-git-send-email-dillon.minfei@gmail.com>
 <90df5646-e0c4-fcac-d934-4cc922230dd2@arm.com>
 <20200610072444.GA6293@infradead.org>
From: Vladimir Murzin <vladimir.murzin@arm.com>
Message-ID: <9c3a7b4e-0190-e9bb-91fe-6d5692559888@arm.com>
Date: Wed, 10 Jun 2020 09:19:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200610072444.GA6293@infradead.org>
Content-Language: en-US
Cc: kstewart@linuxfoundation.org, devicetree@vger.kernel.org, info@metux.net,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 tglx@linutronix.de, dillon.minfei@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, allison@lohutok.net
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

On 6/10/20 8:24 AM, Christoph Hellwig wrote:
> Ok, I finally found the original patch from Vladimir.  Comments below:
> 
>> +++ b/kernel/dma/direct.c
>> @@ -456,14 +456,14 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
>>  #else /* CONFIG_MMU */
>>  bool dma_direct_can_mmap(struct device *dev)
>>  {
>> -	return false;
>> +	return true;
>>  }
>>  
>>  int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
>>  		void *cpu_addr, dma_addr_t dma_addr, size_t size,
>>  		unsigned long attrs)
>>  {
>> -	return -ENXIO;
>> +	return vm_iomap_memory(vma, vma->vm_start, (vma->vm_end - vma->vm_start));;
> 
> I think we should try to reuse the mmu dma_direct_mmap implementation,
> which does about the same.  This version has been compile tested on
> arm-nommu only, let me know what you think: (btw, a nommu_defconfig of
> some kind for arm would be nice..)

Catch-all nommu_defconfig is not easy for ARM, AFAIK folk carry few hacks
for randconfig...

Meanwhile, known working NOMMU configs

$ git grep "# CONFIG_MMU is not set" arch/arm/configs/
arch/arm/configs/efm32_defconfig:# CONFIG_MMU is not set
arch/arm/configs/lpc18xx_defconfig:# CONFIG_MMU is not set
arch/arm/configs/mps2_defconfig:# CONFIG_MMU is not set
arch/arm/configs/stm32_defconfig:# CONFIG_MMU is not set
arch/arm/configs/vf610m4_defconfig:# CONFIG_MMU is not set

> 
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index d006668c0027d2..e0dae570a51530 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -71,6 +71,7 @@ config SWIOTLB
>  # in the pagetables
>  #
>  config DMA_NONCOHERENT_MMAP
> +	default y if !MMU
>  	bool

Nit: def_bool !MMU

>  
>  config DMA_REMAP
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 0a4881e59aa7d6..9ec6a5c3fc578c 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -459,7 +459,6 @@ int dma_direct_get_sgtable(struct device *dev, struct sg_table *sgt,
>  	return ret;
>  }
>  
> -#ifdef CONFIG_MMU
>  bool dma_direct_can_mmap(struct device *dev)
>  {
>  	return dev_is_dma_coherent(dev) ||
> @@ -485,19 +484,6 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
>  	return remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
>  			user_count << PAGE_SHIFT, vma->vm_page_prot);
>  }
> -#else /* CONFIG_MMU */
> -bool dma_direct_can_mmap(struct device *dev)
> -{
> -	return false;
> -}
> -
> -int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
> -		void *cpu_addr, dma_addr_t dma_addr, size_t size,
> -		unsigned long attrs)
> -{
> -	return -ENXIO;
> -}
> -#endif /* CONFIG_MMU */
>  
>  int dma_direct_supported(struct device *dev, u64 mask)
>  {
> 

LGTM. FWIW:

Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
