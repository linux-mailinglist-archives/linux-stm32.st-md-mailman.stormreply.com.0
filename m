Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C175C693FA4
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Feb 2023 09:31:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6145AC69069;
	Mon, 13 Feb 2023 08:31:03 +0000 (UTC)
Received: from imap5.colo.codethink.co.uk (imap5.colo.codethink.co.uk
 [78.40.148.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE3F9C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 08:31:02 +0000 (UTC)
Received: from [167.98.27.226] (helo=[172.16.101.148])
 by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1pRUEB-002EmZ-C6; Mon, 13 Feb 2023 08:30:23 +0000
Message-ID: <f1a6c357-b7e0-2869-72e0-e850b63e6ca9@codethink.co.uk>
Date: Mon, 13 Feb 2023 08:30:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
 <20230211031821.976408-6-cristian.ciocaltea@collabora.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230211031821.976408-6-cristian.ciocaltea@collabora.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/12] riscv: Implement non-coherent DMA
 support via SiFive cache flushing
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

On 11/02/2023 03:18, Cristian Ciocaltea wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> This variant is used on the StarFive JH7100 SoC.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>   arch/riscv/Kconfig              |  6 ++++--
>   arch/riscv/mm/dma-noncoherent.c | 37 +++++++++++++++++++++++++++++++--
>   2 files changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 9c687da7756d..05f6c77faf6f 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -232,12 +232,14 @@ config LOCKDEP_SUPPORT
>   	def_bool y
>   
>   config RISCV_DMA_NONCOHERENT
> -	bool
> +	bool "Support non-coherent DMA"
> +	default SOC_STARFIVE
>   	select ARCH_HAS_DMA_PREP_COHERENT
> +	select ARCH_HAS_DMA_SET_UNCACHED
> +	select ARCH_HAS_DMA_CLEAR_UNCACHED
>   	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>   	select ARCH_HAS_SYNC_DMA_FOR_CPU
>   	select ARCH_HAS_SETUP_DMA_OPS
> -	select DMA_DIRECT_REMAP
>   
>   config AS_HAS_INSN
>   	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index d919efab6eba..e07e53aea537 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -9,14 +9,21 @@
>   #include <linux/dma-map-ops.h>
>   #include <linux/mm.h>
>   #include <asm/cacheflush.h>
> +#include <soc/sifive/sifive_ccache.h>
>   
>   static bool noncoherent_supported;
>   
>   void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>   			      enum dma_data_direction dir)
>   {
> -	void *vaddr = phys_to_virt(paddr);
> +	void *vaddr;
>   
> +	if (sifive_ccache_handle_noncoherent()) {
> +		sifive_ccache_flush_range(paddr, size);
> +		return;
> +	}
> +
> +	vaddr = phys_to_virt(paddr);
>   	switch (dir) {
>   	case DMA_TO_DEVICE:
>   		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> @@ -35,8 +42,14 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
>   void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>   			   enum dma_data_direction dir)
>   {
> -	void *vaddr = phys_to_virt(paddr);
> +	void *vaddr;
> +
> +	if (sifive_ccache_handle_noncoherent()) {
> +		sifive_ccache_flush_range(paddr, size);
> +		return;
> +	}

ok, what happens if we have an system where the ccache and another level
of cache also requires maintenance operations?

>   
> +	vaddr = phys_to_virt(paddr);
>   	switch (dir) {
>   	case DMA_TO_DEVICE:
>   		break;
> @@ -49,10 +62,30 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
>   	}
>   }
>   
> +void *arch_dma_set_uncached(void *addr, size_t size)
> +{
> +	if (sifive_ccache_handle_noncoherent())
> +		return sifive_ccache_set_uncached(addr, size);
> +
> +	return addr;
> +}
> +
> +void arch_dma_clear_uncached(void *addr, size_t size)
> +{
> +	if (sifive_ccache_handle_noncoherent())
> +		sifive_ccache_clear_uncached(addr, size);
> +}
> +
>   void arch_dma_prep_coherent(struct page *page, size_t size)
>   {
>   	void *flush_addr = page_address(page);
>   
> +	if (sifive_ccache_handle_noncoherent()) {
> +		memset(flush_addr, 0, size);
> +		sifive_ccache_flush_range(__pa(flush_addr), size);
> +		return;
> +	}
> +
>   	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
>   }
>   

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
