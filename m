Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBUcHgCZumnaZQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 13:22:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3851C2BB608
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Mar 2026 13:22:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EBCFFC8F270;
	Wed, 18 Mar 2026 12:22:23 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C4B44C8F263
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 18:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVxK2GmIC2Hiy+Ic1OMiXl4sI64Di/q92vx9yltwLuoFMPv8VpD20IfaLYA2QRlRK09oO/uQXI0H0XKrbvzN3dyvOgfDKcgwEcUoJwq8Nyk9P20J7GrJphuqOOPXomvs/LLLks6bollMZH+PNJl89ak7F8BDFh+DoeQmTaplAf4v2usaZL0LFI7eBBDGYOhd/wuJ7if5ctL0G5fwXhTaOT42/lVQ0AhgosNapfZXKJtwrO0Jwu6Q7quketMMUPRm+DsJvKEzoZ/pQ9LPV1Gtrl+ceQvmwO0FTOAYJjGxfhVUdnpkZXv+M5f1DLHB488yldpBeG9mMn82FkvW5jS51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmoFW7AW1ts8pQm2OeeMK1W6aYEUZbml9AF8+fhKeuQ=;
 b=RJNew9npiVNRDdz/hadCW5vvWpljlhpLnEw727X7zsJDdZxZJ8axxcBbo5kr2svOiv38pcWcPpTZIVQTTe61Xk9qtAcSYGL6ywXsqc1IDQUkONBvKnMb7aL6/MmgMBZtSY4GN96VkacwPaZ/H4hoIpjEGlnTY5wwPTQUBVTvBE+Y0Eav/7rGsGJlcv/wVq5B+kJnO+yk6sCejhceLcyJ5704SXKpWwjUJ3xt0eZc3ZDaZTQJutOP4eI2nsMu10sC1uF/+u+Gm0g76pyDIf5F4VZetIoP4QlTxGfkBb3QynMfjD+RdG1VUTDRe9pcZQUiyt1TfyBmAX9mukiACHzV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmoFW7AW1ts8pQm2OeeMK1W6aYEUZbml9AF8+fhKeuQ=;
 b=RC9tDNRuzEsd9rlg6NTxFYO7gECW+lUDBixI9m/ed+io2MSfID3TTjxqdIf+aAtXlTZSsrQfIEjC6bxt+2NKmAPWEULqiKZlucL9yojB7/092Z6Zk7faT6EIF1kDXlrfoeKeSS/ncep16gTP7TPRQUUjSs8/tZucJsvnI0xzpByab5rhlpLMVCFWBV560whjxRwKpo07Hu3WQsvAiYYlpSrTw1sewK9I4ylCRuJDUeO1PMbX+ROscbcO2kBkL8wiRR81DrGFTADCz2OIyZWCs7S3bG3LL0bzhSBG+ua3I91GgpCEhM1XBLo8LqMYgb8ZmWbDeH+joYz+3hZSnjKJhA==
Received: from AM9P250CA0009.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::14)
 by AS8PR10MB7184.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 18:03:52 +0000
Received: from AM3PEPF0000A793.eurprd04.prod.outlook.com
 (2603:10a6:20b:21c:cafe::73) by AM9P250CA0009.outlook.office365.com
 (2603:10a6:20b:21c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 18:03:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A793.mail.protection.outlook.com (10.167.16.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 18:03:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 19:06:09 +0100
Received: from localhost (10.252.21.194) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 19:03:51 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Date: Tue, 17 Mar 2026 19:03:24 +0100
Message-ID: <20260317180329.1207625-4-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.21.194]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A793:EE_|AS8PR10MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: efb172cd-1bf4-49ae-83d6-08de844f8c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|376014|1800799024|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VkwYpA+j9Pxq5U0LuNz8FpasyG1G6To0yYCY62+wXTHLHKrl0fHbdrFW+URLDsk6dM7ApTzOa6KBOpoZEL5iYU9i3fv8xe2lVf+UDdeiQ9sGBOz1XLNdOgsyyWocvbI8om4hOMDPzNtV7oAGCif+1GWsFnBt9y67HW+AaEoxdeYPpVG6I6zCVFGve7ItjWYYbgyIC70wYm1migoLF5kF8Lj7ePi2Dpmmwx0PgugXoaSgYr2LsKQDYUeHtV6BnDOpmkqkykpprL9zlK+n8Tl5SVGxL6URFOxWkOlOvN8V4VH4bjJJWi7sW945H7afnLsVdOmU4+WJ8e52Kw1o9S/DhwIrMGZz9DqlbWAaRYap+S8D6n8Ci61RBVk0cmNUrZv44+Qrifi351hKGlU4/919HzkdmoFn1L4ZKKjN/NYnk7mkGACiO07J9648xnlKRXn2OHZ2B8kOZPjCnsFPsY5yfV5hFpCp1nQNbqXgTXg9ogw59YdjPSlc/Zjsqr+8b01Qy8JUlFmqzyyjJ5hWR1az5oTNy+zK8Tk62roI6lJxgoNcs7Rp0Rs3dPtzzE+P2yKS1nV7N3G9Dz9w9sqfyugUp4Ws2BclXAWe3E68MZ63wTfUqwRoNIB6X7yGLKrzdJL+eGUYCK2l0qUZuHD7n2CUGllhdfxDPfCeOX/2RIHxFZInoJy/1sjvkAh7bLasbeUkxdoiLXrC0Y6iwVZepuhCQxEZ+0KfAjhAQL1Z/qBycpKie3XGuEz9FZBLBg0ZxLQgpDPEEhPuIxsuKHYvLQIIjQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CXaRWtz9n0YxoHB6hAVzk9TIY5gC34Fj1ohIgNzUmtRSEpaBLIsqNyiTlbEO5Q+A4xCrqGu05ZvGfEFxZ9AzRpy83j5CY38iQ+PZa4CxD7Avkc58R+59YjeLkmQ8aUyKUxYyDYtSoeGzTDxHd2QCamKhC6tkzcXl2cQ9c3qPa0XCITnGwp35TZhNn1tHUy22OG5hSCUcDdI5080RXM2o2oNLniWrqiVYcc/nTY0tS7tBUkci7OsRAaOpe2xQTIaw8x5fqnG7Zfipbzfz6Y2pn1BR7bXu3FRDqxtOWgxxIutxdCkoeDh4LrXkYPx9JzhmYSEaX4S9PTG84NCWA+mYrjmxyuFxtYbwJSgpegsQ+G7TjAp1qjNx31gn+ST2RcqEn1I0Cv41iggfHHGCFPCwzCDeahTbaYtCagySNJs1cT0NfC24wtbpb9uQHnvzcsH6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:03:51.9693 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: efb172cd-1bf4-49ae-83d6-08de844f8c13
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A793.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7184
X-Mailman-Approved-At: Wed, 18 Mar 2026 12:22:07 +0000
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v21 3/6] remoteproc: core: Introduce
	rproc_pa_to_va helper
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:jens.wiklander@linaro.org,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:op-tee@lists.trustedfirmware.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:email,stormreply.com:url];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.922];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3851C2BB608
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When a resource table is loaded by an external entity such as U-boot or
OP-TEE, we do not necessarily get the device address(da) but the physical
address(pa).
This helper performs similar translation than the rproc_da_to_va()
but based on a physical address.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/remoteproc/remoteproc_core.c | 46 ++++++++++++++++++++++++++++
 include/linux/remoteproc.h           |  1 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b087ed21858a..a44c8039449d 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -225,6 +225,52 @@ void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 }
 EXPORT_SYMBOL(rproc_da_to_va);
 
+/**
+ * rproc_pa_to_va() - lookup the kernel virtual address for a physical address of a remoteproc
+ * memory
+ *
+ * @rproc: handle of a remote processor
+ * @pa: remoteproc physical address
+ * @len: length of the memory region @pa is pointing to
+ * @is_iomem: optional pointer filled in to indicate if @da is iomapped memory
+ *
+ * This function is a helper function similar to rproc_da_to_va() but it deals with physical
+ * addresses instead of device addresses.
+ *
+ * Return: a valid kernel address on success or NULL on failure
+ */
+void *rproc_pa_to_va(struct rproc *rproc, phys_addr_t pa, size_t len, bool *is_iomem)
+{
+	struct rproc_mem_entry *carveout;
+	void *ptr = NULL;
+
+	list_for_each_entry(carveout, &rproc->carveouts, node) {
+		int offset = pa - carveout->dma;
+
+		/*  Verify that carveout is allocated */
+		if (!carveout->va)
+			continue;
+
+		/* try next carveout if da is too small */
+		if (offset < 0)
+			continue;
+
+		/* try next carveout if da is too large */
+		if (offset + len > carveout->len)
+			continue;
+
+		ptr = carveout->va + offset;
+
+		if (is_iomem)
+			*is_iomem = carveout->is_iomem;
+
+		break;
+	}
+
+	return ptr;
+}
+EXPORT_SYMBOL(rproc_pa_to_va);
+
 /**
  * rproc_find_carveout_by_name() - lookup the carveout region by a name
  * @rproc: handle of a remote processor
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..8fd0d7f63c8e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -690,6 +690,7 @@ int rproc_detach(struct rproc *rproc);
 int rproc_set_firmware(struct rproc *rproc, const char *fw_name);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
 void *rproc_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem);
+void *rproc_pa_to_va(struct rproc *rproc, phys_addr_t pa, size_t len, bool *is_iomem);
 
 /* from remoteproc_coredump.c */
 void rproc_coredump_cleanup(struct rproc *rproc);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
