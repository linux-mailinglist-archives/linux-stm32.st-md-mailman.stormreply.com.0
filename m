Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC5AFswgoGkDfwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:30:36 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 402251A4410
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:30:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05B32C8F281;
	Thu, 26 Feb 2026 10:30:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E4B5C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 10:30:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwCKXY+5yiO4sMkV3LCrRuxdSblyZj5WMvpFyCQDq7zQ8CqUOV86KIhHjZyFmIJgulC3Xj9K4it7dm8glqGANIWRCAfUMhdNcnmLnky0hpARCMfOOVCbLSJrqTfuzlFtNVHeCnp0RCaA6/DD/CRE+wlUPpu8wcpwvU+prsVAE0QzdcyHMIgDV/Ujj6j6DI/8Q4RqBRxZQSkjDlj9XDz95dQ27Ps+CeUGsPVPCCh3dIrHkE4ZH15VxlCmI4LFiFNkBGgRKIzjhMM2IXl0sCc57pEnzVENnolu7Lvk4j/W1R1/NKWpb2YxntsXPw+sUsuFZgrd2e1voSCokVwRmPfs8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srWL9bt58H8X54p4YAG4fjaV9EEKOcR5MTMc7HXPiu0=;
 b=xfwCljUusrdqH98KM2bJxOlvw7BthLGDVGc/2X6SciDnSMHc8lxM2WTickox6zVwg8ZWK8X1xtRoq5RY5RZI3OgRBH6gtRLnzdMekmJ9KDlrTBLzt/dnyssj4L8pyvvZr4zla9gCnzmwA8VJ2fLny6uUkzRep3ObJ51+TyOc+cCG3Rrx89ecpni4d8Y9+hI92DAZmHGlNg2WS68ZwiN+5PMCGjwUSwWQKq3Q/NzfeNLrwjDBYIL0B8ZyDSw9aqcSX8+9aTr+F2q5lUMyFY5p5BWySOyNfabQcO9SeJJkXHAKaRQMTB7nLctEYbTArlDlHsoPZa9awQKm8ZwCg1kPhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srWL9bt58H8X54p4YAG4fjaV9EEKOcR5MTMc7HXPiu0=;
 b=k9X1mjNCNXE0p/A/prGycWbR/YNuPZ1jY5GMCTydPJSjUihezA+Ijvlekg2U7OopZH1RWgW1qwTRbkp02OAMRckGOBPOPGfvnQPY8DiAQy6AQlNBpXiipKlEPINdNI/bbbtv6JqT6t9FS5pYdvuehc7erySQhLpOaCJOuB88BIQL5AifxVRmA69qmQJfi0JxmMLBmgPEvaXYkQY2ByV9f1TKedSOaAG7P8PvcoAZQ56CUPmyT+r61XbQHtUeJAKBQ+lZuwNiSLflWz/ry7Miv1uk0Nhy4Qz94B6WvCO3j1nhcuDaA4HAHSlwcLJyXeZKZpwQZPa92IqapTT8XstCbQ==
Received: from AS4P192CA0026.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::10)
 by PAVPR10MB6839.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:323::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Thu, 26 Feb
 2026 10:30:33 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::eb) by AS4P192CA0026.outlook.office365.com
 (2603:10a6:20b:5e1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:30:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:30:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:32:40 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:30:32 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:16 +0100
MIME-Version: 1.0
Message-ID: <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
In-Reply-To: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
 <leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
 <legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
 <jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
 <sudeep.holla@kernel.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9D:EE_|PAVPR10MB6839:EE_
X-MS-Office365-Filtering-Correlation-Id: d38a0db9-b148-4337-260f-08de75221248
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: zbGMnGh8FZLKvTR9BHD9xvrScXRdh9VDC7c+FFHWeueHegFdKO2eqOIVc6NXVNXH/G/Kq6jzWmh9+AtllIxxZuQ/zYOCM/GYu1KvTGTxxIoR14BTjaxrhk5ItjGyXQQCp/WLeRwmGC5+EBatew893SbY8sURm6L4003kDQUQ0r30dUyDzJiCcipxWz/4ODnR8UQ5FNqwsBRcP7D1gcAygoCiPT5LDiGaKBHTgY36QWuooeyzKbj8fzMYZ2QBNWILiAi7jlVVHNB0bKRE4g5Pgw4A82vbJs+wndtBk0vHnsnOr18oLNVUCC4MV+Hu/NhlUj46UC8MUxUD9cfpuDHhnrt2LnDemf1HUoI3IzHiqbhesZmj0gylptksbCYdtfMOi60AyuAVI6jYM+zF0vQjGLIw5p1pp1Th4FoswxBZVa7MTx1oYjZIRove4rXLXoqDrv+9D4aS3PMZiZLzVf9ilH9FudaKwS83NqsyqMs+n+NhIsEV9kxpPpZj9ltqDPbVmsjQGCOpjBHA0bjUrodX53lQeEEytAGcFADc1k9SDtsGhqVO4IXRYwUii8JY87299TI1BG63XBRYVB9Xxurh5itI7hXQI5QO8IGiYLzzA4H4xGZjt1ihg2AMWiDqocJs2FT4yCTnly6daXUOHO6ZjkVyYUNnC3r3KJilyv5eyXp4ROiKeuLTGgPtS4S7QGj3EjZ1bZTsOf6a8co6P00X44DA+b/MO68AeHl+6/JhH6AiJV/VRxIx0rFcvLRdGMJb6MqawqhJPyyGYuUas4eRKKltPQrVi9LssqR3oojs2zaqn3wemlh16b+WOa8t/yIBviwBjE7+z7pzBAUShlovUh9cuCxxrFxwXw3zh9A47MQ=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZYNxRUWuBe7IS92ebtRUBFMUp2hhen+Ys7UlhJCflF1FKHQIgU+RzBBaZXoe23rWGor3JZfpyWiCzVav96pDqM7ZsxLW/blPKbC/O5OCcnZWoXs8m5g9Hgqf1n6Ci5NFXzDC2KHX93pFfScfxPYOu77W44GIxW9W88bpbYAwoKaqhaxUhf4aOHDQ5dY5b5bOUbeT27mU7KSR8/EwZfEx6y1M9BNTuhDkzCltIDHn5gd/lR4NDDpJMJLmwIBdI4ro6M19qzC3US8xYotRPIf+ihV/uv4JfUu4Fr25pu78TH2BrFzY3gzTi17H+//b+4xYuNZCWydOkdkv/tjqPfu8OGYhCHV1WNC56t/yqnW5AArDuegem4JWgsuub60s0otWqjG9iw426Um0OFojINQXzSF+WShqjO8Mg3B4K6oeQJ+YGNevVtrQ2ktqU/EIyVD6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:30:32.8470 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d38a0db9-b148-4337-260f-08de75221248
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6839
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 01/12] dt-bindings: document
 access-controllers property for coresight peripherals
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:cristian.marussi@arm.com,m:jens.wiklander@linaro.org,m:etienne.carriere@foss.st.com,m:sudeep.holla@kernel.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.108];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 402251A4410
X-Rspamd-Action: no action

Document the access-controllers for coresight peripherals in case some
access checks need to be performed to use them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
 .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
 Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++
 6 files changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2a91670ccb8c..949444aba1f8 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -128,6 +128,9 @@ properties:
   "#address-cells":
     const: 1
 
+  access-controllers:
+    maxItems: 1
+
 patternProperties:
   '^trig-conns@([0-9]+)$':
     type: object
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index b74db15e5f8a..b0693cd46d27 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -78,6 +78,9 @@ properties:
         description: Output connection to CoreSight Trace bus
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
index 71f2e1ed27e5..10ebbbeadf93 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
@@ -118,6 +118,9 @@ properties:
         description: Output connection from the ETM to CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - clocks
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
index 378380c3f5aa..f243e76f597f 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
@@ -73,6 +73,9 @@ properties:
         description: Output connection to the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 96dd5b5f771a..9dc096698c65 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -128,6 +128,9 @@ properties:
       - const: tracedata
       - const: metadata
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
index a207f6899e67..29bbc3961fdf 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
@@ -70,6 +70,9 @@ properties:
         description: Input connection from the CoreSight Trace bus.
         $ref: /schemas/graph.yaml#/properties/port
 
+  access-controllers:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
