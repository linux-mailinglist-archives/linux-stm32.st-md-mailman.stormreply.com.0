Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAuFCFRd3mn5CQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 17:29:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E17923FBD95
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 17:29:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9587CC8F294;
	Tue, 14 Apr 2026 15:29:23 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 466E8C8F293
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 15:29:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLYAxrmh5MFb2EiblkN3PmvkGHuz4k8ObWFMXyYJ1m+yhv4uHwxkW1xRSiK4TbbMQB/YcZ2EY/jkT/TSKHgSQc3QYmoohS8srs50Dr1V2EH4JgboueCbXFEZqG4gKjxZwZ+GYWHrhstQorKzi1gMA5KP2zq4MmyLbanM/vAlaPuq6VY7HhFsFyI2U+dV20uSkMqWpcH5B1aR42usU79FqpDidl7oLpfwKWy7Y6ADUnN6ZeZjddcF3fbAnnFa44XbQj0akA8midMGrl9hLBPMmeNRlBFKLjG6FDUKTPCT8UiU58mRcoj6wtSD5+XkcjG3mU8cRR1nMVP5f+Hin/CAvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reO8FkVOSCmvh6cNS+XOBBthpeRomlgGJxelQnXGf7c=;
 b=BdyJ4JiCY/5kj9sYFaO25fCGVrUfeJ1gUkLwuCg3TwypxFLV40NWU9N2q6L69PDt9jjdysjHnWSvIYjTUZ9WgoSAOl8yoKxq7BSVkGLnC9vI7Ve4psnfS3/K6WjF/0tIeS1uRfpeGzINt4sS0onedV1mEFQiBq2Z9dVRvA94F/PQK2hR/VmU6mcsQJyVpI27bR+Iz/bh2ZpcUr/HSdeq5+iqrzh2MxFMDcdLSRIIZni9iju1k2mb56CfkSsW0rKUPdDDMDxHNBi2Fbh0EUHyINK96H3qPBYcuYdiF6WGSdCnCUpCt0kqxvGIq/x/fmEDGiu0OuUjS/EpFdoUWkNDZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reO8FkVOSCmvh6cNS+XOBBthpeRomlgGJxelQnXGf7c=;
 b=OYbQrftPixs49tSY4a6AbbXSkrbrODcvKcAXgDAoGCaNZspy9CmgaNXJOIXACVdqQlW67eeCVNOAN7tigoYBtqA1YxNk7+ty+jwDfbZCfflTqepga915py0oe6GdeJkee8Fcgqr48CkjICvuF9odWwyZWb3J5Wh4NhVwKbCrJ5qMEc39pF0Wzh8vLJh2+FvFU/Li1XwH8czlFZ32ngk1sahWRgs/FoiXrbB+HxYSeSGuVimh0RiwL5xENPw15ETLO0UOt+prJRFi6SpZGyFXHhl6x6PEV052jT9LtLf+JnXptYeeSvafn+/wvKUqbEWQhe8YAuL41llatOUvc3UjAA==
Received: from DU2PR04CA0048.eurprd04.prod.outlook.com (2603:10a6:10:234::23)
 by PAWPR10MB7198.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 15:29:17 +0000
Received: from DU2PEPF00028D0A.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::59) by DU2PR04CA0048.outlook.office365.com
 (2603:10a6:10:234::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 15:29:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0A.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 14 Apr 2026 15:29:16 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:32:04 +0200
Received: from localhost (10.252.12.46) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:29:15 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Date: Tue, 14 Apr 2026 17:28:56 +0200
Message-ID: <20260414152904.1679724-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
References: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.12.46]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0A:EE_|PAWPR10MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: 614e3259-31d6-40d2-072e-08de9a3a972e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|18002099003|22082099003|13003099007|56012099003;
X-Microsoft-Antispam-Message-Info: VmAP85iVx+bvd+XqJMs8KQIefkELkuNuaFXVeSZOhMwS4f3DHU0fWir/esKQUvtvqPl75ha743MDGCNY+lI2tXF/Dfg8zDafA6+pHNH7xFDLZ8Ofsv3eP4Y+HC65mjLpAr7cnVjTGHRZsGY8alQKy4TXwX8QD8XQ1e3OCuJg5AOv/nZM+886hHlaxVAJbM0c1f/ZSZ4S1EM7UqNKDqhvhKlRnBmm9TxyJLbHJ3FfUoM40/73ZJSctu6dZsVMxNfpjs01HbJQgyJnK+0/lwWhR2TbvMfKmQBBdHHs9dvP6hzJ+eXXCL08lZqiQ8FTRao5o3qwdWBHfC0zhYJ0V7W5LME5UIwPoFalt4XRvTbrvAteSWePA+NTplrTZTT26oHpLaJSy9dGAJ/k2nnEjG8bhzzB34Y8WrPmAYLzM4F30Uwl/KHVYcue+ppCDasVGMsc9cez7Exl8f02ph74Exas95k1Mk2Vo9mq4nvGghQbPek6Tf7SHk7qkrZSIeLmfwHXcFCfoepvYmg5VpWhGUKzxSkRRGtO5lVd4JAcz9GFonUrykzSJ/th8vJRm3siVDPSiyGaj0RRTPGW+hanrV6aO5xdAtdGC8c35dz3G1OdOuAU7XZC0YnhDiGJ6z8C5UTR1BXKtkBsZl1Z07jWuYnJoJQfeMvOjBfXCQAfT2iR++oOYvgov8DXxIS4vjXS81gXOrPXo4b6AgK/MJOPrjJC/ZC0TGU5J2OwafTGp1y7mVg=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(18002099003)(22082099003)(13003099007)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7Xbfp0B7/V6RVxNjkxj24oyoIJRP334N+gWsm5feRMoUvqkN6aepSb9sJHdrkuPNW8m/HqWsrIMLA2T+UmQn/6i5hUeKqS8fRA6w0+LvgyAAZlvZ9y+I9cUfu1zxMiAkKcHaI47OwexbJzJ0QVvcERH4AFbW24DPgLg9rHJQ9nAdZd5WYPy3mQVezf5xZ9tednFOQD3ZX18hiHIBesslOgxjtzbLGlHOcDmRKRvPYMG0gnbt8HWfodIBASLd8yoXBsjWoQizBKyTwRMoQ2J2tvicfnJND5uNUr7xreqda0ku2aLcNxTVUkSJ60242ni8LVlITIrKO8CxLYa7q5WObnCNW1qWs22aTqCZxRNB/rYC5/2nGXPRbtyZnzLJ1oXsq1t/0V3B/XxvgYJ7m7v3wcp6S3JIkfxm15fjMEG1t8+tOWQFzgo7AdUK/q4WDYaN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 15:29:16.7247 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 614e3259-31d6-40d2-072e-08de9a3a972e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0A.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7198
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v22 1/7] dt-bindings: firmware: Add TEE
	remoteproc service binding
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
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:jens.wiklander@linaro.org,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:op-tee@lists.trustedfirmware.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.629];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E17923FBD95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a device tree binding for the TEE-based remote processor control
service implemented as an OP-TEE Trusted Application identified by
UUID 80a4c275-0a47-4905-8285-1486a9771a08.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
v21 updates:
- rename compatible to exactly match with the TEE UUID
- the remoteproc device driver is no more declared as a child,
  but use phandle as done for the SCMI.
- remove linaro,optee-tz bindings update are now useless.
---
 .../bindings/remoteproc/remoteproc-tee.yaml   | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
new file mode 100644
index 000000000000..498a7e590905
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/remoteproc-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TEE Remote Processor Control Service (UUID 80a4c275-0a47-4905-8285-1486a9771a08)
+
+maintainers:
+  - Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
+
+description:
+  Node describing a TEE-based remote processor control service implemented as
+  a Trusted Application identified by UUID 80a4c275-0a47-4905-8285-1486a9771a08.
+
+  This binding is intended to define the interface for remoteproc services
+  implemented as TAs running in a TEE, and is used by the a remoteproc driver
+  to bind to such a service and control a remote processor through it.
+
+properties:
+  compatible:
+    const: 80a4c275-0a47-4905-8285-1486a9771a08
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    firmware {
+        tee_rproc: optee-rproc {
+            compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
+        };
+    };
+...
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
