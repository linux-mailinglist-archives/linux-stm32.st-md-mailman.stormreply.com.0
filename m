Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LKBKnbaCmob8wQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:23:02 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECD15699A0
	for <lists+linux-stm32@lfdr.de>; Mon, 18 May 2026 11:22:59 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 942A5C5A4DF;
	Mon, 18 May 2026 09:22:59 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010070.outbound.protection.outlook.com [52.101.46.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 607F6C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 16:21:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWjCdrEnFjkdlZzKMVimyYA/ZJK1M2mteHNwjfhhQXwEwANojWRbOTH/cak9w6X1RAHgZvdZ5mycwFmZxtpexL6bwkFM1av70IntCcDJxm98gDip5mOKWDWBoT3h68s7I4z590oV4EXNavWaHwNmxofl06C6mJL2oNHRVppd1RRBb0fniWiQvNRTOAHF0F5SrjNCz9zNwAtqiaK4J+frw26h/4UnaIMROubpw9Y/FsWvJTnqhJ1hszjxI2t4Kl3kIVtM5Dv/mBGU73vmJNAknR/F657Yk8OCm7NgLcf4hQeunO3pSo6OihQRRdgpvy0lvZIUGgEkXQpKjZGE3xppCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MsNqc4AecoOaUFL6Z91tZwjtZrzHyfnWRGcLNeO+X20=;
 b=wd3SAkzVqfE4UfulqcYeI3FH2Epwk65QXVfvF+jSoNOtHOfRF/Bor3Zc2mUMLqfDNilk9OwvBRaDeUPWMngyqH1n7xEV0WM5BzWEXSNOHOGwod/ge9vzEi38lgAAtnTjr6dZSj27C2tX4ZOZTaqD2wmeRK0/NW4VZBs4gWPx240bAmdOT52bFphD/bXb33fAMvvGnOm3xHnHVKqtGLlpcq9I0t1Qyjs/HZdPrl2rYonk8KEPmPY6op4iulowTBfvfAEIZlQdvCZJCfw240n7nTFsCVg+MTysGBDKYGhNUOp03sHEQsRO0705PyA2pfWMN7TUns75blpFSeNjod1V0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MsNqc4AecoOaUFL6Z91tZwjtZrzHyfnWRGcLNeO+X20=;
 b=lA6nWlnR4TNPHM8+aITj36Wp7+QNVccU+xty9h6EUyZQybFDwPm8cPz+XajeMmy6KmNIUoUCGlh7Y1iSJhGQiCw7zd53lPUB4qlwPtXVw5qUO4sfeB54GOkaqYbBsq7r3/g/WzS8rsJBwGcLE/LUBIINLa4KhbesqY7S9tXEg3g=
Received: from BN9PR03CA0089.namprd03.prod.outlook.com (2603:10b6:408:fc::34)
 by SJ2PR12MB8739.namprd12.prod.outlook.com (2603:10b6:a03:549::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 16:21:38 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::4f) by BN9PR03CA0089.outlook.office365.com
 (2603:10b6:408:fc::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Thu,
 14 May 2026 16:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:37 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 14 May
 2026 11:21:37 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Thu, 14 May 2026 11:21:35 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
 <linux-remoteproc@vger.kernel.org>
Date: Thu, 14 May 2026 09:21:29 -0700
Message-ID: <20260514162129.1504162-6-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514162129.1504162-1-ben.levinsky@amd.com>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|SJ2PR12MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: 55cdd243-27bb-4d84-ccca-08deb1d4df8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700016|82310400026|18002099003|22082099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: j1op7q2qwbiYvwTwBmilgbnNixGxbftuRGniOrPGehpBhuvmKFSaIU3YzUO5BGlZKWztUheJwk9ak3vV7NM+u9/q3rgDRT0vXBQYKbM1KuR6/nem8FG5lhJq0JKBHG837U2OqVLd8tq26BTXKU5O00m4kvClISNcQAyQ3LJp0/k64MhEX4Xa8S0ZOY1t8WnMMADDxV7E6PT7S1Dj96xqNq2uIkC9HSOTviF3lFzJtK9CLjWBcGRek5vHkGDALsOpDN+i2l80SEnfKMsARHMh4tYdEqsk8RghwnhAPsj3w1JIZKRxDuudaMENMiH+vUS318QQ5hTu7w71uv294bCirUp9UR/cDIxdo+zrjAl3Dfr5cLl2EJ0sBocZ2e6jgBFQ31Q/Lm9iD3tFoz1SGa49O0ftq3hEY2pYiQOyvIVnUvNr0Iqk8QaCYUn07isNV9LJ8Bh+pZArGbE72rA5G+d9Abi3ydiegJuK4IW4NHRhdkM15zwa+8qf3XNCGvmQv8nXYhM/SE/1C0z/EbVfAcujlcpgoFQfk/7r1I3/FVUcwT1SznmxnYgk1676QOy1SkxYp7CWrZAK0lUTLJnasiiBkoYcqwU8FAB5KcCDGoEIZcsxl1glWbziwhmsid3CPmfxMRbjlkNkQg8gyRWcTrKU+wazKsQG1x9d0k8xbWqZXLYNttPdseXTMPZItQPs2FjdXeyghNeuAGwbrce83ml/+ra6EInIqEsG+oz3sI+/6fQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(11063799003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NL74qGUjVlQ0HkZhDN4TUTRqHAl7NDO4BXPBfvFbTFV4FgPiXjp2saUlK3ME8PHQKAR43OstJsfx4Y97rGijVzfV118EotN8ctHeH9XC8wYLqqNd7mcEgQ3oVETxh/5xSW0zef8OYIMcWZl6VcGREQmv+QNb3qmJg7cSxJDM27SAoY7iZdU37zvH9MwOp5Uo3+H/CKIyS9TPPY4rNGeUHmzkxDUpL/ernLXgPMDwGuMXlONxLXeFnVsencJaqk6VJak9uphmXIVsrj5LNcmHvYYeQEdc/XYaccfLL49UxM0O0HGawPBlVoTTLGsa6QxRjtRa5NT0E/iZt+g68ZEQGJASmvRmcSNAaKpv9y2R3iMdR/DCVrcyDwHM2T2FS1BZWoBOd7/ObBBtxFgCDv/mQpGXEXVtYfBCV3IAJ4a9EjhSRrwEzwtB0k+LmlGCC7OS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:37.4373 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cdd243-27bb-4d84-ccca-08deb1d4df8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8739
X-Mailman-Approved-At: Mon, 18 May 2026 09:22:57 +0000
Cc: daniel.baluta@nxp.com, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 geert+renesas@glider.be, tanmay.shah@amd.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, magnus.damm@gmail.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 5/5] remoteproc: switch drivers to optional
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
X-Rspamd-Queue-Id: 6ECD15699A0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	DATE_IN_PAST(1.00)[89];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:daniel.baluta@nxp.com,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:tanmay.shah@amd.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nxp.com,lists.linux.dev,st-md-mailman.stormreply.com,gmail.com,glider.be,amd.com,pengutronix.de,vger.kernel.org,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.783];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: add header
X-Spam: Yes

Use the shared optional resource-table helper in the remoteproc
drivers that already treat a missing resource table as non-fatal:
xlnx_r5_remoteproc, rcar_rproc, stm32_rproc, imx_rproc, and
imx_dsp_rproc.

Keep thin local parse_fw() wrappers in each driver so the helper only
centralizes the return-value handling. That lets each platform retain
control over whether the missing-table case is logged and at what
severity, while other parsing failures continue to propagate to the
caller.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/imx_dsp_rproc.c      | 24 ++++++++++-----
 drivers/remoteproc/imx_rproc.c          | 25 ++++++++-------
 drivers/remoteproc/rcar_rproc.c         | 25 ++++++++-------
 drivers/remoteproc/stm32_rproc.c        | 23 +++++++++-----
 drivers/remoteproc/xlnx_r5_remoteproc.c | 41 +++++++++----------------
 5 files changed, 73 insertions(+), 65 deletions(-)

diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
index 2d9f14fbef1d..2ff74f7938f6 100644
--- a/drivers/remoteproc/imx_dsp_rproc.c
+++ b/drivers/remoteproc/imx_dsp_rproc.c
@@ -954,14 +954,6 @@ static int imx_dsp_rproc_elf_load_segments(struct rproc *rproc, const struct fir
 	return ret;
 }
 
-static int imx_dsp_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	if (rproc_elf_load_rsc_table(rproc, fw))
-		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
-
-	return 0;
-}
-
 static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct imx_dsp_rproc *priv = rproc->priv;
@@ -990,6 +982,22 @@ static int imx_dsp_rproc_load(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 }
 
+static int imx_dsp_rproc_parse_fw(struct rproc *rproc,
+				  const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
+	if (ret)
+		return ret;
+
+	if (!rproc->table_ptr)
+		dev_warn(&rproc->dev,
+			 "no resource table found for this firmware\n");
+
+	return 0;
+}
+
 static const struct rproc_ops imx_dsp_rproc_ops = {
 	.prepare	= imx_dsp_rproc_prepare,
 	.unprepare	= imx_dsp_rproc_unprepare,
diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 6249815b54d8..58c63f97ebf7 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -680,17 +680,6 @@ static int imx_rproc_prepare(struct rproc *rproc)
 	return 0;
 }
 
-static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	int ret;
-
-	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret)
-		dev_info(&rproc->dev, "No resource table in elf\n");
-
-	return 0;
-}
-
 static void imx_rproc_kick(struct rproc *rproc, int vqid)
 {
 	struct imx_rproc *priv = rproc->priv;
@@ -768,6 +757,20 @@ imx_rproc_elf_find_loaded_rsc_table(struct rproc *rproc, const struct firmware *
 	return rproc_elf_find_loaded_rsc_table(rproc, fw);
 }
 
+static int imx_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
+	if (ret)
+		return ret;
+
+	if (!rproc->table_ptr)
+		dev_info(&rproc->dev, "No resource table in elf\n");
+
+	return 0;
+}
+
 static const struct rproc_ops imx_rproc_ops = {
 	.prepare	= imx_rproc_prepare,
 	.attach		= imx_rproc_attach,
diff --git a/drivers/remoteproc/rcar_rproc.c b/drivers/remoteproc/rcar_rproc.c
index e3121fadd292..b7a39014b6bb 100644
--- a/drivers/remoteproc/rcar_rproc.c
+++ b/drivers/remoteproc/rcar_rproc.c
@@ -55,17 +55,6 @@ static int rcar_rproc_prepare(struct rproc *rproc)
 	}
 }
 
-static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	int ret;
-
-	ret = rproc_elf_load_rsc_table(rproc, fw);
-	if (ret)
-		dev_info(&rproc->dev, "No resource table in elf\n");
-
-	return 0;
-}
-
 static int rcar_rproc_start(struct rproc *rproc)
 {
 	struct rcar_rproc *priv = rproc->priv;
@@ -99,6 +88,20 @@ static int rcar_rproc_stop(struct rproc *rproc)
 	return err;
 }
 
+static int rcar_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
+	if (ret)
+		return ret;
+
+	if (!rproc->table_ptr)
+		dev_info(&rproc->dev, "No resource table in elf\n");
+
+	return 0;
+}
+
 static struct rproc_ops rcar_rproc_ops = {
 	.prepare	= rcar_rproc_prepare,
 	.start		= rcar_rproc_start,
diff --git a/drivers/remoteproc/stm32_rproc.c b/drivers/remoteproc/stm32_rproc.c
index 7ac8265b60ac..a4d42b755c74 100644
--- a/drivers/remoteproc/stm32_rproc.c
+++ b/drivers/remoteproc/stm32_rproc.c
@@ -232,14 +232,6 @@ static int stm32_rproc_prepare(struct rproc *rproc)
 	}
 }
 
-static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
-	if (rproc_elf_load_rsc_table(rproc, fw))
-		dev_warn(&rproc->dev, "no resource table found for this firmware\n");
-
-	return 0;
-}
-
 static irqreturn_t stm32_rproc_wdg(int irq, void *data)
 {
 	struct platform_device *pdev = data;
@@ -623,6 +615,21 @@ stm32_rproc_get_loaded_rsc_table(struct rproc *rproc, size_t *table_sz)
 	return (__force struct resource_table *)ddata->rsc_va;
 }
 
+static int stm32_rproc_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
+	if (ret)
+		return ret;
+
+	if (!rproc->table_ptr)
+		dev_warn(&rproc->dev,
+			 "no resource table found for this firmware\n");
+
+	return 0;
+}
+
 static const struct rproc_ops st_rproc_ops = {
 	.prepare	= stm32_rproc_prepare,
 	.start		= stm32_rproc_start,
diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
index e5d1903c9636..9b9f07d152e6 100644
--- a/drivers/remoteproc/xlnx_r5_remoteproc.c
+++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
@@ -664,33 +664,6 @@ static int add_tcm_banks(struct rproc *rproc)
 	return ret;
 }
 
-/*
- * zynqmp_r5_parse_fw()
- * @rproc: single R5 core's corresponding rproc instance
- * @fw: ptr to firmware to be loaded onto r5 core
- *
- * get resource table if available
- *
- * return 0 on success, otherwise non-zero value on failure
- */
-static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
-{
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
-}
-
 /**
  * zynqmp_r5_rproc_prepare() - prepare core to boot/attach
  * adds carveouts for TCM bank and reserved memory regions
@@ -843,6 +816,20 @@ static int zynqmp_r5_detach(struct rproc *rproc)
 	return 0;
 }
 
+static int zynqmp_r5_parse_fw(struct rproc *rproc, const struct firmware *fw)
+{
+	int ret;
+
+	ret = rproc_elf_load_rsc_table_optional(rproc, fw);
+	if (ret)
+		return ret;
+
+	if (!rproc->table_ptr)
+		dev_info(&rproc->dev, "no resource table found.\n");
+
+	return 0;
+}
+
 static const struct rproc_ops zynqmp_r5_rproc_ops = {
 	.prepare	= zynqmp_r5_rproc_prepare,
 	.unprepare	= zynqmp_r5_rproc_unprepare,
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
