Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJZ2DzFqnWnhPwQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 10:06:57 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D39231843E8
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 10:06:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BD5DC8F285;
	Tue, 24 Feb 2026 09:06:56 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 532D6C08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 09:06:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQJDCH89C0yyKwkHoYgDUhGvU7t+D5PS0VsH5FgUkZMljv8CwxfvEqbXxvswcQvj5KT9OJc0zN2HV8FkB5YvUA/i67GU0mVjUORzVykV7VUMiVhbMrACbOPamMq6Yl9zHdbKH2R5aoJe5VmG9iYLbaqEnkdAvx8NNl3fnsvkzluPB89O91tAwghhcil0xOPm+Vpe3WT0DTevS0Z6dykw6pLmhGqm8VKvNXfU8EBgAqoIb/vYL38YmQ0a2GGTEksAgZLcC8rBchgsswkYh97KOBfwN8C+NgCqAQ2k0D/HceKCEYmBBF2sDSN1nO5ir1dRIUUtZ394VH9D5PiM+5An5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S5X/HWDo2+he06agu2qBUv7fUv5LqhtaWOEaIwYA7o=;
 b=SsnjmtEUxjTt6sfp60a/aI0MFDBhdVJA1Ec8TJx4LKZaztvstffzVOLhoT+eQqrzB745RZKJM3uWt24eI2QL0c9X+l2xXJzIEqAg1nV9GRY9G5XhCequAs50bHeQVAaZnCrRRqhRR0BXTCF/unTh8cXM1WFM8YqxQnckETvp2r3N0TqVHPZ9iyrrq/8BF/VWaVe81d6uguY+GLZsLepI2PL+hIpVlZd1K2p7Jjdjb4/j1hiFK0JFr4bcbNhR23RvxWqm+OTKB3L295BwZjA6s9NljivRFl0UnleAg074+AJBE23X8LF6jp2umVpzuioES5EGXQatLkqfoDB90mXQhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linux.dev smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S5X/HWDo2+he06agu2qBUv7fUv5LqhtaWOEaIwYA7o=;
 b=ESO7V7J7ngJMWsrRE45vI09yCTvP7I4UsAKSmjVwvXtgh0t3w+Fl2bSDf+t63U4YZoWynwxiNJZPZCQx53Zxsul7Qkad0pf/UgbgM6nP98xWJDaGoga+oSOTk2aREiAYUh04FoAGlLSKM+5i/tRkM3VCV+oGmmPMEpZ0nfexGhrK8nDucZ5i4CM1viq+UZDuivrO7f5BTNPTh88YtM83Baq5nPj0+55lQasgLmoY52TfshNknkCW3IuOyyVsDQmKEsHun9wUltoytYfOqffkl350IiPBD0l8Mb6IEVQU71k4sqZl2LyOh/dluJ/NrZSWPWfvC08wuBtJ0WDyP3zMvQ==
Received: from AS9PR06CA0278.eurprd06.prod.outlook.com (2603:10a6:20b:45a::18)
 by DU0PR10MB5653.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:31b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:06:49 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:45a:cafe::7a) by AS9PR06CA0278.outlook.office365.com
 (2603:10a6:20b:45a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:06:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:06:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:08:55 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:06:48 +0100
Message-ID: <17e2aa14-f74c-479c-b471-ed677c302608@foss.st.com>
Date: Tue, 24 Feb 2026 10:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thorsten Blum <thorsten.blum@linux.dev>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20260223211212.344855-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20260223211212.344855-1-thorsten.blum@linux.dev>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|DU0PR10MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a655fe-832a-4fa5-bd64-08de73840b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUgyR0E0RExYclYvQU51TlVMMC9uajJPU2hobHJVOWhDeWdwUmdYKzdnc3lu?=
 =?utf-8?B?eE16MHcrOFJzVDRvdTNDTm93N2xhaCtsajYyRFVzaVJCRDJtR0xJTFovMFd6?=
 =?utf-8?B?RU1pT0pBeGVxTkRIK1JxeHZ4eFhyWWREZi8zSGh2SnVWMXRxcHVpbWtKTWVC?=
 =?utf-8?B?RjJXdkhoa3haWnZrUE5HR2RrWUFaaDNXVDV5K2JPbGFwSnoyeEQrRE4xVGpq?=
 =?utf-8?B?SWdSeWhKbC9MNVJlK2FzdVcza0hQTm9CeGwxblE2N293N0dBNzUrSklPV0pQ?=
 =?utf-8?B?RW02Nlk4NmJ5VzhrMEZyY3JzdW5Yc0NUMi80OEZVYzlpcVJOODVnQng1aEk5?=
 =?utf-8?B?cjh0cXZxTll1RlBlWm9WR2ZNT0RPTDlwKytqeCs4ZjlGQ1V3dmdaS1p6WHNK?=
 =?utf-8?B?YlltYXp4aDhJRStQVDM4SkNUK3JCWElwd0pabjFQcEI0TmVYdVlpRmkzUjg4?=
 =?utf-8?B?QTU4ZXJETGp6eWIwRzcreCtQWEFoMjMwcXVGNkdKSlh4TlVuMTFSUFNsNmsx?=
 =?utf-8?B?N0V6ZVNBTVNtVlZsYzlPSkdRVkoxVUFLMFFMWHEybkFhSXlzMCszVzBuVEg4?=
 =?utf-8?B?eXFwdTRrRXFDa251TllnTnZHZkFPSFgyQ01vdVZGK20wMTlJc2g2bWNEOXJF?=
 =?utf-8?B?UDlHbFlNQUpLTWlJOUt2R1VLSytiaU42QjdCNWdGTHNOcUpXaDN1aWhvUHBE?=
 =?utf-8?B?dFF0Z0I0UWZTalFvWWVQaXE4K3J5T1hublVCYjVqZmhXTDg2U0Q0NU5CS2Zq?=
 =?utf-8?B?QjJzN1FqZDQ0ZGVVQnErRVAwYmNBckpmM01UUFAyOUJyNHl6anpqOXhQaHdW?=
 =?utf-8?B?dlU1N05Bb0xRK1F6b05Udi9MNmhKd1QzZnk5ZVpvUFpBOEhuSU9WUXpMeldN?=
 =?utf-8?B?cEU1bHQzTUZ0TUFGVVdyOWcvbzBvRmsxL3hmVG5NeFNzMlQ2QllJZnBWRytJ?=
 =?utf-8?B?ZDdKcmlPODVqU2oxdCt2eVJGd1lPaTEvekE5VnExc2t5UG1KR09oeCtlb3F6?=
 =?utf-8?B?M1N0eTQwcG10MVJvQlBrL3RjZFJ3bnNQcWVoZVZjZjEwSndwMkt4VXlpSDk3?=
 =?utf-8?B?U0ZGTzZCK2dWd1RoWUx1ZlhWaDRLdEVlSTFrNFZIVEZIeGZwdzNEOVdnSFJD?=
 =?utf-8?B?dFM4SVpSa1MyZWNRa1hhSEVlMmExZVk0cUdZZmg0dk5PY3o4TFJkd1pvRk8w?=
 =?utf-8?B?dFRYdUhpMVJIakVyVWE0RCtZTnFNdERJNGFQVkNqS3B4NzhJRWdPN084TjAr?=
 =?utf-8?B?cHNtb29KRUdNRExrVFhpZWZ5U1JQOGpyQXNyWEVqSVVQdDgxZDM0MHFyekEr?=
 =?utf-8?B?Y0xnZWRUTFM1Z1NJMk1NMkF2TUhzbkpnUUFXWDFxTk01ZkdOWHFGamRLRmo2?=
 =?utf-8?B?V0tZVjdEcGFXU3NDZjBxSXdPT3MzaDMwNnZDUUQ2VjNmS213cXNJdHZsNTRV?=
 =?utf-8?B?K2tRUnlsVXlvZWpyR2M0NFEvaCtDRlNUamczSUt6dkdTSGFXU2RtMVZSQlgw?=
 =?utf-8?B?WFdjaURwWCtkcU1KdDZGbDgyR09oODNiZEg0Ukl0Z0IrQzRMY1I0U2tuZWM3?=
 =?utf-8?B?cTBPRENObEdtZXVyWk0zb3RNYlNWb0xUeUIzbkRlWUg2aThNQ2JoK0MvYVNq?=
 =?utf-8?B?b2JxUlJUY1U5eGEwdGExNHYzenl0ekhxWVZUYUUvc0hmZkFKQWNlY2xKM29n?=
 =?utf-8?B?L3ZSM0FyMmNNUCtXMThnM0ZjUEhHc3FlaGJ6WmszbmFKODgxRjYvMVFwR0xL?=
 =?utf-8?B?RmVQc0xuL3QyeDVPRUgvMzRFc3dIdWc0U0kvNVNnMlBwMDRBZnNsdzkvZ3BC?=
 =?utf-8?B?R1dNRGwwOHk4VXppR3p6ME1Rb0RFNkQ1MWlmcUxiTHlqVHJ4UThIYXlZOGhN?=
 =?utf-8?B?ODUrSEhIeTlSRFE1OWNLR0M3cWZXazkvQ0VFWFdXU3pCTGZPdzFJUVNRSkdx?=
 =?utf-8?B?akU2d0pZcmJnQ21sY28zNU14NjlYckJ5SzJhNzU1eStnUTFuRzRuQlZFOFpI?=
 =?utf-8?B?Tkk1K1RUcVBGVFpYdXREU1hyVmQwamdjRHpPRnY4UThZeHZvdGpKT1BQQ0Rv?=
 =?utf-8?B?bmxUWmFnbmpmei9GZGNVUzFOS0UzNThoVElyMEM0akJKUVFiZlRMQjhFNkkv?=
 =?utf-8?B?NkRGTW1mdTFvSXZva2dabDB3Nm1tdHpicm1WZjZlcS9HVm05QnJRK0tPczZB?=
 =?utf-8?B?WVRtQW5mSDYxWFNTMFZiVVBlbzRDQ3FvMzdVMmEwTUZzQzcyYzJ3M2pYNFNU?=
 =?utf-8?B?WENGWGtPMjZqOUJxV0oxeUtxUWF3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Pu4bZ84ECkG0QtBPNETbItwBR4lUfI8vzW244R6mxAsT9NqSTU3v5YXLRRd/+CXUXip+/77sqUAdDA5nKcEJ+h7WdFYEh9+d5l2M/jpEs15Xs47VLOq6bKjPVYFKjtj4igWNnY9Oe7pKrlWEruJ42gJmWJqe7iJ0pbI8yTbbNH+3gguleaYCt3NtR4WAts9HYbHP7PUBcOFDmSBSmZbYN/ntmq+QNEUMiTMxg58AGLBrMXC9adEo3B4r96z1ZojoMbgMfGk+Hwub9og2Y2C4VN2+43qAlbr6YKBpulXuCcq5BH5fsK/JO7Vaik3ItFw1R0O/XI+qeL5zHmjBNJF721DnCz9qbsR4uzv9coYFcwbMtly0bGGF8TLlmCYlxiBZm2+mXfbBXpVuQTnze5fOvBcgiVbwQE8xAlx9TVdBOIUuCo0Zh11qGdrD8G5YIZ2D
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:06:49.1273 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a655fe-832a-4fa5-bd64-08de73840b16
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5653
Cc: linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] bus: rifsc: Replace snprintf("%s") with
	strscpy
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:thorsten.blum@linux.dev,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,linux.dev:email,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.984];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D39231843E8
X-Rspamd-Action: no action



On 2/23/26 22:12, Thorsten Blum wrote:
> Replace snprintf("%s", ...) with the faster and more direct strscpy().
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   drivers/bus/stm32_rifsc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
> index debeaf8ea1bd..ba65ad21434b 100644
> --- a/drivers/bus/stm32_rifsc.c
> +++ b/drivers/bus/stm32_rifsc.c
> @@ -15,6 +15,7 @@
>   #include <linux/of.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> +#include <linux/string.h>
>   #include <linux/types.h>
>   
>   #include "stm32_firewall.h"
> @@ -450,7 +451,7 @@ static void stm32_rifsc_fill_rimu_dbg_entry(struct rifsc_dbg_private *rifsc,
>   	const struct stm32_rifsc_resources_names *dbg_names = rifsc->res_names;
>   	u32 rimc_attr = readl_relaxed(rifsc->mmio + RIFSC_RIMC_ATTR0 + 0x4 * i);
>   
> -	snprintf(dbg_entry->m_name, sizeof(dbg_entry->m_name), "%s", dbg_names->initiator_names[i]);
> +	strscpy(dbg_entry->m_name, dbg_names->initiator_names[i]);

Hello,

I was expecting a third argument but looking at string.h I
now see it's optional if dst is an array. So:

Acked-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Thanks,
Gatien

>   	dbg_entry->m_cid = FIELD_GET(RIFSC_RIMC_MCID_MASK, rimc_attr);
>   	dbg_entry->cidsel = rimc_attr & RIFSC_RIMC_CIDSEL;
>   	dbg_entry->m_sec = rimc_attr & RIFSC_RIMC_MSEC;
> @@ -469,8 +470,7 @@ static void stm32_rifsc_fill_dev_dbg_entry(struct rifsc_dbg_private *rifsc,
>   	sec_cfgr = readl_relaxed(rifsc->mmio + RIFSC_RISC_SECCFGR0 + 0x4 * reg_id);
>   	priv_cfgr = readl_relaxed(rifsc->mmio + RIFSC_RISC_PRIVCFGR0 + 0x4 * reg_id);
>   
> -	snprintf(dbg_entry->dev_name, sizeof(dbg_entry->dev_name), "%s",
> -		 dbg_names->device_names[i]);
> +	strscpy(dbg_entry->dev_name, dbg_names->device_names[i]);
>   	dbg_entry->dev_id = i;
>   	dbg_entry->dev_cid_filt_en = cid_cfgr & CIDCFGR_CFEN;
>   	dbg_entry->dev_sem_en = cid_cfgr & CIDCFGR_SEMEN;

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
