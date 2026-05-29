Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFNBDR33GGqvpQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 04:17:01 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B75FC4AF
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 04:17:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 60204C8F28E;
	Fri, 29 May 2026 02:17:00 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012059.outbound.protection.outlook.com [52.101.53.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9DC95C87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 02:16:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXhVujV8KAH+3nUy2XXuAbmWthWJ4hgOHSBfUsclRjZsNqmRcpArxlmEFTqCX3w6zaZcz+cjjqU2lfE7ZlKh8sPlOJGn6IQtQQe97QW+OEWEhKOPgWOETlevZDCJclDoAvz2apLQ/Tk47OPrvLdyo44ssQYFAwJW9mPqYb7v58B/R7u//vvG7i+BQD0qwyvelWJHM5Bgf4o4cj3VCt1RkGMaO15f+BpRJjHGPQB6KS+Scu4fqRu6VAVj2EUF6tKDHfOKKRtwnBXoQKb+bZkh6hd5DsO4Z+83hIyju1/kixlWzhhcCprI9ruuST3XhTNmBECcgBmP2JbSP6t9Gq6beg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7R+TwnqfNwcWaFnIlcP1I3F5g/RyYTVRWjrRoNPbQfk=;
 b=a+lu1w+4vsvL/znwyINErO9kvib/0MREweY3Y/DWhWyrHcv+FVWABu3jzfJE53RAqcAiMRgq39V0m6ZLn2L3S+77YAG/kMezjNrsYs0Ff96UicVUk6XByrar57yEfqwFIocmxVQNdphUnHmfVekV3feoXA/T7xhxWoVwrTjPBhMIfQFCWGx6+o1fC/4XiuZVdIA4djA2+6KoAAUkDTSnyZHjG4Dc7YdrUeozX7SC3r+geIydiPglrImwWd8HR2Sew/assu7bJwq8M1u6Th8ahpt5LNPpyE9m1os+HCzYvV5IX7bTFdf0d7BsECkrVpZqgN9hAGjrxAWEUjrFEEQM+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7R+TwnqfNwcWaFnIlcP1I3F5g/RyYTVRWjrRoNPbQfk=;
 b=J/34ZbU/TQIXdFgvNgCLry1qaG6T2oMPrBU34PJB+GDdJk9EGTW54Z3Isf1C0U6LkznMGOb+E+gYbl6QGVVQo2nLX9gMD7g+B9ISvSVt4Ho6jdren7P97+Q7jY/OSM/gYaaIzNI5U/1fBW/Ur1P74D6DFsKy8p5YF1ROx5zQBgo=
Received: from DS7PR03CA0309.namprd03.prod.outlook.com (2603:10b6:8:2b::7) by
 DM4PR12MB6375.namprd12.prod.outlook.com (2603:10b6:8:a2::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.14; Fri, 29 May 2026 02:16:54 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:8:2b:cafe::8d) by DS7PR03CA0309.outlook.office365.com
 (2603:10b6:8:2b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 02:16:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Fri, 29 May 2026 02:16:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 21:16:53 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Thu, 28 May 2026 21:16:51 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
 <ben.levinsky@amd.com>
Date: Thu, 28 May 2026 19:16:33 -0700
Message-ID: <20260529021637.2077602-2-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|DM4PR12MB6375:EE_
X-MS-Office365-Filtering-Correlation-Id: 82f72477-1078-4460-849a-08debd2859c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|22082099003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: eEaiDSguLcO+DiiYsUPMvgYmnm27V8nDPI4Om2CGF2yDtgn5GKI9niW1QIwLeBeuq8RcrGXeLEf5NEH4r+GbyMs6VYcsPgGYdxA9myXxhRGn24MIS3MaJZloXeyvuChgMy/zL52Edjtgl1rt8th5xO6HrWvGi0drWl76LDyWQr4dwbgQjDrVM/jcoHiQmqilKNklKl5NGQEU4CBi6b3gtgXxawPEkIh86pbnG4TdMGYHFYX/uRcFk/bqmXONI1XDi6LlhyxfVhvRqo1kIBdqSiMYkXnmfuX7SRnS2/vUXsa4/kyLyJvlSWTGrXrRC5Vbo9O95Qvk2Olx9m+0eeu55zm66xzGd4w8NOO2FPAgCKzp1p3X5WanlRz3cuY5FC4fJmz7CmHTqGIanjELw2X/tIvYI2v77oFmwzucjJes1xqrsMLocNUdXOehz18FspKgDYDOA95peBxElG2KqT5qDJRVG+wKilCpgbhRqdaNZISvVlvJKtGOc6N6u+ordfKvGdB4r5bUr8cxFEB2Xk9HJdE7dBUFpFu7/CS6HqzCXYA2X/MdZYl46iZCor58pDZfkH9IcCnJE7nQnr/uZGXjl65SMTGiI9d80Al6pqWXLRFpXUoLnr0WJNesOsgFnDbBNTjC9sHDTwmnXVNCdCyOwyGN75vOx6SD1hT5/pA2P63+32RZeaeiETAhFkbBT8jHvdNlaSTKH77K2CU6bma2c+Yg3vUmh2nldBIRLeU7wRs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: h1eL7KSekFgBIJY43bTD6Y8KDANxlwytNPtglng2g0VzpPzZMD2sr/0mm89DOlfO2NxHFu2iEjLaaDShV03iqaLnrzbI/w1nM7SyoYTNFRPZy5Hiy2r3El3fXCeKcstPG6YnJZYfekSQhKo1BHp8Bp8/EoyNSjue+72ZKKFi9vgoq6+OaWnTsfbNyW4QSx/6kCgRNrEx0Og7QWn59f8Imc+uVoKyxejAmIaNwMdsQ9pzpXQpB2OQqqGUJjCaR1UbO4yQA5rsXIejXPyC2VlWExm+h3MzlfrvLZBJOk0yob6HjLDTdTs0lvTkwWxkiq2fmuXi1mlE1uG5w0Vb+tBWu4LvHcSDJKNVVBaUV2SEHEjWU6MBdnd/v4TVmgMSUaBr4ujmwKxMLUle7CcWcWyz8QxT1S/iPD/2E2/r6Hg8ibMSszc3AQmphvNOAHZWIIsi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:16:53.5227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f72477-1078-4460-849a-08debd2859c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6375
Cc: Daniel Baluta <daniel.baluta@nxp.com>, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tanmay Shah <tanmay.shah@amd.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Magnus
 Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 1/5] remoteproc: add common wc-ioremap
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
X-Spamd-Result: default: False [6.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:ben.levinsky@amd.com,m:daniel.baluta@nxp.com,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,lists.linux.dev,st-md-mailman.stormreply.com,gmail.com,glider.be,amd.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[amd.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.729];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C29B75FC4AF
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
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
 drivers/remoteproc/remoteproc_internal.h | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 0a5e15744b1d..46080c1c030e 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -14,6 +14,7 @@
 
 #include <linux/irqreturn.h>
 #include <linux/firmware.h>
+#include <linux/io.h>
 
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
