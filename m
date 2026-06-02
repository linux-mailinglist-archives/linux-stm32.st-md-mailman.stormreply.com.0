Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CYuGFpHFH2rrpgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 03 Jun 2026 08:11:29 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B941F6348F4
	for <lists+linux-stm32@lfdr.de>; Wed, 03 Jun 2026 08:11:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=e6vAiYnW;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6C2A3C8F271;
	Wed,  3 Jun 2026 06:11:28 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A24E4C8F271
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  2 Jun 2026 13:14:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xaYEC3uDdIQGKqOk5twxk76MHij1Av3/wiVnySkBJHbMposHvpTtuONAbRaD+jibjK65EIs96NYsi31foxWxlpELA7Ly7XW3KeBrNopblN8JpIU1SbsBmV6sHtaN8APm5pj+uaMBnuFUMfgl25LiT8hixoTHCsBeeoFcE8HFYiyUwIQ5JX/H0L+Fp+QpxKRao0bQ2LqcvcWTvMCfAbN2HTFva5WqT3VRuqOXqEboaehm4DSd97wu5xt4Q7K5HQd9N/j7K0YCtgsVecKtjd8sAuaUxgS5BbHw52hXxSkRshuhJ7LiLPsKg2MWDm8tw8aRPNPS3774ZYMbB8tTlb3Bzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3hPYCi5GhSF/VMpCP3aWC9ufDW6VFxMQD/0kHDRv9k=;
 b=tCMJJuUyrYKopL93gARNn4G635/wg6b0s+52HVWVPAeOnR37PV1Wx+xPE9QMKoGHAKRWA4yTCDo862TLO0ZzL3IODP0ucbvdT1yhvR/gW+3xNFutBoTYYXcFZX5PojFt8fSyGkRAS32sLFccyDQp8RY9LVf5cnxRcjx1glxkh5fmWT5aX7MO1vEMIWNhbDMBGGii5y51oqEUqsqL3AdYi3f/WC8fujJvyDdIlVNdTCjt+iUyO62WwfMDW9aDEQXQSd80yOUaSdizPvjFwdjlQ6GHeIEdKkkBzEjSsVgNpE3JldemsGDxyqNSoJ5M+fu43jCRYoxtWVLXzCsiTAKKhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3hPYCi5GhSF/VMpCP3aWC9ufDW6VFxMQD/0kHDRv9k=;
 b=e6vAiYnWvEfAtW57l/lGODy5xYKc6hc8BldlSwqLNARjorJayGOnx466TtSfZjAVyymPjwgMt4SL8ria/V4iWpxsqkRImwPTKenR39ZszRzh26nE0vuGpP0OEDhDaYaZBaldV7s5Iq/q/xNIt/sh0/dviDxZvtZ1F51zayKX3+Mn50JNQandrM4zKZXMbWlYIkw5QRAOjThp1kpOT4JzkdSRtu3MG7bNXcmso9yvaLYp4HTTR2ZV1h/XHVEMmDIbUTm1Ae+yQ0nVjTppO/7C4CdA1x8J/bYW7RmjnKxAOAnbySuImhDtwttd+S4far+5jIvcQNI/3LrnNRtpv9r+Bg==
Received: from DB9PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:10:1da::23)
 by VI0PR10MB8834.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:232::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 13:14:43 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::72) by DB9PR05CA0018.outlook.office365.com
 (2603:10a6:10:1da::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 13:14:42 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 13:14:42 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:18:51 +0200
Received: from localhost (10.130.77.119) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 2 Jun
 2026 15:14:41 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 2 Jun 2026 15:14:05 +0200
MIME-Version: 1.0
Message-ID: <20260602-stm32-dcmipp-pixel-pipes-support-v2-8-3c76b5f93157@foss.st.com>
References: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
In-Reply-To: <20260602-stm32-dcmipp-pixel-pipes-support-v2-0-3c76b5f93157@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009527:EE_|VI0PR10MB8834:EE_
X-MS-Office365-Filtering-Correlation-Id: ef45e967-1f19-4ea9-2782-08dec0a8e8d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bxxHiikQP9vcoER8301cFl+KtXS0mNx+oCRke8hHPO616M81Apgg9d/Bos/InEBV51ELWhAOKlZct3yi7G9suDeP0PfdM8PMHJCK66Z+SKyonh2PvRBhRlGsSoXvwMxACy3RYyoAc5cwSnYkLCXZSDDgJP69E4xkZtF+TiyuLPLmIUYsVTQgJ4yzLXxpsFD2nMkW0GuHqVkdrD1T08DtVHT7pxreiqg9cNJd6zWDJkYJJrkAlY6G7mtno8u/8B9NUVaGMNeDH1dEXhA+OK93+aw+zcMRL2KvJgJUgoYFJL22YYu8Jo8R+h68S3D600rc7RIJyMiS+cz3KJW2Iz9FMgVDiZ+STBmJVKdlmWL7g7wfA6yoTzSrO+PSHp2ka7ShcBfHH0wVpQWFZEWDabECDDMDUI8OfKCsbt8r2XWX4qOTNZSXDI3fcQwov5unxyNNFhkNf7O+VmIx4mpWQGUa6PFxWXZHYhXClHjUFM6ihloD3Il6kTj5Vv0dyQeOuWifAylsEp8XXT3AQT7eNuKsXLnjrsv48E0wnsL2jJ6+/Bg5YhDN1hJDXUz7sPtXouvl8hFt7bu/W3VUyGW8vHc0m9X/Bdx2IwmJ5An98uJocUVj1v5CTae3sxKRDn0LzBMSVqNGsurLWIo3xjeqa/va9XPRUiZXNRuTqjqAQIlD5XorKdci2YffAU5v5qv3xXAaiO3PUSgtKdJ8ywHt+HNWVAsDEG3w/hPUotNhUZI9AmI=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xf5giYxdn5rD7Z09IieAY+Sp58noJzvlbcEjIPWmje8Bnf5SQmDj4RBuoyV3weou6vEyGsB+U+TmErAxEFPI54ZC87pa/NuAfLuKRxM+l+2xPWayATgPTBZbAGMdNX5jKANvf/jgXsHeq52HTzyMWQR/4EVZ1DpLVAJ1KzARSM9A42D4LE8Myo5zB8S+axEKThS8gcw9yngxiUSeYWEiRK7zWOsSgM7I3x4Kh7bL4MTsjBntfU+ifcc052Sa+N4/BqWhMK47iOEVgdIQCmLNeqv1e5mOImBHoIWvWBBniChoM9GY85SQync3N0KkElb3Gd+fu1g/NXgMHQ62yVtPDXsIbqhOzQprInMs1lHPxhXggV+nIarZgXmvn14O9YtdF2JKn9XMNYDOOFl4ztKZgcvfCCrvXBnBr2qLLzllJ/7rdIDrkdL1wwbbaEIq84d1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:14:42.5031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef45e967-1f19-4ea9-2782-08dec0a8e8d0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8834
X-Mailman-Approved-At: Wed, 03 Jun 2026 06:11:26 +0000
Cc: linux-kernel@vger.kernel.org, sakari.ailus@linux.intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 08/13] media: stm32: dcmipp: add pixel
 pipes helper functions
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:alain.volmat@foss.st.com,m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,foss.st.com:from_mime,foss.st.com:mid,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B941F6348F4

Pixel pipes are made of an isp subdev (only main pipe) and a
postproc subdev. This commit add a helper functions common to
those 2 subdevs such as for handling format enumeration,
set_selection handling, so that they do not have to be
duplicated in the two subdeves.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   1 +
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 +++++++++++++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +++++
 3 files changed, 222 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index 159105fb40b8..54231569ed6f 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
+stm32-dcmipp-y += dcmipp-pixelcommon.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c
new file mode 100644
index 000000000000..8b0699e870ef
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2026
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#include <linux/v4l2-mediabus.h>
+#include <media/v4l2-rect.h>
+#include <media/v4l2-subdev.h>
+
+#include "dcmipp-common.h"
+#include "dcmipp-pixelcommon.h"
+
+#define DCMIPP_ENT(id, pad) (1 << (2 * (id) + (pad)))
+#define DCMIPP_ISP_SINK			(DCMIPP_ENT(DCMIPP_ISP, 0))
+#define DCMIPP_ISP_SRC			(DCMIPP_ENT(DCMIPP_ISP, 1))
+#define DCMIPP_ISP_INOUT		(DCMIPP_ISP_SINK | DCMIPP_ISP_SRC)
+#define DCMIPP_MAIN_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_MAIN, 0))
+#define DCMIPP_MAIN_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_MAIN, 1))
+#define DCMIPP_MAIN_POSTPROC_INOUT					\
+	(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_MAIN_POSTPROC_SRC)
+#define DCMIPP_AUX_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_AUX, 0))
+#define DCMIPP_AUX_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_AUX, 1))
+#define DCMIPP_AUX_POSTPROC_INOUT					\
+	(DCMIPP_AUX_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SRC)
+#define DCMIPP_ALL_POSTPROC_SINK					\
+	(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SINK)
+#define DCMIPP_ALL_POSTPROC_INOUT					\
+	(DCMIPP_MAIN_POSTPROC_INOUT | DCMIPP_AUX_POSTPROC_INOUT)
+
+#define PIXMAP_MBUS(mbus, applicable_pipes)		\
+	{						\
+		.code = MEDIA_BUS_FMT_##mbus,		\
+		.pipes = applicable_pipes,		\
+	}
+static const struct dcmipp_pixelpipe_pix_map
+dcmipp_pixel_formats_list[] = {
+	/* RGB formats */
+	/* RGB565 / RGB888 */
+	PIXMAP_MBUS(RGB565_2X8_LE, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB565_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB888_3X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB888_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_INOUT),
+	/* YUV formats */
+	PIXMAP_MBUS(YUYV8_2X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(UYVY8_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(YUV8_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_SRC),
+	/* GREY */
+	PIXMAP_MBUS(Y8_1X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y10_1X10, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y12_1X12, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y14_1X14, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	/* Raw Bayer */
+	/* Raw 8 */
+	PIXMAP_MBUS(SBGGR8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB8_1X8, DCMIPP_ISP_SINK),
+	/* Raw 10 */
+	PIXMAP_MBUS(SBGGR10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB10_1X10, DCMIPP_ISP_SINK),
+	/* Raw 12 */
+	PIXMAP_MBUS(SBGGR12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB12_1X12, DCMIPP_ISP_SINK),
+	/* Raw 14 */
+	PIXMAP_MBUS(SBGGR14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB14_1X14, DCMIPP_ISP_SINK),
+};
+
+const struct dcmipp_pixelpipe_pix_map *
+dcmipp_pixelpipe_pix_map_by_code(__u32 code, unsigned int id, unsigned int pad)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dcmipp_pixel_formats_list); i++) {
+		if (dcmipp_pixel_formats_list[i].code == code &&
+		    dcmipp_pixel_formats_list[i].pipes & DCMIPP_ENT(id, pad))
+			return &dcmipp_pixel_formats_list[i];
+	}
+
+	return NULL;
+}
+
+int dcmipp_pixelpipe_enum_mbus_code(unsigned int id,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	unsigned int index = code->index;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dcmipp_pixel_formats_list); i++) {
+		if (!(dcmipp_pixel_formats_list[i].pipes &
+		      DCMIPP_ENT(id, code->pad)))
+			continue;
+
+		if (index == 0)
+			break;
+
+		index--;
+	}
+
+	if (i == ARRAY_SIZE(dcmipp_pixel_formats_list))
+		return -EINVAL;
+
+	code->code = dcmipp_pixel_formats_list[i].code;
+
+	return 0;
+}
+
+int dcmipp_pixelpipe_enum_frame_size(unsigned int id,
+				     struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct dcmipp_pixelpipe_pix_map *vpix;
+
+	if (fse->index)
+		return -EINVAL;
+
+	/* Only accept code in the pix map table */
+	vpix = dcmipp_pixelpipe_pix_map_by_code(fse->code, id, fse->pad);
+	if (!vpix)
+		return -EINVAL;
+
+	fse->min_width = DCMIPP_FRAME_MIN_WIDTH;
+	fse->max_width = DCMIPP_FRAME_MAX_WIDTH;
+	fse->min_height = DCMIPP_FRAME_MIN_HEIGHT;
+	fse->max_height = DCMIPP_FRAME_MAX_HEIGHT;
+
+	return 0;
+}
+
+int dcmipp_pixelpipe_get_selection(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_selection *s)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+
+	if (IS_SRC(s->pad))
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+		s->r = *v4l2_subdev_state_get_crop(state, s->pad);
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sink_fmt = v4l2_subdev_state_get_format(state, s->pad);
+		s->r.top = 0;
+		s->r.left = 0;
+		s->r.width = sink_fmt->width;
+		s->r.height = sink_fmt->height;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r = *v4l2_subdev_state_get_compose(state, s->pad);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+__u32 dcmipp_pixelpipe_src_format(__u32 input_format)
+{
+	if (input_format >= MEDIA_BUS_FMT_Y8_1X8 &&
+	    input_format < MEDIA_BUS_FMT_SBGGR8_1X8)
+		return MEDIA_BUS_FMT_YUV8_1X24;
+
+	return MEDIA_BUS_FMT_RGB888_1X24;
+}
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h
new file mode 100644
index 000000000000..db29e1fe939e
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2026
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#ifndef _DCMIPP_PIXELCOMMON_H
+#define _DCMIPP_PIXELCOMMON_H
+
+#define IS_SINK(pad) (!(pad))
+#define IS_SRC(pad)  ((pad))
+
+#define DCMIPP_ISP		0
+#define DCMIPP_MAIN		1
+#define DCMIPP_AUX		2
+
+struct dcmipp_pixelpipe_pix_map {
+	__u32 code;
+	__u32 pipes;
+};
+
+const struct dcmipp_pixelpipe_pix_map *
+dcmipp_pixelpipe_pix_map_by_code(__u32 code, unsigned int id, unsigned int pad);
+
+int dcmipp_pixelpipe_enum_mbus_code(unsigned int id,
+				    struct v4l2_subdev_mbus_code_enum *code);
+
+int dcmipp_pixelpipe_enum_frame_size(unsigned int id,
+				     struct v4l2_subdev_frame_size_enum *fse);
+
+int dcmipp_pixelpipe_get_selection(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_selection *s);
+
+__u32 dcmipp_pixelpipe_src_format(__u32 input_format);
+
+#endif

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
