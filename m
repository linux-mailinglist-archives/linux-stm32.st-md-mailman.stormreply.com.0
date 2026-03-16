Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBycM0nWt2kwWAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 11:07:05 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BED297A99
	for <lists+linux-stm32@lfdr.de>; Mon, 16 Mar 2026 11:07:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF1ABC87ED8;
	Mon, 16 Mar 2026 10:07:04 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 864F6C3F945
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 16 Mar 2026 10:07:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpj20NCFkAADf0yLfRziyJRyo8D1+5Ct2Uc8+dXMIuHdGQ3DoKC2UwDJLm9ShuvytR8vFV1fwAz1ZC2j4b0wOO+YSZ2pqfVPTNFUv0DeAZTzEJ4eBT3cntdgSjinOuJFUt7jha+sSbw6tIfvW6wuS29q+bRgP7UM8bPVpAeW/hvH8ixS9c9LdV88weo4UAkcpJOaIxgNhskwhuA6Re3z4rB8IJbsHiLYB7VOn8J9ZOxunxWfCRGLNdmzylNd5M2qqFdZuR/mWgmm3ql+I+62Qygtb1YIJXcAzaimZIWX+eK9TmRhShOKw+4a/QgGQRf3747DNsmjlvC6YUyxlaU5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4ELkv4EPn6qeJLdHjZSFn+VoUyxgOIoclCGAnRiDHg=;
 b=M3FetOg/jY2RhMiLFSTVQm3L+gTO73pzZiUp1TaZiIfOpDNTTT0DSDD6umez4NE0cuTMOIYiOaiSf6lfAAsUtGnrrxq89gyHzGKo5DcgUiX2Lwy7E6dmLy6onFjNpzqgDYOo+A27DyVgJxZrkCgP7un4yPSRgovo0i5DDwjgTfi9FZThAXM3cPeQCOGOmlX6L5p+5fR6L2lVnBj+zP4cB8thnVVIMtatkc0xmKTGx7ylYuwJ20Cc3Py01KusqyviEsefJ1LvKzHqlDLHH8Xl+3+Q07LyX4sFgTiR18AYWVs4oaFmtKjuZaULlKGR0KfFEJG3giIjp2PV3svQ9gp0DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4ELkv4EPn6qeJLdHjZSFn+VoUyxgOIoclCGAnRiDHg=;
 b=LBd+wzDCAjxHcsQGXI7z2LCTc8zAvI+FETMazhfIS7ujuqKzaQb0VA9eiBKDV7fFXvhrdodLiki2ISTmhm8GSESi940/NJhXJYFL7BCoYg5KVQ1KszV0ySee4E5nIG6leqC+6rbADYThLAOnB4IhQwJQMfpBRzBf6Mck+Z/nqasVmNRrQCpGEz+eJH7d7xHeI/vFXtV9vIUsJZdyX7dxkkoJOrXEuDkMRn16L0/4kh/PQVrD8eXgGMhvsBmRjN/29whmMkzT1TSJoHXMU0pYTArvAvtEWj7bE0qCeeR9jDWLW4qAJ3nq9H/cBLDWlWLZ7NaaObIACb/FKsdnllBUyQ==
Received: from AM6P193CA0137.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::42)
 by DU0PR10MB7998.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3b2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 10:07:01 +0000
Received: from AM3PEPF0000A798.eurprd04.prod.outlook.com
 (2603:10a6:209:85:cafe::f4) by AM6P193CA0137.outlook.office365.com
 (2603:10a6:209:85::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.22 via Frontend Transport; Mon,
 16 Mar 2026 10:07:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A798.mail.protection.outlook.com (10.167.16.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 10:07:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 16 Mar
 2026 11:09:17 +0100
Received: from [10.48.87.194] (10.48.87.194) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 16 Mar
 2026 11:06:59 +0100
Message-ID: <45710ac8-94f3-4272-a672-6c5accd7003b@foss.st.com>
Date: Mon, 16 Mar 2026 11:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, Linus Walleij
 <linusw@kernel.org>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
 <20260313105718.359614-2-christophe.roullier@foss.st.com>
 <abPwHh12MLwMwOIs@shell.armlinux.org.uk>
 <CAD++jLmBP5Puwf1ZuFOzF6U0XowoF1nfqEL3gwLy-svXsXrbJA@mail.gmail.com>
 <abStv0IPLfkKMD-W@shell.armlinux.org.uk>
 <abfHUrOpHnjv3GGW@shell.armlinux.org.uk>
Content-Language: fr
From: Christophe ROULLIER <christophe.roullier@foss.st.com>
In-Reply-To: <abfHUrOpHnjv3GGW@shell.armlinux.org.uk>
X-Originating-IP: [10.48.87.194]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A798:EE_|DU0PR10MB7998:EE_
X-MS-Office365-Filtering-Correlation-Id: eea36ce5-2632-45b7-aa6d-08de8343c3fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|7416014|376014|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: W6eJAlGvcqs1saBdvqsRJ7HgpSOr5QaXw/rnp2m/c1lfH2BNvPIxTUjqRPt9zSB62LFqiq4cRoIuzMR3ISOMW49ri+XgyAxlQ+p56JEFYgGdbhbWFP4vPzJ8ygwLi+Wai8qTptMUbiD6i/VHeJzgSEAYSaqq+mpMRvj4NvZy2ksK2I6OJxul1ygknSVhg/TBvt4eortIvuDAVG9WOUNvwK6tegsH99Ov/pM4EQKIb/LJgVjXfgB39+72cs/mSpDuWB+O+JuwJTpdyom6ZM8mFqql4pr8GTsfp2t5qLDXR4zCbrP6EuEaNanEJhgFoVV2pX+bFOa+q3HreFA6fPX3nhxIz1hgpr4htHNhDKgtiSuZy2h8q36DNUEuqoe0+BvdotmvB0wIi1vqoC1+jsFuZTc/dUNtXCbvsxAvjyuCzay7JlDVjynNPYbdj8E6M81mqKqwjBWSgmmy3S++sGs7qwQ/M69ZzA32cesDArcILbA9HzBn3GjOmFLfacs1MydGnGfCi1sZZDeJKgiCpNHK+rN6wSRYIBtcDlfa+Vqt6vb2iWQK1jLqstbW1IYoqz+SX18ynE8wVqIUOf4OAPEGYnufrLia3/W6SOIkvKY+nnQK4PemFRSQA8Gy7xwiGOs/f0dXLsdsvC3ZQeAPHKejTK6/756YeDm4nuBV/DdMZ71IiLE0jP1Hftovjz1I2L4rv63vLlYCuf1LE3aaLHP4+I8tQI5KO+NTEfq8DOVluYfU39+2Kubq3xbJnoJjvUj2Dg2oZBf0TR1ZiOcKaeEf0Q==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(376014)(7053199007)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: i2N+T3+bPVHAwU/8WeNMzxFcsMkfjRaptbAuPPqlQVo+GOfHT1XHoSZlsPwDXFtbXTCBpJe1Y0JOnuZNHFj3iTV58MZg3xp+egOhpoCOuxrV4aZnRrPjRQBT9rmMiq8Wablg0oaDoZvwNTbOsi8/mP+Nl40w8hHgHbc8MHkDTdcIUdo1hZ+Z7sYL7L2I1Ae46BRvTZ6vyE4p9hs6FqRVoFdbvgazkV2I1zWWkg/WzURW0e0vJ5lO7PcKg9c4kAPyFp6MPAjDs2hW4l/OlN8LmmuIZl20mwzVUykejhYgtr1vwvUA8zMbFu6xzhPM/XvOH3N7UnQP+lSGfW0JK+nivdneNGTxCn47cSJlWwVIGOWPpC8rzV/fSySLeNfBaOJ0PPBcxr1YF79R+GWRBIrdn+a54OC0KRaSAO37I14PuWKXgbGCl0K0Pd1VPyoKTFLB
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 10:07:00.6730 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eea36ce5-2632-45b7-aa6d-08de8343c3fe
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A798.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7998
Cc: linux-kernel@vger.kernel.org, Vladimir Oltean <vladimir.oltean@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/2] net: stmmac: fix pinctrl
 management during suspend/resume
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:linusw@kernel.org,m:linux-kernel@vger.kernel.org,m:vladimir.oltean@nxp.com,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[foss.st.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,nxp.com,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,kernel.org,redhat.com,davemloft.net,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.699];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 51BED297A99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgUnVzc2VsbCwgTGludXMsIEFsbCwKCkxlIDE2LzAzLzIwMjYgw6AgMTA6MDMsIFJ1c3NlbGwg
S2luZyAoT3JhY2xlKSBhIMOpY3JpdMKgOgo+IE9uIFNhdCwgTWFyIDE0LCAyMDI2IGF0IDEyOjM3
OjE5QU0gKzAwMDAsIFJ1c3NlbGwgS2luZyAoT3JhY2xlKSB3cm90ZToKPj4gT24gU2F0LCBNYXIg
MTQsIDIwMjYgYXQgMTI6NDQ6NTZBTSArMDEwMCwgTGludXMgV2FsbGVpaiB3cm90ZToKPj4+IE9u
IEZyaSwgTWFyIDEzLCAyMDI2IGF0IDEyOjA44oCvUE0gUnVzc2VsbCBLaW5nIChPcmFjbGUpCj4+
PiA8bGludXhAYXJtbGludXgub3JnLnVrPiB3cm90ZToKPj4+PiBPbiBGcmksIE1hciAxMywgMjAy
NiBhdCAxMTo1NzoxNkFNICswMTAwLCBDaHJpc3RvcGhlIFJvdWxsaWVyIHdyb3RlOgo+Pj4+PiBJ
biB0aGUgZGVlcGVzdCBsb3ctcG93ZXIgbW9kZXMsIHRoZSBwaW5jdHJsIGNvbmZpZ3VyYXRpb24g
aXMgbG9zdAo+Pj4+PiBhbmQgaXMgbmV2ZXIgcmVzdG9yZWQgaWYgdGhlIGludGVyZmFjZSBpcyBk
b3duLgo+Pj4+PiBUaGlzIGNvbW1pdCBlbnN1cmVzIHRoYXQgdGhlIHBpbmN0cmwgc3RhdGUgaXMg
c2V0IGluIGFsbCBjYXNlcy4KPj4+PiBTaG91bGRuJ3QgdGhlIHBpbiBzdGF0ZSBiZSByZXN0b3Jl
ZCBieSB0aGUgcGluY3RybCBsYXllcj8KPj4+IFdoYXQgd2UgaGF2ZSBpbiB0aGUgZGV2aWNlIGNv
cmUgb25seSBhcHBsaWVzICJpbml0IiBhbmQgImRlZmF1bHQiCj4+PiBzdGF0ZXMsIGFuZCBwcm92
aWRlcyB0aGVzZSBoYW5kbGVzIGZvciB0cmFuc2l0aW9uaW5nIHRvICJzbGVlcCIKPj4+IGFuZCAi
ZGVmYXVsdCIgYWdhaW4gKGxpa2UgYSBzdGF0ZSBtYWNoaW5lKS4KPj4gV2hhdCBJIHdhcyBtZWFu
aW5nIGlzIHRoYXQgLSBmb3IgYSBkcml2ZXIgdXNpbmcgdGhlICJkZWZhdWx0IiBzdGF0ZSwKPj4g
aWYgdGhlIGhhcmR3YXJlIGxvc2VzIHRoZSBwaW5jdHJsIHN0YXRlIGR1cmluZyBzbGVlcCwgaXNu
J3QgaXQgdGhlCj4+IHJlc3BvbnNpYmlsaXR5IG9mIHRoZSBwaW5jdHJsIGRyaXZlciB0byByZXN0
b3JlIHRoZSBzdGF0ZSByYXRoZXIKPj4gdGhhbiBsZWF2aW5nIGl0IGluIHdoYXRldmVyIHN0YXRl
cyBpdCBoYXBwZW5zIHRvIGJlIHdoZW4gdGhlIFNvQwo+PiBjb21lcyBiYWNrIGZyb20gc3VzcGVu
ZD8KPj4KPj4gSWYgdGhhdCBpcyBub3QgdGhlIGNhc2UsIHRoZW4gZG9uJ3Qgd2UgaGF2ZSBhIG1h
am9yIGlzc3VlIHdoZXJlCj4+IGRyaXZlcnMgdXNpbmcgcGluY3RybCBidXQgZG8gbm90IGlzc3Vl
IGFueSBwaW5jdHJsIGNhbGxzIGluIHRoZQo+PiByZXN1bWUgZnVuY3Rpb24gYXJlIGJ1Z2d5Pwo+
IEkgd291bGQgbGlrZSBhbiBhbnN3ZXIgb24gdGhpcyBiZWZvcmUgdGhpcyBwYXRjaCBpcyBtZXJn
ZWQsIGJlY2F1c2UKPiBldmVuIHdpdGggeW91ciByZXZpZXdlZC1ieSwgSSBkb24ndCB0aGluayB0
aGlzIHBhdGNoIGlzIGNvcnJlY3QuCj4KPiBGb3IgZXhhbXBsZSwgaWYgcGluY3RybCBsb3NlcyB0
aGUgcGlubXV4IHN0YXRlIGFjcm9zcyBzdXNwZW5kL3Jlc3VtZSwKPiB0aGVuIHRoaXMgcGF0Y2gg
b25seSBzb2x2ZXMgdGhlIGNhc2Ugd2hlcmUgdGhlIE5JQyBpcyBkb3duIHdoZW4KPiBzdXNwZW5k
aW5nLgo+Cj4gSXQgZG9lcyBub3QgYWRkcmVzcyB0aGUgY2FzZSB3aGVyZSB0aGUgTklDIGlzIHVw
IGJ1dCBXb0wgaXMgZGlzYWJsZWQuCj4gQWxzbywgd2hhdCBoYXBwZW5zIHdoZW4gV29MIGlzIGVu
YWJsZWQgYXQgdGhlIE1BQywgd2hlbiB3ZSBleHBlY3QgdGhlCj4gTklDIHRvIHN0aWxsIGJlIGZ1
bmN0aW9uYWwgLSB3aGljaCBtZWFucyB0aGF0IHRoZSBwaW5tdXggc3RhdGUgbXVzdAo+IHJlbWFp
biBhY3RpdmUgb3ZlciBzdXNwZW5kLgoKRm9yIG1lIHRoaXMgY2FzZSAod2hlbiBOSUMgaXMgdXAp
IGlzIGFscmVhZHkgbWFuYWdlZCBieSB0aGUgZHJpdmVyIGFuZCAKZnVuY3Rpb24gc3VzcGVuZC9y
ZXN1bWU6CgpPbiBzdG1tYWNfc3VzcGVuZCA6Cgo9PT7CoCDCoCDCoCAvKiBFbmFibGUgUG93ZXIg
ZG93biBtb2RlIGJ5IHByb2dyYW1taW5nIHRoZSBQTVQgcmVncyAqLwogwqAgwqAgwqBpZiAocHJp
di0+d29sb3B0cykgewogwqAgwqAgwqAgwqAgwqBzdG1tYWNfcG10KHByaXYsIHByaXYtPmh3LCBw
cml2LT53b2xvcHRzKTsKIMKgIMKgIMKgIMKgIMKgcHJpdi0+aXJxX3dha2UgPSAxOwogwqAgwqAg
wqB9IGVsc2UgewogwqAgwqAgwqAgwqAgwqBzdG1tYWNfbWFjX3NldChwcml2LCBwcml2LT5pb2Fk
ZHIsIGZhbHNlKTsKKsKgIMKgIMKgIMKgIMKgcGluY3RybF9wbV9zZWxlY3Rfc2xlZXBfc3RhdGUo
cHJpdi0+ZGV2aWNlKTsqCiDCoCDCoCDCoH0KCk9uIHN0bW1hY19yZXN1bWUgOgoKPT0+wqAgwqAg
wqBpZiAocHJpdi0+d29sb3B0cykgewogwqAgwqAgwqAgwqAgwqBtdXRleF9sb2NrKCZwcml2LT5s
b2NrKTsKIMKgIMKgIMKgIMKgIMKgc3RtbWFjX3BtdChwcml2LCBwcml2LT5odywgMCk7CiDCoCDC
oCDCoCDCoCDCoG11dGV4X3VubG9jaygmcHJpdi0+bG9jayk7CiDCoCDCoCDCoCDCoCDCoHByaXYt
PmlycV93YWtlID0gMDsKIMKgIMKgIMKgfSBlbHNlIHsKKsKgIMKgIMKgIMKgIMKgcGluY3RybF9w
bV9zZWxlY3RfZGVmYXVsdF9zdGF0ZShwcml2LT5kZXZpY2UpOyoKIMKgIMKgIMKgIMKgIMKgLyog
cmVzZXQgdGhlIHBoeSBzbyB0aGF0IGl0J3MgcmVhZHkgKi8KIMKgIMKgIMKgIMKgIMKgaWYgKHBy
aXYtPm1paSkKIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RtbWFjX21kaW9fcmVzZXQocHJpdi0+bWlp
KTsKIMKgIMKgIMKgfQoKQlIKCkNocmlzdG9waGUuCgo+Cj4gVGhpcyBpcyBpbiBhZGRpdGlvbiB0
byBhIG1vcmUgZ2VuZXJhbCBjb25jZXJuIHRoYXQgYWxtb3N0IGV2ZXJ5IGRyaXZlcgo+IGluIHRo
ZSBrZXJuZWwgaXMgbGlrZWx5IGJyb2tlbiBpZiB3ZSBuZWVkIHRvIHN3aXRjaCBwaW5tdXggbW9k
ZXMgb24KPiByZXN1bWUgdG8gZW5zdXJlIHRoYXQgdGhlICJkZWZhdWx0IiBwaW5tdXggc3RhdGUg
aXMgcmVzdG9yZWQgdXBvbgo+IHJlc3VtZSwgd2hpY2ggc2VlbXMgdG8gYmUgd2hhdCB5b3UncmUg
c2F5aW5nIGJ5IGdpdmluZyBhIHItYiBmb3IgdGhpcwo+IHBhdGNoLgo+Cl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
