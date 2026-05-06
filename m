Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMk/Axfs+mkZUQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 09:21:59 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6998B4D7257
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 09:21:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1677EC8F28A;
	Wed,  6 May 2026 07:21:58 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013034.outbound.protection.outlook.com [52.101.72.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34AF9C8F289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 07:21:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Br2tgw6LTJFtvq/QVwBCfdUOVH9GcHKmmnMBsQaaTiqGxTLXYT+20dLxEWLKYYnSnlNxHmgHFbrOsnX2otRqo89otPBiVPnti2pLiP/YAKsxmRKl7ZeQlI4wCNLEdeUwVjhnZmBxlcmha4YcYoNqRZTxSe0yxvTZ1llDDURCqwvddSolX8gj6k1VnhmcBEYMynYVvcVSxs1IMBKOgZP04YSlogRNjzbRK/mwN3FHKNZjvvgmykDByHFBHCe59as9xGhu1Ubs1r7ii15aPH//1Rg/Sh+O5NySQHJLKldak31TWqqMXYfWh6EedE8wUu32h16ZPAbw4Qor+7OakyFKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZwft+AsINXg1IUeonWXJmzw912+qyNo0VTvDBtvk5E=;
 b=f8GdXYdWYR9TsfrsBgoAuzWakpFLoxG7gccJuPHhMVYUw/sxUMnjjMAldSfXiiFRbmdxAVQxNO1e5Fwn/0qOmQMRHXc13ciOcRQDVEUteiBAS+ZFGy9Fe/y0lDnzQRdmt3EXaXAnc80FN+ZV7u9vW85ndU6YH37K5L5gFoVzELE/rYND7jJ0JVms5c/3SNTkN3T5LGBmYgCQFwXmgGji/qL/Xo4FyXtl/fJwB1vStltuVon0rLSRKWvB56mX4S8ty3ACvncgl5VmhO2mpuYM4ujALwQs1Knu69+sIoqcUgSpnE0dxNfLbYZx+2l5yvcSa+kJYR0v67RO2MC1vY0Qkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZwft+AsINXg1IUeonWXJmzw912+qyNo0VTvDBtvk5E=;
 b=LX9rJoMtH292bi/68CXYs+o36itPwOzRKEqupRKGhUCa70u3+kmunqu1yj3xogxbzoyCrbhRhyxctRiMW/Mkk7XYv5Si1lxT2mvHiYNZ8vMxi0KUztK6ukNMYgJI+76KCJCOReK9g7PKh8csqEbCGrDJ0adVTEPj6FHUPwSGCZbbUVVTWgeyyaiXEAHKZ22uPx5BSVywLA6xTHF7fMg9B3D+ctHKyuRyLd8V3LHWmuyJq83V2UcOg0PdeDj60kh0VdgDxhKTtvNbkWpG3EN2mFKS/25Ou9qFGyBWEAa251VPqec2PMNV/IfkSNfYVEfqCiEqytwGj3oRbVC4HRIKmA==
Received: from DUZPR01CA0272.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::12) by GV1PR10MB6291.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:91::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 07:21:52 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::1b) by DUZPR01CA0272.outlook.office365.com
 (2603:10a6:10:4b9::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 07:21:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 07:21:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 6 May
 2026 09:24:27 +0200
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 6 May
 2026 09:20:49 +0200
Message-ID: <617b40df-6e51-44d0-9803-60b2e47217ff@foss.st.com>
Date: Wed, 6 May 2026 09:20:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
References: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|GV1PR10MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 285a4a96-5212-4460-4a0a-08deab4024e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|30052699003|36860700016|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: cc3xLUxc6W9q39hagzCbRApCa2Zp2Bwde0tULN0Rzw06y1lfTu8SBY5k8K5FlcDZeB+o+dv+OD/M8HTIMruiY3QvUMt6k3+8Sg6gFOenDDTyNXcz49yQ9IsOGxn/h7+6FLiRy6EHsY68qfWM3+aa3ZsoFxdzVrpVYhl6APekLFqueG2EHGgi/48M8HRYq5M16YG0ZpjlyuQ2HmjOvzr7Fm6/CS+INsBL+z19v3R9F6nqJRge4lOEMICcRR5GlRLiv4227jJDe3CnhPfsfpqb0DdsRBJOAcxqeaCdrJ5mMlVdvhV4RvuE5+MxH98wV0pkac5ogKO0LQbR338jVXe+HQJKuHVUm/poskv2LYJThuUBjIithkFbrMYdRfEBwBfcH5lccklEWvmRJHFoUz/EBAezVch652yeogXuZa/ffw4a+if5HjnbQ8Bh9GUoX5ZwYTRKDEt1BpRXMmq4nPLTBCsrc2phLT6dwJDnF7tCfLPHcF63N+X5mRo9Dws1ii+euXf/0MDGbAat9fBvqErX5vqKC1vbBncvNrogG7Iety4j/O8T21KMJHR/0w8Mstp8jyfhQ9C0v+bERJEjcuxqcMhgKc+jRoFq1fVCS2K1iiFqWXjRodZg8V6cj8zPOmkgewjyLcgCQll71DsFZIurLw9cfcwM0qcyMzNZ/U8s7ODvp71iCbFHa/zqX5awpMXZ
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(30052699003)(36860700016)(18002099003)(22082099003)(56012099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Lh17XcS17sih1uJoHCMGTUjWRtDlZ192EEyGHLGYr6eSPU+qhOipZd0jhSSn91SCck1EvJHAAD0bb9Ls3WbTDRp5dGxhgRR7X7/dtjjIc0GRoocmjfG3ojG05Fk/n0K8i9cIZyhtuoxeSiglJ6wdYa9Rz/1P6GH2pxSoBmet6DGJvJNo1d769RlCbe6iGmmvDYcRwA6ICgOtpCv6Wehci/rO1zxJdavcBjcbnhD4/u7shwCOmsu8Y/AH7VP/CNCnIMaTSLfwOfYTKgIs8JCOor2GnJHbBXV0YGyD2hdZ8HdGVOx5qyhtQo+oJ8grcTcKomOWnoNEgkxt7rzzoJPCRPJKhU7YC1wrtOpsptT4CM8Vm69DI+cxOtf2wvE1SgUofpeLt6cIfs++3DmEF00Ip8vAialoA4C58cHqIoeWXFSehVKm0zutaxWw2rE/dhJL
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 07:21:51.7479 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 285a4a96-5212-4460-4a0a-08deab4024e9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6291
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v22 0/7] Introduction of a remoteproc tee
 to load signed firmware
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
X-Rspamd-Queue-Id: 6998B4D7257
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [8.29 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	BAD_REP_POLICIES(0.10)[];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:jens.wiklander@linaro.org,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:op-tee@lists.trustedfirmware.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.949];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:52.209.6.89];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Spam: Yes

SGVsbG8sCgpKdXN0IGEgZ2VudGxlIHJlbWluZGVyOiBhcyBhIGZpcnN0IHN0ZXAsIEkgd291bGQg
YXBwcmVjaWF0ZSBpdCBpZiB3ZSAKY291bGQgYXQgbGVhc3QgZmluYWxpemUgdGhlIGRpc2N1c3Np
b24gb24gdGhlIGJpbmRpbmdzIGJhc2VkIG9uIHBoYW5kbGVzLgoKVGhhbmtzLApBcm5hdWQKCk9u
IDQvMTQvMjYgMTc6MjgsIEFybmF1ZCBQb3VsaXF1ZW4gd3JvdGU6Cj4gTWFpbiB1cGRhdGVzIGZy
b20gdmVyc2lvbiBWMjFbMV06Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBU
aGlzIHZlcnNpb24gcmVtb3ZlcyB0aGUgc3Qsc3RtMzJtcDEtbTQtdGVlIGNvbXBhdGliaWxpdHkg
c3RyaW5nLAo+IHdoaWNoIG5vIGxvbmdlciBzZWVtcyB0byBiZSBhY2NlcHRlZCBieSB0aGUgRGV2
aWNldHJlZSBtYWludGFpbmVycy4KPiBBcyBhIGNvbnNlcXVlbmNlLCB0aGUgc3RtMzItcnByb2Mt
dGVlIGRyaXZlciwgaW50cm9kdWNlZCB0byBzaW1wbGlmeQo+IHRoZSBjb2RlLCBpcyByZW1vdmVk
LiBUaGUgU1RNMzIgaW50ZWdyYXRpb24gcmV1c2VzIHRoZSBleGlzdGluZwo+IHN0bTMyX3Jwcm9j
IGRyaXZlciBpbXBsZW1lbnRlZCBpbiBWMTkuCj4gCj4gVGhlIGRldmljZXRyZWUgaXMgbm93IHN0
cnVjdHVyZWQgYXMgZm9sbG93czoKPiAKPiAgICAgIGZpcm13YXJlIHsKPiAgICAgICAgICB0ZWVf
cnByb2M6IG9wdGVlLXJwcm9jIHsKPiAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICI4MGE0YzI3
NS0wYTQ3LTQ5MDUtODI4NS0xNDg2YTk3NzFhMDgiOwo+ICAgICAgICAgIH07Cj4gICAgICB9Owo+
IAo+ICAgICAgbTQ6IG00QDEwMDAwMDAwIHsKPiAgICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdG0z
Mm1wMS1tNCI7Cj4gICAgICAgIHJlZyA9IDwweDEwMDAwMDAwIDB4NDAwMDA+LAo+ICAgICAgICAg
ICAgICA8MHgzMDAwMDAwMCAweDQwMDAwPiwKPiAgICAgICAgICAgICAgPDB4MzgwMDAwMDAgMHgx
MDAwMD47Cj4gCj4gICAgICAgIG1ib3hlcyA9IDwmaXBjYyAwPiwgPCZpcGNjIDE+LCA8JmlwY2Mg
Mj4sIDwmaXBjYyAzPjsKPiAgICAgICAgbWJveC1uYW1lcyA9ICJ2cTAiLCAidnExIiwgInNodXRk
b3duIiwgImRldGFjaCI7Cj4gCj4gICAgICAgIG1lbW9yeS1yZWdpb24gPSA8JnZkZXYwdnJpbmcw
PiwgPCZtX2lwY19zaG0+LCA8Jm1jdXJhbTI+LAo+ICAgICAgICAgICAgICAgICAgICAgICAgPCZ2
ZGV2MHZyaW5nMT4sIDwmdmRldjBidWZmZXI+LCA8JnJldHJhbT47Cj4gCj4gICAgICAgIGludGVy
cnVwdC1wYXJlbnQgPSA8JmV4dGk+Owo+ICAgICAgICBpbnRlcnJ1cHRzID0gPDY4IDE+Owo+IAo+
ICAgICAgICBzdCxycHJvYy10ZWUgPSA8JnRlZV9ycHJvYyAwPjsKPiAKPiAgICAgICAgc3RhdHVz
ID0gIm9rYXkiOwo+ICAgICAgfTsKPiAKPiBBcyBhIGNvbnNlcXVlbmNlLCB0aGlzIHZlcnNpb246
Cj4gLSByZWludHJvZHVjZSB2MTkgY29tbWl0cyBmb3Igc3RtMzJfcnByb2MuYyBkcml2ZXIgLCBh
ZGRpbmcgdGhlIHN1cHBvcnQKPiAgICBvZiB0aGUgc3QscnByb2MtdGVlIGJpbmRpbmcuCj4gLSBk
cm9wcyB0aGUgZGVkaWNhdGVkIHJlbW90ZXByb2MtdGVlLnlhbWwgYW5kIHN0LHN0bTMyLXJwcm9j
LXRlZS55YW1sCj4gICAgYmluZGluZ3MgZnJvbSB0aGUgc2VyaWVzLgo+IC0gZXh0ZW5kcyBzdCxz
dG0zMi1ycHJvYy55YW1sIHdpdGggc3QscnByb2MtdGVlIHRvIGRlc2NyaWJlIHRoZSBsaW5rIHRv
Cj4gICAgdGhlIFRFRSByZW1vdGVwcm9jIGJhY2tlbmQuCj4gLSByZW1vdmVzIHRoZSBkZWRpY2F0
ZWQgc3RtMzJfcnByb2NfdGVlLmMgZHJpdmVyIGFuZCByZXVzZXMgc3RtMzJfcnByb2MuYwo+ICAg
IGZvciBib3RoIG5hdGl2ZSBhbmQgVEVFLWNvbnRyb2xsZWQgY2FzZXMuCj4gLSBrZWVwcyByZW1v
dGVwcm9jX3RlZS5jIGFsaWduZWQgd2l0aCB0aGUgcGhhbmRsZS1iYXNlZCBsb29rdXAgaW50cm9k
dWNlZAo+ICAgIGluIHYyMSBhbmQgdXNlcyBhIGRldmljZV9saW5rIGJldHdlZW4gdGhlIFNUTTMy
IHJlbW90ZXByb2MgaW5zdGFuY2UgYW5kCj4gICAgdGhlIFRFRSBiYWNrZW5kIGRldmljZS4KPiAK
PiBNb3JlIGRldGFpbHMgYXJlIGF2YWlsYWJsZSBpbiBlYWNoIHBhdGNoIGNvbW1pdCBtZXNzYWdl
Lgo+IAo+IE1haW4gdXBkYXRlcyBmcm9tIHZlcnNpb24gVjIwWzNdOgo+IC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gVG8gYWRkcmVzcyBSb2LigJlzIGNvbmNlcm4gb24gdjIwY29u
Y2VybmluZyByZXNvdXJjZSBkZWNsYXJhdGlvbiB1bmRlciB0aGUKPiB0ZWUgbm9kZSwgdGhlIGRl
dmljZSB0cmVlIGlzIG5vdyBzdHJ1Y3R1cmVkIGFzIGZvbGxvd3MscmVwbGFjaW5nIHRoZQo+IGNo
aWxkLXBhcmVudCBoaWVyYXJjaHkgd2l0aCBhIHBoYW5kbGU6Cj4gCj4gICAgICBmaXJtd2FyZSB7
Cj4gICAgICAgICAgdGVlX3Jwcm9jOiBvcHRlZS1ycHJvYyB7Cj4gICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiODBhNGMyNzUtMGE0Ny00OTA1LTgyODUtMTQ4NmE5NzcxYTA4IjsKPiAgICAgICAg
ICB9Owo+ICAgICAgfTsKPiAKPiAgICAgIG00OiBtNEAwIHsKPiAgICAgICAgY29tcGF0aWJsZSA9
ICJzdCxzdG0zMm1wMS1tNC10ZWUiOwo+ICAgICAgICByZWcgPSA8MCAwPjsKPiAKPiAgICAgICAg
bWJveGVzID0gPCZpcGNjIDA+LCA8JmlwY2MgMT4sIDwmaXBjYyAyPjsKPiAgICAgICAgbWJveC1u
YW1lcyA9ICJ2cTAiLCAidnExIiwgInNodXRkb3duIjsKPiAKPiAgICAgICAgbWVtb3J5LXJlZ2lv
biA9IDwmdmRldjB2cmluZzA+LCA8Jm1faXBjX3NobT4sIDwmbWN1cmFtMj4sCj4gICAgICAgICAg
ICAgICAgICAgICAgICA8JnZkZXYwdnJpbmcxPiwgPCZ2ZGV2MGJ1ZmZlcj4sIDwmcmV0cmFtPjsK
PiAKPiAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmZXh0aT47Cj4gICAgICAgIGludGVycnVw
dHMgPSA8NjggMT47Cj4gCj4gICAgICAgIHJwcm9jLXRlZS1waGFuZGxlID0gPCZ0ZWVfcnByb2Mg
MD47Cj4gICAgICAgIHN0LGF1dG8tYm9vdDsKPiAgICAgICAgd2FrZXVwLXNvdXJjZTsKPiAKPiAg
ICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ICAgICAgfTsKPiAKPiBBcyBhIGNvbnNlcXVlbmNlLCB0
aGlzIHZlcnNpb246Cj4gLSBVcGRhdGVzIHRoZSBkZXZpY2UgdHJlZSBhbmQgYmluZGluZ3MgdG86
Cj4gICAgLSBDaGFuZ2UgdGhlIGNvbXBhdGlibGUgcHJvcGVydHkgZnJvbQo+ICAgICAgInJwcm9j
LXNlcnZpY2UtODBhNGMyNzUtMGE0Ny00OTA1LTgyODUtMTQ4NmE5NzcxYTA4IiB0bwo+ICAgICAg
IjgwYTRjMjc1LTBhNDctNDkwNS04Mjg1LTE0ODZhOTc3MWEwOCIuCj4gICAgLSBVc2UgdGhlIHJw
cm9jLXRlZS1waGFuZGxlIHRvIGF2b2lkIHRoZSBwYXJlbnQtY2hpbGQgaGllcmFyY2h5Lgo+IC0g
VXBkYXRlcyBzdG0zMl9ycHJvY190ZWUuYyBhbmQgcmVtb3RlcHJvY190ZWUuYyB0byBhZGFwdCB0
byB0aGUgbmV3IGJpbmRpbmdzLgo+IC0gVXBkYXRlcyByZW1vdGVwcm9jX3RlZS5jIHRvIGNvbXB1
dGUgdGhlIGRldmljZSB0cmVlIGNvbXBhdGlibGUgc3RyaW5nIGZyb20KPiAgICB0aGUgVEVFIFVV
SUQuCj4gCj4gTWFpbiB1cGRhdGVzIGZyb20gdmVyc2lvbiBWMTlbNF06Cj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBUaGUgZGV2aWNldHJlZSBpcyBub3cgc3RydWN0dXJlZCBh
cyBmb2xsb3dzOgo+IAo+IAlmaXJtd2FyZSB7Cj4gCQlvcHRlZSB7Cj4gCQkJY29tcGF0aWJsZSA9
ICJsaW5hcm8sb3B0ZWUtdHoiOwo+IAkJCW1ldGhvZCA9ICJzbWMiOwo+IAkJCSNhZGRyZXNzLWNl
bGxzID0gPDE+Owo+IAkJCSNzaXplLWNlbGxzID0gPDA+Owo+IAkJCXJwcm9jLXNlcnZpY2VAMCB7
Cj4gCQkJCWNvbXBhdGlibGUgPSAicnByb2Mtc2VydmljZS04MGE0YzI3NS0wYTQ3LTQ5MDUtODI4
NS0xNDg2YTk3NzFhMDgiOwo+IAkJCQlyZWcgPSA8MD47Cj4gCQkJCSNhZGRyZXNzLWNlbGxzID0g
PDE+Owo+IAkJCQkjc2l6ZS1jZWxscyA9IDwwPjsKPiAJCQkJc3RhdHVzID0gIm9rYXkiOwo+IAkJ
CQltNDogbTRAMCB7Cj4gCQkJCQljb21wYXRpYmxlID0gInN0LHN0bTMybXAxNS1tNC10ZWUiOwo+
IAkJCQkJcmVnID0gPDA+Owo+IAkJCQkJbWJveGVzID0gPCZpcGNjIDA+LCA8JmlwY2MgMT4sIDwm
aXBjYyAyPjsKPiAJCQkJCW1ib3gtbmFtZXMgPSAidnEwIiwgInZxMSIsICJzaHV0ZG93biI7Cj4g
CQkJCQltZW1vcnktcmVnaW9uID0gPCZ2ZGV2MHZyaW5nMD4sCTwmbV9pcGNfc2htPiwgPCZtY3Vy
YW0yPiwKPiAJCQkJCQkJPCZ2ZGV2MHZyaW5nMT4sIDwmdmRldjBidWZmZXI+LCA8JnJldHJhbT47
Cj4gCQkJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZleHRpPjsKPiAJCQkJCWludGVycnVwdHMgPSA8
NjggMT47Cj4gCQkJCQlzdGF0dXMgPSAib2theSI7Cj4gCQkJCX07Cj4gCQkJfTsKPiAJCX07Cj4g
CX07Cj4gCj4gQXMgYSBjb25zZXF1ZW5jZSwgdGhpcyB2ZXJzaW9uOgo+IAo+IC0gSW50cm9kdWNl
cyBhIG5ldyBzdG0zMl9ycHJvY190ZWUuYyByZW1vdGVwcm9jIGRyaXZlci4KPiAKPiAgICBJbnN0
ZWFkIG9mIGZ1cnRoZXIgY29tcGxpY2F0aW5nIHRoZSBleGlzdGluZyBzdG0zMl9ycHJvYy5jIGRy
aXZlciwgYQo+ICAgIGRlZGljYXRlZCBURUUtYmFzZWQgZHJpdmVyIGlzIGFkZGVkLiBCb3RoIGRy
aXZlcnMgYXJlIGludGVuZGVkIHRvIGFsc28KPiAgICBzdXBwb3J0IHRoZSBTVE0zMk1QMnggQ29y
dGV4LU0zMyByZW1vdGUgcHJvY2Vzc29yIGluIGEgbmV4dCBzdGVwLgo+IAo+IC0gUmV3b3JrcyB0
aGUgYmluZGluZ3M6Cj4gICAgLSBEcm9wIHRoZSBzdCxzdG0zMi1ycHJvYy55YW1sIHVwZGF0ZXMg
dGhhdCB3ZXJlIGludHJvZHVjZWQgaW4gcHJldmlvdXMKPiAgICAgIHJldmlzaW9ucy4KPiAgICAt
IEFkZCByZW1vdGVwcm9jLXRlZS55YW1sIGZvciB0aGUKPiAgICAgICJycHJvYy1zZXJ2aWNlLTgw
YTRjMjc1LTBhNDctNDkwNS04Mjg1LTE0ODZhOTc3MWEwOCIgY29tcGF0aWJsZS4KPiAgICAtIEFk
ZCBzdCxzdG0zMi1ycHJvYy10ZWUueWFtbCBmb3IgdGhlICJzdCxzdG0zMm1wMTUtbTQtdGVlIiBj
b21wYXRpYmxlLgo+IAo+IC0gUmV3b3JrcyB0aGUgcHJvYmluZyBzZXF1ZW5jZToKPiAKPiAgICBU
aGUgbTRAMCBkZXZpY2UgaXMgbm93IHByb2JlZCBieSB0aGUgcmVtb3RlcHJvYy10ZWUgZHJpdmVy
LCB3aGljaCBpdHNlbGYKPiAgICBpcyBpbnN0YW50aWF0ZWQgYnkgdGhlIFRFRSAoT1AtVEVFKSBi
dXMuCj4gCj4gTW9yZSBkZXRhaWxzIGFyZSBhdmFpbGFibGUgaW4gZWFjaCBwYXRjaCBjb21taXQg
bWVzc2FnZS4KPiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmVtb3RlcHJv
Yy8yMDI2MDMxNzE4MDMyOS4xMjA3NjI1LTEtYXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbS8K
PiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmVtb3RlcHJvYy8yMDI1MTIxNzE1
MzkxNy4zOTk4NTQ0LTEtYXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbS8KPiBbM10gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtZGV2aWNldHJlZS8yMDI1MDYyNTA5NDAyOC43NTgwMTYt
MS1hcm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tLwo+IAo+IAo+IFRlc3RlZC1vbjoKPiAtLS0t
LS0tLS0KPiBjb21taXQgNTkxY2Q2NTZhMWJmICgiTGludXggNy4wLXJjNyIpCj4gCj4gRGVzY3Jp
cHRpb24gb2YgdGhlIGZlYXR1cmU6Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBUaGlz
IHNlcmllcyBwcm9wb3NlcyB0aGUgaW1wbGVtZW50YXRpb24gb2YgYSByZW1vdGVwcm9jIHRlZSBk
cml2ZXIgdG8KPiBjb21tdW5pY2F0ZSB3aXRoIGEgVEVFIHRydXN0ZWQgYXBwbGljYXRpb24gcmVz
cG9uc2libGUgZm9yIGF1dGhlbnRpY2F0aW5nCj4gYW5kIGxvYWRpbmcgdGhlIHJlbW90ZXByb2Mg
ZmlybXdhcmUgaW1hZ2UgaW4gYW4gQXJtIHNlY3VyZSBjb250ZXh0Lgo+IAo+IDEpIFByaW5jaXBs
ZToKPiAKPiBUaGUgcmVtb3RlcHJvYyB0ZWUgZHJpdmVyIHByb3ZpZGVzIHNlcnZpY2VzIHRvIGNv
bW11bmljYXRlIHdpdGggdGhlIE9QLVRFRQo+IHRydXN0ZWQgYXBwbGljYXRpb24gcnVubmluZyBv
biB0aGUgVHJ1c3RlZCBFeGVjdXRpb24gQ29udGV4dCAoVEVFKS4KPiBUaGUgdHJ1c3RlZCBhcHBs
aWNhdGlvbiBpbiBURUUgbWFuYWdlcyB0aGUgcmVtb3RlIHByb2Nlc3NvciBsaWZlY3ljbGU6Cj4g
Cj4gLSBhdXRoZW50aWNhdGluZyBhbmQgbG9hZGluZyBmaXJtd2FyZSBpbWFnZXMsCj4gLSBpc29s
YXRpbmcgYW5kIHNlY3VyaW5nIHRoZSByZW1vdGUgcHJvY2Vzc29yIG1lbW9yaWVzLAo+IC0gc3Vw
cG9ydGluZyBtdWx0aS1maXJtd2FyZSAoZS5nLiwgVEYtTSArIFplcGh5ciBvbiBhIENvcnRleC1N
MzMpLAo+IC0gbWFuYWdpbmcgdGhlIHN0YXJ0IGFuZCBzdG9wIG9mIHRoZSBmaXJtd2FyZSBieSB0
aGUgVEVFLgo+IAo+IDIpIEZvcm1hdCBvZiB0aGUgc2lnbmVkIGltYWdlOgo+IAo+IFJlZmVyIHRv
Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvYmxvYi9tYXN0ZXIvdGEvcmVt
b3RlcHJvYy9zcmMvcmVtb3RlcHJvY19jb3JlLmMjTDE4LUw1Nwo+IAo+IDMpIE9QLVRFRSB0cnVz
dGVkIGFwcGxpY2F0aW9uIEFQSToKPiAKPiBSZWZlciB0bzoKPiBodHRwczovL2dpdGh1Yi5jb20v
T1AtVEVFL29wdGVlX29zL2Jsb2IvbWFzdGVyL3RhL3JlbW90ZXByb2MvaW5jbHVkZS90YV9yZW1v
dGVwcm9jLmgKPiAKPiA0KSBPUC1URUUgc2lnbmF0dXJlIHNjcmlwdAo+IAo+IFJlZmVyIHRvOgo+
IGh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvYmxvYi9tYXN0ZXIvc2NyaXB0cy9z
aWduX3Jwcm9jX2Z3LnB5Cj4gCj4gRXhhbXBsZSBvZiB1c2FnZToKPiBzaWduX3Jwcm9jX2Z3LnB5
IC0taW4gPGZ3MS5lbGY+IC0taW4gPGZ3Mi5lbGY+IC0tb3V0IDxzaWduZWRfZncuc2lnbj4gLS1r
ZXkgJHtPUC1URUVfUEFUSH0va2V5cy9kZWZhdWx0LnBlbQo+IAo+IAo+IDUpIEltcGFjdCBvbiBV
c2VyIHNwYWNlIEFwcGxpY2F0aW9uCj4gCj4gTm8gc3lzZnMgaW1wYWN0LiBUaGUgdXNlciBvbmx5
IG5lZWRzIHRvIHByb3ZpZGUgdGhlIHNpZ25lZCBmaXJtd2FyZSBpbWFnZQo+IGluc3RlYWQgb2Yg
dGhlIEVMRiBpbWFnZS4KPiAKPiAKPiBGb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91dCB0aGUgaW1w
bGVtZW50YXRpb24sIGEgcHJlc2VudGF0aW9uIGlzIGF2YWlsYWJsZSBoZXJlCj4gKG5vdGUgdGhh
dCB0aGUgZm9ybWF0IG9mIHRoZSBzaWduZWQgaW1hZ2UgaGFzIGV2b2x2ZWQgYmV0d2VlbiB0aGUg
cHJlc2VudGF0aW9uCj4gYW5kIHRoZSBpbnRlZ3JhdGlvbiBpbiBPUC1URUUpLgo+IAo+IGh0dHBz
Oi8vcmVzb3VyY2VzLmxpbmFyby5vcmcvZW4vcmVzb3VyY2UvNmM1Ykd2WndVQWpYNTZmdnh0aHhk
cwo+IAo+IEFybmF1ZCBQb3VsaXF1ZW4gKDcpOgo+ICAgIGR0LWJpbmRpbmdzOiBmaXJtd2FyZTog
QWRkIFRFRSByZW1vdGVwcm9jIHNlcnZpY2UgYmluZGluZwo+ICAgIGR0LWJpbmRpbmdzOiByZW1v
dGVwcm9jOiBzdCxzdG0zMi1ycHJvYzogYWRkIHN0LHJwcm9jLXRlZQo+ICAgIHJlbW90ZXByb2M6
IGNvcmU6IEludHJvZHVjZSBycHJvY19wYV90b192YSBoZWxwZXIKPiAgICByZW1vdGVwcm9jOiBJ
bnRyb2R1Y2Ugb3B0aW9uYWwgcmVsZWFzZV9mdyBvcGVyYXRpb24KPiAgICByZW1vdGVwcm9jOiBB
ZGQgVEVFIHN1cHBvcnQKPiAgICByZW1vdGVwcm9jOiBzdG0zMjogQ3JlYXRlIHN1Yi1mdW5jdGlv
bnMgdG8gcmVxdWVzdCBzaHV0ZG93biBhbmQKPiAgICAgIHJlbGVhc2UKPiAgICByZW1vdGVwcm9j
OiBzdG0zMjogQWRkIHN1cHBvcnQgb2YgYW4gT1AtVEVFIFRBIHRvIGxvYWQgdGhlIGZpcm13YXJl
Cj4gCj4gICAuLi4vYmluZGluZ3MvcmVtb3RlcHJvYy9yZW1vdGVwcm9jLXRlZS55YW1sICAgfCAg
MzYgKwo+ICAgLi4uL2JpbmRpbmdzL3JlbW90ZXByb2Mvc3Qsc3RtMzItcnByb2MueWFtbCAgIHwg
IDU1ICstCj4gICBkcml2ZXJzL3JlbW90ZXByb2MvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAg
fCAgMTAgKwo+ICAgZHJpdmVycy9yZW1vdGVwcm9jL01ha2VmaWxlICAgICAgICAgICAgICAgICAg
IHwgICAxICsKPiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9jX2NvcmUuYyAgICAgICAg
ICB8ICA1NiArKwo+ICAgZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfaW50ZXJuYWwuaCAg
ICAgIHwgICA2ICsKPiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9jX3RlZS5jICAgICAg
ICAgICB8IDc4OSArKysrKysrKysrKysrKysrKysKPiAgIGRyaXZlcnMvcmVtb3RlcHJvYy9zdG0z
Ml9ycHJvYy5jICAgICAgICAgICAgICB8IDI0OSArKysrLS0KPiAgIGluY2x1ZGUvbGludXgvcmVt
b3RlcHJvYy5oICAgICAgICAgICAgICAgICAgICB8ICAgNiArCj4gICBpbmNsdWRlL2xpbnV4L3Jl
bW90ZXByb2NfdGVlLmggICAgICAgICAgICAgICAgfCAgOTggKysrCj4gICAxMCBmaWxlcyBjaGFu
Z2VkLCAxMjIwIGluc2VydGlvbnMoKyksIDg2IGRlbGV0aW9ucygtKQo+ICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL3JlbW90
ZXByb2MtdGVlLnlhbWwKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3JlbW90ZXByb2Mv
cmVtb3RlcHJvY190ZWUuYwo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvcmVt
b3RlcHJvY190ZWUuaAo+IAo+IAo+IGJhc2UtY29tbWl0OiA1OTFjZDY1NmExYmY1ZWE5NGEyMjJh
ZjVlZjJlZTc2ZGYwMjljMWQyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
