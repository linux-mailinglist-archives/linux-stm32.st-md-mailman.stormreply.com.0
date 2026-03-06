Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOBJJ2mRqml0TQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 09:33:45 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EC521D1F2
	for <lists+linux-stm32@lfdr.de>; Fri, 06 Mar 2026 09:33:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4E78C8F270;
	Fri,  6 Mar 2026 08:33:44 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010028.outbound.protection.outlook.com [52.101.69.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9577FC055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Mar 2026 08:33:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SqccUuX2Fy0b53AQykVXbIvSyD8n1iyQuyDz720+emcAucsq9PtJuAT5qkVLG8oWf8DN1d5n6/zk3RilGl0BKbDQgMs7XeVZf0uWYQHQhslpIqoNnGPsaVMBMoV7XaDBz54LhNP6hSK3hUOHyHgvkcTJaBiTsOi55IY1sUZA1ZvR49MaXLVCZc8YdVYJIs123V12CsOgp0FXe3mFKaZAjAAL7kP9nzAyi2cJ6JnNX457iFxIUHkW6ariD+oNZMORGWIu4fKTNzvSwBg2TqM5Q6seVOWEMnkcwA/tQvHMbKbOa/sqgvljvAKS+X+OyKqe5q1Fbb4NMBOMJd/ZDefLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfg9+gLaHcA0dR3D0y565AQJas3n4i9mAKJfxQfEjEs=;
 b=LTELVoXH1Jxt2GNt9g34JaQRSC81x2qqhyEXkkW6zsN09TKl7k64V2tIUN3DsBO8rsYUUxK+uLuscDEfWHB4j6CD1NB/mtlX/QCXOcnKzOx5QRt2JpC02PdXfi0SWdCtHvqlrJHmN1+cTCq4OCDyfUmqDCCPB+fsvpLFpIbW8Ff6QKrmE0vMjGjDis91QbwGqpM6IGOy6eolFhRcTVX0DX/gCLZAd1htbFr2C9RkKV5WXIoOzBYKWV5xJsuYrH2YPLhqxb/IzuD7ADMAIslchjhrkGj6b4+B1106ttmjpUEcGtaH1oyD/NZMdV8B0EXac5NEsfwV0Fob4Q9fZw82qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfg9+gLaHcA0dR3D0y565AQJas3n4i9mAKJfxQfEjEs=;
 b=IuiRxQzqUWI7qb0PK3oR61XLRwWJB52TneI+gcvhtc0sDMFk/m3wqWGQXijH9OA2Bqs0euMc+rZaQuDRhoeyd2d+RJtN6P3Ze7g7FOLCxt4XNsymAgN3G7o9QEGCDy3YIizEXnrzpLTGi5gV25ZTqZgTmnaPGJCxZkcBId/HK+MTA7elH5gELWZKWo0Kb/wRoMygDEQTTC9xMU5f56llfaJHfyCIu7kxxmBxX4xrIWNhVIIPsZOoUaJW2l5jdLNb/xw9N9W/OKjwE+S5kMWyVTmf/GunPx37RoKWQtEuOBaQAHMNPhsZ6UzitbI3QxiB8C54pnO7KWNMe3RA0hszeA==
Received: from DB9PR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::9) by DU4PR10MB8558.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:55c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 08:33:40 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::7e) by DB9PR01CA0004.outlook.office365.com
 (2603:10a6:10:1d8::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 08:33:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 6 Mar 2026 08:33:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 6 Mar
 2026 09:35:50 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 6 Mar
 2026 09:33:37 +0100
Message-ID: <48b17cb3-d0d4-496f-9b5f-3df319f28b49@foss.st.com>
Date: Fri, 6 Mar 2026 09:33:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Antonio Borneo <antonio.borneo@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
 <20260209-stm32_risab-v1-1-ef0b2b6a7e0a@foss.st.com>
 <ee9759a6-1779-4891-8716-24c36134198a@kernel.org>
 <516036b6-b825-4a29-a48a-5d3af3234968@foss.st.com>
 <ac793499-bebb-477b-b27e-089529f3ee4b@kernel.org>
 <66ecf6a5-cc1f-4872-971d-6bc32894dbac@foss.st.com>
 <fd73947a-289a-43f9-9506-573fee935d12@kernel.org>
 <ed0ab69f-7aff-423f-8b93-980e79705b6d@foss.st.com>
 <c588720a-6a7d-4179-afb5-bb7e89e0e7e1@kernel.org>
 <b535dfd6-e4a6-4831-a868-c152574144c8@foss.st.com>
 <ae9962a4-b611-46e0-b124-5910e8708a20@kernel.org>
 <78be9de6-084d-4c3e-831d-a91fd0d1775e@foss.st.com>
Content-Language: en-US
In-Reply-To: <78be9de6-084d-4c3e-831d-a91fd0d1775e@foss.st.com>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D00:EE_|DU4PR10MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f33073-103d-4ca2-2c61-08de7b5b10e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016; 
X-Microsoft-Antispam-Message-Info: W5yJtrZYdwBRuyLcAhcVGE3SclCcKPa9EOWY9c9MaY/x6r7/MzRILFSWvdnbbhDq9RXt8Pr1/eXhUGWLPn+XmsvlcpECeKneGmdVn3swxYYtCi4E0BhMj1oRbYyIOAO9DQ+zS7tB6Bk6n54uaAD3s6tsun3ZEZWHrlA8vUPYpzjfWi4qMH9+l+Pxgob4h36loF3CTOcJXxVMXbv0CvZB6tlBzuXQD1WIeetGGPY2OXgAgheItsWXpj9FZN+gljVH+vaX9oYDd79Z+ABqdGfXqgPmrm837cs4Kf1mWVVo6cJq9GNAI/ZPI57FtHsW3OvNMwYblPgiBoCcvi5VMmSzfs2Mar5699+XGhSnlEnCSvporh806D2jRw/Tih5/AwH6ne2NKbJXb4ixsj8r6vZbgbN5RqtHvZVd0AdBb8sQoN72zZtw/BCBc+LNoZb0WK5jL+scX9QhermQcNDPf37V3zcbM88eoWqC9TfGSO8RSfOQZaQRRg9++/UTJdYQiiusrmQ5Ifguvnhqa9wBcQ0HyjfS7TFS11Z5yHx4juwFmsCUDIj4vAGJGBx4vvYcwP8lQjOw3gIYnooLR18kdqcvw7LvrQeLda58y60VGj730csDMVQXRC/q49H8HBFK6aIyfEtq2npM4B1p0sdSJeceiioREhLBtxkJq2ba0G6qayXcoRS+zdtD0fIvJ4RhUj9++yFeDo37G7ZvDv2D4X4b29kI0Q2wX0a8T1hZJ9KpMKcW9X58Mnuj/rDOF+n4nRFj8zI0Bds53iFSs5a/mSVOlw==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: P8SuHmeHSZtWq4EfnI0PIqfLKWlEerMHzko0Y2WzHeosokOCXTsvMUAGTm4htIMWiinTDa4wcqOgNzqFf+KXoQmPk9vS8SD6YUsBBRy1YS8S1vN/rhfuBYVBTRpsTF6iZrqMkHS4ejugDpfxVtAyeSoGUN1+1Q4Q/wfmGwGqdqyLFFmWmJSeChas5/Ul38NcA9pDo5uTf4mZiwq2fgBvqpse7VTSdlI0peyhXfhLXN66OebepcgqblGvR34ehMacHz0nHImhK5HdgPa7FImVA2qO50EXPEgYcqJx4lIMKCEJCR4a8Va39agVLoWyyXft8e/4Tn9TMDGlyivQSvexDOhamy+QmN1wmYsDTutwQCpWrNROjSoMQymm/jLQ9oBwEt0GYvfps4ehznwlqqiYLRNyOylvNqIhzGhOqsMxqKKH9lyvzexZeKEXzB0p6VU6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 08:33:38.8066 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f33073-103d-4ca2-2c61-08de7b5b10e9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8558
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/7] dt-bindings: soc: st: document the
 RISAB firewall peripheral
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
X-Rspamd-Queue-Id: 10EC521D1F2
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:antonio.borneo@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_SPAM(0.00)[0.346];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

SGVsbG8sCgpJIGFtIGNoYW5naW5nIGVtcGxveWVyIHNvIEkgd2lsbCBub3QgbG9uZ2VyIGJlIGFi
bGUgdG8gd29yayBvbiB0aGlzCnRvcGljLiBBbnRvbmlvIEJvcm5lbyAoYWRkZWQgaW4gVG86KSB3
aWxsIHRha2Ugb3ZlciB0aGlzIGFuZCBJIGZ1bGx5CmF1dGhvcml6ZSBoaW0gdG8gcmV3b3JrIHRo
ZSBwYXRjaGVzIGFzIGhlIHdpc2hlcyB3aGlsZSBrZWVwaW5nL3JlbW92aW5nCm15IHNpZ25lZC1v
ZmYuCgpJJ2xsIG1ha2UgYW5vdGhlciBwYXRjaCBvbiB0b3Agb2Ygc3RtMzIgbmV4dCBicmFuY2gg
dG8gdXBkYXRlIG15CmVtYWlsIGFkZHJlc3MgaW4gdGhlIE1BSU5UQUlORVJTIGZpbGUgZm9yIHRo
ZSByZXN0IHRvIGtlZXAgYW4gZXllCm9uIGl0LgoKQmVzdCByZWdhcmRzLApHYXRpZW4KCk9uIDMv
Mi8yNiAxNjowOSwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4gCj4gCj4gT24gMi8yNi8yNiAx
OToxMywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4gT24gMTkvMDIvMjAyNiAxNTowMiwg
R2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4+PiBKdXN0IGEgc21hbGwgcmVpbnRyb2R1Y3Rpb24g
b2YgdGhlIGlzc3VlOgo+Pj4gV2UgbmVlZCB0byBwcm92aWRlIHRocmVlIHNldHMgb2YgaW5mb3Jt
YXRpb24gdG8gdGhlIGRyaXZlcnMgb2YgUklTQXg6Cj4+PiAtIFRoZSByZWdpc3RlcnMgb2YgdGhl
IFJJU0F4IGRldmljZSwgaGFuZGxlZCB0aHJvdWdoIHByb3BlcnR5ICJyZWciCj4+PiAtIFRoZSBn
bG9iYWwgcmFuZ2Ugb2YgbWVtb3J5IGFkZHJlc3NlcyBwcm90ZWN0ZWQgYnkgdGhlIFJJU0F4IGRl
dmljZXMKPj4+IChjdXJyZW50bHkgdGhyb3VnaCB0aGUgY3VzdG9tIHByb3BlcnR5ICJzdCxtZW0t
bWFwIikKPj4+IC0gRWFjaCBpbmRpdmlkdWFsIG1lbW9yeSByYW5nZSBwcm90ZWN0ZWQsIGhhbmRs
ZWQgdGhyb3VnaCBwcm9wZXJ0eQo+Pj4gIm1lbW9yeS1yZWdpb24iIHRoYXQgcG9pbnRzIHRvIGNo
aWxkcmVuIG9mICIvcmVzZXJ2ZWQtbWVtb3J5Ii4gTWVtb3J5Cj4+PiByZWdpb25zIG1heSBub3Qg
Y292ZXIgdGhlIHdob2xlIHJhbmdlIGNvdmVyZWQgYnkgdGhlIFJJU0F4Lgo+Pj4KPj4+IFRvIHJl
cGxhY2UgdGhlIGN1c3RvbSBwcm9wZXJ0eSwgSSBoYXZlIGV4cGxvcmVkIGEgZmV3IHdheXM6Cj4+
Pgo+Pj4gMSkgRGVzY3JpYmUgdGhlIG1lbW9yeSByYW5nZSBjb3ZlcmVkIGJ5IHRoZSBtZW1vcnkg
ZmlyZXdhbGwgYXMgYQo+Pj4gcmVzZXJ2ZWQgbWVtb3J5OiBDYW5ub3QgYmUgZG9uZSBiZWNhdXNl
LCBmb3IgdGhlIG1lbW9yeSBmaXJld2FsbAo+Pj4gY292ZXJpbmcgdGhlIEREUiwgdGhlIHJlc2Vy
dmVkIG1lbW9yeSB3b3VsZCBvdmVybGFwIHdpdGggdGhlIG1lbW9yeQo+Pj4gbm9kZSB1c2VkIHRv
IGRlc2NyaWJlIHRoZSBtZW1vcnkgYXZhaWxhYmxlIGZvciByZWd1bGFyIGtlcm5lbCB1c2UuCj4+
PiBUaGUgbWVtb3J5IG5vZGUgcmVwcmVzZW50cyBwYXJ0IG9mIHRoZSBERFIgaW4gdGhhdCBjYXNl
Lgo+Pgo+PiBCdXQgaXNuJ3QgdGhpcyB0aGUgZW50aXJlIHBvaW50IG9mIFJJU0FCIG9uIG1haW4g
c3lzdGVtIG1lbW9yeT8gWW91IHdhbnQKPj4gdG8gbWFyayBwYXJ0IG9mIHN5c3RlbSBtZW1vcnkg
b25lIHdheSBvciBhbm90aGVyLiBBbmQgbm93IHlvdSBzYXkgdGhhdAo+PiBvdmVybGFwcGluZyB3
b3VsZCBiZSBhIHByb2JsZW0uCj4+Cj4gCj4gSGVsbG8gS3J6eXN6dG9mLAo+IAo+IEkgZXhwbG9y
ZWQgYSBiaXQgbW9yZSB0aGUgcG9zc2libGUgdXNhZ2Ugb2YgYSBtZW1vcnkgcmVnaW9uIHRvIGRl
c2NyaWJlCj4gdGhlIHJhbmdlIGNvdmVyZWQgYnkgdGhlIFJJU0FCL0YgcGVyaXBoZXJhbHMuCj4g
Cj4gVG8gZGVzY3JpYmUgYm90aCB0aGUgcmFuZ2UgY292ZXJlZCBieSB0aGUgbWVtb3J5IGZpcmV3
YWxsIHVzaW5nIGEgbWVtb3J5Cj4gcmVnaW9uLCBJIHdvdWxkIG5lZWQgdG8gaGF2ZSBzdWNoIG5v
ZGUgYXQgU29DIERUIGxldmVsOgo+IAo+ICDCoMKgwqDCoCByZXNlcnZlZC1tZW1vcnkgewo+ICDC
oMKgwqDCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ICDCoMKgwqDCoMKgwqDCoCAj
c2l6ZS1jZWxscyA9IDwyPjsKPiAgwqDCoMKgwqDCoMKgwqAgcmFuZ2VzOwo+IAo+ICDCoMKgwqDC
oMKgwqDCoCAvKiBSYW5nZSBjb3ZlcmVkIGJ5IFJJU0FGL0IgKi8KPiAgwqDCoMKgwqDCoMKgwqDC
oCBkZHI6IGRkckA4MDAwMDAwMCB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8
MHgwIDB4ODAwMDAwMDAgMHgxIDB4MDAwMDAwMDA+Owo+ICDCoMKgwqDCoMKgwqDCoMKgIH07Cj4g
IMKgwqDCoMKgfTsKPiAKPiBUaGUgUklTQUYvQiBwZXJpcGhlcmFscyBuZWVkIHRvIHJlZmVyZW5j
ZSBtZW1vcnkgcmVnaW9ucyBjb250YWluZWQgaW4KPiB0aGUgcmFuZ2Ugb2YgdGhlIG1lbW9yeSBp
dCBwcm90ZWN0cyBpbiBvcmRlciB0byBhcHBseSBhY2Nlc3MgcmlnaHRzCj4gdG8gdGhlc2UgcmVn
aW9uJ3MgcmFuZ2VzIGFwcHJvcHJpYXRlbHkuIFRoZXJlZm9yZSwgYWRkaW5nIHJlZ2lvbnMgbGlr
ZToKPiAKPiAgwqDCoMKgwqDCoMKgwqAgdGZtX2NvZGU6IHRmbS1jb2RlQDgwMDAwMDAwIHsKPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4ODAwMDAwMDAgMHgwIDB4MTAwMDAw
PjsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuby1tYXA7Cj4gIMKgwqDCoMKgwqDCoMKgIH07
Cj4gCj4gIMKgwqDCoMKgwqDCoMKgIGNtMzNfY3ViZV9mdzogY20zMy1jdWJlLWZ3QDgwMTAwMDAw
IHsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgwIDB4ODAxMDAwMDAgMHgwIDB4
ODAwMDAwPjsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuby1tYXA7Cj4gIMKgwqDCoMKgwqDC
oMKgIH07Cj4gCj4gIMKgwqDCoMKgwqDCoMKgIHRmbV9kYXRhOiB0Zm0tZGF0YUA4MDkwMDAwMCB7
Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDgwOTAwMDAwIDB4MCAweDEw
MDAwMD47Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm8tbWFwOwo+ICDCoMKgwqDCoMKgwqDC
oCB9Owo+ICDCoMKgwqDCoMKgwqDCoCAuLi4KPiAKPiBhdCBib2FyZCBsZXZlbC4gVGhlc2UgYXJl
IHJlZ2lvbnMgdGhhdCBjYW4gb3IgY2Fubm90IGJlIGFjY2Vzc2VkCj4gYnkgdGhlIExpbnV4IGtl
cm5lbCwgZGVwZW5kaW5nIG9uIHRoZSBhY2Nlc3MgcmlnaHRzLiBQcm9jZWVkaW5nIGxpa2UKPiB0
aGlzIHdvdWxkIGFsc28gZm9yY2UgdGhlIHVzYWdlIG9mIG1lbW9yeS1yZWdpb24tbmFtZXMgdG8g
YmUgYWJsZSB0bwo+IGRpZmZlcmVudGlhdGUgdGhlIFJhbmdlIG5vZGUgZnJvbSB0aGUgYWN0dWFs
IG1lbW9yeSByZWdpb25zLiBUaGUKPiBSSVNBRi9CIG5vZGUgd291bGQgbG9vayBsaWtlOgo+IAo+
ICDCoMKgwqDCoMKgwqDCoCByaXNhZjQ6IHJpc2FmQDQyMGQwMDAwIHsKPiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInN0LHN0bTMybXAyNS1yaXNhZi1lbmMiOwo+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDQyMGQwMDAwIDB4MTAwMD47Cj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY2xvY2tzID0gPCZyY2MgQ0tfQlVTX1JJU0FGND47Cj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbWVtb3J5LXJlZ2lvbiA9IDwmZGRyPiwgPCZ0Zm1fY29kZT4sIDwmY20z
M19jdWJlX2Z3PiwgCj4gPCZ0Zm1fZGF0YT4KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtZW1v
cnktcmVnaW9uLW5hbWVzID0gInJhbmdlIiwgInRmbS1jb2RlIiwgLi4uCj4gIMKgwqDCoMKgwqDC
oMKgIH07Cj4gCj4gTm90aWNlIHRoYXQgdGhlIHRmbV9jb2RlIHJlZ2lvbiBoZXJlIHNoYXJlIHRo
ZSBzYW1lIGJhc2UgYWRkcmVzcwo+IGFzIHRoZSBub2RlIHVzZWQgdG8gZGVzY3JpYmUgdGhlIHJh
bmdlIGNvdmVyZWQuIFRoaXMgd291bGQgcmVzdWx0Cj4gaW4gdGhlIGZvbGxvd2luZyBlcnJvciBm
cm9tIERUQzoKPiAKPiB4eHguZHRzaToxMDkuMjEtMTEyLjU6IFdhcm5pbmcgKHVuaXF1ZV91bml0
X2FkZHJlc3NfaWZfZW5hYmxlZCk6IC8gCj4gcmVzZXJ2ZWQtbWVtb3J5L2RkckA4MDAwMDAwMDog
ZHVwbGljYXRlIHVuaXQtYWRkcmVzcyAoYWxzbyB1c2VkIGluIAo+IG5vZGUgL3Jlc2VydmVkLW1l
bW9yeS90Zm0tY29kZUA4MDAwMDAwMCkuCj4gCj4gSW4gb3JkZXIgdG8gdXNlIGl0IHRoYXQgd2F5
LCBJIHdvdWxkIG5lZWQgdG8gZm9yY2Uta2VlcCB0aGUgZGRyIG5vZGUKPiBkaXNhYmxlZCBhdCBh
bGwgdGltZSBhbmQgdXNlIGl0IG9ubHkgdG8gZXh0cmFjdCB0aGUgcmVnIGl0IGRlc2NyaWJlcy4K
PiBXaGljaCBmZWVscyB3ZWlyZCB0byBoYXZlIGEgbm9kZSB0aGF0IGNhbiBuZXZlciBiZSBlbmFi
bGVkLgo+IAo+IEFsc28gbm90ZSB0aGF0LCBmb3Igb3VyIGVjb3N5c3RlbSwgdGhlc2UgMHg4MDAw
MDAwMCAtPiAweDg0MDAwMDAwCj4gcmVnaW9ucyBhcmUgaW5hY2Nlc3NpYmxlIHNvIGl0IHdhcyBz
aW1wbGlmaWVkIHRvIChJJ2QgcHJlZmVyIHRvCj4gZGVzY3JpYmUgdGhlbSBhbGwgQlRXKToKPiAK
PiAgwqDCoMKgwqDCoMKgwqAgZndAODAwMDAwMDAgewo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbXBhdGlibGUgPSAic2hhcmVkLWRtYS1wb29sIjsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZWcgPSA8MHgwIDB4ODAwMDAwMDAgMHgwIDB4NDAwMDAwMD47Cj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgbm8tbWFwOwo+ICDCoMKgwqDCoMKgwqDCoCB9Owo+IAo+IGF0IGJvYXJkIGxldmVs
IChlLmc6IGFyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1N2YtZXYxLmR0cykuCj4gVGhh
dCBpcyBjb21wbGV0ZWx5IHVwIHRvIHRoZSB1c2VyIHRvIGRlZmluZSBpdHMgbWVtb3J5IG1hcHBp
bmcgYW5kIGl0cwo+IGFjY2VzcyByaWdodHMgcGVyLXJlZ2lvbi4gT25lIGNvdWxkIHVzZSB0aGUg
bG93ZXIgRERSIGZvciBzb21lIG90aGVyCj4gdXNhZ2UuCj4gCj4+IFlvdSBkbyB1bmRlcnN0YW5k
IHlvdSBkbyBub3QgaGF2ZSB0byByZXNlcnZlIHRoZSBtZW1vcnksIHJpZ2h0PyBZb3UgYXJlCj4+
IGRvaW5nIG9ubHkgeW91ciBzcGVjaWZpYyBtYXBwaW5nIGZvciB0aGF0IHJlZ2lvbi4KPj4KPiAK
PiBZZXMsIHVuZGVyc3Rvb2QuCj4gCj4+Pgo+Pj4gwqDCoMKgwqBtZW1vcnlAODAwMDAwMDAgewo+
Pj4gwqDCoMKgwqDCoMKgwqAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPj4+IMKgwqDCoMKgwqDC
oMKgIHJlZyA9IDwweDAgMHg4MDAwMDAwMCAweDEgMHgwPjsKPj4+IMKgwqDCoMKgfTsKPj4+Cj4+
PiDCoMKgwqDCoHJlc2VydmVkLW1lbW9yeSB7Cj4+PiDCoMKgwqDCoMKgwqDCoCAjYWRkcmVzcy1j
ZWxscyA9IDwyPjsKPj4+IMKgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDI+Owo+Pj4gwqDC
oMKgwqDCoMKgwqAgcmFuZ2VzOwo+Pj4KPj4+IMKgwqDCoMKgwqDCoMKgIHJpc2FmX3JhbmdlOiBy
aXNhZi1yYW5nZUA4MDAwMDAwMCB7Cj4+Cj4+IFRoZXJlIGlzIG5vIGNvbXBhdGlibGUgaGVyZS4u
Lgo+IAo+IFRoZXJlJ3Mgbm8gbmVlZCBmb3IgYSBjb21wYXRpYmxlIGZvciBhIHJlc2VydmVkIG1l
bW9yeT8KPiAKPj4KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDgwMDAw
MDAwIDB4MCAweDgwMDAwMDAwPjsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbm8tbWFwOwo+
Pgo+PiBBbmQgd2h5IG5vLW1hcHBpbmc/IElzbid0IHRoZSBwb2ludCBvZiB0aGUgYmxvY2sgaXMg
dG8gaGF2ZSBpdCBhcyBtYWluCj4+IHN5c3RlbSBtZW1vcnk/Cj4gTWFpbiBzeXN0ZW0gbWVtb3J5
IGlzIGRlc2NyaWJlZCB1c2luZyB0aGUgbWVtb3J5IG5vZGU6Cj4gCj4gIMKgwqDCoMKgbWVtb3J5
QDgwMDAwMDAwIHsKPiAgwqDCoMKgwqDCoMKgwqAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPiAg
wqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAweDgwMDAwMDAwIDB4MSAweDA+Owo+ICDCoMKgwqDC
oH07Cj4gCj4gdGhpcyBvbmUgaXMgdXNlZCB0byBkZXNjcmliZSB0aGUgcG9zc2libGUgbWVtb3J5
IHJhbmdlIGNvdmVyZWQgYnkgdGhlCj4gUklTQUYsIHdoaWNoIGNhbiBiZSBzdXBlcmlvciB0byB0
aGUgRERSIHNpemUgZGVwZW5kaW5nIG9uIHRoZSBjaG9pY2Ugb2YKPiB0aGUgdXNlciBmb3IgaXQn
cyBERFIsIHNvIHdlIHNob3VsZG4ndCBtYXAgdGhpcyByZWdpb24uCj4gCj4gQXMgc3RhdGVkIGJl
Zm9yZSwgSSBuZWVkIGEgd2F5IHRvIGRlc2NyaWJlIHRoZSByYW5nZSBjb3ZlcmVkIGJ5IHRoZSAK
PiBSSVNBQi9GLCB3aGljaCBtYXkgbm90IHJlZmxlY3Qgd2hhdCBtZW1vcnkgY2FuIGJlIHVzZWQg
b3Igbm90IGJ5IHRoZQo+IGN1cnJlbnQgZXhlY3V0aW9uIGNvbnRleHQuIEhlbmNlIHVzaW5nIGEg
cHJvcHJpZXRhcnkgcHJvcGVydHkgdG8gYXZvaWQKPiBjb25mdXNpb24gaW4gdGhlIERUIGFuZCBz
aW1wbGlmeWluZyB3aGF0IGlzIHRoZSByYW5nZSBjb3ZlcmVkIGFuZCB3aGF0Cj4gYXJlIHRoZSBt
ZW1vcnkgcmVnaW9uIGFjdHVhbGx5IGNvbmZpZ3VyZWQuCj4gCj4gQmVzdCByZWdhcmRzLAo+IEdh
dGllbgo+IAo+Pgo+Pj4gwqDCoMKgwqDCoMKgwqAgfTsKPj4+IMKgwqDCoMKgfQo+Pj4KPj4KPj4K
Pj4KPj4gQmVzdCByZWdhcmRzLAo+PiBLcnp5c3p0b2YKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
