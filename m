Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBU7IHNAGWpVtAgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 09:29:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 155EA5FE85C
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 09:29:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C84F8C8F291;
	Fri, 29 May 2026 07:29:53 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011040.outbound.protection.outlook.com
 [40.93.194.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8CCAFC87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 02:17:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XiXe9VTnZpdQOrwm7Ub9UfTululW81I+MfElcge1S/cMdVj0uwTirWIvqQaxjyOE8y8Ed415yXoQiC42IOsLwyns+WEb2fqAiYYOAC0O/mMSO45T4rrytPZmTI4YaArdjugB3DQFS1icg0oD4UbUBthYjyQzuSZqxsYOT8KM5HLEzG3Htbnf6eBa5fffhqcEaA3uAgFHT3GuH7sQ55i8Wq8nkEMmUMRiRe8qwLQ6TjQgujyWOAtHPwXnoVDbqVpYs0Rci/NqypPmBOOcWuFP/SPFjEQJ6VpVRr47p3eoiPBoJFe+Kvq7RMtLkCfcWy5hjinPKxWNmEfXWfuyrp1TVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1Mismg1crM8CcnfL79MR42jPTSXv0lL5FbcaDD325A=;
 b=IoFcvj7IZQxdquPkThiSy9cQcE+lbhr0XDv39vIl4iWFVBqAJFgzofLgiRqap9ZnZqi2SrRqRzb4A8MmUZnjNQ2gnCHtAzECLPhIybbGH7RVoQW/h6vJvexIERQqmzkuqd66woq4aLTCzzoxF3oPZ6dCiER8pcYFplJzgZZrnTVlrxZBTBpg7t3ctQtnSxVQpkVtCPNBhaJPuS3X5ahx5zSngoQ0ZwLTITQxJNbvMWmYxsMRYxy8OwZD7zoc7yD1tWxGh6DFUiKG3foks72dKFjqA95ajUQ2Unt/5TH3YY407ilEnt+DrJLJMTa3oomvaTGrP2xSFjbdLahCrX8yVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1Mismg1crM8CcnfL79MR42jPTSXv0lL5FbcaDD325A=;
 b=D1WfqtclqWe55cvuOWEQfyptxt9t3SNZsVF00DTUvm4qMKmlav2l2VUbH2GxHgO+1u3YuY+Svt9/hZWSduNXM8s5ocpZJM/4B55jE+n0QlNy6rn6uFFCG1vYDN/47zfaMf+KxdAt6KtqTylNa+Ga/q15MR7/SM+3Q3jqtPEFmgA=
Received: from DS1PR03CA0013.namprd03.prod.outlook.com (2603:10b6:8:450::6) by
 SA5PPF916D632A9.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Fri, 29 May
 2026 02:17:01 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:8:450:cafe::64) by DS1PR03CA0013.outlook.office365.com
 (2603:10b6:8:450::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Fri, 29
 May 2026 02:17:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Fri, 29 May 2026 02:17:01 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 21:17:01 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Thu, 28 May 2026 21:17:00 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
 <ben.levinsky@amd.com>
Date: Thu, 28 May 2026 19:16:36 -0700
Message-ID: <20260529021637.2077602-5-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|SA5PPF916D632A9:EE_
X-MS-Office365-Filtering-Correlation-Id: bb3937bf-7cc4-4b4a-2b84-08debd285e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700016|82310400026|7416014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: HoVIPfxwRGW4JP2ZUOwbCZDom3ZDpe20NLMCe0l1ctYePSmgZAF702yw2A8e7hETiZVp+iwE3EHduHsQ3fkj3CZpanJ3GnFcNzfpKzGGzCi4UZW7GbB/m2vBXGYzWbzD/1gHoLnJyYQj/EDLSKV0MA2p67cotRqr4L9C+qB5eYcrEZ18UGjO/NGsQXEQU524LruuUyBUEq7zYd13q1FGvuJfUJP3pOSpjGehqDYLH3cSeKRVheLukpKSN0Mxh2i1sJHPJ5U96oIciOm+H65X3BtJHjm4PvXvJ0jsIS+eIz5zPPiE6g/PKf43PEzgTvLuzXuS5WYEjx9bxF+1cBwu/KWfMcklDfRH7sZsyg3tOnQjmSqgph9fEtFY6liaD9Ru5yoqktGXnbRiLcqrHqnKcpbJX4sGEOiy5AILuazOcCNAIMSY4OIG8/+fQdKa5TSfyll6EIn8YDMNuoZn2Eui7Qy+QC2X5LCJBV6KE5SvugRbBsVxLeCtPdaKRCpvWNA2ptmY8vj28BTtapbeKMqqclozHWOVIrDkzthPLPm4yx6NcbvG4slyQNFLL/D8hpi/+X42vNDS/dmdMofk2781zAsIScOi4BKkgTe7Xh2VIcY8uTgJ6z9PZDRvk/5F+w8eCb0cejO30Pi66MGyf47cVw9a50DkkeLncWuECHVqVyoSum9QT6QVDD+i2EH+oPPi+NPMrMy68ZllK3omNpW5LrWrHGZt3+yRcM2WellOqVc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(7416014)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CTjJkvmuDUmFXLNOcyRyYxgUhsm6Z817pmwXCrT7n5xLy0iREE3nNfBT+wZTb104ZYMsQu9iuYGFfdn0wVpKRNt3basUp3W72m4s7/8ed5vfsZIQel8FTo8GP3KQ9n67hObQZe57c1sFn0cSm7vZjF8kl0Tl/wy4RpbzjU4qjZNpHJSMz7G+HRAGt8VJ/4vNz6E/thfvHUOewSkC9fPdvTidEsawW0i5xZiFFlP/IMXBVH1EajHTYlyP4FMAqM7sGmrt17D5sOA0/su1PLKdHgPqEIqaqOAz/ECyGjppXI9qHordPyZ7kzAZwmQW7HwWep8zsXxNtrJGTM2qmBl+v0R65EQZ5b2OsOPPSZutl5oXSuTH5xxiGW0u7WoLC+plKgvXTbocYw5UHG4e2wAwWy5dSZwiOvT91Gr/gcP7HT64gkiA/sacpcsjTBmUR0kO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:17:01.6233 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3937bf-7cc4-4b4a-2b84-08debd285e98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF916D632A9
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
Subject: [Linux-stm32] [PATCH v3 4/5] remoteproc: add helper for optional
	ELF resource tables
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[amd.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.733];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 155EA5FE85C
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

Add a helper macro around rproc_elf_load_rsc_table() for thin parse_fw()
wrappers that treat a missing ELF resource table as optional while
keeping per-driver logging decisions local to the caller of
rproc_elf_load_rsc_table_optional().

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/remoteproc_internal.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 9afda697271d..02c00475b010 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -149,6 +149,17 @@ static inline int rproc_mem_entry_iounmap(struct rproc *rproc,
 	return 0;
 }
 
+#define rproc_elf_load_rsc_table_optional(rproc, fw, dev_func, fmt, ...)	\
+	({									\
+		int ret = rproc_elf_load_rsc_table(rproc, fw);			\
+		if (ret == -EINVAL) {						\
+			dev_func(&rproc->dev, fmt, ##__VA_ARGS__);		\
+			return 0;						\
+		} else {							\
+			return ret;						\
+		}								\
+	})
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
