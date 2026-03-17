Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oHIiAhJduWnYAgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 14:54:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 919522AB466
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Mar 2026 14:54:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CB20C87ED8;
	Tue, 17 Mar 2026 13:54:25 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4560CC7A831
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Mar 2026 13:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqThbOnFQ8/SlDMtiUWjR9WZ3ATg2FYepBTcEpg+fSNBu1zBXcvGbLsz1GwmRWSvJlIhm5WJRvHeP/u+8K9GGCwZwIkrIrSZeAnQMQyfkZ5YBLzr4/pXrB11GYL7Z/GPC12p9+oR/jsw7GSePq3++4UdqyRTAxKUXiaPXoAAhT5IP90qgJJQtiqj/PDyViRSXqVKQDbVztdUh52pFNDrfOVmMKIgx9CsKtnCcRny2Q/Lpz7HbfyoEI5I/37PadnGbwSR94PTDkXL6JZtp3Qp9hPCsv+sRyNAHKJo7nafTdtozXhd9/6uqUG02I1OKThk30smYqktio2ojIFWJrKBow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8vW9QFHEsbdwF3sZuZYLNzmqqdLN09PcEnZ1dPYIV0=;
 b=k7OwV4RggN4Ch/OhZVZDDjgEcWNpApl/udsYwI9n9HoItWgfgyfo9oMP4hcHginn5YYHJqPP3sKu/V1nwLdyPPbcuzYkisKR2zlFTpHT6h0Q0I6h3RUrTKiRfKnauWAFNgKxBNE9rtiSJZCz/BwDiCrLvpXxKKTXh7GmVUGZIn+Tt5WBDtjuDS2Y+7xmOzolDevs96IMPt1s88mj+wfEgjk30wH/Xfv6ai0fDwFLpyt1Eg5+HBw/G7p9SZpSC0l647+UPlOqV9cqFfXvjuAUB79s5mQ2Vn9BubKezOZwnLmYlYCU9L/MXMhciRZXkMZ9HWu0OUi0ZfoP8+j+Q1ZpeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=sang-engineering.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8vW9QFHEsbdwF3sZuZYLNzmqqdLN09PcEnZ1dPYIV0=;
 b=kfDjiaA6i0BZjlyHKa0nFI0yNOfc0zEKrJvBXWCpHiiwfUiOmvcI8qmBFegUQNt654SF5USEB/M9GfLMmbj/HwI5fuIfbx5gR853hLCDyJ9f1+cc30r5egEfPG8uX/8YfsZxPzznhZvnaPOmvRj0ijO1KD3HRSZlt4Nlq0OSNoEThXqPkIfYnJIQdIL/je9RopaznemXZ8hQUUERtyIDCahvyBJ4K3ssvtXqEZMAOUX41HC4lUhVjoLjZU3DNf0QK4TTMTeZcKK6X2SAp5V1RqAUaZKVsjo2Wl8BOxO1FawBKrWfchhEMQkmnMlL3pVs47eEGiPdBEKU5UVil6ZGQw==
Received: from DB9PR06CA0009.eurprd06.prod.outlook.com (2603:10a6:10:1db::14)
 by FRZPR10MB9918.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:1c9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 13:54:21 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::28) by DB9PR06CA0009.outlook.office365.com
 (2603:10a6:10:1db::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 13:54:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 13:54:20 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 14:56:53 +0100
Received: from [192.168.8.15] (10.48.87.74) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Mar
 2026 14:54:18 +0100
Message-ID: <dd21653b7343e261ec9c88c622c5facbba69df95.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 <linux-renesas-soc@vger.kernel.org>
Date: Tue, 17 Mar 2026 14:54:16 +0100
In-Reply-To: <20260310075539.11701-5-wsa+renesas@sang-engineering.com>
References: <20260310075539.11701-1-wsa+renesas@sang-engineering.com>
 <20260310075539.11701-5-wsa+renesas@sang-engineering.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.87.74]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009524:EE_|FRZPR10MB9918:EE_
X-MS-Office365-Filtering-Correlation-Id: ea234ec9-7203-461c-b3ee-08de842cb02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|7053199007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: AI6RG4Fx1UK97ITArYgTPro+HuBgaUhXw5pHiT1nDKsN1sThYItfefGOC35S28gXv2KuA2AOJn7lDPIfZAN1D3yD9c7U4i1KlKQlY53StGPCVd7YXzCPVzVwlxk7zdrWjAIKt6piU/I+aV3Ja2YE9hGLKAsQLnTqbGMa42oNxtVi2RTEH1vDufJf+6qvpdP3EnbYQpRl9hVd7Oj9xhY9ZZDILfrkqz+N9IYoS/+i53uwdUO6MGxuZZSKAfJwlaeAf/DfXJl79UFShAikn6M9VP9Fhm/J7ncNMQmwGEqQSQIm+yWcZzx5pSHRMf25zSH2aJOkhEZFyBt1zMDEacGbzDabOT8mMUFKQwrQU+qFpoiCFhwWrFbGf5s0kp+B0acPprHupJWW7iihE3Thi/SjXqa+n7o1VdbBGcW4nxuBzC21/u8eFRObQGmnlW90SQX2dqMgT+zfw7TDP3OUCsfJQEKvTMOvAk9QoogJoA1PWtX2TstTPwBNy6E+itbLMfMZgXh6bmdmz3ZtBk2Ja5b/4xvwE/0YLneNquW9l62MO6r+WA23tK2XOHnXQeK6h9iUJmS0LTJGtkb3fCT3ughg5fBEnpF31JR46Tvs9PYUknA6R3AERH+1F2ttxX+4vX2kCWIjA4uoml9ehB2+Bx1/knJCKsfH64AQkuqyCLpNfElbFlQzhyb45MSWWevoXXwFRwA2hPYK/yRBoXPoaijkLa6YbHSYBZWeVm0QLBgAZ2PrDk71pbj9b1PNvPs9dHju4xO3aL0HjECf3E7vFVfJzg==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(7053199007)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RmGw/7gVYBpsqbXd3U8AA7L9iVS99zZwjEk3NUyTsgI249tGBZGzN0ZFy4R3bdmMt1RsAqU5dT9Wl5DNQwn+UKl7KkdaN9vpTIvGziowzg3h+rLbJxGwDpvu8kocMRTaCt9nWgDRcNw3kWeZoWY+2D+m3Yl/y0Trmm6QAo00YiL8knSehHPhZh1+EWreR0sI3T8y/pte3YJWGa6aes3M+GWr+TtVcI0/lV0rxVwlipmowIDcKozAZT16A0u/Xe1KRuxO5cXF+eaM5LQj4p/VoX8qTgOfReYQ3/Q30YtNfJ34WpRQNU3e4jce6TWVjgnm34jdtKm+Jqn0G3ktRNfh0jaiiTF46z1tbmi/eX+1AW/EGVa6dfMrdlMTE8sZA2rzVu92e/4EgPA4/GttqFPihR04fdwInWoP2RyAv+tfn5GZatXooV8uyz5bnwAlsD7k
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:54:20.1205 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea234ec9-7203-461c-b3ee-08de842cb02c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR10MB9918
Cc: linux-omap@vger.kernel.org, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Samuel Holland <samuel@sholland.org>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 04/15] hwspinlock: add callback to fill
 private data of a hwspinlock
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
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:linux-renesas-soc@vger.kernel.org,m:linux-omap@vger.kernel.org,m:baolin.wang@linux.alibaba.com,m:samuel@sholland.org,m:zhang.lyra@gmail.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jernej.skrabec@gmail.com,m:wilken.gottwalt@posteo.net,m:mcoquelin.stm32@gmail.com,m:linux-arm-msm@vger.kernel.org,m:orsonzhai@gmail.com,m:wens@kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:wsa@sang-engineering.com,m:zhanglyra@gmail.com,m:jernejskrabec@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[antonio.borneo@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antonio.borneo@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.alibaba.com,sholland.org,gmail.com,kernel.org,posteo.net,lists.linux.dev,st-md-mailman.stormreply.com,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.680];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 919522AB466
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVHVlLCAyMDI2LTAzLTEwIGF0IDA4OjU1ICswMTAwLCBXb2xmcmFtIFNhbmcgd3JvdGU6Cj4g
VG8gaGlkZSBpbnRlcm5hbCBjb3JlIHN0cnVjdHVyZXMgZnJvbSBwcm92aWRlcnMsIGEgY2FsbGJh
Y2sgaXMgYWRkZWQgdG8KPiB0aGUgb3BzIHdoaWNoIGFsbG93cyB0byBzZXQgdGhlICdwcml2JyBm
aWVsZCBvZiBhIGh3c3BpbmxvY2suIEl0IGlzCj4gY2FsbGVkIHdoZW4gYSBod3NwaW5sb2NrIGRl
dmljZSBpcyByZWdpc3RlcmVkIGFuZCwgdGh1cywgaXRlcmF0ZWQgb3Zlcgo+IGFsbCBsb2Nrcy4g
VGhlIHJlZ2lzdGVyLWZ1bmN0aW9ucyBhcmUgYWxzbyBleHRlbmRlZCB0byBwYXNzIGEgZGF0YQo+
IHBvaW50ZXIgdG8gdGhpcyBjYWxsYmFjaywgc28gaXQgY2FuIGRvIG5lY2Vzc2FyeSBjYWxjdWxh
dGlvbnMgZm9yIHRoZQo+IHByaXYgZmllbGQgb2YgZWFjaCBod3NwaW5sb2NrLiBQcm92aWRlcnMg
YXJlIGFkZGVkIG9ubHkgYW4gZW1wdHkKPiBwbGFjZWhvbGRlciBhbmQgYXJlIGNvbnZlcnRlZCBz
ZXBhcmF0ZWx5IGJlY2F1c2UgdGhlc2UgY2hhbmdlcyBuZWVkCj4gZGVkaWNhdGVkIHJldmlld3Mu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2lu
ZWVyaW5nLmNvbT4KPiAtLS0KPiDCoGRyaXZlcnMvaHdzcGlubG9jay9od3NwaW5sb2NrX2NvcmUu
Y8KgwqDCoMKgIHwgMTkgKysrKysrKysrKysrKysrLS0tLQo+IMKgZHJpdmVycy9od3NwaW5sb2Nr
L2h3c3BpbmxvY2tfaW50ZXJuYWwuaCB8IDE5ICsrKysrKysrKysrLS0tLS0tLS0KPiDCoGRyaXZl
cnMvaHdzcGlubG9jay9vbWFwX2h3c3BpbmxvY2suY8KgwqDCoMKgIHzCoCAyICstCj4gwqBkcml2
ZXJzL2h3c3BpbmxvY2svcWNvbV9od3NwaW5sb2NrLmPCoMKgwqDCoCB8wqAgMiArLQo+IMKgZHJp
dmVycy9od3NwaW5sb2NrL3NwcmRfaHdzcGlubG9jay5jwqDCoMKgwqAgfMKgIDIgKy0KPiDCoGRy
aXZlcnMvaHdzcGlubG9jay9zdG0zMl9od3NwaW5sb2NrLmPCoMKgwqAgfMKgIDIgKy0KPiDCoGRy
aXZlcnMvaHdzcGlubG9jay9zdW42aV9od3NwaW5sb2NrLmPCoMKgwqAgfMKgIDIgKy0KPiDCoGlu
Y2x1ZGUvbGludXgvaHdzcGlubG9jay5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
NCArKy0tCj4gwqA4IGZpbGVzIGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2h3c3BpbmxvY2svaHdzcGlubG9ja19jb3Jl
LmMgYi9kcml2ZXJzL2h3c3BpbmxvY2svaHdzcGlubG9ja19jb3JlLmMKPiBpbmRleCAyYzllY2Vi
YTdmZTguLmFmZTFlN2NlMjgyOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2h3c3BpbmxvY2svaHdz
cGlubG9ja19jb3JlLmMKPiArKysgYi9kcml2ZXJzL2h3c3BpbmxvY2svaHdzcGlubG9ja19jb3Jl
LmMKPiBAQCAtNTA3LDYgKzUwNyw3IEBAIHN0YXRpYyBzdHJ1Y3QgaHdzcGlubG9jayAqaHdzcGlu
X2xvY2tfdW5yZWdpc3Rlcl9zaW5nbGUodW5zaWduZWQgaW50IGlkKQo+IMKgICogQG9wczogaHdz
cGlubG9jayBoYW5kbGVycyBmb3IgdGhpcyBkZXZpY2UKPiDCoCAqIEBiYXNlX2lkOiBpZCBvZiB0
aGUgZmlyc3QgaGFyZHdhcmUgc3BpbmxvY2sgaW4gdGhpcyBiYW5rCj4gwqAgKiBAbnVtX2xvY2tz
OiBudW1iZXIgb2YgaHdzcGlubG9ja3MgcHJvdmlkZWQgYnkgdGhpcyBkZXZpY2UKPiArICogQGlu
aXRfZGF0YTogYWRkaXRpb25hbCBkYXRhIHBhc3NlZCBvbiB0byB0aGUgaW5pdF9wcml2IGNhbGxi
YWNrCj4gwqAgKgo+IMKgICogVGhpcyBmdW5jdGlvbiBzaG91bGQgYmUgY2FsbGVkIGZyb20gdGhl
IHVuZGVybHlpbmcgcGxhdGZvcm0tc3BlY2lmaWMKPiDCoCAqIGltcGxlbWVudGF0aW9uLCB0byBy
ZWdpc3RlciBhIG5ldyBod3NwaW5sb2NrIGRldmljZSBpbnN0YW5jZS4KPiBAQCAtNTE2LDEwICs1
MTcsMTEgQEAgc3RhdGljIHN0cnVjdCBod3NwaW5sb2NrICpod3NwaW5fbG9ja191bnJlZ2lzdGVy
X3NpbmdsZSh1bnNpZ25lZCBpbnQgaWQpCj4gwqAgKiBSZXR1cm5zOiAlMCBvbiBzdWNjZXNzLCBv
ciBhbiBhcHByb3ByaWF0ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUKPiDCoCAqLwo+IMKgaW50IGh3
c3Bpbl9sb2NrX3JlZ2lzdGVyKHN0cnVjdCBod3NwaW5sb2NrX2RldmljZSAqYmFuaywgc3RydWN0
IGRldmljZSAqZGV2LAo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjb25zdCBzdHJ1
Y3QgaHdzcGlubG9ja19vcHMgKm9wcywgaW50IGJhc2VfaWQsIGludCBudW1fbG9ja3MpCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNvbnN0IHN0cnVjdCBod3NwaW5sb2NrX29wcyAq
b3BzLCBpbnQgYmFzZV9pZCwgaW50IG51bV9sb2NrcywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgdm9pZCAqaW5pdF9kYXRhKQoKSGkgV29sZnJhbSwKCnRoaXMgQVBJIGlzIGRlc2Ny
aWJlZCBpbiBEb2N1bWVudGF0aW9uL2xvY2tpbmcvaHdzcGlubG9jay5yc3QKaW4gY2hhcHRlciAn
QVBJIGZvciBpbXBsZW1lbnRvcnMnLgoKQ2hhbmdpbmcgdGhlIEFQSSBwYXJhbWV0ZXJzIHNob3Vs
ZCByZXF1aXJlIHVwZGF0aW5nIHRoZSBkb2N1bWVudGF0aW9uIHRvby4KClNpbmNlIHRoaXMgQVBJ
IGlzIGNoYW5nZWQgYWdhaW4gaW4gMTAvMTUsIGl0J3MgcHJvYmFibHkgZmluZSB0byB1cGRhdGUg
dGhlCmRvY3VtZW50YXRpb24gb25seSBvbmNlIGluIHRoZSBsYXN0IDE1LzE1LgoKQmVzdCBSZWdh
cmRzLApBbnRvbmlvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
