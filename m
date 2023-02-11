Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A84396977E6
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 63D42C6A611;
	Wed, 15 Feb 2023 08:18:43 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 797E7C6A5EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 11 Feb 2023 03:18:44 +0000 (UTC)
Received: from localhost (unknown [86.120.32.152])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1719D6602112;
 Sat, 11 Feb 2023 03:18:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676085524;
 bh=dWT0RanDNiM3R2DCgFc/XbzaC63mZATcL9ooscBLbYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OEECfIzkegZFxQGlNbEk0xpVXMYbfsjuxNV0jzVV+mhag3vfoFisKqwcwAejSdADU
 c2tk68Yksshis0/Wo96/mdHLwprlFo1d7gT4NWnVZo4FhmuA3vb8qRWnxx5jPtgXWv
 b/pV/VG5UGPafKrQc9OH4xX5/PaK4lgE+77yMgpU1Bz0QdUXAVG4RG5L9OgAoYqk8P
 iQzRVEev8TgYOSWRcZ+nLYNmv7Ycrz7LIMBI0fVjR8NpLZy9o8IZDtO3Y2KKPhWK6X
 asyOruKtVqPgbh/86k8oWarMwscItXxCD4n4rBW0WRhCtDtEcFkJUN2o7DMhhM26VZ
 Q2BNo4v2uF72Q==
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
Date: Sat, 11 Feb 2023 05:18:13 +0200
Message-Id: <20230211031821.976408-5-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:41 +0000
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kernel@collabora.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 04/12] soc: sifive: ccache: Add non-coherent
	DMA handling
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

Add functions to flush the caches and handle non-coherent DMA.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
[replace <asm/cacheflush.h> with <linux/cacheflush.h>]
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/soc/sifive/sifive_ccache.c | 60 +++++++++++++++++++++++++++++-
 include/soc/sifive/sifive_ccache.h | 21 +++++++++++
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 676468c35859..0062635d845f 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -8,13 +8,16 @@
 
 #define pr_fmt(fmt) "CCACHE: " fmt
 
+#include <linux/align.h>
 #include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/device.h>
 #include <linux/bitfield.h>
+#include <linux/cacheflush.h>
 #include <asm/cacheinfo.h>
+#include <asm/page.h>
 #include <soc/sifive/sifive_ccache.h>
 
 #define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
@@ -39,10 +42,14 @@
 #define SIFIVE_CCACHE_CONFIG_SETS_MASK GENMASK_ULL(23, 16)
 #define SIFIVE_CCACHE_CONFIG_BLKS_MASK GENMASK_ULL(31, 24)
 
+#define SIFIVE_CCACHE_FLUSH64 0x200
+#define SIFIVE_CCACHE_FLUSH32 0x240
+
 #define SIFIVE_CCACHE_WAYENABLE 0x08
 #define SIFIVE_CCACHE_ECCINJECTERR 0x40
 
 #define SIFIVE_CCACHE_MAX_ECCINTR 4
+#define SIFIVE_CCACHE_LINE_SIZE 64
 
 static void __iomem *ccache_base;
 static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
@@ -125,6 +132,47 @@ int unregister_sifive_ccache_error_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(unregister_sifive_ccache_error_notifier);
 
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+static phys_addr_t uncached_offset;
+DEFINE_STATIC_KEY_FALSE(sifive_ccache_handle_noncoherent_key);
+
+void sifive_ccache_flush_range(phys_addr_t start, size_t len)
+{
+	phys_addr_t end = start + len;
+	phys_addr_t line;
+
+	if (!len)
+		return;
+
+	mb();
+	for (line = ALIGN_DOWN(start, SIFIVE_CCACHE_LINE_SIZE); line < end;
+			line += SIFIVE_CCACHE_LINE_SIZE) {
+#ifdef CONFIG_32BIT
+		writel(line >> 4, ccache_base + SIFIVE_CCACHE_FLUSH32);
+#else
+		writeq(line, ccache_base + SIFIVE_CCACHE_FLUSH64);
+#endif
+		mb();
+	}
+}
+EXPORT_SYMBOL_GPL(sifive_ccache_flush_range);
+
+void *sifive_ccache_set_uncached(void *addr, size_t size)
+{
+	phys_addr_t phys_addr = __pa(addr) + uncached_offset;
+	void *mem_base;
+
+	mem_base = memremap(phys_addr, size, MEMREMAP_WT);
+	if (!mem_base) {
+		pr_err("%s memremap failed for addr %p\n", __func__, addr);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return mem_base;
+}
+EXPORT_SYMBOL_GPL(sifive_ccache_set_uncached);
+#endif /* CONFIG_RISCV_DMA_NONCOHERENT */
+
 static int ccache_largest_wayenabled(void)
 {
 	return readl(ccache_base + SIFIVE_CCACHE_WAYENABLE) & 0xFF;
@@ -213,6 +261,7 @@ static int __init sifive_ccache_init(void)
 	int i, rc, intr_num;
 	const struct of_device_id *match;
 	unsigned long broken_irqs;
+	u64 __maybe_unused offset;
 
 	np = of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
 	if (!np)
@@ -258,6 +307,15 @@ static int __init sifive_ccache_init(void)
 	}
 	of_node_put(np);
 
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+	if (!of_property_read_u64(np, "uncached-offset", &offset)) {
+		uncached_offset = offset;
+		static_branch_enable(&sifive_ccache_handle_noncoherent_key);
+		riscv_cbom_block_size = SIFIVE_CCACHE_LINE_SIZE;
+		riscv_noncoherent_supported();
+	}
+#endif
+
 	ccache_config_read();
 
 	ccache_cache_ops.get_priv_group = ccache_get_priv_group;
@@ -278,4 +336,4 @@ static int __init sifive_ccache_init(void)
 	return rc;
 }
 
-device_initcall(sifive_ccache_init);
+arch_initcall(sifive_ccache_init);
diff --git a/include/soc/sifive/sifive_ccache.h b/include/soc/sifive/sifive_ccache.h
index 4d4ed49388a0..d349ccb3969b 100644
--- a/include/soc/sifive/sifive_ccache.h
+++ b/include/soc/sifive/sifive_ccache.h
@@ -7,10 +7,31 @@
 #ifndef __SOC_SIFIVE_CCACHE_H
 #define __SOC_SIFIVE_CCACHE_H
 
+#include <linux/io.h>
+#include <linux/jump_label.h>
+
 extern int register_sifive_ccache_error_notifier(struct notifier_block *nb);
 extern int unregister_sifive_ccache_error_notifier(struct notifier_block *nb);
 
 #define SIFIVE_CCACHE_ERR_TYPE_CE 0
 #define SIFIVE_CCACHE_ERR_TYPE_UE 1
 
+DECLARE_STATIC_KEY_FALSE(sifive_ccache_handle_noncoherent_key);
+
+static inline bool sifive_ccache_handle_noncoherent(void)
+{
+#ifdef CONFIG_SIFIVE_CCACHE
+	return static_branch_unlikely(&sifive_ccache_handle_noncoherent_key);
+#else
+	return false;
+#endif
+}
+
+void sifive_ccache_flush_range(phys_addr_t start, size_t len);
+void *sifive_ccache_set_uncached(void *addr, size_t size);
+static inline void sifive_ccache_clear_uncached(void *addr, size_t size)
+{
+	memunmap(addr);
+}
+
 #endif /* __SOC_SIFIVE_CCACHE_H */
-- 
2.39.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
