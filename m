Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOFrDmTahGna5wMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 18:59:00 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B6F63F8
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 18:58:59 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 115A5C87ED4;
	Thu,  5 Feb 2026 17:58:59 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E6DA4C87ECD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 17:58:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLpdQNXgoT1fUpR6rRfKOPpbKwYTF/Nzc4l/fMDSKksQ1ljzB7k17i9bn30QPf88uf7jv5E87Q5VivUw1vuj8rOd1RuTrQjchfZUyoJYh+sdq8r4VVwZ+ZZm13VyGPAtGq/+lKlL30xSrZLyx4VPCZu+KJim1zUrIsFFE7k7qv/bj+DNj/eW4OpqP9+QVM6RdBDmjhx6iVvAAPkFkD3Q2shJcYc9XtX9/uaOylQwQbUAjODxQDQGOI/vuwKEe+8p2tyBUJFsaxqjudA1iiHhnB2mI6cN85y/dasUemPehOWpS/63eeNOtLb3gUpL7hJYi8UwbZz6E48GupB877dYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SS1veu7Q1BC95ycaNL5rSk/gzl3ub25YbVD4Up4j+k4=;
 b=G45XudLyCITx6KKrSXfKXtz24DBeSzNNWc101qZspreJo2PB9/5UCNbRqvW9Ep2QYVhpCdhNBYjdPiVeoNgWgDNz1U4ErwONH6qjbmJxN+wSen9OaB4kzc1lFxHMx3+gfGuL9MIz853KJr+N8zFpRwrIAvD3yG3jh9aa/d9mm6/QbZbh5rqdUjdKOKXUhFXs4I6O8sNSKMIZJnLfdIatwD//uVBimkBELQzzalPUUQsrzDVVZa/D/JD6IQITlJIMtbK7SPU2R29r3PKgZtpiI8oBs2cvt2UxFRuKh2wsw37Gp/+Pdw1MFWwAvbbRL8bq8jhPKU9SLirNfrT5o4Ix1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=ti.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SS1veu7Q1BC95ycaNL5rSk/gzl3ub25YbVD4Up4j+k4=;
 b=Ly8x3QvqPjEbvzp3xDMTV9ETlMSFY6cjEAbhmVCVTh2TUCK6H/bc8DHyHZa30arst03HMI93HvhEjuxd9Sev7/vm0gHUxCVcbEV+P1njurMEK6j0cc/pyRhaVGUrHLVSMuokwm4hL9pyVAoTszp7I5YLtENOvylFVUtk3taMa+QObMiW2tJHYyPdF/rVcRs1G5/nTKYD8nKyNuocQ6ZrEL3ZU132IEKbMIVB/QBs43SMqHzjSGZM9Wyyc2a1n2rRzf/z4yzfxzBWXTsDP0CJyk3OXxZPUDtEpVPorUc64ILdP5rzkEiezdmuXstqgQqq18H9UoCdSt2Qotbvee/RDQ==
Received: from DUZPR01CA0143.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::8) by GV1PR10MB8420.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1ca::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 17:58:52 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::59) by DUZPR01CA0143.outlook.office365.com
 (2603:10a6:10:4bd::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 17:58:49 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 17:58:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 19:00:38 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 5 Feb
 2026 18:58:50 +0100
Message-ID: <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
Date: Thu, 5 Feb 2026 18:58:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
To: Andrew Davis <afd@ti.com>, Bjorn Andersson <andersson@kernel.org>,
 "Mathieu Poirier" <mathieu.poirier@linaro.org>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
 <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
 <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
Content-Language: en-US
In-Reply-To: <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61F:EE_|GV1PR10MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: cab80ac1-dd0b-46c1-3e46-08de64e03874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QmZUVjFFTHdIWTJEN3M5MWJPSEFaWXNPNjl6bktkRi9Gbk9CMHhlZjVRakQw?=
 =?utf-8?B?dlVlZjZrNitHdERvQXc0b052NUNxVWtYT1c5ZC9NZzdWSEdOSit6WmZOc2d3?=
 =?utf-8?B?VS9iaUhrdG00YWxBSnIwR2ZUbitrdXZ0ekVqK3VSUkpMaUZMSlVmV0Z3NVJY?=
 =?utf-8?B?RGlrSU9QcWtiZjlGY0kvdE5HemJlTlB6a29kMHhKVDBtTjd5TzZwNndzZFNj?=
 =?utf-8?B?SnpDeDZMR3RCc3M2R2RTU1dNQURPejZxbGU1cFphcHc0QjRCWlpTRjVQaVJi?=
 =?utf-8?B?UFN5dTVwSmZhSkNoRDhKVEJMaHRiT0RnZldyRVc5d0ZQQXZzUTRiV3ZNWmRG?=
 =?utf-8?B?RmR6NmkyYUR2QW5rdHpEVnExYjA4SXhXaFRrUGlxejduNVlTYmozbUlSSEFp?=
 =?utf-8?B?aFJkZHFNd2hVcG9RYmJVUHBwczZDK2tsWnArbXZRTzBaRUhheXBaT3lyZzBu?=
 =?utf-8?B?N3prOG5kT1daYzhUck1zRU1zMDdmL2xONHlqc0tabkRPRitNMnBUa1ZXOXlK?=
 =?utf-8?B?aDZKWkRFSWZJT2JYenB2d1BpZHBvZHpIOVN6NEJSY29JUWhFUUFZNENNaHRm?=
 =?utf-8?B?TjNJMkgvL25yRWd2YzZsZ04rQ0lkOHJQWHI0bE9BajBMYmdtbjB1NVh3Y3Q3?=
 =?utf-8?B?VjNBbTVRZnZOOHZlVFUzdjdPWkF3UjJxT1RYN3pwWkNQb1F2ZHk2dG50OUpR?=
 =?utf-8?B?OUgzbzhYTWxac0RlZkg4SEZmalh2VExqWGlwL0FoU3VhNTVFMnJHbUFRSUFz?=
 =?utf-8?B?TTNyVW0zY3FCR3JsZGVtVmZwWm1lYlBuSEwzZ2dtZjIrSlJqbEs4MmdCY3p2?=
 =?utf-8?B?WlNzdzJRUGtSTmpXYXNuTjA5UEF6Y1oya1AxVENFTXZpWHliMjhYTFJsamxV?=
 =?utf-8?B?WmhkOVNDOGZJbWZaclM5SklsZVV4akhybExVdDJtOHRZYUc4bC9CbERTd1RU?=
 =?utf-8?B?RkxuSDBmMjV1ZEk5SE40aG4rb010Rkk4U0hiNFFJeHN0NmFiT1hlaDdTN2J0?=
 =?utf-8?B?Qmd4Nkh0dXoxK3BaM1hRejlOMVpyNVVaWTR6MXlBNzhBVnYxaXVrZGdyNUdp?=
 =?utf-8?B?cTZBTzdZNy8wMUxyNTgzSFRSd241QmhwSzN4MDcvMis5amJGbE55L0xKUzJp?=
 =?utf-8?B?SGtiMkdmOUxtY2lyWG9Vd2x6dVJFU3FvTWFQVEJFUlpBMXR1QTh2Y3krd3Fs?=
 =?utf-8?B?SWlibzExUVgrWksxYXU1NXMyRmF4MVJqWUdtSFNsU0RYOTRMUU40TjVDMkVV?=
 =?utf-8?B?TGZxUEJPWXJtOFRvK3JxMEUxa1lwK3pPeFNKSjVKcEJiSEk3S1J1Q0JidlV6?=
 =?utf-8?B?WGRoWUhUSVNNR2l6NFZHSDBpTG9IZjlsM0hvQnpFWEFRaE5aVUZua0xlTThs?=
 =?utf-8?B?aTdpZjVRUHRkbFZXZlhnelQ4U0dhbktwT0NrbVBleHAzVXllSmNFY2tMenN3?=
 =?utf-8?B?cmhmc3RUbVlLY3hzQmwyaDFqVG9Gb0Y3a3lJUlBCeHRnaG1JeTZvaU0ySFVz?=
 =?utf-8?B?NWwreG56TE1vU0JTNjVPZll0ekJqQklLRjFVKzhkbXlOOXdBd2lHUGw3aFYz?=
 =?utf-8?B?cFBFQWtzUlBqSlJXejB2MFZvRGs0VDhveVZkdkM4dkJnOXQyN1o3VWVhN0Np?=
 =?utf-8?B?SHBNbGxTSGpEMVphVFZVTzZ6RFZzNDlEZnVyZERadFVrTXp6bkl1MnpPZ05E?=
 =?utf-8?B?OTBkN3hzeEZLV2tZSndzcit4OHZqQTFMNEN4bnd2RnZXNFNRVkRuRjZMQ2pP?=
 =?utf-8?B?K2pWa1lBbUg1L1c0OVphSERyNVhNQ1JKOUVHNlVndHdVeDFQY0dFZ3JxaDM5?=
 =?utf-8?B?Z1h2TVNpSVpiVXdqd3RvVzg2dEE1bDB1Y1llbmUvaUNqYlN6Z3hJeUExc3Nr?=
 =?utf-8?B?dFJsWjlzYmxDNTkrVXZVcHRFbWtGQmNtUVVwQTdCZ1I1Z09vbkpiUy9teXIy?=
 =?utf-8?B?c1ZlOTZUaTVFWDlBUkhxNm9ndythVlY1NTR0RVVQWjBNaDR3L3BxRGhxT2JH?=
 =?utf-8?B?dmJRYUI3UXR5cXJXNmROS09kNEFtTHdwRzdlcktXVFUwUkNwLzJNQ2tTdVZY?=
 =?utf-8?B?Zk1nT3o5OXoyZUcyaXZ5bzU5ZjVtWmlROGdZcENjU3ZxUWVQMmw4ZEQ2OStp?=
 =?utf-8?B?bkFvRUI3VlEva0FKS3ByN2MxaDlZUXp6U05qNU11VHcvMUJxc1RiU29JbmR0?=
 =?utf-8?B?YmJocjFlODdmK3FhZ1hTQ0x0VzZQN3dCSnYvTUZnR2k2U3cxS3N5eGNCbWd2?=
 =?utf-8?B?THQ1OEJ2TTBVbFpOaGtBRTdKOXlRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Kj2YnEXOMC632jsv0KMqcoNPQbsdQBZV/OTy2R7/QA6GEXaRO3Sb35I5bBJ1sUZO4BpIObUGUf6vUH6Lk+47Ucb2l9fKD9vo392NAD7CpUP+HS3TwT28bhBF8LCPg5xaYvX1M/TzQrcjbe4VdzzvJVfZbwN8M/CIhRGVrhvT9pc9Fe3CtsatPErUQDsrM7hDaaaP3uc8YfLo7es4aLCyxGR42My7eXnytEdV8XmoPo5FyLcFVjJkvke9I59wtWWuaMTQNR+F0uRYSxpS26KR+9wmxW78+Eo/EgAt0XveRSKkyiubgbHlnJCAsN1tjdoS+xBfCMWFszUMZxsadz+EuXwlsP80OvVF/7OFIOjY/mSMdeGRoXL3LZEaIP/IUJoZuMN5LCuMtjM+j6D5NBk/s+v8oTyHo3KYGFWxT2rn9ddsPeUwbBt1hWNioQjL2iTO
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 17:58:51.4633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab80ac1-dd0b-46c1-3e46-08de64e03874
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8420
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/2] remoteproc: core: support fixed
 device index from DT aliases
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
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:afd@ti.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[4.135.171.0:email];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E1B6F63F8
X-Rspamd-Action: no action

SGVsbG8sCgpPbiAyLzQvMjYgMTU6NTcsIEFuZHJldyBEYXZpcyB3cm90ZToKPiBPbiAyLzQvMjYg
NDo1MiBBTSwgQXJuYXVkIFBvdWxpcXVlbiB3cm90ZToKPj4gT24gc3lzdGVtcyB3aXRoIG11bHRp
cGxlIHJlbW90ZSBwcm9jZXNzb3JzLCB0aGUgcmVtb3RlcHJvYyBkZXZpY2UKPj4gZW51bWVyYXRp
b24gaXMgbm90IHN0YWJsZSBhcyBpdCBkZXBlbmRzIG9uIHRoZSBwcm9iZSBvcmRlcmluZy4KPj4g
QXMgYSByZXN1bHQsIHRoZSAvc3lzL2NsYXNzL3JlbW90ZXByb2MvcmVtb3RlcHJvYzx4PiBlbnRy
aWVzIGRvIG5vdAo+PiBhbHdheXMgcmVmZXIgdG8gdGhlIHNhbWUgcmVtb3RlIHByb2Nlc3NvciBp
bnN0YW5jZSwgd2hpY2ggY29tcGxpY2F0ZXMKPj4gdXNlcnNwYWNlIGFwcGxpY2F0aW9ucy4KPj4K
PiAKPiBXaGlsZSBJIHdpbGwgYWdyZWUgaXQgaXMgc2xpZ2h0bHkgbW9yZSBjb21wbGljYXRlZCBp
biB1c2Vyc3BhY2UgdG8gbG9va3VwCj4gdGhlIGRldmljZSBieSBuYW1lIHN0cmluZyByYXRoZXIg
dGhhbiBieSBzb21lIHN0YXRpYyBudW1iZXIsIHRoZXJlIHNlZW1zIHRvCj4gYmUgYSBnb29kIHJl
YXNvbiBmb3Igbm90IGRvaW5nIHRoaXMgYWxzby4KPiAKPiBNdWNoIGxpa2UgbmV0d29yayBpbnRl
cmZhY2VzIHdoZXJlIHRoZSAvZGV2L2V0aDx4PiBjYW4gY2hhbmdlIGVhY2ggYm9vdCBhbmQKPiBh
dHRlbXB0cyB0byBtYWtlIHRoYXQgc3RhdGljIGZyb20ga2VybmVsIGhhcyBiZWVuIHR1cm5lZCBk
b3duOiBoYXZpbmcgCj4gc3RhdGljCj4gaW5kZXhlcyBkb2Vzbid0IG1ha2UgdXNlcnNwYWNlIHNv
ZnR3YXJlIGFueSBtb3JlIHBvcnRhYmxlLgo+IAo+IFNheSB5b3UgbG9jayB5b3VyIE0zMyBjb3Jl
IHRvIHJwcm9jPDE+IG9uIG9uZSBTb0MsIGl0IGRvZXNuJ3QgbWVhbiB5b3VyIAo+IG5leHQKPiBT
b0Mgd2lsbCBoYXZlIHRoZSBzYW1lIHJwcm9jIG9yZGVyLCBvciBldmVuIGhhdmUgYSBNMzMgYXQg
YWxsLiBTbyB5b3Ugc3RpbGwKPiBuZWVkIHlvdXIgdXNlcnNwYWNlIGNvZGUgdG8gbG9va3VwIGFu
ZCBjaGVjayB0aGUgbmFtZSwgb3RoZXJ3aXNlIHlvdSBtYWtlCj4gYmFkIGFzc3VtcHRpb25zLiBO
b3QgaGF2aW5nIHN0YXRpYyBJRHMgZm9yY2VzIHNvZnR3YXJlIHRvIGRvIHRoZSBjb3JyZWN0Cj4g
dGhpbmcgaGVyZS4KClRoYXQgd2FzIGFsc28gbXkgaW5pdGlhbCBhcHByb2FjaCwgYnV0IGl0IGlz
IGRpZmZpY3VsdCB0byBpbXBvc2Ugb24gb3VyIApjdXN0b21lcnMgd2hvIGhhdmUgbGVnYWN5IGFw
cGxpY2F0aW9ucywgZXNwZWNpYWxseSBzaW5jZSB0aGV5IGFyZSAKYWNjdXN0b21lZCB0byB1c2lu
ZyBmaXhlZCBpbmRleGVzIHdpdGggb3RoZXIgZnJhbWV3b3JrIEFCSXMuCgo+IAo+IFRoZSBvbmx5
IHZhbGlkIHJlYXNvbiBJIGNhbiB0aGluayB1cCBpcyBtYXliZSB0aGlzIG1ha2VzIGJvYXJkIHNw
ZWNpZmljCj4gZG9jdW1lbnRhdGlvbiBlYXNpZXIuIE9uZSBjYW4gc2F5Ogo+IAo+ICJPbiB0aGUg
U1RNMzJNUDI1N0YtREssIGNoZWNrIHRoYXQgdGhlIE0zMyBoYXMgYm9vdGVkIGJ5IHJ1bm5pbmcK
PiBgY2F0IC9zeXMvY2xhc3MvcmVtb3RlcHJvYy9yZW1vdGVwcm9jMy9zdGF0dXNgIgo+IAo+IHdp
dGhvdXQgaGF2aW5nIHRvIGZpcnN0IGZpbmQgdGhlIHJpZ2h0IG51bWJlciBieSBjaGVja2luZyBl
YWNoCj4gYHJlbW90ZXByb2M8eD4vbmFtZWAuIEJ1dCB3b3VsZG4ndCBhZGRpbmcgc29tZXRoaW5n
IGxpa2UgYSBuYW1lZAo+IHN5c2ZzIGRpciBzeXNsaW5rcyB3b3JrIGV2ZW4gYmV0dGVyPwo+IAo+
IGBjYXQgL3N5cy9jbGFzcy9yZW1vdGVwcm9jL20zM0A3NjAwMDAwMC9zdGF0dXNgCgpUaGUgb25s
eSBiZW5lZml0IEkgY2FuIHNlZSBpbiBjaGVja2luZyAKL3N5cy9jbGFzcy9yZW1vdGVwcm9jLzxu
YW1lPi9zdGF0dXMgaW5zdGVhZCBvZiAKL3N5cy9jbGFzcy9yZW1vdGVwcm9jL3JlbW90ZXByb2M8
eD4vbmFtZSBpcyB0byBhdm9pZCBpdGVyYXRpbmcgb3ZlciAKZGV2aWNlcyBieSBuYW1lLiBIb3dl
dmVyLCBpbiBib3RoIGNhc2VzLCB0aGUgYXBwbGljYXRpb24gc3RpbGwgbmVlZHMgdG8gCmtub3cg
dGhlIHJlbW90ZSBwcm9jZXNzb3IgbmFtZSwgd2hpY2ggaXMgcGxhdGZvcm0tZGVwZW5kZW50IGFu
ZCB1c3VhbGx5IApkZWZpbmVkIGJ5IHRoZSBkZXZpY2UgdHJlZS4KCkF0IHRoZSBlbmQsIHVzaW5n
IGFuIGluZGV4IGhlcmUgaXMgc2ltcGx5IGFuIG9wdGlvbmFsIGFsdGVybmF0aXZlIHRvIHRoZSAK
bmFtZSwgYXMgc2VlbiBpbiBvdGhlciBmcmFtZXdvcmsgaW1wbGVtZW50YXRpb25zLgoKUmVnYXJk
cywKQXJuYXVkCgo+IAo+IChhbmQgeWVzIEkga25vdyBzb21lb25lIGhlcmUgYXQgVEkgZGlkIHRo
aXMgYWxpYXMgbmFtaW5nIGZvciBvdXIKPiBrZXlzdG9uZSBwbGF0Zm9ybXMsIGJ1dCBpZiBub3Qg
Zm9yIHBvc3NpYmxlIGJhY2t3YXJkcyBjb21wYXQgYnJlYWtzCj4gSSdkIGxvdmUgdG8gcmVtb3Zl
IHRoYXQgb25lIGFsc28pCj4gCj4gQW5kcmV3Cj4gCj4+IEluc3BpcmVkIGJ5IHRoZSBTUEkgaW1w
bGVtZW50YXRpb24sIHRoaXMgY29tbWl0IGFsbG93cyBib2FyZC1zcGVjaWZpYwo+PiBudW1iZXJp
bmcgdG8gYmUgZGVmaW5lZCBpbiBkZXZpY2UgdHJlZSB3aGlsZSBzdGlsbCBzdXBwb3J0aW5nIGR5
bmFtaWNhbGx5Cj4+IHJlZ2lzdGVyZWQgcmVtb3RlIHByb2Nlc3NvcnMuCj4+Cj4+IEZvciBpbnN0
YW5jZSwgb24gU1RNMzJNUDI1IFNvYyB0aGlzIGNhbiBiZSB1c2VkIGJ5IGRlZmluaW5nOgo+Pgo+
PiDCoMKgwqDCoCBhbGlhc2VzIHsKPj4gwqDCoMKgwqDCoMKgwqDCoCBycHJvYzAgPSAmbTMzX3Jw
cm9jOwo+PiDCoMKgwqDCoMKgwqDCoMKgIHJwcm9jMSA9ICZtMF9ycHJvYzsKPj4gwqDCoMKgwqAg
fTsKPj4KPj4gV2hlbiBhICJycHJvYzx4PiIgRFQgYWxpYXMgaXMgcHJlc2VudCwgdXNlIGl0IHRv
IGFzc2lnbiBhIGZpeGVkCj4+ICIvc3lzL2NsYXNzL3JlbW90ZXByb2MvcmVtb3RlcHJvYzx4PiIg
ZW50cnkuCj4+IElmIG5vIHJlbW90ZXByb2MgYWxpYXMgaXMgZGVmaW5lZCwga2VlcCB0aGUgbGVn
YWN5IGluZGV4IGFsbG9jYXRpb24uCj4+IElmIG9ubHkgc29tZSByZW1vdGVwcm9jIGluc3RhbmNl
cyBoYXZlIGFuIGFsaWFzLCBhbGxvY2F0ZSBkeW5hbWljCj4+IGluZGV4IHN0YXJ0aW5nIGFmdGVy
IHRoZSBoaWdoZXN0IGFsaWFzIGluZGV4IGRlY2xhcmVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBB
cm5hdWQgUG91bGlxdWVuIDxhcm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tPgo+PiBUZXN0ZWQt
Ynk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgo+PiAtLS0KPj4gVjM6Cj4+IC0gZml4IGRv
dWJsZSBzcGFjZSB0eXBvCj4+IC0gYWRkIFBlbmcgRmFuJ3MgVGVzdGVkLWJ5Cj4+Cj4+IFYyOgo+
PiAtIEludHJvZHVjZXMgcnByb2NfZ2V0X2luZGV4IGJhc2VkIG9uIE1hdGhpZXUgUG9pcmllcidz
IHN1Z2dlc3Rpb24uCj4+IMKgwqAgQW4gdXBkYXRlIGNvbXBhcmVkIHRvIE1hdGhpZXUncyB2ZXJz
aW9uIGlzIHRoYXQgdGhlIGNhbGwgdG8KPj4gwqDCoCBpZGFfYWxsb2NfcmFuZ2UgaXMgcmV0YWlu
ZWQgaWYgYW4gYWxpYXMgaXMgZm91bmQgZm9yIHRoZSByZW1vdGUgCj4+IGRldmljZSwKPj4gwqDC
oCB0byBiYWxhbmNlIHdpdGggaWRhX2ZyZWUoKS4KPj4gLSBSZW5hbWUgRFQgYWxpYXMgc3RlbSBm
cm9tICJyZW1vdGVwcm9jIiB0byAicnByb2MiIHRvIGJlIGNvbnNpc3RlbnQgd2l0aAo+PiDCoMKg
IGtleXRvbmUgZHJpdmVyLgo+PiAtLS0KPj4gwqAgZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXBy
b2NfY29yZS5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+PiDCoCBpbmNsdWRl
L2xpbnV4L3JlbW90ZXByb2MuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsrKwo+PiDCoCAy
IGZpbGVzIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY19jb3JlLmMgYi9kcml2ZXJz
LyAKPj4gcmVtb3RlcHJvYy9yZW1vdGVwcm9jX2NvcmUuYwo+PiBpbmRleCBhYWRhMjc4MGIzNDMu
LjRhMDI4MTRjNWQwNCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXBy
b2NfY29yZS5jCj4+ICsrKyBiL2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9jX2NvcmUuYwo+
PiBAQCAtMjQzMyw2ICsyNDMzLDQzIEBAIHN0YXRpYyBpbnQgcnByb2NfYWxsb2Nfb3BzKHN0cnVj
dCBycHJvYyAqcnByb2MsIAo+PiBjb25zdCBzdHJ1Y3QgcnByb2Nfb3BzICpvcHMpCj4+IMKgwqDC
oMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4gKy8qKgo+PiArICogcnByb2NfZ2V0X2luZGV4IC0g
YXNzaWduIGEgdW5pcXVlIGRldmljZSBpbmRleCBmb3IgYSByZW1vdGUgcHJvY2Vzc29yCj4+ICsg
KiBAZGV2OiBkZXZpY2UgYXNzb2NpYXRlZCB3aXRoIHRoZSByZW1vdGUgcHJvY2Vzc29yCj4+ICsg
Kgo+PiArICogTG9vayBmb3IgYSBzdGF0aWMgaW5kZXggY29taW5nIGZyb20gdGhlICJycHJvYyIg
RFQgYWxpYXMKPj4gKyAqIChlLmcuICJycHJvYzAiKS4gSWYgbm9uZSBpcyBmb3VuZCwgc3RhcnQg
YWxsb2NhdGluZwo+PiArICogZHluYW1pYyBJRHMgYWZ0ZXIgdGhlIGhpZ2hlc3QgYWxpYXMgaW4g
dXNlLgo+PiArICoKPj4gKyAqIFJldHVybjogYSBub24tbmVnYXRpdmUgaW5kZXggb24gc3VjY2Vz
cywgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlIAo+PiBvbiBmYWlsdXJlLgo+PiArICovCj4+ICtz
dGF0aWMgaW50IHJwcm9jX2dldF9pbmRleChzdHJ1Y3QgZGV2aWNlICpkZXYpCj4+ICt7Cj4+ICvC
oMKgwqAgaW50IGluZGV4Owo+PiArCj4+ICvCoMKgwqAgLyogTm8gRFQgdG8gZGVhbCB3aXRoICov
Cj4+ICvCoMKgwqAgaWYgKCFkZXYtPm9mX25vZGUpCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIGxl
Z2FjeTsKPj4gKwo+PiArwqDCoMKgIC8qIFNlZSBpZiBhbiBhbGlhcyBoYXMgYmVlbiBhc3NpZ25l
ZCB0byB0aGlzIHJlbW90ZXByb2MgKi8KPj4gK8KgwqDCoCBpbmRleCA9IG9mX2FsaWFzX2dldF9p
ZChkZXYtPm9mX25vZGUsIFJQUk9DX0FMSUFTKTsKPj4gK8KgwqDCoCBpZiAoaW5kZXggPj0gMCkK
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBpZGFfYWxsb2NfcmFuZ2UoJnJwcm9jX2Rldl9pbmRl
eCwgaW5kZXgsIGluZGV4LAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgR0ZQX0tFUk5FTCk7Cj4+ICvCoMKgwqAgLyoKPj4gK8KgwqDCoMKgICogTm8gYWxp
YXMgaGFzIGJlZW4gYXNzaWduZWQgdG8gdGhpcyByZW1vdGVwcm9jIGRldmljZS4gU2VlIGlmIGFu
eQo+PiArwqDCoMKgwqAgKiAicnByb2MiIGFsaWFzZXMgaGF2ZSBiZWVuIGFzc2lnbmVkIGFuZCBz
dGFydCBhbGxvY2F0aW5nIGFmdGVyCj4+ICvCoMKgwqDCoCAqIHRoZSBoaWdoZXN0IG9uZSBpZiBp
dCBpcyB0aGUgY2FzZS4KPj4gK8KgwqDCoMKgICovCj4+ICvCoMKgwqAgaW5kZXggPSBvZl9hbGlh
c19nZXRfaGlnaGVzdF9pZChSUFJPQ19BTElBUyk7Cj4+ICvCoMKgwqAgaWYgKGluZGV4ID49IDAp
Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gaWRhX2FsbG9jX3JhbmdlKCZycHJvY19kZXZfaW5k
ZXgsIGluZGV4ICsgMSwgfjAsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPj4gKwo+PiArbGVnYWN5Ogo+PiArwqDCoMKgIHJldHVy
biBpZGFfYWxsb2MoJnJwcm9jX2Rldl9pbmRleCwgR0ZQX0tFUk5FTCk7Cj4+ICt9Cj4+ICsKPj4g
wqAgLyoqCj4+IMKgwqAgKiBycHJvY19hbGxvYygpIC0gYWxsb2NhdGUgYSByZW1vdGUgcHJvY2Vz
c29yIGhhbmRsZQo+PiDCoMKgICogQGRldjogdGhlIHVuZGVybHlpbmcgZGV2aWNlCj4+IEBAIC0y
NDgxLDggKzI1MTgsNyBAQCBzdHJ1Y3QgcnByb2MgKnJwcm9jX2FsbG9jKHN0cnVjdCBkZXZpY2Ug
KmRldiwgCj4+IGNvbnN0IGNoYXIgKm5hbWUsCj4+IMKgwqDCoMKgwqAgcnByb2MtPmRldi5kcml2
ZXJfZGF0YSA9IHJwcm9jOwo+PiDCoMKgwqDCoMKgIGlkcl9pbml0KCZycHJvYy0+bm90aWZ5aWRz
KTsKPj4gLcKgwqDCoCAvKiBBc3NpZ24gYSB1bmlxdWUgZGV2aWNlIGluZGV4IGFuZCBuYW1lICov
Cj4+IC3CoMKgwqAgcnByb2MtPmluZGV4ID0gaWRhX2FsbG9jKCZycHJvY19kZXZfaW5kZXgsIEdG
UF9LRVJORUwpOwo+PiArwqDCoMKgIHJwcm9jLT5pbmRleCA9IHJwcm9jX2dldF9pbmRleChkZXYp
Owo+PiDCoMKgwqDCoMKgIGlmIChycHJvYy0+aW5kZXggPCAwKSB7Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBkZXZfZXJyKGRldiwgImlkYV9hbGxvYyBmYWlsZWQ6ICVkXG4iLCBycHJvYy0+aW5kZXgp
Owo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBwdXRfZGV2aWNlOwo+PiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9yZW1vdGVwcm9jLmggYi9pbmNsdWRlL2xpbnV4L3JlbW90ZXByb2MuaAo+
PiBpbmRleCBiNDc5NTY5OGQ4YzIuLjNmZWIyNDU2ZWNjNCAxMDA2NDQKPj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9yZW1vdGVwcm9jLmgKPj4gKysrIGIvaW5jbHVkZS9saW51eC9yZW1vdGVwcm9jLmgK
Pj4gQEAgLTUwMyw2ICs1MDMsOSBAQCBlbnVtIHJwcm9jX2ZlYXR1cmVzIHsKPj4gwqDCoMKgwqDC
oCBSUFJPQ19NQVhfRkVBVFVSRVMsCj4+IMKgIH07Cj4+ICsgLyogZGV2aWNlIHRyZWUgcmVtb3Rl
cHJvYyBBbGlhcyBzdGVtICovCj4+ICsgI2RlZmluZSBSUFJPQ19BTElBUyAicnByb2MiCj4+ICsK
Pj4gwqAgLyoqCj4+IMKgwqAgKiBzdHJ1Y3QgcnByb2MgLSByZXByZXNlbnRzIGEgcGh5c2ljYWwg
cmVtb3RlIHByb2Nlc3NvciBkZXZpY2UKPj4gwqDCoCAqIEBub2RlOiBsaXN0IG5vZGUgb2YgdGhp
cyBycHJvYyBvYmplY3QKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
