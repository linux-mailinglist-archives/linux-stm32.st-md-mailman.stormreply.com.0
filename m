Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLs/BuggoGkDfwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:31:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 646531A445C
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:31:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 26D2AC8F273;
	Thu, 26 Feb 2026 10:31:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011050.outbound.protection.outlook.com
 [40.107.130.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A355DC87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 10:31:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grsgI/H7cPhX4iFE9HnE4fmHDpZsFmn10YEs7ORRmG1y/DQUHNjbwjkOpft1Erjw+Q3QgHnR3ip7jpgP9c2hpOk/9gis/B1ezc11s+wjIioRGM1J9mNOszBaqFFogZHnNfUSXNV2csuOeRLmfLiImWjfC24l7CKCdlL5IyNZOqaqSgnm55HdgX6PMyIH+iHeG47WK4rMAq7hq/tsUh02wkdVr13r/6XXy8FcsPVIGCefG5Fa5udl3Dh0JYLsjZ/spnIDy8ZIuvGP3sGKEBWO9orFHHBP0rnNMID8dW4ZJuYuCEV3UJbRtUNwo82RS+ZdI/rb6bYC46Dq5gmH6wAIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YpT8lCKbPssC4CKbfQp21d42km8p0Z/sscdsNWw8Vc=;
 b=SpfwwH9u+gzzIuEQyDfhf/lVFLxstjTLvh039rBXTurAwbbaOqRPhcOBd7Gv+acNFrNi6S5xTQpdek3RAoqjQ+4EkxIwBANV2a/WJrG2Nvmxshzzxu0pYnKJlLb4qDMpc58dg69/4IqHhr8ho90xmRB3w8kcQSkRPl0ZTW1IdYGS6mdB45vQkPtGNJAdZV7GWa7FQLDlg0iXCTfyY78I3IjPUwk9IZWRGhqRTfANF7QpCod2kGW8puYThc+xNxTSi97q0hHnPj36i9hBYbnGQbl1reyZcVaR2GvltcVUt50ebGmzAjvgGq53M15xPK2Y37uYwQwV7HjlhQ0nnPbE3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2YpT8lCKbPssC4CKbfQp21d42km8p0Z/sscdsNWw8Vc=;
 b=aoIdZ6ha1Q/3yeVAsNDkkII6HNQ4SXv4c7V+fYZOv0YpkfU5c60fY2pKPTBECMCI1Nvu9ScgUmYdfBadncbCyC8qsQyodrJOVtw68mRBTYyrsbYguswutUNAZg8o+7hEVytoKtTJC/7x0mgCKkajS6dkZPWRvxc6DC4hPlcKisz2WJCiOCsd1KNEBvBifzQHc8syjPWb+eqq4LV3AXuqVnwaunKkMv8q78Dx0nOd+2Qr1+YEuL9O63IlJEgV1EoREGyC2mRqKwm9+C/rTDibD0cMmksegruxHXB8vvJqdHIQYctzgl2as2GmBdX84AoVmHcV4RUVmOvFusQXzgqzMA==
Received: from AS4P250CA0025.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::15)
 by PRAPR10MB5204.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:299::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 10:30:54 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::98) by AS4P250CA0025.outlook.office365.com
 (2603:10a6:20b:5e3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:30:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:30:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:33:01 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:30:53 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:18 +0100
MIME-Version: 1.0
Message-ID: <20260226-debug_bus-v6-3-5d794697798d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|PRAPR10MB5204:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8a6208-3d37-4aaf-4159-08de75221f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info: TTS9YKd8hlT0rB5RuxcAditS6xJswtUNUikHzjaDSm0xns/uJfdx693WBbsu83buNJery+/Gr22UKRDDCX4ZI0q2714KxafpHiPTbPLDjqz+y6g8jHcPDHYrapVKXZF9OeBiuTrG5J6I8nymsgPE9tknOJUhzFiYtcoa4045r2wbO2dc/H771kCosHUzgssAfI5vqbkhcLrxv0j+RfVX4IG6o0l8wVS39h3guF0JFvfMPk+mhXm3jd7AtqBsiiSlrDjIFnM9Vk3Hu9SwfoWzupgqrGdn9lVXZhG6LZ2dK/E04MFiXyoQroi0v7YHVZkZ8v/PtkyTYIkcYhqO3RZqzZ4M3ER0J1PMwhRuVQ/68YsYEU1lZsrc7MynspJTYtggK3bkOa4v2NdGdcxuHweKhmibfxed3Arna8HCuqvNknSsAxwmZbE5D53kwEwGtNVDqVubgQWlL1C4A8Ax29cLIsN4xyksqKY9lb/Pa/KO86YEYxxk28wUyq9kvLXPgpe9ULN9qqkpUvRGYTa7YTvmyAB8OZ8/iojmwNjx7uT6sI4+ksLl6WB8DYkJL2Cl3DdzrJHNXqwe4Fs1LPFCdwSLssmItPyA0p9a7dOwGNpyTViTPc3FfrhvEC86uWZYrcwq3nhZ+Bn9/XnmSCLQjZgwsdlfR9652Cslt5K9udWJ9pnO02KgT3HKIepx1ptngkMtuBBpCCdvJcchRIjqiJDMFRCqOJTguX3vnhlsN2fWFcymYBXMpZEVK292qMBpf2ipWPuZhDtiD8NUMWtG8DkADQvjSzuUWHqJfFSMe22+croD3OKSXK//EGBf5bZPJL1B
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uST5a7nDkEnTEb7LadsfPU1FssS45Z0jCnMPeBG/ZrDrTu/Ze0TqLHI0aF+JPAnsHJp7JU2ShATdiZ4XBIVAQMcqH/bPrvLzBTgXuAJUw86ra04OWDxoHVDXWCXpeF1sHLNyf4PlXLU8/1PTQ8XPtYNyjaQCYwPKZEhiWNcj47sJeZiS4Y564Vd4x1q0lRZJrwoqk0BwIsm4G61OcQ4VxErbEqJ6KqSotwPm3OVJVnfeM+N5oQ8zYX4FClnhZuDBfywzvfvidUmz5YqaRNgtYU8nedNawt5DzE/RtoGp2dxx3qfGvbshBc9WX2dSK3CvcAMal4vxBMbBx23KOnvf9/7HgmEU+tiCDvUhImZRXgE2i8H2j6pAKeP/VQ7BZ+apAQfYImJX8jFiOBJ7vB0oc2IR71/A4Aec2IQJdNO66Gr3rNvFFeD6q234U9SYqfnA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:30:54.2653 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8a6208-3d37-4aaf-4159-08de75221f0e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5204
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 03/12] dt-bindings: bus: document the stm32
	debug bus
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:cristian.marussi@arm.com,m:jens.wiklander@linaro.org,m:etienne.carriere@foss.st.com,m:sudeep.holla@kernel.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,st.com:email,devicetree.org:url,2.252.41.0:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[2.252.95.176:email];
	NEURAL_HAM(-0.00)[-0.279];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 646531A445C
X-Rspamd-Action: no action

Document the stm32 debug bus. The debug bus is responsible for
checking the debug sub-system accessibility before probing any related
drivers.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/bus/st,stm32mp131-dbg-bus.yaml        | 76 ++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
new file mode 100644
index 000000000000..6c74433efbe3
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp131-dbg-bus.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/st,stm32mp131-dbg-bus.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Coresight bus
+
+maintainers:
+  - Gatien Chevallier <gatien.chevallier@foss.st.com>
+
+description:
+  The STM32 debug bus is in charge of checking the debug configuration
+  of the platform before probing the peripheral drivers that rely on the debug
+  domain.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - st,stm32mp131-dbg-bus
+          - st,stm32mp151-dbg-bus
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges:
+    minItems: 1
+    maxItems: 2
+
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the debug profile necessary to access the peripheral.
+
+patternProperties:
+  "@[0-9a-f]+$":
+    description: Debug related peripherals
+    type: object
+
+    additionalProperties: true
+
+    required:
+      - access-controllers
+
+required:
+  - "#access-controller-cells"
+  - "#address-cells"
+  - "#size-cells"
+  - compatible
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/stm32mp1-clks.h>
+
+    dbg_bus: bus@50080000 {
+      compatible = "st,stm32mp131-dbg-bus";
+      #address-cells = <1>;
+      #size-cells = <1>;
+      #access-controller-cells = <1>;
+      ranges = <0x50080000 0x50080000 0x3f80000>;
+
+      cti@50094000 {
+        compatible = "arm,coresight-cti", "arm,primecell";
+        reg = <0x50094000 0x1000>;
+        clocks = <&rcc CK_DBG>;
+        clock-names = "apb_pclk";
+        access-controllers = <&dbg_bus 0>;
+      };
+    };

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
