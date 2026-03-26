Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHRvDQ33xGmC5QQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 10:06:21 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C54E331E9D
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Mar 2026 10:06:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8840DC8F278;
	Thu, 26 Mar 2026 09:06:19 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012008.outbound.protection.outlook.com [52.101.66.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E354FC87EC6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Mar 2026 09:06:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vUYAf40+G6rHV9vW4LxusWZX9NLaEkz8szGgCPb026h8pA+Pu9FyfnDQknVq0hZMjNv6szAsf1VgW4ERxSOTAFPwpuZNuXqOL/8pMhm2hqOuaGbth5DFmEbeIJWAdxhX2r3djAyruL6hAuuQlWBqlSSEfSPJ3DbPHwF7T2Q0FwJAGwIiXBZet3iiVgMqjYFsPgPHE3cx4/LMIR+zJw0+eaZllSoDOBdDsqrb0PSL8NjAKbQyBoFrtYRC73U7FypxQF/DBNLvPldoN6o/jfUr1WBG2Jr/V1CPXtlc0/FLv7SWzff3SulpH0vfOdX0bE3x/twcmEyaLxNSb0aLKOuNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goJY3W2COt2O5Fk3XW0jKUudrTc+wUYmk/YTYbbmyDA=;
 b=aadSTpZhbFFcMRM0aYO+dRXpXdzorXJLOlphOZw8zcRlgrW8LYlD/i7I7xjKQnHzlcd2hJ0tZRInFp5cJHwEyrQh/fZfzzUmkK0TAghR3aHM1SEB6SCy8erE2V+NVwCjr8gpt5FmCbvUNC/xiL5rEUrndXxtXjDp+dhZpS5RIIrKvRQ6ygdVvj8jJjDIU+J/Np+ai48QE/Su60ofrWfQUDT5tvEamv+4GsacueKPH4MXGSxWpOrW3mgFl4UWKhRDiPDOREKR1q1lWjFX53fxwoIHk4ZsIbnQOicvGPWmzXzbTeyc4Dn7qbP8ttxM/IdSaO38yPegEw1P8xeoOH2sYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goJY3W2COt2O5Fk3XW0jKUudrTc+wUYmk/YTYbbmyDA=;
 b=PUHgDJhVHpGJUZdBTLW3kX5RXBlzS8PSj471vfhpNqv3kxuFoq9Bgm7TucUEL4RIjyqrDX/lWoyrU1mH4AzUQKw3VdsJ951X4TsyMd4b/xlns1u1ubaPSnq5Zg9BWVHc8uNZwFOaceWrNONh2T2czWdYzdFqbn38PwD8se0tXbxuMLDlkZ43fbZpuwQRfQDLsWXlcDYRgZeryil9hdWhEFLCr6gWA4SmKFLA0SqXFgkyS4InzpD2LaTgkiuWmuHv9lAP7tilqh2Hmqhk4MpDIezlWUKVVEPC2E7gIP5Zsd8Z+Aqwy2qWktwMmWCOVvIsDj18yNi6/1EJhz0Ejv0ibQ==
Received: from DUZPR01CA0312.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::8) by DB5PR10MB7667.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:489::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 26 Mar
 2026 09:06:12 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::23) by DUZPR01CA0312.outlook.office365.com
 (2603:10a6:10:4ba::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Thu,
 26 Mar 2026 09:06:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 09:06:12 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 10:07:02 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Mar
 2026 10:04:09 +0100
Message-ID: <c1de351b-6272-4903-8231-d92e5190a60c@foss.st.com>
Date: Thu, 26 Mar 2026 10:04:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 <soc@kernel.org>, <arm@kernel.org>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61D:EE_|DB5PR10MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: aeaf6a04-28d7-417a-1bdc-08de8b16ed90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: VZve60M65Horwm/3cGiC2XO6/7zf75RKvumj+6nTa+Zv/+H1DCNEsD+5XH04QrxTUBo/REEDqf2lgScygX9L0Y7b9U7q1KP7ne0M5jevWId49Iexf/TeMzQC3UmTX4s8Zm9/sF1qkfojs/KMaR/No7Wm3m6h1z1dRhfOVVo9Aymwo5M4vqLSEaCUP1U7wXbt0zFS/ezCkd0pLSILyajtC6VZaQmd8qOJPeMADRCgu6/ZRjBemAtecvFlCxSxbVfcALdh2UXxRNHDSDGU3sduim762r6SsENiz3FpFHom2GbTnhph+m3yLl1D66Az6xO5ix83WdYL8188F1pUwzpbyjp/5QS3PgsV5FR0HbHQLUG00F8ER13fI/A4bvtO+udhGigqYJCwDTRcAcuk/FgRAFInhNiYk+c0RD85mTs2hToJrwhvoC6SWKI0jsfVDg3rXP1aiUGTLoK7/ffsTvbG1w5fvJ6Tixs+l28X3xUI0SEsfKg99nHp7OJ/3Boj+9+UBM3Lvs4RxApOZnGuUNlEvgnP6f6V2b+LH/ZQXZaiIAdmrJqNrjSHeh7f6DKVt4BYJoHRTM8cpLoySv2p++INWh42U16T+mTNHs3bLk2DPVu4WCpWMUSca9RN+sD50LRam4ZWpVFS8nr2C1pX81N3epz1xx3zt0w/DPS8y2BuRi5rMlow7tauDUryUVJbopkZ80hn81RXNxVA2MNactXIYnP4latM6Rdx70YPWK8QAE+xINjrPepIHUDYeGc3YMiKOPMl4VSeSwCzUqfBzj8CQQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 02OiUvNEpvIu9R2mhdhI7juRMcy54ZHuUKdLJC5tQCWOUwzU8iwnOlQNhXhcM8xrROJv9oRr8BmC/uVN55XFJQIWA1KrZrvJC8CiUHgi9z4uw1No5tYFCoSJhnqVxBPp9e6WhDfVHiF67+qiwb1WOSo7Ak25C0KWV8zggQWFe0h/RbOyiYpaYSYLSi8KJMS0+InTeBvqkqU3snrmFvbxfxYkj/elMn2OZWRHzB7V5UYkSZlI1AjQ/5IOSWEKJoozmcw8pTp/TbvmWP9C0bsX/3gbtOXc6+mnZaEHb1S9fcF3z4yCHkdES7RDxp9VGgByW44zreKuC8KOzPf3N0FpZ1HcHqDtzJDMxhzicwG+aVQG8u9rV6Gc5l8BnMC9XdO+AOXbZKdgJt/5HdJgx+Il36XbS1q1Pb1H0aTA4+QMjTafdjZ+craZqCBrBEFLzxmO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 09:06:12.3194 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeaf6a04-28d7-417a-1bdc-08de8b16ed90
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7667
Cc: "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: [Linux-stm32] [GIT PULL] STM32 Bus firewall for v7.1
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
X-Spamd-Result: default: False [2.99 / 15.00];
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
	FORGED_RECIPIENTS(0.00)[m:arnd@arndb.de,m:khilman@baylibre.com,m:soc@kernel.org,m:arm@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.981];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2C54E331E9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQXJuZCwKClBsZWFzZSBjb25zaWRlciB0aGUgZmlyc3Qgcm91bmQgb2YgU1RNMzIgZmlyZXdh
bGwgYnVzIHBhdGNoLXNldC4gRFQgcGFydCAKZm9yIFNUTTMyIE1QVSBTb0Mgd2lsbCBjb21lIHdp
dGggdGhlIFNUTTMyIERUIHB1bGwgcmVxdWVzdC4KClJlZ2FyZHMKQWxleAoKClRoZSBmb2xsb3dp
bmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNmRlMjNmODFhNWUwOGJlOGZiZjVlOGQ3ZTlmZWJjNzJh
NWI1ZjI3ZjoKCiAgIExpbnV4IDcuMC1yYzEgKDIwMjYtMDItMjIgMTM6MTg6NTkgLTA4MDApCgph
cmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgIGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9hdG9yZ3VlL3N0bTMyLmdpdCAKdGFncy9z
dG0zMi1idXMtZmlyZXdhbGwtZm9yLTcuMS0xCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gMzQ4NzQxYTk3YzI4ZDc2NzlmYjFlMjA0YWVlYzBkNjMwNWZjNjgxNzoKCiAgIHBpbmN0cmw6
IHN0bTMyOiBhZGQgZmlyZXdhbGwgY2hlY2tzIGJlZm9yZSBwcm9iaW5nIHRoZSBIRFAgZHJpdmVy
IAooMjAyNi0wMy0yNSAxNzo0MDoyMiArMDEwMCkKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KU1RNMzIgRmlyZXdhbGwgYnVz
IGZvciB2Ny4xLCByb3VuZCAxCgpIaWdobGlnaHRzOgotLS0tLS0tLS0tClN0bTMyIFNvQ3MgZW1i
ZWQgZGVidWcgcGVyaXBoZXJhbHMgc3VjaCBhcyBDb3Jlc2lnaHQuIFRoZXNlIHBlcmlwaGVyYWxz
CmNhbiBtb25pdG9yIHRoZSBhY3Rpdml0eSBvZiB0aGUgY29yZXMuIEJlY2F1c2Ugb2YgdGhhdCwg
dGhleSBjYW4gYmUKdXNlZCBvbmx5IGlmIHNvbWUgZmVhdHVyZXMgaW4gdGhlIGRlYnVnIGNvbmZp
Z3VyYXRpb24gYXJlIGVuYWJsZWQuCkVsc2UsIGVycm9ycyBvciBmaXJld2FsbCBleGNlcHRpb25z
IGNhbiBiZSBvYnNlcnZlZC4gU2ltaWxhcmx5IHRvCnRoZSBFVFpQQyhvbiBzdG0zMm1wMXggcGxh
dGZvcm1zKSBvciB0aGUgUklGU0Mob24gc3RtMzJtcDJ4IHBsYXRmb3JtcyksCmRlYnVnLXJlbGF0
ZWQgcGVyaXBoZXJhbHMgYWNjZXNzIGNhbiBiZSBhc3Nlc3NlZCBhdCBidXMgbGV2ZWwgdG8KcHJl
dmVudCB0aGVzZSBpc3N1ZXMgZnJvbSBoYXBwZW5pbmcuCgpUaGUgZGVidWcgY29uZmlndXJhdGlv
biBjYW4gb25seSBiZSBhY2Nlc3NlZCBieSB0aGUgc2VjdXJlIHdvcmxkLgpUaGF0IG1lYW5zIHRo
YXQgYSBzZXJ2aWNlIG11c3QgYmUgaW1wbGVtZW50ZWQgaW4gdGhlIHNlY3VyZSB3b3JsZCBmb3IK
dGhlIGtlcm5lbCB0byBjaGVjayB0aGUgZmlyZXdhbGwgY29uZmlndXJhdGlvbi4gT24gT3BlblNU
TGludXgsIGl0IGlzCmRvbmUgdGhyb3VnaCBhIERlYnVnIGFjY2VzcyBQVEEgaW4gT1AtVEVFIFsx
XS4KVG8gcmVwcmVzZW50IHRoZSBkZWJ1ZyBwZXJpcGhlcmFscyBwcmVzZW50IG9uIGEgZGVkaWNh
dGVkIGRlYnVnIGJ1cywKY3JlYXRlIGEgZGVidWcgYnVzIG5vZGUgaW4gdGhlIGRldmljZSB0cmVl
IGFuZCB0aGUgYXNzb2NpYXRlZCBkcml2ZXIKdGhhdCB3aWxsIGludGVyYWN0IHdpdGggdGhpcyBQ
VEEuCgpQbHVzIHNvbWUgZml4ZXMuCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkNsw6ltZW50IExlIEdvZmZpYyAoMSk6CiAg
ICAgICBidXM6IGZpcmV3YWxsOiBtb3ZlIHN0bTMyX2ZpcmV3YWxsIGhlYWRlciBmaWxlIGluIGlu
Y2x1ZGUgZm9sZGVyCgpHYXRpZW4gQ2hldmFsbGllciAoOCk6CiAgICAgICBidXM6IHJpZnNjOiBm
aXggUklGIGNvbmZpZ3VyYXRpb24gY2hlY2sgZm9yIHBlcmlwaGVyYWxzCiAgICAgICBkdC1iaW5k
aW5nczogZG9jdW1lbnQgYWNjZXNzLWNvbnRyb2xsZXJzIHByb3BlcnR5IGZvciBjb3Jlc2lnaHQg
CnBlcmlwaGVyYWxzCiAgICAgICBkdC1iaW5kaW5nczogcGluY3RybDogZG9jdW1lbnQgYWNjZXNz
LWNvbnRyb2xsZXJzIHByb3BlcnR5IGZvciAKc3RtMzIgSERQCiAgICAgICBkdC1iaW5kaW5nczog
YnVzOiBkb2N1bWVudCB0aGUgc3RtMzIgZGVidWcgYnVzCiAgICAgICBidXM6IHN0bTMyX2ZpcmV3
YWxsOiBhbGxvdyBjaGVjayBvbiBkaWZmZXJlbnQgZmlyZXdhbGwgY29udHJvbGxlcnMKICAgICAg
IGJ1czogc3RtMzJfZmlyZXdhbGw6IGFkZCBzdG0zMl9maXJld2FsbF9nZXRfZ3JhbnRfYWxsX2Fj
Y2VzcygpIEFQSQogICAgICAgZHJpdmVyczogYnVzOiBhZGQgdGhlIHN0bTMyIGRlYnVnIGJ1cyBk
cml2ZXIKICAgICAgIHBpbmN0cmw6IHN0bTMyOiBhZGQgZmlyZXdhbGwgY2hlY2tzIGJlZm9yZSBw
cm9iaW5nIHRoZSBIRFAgZHJpdmVyCgpLcnp5c3p0b2YgS296bG93c2tpICgxKToKICAgICAgIGJ1
czogc3RtMzJfZmlyZXdhbGw6IFNpbXBsaWZ5IHdpdGggc2NvcGVkIGZvciBlYWNoIE9GIGNoaWxk
IGxvb3AKClRob3JzdGVuIEJsdW0gKDEpOgogICAgICAgYnVzOiByaWZzYzogUmVwbGFjZSBzbnBy
aW50ZigiJXMiKSB3aXRoIHN0cnNjcHkKCiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2FybS9hcm0sY29yZXNpZ2h0LWN0aS55YW1sIAogIHwgICAzICsrKwogIERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJtLGNvcmVzaWdodC1keW5hbWljLWZ1bm5lbC55
YW1sIHwgICAzICsrKwogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJt
LGNvcmVzaWdodC1ldG0ueWFtbCAKICB8ICAgMyArKysKICBEb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvYXJtL2FybSxjb3Jlc2lnaHQtc3RtLnlhbWwgCiAgfCAgIDMgKysrCiAgRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hcm0sY29yZXNpZ2h0LXRtYy55YW1s
IAogIHwgICAzICsrKwogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vYXJt
LGNvcmVzaWdodC10cGl1LnlhbWwgCiAgfCAgIDMgKysrCiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2J1cy9zdCxzdG0zMm1wMTMxLWRiZy1idXMueWFtbCAKICB8ICA3NiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL3N0LHN0bTMyLWhk
cC55YW1sIAogIHwgICA2ICsrKysrCiAgTUFJTlRBSU5FUlMgCiAgfCAgIDEgKwogIGRyaXZlcnMv
YnVzL0tjb25maWcgCiAgfCAgMTAgKysrKysrKysrCiAgZHJpdmVycy9idXMvTWFrZWZpbGUgCiAg
fCAgIDEgKwogIGRyaXZlcnMvYnVzL3N0bTMyX2RiZ19idXMuYyAKICB8IDI1MCAKKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwogIGRyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmMgCiAgfCAg
IDMgKy0tCiAgZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYyAKICB8ICA1OSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KICBkcml2ZXJzL2J1cy9zdG0z
Ml9yaWZzYy5jIAogIHwgIDYxICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiAgZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzItaGRwLmMg
CiAgfCAgMTQgKysrKysrKysrKysrCiAge2RyaXZlcnMgPT4gaW5jbHVkZS9saW51eH0vYnVzL3N0
bTMyX2ZpcmV3YWxsLmggCiAgfCAgIDAKICBpbmNsdWRlL2xpbnV4L2J1cy9zdG0zMl9maXJld2Fs
bF9kZXZpY2UuaCAKICB8ICAyNiArKysrKysrKysrKysrKysrKysrKysKICAxOCBmaWxlcyBjaGFu
Z2VkLCA0NzIgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pCiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IApEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYnVzL3N0LHN0bTMybXAxMzEt
ZGJnLWJ1cy55YW1sCiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvYnVzL3N0bTMyX2RiZ19i
dXMuYwogIHJlbmFtZSB7ZHJpdmVycyA9PiBpbmNsdWRlL2xpbnV4fS9idXMvc3RtMzJfZmlyZXdh
bGwuaCAoMTAwJSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
