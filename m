Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAa+OscnuWkAtAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 11:07:03 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 854402A7819
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 11:07:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 32714C87EDE;
	Tue, 17 Mar 2026 10:07:03 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012003.outbound.protection.outlook.com [52.101.66.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F37F8C87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 10:07:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQoKe1yza82N0eWKoDBs9FzjXdxFptEApRRFF2z1usCx4UzzjAi80uNDF7ur2Ov6zfG2w/z4gJvE8y/jJR6hXdBvlX/TC2YIAU/HZGkhjIduxeUv7NI/SoH1Z5DnE3TYc7oq8F88fsnj0i46p2b4bh3Ub5CfbY759amXlGLUZouMLn4FYuK7FidZ3I7OTT4ONc8bC27BNSD95FL8/QJFjYYd9ZAt9se1SIBJ3lcUR4WhuKSG7f3NBg17zOKa3dETRFjqotCbzBs3MsvomhLnDIB2UnmtV0TlWvugibj5WjFuLojtlNVQtRTYMt+zTnPtrMK4n9yGqT2jABn0M5I3+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQuzm+PPYf2abM/LhGMDylnHAW+6IZOZ+MJBp/JIUQ4=;
 b=RRYizxjJrTUQyYwIAAt/YYdiGM0uQ9Vu0WPtw51s5i73ONsbbJuyghZgPGmrnJ4Jqm9Ij74vKStMr69Jo8mRCEg/IpcKsSBkT4btjAxA2/bOeHyRC4awtYgHyrIMmzNI1kmxuK1x82tTEHtnDgSuveUlidgUj55yRDYC9vcFNuhZhUFhuwpK0MKQkGM1lTvh2Iw3CcrvJ2sw5QBPvC8Anz08QJfsBzlrTimCf+T3ydHs80Md8osg4WSEYN1pnAwilWk8tZB4+1SPr278ffuTFEgqXOzjnPCVcNncOCa3Qv+FfIUNCoDUHlz3wcgwhuJLYCkv4/6p1yUzS677CDa7bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQuzm+PPYf2abM/LhGMDylnHAW+6IZOZ+MJBp/JIUQ4=;
 b=MbXUfb+BJ+ujH/E5MD5DokjqvDst704Z+mnRjLM2S8yN6v5Us2RrPYkr9wHt5k+CrUQgBBx716kYIYmg6YNN8md9z5R/FBNRxREFo5jvltucPV1viS3lTYc9LJpr44nhHRNvL5L6DP2lXlKpd3iEF8ti8F/CI/QcB81zVa6/D0rYhqeNzFLgf4nnlxrnMZNk0NVqih2V0TMfF8C0R20pn+Ovlr9d/sHZMg7Tdpj5NXll16AKbUqKh5SjS1Yr4g6hVC4T2xNQ2SENWVcNm9KaOiAac3/fAENTHsXj+jh/KiAeKabsV3pKZlk664uCr1qSdRtTPUsAs4P23AiKAVFj8g==
Received: from DU7P189CA0020.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::30)
 by AM7PR10MB3509.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:140::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Tue, 17 Mar
 2026 10:06:57 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:552:cafe::b) by DU7P189CA0020.outlook.office365.com
 (2603:10a6:10:552::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 10:06:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 10:06:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 11:09:30 +0100
Received: from localhost (10.48.87.205) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 11:06:56 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Tue, 17 Mar 2026 11:06:54 +0100
MIME-Version: 1.0
Message-ID: <20260317-pinctrl_stm32_hdp_fix_dep-v1-1-3a6f6f02eb3e@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAL0nuWkC/x2MWwqAIBAArxL7nZCPnleJkMqtFspEJYLo7kmfw
 zDzQEBPGKDLHvB4UaDTJuB5BvM22hUZmcQgClEVktfMkZ2j33WIhxR6M04vdGuDjrVK8VKq0kz
 YQOqdx6T+dz+87weLwESdawAAAA==
X-Change-ID: 20260317-pinctrl_stm32_hdp_fix_dep-94415345dbe8
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Antonio Borneo <antonio.borneo@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.205]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D06:EE_|AM7PR10MB3509:EE_
X-MS-Office365-Filtering-Correlation-Id: 2882e7d5-2255-4252-c604-08de840cec3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: Ow/g/BcdkWV71WY+AORFAjWRQWOFZ9FcKER0f8YQhDfDo9G4JxoWL2EOvU3ewQhQnnV8qTb7w+tjo9lTmk7QXofmdp8Ap+foKQbfA79pPDZyJIChr0qTWkxd2IJ8kWieKP/+pFi1P7m9fFdPa2pPQsbgmehqMHPauyZ3V7nGB9xzzuqbeCB4GfbVKML6ybUG1CUnhlae5CeMm34q3kac8PtdGmsjxUp/DvAJJL+BooCP4mcw1G0NlUmb3AAIgo9t2vfMsdfYULeBb5R8f59TU1JJ2hDrSbmUzF0OnE7Oqxe2UOGP+5xwZmP7/Sj5ckpV0zUgdkPBMMZ/Oubo2TJq6m9uFq9vX+bIqIe3dvVN0NpXKYYrhmll13sU7wtuR75KPull3OvT1vKs0iV7UE3kSfMndEsQGJ+b+8CpQmqIxj6LD8j3U3hjTNY4VORpu1CZMpsvmxW4z8byNLoRM6zGYuewqUA7IP17bdOMMz9vHjka3x7YeOS+t+N9iLSr8iuwPCquoY6USGyX4o9XrgwelXXfUWSq4eT9b61i+l3En+SENApurjusegG9KkIY/twUet8pvG9tVqunG1ST658viaz4RJzs9c4glPe9SJgCYz8bXqa1NVjKrkpO5dPy7VvuqnzHfHsLGwlRhVJSaRDE/StzPO16YATUXcOF6FEWjZAtMorbkVlzGr4XfFwcM/SvQ5RWleVbTFffGp3aMBxNX6+AwB6ro33FKO6WcUPnl17HgCmQ+wA4MdOjO7528ZpfH7xTjdVUuKA5H7OuPslO0Q==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4a30twd+eZ+cr8u6kUUKx/uNCqtlRpmvl6ONuKIRRT+NPYh6hsDMW4nbZa49D32V8BHpE3PeSuWYP0e9z2ydmAFVF3FpFcGYXUS2Vs28tqu1Eg5Ll/brvkh88e2+pCcJXWyJyH/QSRU+rnu2IEKST0NZwW+/dt1A8AGiM2B0/HElvS7GeXAHycL+GlP+rOtiwRE9VVbG8aFQnAF3TmV9oq10+yZ81+ngDwuFw6nuQv36W/njqgnrT2C9rfrhg7hJ8RBxxaGOJEJ5FJPhnit0M8Hf7e1KrkKJQBKCDwR2iTzzRzgApYwFIBCkLyXd6/OWxtuvvWDXGzSR+GoiY936SbCxsbC5uoKQM9SqUl6WZssGDKa8N5JSJlp/Tj9cILg9y1FqYttYbBYZiwruMIZ7UB6n1NQ6D1dDWcEOLDB1KLljOxin6yQDTH4LMXjscKm1
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 10:06:56.9827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2882e7d5-2255-4252-c604-08de840cec3b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3509
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH] pinctrl: stm32: fix HDP driver dependency on
	GPIO_GENERIC
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:brgl@kernel.org,m:antonio.borneo@foss.st.com,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.990];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 854402A7819
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HDP driver uses the generic GPIO chip API, but this configuration
may not be enabled.
Ensure it is enabled by selecting the appropriate option.

Fixes: 4bcff9c05b9d ("pinctrl: stm32: use new generic GPIO chip API")
Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
 drivers/pinctrl/stm32/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/stm32/Kconfig b/drivers/pinctrl/stm32/Kconfig
index 5f67e1ee66dd..d6a171523012 100644
--- a/drivers/pinctrl/stm32/Kconfig
+++ b/drivers/pinctrl/stm32/Kconfig
@@ -65,6 +65,7 @@ config PINCTRL_STM32_HDP
 	select PINMUX
 	select GENERIC_PINCONF
 	select GPIOLIB
+	select GPIO_GENERIC
 	help
 	  The Hardware Debug Port allows the observation of internal signals.
 	  It uses configurable multiplexer to route signals in a dedicated observation register.

---
base-commit: 263447532463cf4444a3595e835b99a4e90952fa
change-id: 20260317-pinctrl_stm32_hdp_fix_dep-94415345dbe8

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
