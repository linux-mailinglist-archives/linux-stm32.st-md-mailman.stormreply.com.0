Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD5OJpT2BWpVdwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 18:21:40 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B07A54491C
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 18:21:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6212C8F263;
	Thu, 14 May 2026 16:21:39 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011053.outbound.protection.outlook.com
 [40.93.194.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 616E5C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 16:21:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcQcQUMm/FDGhhxJuooEcRZrGXjudt9qIBom/qbCu5KRIXAafYNauqwk4Esr6cyyFqftPy97KiIkxcpmXkMso4+GIpJLqJXDh85RUAaVlLNXvL9S85U0Tr4mMS75vUzWDdkfQoAel1AiUwIiyVWye6a6QzjokPrqcbuNQbSdhIwabxUNp3sbbblJObTF4xQ/dHU3DBGO9DxPNPNz31dSRR7SyXTb+TbB2cErqMKqJrSeeCbDJXTm64smq16NxcoJHz1yOxuI/+GBFq50hEZ/KnwcT5Ks6HRc2rdyCBZ5ep4iwua6Gb4xWEu9rcgjd3vtGX5DV3FRhb6e1EzZcpu5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jh1oD2+ykH7kcALwhihEY//FhU0wQarqHnzOAFPeB7s=;
 b=X7o3pUFW78rgTQOuVju5sREn73245o0ECqVQF4xitDN8h1A72l4E4v7WM9woPokS5aVLb76ABE9dUrk8FEnk1eJxwwqwt7nfHlJosW3jlrnmkuj7NYYtN1ZuEgnovlLkaH8NUkX9KT2D6MYg3az4yexmWsQaKbWBMzJ5d0RHN+JLxSyCxuqLRmShV8O/pOL/oEoQGcdiZxh0qiiN3ZnZi/IgbCt6+uWq6K7kSBySPT06k4ayLORx4AyTlLHp5z6780Nh0IWPNzGm4CsVnPrGCPK74C3psPzFTwVHotog00MyZesFKMJJ8k/tJsS7JDXo502S9P6xbMT3i8OQWbpvew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jh1oD2+ykH7kcALwhihEY//FhU0wQarqHnzOAFPeB7s=;
 b=gjN60ilolQLl0eUlIYm3TTsWeKo9N1iiKyGILXU6lxATs156FaHl+YTl4xL83sE1l1xVIO+0Nxk/YpmDDcQf1tEKs4po46cjkJ7XXWOY0qihYytPcIGCP0K1wopc+EgBb5+mwrYnMPhrDYqJ2C1vnN1cmFh9varvH/i5eZ2hSnI=
Received: from BN9P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::28)
 by DM6PR12MB4387.namprd12.prod.outlook.com (2603:10b6:5:2ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 16:21:33 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::11) by BN9P223CA0023.outlook.office365.com
 (2603:10b6:408:10b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.12 via Frontend Transport; Thu,
 14 May 2026 16:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Thu, 14 May
 2026 11:21:32 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 May
 2026 11:21:31 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Thu, 14 May 2026 11:21:30 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
 <linux-remoteproc@vger.kernel.org>
Date: Thu, 14 May 2026 09:21:25 -0700
Message-ID: <20260514162129.1504162-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514162129.1504162-1-ben.levinsky@amd.com>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: ben.levinsky@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|DM6PR12MB4387:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0c7210-ca67-46be-4485-08deb1d4dcd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|82310400026|1800799024|376014|36860700016|18002099003|56012099003|22082099003|11063799003;
X-Microsoft-Antispam-Message-Info: 5StWfwwZ300GB5CUWeeU2PHNpIxBRCZglgtjnESscZtUojviK5X9D2N/dN6tq4lJSf/z3dnn3pIcaRhciCaKOceAmwI3HJh7GV6xHdILYNf4FYFx07YU9nehOrlqceqmhFWr+PA09Me0uwsxmZUFTlInkbLUgMxP3EMcpP0K4CpHEccSB07WOk23vpdIuuTNMLNpC2enpqehkXvUkM41bcH++UymeefA+RG6Hqer7QvcLSYTGUq+TINUx8AkQktNGEQcJj5fZGm6Yk62roPqiHbtiXHT9gTMKTGXxuBiWDqWkkkGtYXpk5RhSxuVJT31tEmprfW9sBdNty1gtmStkwphBGE6f5MJMMSIt9AtvazFPr8K1h7CiN1ws+J3dpiC1G4lNHJgjsfTuY9tty7pa3Y4w6tlIGApBrGU5MwrY4byBeefUWKQt1VevF3mbvclkudhX8q9U3NUk5+m6YE3QFhOKHZDHKRUHAw8gIFEQyhbVAJo8gEUx/3gbUByuYtLQ+7LqP0PMDxxkFXr9+2X0RZk23lsq02exTlGPV7D51mJOUuSI2b4fJDLH7403ec/vStNnotLidVsTqiEOJG4RsDTgnRMaIEcJZjsL//3jhNSQPZqOvsci79EJSqUlmzy/+kkBuFhT6Qu6iKQZJW2f1gGlAyxAfzhXtj/LFQf49JCEpiBlwXiXOIrsbtzhuUQXv3Y9R/qmEqpBMxlYSua03kfwlC+mn17u6t4jDFOT5g=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003)(22082099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: jsf6j40qEBgZdBvDTbeLT5fWqbHcLEOOWOd4oDksEedUxwm5xiQBjWWljdFExcl2eEvrB+q50RQbC68GjzVf1qoXO5Hu3FawAQ+5Wyc8MOIViMd8VHGtiMEmjn4AZQGUILB/7iBJONjp4uZ6Elk+Qpd1NcXO7jMSp4E25X5/ENnzsw3BxEX8abY85Z8h6mQkUDpdIJnLLpe7UpMPE+zLFEiFR09549wG3BI0SNT/tI65dQoO8cqZ7JY1IHqKG+7m1Ug8qUUbRYjB7JURodTeG3pm60Lyj6Skn31JOZMnR9eo/YGFEJwENoDluAtLHwz/q6jVz94Wk094qYSXb/MKlF6aHBgxOXUGt9Nk4L1VRgSA4yksSD7YI8/8izMXZ1paxmvBg7TO2M0OhnWW5zj6m3+klORV5JBDotLzff3RYor9SXcPVniGvknTDrp6ahFn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:32.8776 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0c7210-ca67-46be-4485-08deb1d4dcd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4387
Cc: daniel.baluta@nxp.com, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 geert+renesas@glider.be, tanmay.shah@amd.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, magnus.damm@gmail.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, festevam@gmail.com,
 patrice.chotard@foss.st.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/5] remoteproc: add common wc-ioremap
	carveout callbacks
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
X-Rspamd-Queue-Id: 2B07A54491C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nxp.com,lists.linux.dev,st-md-mailman.stormreply.com,gmail.com,glider.be,amd.com,pengutronix.de,vger.kernel.org,foss.st.com,lists.infradead.org];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:daniel.baluta@nxp.com,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:patrice.chotard@foss.st.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.640];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: add header
X-Spam: Yes

Several remoteproc drivers open-code the same ioremap_wc() and
iounmap() callbacks for carveout mappings. Add subsystem-private
helpers in remoteproc_internal.h so those drivers can share the same
implementation.

Keep this change behavior-neutral. The helper now emits a common error
message on ioremap_wc() failure, but leaves mem->is_iomem handling to a
follow-on patch so that the behavioral change can be justified
separately.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/remoteproc_internal.h | 28 +++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 0a5e15744b1d..f5b34aabed5b 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -12,8 +12,9 @@
 #ifndef REMOTEPROC_INTERNAL_H
 #define REMOTEPROC_INTERNAL_H
 
-#include <linux/irqreturn.h>
 #include <linux/firmware.h>
+#include <linux/io.h>
+#include <linux/irqreturn.h>
 
 struct rproc;
 
@@ -122,6 +123,31 @@ rproc_find_carveout_by_name(struct rproc *rproc, const char *name, ...);
 void rproc_add_rvdev(struct rproc *rproc, struct rproc_vdev *rvdev);
 void rproc_remove_rvdev(struct rproc_vdev *rvdev);
 
+static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
+					     struct rproc_mem_entry *mem)
+{
+	void __iomem *va;
+
+	va = ioremap_wc(mem->dma, mem->len);
+	if (!va) {
+		dev_err(&rproc->dev, "Unable to map memory region: %pa+%zx\n",
+			&mem->dma, mem->len);
+		return -ENOMEM;
+	}
+
+	mem->va = (__force void *)va;
+
+	return 0;
+}
+
+static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
+					  struct rproc_mem_entry *mem)
+{
+	iounmap((__force __iomem void *)mem->va);
+
+	return 0;
+}
+
 static inline int rproc_prepare_device(struct rproc *rproc)
 {
 	if (rproc->ops->prepare)
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
