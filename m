Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEPFBegwlGnQAQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 10:12:08 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A8114A40B
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Feb 2026 10:12:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A9948C5A4C5;
	Tue, 17 Feb 2026 09:12:06 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013051.outbound.protection.outlook.com
 [40.107.162.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62FE5C01FB6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Feb 2026 09:12:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+zo/y6ztSxShg2JzAIPwsMAcF/IhSrZtgyzMz+LWzrHUU4hQMnFcIIZJ0zkCgxG6p3zfRWcUSVM3AShtZL/P8sbbb7OZOsZYP3niMToM4SG0mxLA1t7K/HcJdn/L0+pTudBPG3ljacPf55Q91Q4ESNvg4/N3umXZXIbTLkQoJ/T8ZXIr6vzqFhYpgl6eDTZyJHQChDHzA52+nBJKDkFsMf5cFs23dEIaRGU9Iy/5qpxRdMueRAhu0qmMwv3fClkFk2d1+mVPYrA9S5xTDRTrxzhl8DbhskLxZDmrYmMP8hPuJvSFv+QGgEc0EBonCl95GRHPjDtIpbr5QFShTWB8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywLR22n77le//8wPiqfetyZsTOsf87R9WV/Wi16tZ98=;
 b=mWyv5wOdW4walJmWBDLXyVxbav4hVf7hYjkkCnhv1MyZB79ax2VafKEBj0Socl8grefqyQvwQ/0EA/rLKyTO6jfjoqcUWMH7EK6sM5R6/i9NF6gb4K1ueB/osVJX6e7GaSKrhSAqgin4zAnaWk7/86V2uI/XaYoBlSvy2zAC9QWjDs1mbljrRDbPryrLmGiq1IZN7lwa3C/qRRJACtB0RbJh1I5uwAEmQkNsrkFBJ2vbzSa9u3tD/7SAI/VFTpUKzIEGd3BnAc2b5vv7yo9iIDqFtdTpi81VzmGyrB164+Pm+FqJ1iB4heNfu/zNq/ykwLyjdlRFMWwJwRq/x1g7jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywLR22n77le//8wPiqfetyZsTOsf87R9WV/Wi16tZ98=;
 b=fPmMvttUGjEOGQfRQhsHGtrqjsNRNsWYNjES2J4ylzosNeMFuAkuz3SERA7fiyBoCT4tW50i5f5HqWcRMXLb0pHy1pqiUJX87hN3LLaV8hZe3R5lwx8PLV/I4w4SfXwvN6omHRoD2W4+vkT4qSs0Ob9hXMSU8YtzJS06fBu2ge0P8Uynf2+FBG7Q4O0N4/xiTuw2ZCerbPxrY7yudXGJVF/8lI2kcNiLsX5t5Dh7Q0baEcPfOIH6CtGMAEMX4YvIggRBkPMYdwz8ofEjo0+P0HN52zXiYGUB2neM7XzBKzoSvrBKuRVkmdyPoQzkWmgrN68JHmBXL1Jwjoxl4m5kqw==
Received: from DU7P190CA0002.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:550::30)
 by DB9PR10MB7268.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 17 Feb
 2026 09:12:02 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:550:cafe::e2) by DU7P190CA0002.outlook.office365.com
 (2603:10a6:10:550::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Tue,
 17 Feb 2026 09:12:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 09:12:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Feb
 2026 10:13:46 +0100
Received: from [10.48.87.33] (10.48.87.33) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 17 Feb
 2026 10:12:00 +0100
Message-ID: <885eddcd-8bf5-4de6-908a-d0b94dfbaf5b@foss.st.com>
Date: Tue, 17 Feb 2026 10:11:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260216085816.69888-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
In-Reply-To: <20260216085816.69888-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Originating-IP: [10.48.87.33]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EA:EE_|DB9PR10MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 027ac75b-34d7-4983-fb50-08de6e049c40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1pTWmdGZHJFVVlCSHhmbmtvV09yZ2oxdVhPYUw5SVU3a1Y2NlhXSXdIREc1?=
 =?utf-8?B?Vjl5MVhyNlF4RmQ4Ukx0U0tNKytqVExIUTBhSzFBQlVzK09KWVA5UDdjaVJY?=
 =?utf-8?B?aERvdnNPYU9pc0Y2T1VCNzlxeG5NMjNpMlc4U1hPa0orYTFqbVVsalRYeWxE?=
 =?utf-8?B?Tng3NEljdkZsZm9Nd2VpRThQaXRWbTJvc0Rjekt2dHloNE5wWG42YVNxSHU3?=
 =?utf-8?B?TDNjYXJvVTVYMHU5bkdwVUNaVGIxNnMrTjRlVkFRdXlTMkVrcTZ2UkI5b0Uz?=
 =?utf-8?B?elJDREh4QVN1enVPaG9Pb3lERTJTMVdDaTRQbk1nUXgyQnF2cWhpUU1UdUlN?=
 =?utf-8?B?V0VNaEFjZlZlYnc4aWtzTjBxZllQNmlOdHVSdmc3S2poUFdOdVR6QzE2ZDc3?=
 =?utf-8?B?R2ZldnlJNTJxWHRvamxhUndRVXJKSEF0d0dEeXcvRkpiL2xBZUYzdHFidlc0?=
 =?utf-8?B?QTVCaVdNeG92eFVvNXlnRHBkSkczTDVoOGdCTUxQZDQzdlNZV0xsSEpTdUZk?=
 =?utf-8?B?T0VLVmU0cGVLYi9rTWRuWU9kUTFUaXo3ZFlUSzliZHpDRS9MeFhMNXVNQzkv?=
 =?utf-8?B?U25YeEJPeWhzblJxVXBzeWpVVW5wSlU1cWZ6YTNWQitYUlJSUktVMFFwa1Vo?=
 =?utf-8?B?M0V4TUcxRlZpTy9GVWliNUZFZDZMVWtpRVM0cEQ2Q3FJOTZuNWNnTXcwcFZm?=
 =?utf-8?B?d3IzKzloN3kyU2wvYzBsYlJRL0lQTThSMXFyU2ZmV080UVdWQkNGZHl4L0Jm?=
 =?utf-8?B?UjBxZlNJK3VpUVR3Z2xGTG5KZ3RkbFoyU0ZKeE9YZ2ZMc2VRazRPNG4vRTJx?=
 =?utf-8?B?cDVQWTdqL0pxMlB2c3ZKVUNqRHBvakRoR1ZrdGgwMndIK2d5U291S1FrNEd3?=
 =?utf-8?B?VGR5ZXhvQUxySE1pOElBRmREZkp5TU1BL29FZzhGejZzY3hNZ1hNcnpwVDhY?=
 =?utf-8?B?SDFDWFhvVlppbDYxWWYwcFd6czdTNVA3aXVRY0ZHKzE0clJnejR5MHdHNVNG?=
 =?utf-8?B?WjgxNGt3dHJ1bkhkL1M5OE9oaEFqUnd3QmxGYzFJMEdpZXpOR2RCclRMWmR6?=
 =?utf-8?B?Y3VCVlVWdDhrbFRpWnh1dXRDOGdJWElSQlppUGpCSTg4akVCNUMyc1RhQjQx?=
 =?utf-8?B?V3VwZE5iWElvS3RPb0xEMG9UeVlVdS9URTcwSERLMVd5bi9idVk3Z2I4L1ls?=
 =?utf-8?B?Uk8vaFB1VVJpTm14RkVxQVV6UXlxb1lqY2U4aGxiTUFFRmpKQjcrR0U0WndS?=
 =?utf-8?B?bENMK1JrSXg4VHI0dkZiWlFieVNEN0ptQ3ZnSUoyMW5aSUllbndMUk1ReGxl?=
 =?utf-8?B?dmk1S3RjVW9haHJoVEo5ZzRJT3h3SndJNWw5UW92NU5XYUphQUZsdHZHWVU5?=
 =?utf-8?B?TlZYM3JNVFBza0kxNUVvRWI4SVhYMG9hTk5COUlscEdCRDNCb2hLZFdVeG1a?=
 =?utf-8?B?a2EvdUJMZ0xHK0dORWJvMUtINy9vT0RYZTdFdGFRM3JUTkcxVENFbllieE1y?=
 =?utf-8?B?WUx2emRWMGFhNHlHVk5xa1RJVWVhR0ZidTNYdlQvYnVHdGZBaFpoUXFpUk12?=
 =?utf-8?B?T21yUExqSE5pMWdldjRNcTIyTVBoak9IQWNJOTFBRkh3VWRyK0N6eXZaOWlW?=
 =?utf-8?B?bDZMVEg4NnZXUVVQelN1WlF4VUdFT1BManBUYWI2RHNTNlFYaHY3UVp3aGJy?=
 =?utf-8?B?TmY0dVEvM2R6cjVlNXJFTnM1LzIvbGpJNnI1eHRoQWtEYVlzU1J1RFVOaVRJ?=
 =?utf-8?B?K1p5VzdqY1lFMjRyOXl4RHpmT0RSRUtiM2N0SUFaSW5wVXdYTnorL2lrS3Jn?=
 =?utf-8?B?Z2k4amJFYVVQbVZzMWNvTnFrbWYrY3YxM21xeHltWTN0eG1zMkkrdW91VFpI?=
 =?utf-8?B?Z1pGSzU0anJYVWliSlF3RENEY3JEWjlGZ0VzYk9EaGVKRURJUWNScTM2aUs0?=
 =?utf-8?B?WWpMbnBNMHZudlFuVlBrd1VoQVdVazU4N1hJNWVmY1AwdVZOZHYxcE1uQ2xK?=
 =?utf-8?B?aVBuemNnSlFqbFY4Y2MybUgxU2pNeVBhWXdJNGdna1N2Um11eW1qa1R3WXg3?=
 =?utf-8?B?R2pVaXEycmVIV0JMbXVBQlBxU2pwWVJpSE9McEw3dkVGZmRDeG0wU3d3c2hy?=
 =?utf-8?B?M2xOM0FGZ0RoQjlJdFRFK0FMMnVML0oxUkdQVEFZWklVNVpPdnlhSEtoVjBz?=
 =?utf-8?B?K09LZUFERFVseWdNY0UvTG9Vdm5yb0p5ZW93cnlPOTJiZkZ4VkJBZWlxQ1Na?=
 =?utf-8?B?Q2pXTXM4aXlpYVZvSnd3VFdvY1hnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hjKYcUXtfgliIJ+JykHImjOYEcG2n/FY1OsSshqhy+juI7BDMMhcZ35bohlCLMqaf6pFRE2tkrFw4YQsx45I/i+75Qwur9oVLD/zRXII41w7TjU1hl+yFsIYQRbtRCiPVOQrFIiGpud+wpi9HnJBots2C98xslcvVzeEgVhYfgQxnjKCYykk1X6I3+fg/7KcuHpIXyZ+nU3Px8encljrIV9rAUbLAGjo4YQ8BKL6/6xjuNBkjVLX0Gzl9c53PjjaURGuaTpp27ub3grY9ZpdkptmYo94d6Y/VjIMBue1/eYF8W1bixmxTe4t8tjF0pCmgfz647GBIyJ4J1uenxtl2DtP8/Ku7hccFEU0uQAxMLWkUbVbM7N4rKgjdRhRojLKjW6XRrOyteUTQvrKYKzRTmkYcP7XjiEegGAKV/3UDFTYGfgW6PftVxu4GC+qPvxc
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 09:12:01.2565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 027ac75b-34d7-4983-fb50-08de6e049c40
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7268
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: Use NULL instead of 0 for
 pointer
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:alain.volmat@foss.st.com,m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-spi@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,foss.st.com,kernel.org,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,qualcomm.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 33A8114A40B
X-Rspamd-Action: no action


On 2/16/26 09:58, Krzysztof Kozlowski wrote:
> Pointers should use NULL instead of explicit '0', as pointed out by
> sparse:
> 
>    spi-stm32.c:1659:65: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


Reviewed-by: Amelie Delaunay <amelie.delaunay@foss.st.com>

Thank you for providing the patch to fix this warning.

Regards,
Amelie

> ---
>   drivers/spi/spi-stm32.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index b99de8c4cc99..38f6bba38b07 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -1656,7 +1656,7 @@ static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
>   			ret = stm32_spi_prepare_rx_dma_mdma_chaining(spi, xfer, &rx_dma_conf,
>   								     &rx_dma_desc, &rx_mdma_desc);
>   			if (ret) { /* RX DMA MDMA chaining not possible, fallback to DMA only */
> -				rx_dma_conf.peripheral_config = 0;
> +				rx_dma_conf.peripheral_config = NULL;
>   				rx_dma_desc = NULL;
>   			}
>   		}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
