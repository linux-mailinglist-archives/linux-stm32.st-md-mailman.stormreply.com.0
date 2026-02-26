Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGvGJ20moGk6fwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:54:37 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA451A4A7B
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Feb 2026 11:54:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1A39C8F273;
	Thu, 26 Feb 2026 10:54:36 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CF067C87EC5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Feb 2026 10:54:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cKE78XMHZ24An3uLnHO0njBEl6mIqs9VeE7zgnPbUIjVZcqosWyIpWqwbz0xq1+3uZCy4BwtGsuGRmOzfmup4tABAJix7oI4sb0wA5UrNJpHbY3BI+B4jigSRsHKwO2X0yJ0WVTkCqASswS1WwWH7VlsSpWw8MqKvezZafWgBhAAScbwoL/wjjettc/WpI0KmAqdcTEU3/XAcMnzGa371SJ5fbkLWmAGXpH7DIBKW8DEZkBJiOAbndQSpzfprxBY9HAwc6Xx0b8AXQIQLyiDqI2s3NiQaFR1WhchD1zLHIAjKAYLuYJbqL8+EaLbFu+twxva6JItqcyNUwtf9EppGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MR6gesGSkCrAAgYgHgLWmn3PJRepX1k7pJtTosmuLGc=;
 b=LVyndfryUn5riBuNQtf2vtVnn9nXtjEue0ljF2WjIKEOCekwClXksrRVNI3VcGenVwDTs9nZ2YMT5hU3264sNHaI+1cYYqCCYmGNOvO+liTwjmdwAZ9RmWyuxtwl9Dv4Q2tD0ujiEtPLoNDrtuI37fQ561OQcClJraqTvfmaS5h6dRT+mE4f/bMl3eI7g1Qk1D+lojJTK5NbnmflwhihGgl+En0M5h2evfXTs5YHuX0hBKYMHZkUJ/L86v0Op7dEg/2tqo5ZHRi7RGVkJtxCoknvnbBcTT3HzORYSw0kt3iPmAGqxImpvsUy8CttfhnljHXBq8MPsDdGL0rDNp397g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arm.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR6gesGSkCrAAgYgHgLWmn3PJRepX1k7pJtTosmuLGc=;
 b=HfHSicDXWDW40DRosplEBfiHVtAls+TAOVfJDFPGlWgCxBcfHt8C909y8ad0oJI9yBTJM4Z/2HMxjIpp9Va7/rLH00OY1ZtcuAMVOkGOih3w8mX5YizmncQVtDwccEG8feo8Hl6m/QgV9APW0dgZAYtNW7+fRGqktfnbSE6xS2T5bcBKIMUUkoDsVGOApKtk3nRMZaS4iRMG/WNidEs/NXjPbAATRQ3hWw0vZ0++lJS7JLb8hc9B1hGeLF2ItTseJWuOTNsxieyuV1UFHxYQjWOAlu62j+kE4dOuUM4n597WhuxOGQS7NOkVG+QgJLHgVA54+UoVTHMX4krbzb+o5Q==
Received: from AS4PR09CA0029.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::18)
 by PA2PR10MB8338.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:415::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:54:32 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::7b) by AS4PR09CA0029.outlook.office365.com
 (2603:10a6:20b:5d4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:54:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:54:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:56:50 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:54:31 +0100
Message-ID: <7c60e928-d99d-4341-966a-eed759069f5e@foss.st.com>
Date: Thu, 26 Feb 2026 11:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
 <leo.yan@linux.dev>, =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?=
 <legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
 <jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
 <sudeep.holla@kernel.org>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
 <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
 <fb91b392-2a01-4f01-85a2-335bb39ec60e@arm.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <fb91b392-2a01-4f01-85a2-335bb39ec60e@arm.com>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|PA2PR10MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a79e09-de99-428d-d873-08de75256c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|36860700013|376014|1800799024|921020|7053199007;
X-Microsoft-Antispam-Message-Info: ZCAxP8EuI1H7ApXPVimlBnTq3s6pVhSkNC5uiaIlRV0el6CRJlbEoWODsPCYCGhZuZPoyd+mWQe2DGPl2ddUDp+mCcke7mJpFwt1LqlhElbLT0Q1RkrpN2kIkYaStWpMcszAG1WrIpeRQY01nQhYRaX3VTKcxmdj5WFI7xQJ/fzsfYrx/Pw8TWn7HurqMMG1wUwCT5IT/t4DyLD7I4aF5SAdG/0wLpGyY4R8KKiZF6wwMkxQwxUI+Z1pmB6V8G7Xg8/Z66HOBUqjrw0dxbHNsTGZI6mGXu63Cgrq9sWvKNz8SYPu7mPtI+WMx3dmSaF/tSk+Ruy6+UEMxhGgMG96gdmbZJ6TEXMAhT3I1EzSSr8jGLEqmcpVj/gPHk0naBKb8QwdcyWQEuiIJ4ihJaHy0V+SBncn3+BjyWZLGtenRvwTRutnd0WUWKmEZowspQ+5iGb5fjURi2pfkHPpS2tmLS4ahMo9y1UFIrrcSCcg7iY4MJ0Lm1By/DS4gFQtqrAXPjE3AR9px89kv6YNia5U1S4vu5wf0dpRBHrbIxks8N99lAf70grGCf0XlGUwAcxdyL3gG8W8Df1AtVsQNNX8qLSUIL5m42cZKDtx50P9FoLzz3M+7OCsYI/eN8lamCl4BPoatZUvrOlLccQyRoRz4i9qDu852FknuR4/eFSIhGtEJBiFq52CUWOtbNkwRymOiChx53ZWniJEV/MxK6AnwhuPSZVSw4DViZgRP44qITBYsIDzjqRUyfj+bfvapSgy4k7o/jPYPPyIoMwHDn3K0gjK57AQ/TEZO8i3Y6iIUw1CqyyR9KfZ376kCf3306UMrkasiAIEDN5AwHVI6b5YjFTPXu5hhsSU2tuINmEeGFE=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(36860700013)(376014)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: gR00r5GqJCTK1jas8+TJVdHphyCAU2R10Z38P+nCgiCmgnFOxdPyWay4nRMvMCM25Mojc2o5qiUlrbF6bSRpaB+UDfTAney4jd55vkLeNrj3c9QHG7iTceNnniv+LiqjKXgK3Z7mEJDNtZzNMN1JzBIVSGNscZuKVksUZii9w3ovTLyM6gjeMLR1vcrYkJEWUAQoaXly2K8fPJ/V2ygKzmhk+TWV1/F0I7N6+62EJ+Q4Ysbwk5L7AloQOOcUZ8+Lm4WdBsQ5tQtD7BQB47Gf4fapDrvNzXu39gXCzMyrFRbm88OpbIjBkshCNGwaepjcWb3EWwfo2WPN+M6pVByYJ64D4sYbZ9sc8MOFEc1O7AiZ6tL0NWQOikXLXZuDcwJ2G91NRNVa3amrvz5r3SrctpY/6GpCLmk6cAQfZ4OA6fpAfvHnuWRtJmcmNY7mKbxG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:54:32.6979 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a79e09-de99-428d-d873-08de75256c80
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8338
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 01/12] dt-bindings: document
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:cristian.marussi@arm.com,m:jens.wiklander@linaro.org,m:etienne.carriere@foss.st.com,m:sudeep.holla@kernel.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,foss.st.com:mid,arm.com:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.597];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3EA451A4A7B
X-Rspamd-Action: no action

CgpPbiAyLzI2LzI2IDExOjQ2LCBTdXp1a2kgSyBQb3Vsb3NlIHdyb3RlOgo+IEhpCj4gCj4gT24g
MjYvMDIvMjAyNiAxMDozMCwgR2F0aWVuIENoZXZhbGxpZXIgd3JvdGU6Cj4+IERvY3VtZW50IHRo
ZSBhY2Nlc3MtY29udHJvbGxlcnMgZm9yIGNvcmVzaWdodCBwZXJpcGhlcmFscyBpbiBjYXNlIHNv
bWUKPj4gYWNjZXNzIGNoZWNrcyBuZWVkIHRvIGJlIHBlcmZvcm1lZCB0byB1c2UgdGhlbS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogR2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2YWxsaWVyQGZv
c3Muc3QuY29tPgo+PiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgKEFybSkgPHJvYmhAa2VybmVs
Lm9yZz4KPj4gLS0tCj4+IMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
YXJtLGNvcmVzaWdodC0gCj4+IGN0aS55YW1swqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICsrKwo+
PiDCoCAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC1keW5hbWljLSAK
Pj4gZnVubmVsLnlhbWzCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICsrKwo+PiDCoCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtIAo+PiBldG0ueWFtbMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArKysKPj4gwqAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9hcm0sY29yZXNpZ2h0LSAKPj4gc3RtLnlhbWzCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDMgKysrCj4+IMKgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0v
YXJtLGNvcmVzaWdodC0gCj4+IHRtYy55YW1swqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICsrKwo+
PiDCoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQt
IAo+PiB0cGl1LnlhbWzCoMKgwqDCoMKgwqDCoMKgwqAgfCAzICsrKwo+IAo+IEFyZSB5b3Ugc3Vy
ZSwgeW91IGFyZSBub3QgbWlzc2luZyAicmVwbGljYXRvciIgaW4gdGhlIGxpc3QgPwo+IAo+IE90
aGVyd2lzZSwgbG9va3MgZ29vZCB0byBtZS4KPiAKPiBBY2tlZC1ieTogU3V6dWtpIEsgUG91bG9z
ZSA8c3V6dWtpLnBvdWxvc2VAYXJtLmNvbT4KPiAKClRoZSByZXBsaWNhdG9yIGlzIG5vdCBwcmVz
ZW50IG9uIHRoZSBMaW51eCBzaWRlIG9uIHN0bTMybXAxeCBwbGF0Zm9ybXMKKE9ubHkgcHJlc2Vu
dCBmb3IgdGhlIENvcnRleCBNNCBjby1wcm9jZXNzb3Igb24gc3RtMzJtcDE1eCBwbGF0Zm9ybXMp
LgpPbiBzdG0zMm1wMnggcGxhdGZvcm1zLCBpdCB3aWxsIGJlIG5lY2Vzc2FyeSBzbyBpdCB3aWxs
IGJlIGFkZGVkIGluIHRoZQpyZWxhdGVkIFAtUiBiZWNhdXNlIHdlJ2xsIG5lZWQgdGhlIHNhbWUg
ZGVidWcgYWNjZXNzIGNoZWNrIG1lY2hhbmlzbS4KCj4gCj4gCj4+IMKgIDYgZmlsZXMgY2hhbmdl
ZCwgMTggaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sY29yZXNpZ2h0LSAKPj4gY3RpLnlhbWwgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtY3RpLnlhbWwKPj4g
aW5kZXggMmE5MTY3MGNjYjhjLi45NDk0NDRhYmExZjggMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC1jdGkueWFtbAo+PiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQt
Y3RpLnlhbWwKPj4gQEAgLTEyOCw2ICsxMjgsOSBAQCBwcm9wZXJ0aWVzOgo+PiDCoMKgwqAgIiNh
ZGRyZXNzLWNlbGxzIjoKPj4gwqDCoMKgwqDCoCBjb25zdDogMQo+PiArwqAgYWNjZXNzLWNvbnRy
b2xsZXJzOgo+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+ICsKPj4gwqAgcGF0dGVyblByb3BlcnRp
ZXM6Cj4+IMKgwqDCoCAnXnRyaWctY29ubnNAKFswLTldKykkJzoKPj4gwqDCoMKgwqDCoCB0eXBl
OiBvYmplY3QKPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hcm0vYXJtLGNvcmVzaWdodC0gCj4+IGR5bmFtaWMtZnVubmVsLnlhbWwgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtLyAKPj4gYXJtLGNvcmVzaWdodC1keW5hbWljLWZ1
bm5lbC55YW1sCj4+IGluZGV4IGI3NGRiMTVlNWY4YS4uYjA2OTNjZDQ2ZDI3IDEwMDY0NAo+PiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQt
ZHluYW1pYy0gCj4+IGZ1bm5lbC55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC1keW5hbWljLSAKPj4gZnVubmVsLnlhbWwKPj4g
QEAgLTc4LDYgKzc4LDkgQEAgcHJvcGVydGllczoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRlc2Ny
aXB0aW9uOiBPdXRwdXQgY29ubmVjdGlvbiB0byBDb3JlU2lnaHQgVHJhY2UgYnVzCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQK
Pj4gK8KgIGFjY2Vzcy1jb250cm9sbGVyczoKPj4gK8KgwqDCoCBtYXhJdGVtczogMQo+PiArCj4+
IMKgIHJlcXVpcmVkOgo+PiDCoMKgwqAgLSBjb21wYXRpYmxlCj4+IMKgwqDCoCAtIHJlZwo+PiBk
aWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sY29y
ZXNpZ2h0LSAKPj4gZXRtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
YXJtL2FybSxjb3Jlc2lnaHQtZXRtLnlhbWwKPj4gaW5kZXggNzFmMmUxZWQyN2U1Li4xMGViYmJl
YWRmOTMgMTAwNjQ0Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9h
cm0vYXJtLGNvcmVzaWdodC1ldG0ueWFtbAo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtZXRtLnlhbWwKPj4gQEAgLTExOCw2ICsxMTgs
OSBAQCBwcm9wZXJ0aWVzOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246IE91dHB1
dCBjb25uZWN0aW9uIGZyb20gdGhlIEVUTSB0byBDb3JlU2lnaHQgCj4+IFRyYWNlIGJ1cy4KPj4g
wqDCoMKgwqDCoMKgwqDCoMKgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMv
cG9ydAo+PiArwqAgYWNjZXNzLWNvbnRyb2xsZXJzOgo+PiArwqDCoMKgIG1heEl0ZW1zOiAxCj4+
ICsKPj4gwqAgcmVxdWlyZWQ6Cj4+IMKgwqDCoCAtIGNvbXBhdGlibGUKPj4gwqDCoMKgIC0gY2xv
Y2tzCj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2FybSxjb3Jlc2lnaHQtIAo+PiBzdG0ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC1zdG0ueWFtbAo+PiBpbmRleCAzNzgzODBjM2Y1YWEu
LmYyNDNlNzZmNTk3ZiAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2FybS9hcm0sY29yZXNpZ2h0LXN0bS55YW1sCj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC1zdG0ueWFtbAo+PiBAQCAtNzMs
NiArNzMsOSBAQCBwcm9wZXJ0aWVzOgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246
IE91dHB1dCBjb25uZWN0aW9uIHRvIHRoZSBDb3JlU2lnaHQgVHJhY2UgYnVzLgo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0Cj4+
ICvCoCBhY2Nlc3MtY29udHJvbGxlcnM6Cj4+ICvCoMKgwqAgbWF4SXRlbXM6IDEKPj4gKwo+PiDC
oCByZXF1aXJlZDoKPj4gwqDCoMKgIC0gY29tcGF0aWJsZQo+PiDCoMKgwqAgLSByZWcKPj4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVz
aWdodC0gCj4+IHRtYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9hcm0sY29yZXNpZ2h0LXRtYy55YW1sCj4+IGluZGV4IDk2ZGQ1YjVmNzcxYS4uOWRjMDk2Njk4
YzY1IDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L2FybSxjb3Jlc2lnaHQtdG1jLnlhbWwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2FybS9hcm0sY29yZXNpZ2h0LXRtYy55YW1sCj4+IEBAIC0xMjgsNiArMTI4LDkg
QEAgcHJvcGVydGllczoKPj4gwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogdHJhY2VkYXRhCj4+IMKg
wqDCoMKgwqDCoMKgIC0gY29uc3Q6IG1ldGFkYXRhCj4+ICvCoCBhY2Nlc3MtY29udHJvbGxlcnM6
Cj4+ICvCoMKgwqAgbWF4SXRlbXM6IDEKPj4gKwo+PiDCoCByZXF1aXJlZDoKPj4gwqDCoMKgIC0g
Y29tcGF0aWJsZQo+PiDCoMKgwqAgLSByZWcKPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC0gCj4+IHRwaXUueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC10cGl1Lnlh
bWwKPj4gaW5kZXggYTIwN2Y2ODk5ZTY3Li4yOWJiYzM5NjFmZGYgMTAwNjQ0Cj4+IC0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC10cGl1Lnlh
bWwKPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sY29y
ZXNpZ2h0LXRwaXUueWFtbAo+PiBAQCAtNzAsNiArNzAsOSBAQCBwcm9wZXJ0aWVzOgo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgZGVzY3JpcHRpb246IElucHV0IGNvbm5lY3Rpb24gZnJvbSB0aGUgQ29y
ZVNpZ2h0IFRyYWNlIGJ1cy4KPj4gwqDCoMKgwqDCoMKgwqDCoMKgICRyZWY6IC9zY2hlbWFzL2dy
YXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydAo+PiArwqAgYWNjZXNzLWNvbnRyb2xsZXJzOgo+PiAr
wqDCoMKgIG1heEl0ZW1zOiAxCj4+ICsKPj4gwqAgcmVxdWlyZWQ6Cj4+IMKgwqDCoCAtIGNvbXBh
dGlibGUKPj4gwqDCoMKgIC0gcmVnCj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
