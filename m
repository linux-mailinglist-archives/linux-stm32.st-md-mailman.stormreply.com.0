Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOz8NUMhoGkDfwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:32:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 871671A4516
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:32:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 416B1C8F281;
	Thu, 26 Feb 2026 10:32:35 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012056.outbound.protection.outlook.com [52.101.66.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B8022C8F273
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 10:32:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUMyI2Xju1FeQiBIgNI7Nc0VbDKMzxsj9LVkMtMA5lHPPMvLAUqgiBbsn/uyiN1+oPZ68EUA4eqL0/4vEu7xSSw4RSjVWDnFRclEob8ZtXcfmPVhVof44U++ND6w04SkFMJja+U9mTofPQ96BqBXAA6IEYtdKVl5PzNWV0zeZN4evcNRQ/3K3ypnuKyY9IzaLCguteYi7IA1vq9lNR2GQgidHR7RqYekvS1NIhPy+klRVlRUnboH2j8ftMJxTfdBOL9Ox71lupAHe8kg/rXCL/9J80gbr/Y128RcJU9d1TEFRtlJWMndfC/L7d0lHg0RJUct7e8CtEz+xMbWkWn6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bVs7MxvhdLDc7zG07LLHXKs1oSCI2DtIrJ7yPKs9+JA=;
 b=SK1CmBCTaoXl0i6FFgRujNvyZnRZ26UBHzVcFTKUF3Z8FwmBEwUtqfvNrfegvSKUuU0v5FUdixX5Xn38bqI14KGvaOPWdH8Vd4zj3W0w3eM9hfrTw41sZBoXeQ/InWkMg+FmE5/wbo8JbcqjQeZbsGtuy5YI8dt16BS8c082gM/ufMnzJtd5aH+RIWRJiiPMmX4CvYmqw5Hfrsp0z/JhZcSNPFAATA/mkCWBu0xkw0aioPDIYbp6avbt0avL2J+2wx9R4EzyVFczpLRU2RuOUPVeqK6lutTuQbVkZnVebcD+7ZGk1VrlkL1PA0gjWtxnD5GCVBIIis5vv+89LfEdUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bVs7MxvhdLDc7zG07LLHXKs1oSCI2DtIrJ7yPKs9+JA=;
 b=bzZR7jIWiYOCUfWmxMVOVU8c41bOjow89uztINQX0ydY0hIHK/b74yySA2UYQDVqd4SMg/y5L1OxSF5nIElNbfDmicpl41OoXLRpMdXh5+GYEZZlveJX223uhYT6VQs7WHNkNh/TbJspuF3TT4ynxhPBtXJiHR4G8ZoLHjJzsIY+fXdJXoRILCJfghNV9GKeKyP2cu2N1SKHKYcLFlKLYjQOmKgV45Rt3GDxsv/4jvKQ75kgpZ92adkM9aVPUrs9yRT0lB/p8slLG5A08LewydR+KqsFf0W00WtVAIMWWgO87qE3afqoWEtV3q1A/erX0Y4sd4lGBsGXv4u9b6cNiQ==
Received: from AM9P193CA0001.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::6)
 by PA3PR10MB9310.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:32:31 +0000
Received: from AM3PEPF00009B9D.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::ca) by AM9P193CA0001.outlook.office365.com
 (2603:10a6:20b:21e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.23 via Frontend Transport; Thu,
 26 Feb 2026 10:32:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9D.mail.protection.outlook.com (10.167.16.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:32:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:34:38 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:32:30 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:27 +0100
MIME-Version: 1.0
Message-ID: <20260226-debug_bus-v6-12-5d794697798d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9D:EE_|PA3PR10MB9310:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c53ca2e-b56c-44cb-7291-08de75225895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: IABhZFfhIzsE+RoCy9h4C3b45SSZq0Zba8OzFHhmJS1LAfaOURaEJDVXOf/qliYMUAA5piFqwBElXUOBCiUNuel/twpmSss6NLi9M/6Q01dMzZiln2UAFeLbSCuI6RcMRCqA8LzvbMJ5AVi9pt0RXa8sHL2ddzGqWfYx1KdhfgWYaCed7wEl/X20sGCJ7fyuBTtXkBlAZI8jcgUhJYujSiaojtWmH7MaVStnYra1/IvfqDwy0Zg+XcyOE0LGk5D5oltBQL5ZG38Ijxd5pRS6xcyQO96BOBHSS3ijXC7J3xCXlVsYhEeCpIzcssC+Q6FxEQ+XpES2kGf590aE76jkQ9szkIDrBAgr2mshbjPaUgEjedmpKVFXFmR9OcR0dnMrPF+3pKUm6HYTsU/tF73ExcEPPgY4hy5fVtE+W2Ly9EYIuefO9Es478rw59akECusvRPco+GlxwK4+2Vuyrj7whiRDhkr7JfDU16LFnHukkZEUlJlFovsoFRNE+Bjzpg2tRQJDb+mQNV1tLITk5OaklZK8vkqhdMpMbriA9MJnHW9REdT2rG90UC+K8VFdxjbMlbMx+pu9HrjnrueSGs74hOnu0QDCenWYYVnBRKkFZ3dGRHvyRgTEEnzZqW3eCAu5wvik4w5S3jI5eKZJWqPRc4h9NRi9lNETiHf2VrHfd/9pKgcSS7E2GPbvxhx4xSRlK0MlLW3794DQZmqTjp7hEUe0/bJquPCzBf+8Sr2y5rbyXW5/jhzhuS1z4/UoaA17FxCDXrKwy/eULi6Wm2d0EgTc/No1BfkxlDgau5B4QSGWyvT5TCmai5JChJST68N6uvldtIC2mgTS7qP5C/yXUnjfazPMKiXL/HELoQ7wVc=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1mO2dnKtgdVih5HWHrK/Yrw+ZteH9NgCgB2lm4Pjqkxgjiq7iTui/SFZOULK8IUA+SWrkaUzhpyv34m45t2SqWj3qdgK7CaRYjccljmHwXnlGmnNvINcEFwmi1ucz8Li6DI2e6rigP5WptEKmTbvhDcyX3WjJVjwM9KAEPzK1y+F5qsZYhHZ55u/zkTRwsSvg49CfLUruFqfsU/dgLg6OtA8bJZrNxg1vxtpfAtq1ksff9Pb9CjfyCn1/PvYy7K7+nPAX9I7fkGymR11HPFN2JZS14zKzjwnNDg/9u3rBPwLcBvPCNiX70Ngk+0V76/GAd7s1ZAnFYKBvnwyeqKrLE8P82wpBrHWD2h+RvEg5dX7S91wywpfsI2ZgGABYE9y1gfgeflcFJrWh5DIcS7neHAIkhWgJJ43Rp4+nSGprzh3pVo8dQEjjlkRwgSy9CUD
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:32:30.7956 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c53ca2e-b56c-44cb-7291-08de75225895
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9310
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 12/12] pinctrl: stm32: add firewall checks
 before probing the HDP driver
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:cristian.marussi@arm.com,m:jens.wiklander@linaro.org,m:etienne.carriere@foss.st.com,m:sudeep.holla@kernel.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st.com:email,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.733];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 871671A4516
X-Rspamd-Action: no action

QmVjYXVzZSB0aGUgSERQIHBlcmlwaGVyYWwgYm90aCBkZXBlbmRzIG9uIGRlYnVnIGFuZCBmaXJl
d2FsbApjb25maWd1cmF0aW9uLCB3aGVuIENPTkZJR19TVE0zMl9GSVJFV0FMTCBpcyBwcmVzZW50
LCB1c2UgdGhlCnN0bTMyIGZpcmV3YWxsIGZyYW1ld29yayB0byBiZSBhYmxlIHRvIGNoZWNrIHRo
ZXNlIGNvbmZpZ3VyYXRpb24gYWdhaW5zdAp0aGUgcmVsZXZhbnQgY29udHJvbGxlcnMuCgpTaWdu
ZWQtb2ZmLWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5j
b20+ClJldmlld2VkLWJ5OiBDbMOpbWVudCBMZSBHb2ZmaWMgPGxlZ29mZmljLmNsZW1lbnRAZ21h
aWwuY29tPgpSZXZpZXdlZC1ieTogTGludXMgV2FsbGVpaiA8bGludXN3QGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzItaGRwLmMgfCAxNCArKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi1oZHAuYyBiL2RyaXZlcnMvcGluY3Ry
bC9zdG0zMi9waW5jdHJsLXN0bTMyLWhkcC5jCmluZGV4IDBiMWRmZjAxZTA0Yy4uY2NlNDc3ZTg2
ZWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi1oZHAu
YworKysgYi9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi1oZHAuYwpAQCAtNCw2
ICs0LDcgQEAKICAqIEF1dGhvcjogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmlj
QGZvc3Muc3QuY29tPiBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzLgogICovCiAjaW5jbHVkZSA8bGlu
dXgvYml0cy5oPgorI2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0zMl9maXJld2FsbF9kZXZpY2UuaD4K
ICNpbmNsdWRlIDxsaW51eC9jbGsuaD4KICNpbmNsdWRlIDxsaW51eC9ncGlvL2RyaXZlci5oPgog
I2luY2x1ZGUgPGxpbnV4L2dwaW8vZ2VuZXJpYy5oPgpAQCAtNDYsOSArNDcsMTEgQEAgc3RydWN0
IHN0bTMyX2hkcCB7CiAJdm9pZCBfX2lvbWVtICpiYXNlOwogCXN0cnVjdCBjbGsgKmNsazsKIAlz
dHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxfZGV2OworCXN0cnVjdCBzdG0zMl9maXJld2FsbCAqZmly
ZXdhbGw7CiAJc3RydWN0IGdwaW9fZ2VuZXJpY19jaGlwIGdwaW9fY2hpcDsKIAl1MzIgbXV4X2Nv
bmY7CiAJdTMyIGdwb3NldF9jb25mOworCWludCBuYl9maXJld2FsbF9lbnRyaWVzOwogCWNvbnN0
IGNoYXIgKiBjb25zdCAqZnVuY19uYW1lOwogfTsKIApAQCAtNjE1LDYgKzYxOCwxMyBAQCBzdGF0
aWMgaW50IHN0bTMyX2hkcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQly
ZXR1cm4gLUVOT01FTTsKIAloZHAtPmRldiA9IGRldjsKIAorCWlmIChJU19FTkFCTEVEKENPTkZJ
R19TVE0zMl9GSVJFV0FMTCkpIHsKKwkJZXJyID0gc3RtMzJfZmlyZXdhbGxfZ2V0X2dyYW50X2Fs
bF9hY2Nlc3MoZGV2LCAmaGRwLT5maXJld2FsbCwKKwkJCQkJCQkgICZoZHAtPm5iX2ZpcmV3YWxs
X2VudHJpZXMpOworCQlpZiAoZXJyKQorCQkJcmV0dXJuIGVycjsKKwl9CisKIAlwbGF0Zm9ybV9z
ZXRfZHJ2ZGF0YShwZGV2LCBoZHApOwogCiAJaGRwLT5iYXNlID0gZGV2bV9wbGF0Zm9ybV9pb3Jl
bWFwX3Jlc291cmNlKHBkZXYsIDApOwpAQCAtNjcwLDggKzY4MCwxMiBAQCBzdGF0aWMgaW50IHN0
bTMyX2hkcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogc3RhdGljIHZvaWQg
c3RtMzJfaGRwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCXN0cnVj
dCBzdG0zMl9oZHAgKmhkcCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOworCWludCBpOwog
CiAJd3JpdGVsX3JlbGF4ZWQoSERQX0NUUkxfRElTQUJMRSwgaGRwLT5iYXNlICsgSERQX0NUUkwp
OworCisJZm9yIChpID0gMDsgaSA8IGhkcC0+bmJfZmlyZXdhbGxfZW50cmllczsgaSsrKQorCQlz
dG0zMl9maXJld2FsbF9yZWxlYXNlX2FjY2VzcygmaGRwLT5maXJld2FsbFtpXSk7CiB9CiAKIHN0
YXRpYyBpbnQgc3RtMzJfaGRwX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQoKLS0gCjIuNDMu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
c3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8v
bGludXgtc3RtMzIK
