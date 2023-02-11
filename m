Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA046977E7
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7661CC6A614;
	Wed, 15 Feb 2023 08:18:43 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F05BFC6A5EA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 03:18:46 +0000 (UTC)
Received: from localhost (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8B4A56602125;
 Sat, 11 Feb 2023 03:18:46 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676085526;
 bh=9SuKyW5m2s3LuV67I9467kX5ZI8GexmXrVSVNnkz2OQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hMTt6dPu/18IXFr94zL95Pql9lUdJQIC8cRbs4VqMuTNSx9GF2XloISZKM+sBOr4u
 CsboPdGCB0WK1VYgN2LIAMbtwzKUrSMRGelHNbGahZm9MERYVOPB8944+pwz+OX5QY
 EBjcqKPDg+yy/WacrnF+ow+01z55aOeOlOsdd3WISdMKgdS09bvoU5aZLZej5AIrf1
 NmctoUae4i0AnT+Vj5b0hIxO2usmUimXWT4H/GLzMlUr+AVnEtuV2SxrbkvvUT7Zjl
 U/NN9R5hqCyffo4/qvcZlfZbXKDt+Gj2/DfVtf8HPNuY0Wj2mBlmNQdJzIFbBHH9RC
 rhRwKeCL0yLKg==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>
Date: Sat, 11 Feb 2023 05:18:14 +0200
Message-Id: <20230211031821.976408-6-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:41 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 05/12] riscv: Implement non-coherent DMA
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: Emil Renner Berthing <kernel@esmil.dk>

This variant is used on the StarFive JH7100 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/riscv/Kconfig              |  6 ++++--
 arch/riscv/mm/dma-noncoherent.c | 37 +++++++++++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 9c687da7756d..05f6c77faf6f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -232,12 +232,14 @@ config LOCKDEP_SUPPORT
 	def_bool y
 
 config RISCV_DMA_NONCOHERENT
-	bool
+	bool "Support non-coherent DMA"
+	default SOC_STARFIVE
 	select ARCH_HAS_DMA_PREP_COHERENT
+	select ARCH_HAS_DMA_SET_UNCACHED
+	select ARCH_HAS_DMA_CLEAR_UNCACHED
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SETUP_DMA_OPS
-	select DMA_DIRECT_REMAP
 
 config AS_HAS_INSN
 	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index d919efab6eba..e07e53aea537 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -9,14 +9,21 @@
 #include <linux/dma-map-ops.h>
 #include <linux/mm.h>
 #include <asm/cacheflush.h>
+#include <soc/sifive/sifive_ccache.h>
 
 static bool noncoherent_supported;
 
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 			      enum dma_data_direction dir)
 {
-	void *vaddr = phys_to_virt(paddr);
+	void *vaddr;
 
+	if (sifive_ccache_handle_noncoherent()) {
+		sifive_ccache_flush_range(paddr, size);
+		return;
+	}
+
+	vaddr = phys_to_virt(paddr);
 	switch (dir) {
 	case DMA_TO_DEVICE:
 		ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
@@ -35,8 +42,14 @@ void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 			   enum dma_data_direction dir)
 {
-	void *vaddr = phys_to_virt(paddr);
+	void *vaddr;
+
+	if (sifive_ccache_handle_noncoherent()) {
+		sifive_ccache_flush_range(paddr, size);
+		return;
+	}
 
+	vaddr = phys_to_virt(paddr);
 	switch (dir) {
 	case DMA_TO_DEVICE:
 		break;
@@ -49,10 +62,30 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 	}
 }
 
+void *arch_dma_set_uncached(void *addr, size_t size)
+{
+	if (sifive_ccache_handle_noncoherent())
+		return sifive_ccache_set_uncached(addr, size);
+
+	return addr;
+}
+
+void arch_dma_clear_uncached(void *addr, size_t size)
+{
+	if (sifive_ccache_handle_noncoherent())
+		sifive_ccache_clear_uncached(addr, size);
+}
+
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	void *flush_addr = page_address(page);
 
+	if (sifive_ccache_handle_noncoherent()) {
+		memset(flush_addr, 0, size);
+		sifive_ccache_flush_range(__pa(flush_addr), size);
+		return;
+	}
+
 	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
 }
 
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
