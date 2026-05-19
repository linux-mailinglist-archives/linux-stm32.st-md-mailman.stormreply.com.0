Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDC/D70vDGq0XwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 11:39:09 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E2B57B6F1
	for <lists+linux-stm32@lfdr.de>; Tue, 19 May 2026 11:39:08 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D63DC8F294;
	Tue, 19 May 2026 09:39:08 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 83E73C349C4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 May 2026 09:39:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WkHk2eU74Pm3fg6YTKv522ZQMaqDv4SLYIftaoUwx1XJ8mQTcuNQeA+WGD3/RB7X+nqNNUfpaEQUEMLNrbLAydlrL2dM+T428bZ9vBIe6FQPP/pzAQyfNNMmoIyf4dI7XtgcBgp5C4/XdQXUeSLJXhVfF5vhWFk/uT9UFqEyTBiuyYg4YygGYS4s1qg3UtkUtJoOgMYsT6/5k5GoSU+u3Nl4vVALArigaN6kKmPncq4fFtc/mb94bR9IsuCcq3fltj9l4tpxzWFrV0rlO118UB+TGiVd8lg7kG9FwkSS9qZG5PVSzCp1P2MFZNWGMiICizJc4Y78bhOvOkTspLwo+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BdhlnYeYNj9B2/Sn88AKPaPWZbTenhSivsBzEhx8Yns=;
 b=Gcqs4yc+EaGpVqd0IwnFvnHDaWkICC3S8SU+vokCdK4KVpySqCHsORQ5kcDatUhYReWdnnvm8SLWvTkkL+pq+jsbefd4fA+p2EccO5SYO6acE+/x+w1UOMsev6IqAwixROoQ9jNqFyWjws7oF2FhA/bX2IbA8UxdHvGSsSb579ewGqsZf0548sbSZtncEvagBwCFiZa5mk6QdgKxoWgkfrGRc+rxKeowcpBtYJY8wWtmjPb3/FlcwugwdAPkC9unxZVBsm3bm8vXE39CJp466ngj2v+CeTNDjcXDjMbuCTui0PPL9GYd3fA6EZrce6IWowdP0jM4v2hXdG2tT4e9pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=baylibre.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BdhlnYeYNj9B2/Sn88AKPaPWZbTenhSivsBzEhx8Yns=;
 b=efK0PN45BVBIjiwaRzqkdbdP1ogNafWAHUILecmI6t84atRjAyEJRPioceSEpQSeg2/jlOt6vPfL29OsdPgfmgpODowyyr5HgqYrkQM5cYv5UWnq4bLAQMlyFfd1HOBC13IvoUNS3HTJ2TuyU4J3cP/X+V+3HjfDZ99RXPZfpDJxNMF1pg7o0wy/v31zRDPCswd1HDB1nooPoRL4nwUx/vut3YRi7y/FPX6OCY8qLozDrNE/laPw5F6o2/EFeBAYibnBWfu7H52ObOMwfHG4CkYtXoNWdg9x4MPC2HxZ72Ovjut6Op2o1Qb2c5ozONnY0d48CQK1LW3s3HpPM2mkLA==
Received: from DB8PR06CA0061.eurprd06.prod.outlook.com (2603:10a6:10:120::35)
 by AM0PR10MB3123.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:18b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 09:39:05 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::56) by DB8PR06CA0061.outlook.office365.com
 (2603:10a6:10:120::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 09:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 09:39:05 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 11:42:57 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 19 May
 2026 11:39:03 +0200
Message-ID: <09d3d997-6b4c-43e8-b153-7eb31f17192c@foss.st.com>
Date: Tue, 19 May 2026 11:39:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>
References: <20260420204647.1713944-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260420204647.1713944-2-u.kleine-koenig@baylibre.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B95:EE_|AM0PR10MB3123:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e43d9c5-bbea-496c-dfdc-08deb58a77b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|11063799006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: MPbrlK3rOnjw9idjj0DgRA8qbaZjcS6qBF8/5eowhQY1Q8yNEt6XKunzqWUwsmv/ITjSKSBpkaZ3/F7fQSQq5etZz2S62T8XcJ8dHZg9826/KDimIHcJYUDzcp3WOfFqDt9PUSM4daMbCamULc6xqukQRhBm1jpLuXcFwQ+oIhTFrKZxmtTfb+PkCxdGK7CJtvbYlrf2dpvXVwN/MUyzIa07mjn2UXJsVIGKiDfYyJvwzTRZW+K4h4rmo35l7SnqKrAlcRj8SFNno0pXOHLo+dVmV4DWhmNIUB0BiyDujMvV8RyjufFNOifVIxnpK8iYGdwQ0GQ3MA+O5h8S2Ih7RQx8h6LQgGq1//wWRFDo+juvmvF52RDKvg5+4RvLsCB2TSNYpBhRwCjYS33yGHUGDt+AXXTeG4joUbD9RESaaJCvAgljb+3jOVCvIWyjKNQ+AEIIg++hnf+S78A7ZzKQVrtXGKlmiGVnNBXOVCaF/9S04u6L1R7Hh3Of+pzeVJjlT546WNiS9ASEx4EiCAKKAzGcFymr3VROFSgYSgwQaLclLTQi51gSZobTldqnTARHDD0SJhIIwznqz0oRZgxi6lcGG+Ur7MxxkkpO5Jkz6ySck4Ft6/vsnLSx/T/V+Vo05u3GrSqS6qIHNwf7HXNY15eB7vkn7JNkZK9PbDZOv9g=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(11063799006)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9FCNVyLeVL8cufqaciNNYGXUxXaFoNJ3B8PBhGDcFSMH6LiwO12GqEg5WE9c46tVA0bCkgbp0ot/rSWf27nRqLSXeJDpWrV0NiLhPdzb+lFnCRTbnS4qlw64HmNRxKazQRz2l2g4jd3O5WPojPBeKS9166MP+4T7Z3AXe45+TMvghORFeZIGn74AASWN7S0dL+nxn/LWBFj3wvR79Wt9HZuFt4vqQC9zzBXtXNQwz9uLoxp5ME6UrrCmF45IajM4n6kVAUhrBKSZlL61b4o7y/uawqPSvw4NLplqAyFqrlmgo00gxiiE3C+7xsXzm5v9nWQAiSp8cQCLLoj0bf+fPA/N3sJ3sWFnNOHoef/RWY6z9TNlml1xg8lvnj2xbwV/bUuAyCkM2hJ+W4tJr5yZYjWsnuQmYXd4SIHavjaqvC8ZeQdo048RHmEikDPigG8A
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 09:39:05.0281 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e43d9c5-bbea-496c-dfdc-08deb58a77b1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3123
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2] ARM: dts: stm32: add board pin
 documentation stm32mp135f-dk
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[baylibre.com,gmail.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,sashiko.dev:url,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,foss.st.com:mid,baylibre.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D3E2B57B6F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgVXdlCgpPbiA0LzIwLzI2IDIyOjQ2LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiBSZWxh
dGUgdGhlIGRldmljZXMgZGVmaW5lZCBpbiB0aGUgZGV2aWNlIHRyZWUgdG8gdGhlIFNvQyBwb3J0
cyBhbmQgcGlucwo+IGFuZCBsYWJlbHMgYXZhaWxhYmxlIG9uIHRoZSBib2FyZC4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNv
bT4KPiAtLS0KPiBIZWxsbywKPiAKPiBteSAoaW1wbGljaXQpIHYxIHdhcyByZXZpZXdlZCBieSBz
YXNoaWtvLCBzZWUKPiBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0Y2hzZXQvMjAyNjA0MTYxMTAy
MTguNTk0OTExLTItdS5rbGVpbmUta29lbmlnJTQwYmF5bGlicmUuY29tCj4gCj4gVGhlIGZpbmRp
bmdzIHdlcmUgZ29vZCwgdGhpcyB2MiBhZGRyZXNzZXMgdGhlc2UuCj4gCj4gQmVzdCByZWdhcmRz
Cj4gVXdlCj4gCj4gICBhcmNoL2FybS9ib290L2R0cy9zdC9zdG0zMm1wMTM1Zi1kay5kdHMgfCAy
OCArKysrKysrKysrKysrKysrKysrKystLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0
aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCkFwcGxpZWQgb24gc3RtMzItbmV4dC4KCnJlZ2FyZHMK
QWxleAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVw
bHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXN0bTMyCg==
