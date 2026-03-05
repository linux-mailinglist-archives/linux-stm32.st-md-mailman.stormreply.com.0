Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMSYNNh/qWkd9gAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 14:06:32 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B20212605
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Mar 2026 14:06:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0B95BC8F26D;
	Thu,  5 Mar 2026 13:06:32 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013044.outbound.protection.outlook.com [52.101.72.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1745C87EC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Mar 2026 13:06:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YyxGJV/KqX0/sy3XYZtOC88GQ7jDjhJnmyXwspgMlSR39VtwjkzldMsFAo0kOLoVHmnIH+YPvlcNERmM7LpOSH4O9jgf04ovkKrWW+qEq699Nzuu96FP7AX1pRTx4NBDjjR8N33OiYWotqcMuri96fxdutTMiTaed+zmLQrBP8XEbwjXDoik/jJa0LGqeEOXSFPr8djp59P5ve3ZxC+p+TXC2mvd9134XWqP4nQf0/sjkHpDg4UIGbysWLfsQ6C5AocAqcDoSf5r5aqEUDLxlCm0XxCZP0AzV2Pg4sfSGexW5dSk4HAdk9jukKFEvBo+R3gj0BmhWsw+how9G09ekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzM7zhyJRFiCYu/fpH2xJ+1v4FcLLsfnW4kGzg5pPUM=;
 b=XO6m/IjwQIozPq7F5jqIcdcuBLb+vN2oTMruyxzwI7z4FEonB0p4O+DlPHOQ8NgdJanVOc+XPcR+VdWYzmOdlESRA/l2cQOUs8HKDGc66T/orG0LTIdIIf5Kz8sw7OAJHSHXRyT0TP8lKYzO/hmu8AuXQMlmjnOJI/R+DHCSGo2EO6eSho9GK4FToOJMbeM7lljEhpGuE48lwzfi5YaN4Gx6/ATMwcm/3bulW+QDI8IKCP7v8V7ZYUtLmzEK+6o8/8pH098sF2jWOpDMvaVLcw+T5+JX+VTrP8cN3pM+N7jn9vrWeT+dj7j1IUyrPgEAaflCYTUQny+sSnMT4c3h6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzM7zhyJRFiCYu/fpH2xJ+1v4FcLLsfnW4kGzg5pPUM=;
 b=cahVYjnMEf0Rc94bZ/pFREspp4s+fzDx9PMU6CEpMqaJn0wQHPQ/e/qLUUBUXcGuxmoxk8+phufHCVr8hkLjzc9riSIoNRsgdy19YBGTE6qs16bAcXIhnk6CDEEN+ahQgve27vorD59mW3vuWxu1zZnqNCY2MKVLC9aLfPu5FmrP7fnk86y8MDDe8/QaNTpgSPl8TNf2DimKrKacjMvU0gt6+KqH++qwti8MAAGx7EPaAVNJj2UaohReU3SofWSC+/dQxDfO6aPPsx9t8dUS5PcV3UKMY2/Qoz4mbT3U5R0bIVhy8BBtUhG2WprhnnRJ9hB3YHuU1Q7WM40r/0OQCA==
Received: from CWLP265CA0469.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d4::7)
 by AS8PR10MB7799.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:629::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 13:06:28 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:400:1d4:cafe::5d) by CWLP265CA0469.outlook.office365.com
 (2603:10a6:400:1d4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 13:05:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 13:06:27 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Mar
 2026 14:08:39 +0100
Received: from [10.130.75.212] (10.130.75.212) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Mar
 2026 14:06:26 +0100
Message-ID: <f086a52f-332f-4be9-aff0-d283fb516637@foss.st.com>
Date: Thu, 5 Mar 2026 14:06:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>
References: <20260210-display-v2-0-0592bd514958@foss.st.com>
Content-Language: en-US
In-Reply-To: <20260210-display-v2-0-0592bd514958@foss.st.com>
X-Originating-IP: [10.130.75.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|AS8PR10MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e7402a3-02bf-4a3c-0ef6-08de7ab80320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024; 
X-Microsoft-Antispam-Message-Info: MybMf/UrxM18UdP80WVVm8M6rBGAjOnglAgwFp6OucBfDtJvenC4XiNpE3hVgqUJUSTCBQX/RjT8/XSpYva41IhMFaZI51WllzFF5KtAZdaR0VjnhOSVZnaaELNaY1w1KIVZPorlp0hWDzUj8j2dYeGLsnklrOWyQQ6URPSJkMn9fzNgYZRwHvFnU6UrqScarggjr9f53/RFMqhpc60Bqu2tTo3VUtg7AJH/wZzLW9lt0AHwpznJB86vL6gGJid0tC1SQK8nT8l8dWStObj/0MMSV+AqBEbadUAwt082T5KS3QMcJS5V7p1cHl/AP/gvg/t6rJOWYfprukY0jOyZiRHONjkR87cqnth6nDtdqhS6vffDGrBHbky9Iv4EGb7hq2ccMqq0PNMS62HzCkm5u6hEiA7cZHTFGTr9xpGq2GQX6UUQ6wS0gS4trJ2AoVK4AofGK2pM8gcZ8WOE2ri9BRVdMa0nmXWtPxdNkLB9Rio3rMdTGFtlatujAMy4cMmIFDKFf7Rge48wN6ySUwynuLBqAHbm8jMAEcAN6MVk1bcLAns2AHom8AH1cN2ye6+ferMQLowQqCDMXkYCa5IvG/EGp2F4yzXSNPWFNHHR/YaOj5emJVJmBgUanKllDHo6GbfDD+ADlynmTyCgaoe1trgUnr9ZMWibWF+wrsxK+xKjZ6HYyMdqwY7Rn4iLfy08bQO/raiVRLcsKqjdlAN6CwFQFEmv3M4Jj71qIzDQKZf3LEjuOkv9eL9XsZG16avGNdNMfPCy1PPBspbpEcUAyQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: prWVd/eeu/je/xO8IfDaojv7pfY2maTI51OuZtvmUdFcGy2r+hUlTOwE3ywiufZDyH5zdQxXJQ9sVaH3UivH4lrRdeJBlXFLEFhUW6SMNResbHeU4BDiYcGzN5RW9KLMA1tg5PGBWgf0uDP31WeKPvSF84rRValLZeLO2oXGN+7ncYhlVz9UWxerZWn2GVT4lQ2hHeOCHXlGb8vsIf7vOcotheIzvT7jIexsOm6K8fPkTD49WFhI4ZhGg0TS3NCbFmLa30maoGULBcxM/hPd74ie5UfdKKlf04Q8kNDQDMfrddqQixOxinDzh6RjdFCuRT6lXI8E29MLewelPKOklMHc1P1LDd0Us0U1kHyIN5gKMHBoQ3F9hiFkeXt3xZsRJmHAgGtvEAQws/+Jodq3pa6a7Vrm4SV+Vx0Tidpk162gGIfZi4BLKfs2RD2a86qO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 13:06:27.7343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e7402a3-02bf-4a3c-0ef6-08de7ab80320
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7799
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 0/9] Enable display support for
 STM32MP257F-DK and STM32MP235F-DK
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
X-Rspamd-Queue-Id: 66B20212605
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:christophe.roullier@foss.st.com,m:devicetree@vger.kernel.org,m:yannick.fertre@foss.st.com,m:linux-kernel@vger.kernel.org,m:rgallaispou@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FREEMAIL_CC(0.00)[vger.kernel.org,foss.st.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[foss.st.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.085];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

CgpPbiAyLzEwLzI2IDExOjAzLCBSYXBoYWVsIEdhbGxhaXMtUG91IHdyb3RlOgo+IFRoaXMgc2Vy
aWVzIGFpbXMgdG8gYWRkIGFuZCBlbmFibGUgc3VmZmljaWVudCBMVkRTIGRpc3BsYXkgc3VwcG9y
dCBmb3IKPiBTVE0zMk1QMjU3Ri1ESyBhbmQgU1RNMzJNUDIzNUYtREsgYm9hcmRzLgo+Cj4gU2ln
bmVkLW9mZi1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5nYWxsYWlzLXBvdUBmb3Nz
LnN0LmNvbT4KPiAtLS0KCkhpLMKgCgpHZW50bGUgcGluZyByZWdhcmRpbmcgdGhpcyBzZXJpZXMu
IEkgaGF2ZSBub3QgcmVjZWl2ZWQgYW55IGZlZWRiYWNrcyBmcm9tIGl0IGluCmEgbW9udGguCgpU
aGFua3MgZm9yIHlvdXIgdGltZSzCoApCZXN0IHJlZ2FyZHMswqAKUmFwaGHDq2wKPiBDaGFuZ2Vz
IGluIHYyOgo+IC0gQWRkZWQgc3VwcG9ydCBmb3IgU1RNMzJNUDIzNUYtREsuIEEgc2Vjb25kIHNl
cmllcyB3b3VsZCBoYXZlIGRlcGVuZGFudAo+ICAgdG8gdGhlIHYxIG9mIHRoaXMgc2VyaWVzIGR1
ZSB0byB0aGUgcGluY3RybC4gIEJldHRlciBzZW5kIGl0IHRob3VnaAo+ICAgb25lIHB1c2ggdG8g
cmVkdWNlIGRlcGVuZGVuY2llcy4KPiAtIExpbmsgdG8gdjE6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDI2MDIwNS1tYXN0ZXItdjEtMC1mZTYzOTlhYTNhYWJAZm9zcy5zdC5jb20vCj4K
PiAtLS0KPiBSYXBoYWVsIEdhbGxhaXMtUG91ICg5KToKPiAgICAgICBhcm02NDogZHRzOiBzdDog
YWRkIGkyYzIgcGlucyBmb3Igc3RtMzJtcDI1Cj4gICAgICAgYXJtNjQ6IGR0czogc3Q6IGFkZCBs
dGRjIHN1cHBvcnQgb24gc3RtMzJtcDIzMQo+ICAgICAgIGFybTY0OiBkdHM6IHN0OiBhZGQgbHRk
YyBzdXBwb3J0IG9uIHN0bTMybXAyMzUKPiAgICAgICBhcm02NDogZHRzOiBzdDogYWRkIGx2ZHMg
c3VwcG9ydCBvbiBzdG0zMm1wMjM1Cj4gICAgICAgYXJtNjQ6IGR0czogc3Q6IGFkZCBjbG9jay1j
ZWxscyB0byBzeXNjZmcgbm9kZSBvbiBzdG0zMm1wMjMxCj4gICAgICAgYXJtNjQ6IGR0czogc3Q6
IGRlc2NyaWJlIHBvd2VyIHN1cHBsaWVzIGZvciBzdG0zMm1wMjM1Zi1kayBib2FyZAo+ICAgICAg
IGFybTY0OiBkdHM6IHN0OiBlbmFibGUgZGlzcGxheSBzdXBwb3J0IG9uIHN0bTMybXAyMzVmLWRr
IGJvYXJkCj4gICAgICAgYXJtNjQ6IGR0czogc3Q6IGRlc2NyaWJlIHBvd2VyIHN1cHBsaWVzIGZv
ciBzdG0zMm1wMjU3Zi1kayBib2FyZAo+ICAgICAgIGFybTY0OiBkdHM6IHN0OiBlbmFibGUgZGlz
cGxheSBzdXBwb3J0IG9uIHN0bTMybXAyNTdmLWRrIGJvYXJkCj4KPiAgYXJjaC9hcm02NC9ib290
L2R0cy9zdC9zdG0zMm1wMjMxLmR0c2kgICAgICAgIHwgIDE5ICsrKysrCj4gIGFyY2gvYXJtNjQv
Ym9vdC9kdHMvc3Qvc3RtMzJtcDIzNS5kdHNpICAgICAgICB8ICAxOCArKysrCj4gIGFyY2gvYXJt
NjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDIzNWYtZGsuZHRzICAgICB8IDExNyArKysrKysrKysrKysr
KysrKysrKysrKysrCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1LXBpbmN0cmwu
ZHRzaSB8ICAxNyArKysrCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZGsu
ZHRzICAgICB8IDExOCArKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5n
ZWQsIDI4OSBpbnNlcnRpb25zKCspCj4gLS0tCj4gYmFzZS1jb21taXQ6IDA1ZjdlODlhYjk3MzE1
NjVkOGE2MmUzYjVkMWVjMjA2NDg1ZWViMGIKPiBjaGFuZ2UtaWQ6IDIwMjYwMjA5LWRpc3BsYXkt
NTE2YzJjZWRjNzM0Cj4KPiBCZXN0IHJlZ2FyZHMsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
