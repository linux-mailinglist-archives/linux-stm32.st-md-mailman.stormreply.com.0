Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7620F1F1482
	for <lists+linux-stm32@lfdr.de>; Mon,  8 Jun 2020 10:30:53 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3DF43C36B22;
	Mon,  8 Jun 2020 08:30:53 +0000 (UTC)
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EC15BC36B23
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 Jun 2020 08:30:51 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id m2so5698979pjv.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 08 Jun 2020 01:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Sr4O+in7E3S8yGpfVSAumnolrH/mtR4MAGw7n2lSUi4=;
 b=moptvi0DYUIGze0sxGapOFQzHdn34hE207jfRTpbHONsJVGMYclaW933o/av3oG8CG
 Vuv/KoVfx1AI8AGmzrW5DacLpYSDCCa9nfxWdTJwyxWjNDMDYdnICwZh5brGMM8r1ZiT
 OAA9MmaR4rVNiQXY9uRhwIOejfHm/uYYEGMUMgw3dT+TwileefpJNWtOdCYsC45kFOLa
 +DdgPWAS2I6SbIwUspfrAqofBTLRIzBZ2JSR4vR9FnTaCKrDiB0a5aLiuiXW1FhyfV3s
 pIksOg51djhWhTBVsnrpqMjoUtQFLHvgFgzCkrqu48gxnjaStKkSDhCPxHkBhKTk8KyV
 HoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Sr4O+in7E3S8yGpfVSAumnolrH/mtR4MAGw7n2lSUi4=;
 b=bvTja0zj+/cjBSC5X86LwUQ/36hQJjNFhZecaEwMwkFy9ZcF8fQra9u3a3fZXTtLNN
 LSkXH1CXZedXU0by7FnlhTUqggolk9bWX/Py6TrGh6hUWF7kHnOvnCBQd5Nw7Q+kcpge
 Y6IRC1XMBg5DlUsvpiOa61Ir6mhHJThDWmbjXKTox60OkoUxiGn+fMwZRxzOQUP1UFT3
 J2grDw1RhcduqDK6tGDCjUNfK1SehSJUyTU5sTen4iBxPm3Vz1dvIel4vW92s2cH8tPc
 ivlj+zxb1r2gYhx8PaVI8XFiITPMLsLDgTWyjkGpdeb0FQ0MXesjLZoadhlIejwsPkMO
 Hedg==
X-Gm-Message-State: AOAM53132y85CB59HDk5mtBD5qsV+mxq4/CMSnOssAet6UImEGk0Q2MC
 RUAXPjiV9mL3BFx1aquBWjRo8I7chtU=
X-Google-Smtp-Source: ABdhPJwWeNEIRHE87XqxZWvoMrcDW/ma0+wwzJWzdrh9mEH1xMwsnwgl+Nww/37mNzaxFJbgWrKhDw==
X-Received: by 2002:a17:90a:cc5:: with SMTP id
 5mr15552855pjt.112.1591605050563; 
 Mon, 08 Jun 2020 01:30:50 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.42])
 by smtp.gmail.com with ESMTPSA id 27sm1210829pjg.19.2020.06.08.01.30.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 01:30:50 -0700 (PDT)
From: dillon.minfei@gmail.com
To: robh+dt@kernel.org, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 linux@armlinux.org.uk, vladimir.murzin@arm.com,
 kstewart@linuxfoundation.org, allison@lohutok.net, info@metux.net,
 tglx@linutronix.de
Date: Mon,  8 Jun 2020 16:30:38 +0800
Message-Id: <1591605038-8682-3-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
References: <1591605038-8682-1-git-send-email-dillon.minfei@gmail.com>
Cc: devicetree@vger.kernel.org, dillon min <dillon.minfei@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/2] arm-nommu: Add use_reserved_mem() to
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

From: dillon min <dillon.minfei@gmail.com>

Currently, we use dma direct to request coherent memory for driver on armv7m
platform if 'cacheid' is zero, but dma_direct_can_mmap() is return false,
dma_direct_mmap() return -ENXIO for CONFIG_MMU undefined platform.

so we have to back to use 'arm_nommu_dma_ops', add use_reserved_mem() to check
if device support global or device corherent memory. if yes, then call
set_dma_ops()

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
 arch/arm/mm/dma-mapping-nommu.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
index 287ef898a55e..e1c213fec152 100644
--- a/arch/arm/mm/dma-mapping-nommu.c
+++ b/arch/arm/mm/dma-mapping-nommu.c
@@ -14,6 +14,7 @@
 #include <asm/cacheflush.h>
 #include <asm/outercache.h>
 #include <asm/cp15.h>
+#include <linux/of.h>
 
 #include "dma.h"
 
@@ -188,6 +189,31 @@ const struct dma_map_ops arm_nommu_dma_ops = {
 };
 EXPORT_SYMBOL(arm_nommu_dma_ops);
 
+static bool use_reserved_mem(struct device *dev)
+{
+	struct device_node *np;
+
+	np = of_find_node_by_path("/reserved-memory/linux,dma");
+
+	if (np &&
+		of_device_is_compatible(np, "shared-dma-pool") &&
+		of_property_read_bool(np, "no-map") &&
+		of_property_read_bool(np, "linux,dma-default")) {
+		/* has global corherent mem support */
+		of_node_put(np);
+		return true;
+	}
+
+	np = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (np) {
+		/* has dev corherent mem support */
+		of_node_put(np);
+		return true;
+	}
+
+	return false;
+}
+
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 			const struct iommu_ops *iommu, bool coherent)
 {
@@ -206,6 +232,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		dev->archdata.dma_coherent = (get_cr() & CR_M) ? coherent : true;
 	}
 
-	if (!dev->archdata.dma_coherent)
+	if (!dev->archdata.dma_coherent || use_reserved_mem(dev))
 		set_dma_ops(dev, &arm_nommu_dma_ops);
 }
-- 
2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
