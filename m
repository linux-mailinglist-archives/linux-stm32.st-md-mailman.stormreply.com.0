Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP2ODiL3GGqvpQgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 04:17:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D497E5FC4BD
	for <lists+linux-stm32@lfdr.de>; Fri, 29 May 2026 04:17:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A47FC8F28E;
	Fri, 29 May 2026 02:17:05 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010020.outbound.protection.outlook.com [52.101.56.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5BE91C8F291
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 29 May 2026 02:17:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PGzk8AGYbk/0hyW5apMfQJSegGDTeQaO2fkegJNeWKam+kg+52WGEv9EdsRXcH56+jczdVjCP9DKU7d85+3IO/azXXSm+V0f27OBzMQIqF5xFzs0KmfZk4fHT4nqQ3oouNKA74q+pdYpasDhU3bcEs1yeo8kUJa0nBBbOk6l+WaZQq3LnLt6m2gw3sBWFaOuNjn4olCpJrc+PAiLtEB8dGR/TqBNJ3AJy+CCRSgY+JO8OahlaS8ckemuWb9hxFpedYSprHs1tNMkIuWc3/Gzg+tFXcQ6cUQoDRn590V4zlIx0HOoqKZjMK7RCBdWGBPu1Ho9HybgkjpkatWl/Qzwtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPBnHCMcJan4ctGF+zcZRN31l++FIMVrmZPVx/pQOgU=;
 b=EWVlzov9oC+mdFtW/pJGEFfhSqxX0wp5D8hYXo91fx6122Y/ungprzV1iVHEem/FbSQdNj6uNCHTPY4WWtox92VEmmdpMuHmz4n+fTbKb9Vi3dwKaOUGSkVUhOojyhzD5EUKPIzZ9uSgRm3kYaVQ2JPdByz3uJJrvKeK6OtiZRKflsExlvoRiH5njEjnYVW3O63XwU2QLeY00O4B+xd9mK3QQoQkwrgS+b04oVVjK7c0N6LPTCoFLumKGib+wyYLPR4/RKXIvlCDcbCTQtCqiaQ/GEdJqHg32Ya8YNIHFWEZdQBdkrFdz3Pv9/wHmNqfdYMwtSq3oNwUCagXlp8RoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPBnHCMcJan4ctGF+zcZRN31l++FIMVrmZPVx/pQOgU=;
 b=HWlD3u2qGcxD3/TtwjuZQerk0Vzy6y8Yx36cLMVc68zvYXcug7G2NHaCiqI15t8RRhgmDokU8UR5ZYFHM9/TUsgKQ/Zgov4X6gi2F1OpHKTsCmgX3jIX6IezH3K47kKN7osyAQkLnZgnwxy1ZL+4g9VKjDdNKKE+DeUy/VMXBNA=
Received: from CH0PR08CA0006.namprd08.prod.outlook.com (2603:10b6:610:33::11)
 by SA1PR12MB7039.namprd12.prod.outlook.com (2603:10b6:806:24e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 02:16:59 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:33:cafe::af) by CH0PR08CA0006.outlook.office365.com
 (2603:10b6:610:33::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.14 via Frontend Transport; Fri, 29
 May 2026 02:16:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.0 via Frontend Transport; Fri, 29 May 2026 02:16:59 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 28 May
 2026 21:16:59 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Thu, 28 May 2026 21:16:58 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, <linux-remoteproc@vger.kernel.org>,
 <ben.levinsky@amd.com>
Date: Thu, 28 May 2026 19:16:35 -0700
Message-ID: <20260529021637.2077602-4-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529021637.2077602-1-ben.levinsky@amd.com>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|SA1PR12MB7039:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cf804de-6909-4263-37dc-08debd285d66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|7416014|36860700016|56012099006|18002099003|11063799006|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: Fay+azgUHKwL555qMDuV+ZVKQvN2SwqOnEqSuL/QLCcVr8374DBCLeO+rq1FXuuBFuuAH7aeuX5I1VzX4wanlOoabXFOuUdqbwvX9Dh/1hDE2GSV3iCdaRQgYSlxkBxgfw4g4Ew7zzmTzpsZnSnWHNz8tmIkClqRxxMqgB6ZZw1EnQz6lQiAJU+/r7SSuRdqcAT7ZhCQcodblkUKhDG0pdqzPY7dtM0lLwEVEwt7WGpoxnohnLpHFYFw4FVC93despdZ5qKTKOoud/b8OyyS/DSVXT4SEcMOsa/yMxSPvlfZh+qN/Tf71m6ywYCJ/HnSoBqeVV5yKvduArnHT5OICjjataYEhPd8Q/YYo9tFCngBPt20wGmCt7gl/lSDNA154s+VxpdW+b6drXyCjWiPt3G2TRq+7mHt6AKcr43HckU8ZAnWL1UWbUdVrs4Qa6K6CEd+LSe3li+K1wzgLkDfpNwderRcUpCT8hdTjYKD0aPGffT1Y40twM1okokxoRI8LoOq8N3CfwvHi3Ng7l0JGRaBdZTnKOf6MsBAedGshqT/dRnl3wDU/nbFwOZfRKkOoDiJidK2Us5OBcPKscxEhTjw5zdQj82xUVMiL3HJwrh7DvsGLPKi6n5Mbk+OnfIP5pnlnDTaD41UUQ7iBU29mCIC5gUAiYff/znlRr/gl3Use1QxCHu1y8xjcri0FPEnGOuDVBUocjzJxHczXbuLfuWAcIc6uQoob1PuEGpFtas=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(7416014)(36860700016)(56012099006)(18002099003)(11063799006)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fAdSOttbnIX7PY9BlZRxYTETvrKvBkS1qufxDtz2mjB0yRx6EJT6/uImYcqKEttzSkJOkZ/rHfKW7JfkhRwI2YsGTCEGVY9sM4E5WksSELnh2e98yfjThV68Z/hSf1p5cfbaiuJg57XhsUCaZJCoZSyF28aNBhzMQq6y4bKkTW3L/X53riPJV26EVVz3JkyTGm8w58uTsME0fMbm9kOyX4PoApEg97Gt6OrEgtfG3OXqbwEt7U9MhFmzHq53pztj+XndUWQSLZZAa5RXr21RnE5O41cMworex71LFxpBMLONJhDmXuxJ6bJ3z0Td1FP4A7WdBOqCfghukYZANv/7k10fLlJgvW40m43OsPM4TN3dYfJC2UAiAryWoq9QFob22DWUbL7Lt7EIzZM3k+4HTl8AXzZ1+gu3qGFEMsOgGJt4E53zcCYyJtIhltU51ATe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 02:16:59.5909 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cf804de-6909-4263-37dc-08debd285d66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7039
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
Subject: [Linux-stm32] [PATCH v3 3/5] remoteproc: mark wc-ioremap carveouts
	as iomem
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,amd.com:mid,amd.com:email];
	DKIM_TRACE(0.00)[amd.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.levinsky@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.735];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D497E5FC4BD
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

Carveouts registered through the shared wc-ioremap helper are backed by
I/O memory, but rproc_da_to_va() only reports that to its callers when
mem->is_iomem is set on the carveout.

Without that flag, the remoteproc ELF loader and coredump paths can
fall back to normal memcpy()/memset() accessors instead of the I/O
helpers used for iomapped memory.

Mark shared wc-ioremap carveouts as iomem so the framework uses the
proper memcpy_toio(), memset_io(), and memcpy_fromio() accessors for
these regions.

Signed-off-by: Ben Levinsky <ben.levinsky@amd.com>
---
 drivers/remoteproc/remoteproc_internal.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 46080c1c030e..9afda697271d 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -136,6 +136,7 @@ static inline int rproc_mem_entry_ioremap_wc(struct rproc *rproc,
 	}
 
 	mem->va = (__force void *)va;
+	mem->is_iomem = true;
 
 	return 0;
 }
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
