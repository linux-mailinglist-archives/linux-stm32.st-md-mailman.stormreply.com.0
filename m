Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eG0dAu/PAmq7xAEAu9opvQ:T2
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB5551B648
	for <lists+linux-stm32@lfdr.de>; Tue, 12 May 2026 08:59:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AED2CC90080;
	Tue, 12 May 2026 06:59:58 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010041.outbound.protection.outlook.com [52.101.201.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5504DC8F288
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 11 May 2026 21:18:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tYN+lUSQhxfZfjBlC/2Rr7MNv5Yy8FewDA3MKRK8rblfu9Z20oENv6v6kYnNHehV4mKQ+tEL9IaYNRf2ZtIoUzjUZzSCrwRiCD/bqv0rM4iPwQJyp3+OtQwixAvkJVIAzu18MTPsNjIzWJWaXp5vR5CzheZ8nj5i+oZvWKsLtT/vyr+5T5crEKDeGA+svdUrMC732uCYrY6Ve4R2TJ1GIpbRXmmqu8V8Kuo0ONz4hzeHjnXs1VKsvU9BmNI8o7NiExWrhGnMF/UMeQ/Wif3wk2dC4dgOhrxqqv4B5BXLLphVGiyKBkxulGghnYF4wJycqXVyN+HVCghEjoVpvSAYCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pSBeNyxP/ruAZGXXJ4WWjx7AmL+RBdOwtT84bYwU3U8=;
 b=gMoFIX3IyJcnNQpFq+t01ipLAHdy8XXSCqRKFB7eonaiWXz+VbSRVTmpZd4oiw6kJd/tN6GZH6P1ZMSzaCDRjlMpT/xNpqo7p1DcK696BOcGT44gckNUNuDHZI5AcUeunRHmaE2PZ2887/4B6Z3/EkUZIZn1WsZ1c7Bz/kipxBYSKAIfbhY7Zi1ueDTpIRr8o5anZknSeOsAJ7FItxeemZpq4cmOu4iwu9Le7vNxZRlo40gkZzHD1YHnTefG+AHlQ7G+yvQ59FBDAO7poIqjBqcl2vzHsMFPn+2Mf8rJ23SazhWCUsgi7yQLuzBwEGGka7jCX8c/WVSRv/Sw3HTSXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSBeNyxP/ruAZGXXJ4WWjx7AmL+RBdOwtT84bYwU3U8=;
 b=My2CufKpZfm5WOQNorbAFuKXR1Wavg2vfAeLq85iqV9JHoM4NhzUHk4GkHbcx/Y0G6SCyOv454qkyhlPyKAPQlfaqLUPqPPT/NPTSwddIh9Y+TXrU293+judvi/aOvd3wUu9WDjoG6OERop7xMpTSlWxlwQB9CfQir3jvnIKdmA=
Received: from SA1P222CA0045.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::22)
 by LV8PR12MB9264.namprd12.prod.outlook.com (2603:10b6:408:1e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 21:18:45 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::cb) by SA1P222CA0045.outlook.office365.com
 (2603:10b6:806:2d0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 21:18:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 21:18:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 11 May
 2026 16:18:44 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 May
 2026 16:18:44 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Mon, 11 May 2026 16:18:43 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>
Date: Mon, 11 May 2026 14:18:39 -0700
Message-ID: <20260511211841.284809-3-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511211841.284809-1-ben.levinsky@amd.com>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB03.amd.com: ben.levinsky@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|LV8PR12MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: 9be63173-43ce-4da9-1a68-08deafa2e26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|36860700016|376014|82310400026|56012099003|18002099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: rHAUq8Gi/G4zTNADbajA/aQoAlriMRdEw52rNV5kHvpD4ICCIBcU4th4iHHZZ1bVmrdE7DEEWueEVwKJ/PLjJOcw8H66ulqR+ddIAegZt/FaHfhtvXrU6rqkvDyeMf1eDWqcb94jDz0B36n+oKVkgPiQfNZXFVyF3g3U7pTB4et/YrIx5CpKjIpPMM5VMbXUobd7nRjsNDBQEZHfQZSBXLXLeC2CX43Om0cq/iNvXF1OvICiqp7x2Q/sN36VBhN3pmogfr1A3putZfyB5VxmJj0qSkEiJ0p4l8706YYbb9Z3DUHbd/LxMN4gtqhOMgfilSxI3XPDfRNQPLODsvmimQAm2LWV7tjRHkid9PzCGieRg35EHyCFlaZW1BEeZyFyZiofn3c1w9VfizKU7Q1RFXBom3z5Za4ccvIEixgRRrIqj9RCoTxe08vOd9eEudLI8HLlkeu4Z08y4ElqfQXcUaEbc2DmCJZJEmdJ/ilhPyIlfjGlt1T+ZWL7xh6yC5sHM4c2M0kitUjuCQsJPLh1U1waUcyBdRrqsxHKNrLK7jK/kOxDHdSOTBq3Hnt+lnte+whWt3fxzhPT1AjbvdXVmJnTzyui+Q1Ry4c5OuYpb8D7aSAoIfwzSst3zwQKR2WaxVArp7+nGeNaAtJ1ehla/BHIXWcKEJmZ/yi1Trjsti5vRtZ2NF4I3m+OcJ0h3a3n+d6BLr1k2ZJyBz4WqFpmXmnI7Jf9qgYolY9mlC7zPxU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(82310400026)(56012099003)(18002099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ujqNltU4Imk8NgKwuPxeCXo4u8rqncPn8udQzONPsgyxCbHoSHGuUvYAXJgRjD1RAFuwJq+z/jqgZfQ7B4wJiwW4VT7cNcm17MBN1vGO2pyA4FM8Cl3yAG56tr7jZqwVA3SWdjo3su2EzZGZUoYDN/OQ0fbqXHjWiN+U5JmD2xK/idg3+2PUfsmnslEelCDJFmwzCjgBWoZ7M7BldTTCA/QqcSI7JI0TbP4KzRln4f30CFAmr0yF947A4I1NUtjBoI4LvYoz2zuDiLNh/bqZmB1JUgVBG4S5h87vl5sbX8dxMWygV0tzWKDUZFOssODFP6XmTBUlzkIoxGjMS7alkTHKqg+1AgqhIfIKruuzSy0GfNjHY9upnSw4s003HhaRUZ97IwhZ2fzOKhTbklO0b15aENSLtYQOQdmhW+8WQ0tNqlquXPLs/yjawoPgUdkx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:18:45.1247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9be63173-43ce-4da9-1a68-08deafa2e26e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9264
X-Mailman-Approved-At: Tue, 12 May 2026 06:59:56 +0000
Cc: imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, tanmay.shah@amd.com,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Magnus
 Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/4] remoteproc: switch exact-match drivers to
	wc-ioremap callbacks
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
X-Rspamd-Queue-Id: 2EB5551B648
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:patrice.chotard@foss.st.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,st-md-mailman.stormreply.com,gmail.com,glider.be,amd.com,nxp.com,pengutronix.de,vger.kernel.org,foss.st.com,lists.infradead.org];
	FORGED_SENDER(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,amd.com:email,amd.com:mid,st-md-mailman.stormreply.com:rdns,res.name:url,st.com:email];
	DKIM_TRACE(0.00)[amd.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.829];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: add header
X-Spam: Yes

Replace the exact-match carveout map and unmap callbacks in the
existing remoteproc drivers with the common wc-ioremap helpers. Leave
the zynqmp R5 TCM callbacks alone because they also clear the mapped
memory and are not exact matches.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/imx_dsp_rproc.c      | 36 ++++---------------
 drivers/remoteproc/imx_rproc.c          | 32 ++---------------
 drivers/remoteproc/rcar_rproc.c         | 33 ++---------------
 drivers/remoteproc/st_remoteproc.c      | 31 ++--------------
 drivers/remoteproc/stm32_rproc.c        | 34 ++----------------
 drivers/remoteproc/xlnx_r5_remoteproc.c | 47 +++----------------------
 6 files changed, 18 insertions(+), 195 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 008741af9f11..2d9f14fbef1d 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -644,32 +644,6 @@ static void imx_dsp_rproc_free_mbox(struct imx_dsp_rproc *priv)
 	mbox_free_channel(priv->rxdb_ch);
 }
 
-static int imx_dsp_rproc_mem_alloc(struct rproc *rproc,
-				   struct rproc_mem_entry *mem)
-{
-	struct device *dev = rproc->dev.parent;
-	void *va;
-
-	va = ioremap_wc(mem->dma, mem->len);
-	if (!va) {
-		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
-			&mem->dma, mem->len);
-		return -ENOMEM;
-	}
-
-	mem->va = va;
-
-	return 0;
-}
-
-static int imx_dsp_rproc_mem_release(struct rproc *rproc,
-				     struct rproc_mem_entry *mem)
-{
-	iounmap(mem->va);
-
-	return 0;
-}
-
 /**
  * imx_dsp_rproc_add_carveout() - request mailbox channels
  * @priv: private data pointer
@@ -700,8 +674,10 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 
 		/* Register memory region */
 		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)att->sa,
-					   att->size, da, imx_dsp_rproc_mem_alloc,
-					   imx_dsp_rproc_mem_release, "dsp_mem");
+					   att->size, da,
+					   rproc_mem_entry_ioremap_wc,
+					   rproc_mem_entry_iounmap,
+					   "dsp_mem");
 
 		if (mem)
 			rproc_coredump_add_segment(rproc, da, att->size);
@@ -732,8 +708,8 @@ static int imx_dsp_rproc_add_carveout(struct imx_dsp_rproc *priv)
 		/* Register memory region */
 		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)res.start,
 					   resource_size(&res), da,
-					    imx_dsp_rproc_mem_alloc,
-					    imx_dsp_rproc_mem_release,
+					   rproc_mem_entry_ioremap_wc,
+					   rproc_mem_entry_iounmap,
 					   "%.*s", strchrnul(res.name, '@') - res.name, res.name);
 		if (!mem)
 			return -ENOMEM;
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7f54322244ac..6249815b54d8 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -600,35 +600,6 @@ static void *imx_rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *i
 	return va;
 }
 
-static int imx_rproc_mem_alloc(struct rproc *rproc,
-			       struct rproc_mem_entry *mem)
-{
-	struct device *dev = rproc->dev.parent;
-	void *va;
-
-	dev_dbg(dev, "map memory: %p+%zx\n", &mem->dma, mem->len);
-	va = ioremap_wc(mem->dma, mem->len);
-	if (IS_ERR_OR_NULL(va)) {
-		dev_err(dev, "Unable to map memory region: %p+%zx\n",
-			&mem->dma, mem->len);
-		return -ENOMEM;
-	}
-
-	/* Update memory entry va */
-	mem->va = va;
-
-	return 0;
-}
-
-static int imx_rproc_mem_release(struct rproc *rproc,
-				 struct rproc_mem_entry *mem)
-{
-	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
-	iounmap(mem->va);
-
-	return 0;
-}
-
 static int imx_rproc_sm_lmm_prepare(struct rproc *rproc)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -692,7 +663,8 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		/* Register memory region */
 		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
 					   resource_size(&res), da,
-					   imx_rproc_mem_alloc, imx_rproc_mem_release,
+					   rproc_mem_entry_ioremap_wc,
+					   rproc_mem_entry_iounmap,
 					   "%.*s", strchrnul(res.name, '@') - res.name,
 					   res.name);
 		if (!mem)
diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index 3c25625f966d..e3121fadd292 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -19,35 +19,6 @@ struct rcar_rproc {
 	struct reset_control *rst;
 };
 
-static int rcar_rproc_mem_alloc(struct rproc *rproc,
-				 struct rproc_mem_entry *mem)
-{
-	struct device *dev = &rproc->dev;
-	void *va;
-
-	dev_dbg(dev, "map memory: %pa+%zx\n", &mem->dma, mem->len);
-	va = ioremap_wc(mem->dma, mem->len);
-	if (!va) {
-		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
-			&mem->dma, mem->len);
-		return -ENOMEM;
-	}
-
-	/* Update memory entry va */
-	mem->va = va;
-
-	return 0;
-}
-
-static int rcar_rproc_mem_release(struct rproc *rproc,
-				   struct rproc_mem_entry *mem)
-{
-	dev_dbg(&rproc->dev, "unmap memory: %pa\n", &mem->dma);
-	iounmap(mem->va);
-
-	return 0;
-}
-
 static int rcar_rproc_prepare(struct rproc *rproc)
 {
 	struct device *dev = rproc->dev.parent;
@@ -73,8 +44,8 @@ static int rcar_rproc_prepare(struct rproc *rproc)
 		mem = rproc_mem_entry_init(dev, NULL,
 					   res.start,
 					   resource_size(&res), da,
-					   rcar_rproc_mem_alloc,
-					   rcar_rproc_mem_release,
+					   rproc_mem_entry_ioremap_wc,
+					   rproc_mem_entry_iounmap,
 					   res.name);
 
 		if (!mem)
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index a07edf7217d2..486180cdccb4 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -88,33 +88,6 @@ static void st_rproc_kick(struct rproc *rproc, int vqid)
 		dev_err(dev, "failed to send message via mbox: %d\n", ret);
 }
 
-static int st_rproc_mem_alloc(struct rproc *rproc,
-			      struct rproc_mem_entry *mem)
-{
-	struct device *dev = rproc->dev.parent;
-	void *va;
-
-	va = ioremap_wc(mem->dma, mem->len);
-	if (!va) {
-		dev_err(dev, "Unable to map memory region: %pa+%zx\n",
-			&mem->dma, mem->len);
-		return -ENOMEM;
-	}
-
-	/* Update memory entry va */
-	mem->va = va;
-
-	return 0;
-}
-
-static int st_rproc_mem_release(struct rproc *rproc,
-				struct rproc_mem_entry *mem)
-{
-	iounmap(mem->va);
-
-	return 0;
-}
-
 static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
 	struct device *dev = rproc->dev.parent;
@@ -138,8 +111,8 @@ static int st_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 			mem = rproc_mem_entry_init(dev, NULL,
 						   (dma_addr_t)res.start,
 						   resource_size(&res), res.start,
-						   st_rproc_mem_alloc,
-						   st_rproc_mem_release,
+						   rproc_mem_entry_ioremap_wc,
+						   rproc_mem_entry_iounmap,
 						   "%.*s",
 						   strchrnul(res.name, '@') - res.name,
 						   res.name);
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 632614013dc6..7ac8265b60ac 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -113,35 +113,6 @@ static int stm32_rproc_pa_to_da(struct rproc *rproc, phys_addr_t pa, u64 *da)
 	return -EINVAL;
 }
 
-static int stm32_rproc_mem_alloc(struct rproc *rproc,
-				 struct rproc_mem_entry *mem)
-{
-	struct device *dev = rproc->dev.parent;
-	void *va;
-
-	dev_dbg(dev, "map memory: %pad+%zx\n", &mem->dma, mem->len);
-	va = (__force void *)ioremap_wc(mem->dma, mem->len);
-	if (IS_ERR_OR_NULL(va)) {
-		dev_err(dev, "Unable to map memory region: %pad+0x%zx\n",
-			&mem->dma, mem->len);
-		return -ENOMEM;
-	}
-
-	/* Update memory entry va */
-	mem->va = va;
-
-	return 0;
-}
-
-static int stm32_rproc_mem_release(struct rproc *rproc,
-				   struct rproc_mem_entry *mem)
-{
-	dev_dbg(rproc->dev.parent, "unmap memory: %pa\n", &mem->dma);
-	iounmap((__force __iomem void *)mem->va);
-
-	return 0;
-}
-
 static int stm32_rproc_of_memory_translations(struct platform_device *pdev,
 					      struct stm32_rproc *ddata)
 {
@@ -237,8 +208,8 @@ static int stm32_rproc_prepare(struct rproc *rproc)
 			mem = rproc_mem_entry_init(dev, NULL,
 						   (dma_addr_t)res.start,
 						   resource_size(&res), da,
-						   stm32_rproc_mem_alloc,
-						   stm32_rproc_mem_release,
+						   rproc_mem_entry_ioremap_wc,
+						   rproc_mem_entry_iounmap,
 						   "%.*s", strchrnul(res.name, '@') - res.name,
 						   res.name);
 			if (mem)
@@ -957,4 +928,3 @@ MODULE_DESCRIPTION("STM32 Remote Processor Control Driver");
 MODULE_AUTHOR("Ludovic Barre <ludovic.barre@st.com>");
 MODULE_AUTHOR("Fabien Dessenne <fabien.dessenne@st.com>");
 MODULE_LICENSE("GPL v2");
-
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index 45a62cb98072..e5d1903c9636 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -447,45 +447,6 @@ static int zynqmp_r5_rproc_stop(struct rproc *rproc)
 	return ret;
 }
 
-/*
- * zynqmp_r5_mem_region_map()
- * @rproc: single R5 core's corresponding rproc instance
- * @mem: mem descriptor to map reserved memory-regions
- *
- * Callback to map va for memory-region's carveout.
- *
- * return 0 on success, otherwise non-zero value on failure
- */
-static int zynqmp_r5_mem_region_map(struct rproc *rproc,
-				    struct rproc_mem_entry *mem)
-{
-	void __iomem *va;
-
-	va = ioremap_wc(mem->dma, mem->len);
-	if (IS_ERR_OR_NULL(va))
-		return -ENOMEM;
-
-	mem->va = (void *)va;
-
-	return 0;
-}
-
-/*
- * zynqmp_r5_rproc_mem_unmap
- * @rproc: single R5 core's corresponding rproc instance
- * @mem: mem entry to unmap
- *
- * Unmap memory-region carveout
- *
- * return: always returns 0
- */
-static int zynqmp_r5_mem_region_unmap(struct rproc *rproc,
-				      struct rproc_mem_entry *mem)
-{
-	iounmap((void __iomem *)mem->va);
-	return 0;
-}
-
 /*
  * add_mem_regions_carveout()
  * @rproc: single R5 core's corresponding rproc instance
@@ -522,8 +483,8 @@ static int add_mem_regions_carveout(struct rproc *rproc)
 			rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
 							 (dma_addr_t)res.start,
 							 resource_size(&res), res.start,
-							 zynqmp_r5_mem_region_map,
-							 zynqmp_r5_mem_region_unmap,
+							 rproc_mem_entry_ioremap_wc,
+							 rproc_mem_entry_iounmap,
 							 "%.*s",
 							 strchrnul(res.name, '@') - res.name,
 							 res.name);
@@ -560,8 +521,8 @@ static int add_sram_carveouts(struct rproc *rproc)
 		rproc_mem = rproc_mem_entry_init(&rproc->dev, NULL,
 						 dma_addr,
 						 len, da,
-						 zynqmp_r5_mem_region_map,
-						 zynqmp_r5_mem_region_unmap,
+						 rproc_mem_entry_ioremap_wc,
+						 rproc_mem_entry_iounmap,
 						 sram->sram_res.name);
 		if (!rproc_mem) {
 			dev_err(&rproc->dev, "failed to add sram %s da=0x%x, size=0x%lx",
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
