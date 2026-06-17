Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rg/AMg1YMmpzywUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2026 10:17:17 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0F26977B0
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2026 10:17:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=foss.st.com header.s=selector2 header.b=nibwvKlG;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=foss.st.com (policy=none);
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DF451C8F28C;
	Wed, 17 Jun 2026 08:17:16 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012047.outbound.protection.outlook.com [52.101.66.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 59426C7129F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2026 08:17:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqiokRLFzLe4uoXu31YTLQef0Zk/WIve2Xk5Dsb5IOf4XLSYQtYSDHD3sxDr84iVg1ven8DhWFQG7bjEA0yQMNcyuY7t8pzo20aBf3EMUfSf4+wZSEFRaHnahY6GZnqvKEl9PZyeXHKBO5lEqi2p4pdP0c0EPnpxf0jmrUhMe8ildskIo2X4QSNA16uQt+fpgjeQH8IYREZZEt8Nd3Y+EK1OerTMVFo+ht2n5UaBlfAX2uWBrEcTnIBdyP4PqEuu1wDFrEYJgCTGGiVWJ7lniITDm/pDLbZw9I9ImqfErJPc7IEWeLkOC2b1kqUWs1GPEpP+1234QjcSI6M5WYDiFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBTKYwGxxl/jM+RXNLO33CzMPL8Fj3pA2Ytc8fhml8c=;
 b=It2ly8+ULMATefgtof154etO5R//V528J8+KqgPB5wSsT2lYWW1Ospw+2ztCEqZycoDg4Qom4tABYNMXzo/hkFVHUvlavFY4whAG44iW8z1pcv4ifU5Y7wuawMK4AyzU41JQNfym8qgyN3u+d0aPDz9X70jWDJMkeaGCLmVIbTpuVCvN8PIWg7P3iQNQmMRjd3qtoTkZFJH/7LVNs6tVej/H7T9Z+5mqXDAsdIxKca8aoOFUb0T0U/ktF2lRsVb73J8fg62HdvKzYPQXevHy4jfFQp30JUnXYqsFtIo/HnD7S3qimcPSAWJareOYYCPjRXYekNXdVzPFnsQAjgXrKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBTKYwGxxl/jM+RXNLO33CzMPL8Fj3pA2Ytc8fhml8c=;
 b=nibwvKlGwJLkx8nQ9SY0Zjs7sBok+m3/Vhzr13H7ZfQhU5tVVGcTx9QVHu+Sejp64wj0uaRzUwstyfK9FUgeFdcW0ujCqMI0EYrHb1qxYpylaNCrXXSFqZ4cOR5/FQZlG1EUlOeo4giL6qFY4EomAyaPcZy41wCR95FZKsukw/c1w/IAVA+qCTU1H3LxEzM+v+WPoIc3cl/SoXvfrmzRsr5bNImcEVo4b/3arJfYxcyeKi/KNxUbSbBimYjOjNshpekdJDKaaD8e8B9sn47rr36Qpa2cGYNuTIacc9yViSlTWK6NMwX/rJsi1PtjjpySnCIAvTpFY1uSYm8EfCsj7A==
Received: from DUZPR01CA0115.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::27) by FRWPR10MB9255.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:d10:16f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 08:17:12 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::7) by DUZPR01CA0115.outlook.office365.com
 (2603:10a6:10:4bc::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 08:17:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 08:17:12 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 17 Jun
 2026 10:21:16 +0200
Received: from [10.48.87.176] (10.48.87.176) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Wed, 17 Jun
 2026 10:17:11 +0200
Message-ID: <ca964566-597c-4675-8e41-33382bcb63b8@foss.st.com>
Date: Wed, 17 Jun 2026 10:16:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alain Volmat <alain.volmat@foss.st.com>,
 =?UTF-8?Q?Guillermo_Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
References: <20260611104857.242153-1-guille.rodriguez@gmail.com>
 <ajJVct1fcVrUSuLE@gnbcxd0016.gnb.st.com>
Content-Language: en-US
From: Pierre Yves MORDRET <pierre-yves.mordret@foss.st.com>
In-Reply-To: <ajJVct1fcVrUSuLE@gnbcxd0016.gnb.st.com>
X-Originating-IP: [10.48.87.176]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9B:EE_|FRWPR10MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e6a34b8-8673-4ec5-a2b6-08decc48d5a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|22082099003|18002099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: raP/PKNKoYHmWq9gzQtl4a9eBTbwShqwmfLa6bPQTAHeJ5JI0awCSvkmPDa3v4YfKfbwPXpji2WtTIXpRfgzSDYAXwtF1XFJ0i236KZMAI7tHcCsVB0r9a9ckdo79qtGBxUcLjd2gbOY4Hg7vgW8p+HP+GBbuDf9iszkDg52gmb2GvrpIiKDYEX4N15K0HQ26pFZfzsFg4qiGqU2Y92QC4i8c82vwGfoz0hUw0dFpkqdtlWoYiTajt5j1WIoiyPHRde4UtIvwaBskeiCyxOsG56jjNZ6ChMw+FZkG/9JpDrvu2XNfqyOV2lyi2A7aqCOV+US4fL7Wl5qoWGlmo6qKCEoGsuzosMeJxC22uqeH5LJI1XgjrRQcVBC6noYpC7cKPDgyYuwd9JNhSaeSTRqMSChUUqsohrsOTV+zPSi91ZtAnIfR62SYXW2LMBn5loxtbBsD+tY0VBHNwnRBORUY9FdsL3uByBmo6s6XxJS6Cdq8GQ7slVupEA3ruvuscL6XnHYQuFFbIGS/IjedmJfUSZuA4AAo3znrYRreATQqcpHHrwOIN29pNIRm90NCnzqXbsiIRH+yEIWdtDC8a+izTMFpEF0MYrARNmAkFQ5mmnF+WH5Y+7mgZyUcJswaO92t6WAf6xYsSrj+oc0f1NxBG39t8/dyl1oXAZXI82kK5Sf0L93fMImab0lvypwIfPaSv+UxIvXVUur6+IJ7DyEtdrekwKAHNO4RuOJY47nHxE=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4MRQ4fVuz41PihA79cTpm8ixhM+J6pmFImZMTECFqrehdArugBtqkVd4enllbOYHz+iomgMq7Ux/fQXgzn1AWoWL9BP4HpZpk0zolYznsGnKRiLa5suuPznqGDLrboiVtl4taAUw4DhijWkXB6qQBtVcFIryZ9Y349zEUB/MidVmpOW3Lf6cJPu0LcYhtZSuOFowqM+YPAc3Z0Hssctd6WdLOl1v+igeJ/hXfVzS+PmbXvQ3f8Fy9YGH2JKoaUSQIG9ThU65jQaQYH0yVQnF3ODwrIGJTkaUWtImFJAVB0AmaFVy7I0M3aWsW7+wwWp03ljr8qFnWU6L2CE87xlbvj4Wia8D9MV8P7iT3GA0qvTYPxvRBwR68aWY2xrbigsNU98ey4uuHMpmNL4q+6RQJDGAk3/fvlVdLrbhTdEEeoSxuJyqwgjKJFnWFhoP6sjt
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 08:17:12.5984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e6a34b8-8673-4ec5-a2b6-08decc48d5a3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9255
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Pierre-Yves MORDRET <pierre-yves.mordret@st.com>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 M'boumba Cedric Madianga <cedric.madianga@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] i2c: stm32f7: truncate clock period
 instead of rounding it
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alain.volmat@foss.st.com,m:guille.rodriguez@gmail.com,m:andi.shyti@kernel.org,m:pierre-yves.mordret@st.com,m:linux-kernel@vger.kernel.org,m:wsa@kernel.org,m:linux-i2c@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:cedric.madianga@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:guillerodriguez@gmail.com,m:mcoquelinstm32@gmail.com,m:cedricmadianga@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,gmail.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[pierre-yves.mordret@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:from_mime,st.com:email,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[foss.st.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pierre-yves.mordret@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,st.com,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B0F26977B0

SGkgYWxsLAoKTG9vayBnb29kIHRvIG1lLgoKQmVzdCBSZWdhcmRzCgpSZXZpZXdlZC1ieTogUGll
cnJlLVl2ZXMgTU9SRFJFVCA8cGllcnJlLXl2ZXMubW9yZHJldEBmb3NzLnN0LmNvbT4KCk9uIDYv
MTcvMjYgMTA6MDYsIEFsYWluIFZvbG1hdCB3cm90ZToKPiBIaSBHdWlsbGVybW8sCj4gCj4gbWFr
ZSBzZW5zZSBpbmRlZWQuIFRoYW5rcyBhIGxvdCBmb3IgdGhpcyBwYXRjaC4KPiAKPiBPbiBUaHUs
IEp1biAxMSwgMjAyNiBhdCAxMjo0ODo1NlBNICswMjAwLCBHdWlsbGVybW8gUm9kcsOtZ3VleiB3
cm90ZToKPj4gc3RtMzJmN19pMmNfY29tcHV0ZV90aW1pbmcoKSBkZXJpdmVzIHRoZSBJMkMgY2xv
Y2sgc291cmNlIHBlcmlvZAo+PiAoaTJjY2xrKSB3aXRoIERJVl9ST1VORF9DTE9TRVNULCB3aGlj
aCBtYXkgcm91bmQgaXQgdXAuIFdoZW4gdGhlCj4+IHBlcmlvZCBpcyBvdmVyZXN0aW1hdGVkLCBh
bGwgdGltaW5ncyBjb21wdXRlZCBmcm9tIGl0IChTQ0xERUwsCj4+IFNEQURFTCwgU0NMTCwgU0NM
SCkgY29tZSBvdXQgc2hvcnRlciBvbiB0aGUgd2lyZSB0aGFuIGNhbGN1bGF0ZWQsCj4+IGFuZCB0
aGUgcmVzdWx0aW5nIGJ1cyByYXRlIGNhbiBleGNlZWQgdGhlIHJlcXVlc3RlZCBzcGVlZCwgdmlv
bGF0aW5nCj4+IHRoZSBJMkMgc3BlY2lmaWNhdGlvbiBtaW5pbXVtcyBmb3IgdExPVyBhbmQgdEhJ
R0guCj4+Cj4+IEZvciBleGFtcGxlLCB3aXRoIGEgMTA0LjQ1IE1IeiBjbG9jayBzb3VyY2UgKGUu
Zy4gUENMSzEsIHRoZQo+PiByZXNldC1kZWZhdWx0IEkyQyBjbG9jayBzb3VyY2Ugb24gU1RNMzJN
UDEpLCBpMmNjbGsgaXMgcm91bmRlZCBmcm9tCj4+IDkuNTc0IG5zIHVwIHRvIDEwIG5zLiBSZXF1
ZXN0aW5nIGEgNDAwIGtIeiBmYXN0IG1vZGUgYnVzIHdpdGgKPj4gNzIvMjcgbnMgcmlzZS9mYWxs
IHRpbWVzIGFuZCBubyBhbmFsb2cvZGlnaXRhbCBmaWx0ZXJzIHRoZW4gcHJvZHVjZXMKPj4gYW4g
YWN0dWFsIGJ1cyByYXRlIG9mIDQxNS42IGtIeiB3aXRoIHRMT1cgPSAxMjU0IG5zLCB2aW9sYXRp
bmcgYm90aAo+PiB0aGUgNDAwIGtIeiBtYXhpbXVtIHJhdGUgYW5kIHRoZSAxMzAwIG5zIHRMT1cg
bWluaW11bSBvZiB0aGUKPj4gc3BlY2lmaWNhdGlvbi4KPj4KPj4gVHJ1bmNhdGUgdGhlIHBlcmlv
ZCBpbnN0ZWFkLCBzbyB0aGF0IGl0IGNhbiBvbmx5IGJlIHVuZGVyZXN0aW1hdGVkLgo+PiBUaGUg
ZXJyb3IgdGhlbiBmYWxscyBvbiB0aGUgc2FmZSBzaWRlOiB0aGUgcHJvZ3JhbW1lZCB0aW1pbmdz
IGNvbWUKPj4gb3V0IHNsaWdodGx5IGxvbmdlciB0aGFuIGNvbXB1dGVkIGFuZCB0aGUgYnVzIHJ1
bnMgbWFyZ2luYWxseSBiZWxvdwo+PiB0aGUgdGFyZ2V0IHJhdGUgKDM3NS4zIGtIeiBpbiB0aGUg
ZXhhbXBsZSBhYm92ZSkgd2hpbGUgbWVldGluZyB0aGUKPj4gc3BlY2lmaWNhdGlvbi4KPj4KPj4g
aTJjYnVzIGlzIGxlZnQgcm91bmRlZC10by1jbG9zZXN0OiBpdCBpcyBvbmx5IHVzZWQgYXMgdGhl
IHRhcmdldCBvZgo+PiB0aGUgY2xrX2Vycm9yIGNvbXBhcmlzb24gYW5kIGlzIG5ldmVyIG11bHRp
cGxpZWQgaW50byB0aGUgcHJvZ3JhbW1lZAo+PiB0aW1pbmdzLCBzbyBuZWFyZXN0IHJvdW5kaW5n
IHJlbWFpbnMgYWNjdXJhdGUgdGhlcmUuCj4+Cj4+IEZpeGVzOiBhZWIwNjhjNTcyMTQgKCJpMmM6
IGkyYy1zdG0zMmY3OiBhZGQgZHJpdmVyIikKPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
Pj4gU2lnbmVkLW9mZi1ieTogR3VpbGxlcm1vIFJvZHLDrWd1ZXogPGd1aWxsZS5yb2RyaWd1ZXpA
Z21haWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jIHwg
OSArKysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcu
YyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtc3RtMzJmNy5jCj4+IGluZGV4IDUzZDlkZjcwZWJl
NC4uNjQzOTYyMGQ2YmVkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0
bTMyZjcuYwo+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXN0bTMyZjcuYwo+PiBAQCAt
NDY0LDggKzQ2NCwxMyBAQCBzdGF0aWMgaW50IHN0bTMyZjdfaTJjX2NvbXB1dGVfdGltaW5nKHN0
cnVjdCBzdG0zMmY3X2kyY19kZXYgKmkyY19kZXYsCj4+ICB7Cj4+ICAJc3RydWN0IHN0bTMyZjdf
aTJjX3NwZWMgKnNwZWNzOwo+PiAgCXUzMiBwX3ByZXYgPSBTVE0zMkY3X1BSRVNDX01BWDsKPj4g
LQl1MzIgaTJjY2xrID0gRElWX1JPVU5EX0NMT1NFU1QoTlNFQ19QRVJfU0VDLAo+PiAtCQkJCSAg
ICAgICBzZXR1cC0+Y2xvY2tfc3JjKTsKPj4gKwkvKgo+PiArCSAqIFRydW5jYXRlIGluc3RlYWQg
b2Ygcm91bmRpbmcgdG8gY2xvc2VzdDogaWYgdGhlIGNsb2NrIHBlcmlvZCBpcwo+PiArCSAqIG92
ZXJlc3RpbWF0ZWQsIHRoZSBjb21wdXRlZCBTQ0wgdGltaW5ncyB3aWxsIGNvbWUgb3V0IHNob3J0
ZXIgb24KPj4gKwkgKiB0aGUgd2lyZSwgd2hpY2ggY2FuIHB1c2ggdGhlIGJ1cyBhYm92ZSB0aGUg
dGFyZ2V0IHJhdGUgYW5kIGJlbG93Cj4+ICsJICogdGhlIHNwZWMncyB0TE9XL3RISUdIIG1pbmlt
dW1zLgo+PiArCSAqLwo+PiArCXUzMiBpMmNjbGsgPSBOU0VDX1BFUl9TRUMgLyBzZXR1cC0+Y2xv
Y2tfc3JjOwo+PiAgCXUzMiBpMmNidXMgPSBESVZfUk9VTkRfQ0xPU0VTVChOU0VDX1BFUl9TRUMs
Cj4+ICAJCQkJICAgICAgIHNldHVwLT5zcGVlZF9mcmVxKTsKPj4gIAl1MzIgY2xrX2Vycm9yX3By
ZXYgPSBpMmNidXM7Cj4+IC0tIAo+PiAyLjI1LjEKPj4KPiAKPiBBY2tlZC1ieTogQWxhaW4gVm9s
bWF0IDxhbGFpbi52b2xtYXRAZm9zcy5zdC5jb20+Cj4gCj4gUmVnYXJkcywKPiBBbGFpbgoKLS0g
Ci0tCn4gUHkgTU9SRFJFVAotLQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
