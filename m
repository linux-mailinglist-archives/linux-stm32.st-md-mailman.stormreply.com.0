Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKDMOvwgoGkDfwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:31:24 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 996CA1A4481
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:31:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58E49C8F281;
	Thu, 26 Feb 2026 10:31:24 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7844CC8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 10:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9NJRDpzOTU563nIPdSVPlpsXGeIEFtIx1m4wPnnUqeqq9w5AI0LcT+9lrXqDDH1xueinqIclZD7XxRZDRz5B+3k0z0zOIwh9fDfbC0S9rVFMp0nTDM7dtyjkFDouDyumDL6udrXX68c3Zmc2cKBnwXgvkJ9goxn6qtNUOgRW+Bfu6JGQRIIRct9+nAQLa7XOgAY+dAPGkBY23cXPjKFhCmX01e0ilwykLYOBRDCEjWVZpyuaKGy2op7gBXXjQHsrSKS7HVPVSJl3X9M11tt2q7QlMRcWePNiFu+7PiT0B9D/rbTgSy1593t4xZ1JUO6I5JBoU8lOIeDvwuClIx5/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTxY4vaHvPhGf09cw3rqjyoTFV1wj4Y/GHYfrTd165I=;
 b=wp0MOvLMquGaqalWRCGKwTdpD+CubY8fdzKfC/x24+6gCLXQU5GlfrB+iDYvXPkxTOGZtpsQf6uMiNvmtfeFA0O4lx2ogd1cbHUci/kuxYv3St1iwtlwVjYd/ao7/E1vnepjMkavP1YDXTdT4yBvtmkYaMCZUV3eaBpE+H8W0hrc85dx7v5gx4ByrA+jU885NPlI76X2yGWXd/2rMhDQz5cs+ot0wNlbSPdZFy7bAhNWrJBwSDky50NIwKf5qokxl6DoGbu+yW2NuvDyPlvY3RYNMFY89/WStizBhfUNZ6l3dN6ZBWcccxwCAsf71C+j8P+6pTbBo1VdCNAnkEFC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTxY4vaHvPhGf09cw3rqjyoTFV1wj4Y/GHYfrTd165I=;
 b=XbPR2OUOQFS3pkHvHmkyyZZvQ12fO21zHPov7Uyav+mUvzKjfAy540bUBftFiJ2XQQBFq3XgtwMfb+behFuKCpJle8cqXBQ62PtFDDvNbnN4QKfHEWbSZ+i+VTMcOuLFFpGfocUiFSPKv9B33Hqn/RqwQVwGy6JWsGL4YUmX9O0L9EfOEDTwl81/TFYvdp+lDghU0CzKGQJ+5ojA9fSk+bij3/xq+1dNKCcdYnJkD/OCUglEqc+w1mHgXoGWIsz/7k68FEJEEFK9GIPRTTLoMLAMWLHmbLDtSfPni0Valnb551IjZK0orTKSHDJeomt42TCClmrUuqlrqgz4moR3WQ==
Received: from AS4P190CA0018.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::11)
 by PAVPR10MB7418.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:300::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.24; Thu, 26 Feb
 2026 10:31:17 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::72) by AS4P190CA0018.outlook.office365.com
 (2603:10a6:20b:5d0::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Thu,
 26 Feb 2026 10:31:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:31:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:33:23 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:31:15 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:20 +0100
MIME-Version: 1.0
Message-ID: <20260226-debug_bus-v6-5-5d794697798d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|PAVPR10MB7418:EE_
X-MS-Office365-Filtering-Correlation-Id: 2516629a-1593-4799-a2e4-08de75222be3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|82310400026|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: +gdz2V0pZutdm2PFVZVcU7lMYjOGcAae6KsfpQA85PPxadI6x97rswqcueWkebEE46p8ed0EeyPIP/bmMW498SSqQI4Q+uVuP78EVn4BBYaLB8yKBlfNt64Cl8F7paAjbflsbpquU86AsUSG9P2My6nG68Tv5E7GDTlyc+rPDThTAYx4qpeCJFoZ4nipIEPAOPnc1F7jdG0gibUJqU45ffh8nAH39ylFp2vmvTO8LFcglsRAysX78d95/la9NnazFIeCPHYcIo1BvJIDC2Ks12kMMmmqnu43RI+9HfvtSUZJhr7VX1qwQfR54VY5XnGlUhxvg+GVFPuC9kwGkXHH5IOMTUcwIBec/vHzQA7xTx6Q9pQvGWCz2lsei7+vZGAT81eirWPIoldfPFNqB8qpzB7jegnWEiN5E/Wb85FZrOGba9MbUNb6bNdL7/zlvE6J5e5GLgJWZD6KYlxVj4d8dSp5yUJCYWwxudZ8kdkn9Vzw2n/wttdFllQKOgxrvCIcS3gyRk0KomsyeQ/3jFSi6NAAVgEEmxWG2pqMuDhULbXTjV42ddorpGLLGePHZl+rT9rnBnAZEHKntu1HrB2yExCQF8FWpAP0qmHGpwfF8G+6w0N6ue2uwCinZH46EBIU3EZaeawlY+FNP20BsruHhl8ovSrNuAjKr+dAqFI4boX43qlFA+lNbI8kIvx0a3QCVtc6he4x+2wkbETK6OExwVZHRm70pu+pyMg/ou/74ZUKIdLT8MTi489sr6zBJ81PARfDsOgvoPVOyCUViFSSgZZaYJGVDm6ecSuS3OVDTv7Pw1JrqHm1FhfZ64opVasX+IHiXUW9Pg4N0/FkrzSRMN0P6/cfBQ5/npmkutbYzmg=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(82310400026)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KEei1739pH0oF16S+OcR9h0kOgEMcQxS4sVv8oIjsmeXpEVkPazClK4QkjpXrEaYyVrFbEX3t1blvLFDeRhkzEOtEXWQlmvdYGjRExG+SSVv9iO2c/NtuxE0PYPN7Uc5bI17Xa3Rau33MroL7brQMnhYe+mhXRrd/Zks+o2N9e+kgbIkW3N5mRLmz1o3nkDTgsR0e0K2YaNw3a0O00xMPaaKo9Kzukd1jnI7JeyZCWRhzHelhH845WvUYb6Vm2advwtr5oJbU2cd2/Qwar3c1d+dih4hR1nnz+SEv9clKghqodrWa0pWrJv2RliKhjXtlEn72VHrPBg9lNlnRCaB+kUA6ieDW3l+PRNv5exej/IZJOXVC+acvQ7Jwo4m1vj7wOX5d6OkDxRCMoK7nw1A2vzJtpqSQ1xSvvrCkrRxKrpEISIZuNQyopkNF7/kB2cD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:31:15.8022 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2516629a-1593-4799-a2e4-08de75222be3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7418
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 05/12] bus: stm32_firewall: add
 stm32_firewall_get_grant_all_access() API
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,stormreply.com:url,stormreply.com:email,st.com:email,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.060];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 996CA1A4481
X-Rspamd-Action: no action

Add the stm32_firewall_get_grant_all_access() API to be able to fetch
all firewall references in an access-controllers property and try to grant
access to all of them.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 drivers/bus/stm32_firewall.c              | 42 +++++++++++++++++++++++++++++++
 include/linux/bus/stm32_firewall_device.h | 26 +++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 41cc1e7190ed..0b22b8e2fdf2 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -185,6 +185,48 @@ void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 su
 }
 EXPORT_SYMBOL_GPL(stm32_firewall_release_access_by_id);
 
+int stm32_firewall_get_grant_all_access(struct device *dev, struct stm32_firewall **firewall,
+					int *nb_firewall)
+{
+	struct stm32_firewall *loc_firewall;
+	int err;
+	int i;
+
+	*nb_firewall = of_count_phandle_with_args(dev->of_node, "access-controllers",
+						  "#access-controller-cells");
+	if (*nb_firewall < 0)
+		return *nb_firewall;
+
+	if (!*nb_firewall) {
+		*firewall = NULL;
+		return 0;
+	}
+
+	loc_firewall = devm_kcalloc(dev, *nb_firewall, sizeof(*loc_firewall), GFP_KERNEL);
+	if (!loc_firewall)
+		return -ENOMEM;
+
+	/* Get stm32 firewall information */
+	err = stm32_firewall_get_firewall(dev->of_node, loc_firewall, *nb_firewall);
+	if (err)
+		return err;
+
+	for (i = 0; i < *nb_firewall; i++) {
+		err = stm32_firewall_grant_access(&loc_firewall[i]);
+		if (err) {
+			while (i--)
+				stm32_firewall_release_access(&loc_firewall[i]);
+
+			return err;
+		}
+	}
+
+	*firewall = loc_firewall;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_get_grant_all_access);
+
 /* Firewall controller API */
 
 int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller)
diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
index eaa7a3f54450..6c878f3ca86f 100644
--- a/include/linux/bus/stm32_firewall_device.h
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -112,6 +112,25 @@ int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsy
  */
 void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
 
+/**
+ * stm32_firewall_get_grant_all_access - Allocate and get all the firewall(s) associated to given
+ *					 device. Then, try to grant access rights for each element.
+ *					 This function is basically a helper function that wraps
+ *					 both stm32_firewall_get_firewall() and
+ *					 stm32_firewall_grant_access() on all firewall references of
+ *					 a device along with the allocation of the array.
+ *					 Realease access using stm32_firewall_release_access* APIs
+ *					 when done.
+ *
+ * @dev:			Device performing the checks
+ * @firewall:			Pointer to the array of firewall references to be allocated
+ * @nb_firewall:		Number of allocated elements in @firewall
+ *
+ * Returns 0 on success, or appropriate errno code if error occurred.
+ */
+int stm32_firewall_get_grant_all_access(struct device *dev, struct stm32_firewall **firewall,
+					int *nb_firewall);
+
 #else /* CONFIG_STM32_FIREWALL */
 
 static inline int stm32_firewall_get_firewall(struct device_node *np,
@@ -141,5 +160,12 @@ static inline void stm32_firewall_release_access_by_id(struct stm32_firewall *fi
 {
 }
 
+static inline int stm32_firewall_get_grant_all_access(struct device *dev,
+						      struct stm32_firewall **firewall,
+						      int *nb_firewall)
+{
+	return -ENODEV;
+}
+
 #endif /* CONFIG_STM32_FIREWALL */
 #endif /* STM32_FIREWALL_DEVICE_H */

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
