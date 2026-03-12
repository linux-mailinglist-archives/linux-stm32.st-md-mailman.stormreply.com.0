Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH4EJ/QAs2mQRQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 19:07:48 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 34916277031
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 19:07:48 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D1274C8F28F;
	Thu, 12 Mar 2026 18:07:47 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013005.outbound.protection.outlook.com
 [52.101.83.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 99138C8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 18:07:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NOK4EHfNFT/ahMY8wmkyeZmWZtms0hbhVj2vWNu2WDz65DQ9l/ENqWaiJKREzY/Brrz032wtMfzkqQ6Y1JFgosM8xvROFZjiNRJEQE8ERvBAY6hBY+OmPLfiYd9kherdoqy+tS61TOejmlrCjm9RnuvfHZ9OIDOJzkgooFYDZ0Zu88VwUvWBVyJqcb0sNyIYT+snuzSt+nb/yffAgpyfqQBzoKbMWDoi6impjizDl6/yS2xGy9Xb3Pw9jizVkAjAxcCcMumaoWWPvn/1SasT++sGs6M6pryfPFqY9IRHJHgOJ6JgIdAWLN9M8s2VAOPqfASeyiR23+/hMhx756lrWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R55QbJljTiHFEbnNkjyT77w5Y3/q5z2Pb3PYw2JisRc=;
 b=TfPquJEWVNDXOn2lSUtPVCznLn+xN+SRYEUyft8gZWFZXvZE8wvqtXw33kTX7zOW6P+/3vhjFw2saHOKEpka0yOdCaxHKYMLIDY3wP82Dn5jKjc90jKkJUiW32JzHPJbqQUcpTak2eJd/fm4ySwYiWZZm+3u6wxoErPrZHCrH0ILmu3yLfHDDDddAR5s5hPhC0MrIHi4QaO0QIZqz7eRx7KkaPca3rEFpMJOjh7dgU3wfE1AtVzVjTBZLUUTgp+3MpZqil4WlK6uRPx7X7v6SVTJyzapZLJsrebGRn/1FhxA5iWXGpUgkrRc5yp2reuBgpvH+xeVOafmYCryFOzuPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R55QbJljTiHFEbnNkjyT77w5Y3/q5z2Pb3PYw2JisRc=;
 b=LuQnGydc7wnNT6dJBiLi499gQd8LG0XHzEvto7ejXTEqfLuYTTZS5DFJQ7FNyoBdFcJCkWA6dyimxU3Ny98C7C9xAyDD4P/LnTPkTtzwV4DjaRQiU8CSsB8QKfQhN328sHF3pREqLktOxmQ3dDU2gM0zbolfx0HNOYG9/TACOd6FDvPguncyNWOID2mAE2qaSvMsXkmhds9/+OmxPcTP6Npzrn0Wmlxc8kIZwVGyzHKCNiqJBra7IVzGcKcri0O2oHrqJQXkSKlWPVqXT5K8hY7fwTf4js+Uo6cFdI6WVrHFdKpFvz3dRBDxd0VR88v6Mr+FqMZNPusA6ogloGR49w==
Received: from DB9PR02CA0003.eurprd02.prod.outlook.com (2603:10a6:10:1d9::8)
 by AS8PR10MB7681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:631::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 18:07:44 +0000
Received: from DU2PEPF0001E9C2.eurprd03.prod.outlook.com
 (2603:10a6:10:1d9:cafe::8e) by DB9PR02CA0003.outlook.office365.com
 (2603:10a6:10:1d9::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 18:07:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF0001E9C2.mail.protection.outlook.com (10.167.8.71) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Thu, 12 Mar 2026 18:07:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Mar
 2026 19:10:10 +0100
Received: from localhost (10.252.14.128) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Mar
 2026 19:07:40 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 12 Mar 2026 19:07:08 +0100
MIME-Version: 1.0
Message-ID: <20260312-stm32-dcmi-power-domain-v1-1-07cc47216a76@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAMsAs2kC/x3MQQqDMBBA0avIrB1IRmnRqxQXMTNpZ5FEkqIF8
 e4NLt/i/xOqFJUKc3dCkV2r5tRg+w78x6W3oHIzkKGHGSxh/caBkH1U3PIhBTlHpwmDH5+TW5l
 4DdDqrUjQ331+Ldf1B2g41uVpAAAA
X-Change-ID: 20260312-stm32-dcmi-power-domain-fc479abd2dbf
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.14.128]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C2:EE_|AS8PR10MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0c17a0-40e1-4485-645b-08de8062406f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|7416014|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: HARNlQPuV4Lzq4ybYSuMOeRFUwRS7TmQdoauCB7Nc9Qn1AUBMPMcqZooUbM3bIRf4QrAK+GJZtYd2o85Fre63aQ3v6pjohiCrnZvpTqxvAP6e5ssu3EQhlXxJ2iZ0Hf+GamSs9hUG4W+RcC66wXJETllQbUgFvH6eI129zeNUyOr7x7jXsIlRGlq4z0Ysk3OdkfYJkBg4z08tolNF2vhLIqlT5D3a5sNpacy8g2fFMADjon7tRfW21vedf8TMoB8Cb8/737Qv4uEj6i5U/Lw7nvlxA04BvmZ4ShRZFKpwD9tvArmJ9eF820nKZb4QPdZXF3FMYZ5nI26cJZRVnEF9PP4DOdxxQPo4JUOdOGPbnpeux37slhD91oI1EXmikpbLEj7NDeBMCpNtPLHAsofXKkAdsdc5xWazArFckEQOP8uHXw0BiQQ6yFGFNTB+4Ih2U4Qh0jZ+THhyQ+hb9wrdJRDyuxkUs/ZNfHWrFE/QNk/3Z/D7aCDAQ+H1wiXmo7f1rIY4bwc4wGUYMAMezxIuYVyKS3bYp6z8nXDWFF5A7Xw740EhXQMOlPfkhvWaW8pRY2XbmvduL4RlaP880xqqIXqooBwsjX4DkHDw00ofgEJPnXIh+OtjPi9jWmQhbwPGwQbIYgB0qFrIJCkzoJ7e8cSS3Iway9ApSmTBx0KpoHWxkvnBe/bQJPLGF0XVLwwq8OWbCDiirOWnRe/XFyX2Uy1znObApTY4LwNff05OhTbAN69lsSGHFh98hBEqYM/XUxFM3oeIYtMHZMAVQ8WiA==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(7416014)(1800799024)(376014)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UUbaw77jBFaCxwN8/V43IzqWLJgC+rSNJF9yjXV4q10WzrJYnBi9gwmlJ7QAs7a8XTzNdeU0zBgXVQXhO5bCywBzpw+Lmru4kDGVBaUYzP1mrR/QeK+79WX68syAhHpWsW+dICwBTptFe2a4ewTPKjFk0O09BWxHIUva0572upg3MlXE2QD01hJyQlyN5slwchMODn4Vfk8+vBBd4nMCzYOakoPd3rQTXRtyz4PMkPPHBCcgyaE0WKZgPinZJ3a6xt4Whq0m9LT3VEHs48T4+8clVuMuMmdNPu7mD3KHSYH67jyjoEdiX9/GRwLIki78WBI+oGfsv7GtecQDU9OXSG1d5HlpL1oDdgSdhoYqTLmPQkaP1w/javxRJaKS52mHczhIK0ubJiyutkBDljqeG0nFZASNRzq8/1bTAZelkroAhh6KU6oZEAPxUKkmdULa
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 18:07:40.8262 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0c17a0-40e1-4485-645b-08de8062406f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7681
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] dt-bindings: media: st,
 stm32-dcmi: add 'power-domains' property
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
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hugues.fruchet@foss.st.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sakari.ailus@linux.intel.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.946];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 34916277031
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

STM32 DCMI may be in a power domain which is the case for the STM32MP2x
based boards. Allow a single 'power-domains' entry for STM32 DCMI.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 979360e9099e..d9fbb90b0977 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -43,6 +43,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
   sram:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:

---
base-commit: 621887bc7b9a6c37a5ed3b1f24dd446e3034253e
change-id: 20260312-stm32-dcmi-power-domain-fc479abd2dbf

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
