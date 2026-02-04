Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGidDngBg2lGggMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 09:21:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 959E1E30DA
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Feb 2026 09:21:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 31ADBC87ECA;
	Wed,  4 Feb 2026 08:21:11 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011052.outbound.protection.outlook.com [52.101.70.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEF01C87EC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Feb 2026 08:21:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DhcEmwiMMQBXaoL7yg9pCc0ljJMaOkE7DTpVIVJuu37gF/bdjCbQfU5J/r8FTm3YH/e9H4z5wlsOgqKuBBZpB/edhoHht+cBgXcNKIQG05ar3u65qKoRetONq/Ncs5S4jgECLBua25Qmk1ylxme4aE+yrq2zdWCHx00Lt1cn+EF20oBJJQ7UWDKRWcwVfNJW3wTKdaDwioAFHNdsVdUmPy6pPmmM+tNtGrKw4ZTBIDbN/ucM/6qFnapEUnyIoTZxzcDmw1050UAJ3XAm/XdMYLVOr7G9ly/jDyZSEp7UAI/OivbMjXcH0ndp8pQ1xkOYGw3SozdZl29ZTjCjoG94sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LB/XXMWMcF6lXZ+dm4s0GmsIhKKPpweAyU9PiNtlTYM=;
 b=F5H4248+0imReEcleOJ15LMiFjiM2P9bccTtMRp6n6YuX28O2E6Q5Rn56/H5E/JsH8i7TgiXpQP+7AhqKcQZuLH4Yasfq8ctdV0k6WkeeWeyrz0110WvCTT7T0pyDRdhCHu1Jy090YksfskTPlBRj3k3t5J1SQlCJpH7dwoWOGPqo9Bw4krUC96sJ5fpv3juZ5gktWX9CwkkiYfDxbNW4mYHdvcnI67n7oHsflHAEvUCnyyvb8uc/YzGoaM54YdyKKDttJwAbXetKmoPCAnlKvihFl23von3N5dWZPItss8tOiBkoAHrdNchhK0PEBY52hyWDC8yCBWqlE3IAOpNhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=oss.nxp.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LB/XXMWMcF6lXZ+dm4s0GmsIhKKPpweAyU9PiNtlTYM=;
 b=gLr837Rus7H8NuF1WADeE069sfBuH0mx83jZ++tWuVbsVEYChRjo8McxCkWUGOlzAy/J31lELlwHJZ2LLWeu5n02ydQGDeLg+hqa39FfZE04656BRxllwECeii51BPDUCuqP2Re6RGhamyPp9b4LIueUgkq3AX8Riy1s9m/5c8vvy2ZO9WhDrbzATgdReT9oF8dGX6soD3zx0JjvKLFWceo6/vnwIiZ/t2eLdy50+ZRLHbNO1eO4Jtsn0wS7wLy9hf5rd9b9sDO/Ur80fXfi35M9ctZLQOeRmTkBoBB6b1jLjRMp/tiK9XOT17wZqKQWiudUqubbUwFi1URJxXiPng==
Received: from AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11)
 by DU4PR10MB9168.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:569::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 08:21:07 +0000
Received: from AMS0EPF000001A1.eurprd05.prod.outlook.com
 (2603:10a6:20b:21f:cafe::f6) by AM9P195CA0006.outlook.office365.com
 (2603:10a6:20b:21f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Wed,
 4 Feb 2026 08:20:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001A1.mail.protection.outlook.com (10.167.16.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 08:21:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 09:22:45 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Feb
 2026 09:21:05 +0100
Message-ID: <108d4a2d-a26e-43b5-9e8c-6f9bcd0d9129@foss.st.com>
Date: Wed, 4 Feb 2026 09:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peng Fan <peng.fan@oss.nxp.com>
References: <20260128103118.3630078-1-arnaud.pouliquen@foss.st.com>
 <20260128103118.3630078-2-arnaud.pouliquen@foss.st.com>
 <aYKZaDn5Q58xdO94@shlinux89>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aYKZaDn5Q58xdO94@shlinux89>
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A1:EE_|DU4PR10MB9168:EE_
X-MS-Office365-Filtering-Correlation-Id: 769a8cd2-ea52-497b-f691-08de63c65827
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDVIZDZ3cFFOUnkvQW4wZEEzcXZvUVhNQS80eWk1SmkwTkZHVVB3WUgwZTF1?=
 =?utf-8?B?eVVSeTZZNFhmM2s3Ui8xNVl1TXlTTytpZDVka213WEVyWGhXS1lodDMzUmFY?=
 =?utf-8?B?dXVPdVVJV2dhYnltYUZrbGlITGdHQ2VlN281R2p1MUhlOWt1MDQ1V0NubGl1?=
 =?utf-8?B?MGcrYmRVYzZnaisrRVZnbGwxTzJ1ejBib3NCdTJjTDByM1RNQTNHWklwSUZz?=
 =?utf-8?B?YktzMjlYTHNiYmM4aDhLcUY3eGUrVEtaTEtQR1hSaWo1aXN1N0NhZ2hnV2tW?=
 =?utf-8?B?a0hCcnBzb0pwS0hkbE5JTEt6anRURXV2cHBzSGVNU0ZYenBmMlFNKzdOVmps?=
 =?utf-8?B?bzdVN2pRZEczVjhXZi9NZDYvSWJ3eVgrTFR6Vzd2Q0NPRGJpbW5qS0thZFlZ?=
 =?utf-8?B?L0xzOGQvcktJbmpPNnlEWGtZN2kzOERaaVpuNDQ3Ylgza0ZZQUVMMzg0SzF2?=
 =?utf-8?B?a01FdTFlQlJ5Y1B2L0Ntb0x1QlFGOC9OZkhpcHB5QnNsbkpmZmIrVW4rVlR1?=
 =?utf-8?B?VG1pU2JvMDdFWHVJK2pIRURwdVYzcFBud2lEelJKYmRaQTd0a1VndUZ1TUJD?=
 =?utf-8?B?TmkwMWhlc0JPSXB2MlR1TWxHWHFOYjQzUUZmanQzUzJqdlRrbzZQQkR3bmlP?=
 =?utf-8?B?cWdPM0NVV05kK00rMEtNQXVSTkpiQWhuMzQzTCtmZ29HWFo3QU0zRTU2cXR6?=
 =?utf-8?B?R1B1QzZzdCtqblUyZXBtL3NCK01md0liRi81a2JwSHB0T2d0NUZ2NG1ZMlVh?=
 =?utf-8?B?QVU4STloc2RjVXdZYi9ibFVoc2tJZ3pyVVJzNElYaVBuUUErczlCMU54OWx3?=
 =?utf-8?B?aGdUWEJOb1ZWNHFNK0pJYmgweUNTVGFrZjRHV081V0JtdHVuNHJpNjBObWJN?=
 =?utf-8?B?NGJ5a0RhYnNVL0prbTFpMXdES0loa0hVTDBOaDNIZCt2ZnBTMVFIVDJsR2px?=
 =?utf-8?B?Zm1lTGVqeEVlMzlYMHNZdHNiYnlBcjB6ajVNQ3hPOHpqS00xR1JRbUVpMmd6?=
 =?utf-8?B?c2xNR1VtZXQvR3ViUGJvYkVzUUJiMFg1KzJJbElsbmVYY01pK09IVkZSVTMz?=
 =?utf-8?B?aWUzaituWExOelF5aThRcTZEdHRobmVOLy83cHZsdlJEcWd4LzVvQlVONm9q?=
 =?utf-8?B?UXBtYTRQakpwcVBqbks1M3dyS3l4SUJzNGlXRE5LK3MrYXR3enhibldMKzFl?=
 =?utf-8?B?TUZrQ201K0xvSFQxK2EwODNOMmdSTUxLU1R3dTNDZXd0U1pRd1NpY1NVbmoz?=
 =?utf-8?B?NGtZVmtrWFF2bnA1aHlnNnJsUVJ3NDh1NzhDUVh3RWtZa1RCclNRQ0Vqb0l5?=
 =?utf-8?B?RGV6QTd0TDFmK2MzcHlIMUlTY1cvdDdoaFIzcVhnai9Ta1MrYnNCdlg2QUZq?=
 =?utf-8?B?Rml0RVZDSkJHMHpNcHpudlQzY3BtYUhhY2FOTUZSRGtJeFFiZDkvRXZINzg2?=
 =?utf-8?B?dDdwNGFUWHc3blY1cFlYY09RMWZSdU1OSzArbjRJNzkrUDljbmZRRFNSOEFF?=
 =?utf-8?B?NldqbjBvWFN4ejZ1Lzk5NEJUdi9Dc1R1Z2Iyb3FxRmZFK1dZenRPMDhQclZu?=
 =?utf-8?B?U0Y4bXAvUmhpZ1F5aFFQK05oRCs5T2Q5bGFsR3ZPUzN0YVdPaytkV1kvNFBP?=
 =?utf-8?B?enlaNW0zbElraFNESVRDd1JZOVRqbWhjeDhsdStzQjNaUkFxckIwRjhLNFpk?=
 =?utf-8?B?NkFKTjhEbWE1SGRJMy91ZnV0RUErTTRVQzFaUkN0ZFo4bjZiTU9nOHNyQVQ3?=
 =?utf-8?B?RGhrc1RtOCtOLzVQS1FjaWN4dndHK1B2YlBScy90YnlBZ0NLWlZ0UlRoUUJZ?=
 =?utf-8?B?c2RIb1puTGcxMUpncmRKeUFEV0RxOU1sOW4ydE92b0FJNUFsd3dtSGVYK09n?=
 =?utf-8?B?Nlp1YTAzcjQvQ09kL0Z0YWR5R0szZzh1Tm1xR2pkVmhaMVdzajRYa3VjTTRz?=
 =?utf-8?B?MUdraExVa3RiUFYzRlVIVXg5ZTI4VjdKd1VMNllHaGNPU0Q3VGJyT2szREJj?=
 =?utf-8?B?U1hPUFU3L2dqeGFpOUwzbEM2cnE4YktFQjBpZWpsNSsrd3d2bUZuVnVkSWJI?=
 =?utf-8?B?S3dPeVlVSFUxN01UMk11V1o0d29wT3I0T2tYOEJsK0NLaFltMDUwSXVxQkww?=
 =?utf-8?B?azl3L004VkhuRWJaV082d2c0OXFVQkhNNVcyTHJHcEZTblUyRVZYTDZzQitv?=
 =?utf-8?B?Z1J0NXNTSG4wOXBrZjdOQXVqYTg5aXBjM215OHVuR3hDSmpMY1JuNXI2Wkh1?=
 =?utf-8?B?Y2RkSWwxUGQ1QzBKZVBoNUZSYWZnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 8NQPxQ1qNxOBEk3MFtgkqqzzfS+ryH+7yObczVXSEsfDQIv6QctuPi9O9EZFrNEAcfikMdjOOz0kABjLv19aTeFy4WDenxemkbYO/NjZ1ttyaNxSiXwVFijR3hXZSEEQ5Hv3xenoQA21PWpCWUzWTH2qJlIJzQoB+ZHSPR6UrVUg3qy1HT3diS+2V3wcA3ONfbV6f1Buv/gjnqqEbfUi5pAy9Kj1porsJ+vRXrT7P4T8OdLvdWOAyNGNotkf7KuFt4vA2tiDNzwIjAsQCn9dlclKd4WMj9CDPPRYOtCo/+seJgVRUNFLPEb8U2stny+C/C8Zwqsj4QV3Fbw3Tfk3JChuNYxVszcQaPYbHXwNrvZja9f/QtKOROCuxFTxxETrVUVm764tL/n8yQ3heI56n1tfpafZiZXSqcBAZcGg1v3lpz9BFJx85wpvK23WLc/y
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 08:21:06.6136 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 769a8cd2-ea52-497b-f691-08de63c65827
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9168
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Davis <afd@ti.com>,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 1/2] remoteproc: core: support fixed
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.89 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,st-md-mailman.stormreply.com:rdns];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:peng.fan@oss.nxp.com,m:mathieu.poirier@linaro.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:afd@ti.com,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 959E1E30DA
X-Rspamd-Action: no action

Hi Peng,

On 2/4/26 01:57, Peng Fan wrote:
> On Wed, Jan 28, 2026 at 11:31:17AM +0100, Arnaud Pouliquen wrote:
>> On systems with multiple remote processors, the remoteproc device
>> enumeration is not stable as it depends on the probe ordering.
>> As a result, the /sys/class/remoteproc/remoteproc<x> entries do not
>> always refer to the same remote processor instance, which complicates
>> userspace applications.
>>
>> Inspired by the SPI implementation, this commit allows board-specific
>> numbering to be defined in device tree while still supporting dynamically
>> registered remote processors.
>>
>> For instance, on STM32MP25 Soc this can be used by defining:
>>
>>     aliases {
>>         rproc0 = &m33_rproc;
>>         rproc1 = &m0_rproc;
>>     };
>>
>> When a "rproc<x>" DT alias is present, use it to assign a fixed
>> "/sys/class/remoteproc/remoteproc<x>" entry.
>> If no remoteproc alias is defined, keep the legacy index allocation.
>> If only some remoteproc instances have an alias, allocate dynamic
>> index starting after the highest alias index declared.
>>
>> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> 
> Tested this patch on i.MX943-EVK(patches for this platform still in my local)
> with dual CM7 and one CM33S:
> /sys/devices/platform/imx943-cm70/remoteproc/remoteproc1/firmware
> /sys/devices/platform/imx943-cm33s/remoteproc/remoteproc0/firmware
> /sys/devices/platform/imx943-cm71/remoteproc/remoteproc2/firmware
> 
> Tested-by: Peng Fan <peng.fan@nxp.com>
> 
> One nit below:
> 
>> ---
>> V2:
>> - Introduces rproc_get_index based on Mathieu Poirier's suggestion.
>>   An update compared to Mathieu's version is that the call to
>>   ida_alloc_range is retained if an alias is found for the remote device,
>>   to balance with ida_free().
>> - Rename DT alias stem from "remoteproc" to "rproc" to be consistent with
>>   keytone driver.
>> ---
>> drivers/remoteproc/remoteproc_core.c | 40 ++++++++++++++++++++++++++--
>> include/linux/remoteproc.h           |  3 +++
>> 2 files changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index aada2780b343..38d6eb1c9483 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -2433,6 +2433,43 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>> 	return 0;
>> }
>>
>> +/**
>> + * rproc_get_index - assign a unique device index for a remote processor
>> + * @dev: device associated with the remote processor
>> + *
>> + * Look for a static index coming from the "rproc" DT alias
>> + * (e.g. "rproc0"). If none is found, start allocating
>> + * dynamic IDs after the highest alias in use.
>> + *
>> + * Return: a non-negative index on success, or a negative error code on failure.
>> + */
>> +static int rproc_get_index(struct device *dev)
>> +{
>> +	int index;
>> +
>> +	/* No DT to deal with */
>> +	if (!dev->of_node)
>> +		goto legacy;
>> +
>> +	/* See if an alias has been assigned to this remoteproc */
>> +	index = of_alias_get_id(dev->of_node, RPROC_ALIAS);
>> +	if (index >= 0)
>> +		return  ida_alloc_range(&rproc_dev_index, index, index,
>> +					GFP_KERNEL);
> 
> Nit: "return ida_alloc_range"

Thanks for the test and the review!
I will send a V3

Arnaud

> 
> Regards,
> Peng

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
