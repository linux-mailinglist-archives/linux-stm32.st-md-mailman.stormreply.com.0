Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ol0F4uXuWkJKwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 19:03:55 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C80EF2B086B
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 19:03:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69920C87EDE;
	Tue, 17 Mar 2026 18:03:54 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FC27C87ED8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 18:03:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SB0O2dFwgxeOOlox6Dfsc+aqBrrVl2Xe6XQrKHgJzSpcbB8LYu5b4zVCpn8FqLYsb8GyvdRXmi9kxE1YSCCvzI4LQfojhw4uJ2hzUcP+S/E9WBS+sImORopwwkn+FB4ffM4jfrgF5h+62YtPJMLPzTmHCiFy3qqqF7gs/MODvlArg14D8H7BlXl/K8LwjMomVEwT6Abx6smYWAHkhhjAYo/eFn/5TPxvm4jCfCjc8Zf8srg93U0usnCsarnQ1hcXhwFNxym40FQctGM9690UQvv6mgVOGH0yZ3JOc42Ly2fxEvnw8SiWlC2qcpelugKIhOAhJq88V/iushyHDHTcAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MPH/2TVb+G7IyWo6jXI6IP6WTqNJsSi4anEcn8iTP4I=;
 b=UqTEG7mtm6wQnAvE1rSsJaPDBj5xb19dyRi2tqgvCIuwE2Su/smp+0wrJ10XV0ypv8vMkNkm3/GAJe/QcpXotOyCZiJSNJ3hfy5LEahdC6tg/HrL1qGOo9qpKbnUnlgb3NzZRo8LT8j3i49SIcR35T8Eeik+W/bfsuAp/8lOnVsQ7ufZATZmWR591zpZcSsMFLbtvt8eurm4L0WddzNoLTN5BO9gmJ3R02rkmy3V1d49tN8PzDalBFYgNOeY70Pt9drgh++AXkNwaXJ8kAwZCfNKg3OXA50k445mvdTokP7xPQnH2QFzELQE2WPrV2LZB4zL4MTpMsem4jpJu46v6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MPH/2TVb+G7IyWo6jXI6IP6WTqNJsSi4anEcn8iTP4I=;
 b=N2TTnePJEs034Sb+kjPzcVQrhvKvGDy0Yl02s+pCeTc+V+YrOTeNjwqcAotAAfumbYV0Pai9yH2u6BmzrGdRwfDllkvCd9VsBsxEoLihtRJwUzIkMLTnXlsVyj8c/yKu23llbBjQcPNL45lo5L3cuzkW9cCJVDX6E41ORgiWxRr0zFGq6J/6DR6G/zndqy9w4boUKRYS00fbNgqHJGZN0ubxHBQm5RrLdy8Hz/zZBrzim/sYK1XioCHCctEkm+nZYUStZ5MIf86lY/lO8FZF+64hIPLexdDU+ugb592oSIEB3Vy+Poc46dg/tFIFWtJa314tr3vydYUfQVQuqunrng==
Received: from CWLP123CA0203.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::13)
 by AM0PR10MB9671.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:740::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Tue, 17 Mar
 2026 18:03:49 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:400:19c:cafe::a4) by CWLP123CA0203.outlook.office365.com
 (2603:10a6:400:19c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Tue,
 17 Mar 2026 18:03:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 18:03:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 19:06:23 +0100
Received: from localhost (10.252.21.194) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 19:03:48 +0100
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Date: Tue, 17 Mar 2026 19:03:21 +0100
Message-ID: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.252.21.194]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|AM0PR10MB9671:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c458646-b2f9-4613-9d33-08de844f8a64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|30052699003|36860700016|1800799024|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: DwW/YRRPQ6FlZNiRps0OklgE0CmOaaUHGOwM+wUemRwgubg3K7aZ7VKxAzsPx2hE/afyFD1OvEDFji331dbPZTTF4usowRPSQt1bVLd4oc3YlRs3zfq7rt5b8VLwWwm6IHnp8QIbdra4ifa4D1EmJylAhT6QZ6D2nvlGzYtx/lsnwJoUBscuztrUmQzjwiO4UtbB7JpMbSQ5Mwe/1GNwjHwyX2IQfzO+4kPSW6dgwmaTwZX3mjtb00GKZghWOmfzKbAkecsxuiolYo5IDp+/iRP3c5E7EGvmcqp04dZECA7E22rRQxu0APvZ5YI7iUXqp5PmA/CaY6+bAlP9VvOi7y30eSOwFrzDG7+jGwg+yv1RuN3Uz6Jv56hkoEvir57+kIABJN8/jF4cni1DR8LVqcDLYwJo5pL7KMPP3nmthCVzCeugxswfeLX+RU/JGLR6X1JYn0JW6lY0URSBNEEYG5AEgmvlAQk1H89st2EAAa+uXrGx4L9EJHfqtugLE0LM5MOz9mEtEHaT8OP4+guFzd9dR8SGsG4sPg31AG/i8d9d/7V63TAmPXpon5Pspjynt7n06bEZTjTgi4baMmCk9Uj5dekATC11CZTJwkQFBnC7GFZo/jVGSaRL+Z+BytUl08S0SsBvu8CSjc97e6tBq26OhPfv5RUhAW7hQvS8h8Wiqtf0+amiCVBtUS57twjslPi45Y4Tgn40JqHkJb6lzehlCBmzqbe7rhI+iEjj6Bs=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(30052699003)(36860700016)(1800799024)(13003099007)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hjeuJk8782NBkRBaNxKZQwBtvN7hoHqM9hc/3umZNKCASGkZqv5dgdhAZzuDa81caVgnxiQ0dUNyBSXm3vnrHCOzBKjNRcYMlpbrQbIF/54c97rVZzTEA+aJiJeMHHbHDrGKAMY9I2IiR5TKA3BWxayNA5NC8q32CG64KgJOoDqaah39yasTZ5nUDIMnUJsNPrnX+kr7+6gW6vt+Xd2b2CcMZoBA15bi+kJirSEMnmYvN40nW7r0ODzPm3NR8NYREGv0jPfJjeJdrSiFwVt9OfMTY84kNgQZR4B0A8qAUnLZAtBo8oLZPjkpVPN+ufM/ENepHHRzRVT6L7EsYjxKMRL6Yqs6M+AZ6hq8D9hm/fR3gUajFA3lUQvluZLX7A8d9sHSsPmYn6AspLKatgVQv6XpHRB7QBwAs68tJ8o8kXNyMAL4c2ASmWmFIeQTur+b
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 18:03:49.1437 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c458646-b2f9-4613-9d33-08de844f8a64
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9671
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v21 0/6] Introduction of a remoteproc tee to
	load signed firmware
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
X-Spamd-Result: default: False [5.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:jens.wiklander@linaro.org,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:op-tee@lists.trustedfirmware.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:url,sign_rproc_fw.py:url,foss.st.com:mid,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C80EF2B086B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Ck1haW4gdXBkYXRlcyBmcm9tIHZlcnNpb24gVjIwWzRdOgotLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpUbyBhZGRyZXNzIFJvYuKAmXMgY29uY2VybiBvbiB2MjBjb25jZXJuaW5nIHJl
c291cmNlIGRlY2xhcmF0aW9uIHVuZGVyIHRoZQp0ZWUgbm9kZSwgdGhlIGRldmljZSB0cmVlIGlz
IG5vdyBzdHJ1Y3R1cmVkIGFzIGZvbGxvd3MscmVwbGFjaW5nIHRoZQpjaGlsZC1wYXJlbnQgaGll
cmFyY2h5IHdpdGggYSBwaGFuZGxlOgoKICAgIGZpcm13YXJlIHsKICAgICAgICB0ZWVfcnByb2M6
IG9wdGVlLXJwcm9jIHsKICAgICAgICAgICAgY29tcGF0aWJsZSA9ICI4MGE0YzI3NS0wYTQ3LTQ5
MDUtODI4NS0xNDg2YTk3NzFhMDgiOwogICAgICAgIH07CiAgICB9OwoKICAgIG00OiBtNEAwIHsK
ICAgICAgY29tcGF0aWJsZSA9ICJzdCxzdG0zMm1wMS1tNC10ZWUiOwogICAgICByZWcgPSA8MCAw
PjsKCiAgICAgIG1ib3hlcyA9IDwmaXBjYyAwPiwgPCZpcGNjIDE+LCA8JmlwY2MgMj47CiAgICAg
IG1ib3gtbmFtZXMgPSAidnEwIiwgInZxMSIsICJzaHV0ZG93biI7CgogICAgICBtZW1vcnktcmVn
aW9uID0gPCZ2ZGV2MHZyaW5nMD4sIDwmbV9pcGNfc2htPiwgPCZtY3VyYW0yPiwKICAgICAgICAg
ICAgICAgICAgICAgIDwmdmRldjB2cmluZzE+LCA8JnZkZXYwYnVmZmVyPiwgPCZyZXRyYW0+OwoK
ICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmZXh0aT47CiAgICAgIGludGVycnVwdHMgPSA8Njgg
MT47CgogICAgICBycHJvYy10ZWUtcGhhbmRsZSA9IDwmdGVlX3Jwcm9jIDA+OwogICAgICBzdCxh
dXRvLWJvb3Q7CiAgICAgIHdha2V1cC1zb3VyY2U7CgogICAgICBzdGF0dXMgPSAib2theSI7CiAg
ICB9OwoKQXMgYSBjb25zZXF1ZW5jZSwgdGhpcyB2ZXJzaW9uOgotIFVwZGF0ZXMgdGhlIGRldmlj
ZSB0cmVlIGFuZCBiaW5kaW5ncyB0bzoKICAtIENoYW5nZSB0aGUgY29tcGF0aWJsZSBwcm9wZXJ0
eSBmcm9tCiAgICAicnByb2Mtc2VydmljZS04MGE0YzI3NS0wYTQ3LTQ5MDUtODI4NS0xNDg2YTk3
NzFhMDgiIHRvCiAgICAiODBhNGMyNzUtMGE0Ny00OTA1LTgyODUtMTQ4NmE5NzcxYTA4Ii4KICAt
IFVzZSB0aGUgcnByb2MtdGVlLXBoYW5kbGUgdG8gYXZvaWQgdGhlIHBhcmVudC1jaGlsZCBoaWVy
YXJjaHkuCi0gVXBkYXRlcyBzdG0zMl9ycHJvY190ZWUuYyBhbmQgcmVtb3RlcHJvY190ZWUuYyB0
byBhZGFwdCB0byB0aGUgbmV3IGJpbmRpbmdzLgotIFVwZGF0ZXMgcmVtb3RlcHJvY190ZWUuYyB0
byBjb21wdXRlIHRoZSBkZXZpY2UgdHJlZSBjb21wYXRpYmxlIHN0cmluZyBmcm9tCiAgdGhlIFRF
RSBVVUlELgoKTWFpbiB1cGRhdGVzIGZyb20gdmVyc2lvbiBWMTlbM106Ci0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tClRoZSBkZXZpY2V0cmVlIGlzIG5vdyBzdHJ1Y3R1cmVkIGFzIGZv
bGxvd3M6CgoJZmlybXdhcmUgewoJCW9wdGVlIHsKCQkJY29tcGF0aWJsZSA9ICJsaW5hcm8sb3B0
ZWUtdHoiOwoJCQltZXRob2QgPSAic21jIjsKCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47CgkJCSNz
aXplLWNlbGxzID0gPDA+OwoJCQlycHJvYy1zZXJ2aWNlQDAgewoJCQkJY29tcGF0aWJsZSA9ICJy
cHJvYy1zZXJ2aWNlLTgwYTRjMjc1LTBhNDctNDkwNS04Mjg1LTE0ODZhOTc3MWEwOCI7CgkJCQly
ZWcgPSA8MD47CgkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsKCQkJCSNzaXplLWNlbGxzID0gPDA+
OwoJCQkJc3RhdHVzID0gIm9rYXkiOwoJCQkJbTQ6IG00QDAgewoJCQkJCWNvbXBhdGlibGUgPSAi
c3Qsc3RtMzJtcDE1LW00LXRlZSI7CgkJCQkJcmVnID0gPDA+OwoJCQkJCW1ib3hlcyA9IDwmaXBj
YyAwPiwgPCZpcGNjIDE+LCA8JmlwY2MgMj47CgkJCQkJbWJveC1uYW1lcyA9ICJ2cTAiLCAidnEx
IiwgInNodXRkb3duIjsKCQkJCQltZW1vcnktcmVnaW9uID0gPCZ2ZGV2MHZyaW5nMD4sCTwmbV9p
cGNfc2htPiwgPCZtY3VyYW0yPiwKCQkJCQkJCTwmdmRldjB2cmluZzE+LCA8JnZkZXYwYnVmZmVy
PiwgPCZyZXRyYW0+OwoJCQkJCWludGVycnVwdC1wYXJlbnQgPSA8JmV4dGk+OwoJCQkJCWludGVy
cnVwdHMgPSA8NjggMT47CgkJCQkJc3RhdHVzID0gIm9rYXkiOwoJCQkJfTsKCQkJfTsKCQl9OwoJ
fTsKCkFzIGEgY29uc2VxdWVuY2UsIHRoaXMgdmVyc2lvbjoKCi0gSW50cm9kdWNlcyBhIG5ldyBz
dG0zMl9ycHJvY190ZWUuYyByZW1vdGVwcm9jIGRyaXZlci4KCiAgSW5zdGVhZCBvZiBmdXJ0aGVy
IGNvbXBsaWNhdGluZyB0aGUgZXhpc3Rpbmcgc3RtMzJfcnByb2MuYyBkcml2ZXIsIGEKICBkZWRp
Y2F0ZWQgVEVFLWJhc2VkIGRyaXZlciBpcyBhZGRlZC4gQm90aCBkcml2ZXJzIGFyZSBpbnRlbmRl
ZCB0byBhbHNvCiAgc3VwcG9ydCB0aGUgU1RNMzJNUDJ4IENvcnRleC1NMzMgcmVtb3RlIHByb2Nl
c3NvciBpbiBhIG5leHQgc3RlcC4KCi0gUmV3b3JrcyB0aGUgYmluZGluZ3M6CiAgLSBEcm9wIHRo
ZSBzdCxzdG0zMi1ycHJvYy55YW1sIHVwZGF0ZXMgdGhhdCB3ZXJlIGludHJvZHVjZWQgaW4gcHJl
dmlvdXMKICAgIHJldmlzaW9ucy4KICAtIEFkZCByZW1vdGVwcm9jLXRlZS55YW1sIGZvciB0aGUK
ICAgICJycHJvYy1zZXJ2aWNlLTgwYTRjMjc1LTBhNDctNDkwNS04Mjg1LTE0ODZhOTc3MWEwOCIg
Y29tcGF0aWJsZS4KICAtIEFkZCBzdCxzdG0zMi1ycHJvYy10ZWUueWFtbCBmb3IgdGhlICJzdCxz
dG0zMm1wMTUtbTQtdGVlIiBjb21wYXRpYmxlLgoKLSBSZXdvcmtzIHRoZSBwcm9iaW5nIHNlcXVl
bmNlOgoKICBUaGUgbTRAMCBkZXZpY2UgaXMgbm93IHByb2JlZCBieSB0aGUgcmVtb3RlcHJvYy10
ZWUgZHJpdmVyLCB3aGljaCBpdHNlbGYKICBpcyBpbnN0YW50aWF0ZWQgYnkgdGhlIFRFRSAoT1At
VEVFKSBidXMuCgoKTWFpbiB1cGRhdGVzIGZyb20gdmVyc2lvbiBWMThbMl06Ci0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0gcmV3b3JrIGRvY3VtZW50YXRpb24gZm9yIHRoZSByZWxl
YXNlX2Z3IG9wcyAKLSByZXdvcmsgZnVuY3Rpb24gZG9jdW1lbnRhdGlvbiBpbiByZW1vdGVwcm9j
X3RlZS5jCi0gcmVwbGFjZSBzcGlubG9jayBieSBtdXRleCBhbmQgZ2VuZXJhbGl6ZSB1c2FnZSBp
biByZW1vdGVwcm9jX3RlZS5jCgoKTWFpbiB1cGRhdGVzIGZyb20gdmVyc2lvbiBWMTdbMV06Ci0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0gRml4OiAgd2FybmluZzogRVhQT1JUX1NZ
TUJPTCgpIGlzIHVzZWQsIGJ1dCAjaW5jbHVkZSA8bGludXgvZXhwb3J0Lmg+CiAgaXMgbWlzc2lu
ZwoKCk1vcmUgZGV0YWlscyBhcmUgYXZhaWxhYmxlIGluIGVhY2ggcGF0Y2ggY29tbWl0IG1lc3Nh
Z2UuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmVtb3RlcHJvYy8yMDI1MDYx
MzA5MTY1MC4yMzM3NDExLTEtYXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNvbS8KWzJdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJlbW90ZXByb2MvMjAyNTA2MTYwNzU1MzAuNDEwNjA5
MC0xLWFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20vClszXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1kZXZpY2V0cmVlLzIwMjUwNjI1MDk0MDI4Ljc1ODAxNi0xLWFybmF1ZC5wb3Vs
aXF1ZW5AZm9zcy5zdC5jb20vClszXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yZW1v
dGVwcm9jLzIwMjUxMjE3MTUzOTE3LjM5OTg1NDQtMS1hcm5hdWQucG91bGlxdWVuQGZvc3Muc3Qu
Y29tLwoKClRlc3RlZC1vbjoKLS0tLS0tLS0tCmNvbW1pdCAxZjMxOGI5NmNjODQgKCJMaW51eCA3
LjAtcmMzIikKCkRlc2NyaXB0aW9uIG9mIHRoZSBmZWF0dXJlOgotLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQpUaGlzIHNlcmllcyBwcm9wb3NlcyB0aGUgaW1wbGVtZW50YXRpb24gb2YgYSByZW1v
dGVwcm9jIHRlZSBkcml2ZXIgdG8KY29tbXVuaWNhdGUgd2l0aCBhIFRFRSB0cnVzdGVkIGFwcGxp
Y2F0aW9uIHJlc3BvbnNpYmxlIGZvciBhdXRoZW50aWNhdGluZwphbmQgbG9hZGluZyB0aGUgcmVt
b3RlcHJvYyBmaXJtd2FyZSBpbWFnZSBpbiBhbiBBcm0gc2VjdXJlIGNvbnRleHQuCgoxKSBQcmlu
Y2lwbGU6CgpUaGUgcmVtb3RlcHJvYyB0ZWUgZHJpdmVyIHByb3ZpZGVzIHNlcnZpY2VzIHRvIGNv
bW11bmljYXRlIHdpdGggdGhlIE9QLVRFRQp0cnVzdGVkIGFwcGxpY2F0aW9uIHJ1bm5pbmcgb24g
dGhlIFRydXN0ZWQgRXhlY3V0aW9uIENvbnRleHQgKFRFRSkuClRoZSB0cnVzdGVkIGFwcGxpY2F0
aW9uIGluIFRFRSBtYW5hZ2VzIHRoZSByZW1vdGUgcHJvY2Vzc29yIGxpZmVjeWNsZToKCi0gYXV0
aGVudGljYXRpbmcgYW5kIGxvYWRpbmcgZmlybXdhcmUgaW1hZ2VzLAotIGlzb2xhdGluZyBhbmQg
c2VjdXJpbmcgdGhlIHJlbW90ZSBwcm9jZXNzb3IgbWVtb3JpZXMsCi0gc3VwcG9ydGluZyBtdWx0
aS1maXJtd2FyZSAoZS5nLiwgVEYtTSArIFplcGh5ciBvbiBhIENvcnRleC1NMzMpLAotIG1hbmFn
aW5nIHRoZSBzdGFydCBhbmQgc3RvcCBvZiB0aGUgZmlybXdhcmUgYnkgdGhlIFRFRS4KCjIpIEZv
cm1hdCBvZiB0aGUgc2lnbmVkIGltYWdlOgoKUmVmZXIgdG86Cmh0dHBzOi8vZ2l0aHViLmNvbS9P
UC1URUUvb3B0ZWVfb3MvYmxvYi9tYXN0ZXIvdGEvcmVtb3RlcHJvYy9zcmMvcmVtb3RlcHJvY19j
b3JlLmMjTDE4LUw1NwoKMykgT1AtVEVFIHRydXN0ZWQgYXBwbGljYXRpb24gQVBJOgoKUmVmZXIg
dG86Cmh0dHBzOi8vZ2l0aHViLmNvbS9PUC1URUUvb3B0ZWVfb3MvYmxvYi9tYXN0ZXIvdGEvcmVt
b3RlcHJvYy9pbmNsdWRlL3RhX3JlbW90ZXByb2MuaAoKNCkgT1AtVEVFIHNpZ25hdHVyZSBzY3Jp
cHQKClJlZmVyIHRvOgpodHRwczovL2dpdGh1Yi5jb20vT1AtVEVFL29wdGVlX29zL2Jsb2IvbWFz
dGVyL3NjcmlwdHMvc2lnbl9ycHJvY19mdy5weQoKRXhhbXBsZSBvZiB1c2FnZToKc2lnbl9ycHJv
Y19mdy5weSAtLWluIDxmdzEuZWxmPiAtLWluIDxmdzIuZWxmPiAtLW91dCA8c2lnbmVkX2Z3LnNp
Z24+IC0ta2V5ICR7T1AtVEVFX1BBVEh9L2tleXMvZGVmYXVsdC5wZW0KCgo1KSBJbXBhY3Qgb24g
VXNlciBzcGFjZSBBcHBsaWNhdGlvbgoKTm8gc3lzZnMgaW1wYWN0LiBUaGUgdXNlciBvbmx5IG5l
ZWRzIHRvIHByb3ZpZGUgdGhlIHNpZ25lZCBmaXJtd2FyZSBpbWFnZQppbnN0ZWFkIG9mIHRoZSBF
TEYgaW1hZ2UuCgoKRm9yIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhlIGltcGxlbWVudGF0aW9u
LCBhIHByZXNlbnRhdGlvbiBpcyBhdmFpbGFibGUgaGVyZQoobm90ZSB0aGF0IHRoZSBmb3JtYXQg
b2YgdGhlIHNpZ25lZCBpbWFnZSBoYXMgZXZvbHZlZCBiZXR3ZWVuIHRoZSBwcmVzZW50YXRpb24K
YW5kIHRoZSBpbnRlZ3JhdGlvbiBpbiBPUC1URUUpLgoKaHR0cHM6Ly9yZXNvdXJjZXMubGluYXJv
Lm9yZy9lbi9yZXNvdXJjZS82YzViR3Zad1VBalg1NmZ2eHRoeGRzCgpBcm5hdWQgUG91bGlxdWVu
ICg2KToKICBkdC1iaW5kaW5nczogZmlybXdhcmU6IEFkZCBURUUgcmVtb3RlcHJvYyBzZXJ2aWNl
IGJpbmRpbmcKICBkdC1iaW5kaW5nczogcmVtb3RlcHJvYzogQWRkIFNUTTMyIFRFRS1jb250cm9s
bGVkIHJwcm9jIGJpbmRpbmcKICByZW1vdGVwcm9jOiBjb3JlOiBJbnRyb2R1Y2UgcnByb2NfcGFf
dG9fdmEgaGVscGVyCiAgcmVtb3RlcHJvYzogSW50cm9kdWNlIG9wdGlvbmFsIHJlbGVhc2VfZncg
b3BlcmF0aW9uCiAgcmVtb3RlcHJvYzogQWRkIFRFRSBzdXBwb3J0CiAgcmVtb3RlcHJvYzogc3Rt
MzI6IEFkZCBURUUtY29udHJvbGxlZCBTVE0zMiBkcml2ZXIKCiAuLi4vYmluZGluZ3MvcmVtb3Rl
cHJvYy9yZW1vdGVwcm9jLXRlZS55YW1sICAgfCAgMzYgKwogLi4uL3JlbW90ZXByb2Mvc3Qsc3Rt
MzItcnByb2MtdGVlLnlhbWwgICAgICAgIHwgMTA4ICsrKwogZHJpdmVycy9yZW1vdGVwcm9jL0tj
b25maWcgICAgICAgICAgICAgICAgICAgIHwgIDEwICsKIGRyaXZlcnMvcmVtb3RlcHJvYy9NYWtl
ZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMyArLQogZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90
ZXByb2NfY29yZS5jICAgICAgICAgIHwgIDUyICsrCiBkcml2ZXJzL3JlbW90ZXByb2MvcmVtb3Rl
cHJvY19pbnRlcm5hbC5oICAgICAgfCAgIDYgKwogZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXBy
b2NfdGVlLmMgICAgICAgICAgIHwgODEwICsrKysrKysrKysrKysrKysrKwogZHJpdmVycy9yZW1v
dGVwcm9jL3N0bTMyX3Jwcm9jX3RlZS5jICAgICAgICAgIHwgNTM3ICsrKysrKysrKysrKwogaW5j
bHVkZS9saW51eC9yZW1vdGVwcm9jLmggICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIGluY2x1
ZGUvbGludXgvcmVtb3RlcHJvY190ZWUuaCAgICAgICAgICAgICAgICB8ICA5MSArKwogMTAgZmls
ZXMgY2hhbmdlZCwgMTY1OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90ZXByb2MvcmVt
b3RlcHJvYy10ZWUueWFtbAogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL3N0LHN0bTMyLXJwcm9jLXRlZS55YW1sCiBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfdGVlLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfcnByb2NfdGVlLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3JlbW90ZXByb2NfdGVlLmgKCgpiYXNlLWNvbW1pdDog
MWYzMThiOTZjYzg0ZDdjMmFiNzkyZmNjMGJmZDQyYTdjYTg5MDY4MQotLSAKMi40My4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBt
YWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRw
czovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1z
dG0zMgo=
