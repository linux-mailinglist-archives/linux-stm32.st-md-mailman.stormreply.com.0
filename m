Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6156C9DB42A
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Nov 2024 09:49:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24FDDC78036;
	Thu, 28 Nov 2024 08:49:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CE5E0C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Nov 2024 08:49:41 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS20fp6032587;
 Thu, 28 Nov 2024 09:49:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 f0OxH3wtdemYyz01Yb+Te/k2HhBq/Vf5wfmG702w8ds=; b=lenFKO0cjBOcKClN
 3jZQ8Xva9eGXdMPgxgvNBwicqik6OpsLQoGvA3oJPyskO+Cp+pc/o/vG+yPuYceh
 /a4+2jsMWRKbIzcyTYejBna410M46nvm1MiaqZCUGCj9XdGBg9ZuDS4tS222icL7
 y3AmgjT4oSyj8dzdnnQ/cD7RZzUjcu9IAvNb/KnybAaVgC96DDwje9O30SJQf3gi
 muzGBrubh3NNTS22Sp0CPeBQjPuxOh4evjk3KqrFmuvr/dwhwsAgwbmY4FbKeBz5
 /MEoSBYP9yeCzq2m73CBnkRYiq4yDu/K3AcCMhp0bm0kH153UKO0LPSC1e3UJB2i
 DUqfpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 436713k67r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Nov 2024 09:49:19 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 42D234005E;
 Thu, 28 Nov 2024 09:47:25 +0100 (CET)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BEB49269609;
 Thu, 28 Nov 2024 09:43:00 +0100 (CET)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 28 Nov
 2024 09:43:00 +0100
Received: from localhost (10.48.86.121) by SAFDAG1NODE1.st.com (10.75.90.17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Thu, 28 Nov
 2024 09:43:00 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Jerome
 Brunet" <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Thu, 28 Nov 2024 09:42:11 +0100
Message-ID: <20241128084219.2159197-5-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
References: <20241128084219.2159197-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.121]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: imx@lists.linux.dev, kernel test robot <lkp@intel.com>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v15 4/8] remoteproc: Rename load() operation
	to load_segments() in rproc_ops struct
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

With the introduction of the load_fw() operation in the rproc_ops
structure, we need to clarify the difference in the use of the load()
and load_fw() ops.

The legacy load() is dedicated to loading the ELF segments into memory.
Rename this to a more explicit name: load_segments().

Suggested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
Update vs version V14:
Fix: Rename missing load() to load_segments() in drivers/remoteproc/pru_rproc.c.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411281332.Ra70nJAW-lkp@intel.com/

---
 drivers/remoteproc/imx_dsp_rproc.c       | 2 +-
 drivers/remoteproc/imx_rproc.c           | 2 +-
 drivers/remoteproc/meson_mx_ao_arc.c     | 2 +-
 drivers/remoteproc/mtk_scp.c             | 2 +-
 drivers/remoteproc/pru_rproc.c           | 2 +-
 drivers/remoteproc/qcom_q6v5_adsp.c      | 2 +-
 drivers/remoteproc/qcom_q6v5_mss.c       | 2 +-
 drivers/remoteproc/qcom_q6v5_pas.c       | 4 ++--
 drivers/remoteproc/qcom_q6v5_wcss.c      | 4 ++--
 drivers/remoteproc/qcom_wcnss.c          | 2 +-
 drivers/remoteproc/rcar_rproc.c          | 2 +-
 drivers/remoteproc/remoteproc_core.c     | 4 ++--
 drivers/remoteproc/remoteproc_internal.h | 4 ++--
 drivers/remoteproc/st_remoteproc.c       | 2 +-
 drivers/remoteproc/st_slim_rproc.c       | 2 +-
 drivers/remoteproc/stm32_rproc.c         | 2 +-
 drivers/remoteproc/xlnx_r5_remoteproc.c  | 2 +-
 include/linux/remoteproc.h               | 4 ++--
 18 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 376187ad5754..a4a85fbce907 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -934,7 +934,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
 	.start		= imx_dsp_rproc_start,
 	.stop		= imx_dsp_rproc_stop,
 	.kick		= imx_dsp_rproc_kick,
-	.load		= imx_dsp_rproc_elf_load_segments,
+	.load_segments	= imx_dsp_rproc_elf_load_segments,
 	.parse_fw	= imx_dsp_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 800015ff7ff9..f45b3207f7e9 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -681,7 +681,7 @@ static const struct rproc_ops imx_rproc_ops = {
 	.stop		= imx_rproc_stop,
 	.kick		= imx_rproc_kick,
 	.da_to_va       = imx_rproc_da_to_va,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.parse_fw	= imx_rproc_parse_fw,
 	.find_loaded_rsc_table = imx_rproc_elf_find_loaded_rsc_table,
 	.get_loaded_rsc_table = imx_rproc_get_loaded_rsc_table,
diff --git a/drivers/remoteproc/meson_mx_ao_arc.c b/drivers/remoteproc/meson_mx_ao_arc.c
index f6744b538323..a1c8c0929ce3 100644
--- a/drivers/remoteproc/meson_mx_ao_arc.c
+++ b/drivers/remoteproc/meson_mx_ao_arc.c
@@ -137,7 +137,7 @@ static struct rproc_ops meson_mx_ao_arc_rproc_ops = {
 	.stop		= meson_mx_ao_arc_rproc_stop,
 	.da_to_va	= meson_mx_ao_arc_rproc_da_to_va,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.sanity_check	= rproc_elf_sanity_check,
 };
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e744c07507ee..4e9a8bf3bc6e 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -924,7 +924,7 @@ static int scp_stop(struct rproc *rproc)
 static const struct rproc_ops scp_ops = {
 	.start		= scp_start,
 	.stop		= scp_stop,
-	.load		= scp_load,
+	.load_segments	= scp_load,
 	.da_to_va	= scp_da_to_va,
 	.parse_fw	= scp_parse_fw,
 	.sanity_check	= rproc_elf_sanity_check,
diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 327f0c7ee3d6..0b2bf2574f74 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -1015,7 +1015,7 @@ static int pru_rproc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 	/* use a custom load function to deal with PRU-specific quirks */
-	rproc->ops->load = pru_rproc_load_elf_segments;
+	rproc->ops->load_segments = pru_rproc_load_elf_segments;
 
 	/* use a custom parse function to deal with PRU-specific resources */
 	rproc->ops->parse_fw = pru_rproc_parse_fw;
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 572dcb0f055b..aa9896930bcf 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -527,7 +527,7 @@ static const struct rproc_ops adsp_ops = {
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = adsp_parse_firmware,
-	.load = adsp_load,
+	.load_segments = adsp_load,
 	.panic = adsp_panic,
 };
 
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2a42215ce8e0..a8beac1deabe 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1687,7 +1687,7 @@ static const struct rproc_ops q6v5_ops = {
 	.start = q6v5_start,
 	.stop = q6v5_stop,
 	.parse_fw = qcom_q6v5_register_dump_segments,
-	.load = q6v5_load,
+	.load_segments = q6v5_load,
 	.panic = q6v5_panic,
 };
 
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ef82835e98a4..9b269ce390c1 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -436,7 +436,7 @@ static const struct rproc_ops adsp_ops = {
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
-	.load = adsp_load,
+	.load_segments = adsp_load,
 	.panic = adsp_panic,
 };
 
@@ -446,7 +446,7 @@ static const struct rproc_ops adsp_minidump_ops = {
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
-	.load = adsp_load,
+	.load_segments = adsp_load,
 	.panic = adsp_panic,
 	.coredump = adsp_minidump,
 };
diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index e913dabae992..44b5736dc8b9 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -771,7 +771,7 @@ static const struct rproc_ops q6v5_wcss_ipq8074_ops = {
 	.start = q6v5_wcss_start,
 	.stop = q6v5_wcss_stop,
 	.da_to_va = q6v5_wcss_da_to_va,
-	.load = q6v5_wcss_load,
+	.load_segments = q6v5_wcss_load,
 	.get_boot_addr = rproc_elf_get_boot_addr,
 };
 
@@ -779,7 +779,7 @@ static const struct rproc_ops q6v5_wcss_qcs404_ops = {
 	.start = q6v5_qcs404_wcss_start,
 	.stop = q6v5_wcss_stop,
 	.da_to_va = q6v5_wcss_da_to_va,
-	.load = q6v5_wcss_load,
+	.load_segments = q6v5_wcss_load,
 	.get_boot_addr = rproc_elf_get_boot_addr,
 	.parse_fw = qcom_register_dump_segments,
 };
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index a7bb9da27029..42102bc4c458 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -335,7 +335,7 @@ static const struct rproc_ops wcnss_ops = {
 	.stop = wcnss_stop,
 	.da_to_va = wcnss_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
-	.load = wcnss_load,
+	.load_segments = wcnss_load,
 };
 
 static irqreturn_t wcnss_wdog_interrupt(int irq, void *dev)
diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index cc17e8421f65..e36778fec072 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -142,7 +142,7 @@ static struct rproc_ops rcar_rproc_ops = {
 	.prepare	= rcar_rproc_prepare,
 	.start		= rcar_rproc_start,
 	.stop		= rcar_rproc_stop,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.parse_fw	= rcar_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8df4b2c59bb6..e4ad024efcda 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -2485,11 +2485,11 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	if (!rproc->ops->coredump)
 		rproc->ops->coredump = rproc_coredump;
 
-	if (rproc->ops->load || rproc->ops->load_fw)
+	if (rproc->ops->load_segments || rproc->ops->load_fw)
 		return 0;
 
 	/* Default to ELF loader if no load function is specified */
-	rproc->ops->load = rproc_elf_load_segments;
+	rproc->ops->load_segments = rproc_elf_load_segments;
 	rproc->ops->parse_fw = rproc_elf_load_rsc_table;
 	rproc->ops->find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table;
 	rproc->ops->sanity_check = rproc_elf_sanity_check;
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 2104ca449178..b898494600cf 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -167,8 +167,8 @@ u64 rproc_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 static inline
 int rproc_load_segments(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc->ops->load)
-		return rproc->ops->load(rproc, fw);
+	if (rproc->ops->load_segments)
+		return rproc->ops->load_segments(rproc, fw);
 
 	return -EINVAL;
 }
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index 1340be9d0110..8d6b75e91531 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -233,7 +233,7 @@ static const struct rproc_ops st_rproc_ops = {
 	.start			= st_rproc_start,
 	.stop			= st_rproc_stop,
 	.parse_fw		= st_rproc_parse_fw,
-	.load			= rproc_elf_load_segments,
+	.load_segments		= rproc_elf_load_segments,
 	.find_loaded_rsc_table	= rproc_elf_find_loaded_rsc_table,
 	.sanity_check		= rproc_elf_sanity_check,
 	.get_boot_addr		= rproc_elf_get_boot_addr,
diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
index 5412beb0a692..0f91d8f1e7c7 100644
--- a/drivers/remoteproc/st_slim_rproc.c
+++ b/drivers/remoteproc/st_slim_rproc.c
@@ -201,7 +201,7 @@ static const struct rproc_ops slim_rproc_ops = {
 	.stop		= slim_rproc_stop,
 	.da_to_va       = slim_rproc_da_to_va,
 	.get_boot_addr	= rproc_elf_get_boot_addr,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.sanity_check	= rproc_elf_sanity_check,
 };
 
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 8c7f7950b80e..7e8ffd9fcc57 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -667,7 +667,7 @@ static const struct rproc_ops st_rproc_ops = {
 	.attach		= stm32_rproc_attach,
 	.detach		= stm32_rproc_detach,
 	.kick		= stm32_rproc_kick,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.parse_fw	= stm32_rproc_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.get_loaded_rsc_table = stm32_rproc_get_loaded_rsc_table,
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 5aeedeaf3c41..59cfba0a02e7 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -864,7 +864,7 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.unprepare	= zynqmp_r5_rproc_unprepare,
 	.start		= zynqmp_r5_rproc_start,
 	.stop		= zynqmp_r5_rproc_stop,
-	.load		= rproc_elf_load_segments,
+	.load_segments	= rproc_elf_load_segments,
 	.parse_fw	= zynqmp_r5_parse_fw,
 	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
 	.sanity_check	= rproc_elf_sanity_check,
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index ba6fd560f7ba..55c20424a99f 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -374,7 +374,7 @@ enum rsc_handling_status {
  * @find_loaded_rsc_table: find the loaded resource table from firmware image
  * @get_loaded_rsc_table: get resource table installed in memory
  *			  by external entity
- * @load:		load firmware to memory, where the remote processor
+ * @load_segments:	load firmware ELF segment to memory, where the remote processor
  *			expects to find it
  * @sanity_check:	sanity check the fw image
  * @get_boot_addr:	get boot address to entry point specified in firmware
@@ -402,7 +402,7 @@ struct rproc_ops {
 				struct rproc *rproc, const struct firmware *fw);
 	struct resource_table *(*get_loaded_rsc_table)(
 				struct rproc *rproc, size_t *size);
-	int (*load)(struct rproc *rproc, const struct firmware *fw);
+	int (*load_segments)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 	unsigned long (*panic)(struct rproc *rproc);
-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
