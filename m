Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qle1JXNAGWpruAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 09:29:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 161B25FE85E
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 09:29:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DBAA5C8F293;
	Fri, 29 May 2026 07:29:53 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010034.outbound.protection.outlook.com [52.101.85.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDCF7C87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 02:17:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQnQUmmFFkvreBqbqozt5pUVEE4uj7IJBZjkUwgl1CdDrL1Xv7gOrgRzUAfi4FkTyD44dKnseiQhJwRe6nDJhd5BeFoIZroclTqIN66POef6KDuXgcSrhO5x0CSsBUC9Jxyqm2xXu74h0K+p+P9Fjy0AGQyI5d/vbpm4+da89LWNt+4ETHyzURUPzrjqI7rfUkzCXGSR898I/ScQdnej2kz3unftbQuKynFkYdvhaz/NHBde8DXvs5GLId+J6rW9fQkp0m31VmtTruhqHa5LDqQwJxwM4iOoqclNHF0fJ8ZNCjB8fauo99tdZZ/qQfLU88hBVT9omOEYY4Kf2aIEaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slnjKHN9Q9jUP+OZ5n1J58UVItYvJgrKZngcCtS8prI=;
 b=ChhS8HPJTaahduGw7gBKDa1KSRXB7gpBw1bJZAGeu5MLaY60R/7fSmxZ00HFWr2IVzNLOxE4wMChKzBw6BHP82G5hew7Mt+G6fPPJMWIib79e93uHy2S3rGt3nQfsMJ1kdyuyN/DcxR2UPCP91IzufLKMaCnqkLiCmrOkwU2IQVTJH4EtjSiTKkByyy6CoqEH5F6/RexB8v0mg3EYPtd5Xp4UMuGM/pFyiYKK6Hywy41CDV43CJ/07qMhuVD5QPEoK7JvYbQy+5JxtmQ1UDsADsNVhvV6BUoS7NQWvAzt8YfGxmRpwWAptpu3nO+EYs9aEtzA2SMT9T/DsBogCfiog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slnjKHN9Q9jUP+OZ5n1J58UVItYvJgrKZngcCtS8prI=;
 b=EFscZApXjBc/YZFEHrGLVSgUyOuCgKMLakEdU85lj8b7raTTIVKy+VFrFsmjNHoiFifmoHJvQkihxNgLMyFatcmTy59NmNJ4ymOR3aNzZPqLoo8bq35xeBYa2k1DjpvuwucvbZfUckyE96qrxs04NSFM4BGPhoiQf5peSr52bm0=
Received: from CH0PR08CA0008.namprd08.prod.outlook.com (2603:10b6:610:33::13)
 by LV9PR12MB9782.namprd12.prod.outlook.com (2603:10b6:408:2f2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Fri, 29 May
 2026 02:17:03 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:33:cafe::4d) by CH0PR08CA0008.outlook.office365.com
 (2603:10b6:610:33::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 02:17:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Fri, 29 May 2026 02:17:03 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 21:17:03 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Thu, 28 May 2026 21:17:02 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
 <ben.levinsky@amd.com>
Date: Thu, 28 May 2026 19:16:37 -0700
Message-ID: <20260529021637.2077602-6-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|LV9PR12MB9782:EE_
X-MS-Office365-Filtering-Correlation-Id: bd9b2cb6-506e-4f88-79be-08debd285fc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: FCak5C0RkgWdYy5+WJR7TUN5hMjroMhFsClW/6G4tCMaLewpKKmAsiMtmIZY25srHWckzAiIhPRpxG/zPzrHJbQ0OFm/V71mmwnfz8+CLE6KGkx+mvkdnSVRvcJbc/bKqDQWCnlDXNUxto/TRlXtAtMNNGszLisXgs9QB9OxwSqwasyIDlobWNXCcRaIbtvZ1hiJhWmre1eSSraivsSkjUzBvFMNuU3URb6LEADLjvl+Y3dzh+ytIcsCtqs0EdlHvZKYwY7K6azlD3kfFjH804yOWJ4JF+kpl5dL98NA7PNUx4JtqPk0ShRojBWcsQdZ3vOb0PZj0M7NqW91SvdwDG1MKWWtK7k/7EoUy2PNdwBcU+cn3m28N9/VW3o3pb6v2TiFDFe01OJWMQI4d1KQl2Qp3Tm5dWb5HGaw1heFTbm88ZjKIOp1pHPcK1KTyq65PDBU6Z9pUlhAI14sYo7lDRXSA/Po1DrkWjjmgdA6//nuLGApkTwIj8rU6iCQSgWfoLa7y8Gq9niJg3HXJl/gdWzz06T50ALRtxxKJu+pKnvoJv5mTpU40EGjYtvormb3776tJvVdx2jMiiMhjTKtKaCYaFl5SUF3JXc3HvfsdYFhvFvnexCZF5msVl6HDUGKr2Jcd4Kz79m+YV4jAG8sXL7EeFRWPqsLaERbsmmJGYgYVr4utJ3KHjw+hhqSUgCfGaafI8FleWOwG0E5RNNy80Nv9ce4Uy+Xj7bCPp/dYk4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yCMM9cBxFdbN+350UFj80uTzQeP9TtxmrG78YC3wByFk8SOUiGG91S7SXrH8fba0i9yddj4eB0t1g2AcSWsst7h1TVxIE5etfNc38EpUu8sLFAeUjCrmieb0bXytvFoB0EJ+7nFarYwPfCXzjaa4E8+82KMbxldOE2kA9l4N9tbQqaYGFndEmaM9Mn1w/icJpRmqLLklucpD7j4W3Q/B5kA8TXCs1uFO5tSubo3ch/c41Poj40LwW7BUoXXWSFpdNBeR7BWvi7jlFkwMyWBNWAOi09XxzEKmNiLvIbcM1RpAPv6DnuGpLBaT/5bzRqz4CMeCTpnhrUHoVeoPrF2/Yt+R7BkEV6/QjknI6oFbvFLTl7pldlZxGxvNiwiHmtZHcPnjE68rd5axy+U6rTxwErGL/kYl+/5JEcYJ2K6li94s0zbUWunnAquMhMogO1r1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:17:03.6038 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd9b2cb6-506e-4f88-79be-08debd285fc6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9782
X-Mailman-Approved-At: Fri, 29 May 2026 07:29:53 +0000
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
Subject: [Linux-stm32] [PATCH v3 5/5] remoteproc: switch drivers to optional
	resource-table helper
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[amd.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.734];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 161B25FE85E
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

Use the shared optional resource-table helper in the remoteproc drivers
that already treat a missing resource table as non-fatal:
xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
imx_dsp_rproc.

Keep thin local parse_fw() wrappers in each driver so the helper only
centralizes the return-value handling while each platform retains
control over whether the missing-table case is logged and at
what severity.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/imx_dsp_rproc.c      |  5 ++---
 drivers/remoteproc/imx_rproc.c          |  8 ++------
 drivers/remoteproc/rcar_rproc.c         |  8 ++------
 drivers/remoteproc/stm32_rproc.c        |  6 ++----
 drivers/remoteproc/xlnx_r5_remoteproc.c | 23 +++++++++--------------
 5 files changed, 17 insertions(+), 33 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 2d9f14fbef1d..fd60c67ba8a9 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -956,9 +956,8 @@ static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct fir
 
 static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc_elf_load_rsc_table(rproc, fw))
-		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
-
+	rproc_elf_load_rsc_table_optional(rproc, fw, dev_warn,
+					  "no resource table found for this firmware\n");
 	return 0;
 }
 
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6249815b54d8..6e59e6196555 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -682,12 +682,8 @@ static int imx_rproc_prepare(struct rproc *rproc)
 
 static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	int ret;
-
-	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret)
-		dev_info(&rproc->dev, "No resource table in elf\n");
-
+	rproc_elf_load_rsc_table_optional(rproc, fw, dev_info,
+					  "No resource table in elf\n");
 	return 0;
 }
 
diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index e3121fadd292..1fe6c01bde40 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -57,12 +57,8 @@ static int rcar_rproc_prepare(struct rproc *rproc)
 
 static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	int ret;
-
-	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret)
-		dev_info(&rproc->dev, "No resource table in elf\n");
-
+	rproc_elf_load_rsc_table_optional(rproc, fw, dev_info,
+					  "No resource table in elf\n");
 	return 0;
 }
 
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index a6e36a11627d..0e5d64fbe52c 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -234,9 +234,8 @@ static int stm32_rproc_prepare(struct rproc *rproc)
 
 static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	if (rproc_elf_load_rsc_table(rproc, fw))
-		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
-
+	rproc_elf_load_rsc_table_optional(rproc, fw, dev_warn,
+					  "no resource table found for this firmware\n");
 	return 0;
 }
 
@@ -928,4 +927,3 @@ MODULE_DESCRIPTION("STM32 Remote Processor Control Driver");
 MODULE_AUTHOR("Ludovic Barre <ludovic.barre@st.com>");
 MODULE_AUTHOR("Fabien Dessenne <fabien.dessenne@st.com>");
 MODULE_LICENSE("GPL v2");
-
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index e5d1903c9636..0fdda82b6e77 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -675,20 +675,15 @@ static int add_tcm_banks(struct rproc *rproc)
  */
 static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
 {
-	int ret;
-
-	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret == -EINVAL) {
-		/*
-		 * resource table only required for IPC.
-		 * if not present, this is not necessarily an error;
-		 * for example, loading r5 hello world application
-		 * so simply inform user and keep going.
-		 */
-		dev_info(&rproc->dev, "no resource table found.\n");
-		ret = 0;
-	}
-	return ret;
+	/*
+	 * resource table only required for IPC.
+	 * if not present, this is not necessarily an error;
+	 * for example, loading r5 hello world application
+	 * so simply inform user and keep going.
+	 */
+	rproc_elf_load_rsc_table_optional(rproc, fw, dev_info,
+					  "no resource table found.\n");
+	return 0;
 }
 
 /**
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
