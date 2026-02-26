Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0MUsJCQhoGkDfwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:32:04 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F981A44CC
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:32:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D5BCC8F281;
	Thu, 26 Feb 2026 10:32:04 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010070.outbound.protection.outlook.com [52.101.84.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C864C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 10:32:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2ULQNFf+mBMn2k6Asekoujy9sezhJ9DQS3+QVjzXGI7DLv0pW+7LeqNy5ief4GNzpT9keMlD6StmrXf9ry4lTN2AWNjtLrnPAGFEFR+RY71d/70p3O5i8V/oiLLAKzuOqaVtY0KVFvU8I9nb3LBukB5KB8V1oJWvbd0wlt1lxOmQrc7/73p8vDuJW4ken4yEeqC8i82NjFX/axAbQLZS4t1NtJlH2g9j8VNbb1cWptHcLtWk068l7rCvf3Hv7sZay5WbntLp5ZK2gAXG1UWdCwYjHbgwFcSjPpQb/WuIF9fi4u8mviPCpC5QXsOTi+GIsmHfHQ2AxapHhWL85MLQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLtCKKu04t4U1oN14GZwDoVU4rbU2dG2WQpOkvLt560=;
 b=nHEctH8VS9Poo0YuCeGz8+dd9SUdtA5zFmg1VoUmZ3F36PpI32v5UGJspmfTG8reEkuK8Lz2mMtyvvD15+UwjVdyl446kGQUNoyD+ZGnhJAiRQ2oy2JK7b0KIuuCNXXfMv1w2h4P2Sa/JViHfpGxv8lkmxd4xpcbgt6qoOza9L+3zfH7H/6/okqkV6xOTN9ghQrsDhPD2n0Owb8W3R3fnny3OezEGzEQt8DNbzE/eX/wUmURWv+0L2UoCSJaWbBUs8draqOQ8nXK3uqgAW3d6VrnRSfUiXtp2f0b5E+6GwjnT1RvNnfd1MtUttlmpVotyql+HzCm7d+486u/XhNmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLtCKKu04t4U1oN14GZwDoVU4rbU2dG2WQpOkvLt560=;
 b=kGg3HFwBNntqBOTkX2o2faluj80h27qfB7WaXF79M8bedsMtFjIhEQAKH+00K7PKG+82wG1b1jT8z7jFRaAClJUBKIyVLDd8xrQPvSmCDJYKgBJnyzDiBAqtyIJwscwsrLLW8k3Yuwny1F+NkKydEugzvLC2R1nV5S8B7NeaUm9oz3AC3OB2WgC1KY3XMQf5JnMjQvMohy386mwtbHKkrhkuW+vVVkFX+hUxo3w0qcIg+xncrxwpOt1iH7tQ989qOuwFpo+9q//f2bP3e4yDqqIvKIqGvL+DiJPQsRCTSSBUt7IyOia0CudUOUOmurZx+MJzRpZR4LXPAYhW0H4FUg==
Received: from DU7PR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::27) by VI1PR10MB3632.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:13f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 10:32:00 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::9c) by DU7PR01CA0009.outlook.office365.com
 (2603:10a6:10:50f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 10:31:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:31:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:34:16 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:31:58 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:24 +0100
MIME-Version: 1.0
Message-ID: <20260226-debug_bus-v6-9-5d794697798d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|VI1PR10MB3632:EE_
X-MS-Office365-Filtering-Correlation-Id: e5231535-af13-42c3-6745-08de75224597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: 75LlAIZyDKpK8NBvdqy4mNy87hSmyV6qG3xT28y5oBkoqxl7EkL83QFk0JtLchLytRLEhWZ5o46xDaQSXr7EuBoePmQ5m8/oHIAu3WkUasmnu2f3qi1y7RUY7M5z+34GyZkdK7xAUnRvYxYLXl1vkArzsa5Tg9AsAuLTC4Zk9X7qYkdCADbYPT3hvGfG5xlUUjFs8hjSPeX4YzUdOG1sH+XHqWZzqs71Lgb+Ub+SE3f8Xwj/I4D9DdBFAYY6YbRcAnYerlHHMn8wXuQ9vo24XklS9rVyCMPBWftVKd0WCOR/7D+k+BMnmmMmCGkgqiaIr4JOp7fUb/gTpWVKK326ib6drYPsc0SziM5HOLmiDT5aec47zE3NGNTTkRVxzEvkvakFD9ye2Mzx3nnDT/UieinrvFfGTax4ICtBcLPs87XPRerauTWJACFlDDIbXgJEFs24FZLyn5aM5O6ZV7mOJab3JvD+BNKqqPFZHzDR0Mg8RC6V+fSgum/1LcOjSLfCWPq38MoG7uWrcDYv+rFmWMrHnPsZQAcvTV3VMeSHyqQ3yCom1S8/AzGLa0M7bKAhVe9S5xk5VMmEwAnjv/QvS2PD0B0/8pK0Y/gZH/vAsFieflc52aIphmfSuVJPTu++kr1OCwXbjpRn2l57G8t7ndG9PJ7zKTs7NE7+namx/5vk6GlP5mnvVo6iHZTSx2nBbnAJsdRa5t6Aqi0ftEAQ2B9BxeXdEpv4MtjRQOdtN7duBZ6OAR2ee4h31Nps8IwOm5v+jDrvPMyPnmWYWG0WuI0T01BhAjMFVlD7a697/pqgmgRCFr/k7y8QPLIoWngGncAJbl6eB0XKGo+sG8VROWLkVsTTQgDjWfgGJgcApRk=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Z0RgT0dQ35U31/V0HF5U/fIxeNebgv9cxtbs4rFwQiWWqquD1qCJZq1lk/XG6Zc6KJmrBux6KL+jd1QCvlAl1xgxRgGbwVticEwt0IhbBoyPkrAnzeykljDcyky02LK9RC6PceZcK/9FGB1ZtLhkuewLEp+AYjjSyT4uEP1dZGB3JCFpt4KkTNQRxK4NefUVhhk3NkBEIri6EOAfeb7pNf9xJ+p1kMeEt6mPrEvqRWLPIpxQZ2v/CxHTMNHbhUfEC8DvLOuIAi7ruLzlUlU711hf4NKTch3p8hcQoB61RBXBzsVozDyeAjiCAGzrbOWfyD+maEM0CeJta4McodQMSjCVLWHBWWHD5GfRTtfq/RHuIHn+eHa2hPfBo/79sAaugS+Y2m+1kVcHg2H4IvazHofOQ1OqaA8pM97zAnClOtJUSw5n3khWJRKqaAj7VBaf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:31:58.9007 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5231535-af13-42c3-6745-08de75224597
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3632
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 09/12] arm: dts: stm32: enable CoreSight on
 stm32mp15xx-dkx boards
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st.com:email,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.005];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 54F981A44CC
X-Rspamd-Action: no action

Enable CoreSight peripherals on the stm32mp15xx-dkx boards. All boards
including this file are embedding a dual core SoC so this change is
applicable.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index 98b27b5d1311..599ea07bdb19 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -155,6 +155,42 @@ &crc1 {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_cti_cpu1 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_etm1 {
+	status = "okay";
+};
+
+&cs_funnel {
+	status = "okay";
+};
+
+&cs_stm {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
