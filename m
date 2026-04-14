Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJmhEFRd3mn0CQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 17:29:24 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E22003FBD96
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 17:29:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A20B8C8F296;
	Tue, 14 Apr 2026 15:29:23 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 508A0C8F294
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 15:29:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDE7+SQRzXK9rii7CDoOPN3gyU4EPUa09rCQb5dgpeJGykKQM/5QkxL4c501+HvKQMUd6xWICuJOkV9lFVMBd4a9y3NxFT0UmNjsBSKESeejNmBqr56iXpB11zrUztfmCdFitMINZuOQ1rTZiu0v+zTFwiP/Nh1avv+Av8JX51K2/cDQaPgfJtid5w1OtLSrkJhyXRsYF2ztCxOp4el2kFN3riFzZkPfJMpuZxm01ZmIAIqRggKU+caNukFWQgW/LDzd1K+Cl/TmTSybIM/Y61Yd8QqdlXBn7RJueJgbOZhDXbfVg7y4a8k5f754VEH/7QMvZFy0HN1K1jFKWHZ2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pm8/p1FExFrdToopd8SF9C3n6lKIIRSJQ7IXBCNmmd8=;
 b=iNvWDyn+xpnZnIBXLFTdYp0Uspu7B0t0sCB5MUvfN4yTeYxeJzLI2Z+QHjx9DBtndqzzgVgQiV0dfWmWLkSv5qWyCNQYmRJBX1tJAyGbbprkaJ9d6UX/6xOmvgqdbuQ8saUQbsjm68ZXlws+aTJ4dVmhgD1fJ1QPXnn8vu8rCD8/YTZt/s/2scUdz6+bc1cgDQ/4bG4fCCgObqClmY/YhUYwUF7Se5U37tckLw4XwH93RzJDT+JqJiciSbE08/R2s+nYlFkmgRbTKTkGLUzXI/eOVXT4epDgfo0wLzfsfu+NI8EFmnLzK22Zwm1JA1TM0ieFnXe7XT4Kv1DSKbQ1iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pm8/p1FExFrdToopd8SF9C3n6lKIIRSJQ7IXBCNmmd8=;
 b=SNBUCSw/KiOMI7UxdZzgo3rmUl9qoFqNUlvxnQPKNVHqPmGYg9xT/mBufPCDi8Aap5XBdxL7buiAu/B2DzIIovljk73Lk3qcy+fAj4ZXEA7M7++oWMWpu6+WRrqN8t0WwsMvt2+HWSVH7dtDDVMwF88V9psTM5XNFcHQ5Ag7ld/obr0aeQPdMGFLjM0g+2+KbFXaciaapvmTW67H9X5oWH/eWX74XpDvL7CJoJdsN60PpPaumqlu5e5ZlX+Xptmvnvx6oZv8I9FO4qPw95UXExrimsXXKb1a8hDc3DvXciExYzEejIyNpCdt1pIgLztd1Cj9i1hLy5EdlUscs1GP2w==
Received: from DUZPR01CA0344.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::9) by DU0PR10MB5363.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 15:29:17 +0000
Received: from DB1PEPF000509E4.eurprd03.prod.outlook.com
 (2603:10a6:10:4b8:cafe::b5) by DUZPR01CA0344.outlook.office365.com
 (2603:10a6:10:4b8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 15:29:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E4.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Tue, 14 Apr 2026 15:29:17 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:32:26 +0200
Received: from localhost (10.252.12.46) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:29:16 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Date: Tue, 14 Apr 2026 17:28:57 +0200
Message-ID: <20260414152904.1679724-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
References: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.12.46]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E4:EE_|DU0PR10MB5363:EE_
X-MS-Office365-Filtering-Correlation-Id: 015f4e3d-d3a6-4087-fcbf-08de9a3a97b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: pXDkDYFK/lvufSQDw2rdOmYW/jTHhQ9CiUOQiQE6DyBHTtahdpH+tp4BhYYQpAqKI768/ehsUgcJHnAj4ZfFhON10egh4Whlae5hehO+EIuFi8XSqIdV5C8GNn3hp+vLf/mi5bKp6E86fWrhsvrihchPcKqVwt/hcdTdsYJS0Mcs0lBpnBTWRulmUBj4WXsITX4XaHPoQsfRICpjR/BaWjqdv21AXCUfsKyCg/hDGgIeavvF41GhplIuC3xGdvoB//SEzwsai67F98H8YNuGDzpXG9g0aA+s5nVY3uz0KR7fCkJnyQTf/Ax2zhd9JLqeZjVj2Gzxx4j/bEz4wt8olWyN8TFndQ0nC2+0yeQn4+84zy0esijWcG5V2GO86Ey8KytJhsudVISDIE4m9PncSXolHrSBa5gCw9KRAf34oxMCWBROA7hOI2txKXVPo7mq5S6ErN2Hj0QTvpo9DxpzrZU5YnEivavT5GhbtiioqBFFPsiYA8+MICn1rhqWODQ096EuuvferBCu3fc0V7H4foi8EVAtO7UlCb+R9st2dFgzESYn4zzoIPqaeD6dWwLJGThzJL0/XR2hbcdCEtkXM3b7o8dczn4I6hrrmXOOOXQI2JOvHOSNZghkMYjhlIdMeLz1hxJMP/7Nl+Aav4gE4n7W+2wDqRoEvIfac/Ko0vwh6ai4XO+9dVlf0CvvLrERNxV4OLx3u++kPGC2LvSvv3dN+kHhjSenxyXOzWVTiBdgOGMqRndCG8In46xbtmefJ+PDrLSC+PybzhQxU5CWYA==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DHFN7YwM+zhVUXj13LR2DTQI/KnOcW2jALzt02WJzfV+oGX7/S8Bcd0xO+JqYlaSTLsbqTzgkd1DcVuT80r6Zt+QMKtmLfjKdMHesGtHzqPog+AWegt5pqhPtzMvi6KkN/tCI/MGHYXgt73uKgow34WCTDyfujhXyprIkheihzqnQjsddpA0tGfOk9pGeGElUT4/EbUX3HfQ/C8PWzdHeoVoQV5ZtrzGtXcACzsRjeNM177liLhsVXbUpMc88qcja2pVaFVIlfSEWj6K2wB36GJEfu6yQH5AVkzrpVfRzWzPoqjJwLQVouJEL/2jDabRo7wHT7rT8EPRskkVckyz8Ow+sd7iTmAAj+3v7cJHWLharZNotKztIH7B0YUIwz8MpWgP5qBClkF2qkWOv5HeapVM70xWDjtdGzQIP630OIoNFc5HfFMcspPUAKCuvSWI
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 15:29:17.6316 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 015f4e3d-d3a6-4087-fcbf-08de9a3a97b9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5363
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v22 2/7] dt-bindings: remoteproc: st,
	stm32-rproc: add st, rproc-tee
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.152.150.128:email,st.com:email,foss.st.com:mid];
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
	NEURAL_SPAM(0.00)[0.068];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E22003FBD96
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add st,rproc-tee to describe the remoteprocessor control through the TEE
remoteproc backend.

The property is a phandle to the TEE remoteproc node with one argument
cell carrying the remote processor identifier.

When st,rproc-tee is present, Linux must not manage MCU reset/holdboot
directly. Update schema conditionals accordingly:
- do not require resets unconditionally
- forbid resets, reset-names and st,syscfg-holdboot when st,rproc-tee
  is present
- keep legacy holdboot checks for non-TEE configurations

Also add a DT example showing the TEE-based configuration.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml   | 55 ++++++++++++++++---
 1 file changed, 46 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 843679c557e7..7fe54d529e04 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -143,24 +143,45 @@ properties:
     maxItems: 1
     description: Default name of the remote processor firmware.
 
+  st,rproc-tee:
+    description:
+      Reference the remote processor node on TEE bus. The value is a phandle
+      reference to the remote processor node, followed by a cell specifying
+      the remote processor device identifier used by the TEE.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle of the remote processor node on the TEE bus
+          - description: Remote processor device identifier used by the TEE
+
 required:
   - compatible
   - reg
-  - resets
 
 allOf:
   - if:
-      properties:
-        reset-names:
-          not:
-            contains:
-              const: hold_boot
-    then:
       required:
-        - st,syscfg-holdboot
-    else:
+        - st,rproc-tee
+    then:
       properties:
+        resets: false
+        reset-names: false
         st,syscfg-holdboot: false
+    else:
+      required:
+        - resets
+      if:
+        properties:
+          reset-names:
+            not:
+              contains:
+                const: hold_boot
+      then:
+        required:
+          - st,syscfg-holdboot
+      else:
+        properties:
+          st,syscfg-holdboot: false
 
 additionalProperties: false
 
@@ -192,5 +213,21 @@ examples:
       st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
       st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
     };
+  - |
+    firmware {
+      tee_rproc: optee-rproc {
+        compatible = "80a4c275-0a47-4905-8285-1486a9771a08";
+      };
+    };
+
+    m4@10000000 {
+      compatible = "st,stm32mp1-m4";
+      reg = <0x10000000 0x40000>,
+            <0x30000000 0x40000>,
+            <0x38000000 0x10000>;
+      st,rproc-tee = <&tee_rproc 0>;
+      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
+      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
+    };
 
 ...
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
