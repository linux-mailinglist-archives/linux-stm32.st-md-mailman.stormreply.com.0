Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KB8KNrep3GkEUgkAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 10:30:47 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6499A3E9226
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Apr 2026 10:30:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C6F29C36B3C;
	Mon, 13 Apr 2026 08:30:46 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22A24C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Apr 2026 08:30:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g1omWcCQ5cD+oK2WH8AZg47tdkCd41wwBu+0nU8dxL7haznLwiK9fip4XF0M5AyosnzvQiECfGOzDbiF+kyOXjRWBk3UIBmRd5o0d4K+kQvy0QsOCXQYW2euAsEqIsQJd1iGkOKlLrQLxPlJZC5LeQ6BFlliTN3C01g57mtulH6/oi6S5Flse2Y9JBGoTLfOUDIZ/jQBfJ1PG1gK3QbqtBLyaFCCNoaOL6dbp7B6/XmkluE92N7+qGn40/5szMSoaJVj+iapZzzm4UdnpWFdnDE+sl8juT5GzYlLo5nIlSQJxlk4UHq8Zj7/U3odB2XNhP6e+3y6KMJ9mMvDwkUx4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRsIjzFRAdgdUITkijWJXayB+2gBt8shsNYSADIVJ1s=;
 b=sVfTHEl/1dYb3q7/iaytB+2qFwF0g5kx9Xjy7RpoWDKCaO8boJf7ocOxCw2zplAhw0Aa1RaROm5L6v0k/jeaCbxc3JQfDvz64IemU8R4rb+hArqC5MnLS7pBH4CkBDQ0oLIZUo046u1mGcct/DmbMV6Ks7b8Pnfi6YAdC9CBbebCv/xgdK9Ow1M62vRJLIChRf9Pw19c+UFVF9Jy8OeC8B1p1wrX18fuAGfAByf/EhT68MnnJdgRkoDy82/nhFGXKUFmrIGiyqFNqewck7bxazweMflY2Z7fVaKvJeFFFb94XQxuxtVle9Jf10vG+fjQhqde1pWP+kE+5RJRgduc3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRsIjzFRAdgdUITkijWJXayB+2gBt8shsNYSADIVJ1s=;
 b=gR1BfzDaIcahwVJotLoFfu0hg1rhpMEILtaR+tzwjw0mx4xgp4A6UNbyGZitLnyBGR8MFZKujrwhl76PkKfuJPGjSIVOWQnnt6nRLN74z79yNxQUXD+U6rdDI+LYNU+ginrMGkMUxu0OF8Kv3LjfcxK9u8hh3L7fJU0L7MjnCXi7SMIjGDQhJaG3RfjZ8nkjtDyI8mgm0PvvUdXpcJlNUf8v6d52enAfc0gZ0S1zHSOklm9CnVtbs35xA7vKcYQQzZrKtnW+E3Q88yK5Gu+08nXKh9QrCFRPwRGAOnMb/YlLWLxccpZZW0b1Lu6iqlrCaE+LqTDGnPXElELD5TQ4+A==
Received: from CWLP265CA0305.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::29)
 by AM0PR10MB3506.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:145::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 08:30:41 +0000
Received: from AMS0EPF00000194.eurprd05.prod.outlook.com
 (2603:10a6:401:5d:cafe::5f) by CWLP265CA0305.outlook.office365.com
 (2603:10a6:401:5d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 08:30:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF00000194.mail.protection.outlook.com (10.167.16.214) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 13 Apr 2026 08:30:41 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 13 Apr
 2026 10:33:48 +0200
Received: from [10.252.11.107] (10.252.11.107) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 13 Apr
 2026 10:30:39 +0200
Message-ID: <c8cef596-642c-4707-af83-357ba70de02a@foss.st.com>
Date: Mon, 13 Apr 2026 10:30:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marek Vasut <marex@nabladev.com>, <dri-devel@lists.freedesktop.org>
References: <20260409024928.344010-1-marex@nabladev.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20260409024928.344010-1-marex@nabladev.com>
X-Originating-IP: [10.252.11.107]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000194:EE_|AM0PR10MB3506:EE_
X-MS-Office365-Filtering-Correlation-Id: ef38b35c-e485-4b2f-5d87-08de9936f2b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700016|82310400026|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: +6xq2LVpF0jTI8dY6p1PZATkKQ7j6Jy49CiACQkouBz6VNtACWTkArIiJkkXeElCchZqDy9yTwXLuQni3tDU13IGmVR3SB4Z/UgEzzXZCuReAnsaqJeyvWT/ie2BZzrfDdMm6gO6SRdpbrmkKA3wzjf59Cz36iovjp53TONNHgR1wPoIk7n0wp0EMqNzxcdJjDkEPSqqq+QPHsCX771DduA7hRFkX2AgcAHHJTbpp9S2FXIaHzJbXA+E4Hs7jx5DPAc3pjBOry7iHe58w+h6HNaFjAhvYFafaWNshxpQIe2u8rfxfrUKLcOvYs5CWfAvEegkku2Typam9vGR92xFivpcRRux3nXrlAXcwhGe4R04LFzHaF95WY8/H2N3vylyqdFqG3LEHTmUTbSwuqEmwc9m9EPoKvo08n/vvcR7ApdwuRW2yWiQS19oYnPSb738thg7Ep110H7lsqEx5r7GuOdfC+CtHeBwLtDLaOozrjfWwM4pPTjuyKTESPj4FG9UnSqHU6T7f9ffiM6bXlMS0y7wkdrFpbZb4vyA6pZhyqJm8J+ObDyFDfAXWRfYpYi/8zLL6r9W06aEuX4jYoYIdV583gxJi5y7mUKCVUoDPZOfZBU9zRNQSdg3FwXSt00TXnZBjJZvc+UNFVxAa4rKTUFRie7hLYRKSlElApDQfzYr2e6rlgElgaGNtbsmS+HhLmRQ0AOBzRfYR1aG1VSZ9iADI+zQwtxYGfmfZFuFfvmHT+kGYJYA9r/mToS4fvHc20oKoYpM47rCZttHPQvGRg==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zAQW0ALHEVUOtflQOhMztauFhmVOT6tybvKEKiUipDO4TGxgouD3v7Sx180Ep9UVHZxpS+08grugm0ZpUSL9i3kXfTIIdvnaljyhRjmo39gdh30xN6yVfQRsXpjp2Du6XIx5Lh6Z2Cl0+vxuAdVH6AUGubnRi1Q1EEVTibyf3gUu6PaFQ5yRoQ9E49z3UItVphyLbJEyDDIX2aQgXL+Rf1DYJ3NKr3Aq0PyRduz/THiAM7kMCPyNu/o9c9T0ReGEgIKuquN3Vgb/AhERKnZzoQeL+HqRdKz0AJIqgiL3sWR8ZIXMQCZCAPRAGFNvSr9XpQiu7mgahE+oiMxSyJoTjANqsIrg/smhzjB1uJb2ezA71wMy100Os+RQHSifqCXhuQl0YH/L9S/9fwtzs8PQWEjz4Xn7U34RND79yyrepsYcbl62BFIzf1Rsc9ro+W+8
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 08:30:41.1513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef38b35c-e485-4b2f-5d87-08de9936f2b4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000194.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3506
Cc: Simona
 Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Yannick
 Fertre <yannick.fertre@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] drm/bridge: stm_lvds: Do not fail
 atomic_check on disabled connector
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marex@nabladev.com,m:dri-devel@lists.freedesktop.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:yannick.fertre@foss.st.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:airlied@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[ffwll.ch,suse.de,foss.st.com,linux.intel.com,kernel.org,vger.kernel.org,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[foss.st.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.781];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6499A3E9226
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpPbiA0LzkvMjYgMDQ6NDgsIE1hcmVrIFZhc3V0IHdyb3RlOgo+IElmIHRoZSBjb25uZWN0b3Ig
aXMgZGlzYWJsZWQsIHRoZSBuZXcgY29ubmVjdG9yIHN0YXRlIGhhcyAuY3J0YyBmaWVsZAo+IHNl
dCB0byBOVUxMIGFuZCB0aGVyZSBpcyBub3RoaW5nIG1vcmUgdG8gdmFsaWRhdGUgYWZ0ZXIgdGhh
dCBwb2ludC4KPiBUaGUgLmNydGMgZmllbGQgYmVpbmcgTlVMTCBpcyBub3QgYW4gZXJyb3IuIFRl
c3QgZm9yIC5jcnRjIGJlaW5nIE5VTEwsCj4gYW5kIGlmIGl0IGlzIE5VTEwsIGV4aXQgZWFybHkg
d2l0aCByZXR1cm4gMC4KPgo+IFRoaXMgZml4ZXMgYSBmYWlsdXJlIGluIHN1c3BlbmQvcmVzdW1l
IHBhdGgsIHdoZXJlIHRoZSBjb25uZWN0b3IgaXMKPiBhbHJlYWR5IGRpc2FibGVkLCBidXQgLmF0
b21pY19jaGVjayBpcyBjYWxsZWQsIGZhaWxzLCByZXR1cm5zIC1FSU5WQUwKPiBhbmQgYmxvY2tz
IHRoZSBzdXNwZW5kIGVudHJ5Lgo+Cj4gRml4ZXM6IGFjYTFjYmMxYzk4NiAoImRybS9zdG06IGx2
ZHM6IGFkZCBuZXcgU1RNMzIgTFZEUyBEaXNwbGF5IEludGVyZmFjZSBUcmFuc21pdHRlciBkcml2
ZXIiKQo+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBuYWJsYWRldi5jb20+Cj4g
LS0tCkhpIE1hcmVrLMKgCgpBY2tlZC1ieTogUmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJhcGhhZWwu
Z2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+CgpUaGFua3MsCkJlc3QgcmVnYXJkcyzCoApSYXBoYcOr
bAo+IENjOiBBbGV4YW5kcmUgVG9yZ3VlIDxhbGV4YW5kcmUudG9yZ3VlQGZvc3Muc3QuY29tPgo+
IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPgo+IENjOiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBNYXhpbWUgQ29x
dWVsaW4gPG1jb3F1ZWxpbi5zdG0zMkBnbWFpbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1y
aXBhcmRAa2VybmVsLm9yZz4KPiBDYzogUGhpbGlwcGUgQ29ybnUgPHBoaWxpcHBlLmNvcm51QGZv
c3Muc3QuY29tPgo+IENjOiBSYXBoYWVsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdhbGxhaXMtcG91
QGZvc3Muc3QuY29tPgo+IENjOiBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+Cj4gQ2M6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgo+IENjOiBZYW5uaWNrIEZl
cnRyZSA8eWFubmljay5mZXJ0cmVAZm9zcy5zdC5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtc3RtMzJAc3Qt
bWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vc3RtL2x2
ZHMuYyB8IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdmRzLmMgYi9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x2ZHMuYwo+IGluZGV4IGZlMzhjMDk4NGIyYjUuLjI1ZTJiYTk4
ZjM2YWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N0bS9sdmRzLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vc3RtL2x2ZHMuYwo+IEBAIC04OTcsMTQgKzg5NywxNCBAQCBzdGF0aWMg
aW50IGx2ZHNfY29ubmVjdG9yX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yLAo+ICAJaWYgKCFjb25uX3N0YXRlKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAKPiAr
CWlmICghY29ubl9zdGF0ZS0+Y3J0YykKPiArCQlyZXR1cm4gMDsKPiArCj4gIAlpZiAobGlzdF9l
bXB0eSgmY29ubmVjdG9yLT5tb2RlcykpIHsKPiAgCQlkcm1fZGJnKGNvbm5lY3Rvci0+ZGV2LCAi
Y29ubmVjdG9yOiBlbXB0eSBtb2RlcyBsaXN0XG4iKTsKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAg
CX0KPiAgCj4gLQlpZiAoIWNvbm5fc3RhdGUtPmNydGMpCj4gLQkJcmV0dXJuIC1FSU5WQUw7Cj4g
LQo+ICAJcGFuZWxfbW9kZSA9IGxpc3RfZmlyc3RfZW50cnkoJmNvbm5lY3Rvci0+bW9kZXMsCj4g
IAkJCQkgICAgICBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSwgaGVhZCk7Cj4gIAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGlu
ZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9z
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
