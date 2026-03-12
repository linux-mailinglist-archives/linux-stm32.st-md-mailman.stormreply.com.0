Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFeQNT2tsmlGOwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 13:10:37 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFAC271747
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 13:10:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEF19C8F28F;
	Thu, 12 Mar 2026 12:10:36 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E5244C8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 12:10:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LwwFk3gdZtFI7OS0im0EDFH2MDB7imvgANGxl2VCv6DFKPjZlQtTxzx5pLVcCVf3MFbp5tQ6d+MKez58Gfd4m3H2qK0QShZtWMXGP9S1BPUS/Ko28lVBk3mN6KeFh8swP403KeNJ6eiwrwwe9/Tk25iS6qXJ3aSzGIv2mzEVVhC4fq1FZ+60lTLypk02pDjzClE/5KicuvV14TtlGfq3q3SFq+j1XCDm+CAFd0uYROrK72zkczVJRCVNypeIT+oI2HWA0272EU7zzwJpdisMcWOcHMowThq2cZQ3HEr7VnvJyfezVsbw5TLjtzvafOLq1CBYJisvFH6hwOI+ib/3Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5SP9tbqSAbZOTl7IkJ5Lu7yLKFV+r3s9kSp5RAVzkYE=;
 b=iTwqvqbz5XzTl3mMwWK6bIli4PIsn7zs4WEjUVGyEDEWKuiPUjWrXx9qGYPgvfohTyPbpdEMGeqga8KrLLpXoaheoAqfj2N7cMQ20tws5gcAQlx6tq9R6ndsA/LY1+3znuP65vDv4zbMSt0KyO76iiO+uo2UkJ+WpJ4q1DvarQ8azRsCJXcQ5BXKBAzT0bFrHuADhvg6+70h7OJGVGevV9cUkNO0VbqeLrBsc2xCYEx5fSAc94YKfhiHJFilFUxG8ZLtjM5OF7K2gQlDB+TmfQGz3LM/nESxb82Fj2bCkdVXM0VG3Q/3Z4lGiWkVN+GA6nZ9mNtP7zNdPYwwEDeA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5SP9tbqSAbZOTl7IkJ5Lu7yLKFV+r3s9kSp5RAVzkYE=;
 b=g4JdTgZLNxOsxB+KaT5/N2LHq3shbx3MFQn0Jcmr4Ovi8DhtJcpseoNVASPRoAXkR4u09xjEm119rc95zTdtVeLtWiKCDmml6OPFghVDKX9DklXSh4jhfl7V13hxKnhGu4ZTuYuElXZ2SJ4ixnCKmTjEHjIfutJ5I9xJLQLVWOxmvDU12v1nvDk2EhFa5w07lsdq1LBFxTZoxa1cKjTdGd3PXwE0QoZSx5MeRtvmqa2af6arH8L6KHvA5v8MaRRol4v0F5/2Uya51IUEjBrf7GR9h/G7T/tKGh1ApWFAGWutOn7duuEn/CAjFan7BECoDTKdO4oLxX/4au9ad4x7Jw==
Received: from DUZPR01CA0149.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::25) by AM0PR10MB9583.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:6fd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 12:10:32 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::9a) by DUZPR01CA0149.outlook.office365.com
 (2603:10a6:10:4bd::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Thu,
 12 Mar 2026 12:10:26 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 12:10:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Mar
 2026 13:12:46 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Mar
 2026 13:10:30 +0100
Message-ID: <521dc906-e26c-4a47-af07-137ce00b176d@foss.st.com>
Date: Thu, 12 Mar 2026 13:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Linus Walleij <linusw@kernel.org>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
 <ed019efc-d1e0-4e77-bf9c-79da40f0c707@foss.st.com>
 <CAD++jLkkVcRrT=NRyFD6s9=MYaOQSWun0v4z3z01BZoQ2tTvDA@mail.gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CAD++jLkkVcRrT=NRyFD6s9=MYaOQSWun0v4z3z01BZoQ2tTvDA@mail.gmail.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8F:EE_|AM0PR10MB9583:EE_
X-MS-Office365-Filtering-Correlation-Id: 19df66d8-90b8-48fa-7fe6-08de80305bb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: e7DwyLvanSAM7Z3lixpfV/146yNRKTbcaqUPYCoE9fEoMtuyWMsDldRhuKDqBLJqnS8MGEZFZMZ1rXmLsckcxKu0QGPHHQ6DzCsAK521x+qiQgDhveRE0q1LOoqMLVaeh7E7FOFD9zTMvKu5KQJv+5ktaWWB6rfqF6kDaiMLInS0ArQTTQmxGvMqun4P0a/C3EgRKbRQpmExEOagXanE5tZo/ZXBOVq79JaJEYD8FdJX+6ZK0p6UFDoBoM73LkMD1Z4w73a7ppy9qlG+axjYlkVq101NWZT6+H1S7wtCl55DTTXXoe6Wzc/Eim3Z3pRK2ZYqwlpPVEHFkMOPB24koIUK+vwamI+z7yOVA8LVIPoRMOOE9uTSus2x38ekqOL2kUUcFshoWGrE5e9PXka4RW9iZL4A454XiSqILb/GrRK/BWkap96nOMxFGKpzTgENXiahRCDTrMHJ4xEyMPMXBr6WreByVpOLDASZ16Zcbhzhqdy1f0qOJ6Sh9YEm/34wd536T57l0xeFKNx4cRKWPTy4exCcPVLhLb9XHcEFT252n7xh+8tgE/ZrPPAkDpG9au564aZskQckdq6gsUx07YIqq3+PfkhcckVMVWVvRmKxeY3BIC5RiRnOYHV1HJzcPMhMjUEy89TKeM0m1doYTeiUuCiCqCj6GDijgYd6Z0w7Y5zQYQ/QCZPCPFMeSBeI/NT2vN3JZkLbKKoNplFZPo4sBBVro5WvY4394APYN6s5v5I6oFZp8DBK6nEz00mrFgQ7fzz1jN03Wi1rZoXa8Q==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o/8/wizWjvk21fAFxvva3W00B+MtIYhrhlHDjwLkdw1j1RWKebVOfOo8uAztDtNWUrCvyOLHpCeBZuVn6YaVmyLJPTOXHZT+lSUBO5VAC6kj/sOs0TjHsFLcz+dv/F+mNKZXv9esY5Q7NeZDIbRbj7/YqAY6h580XnbQvPC4uTOwRoDdcIUPLi/FXpfrU6hAltdoULsKtOBgsTII4Pp67B29XP8FVw2sCZzV+OCCaqdJ2xN1pR+Ps+MI8JsIW/2tuj1t8D6FLjjPRc+XmXM9pNYfXZJK9z/MZXyA2xJ2xW0k/WnSrGGM4DzaZ1qsZ8HQ/FBda2pjwJrEd8dCMGkpDYZecdCibH2HjGMumb89BMMQ7ZCeoApBKvC5kMlcsptLjO1IPLlqW0m7MjNAddyEaZAU+j6TnjpuCzD+H41igvYCy/ZhHbz+JPGzL/nfayuI
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 12:10:31.7411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19df66d8-90b8-48fa-7fe6-08de80305bb4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB9583
Cc: linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 cristian.marussi@arm.com, coresight@lists.linaro.org,
 Mike Leach <mike.leach@linaro.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>, Sudeep Holla <sudeep.holla@kernel.org>,
 linux-gpio@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-kernel@vger.kernel.org,
 Leo Yan <leo.yan@linux.dev>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 jens.wiklander@linaro.org
Subject: Re: [Linux-stm32] [PATCH v6 00/12] bus: add stm32 debug bus and
 coresight support for stm32mp1x platforms
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
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:cristian.marussi@arm.com,m:coresight@lists.linaro.org,m:mike.leach@linaro.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:suzuki.poulose@arm.com,m:james.clark@linaro.org,m:sudeep.holla@kernel.org,m:linux-gpio@vger.kernel.org,m:legoffic.clement@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:mathieu.poirier@linaro.org,m:linux-kernel@vger.kernel.org,m:leo.yan@linux.dev,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:jens.wiklander@linaro.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[st-md-mailman.stormreply.com,kernel.org,arm.com,lists.linaro.org,linaro.org,vger.kernel.org,gmail.com,lists.infradead.org,linux.dev];
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CFAC271747
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpPbiAzLzExLzI2IDEwOjI4LCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+IE9uIFR1ZSwgTWFyIDEw
LCAyMDI2IGF0IDEwOjA34oCvQU0gQWxleGFuZHJlIFRPUkdVRQo+IDxhbGV4YW5kcmUudG9yZ3Vl
QGZvc3Muc3QuY29tPiB3cm90ZToKPiAKPj4gUGF0Y2ggMSB0byAxMSBhcHBsaWVkIG9uIHN0bTMy
LW5leHQuIExpbnVzLCBsZXQgbWUga25vdyBpZiBJIHRha2UgdGhlCj4+IHBpbmN0cmwgb25lIG9y
IHlvdSBwcmVmZXIgdG8gdGFrZSBpdC4KPiAKPiBBRkFJVSB5b3UgKmhhdmUqIHRvIHRha2UgaXQg
YmVjYXVzZSB0aGVyZSBhcmUgY29tcGlsZS10aW1lIGRlcGVuZGVuY2llcz8KPiAKPiBJIHByb3Zp
ZGVkIG15IFJldmlld2VkLWJ5IHNvIGdvIGFoZWFkIGFuZCBhcHBseSBpdCEKCk9rIGRvbmUuCgpU
aGFua3MgTGludXMuCgphbGV4Cgo+IAo+IFlvdXJzLAo+IExpbnVzIFdhbGxlaWoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxp
bmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8v
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMy
Cg==
