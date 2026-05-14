Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJ4QG5f2BWpVdwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 18:21:43 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 544D7544923
	for <lists+linux-stm32@lfdr.de>; Thu, 14 May 2026 18:21:43 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 17C2BC8F283;
	Thu, 14 May 2026 16:21:43 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010040.outbound.protection.outlook.com
 [40.93.198.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A2FFC8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 14 May 2026 16:21:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uvb9NkY09fgT1nkcNlBuHXRBJvfwRRQ3l4eFaQrUq2ReH2ukUzG5Zwk4+Q49/yvBHhChl8YdCacSrFff334hEfWZO2k6U7hV7RgobClYaR4BQG2szU5aD0f2lX6sBqgMN6P09682j1NZIfPCuIej/6yY5VQKpykSZmzfkgqfiVbAC+yyZQlbS92ZqNOkdAj0VGmQfo1TBfE5phqjOZiVT2SOW8RipOanwkJyNCZx9WXW2IlAjmgRMwkR65d+aSKRGaJ3XldkU2Rfvl9bfyTLdvOdO7O7OQhUIFbcbQs9l9NmAgDr/k3ZNrE1poE8gzLQpNcejTDNJu2kwnXlAMcG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BaHCEaVR3rbn4h2Q4Xznk5aogu+104Y4m6f1awiSTs=;
 b=EFb8wbQ5P59gFM29Eq8NG0+YW0Idv4PKII1U11DytfunMj1LTaD7TRiNurZLphbgZ9U+wUqWSq3Infx0+LFkR1fS1LRMu4cEeQ+hs/nVTSL4pTfpWZg9vSt2COrNtCMM6b8CDLd7b2kBke5OUuicvH/Ofp6eWdohem2a3eEWg3nvPc/aglxF2ltoXExyiLhmFHj85HXTqjkeSN9rwE10ELhRtP/go9W5oECosVau7VYcuRNle3yVRRzBrbycsn++L2mdvndKvtJQFMtUz/9iiFdxz4lD5XllACSDd5iNVgN6YOajbPezOnPMbOEOvHRypuGX4mlIt01EcAcHqociig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BaHCEaVR3rbn4h2Q4Xznk5aogu+104Y4m6f1awiSTs=;
 b=SZCQnMRhp9qD9hCS/G1rPf8H9BKq9maDlXBPf/5VElYcN3FFSry/6UhdUCXk2Bn5cV4Hg0T/tlrJGSnNr0xgZ1p0PGoht+Z6L410wgUNirJO3J6vGzHllrWmzXqkbFX/WbEFLJRbz6/N1LYvG1Evqyg3QXn52K24he5bo+tAvSU=
Received: from BN0PR02CA0013.namprd02.prod.outlook.com (2603:10b6:408:e4::18)
 by IA1PR12MB8357.namprd12.prod.outlook.com (2603:10b6:208:3ff::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.18; Thu, 14 May
 2026 16:21:35 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:e4:cafe::2e) by BN0PR02CA0013.outlook.office365.com
 (2603:10b6:408:e4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Thu, 14
 May 2026 16:21:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Thu, 14 May 2026 16:21:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Thu, 14 May
 2026 11:21:34 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 May
 2026 11:21:34 -0500
Received: from xsjblevinsk51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Thu, 14 May 2026 11:21:33 -0500
From: Ben Levinsky <ben.levinsky@amd.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
 <linux-remoteproc@vger.kernel.org>
Date: Thu, 14 May 2026 09:21:27 -0700
Message-ID: <20260514162129.1504162-4-ben.levinsky@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514162129.1504162-1-ben.levinsky@amd.com>
References: <20260514162129.1504162-1-ben.levinsky@amd.com>
MIME-Version: 1.0
Received-SPF: None (SATLEXMB04.amd.com: ben.levinsky@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|IA1PR12MB8357:EE_
X-MS-Office365-Filtering-Correlation-Id: e7bb4dc7-704c-4839-c33c-08deb1d4de1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|7416014|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: 6CU6vVAhYR/rwrIzIXWTaN1j27XlOeq2JcaeIUphWKiWICmTu3we6c/eqQfyZ4N3JX6EKloHY/dgk7U7wooBITc1yHmk2Qdi/P5kcbicMWScJB7wEQPyoDLqyfqvyYkmySq10WIjQaBpsLGVGJXABIovPlhyuxWhhqm+YZHKT27NpkpqMn0GEHFRIiCyJPGOpgydAPHIM55KGa304yW/yi2gTKLdAD1SLPdPFaAYZAR9Cy2ZAJXsRI/ybAHmOtgrmYMRfqRLvaRBq634Lr1+fPxlW5rstjm0CHIUdVcOV++72JEkNKc1YxHhh604NYlJhOneFocA5YiT3ftG4a+fvlokFsiYoc3IiZ61rmTWBhKnwXAYWxww090iLhR6hnINpOv/9AkBVcjVXvs7BXrZlqp+YEQ343zZlq4G34cSZJs8tlSfXqSJk+YXRnZ96Nwjltrnx58lHsA6gi0ebX6qSSAOJ7eUYviVPDqeho9mFa8lC4dvh6f+fLz3UG9FYf4t3xSz6b07DeoaumqL2BAYmA8YwFSpyy5IBrpOYNdMDpYH0hZEedPc+WVfNatT1ZcvMW6arozOgpjPISYMKCSlzwiw3asFzA00NlyY3Ij9MdqpHTCPJ6Sv6SQ5wsknEKv9X9RDXq17nfRZnu5rC2V2QWo+AfvCwv2DjjteypHYZdY9chPtqzWMw+6fvTCdX/OOoTdbkqQRi+7lJ95Yts4Dv7lPpE/vO/hcK/hdHOAJ9WU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(7416014)(18002099003)(22082099003)(56012099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JJXTMFJ1pJsckgXxMTt2El6BCKu8mySqoJIE+4HAgkJWNh97UTm02NalJyUEsyt9FNOCubYnU2WLWLGwNgfH53vpKNvS1ee1SNlOwOchd/Robco6yG7OT62yA8KgmN216lddNNhL2CXsPkktooIjmuVx/DexRTGMcKS21Xkigb3uOaPLGgOqhuCnm5u1cDfiOfqw6aKdKXdXSllLZ8ZU+SLiMbeDkf2KOC8FQW6LmndzP7ulPisWq+rKP2x/wbfLoU9b++i6P8Ebon/Fc0TGtzjd9srq5YvbDWdjK0KPYZ3q1xjPfohnDtVVOj2tD0hrg8LY43k/E6UI6gugq/yv2Bs67yv7Fpk/skO2nb63McIU9UBimgP5t/JaZG2+FcC9as5/VFju7V6yA0Zf+dSR7WZRNf5RMqVAGuaLEYeJP45utS3A9oFZ+JzW1l0Damcg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 16:21:35.0179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7bb4dc7-704c-4839-c33c-08deb1d4de1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8357
Cc: daniel.baluta@nxp.com, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 geert+renesas@glider.be, tanmay.shah@amd.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, magnus.damm@gmail.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, kernel@pengutronix.de, festevam@gmail.com,
 patrice.chotard@foss.st.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 3/5] remoteproc: mark wc-ioremap carveouts
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
X-Rspamd-Queue-Id: 544D7544923
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	NEURAL_SPAM(0.00)[0.613];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: add header
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
index f5b34aabed5b..9955e512f073 100644
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
