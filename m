Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KjOMCFHpWkg7AUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 09:15:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FFD1D483C
	for <lists+linux-stm32@lfdr.de>; Mon, 02 Mar 2026 09:15:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4E306C35E2B;
	Mon,  2 Mar 2026 08:15:28 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8267EC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  2 Mar 2026 08:15:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okEnmQXzJoruVOykxcbPTNJ6LPaXiBi+aXOzqxdQfFgO85Rkoel5brvDqzq0wr8knT48CJ2Pn7FNGuuEzrkelF1bVU+13s7Fgb+OnA6b28UYeQ5OdqOydYYnEivkvZ6T0z5vn+kDXVEOA5JeQ3dzDpPhY3Qhg1V5LLMD67oX2XVF29FcWVGi3nQWMqoKF/+7fWSLvAzsenpht5Oih5cpzViHak9vxiKzqJ4AXjaq3h7ANrAncr2M5101oR8LwCWIRfoppR1WDIt/ICKbcKM7kTs4vNJIKBS7hzbhAG3nn1zxuCsT+SeBVOneNRclhLn5M0qkoUCN+6A0MpuX86EtpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0C8EFJIojzx0y8Hgn3zZJ0+/K4ss9RUxQ+deTNNJAmQ=;
 b=bGJrAcM4HRHqQ78/WsXIFlCdna24IGK0gNVvQFlnwfrulXJWtcFNGjV8UQznnq4e23hUUquxYCMcya16XBDsB/E7THwI1GHSc1hNlzV0Cvuts5RweuS5aHVSLVhzIcA3+fv8/c6QkBW8QxjWDK0MdKa8WVTPghY3s8c6kqfpTbcPh9OZ+fsjINKA6NvlgoXC49uHKHw3+kxLyyti+0pFyW5TmKxZXQEbZ7NID2dfL1s/a8GoBB95RFQbgTUc+YftPhNpC0N3cDpG0IMRGyfXkA1jDZReZgupVFE6kH3M2+Dc+ozjmb2iNX9UO8XvOdft1035ucHwnZ12VKiGLnjWnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0C8EFJIojzx0y8Hgn3zZJ0+/K4ss9RUxQ+deTNNJAmQ=;
 b=S26jE+9AGvE6Iens6PY2lkm62rYX1l1QOE3ANs5B0OMmLwJ7KyRSUDznDzVfyKbh7rcpIR+YGNbDq/GLdSGgkrDzwgdzFjgTC8EYq0aeix8O2Lv8NdOyZipt9EahswaE3OYBNMPhTQ+tIYchyRdPE/NVcv+xApFN8b3ROrqKjKwqCOuXCcCTGdKyHs1BHroxb/JqraDHFSJlOYJ1RSIkYoTMXA98jV1OGWqqgKWpJNHH6NiEsSp5jXm7vQHt5XatPl+z6wiiXTRRWRNU+Sa81tl6QdOqtXJNrHnlha4QozwikrjPa+cDv3qsBuKhxUqD7PgQNU1HuSvQ2x8vsk5a9g==
Received: from AS9PR04CA0122.eurprd04.prod.outlook.com (2603:10a6:20b:531::24)
 by PAVPR10MB7515.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2f6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 08:15:24 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:531::4) by AS9PR04CA0122.outlook.office365.com
 (2603:10a6:20b:531::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.21 via Frontend Transport; Mon,
 2 Mar 2026 08:15:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 08:15:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Mar
 2026 09:17:41 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Mar
 2026 09:15:19 +0100
Message-ID: <9a53fee8-3194-488c-a04d-2070d91fc6ce@foss.st.com>
Date: Mon, 2 Mar 2026 09:15:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <linux-arm-msm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
 <767cafff-1ce1-4291-bcda-7a9027efc32b@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <767cafff-1ce1-4291-bcda-7a9027efc32b@oss.qualcomm.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|PAVPR10MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: a7d4e270-502c-439d-05ae-08de7833da79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: c+mADtvIhIHGuxx1kvrqjXYL6TzI95VCflt4Bh1n3YjBlS3Puv7M45XKJN5rSL5om0oKRUqpgSX71uKzkryyLFri2uOdpLZSoUrpwpMwe4hyIN3h+ws0smWblbB/MxV8UV+y7ha0loF5eaMLesSPSWCR9QU07VhVIXdx6xWML96k6CXwY71AKu0w67mKmKxinSj2VT7i3Z6coMgJ0u0GP4hssmcE0xFQ2t5V1ddYD+QUKUgJ+g4N+kmfBq5oaIjZ6gvd54W3tYYiMtKqJi8Qn+TVEcRBrC/b0O8Hko5ZUZIcfl0ogBoYY1TWjhWk2XJBp8PXdCdHH2jHcrZfiIu4/Yu0yohoJfinj9sae3vsc0Lor3kpdM1kZSnG2K2mr/bN28nJMbPl5r6DQrS52vW8wgPZA4D+FGbVgsRHNCO0Dyk55YVibYlkEZ5a2ivW2/8l25OWfKgTCUYR6+I6CL6cv9dhtgVRgGB60p1K/N1osXyaBUCSbqFJmvVirYTHLpcoBff5IweK4acleVs1S74JJ8hCciGwyRXHwtynMOd0IhLrM4+KuKgGDJmgKQsDIA8hiIqgOAmb7x6YAJPMfljEUtRgWz/nTyOPyG1PauCcAZcJ8Nw7uREdy41UaPQpMypaehVyFS/yUc2d5cHfLcWcJJ4gzKcTQmG0ci0PCywIACW0w1hrkIWTy1W0ioNfmTVUCYpwqFTqAwehJn/yqjViAnr2GoadFijHdIXY675xWsuxWPFUxQuTTA7bknroKCvdZlgUWubxujwtWkQ3hnRYQ3paOd2fKiihdZaEKTs1KSxpQybT/cYB+Ev4iZcwNKAJLP9n64TsU3vIad1t9m4a2w==
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NuFCnPWG9woXWvREWA+8Z9CvfZ+h+1DJIqZDegF24rIOipnE5w1itzOcRmdSkzE746WBh1J/a7iJznGYZlCyo/eBZ1+apWokzDkc21wk752R68LoNkMw93bCE6vs8mlmWGxXucybXn7OPERIIzy2CxJQUT6+mzoyVR9Sm396xS2QvYYgDBRvPStOR7HZFta26AQ4BITG6erRE/F7NFcZ64plKB09xWj2L1j1GIEDj9M+zTPTmL90Er4OH1MjFpngC3y0mhpqMlJ5GpO42ViG9PpK7L/tUzhxmJ0MRu44usdwpt4YQ+tnVEBBqT2k5A2Y3ZI4kgQxWuBkb65j+V7x4qSXNOKlvdg+dLRW9KUrGPRupxg8cJooZOgiuQAXJ+os3nHqv9M3u4HVfjOqXT/VZtf9Ab+xkiyCdI4smMFIbizYFqzz2YkjXI07UjGj5wKG
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 08:15:23.6407 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7d4e270-502c-439d-05ae-08de7833da79
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7515
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] bus: stm32_firewall: Use scoped
 allocation to simplify cleanup
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:gatien.chevallier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:jonathan.cameron@huawei.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,foss.st.com,gmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,stormreply.com:url,stormreply.com:email,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.torgue@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.971];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E5FFD1D483C
X-Rspamd-Action: no action



On 3/1/26 15:12, Krzysztof Kozlowski wrote:
> On 05/01/2026 15:37, Krzysztof Kozlowski wrote:
>> Allocate the memory with scoped/cleanup.h to reduce error handling and
>> make the code a bit simpler.
>>
>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> ---
>>
>> Changes in v2:
>> 1. New patch
>> ---
>>   drivers/bus/stm32_firewall.c | 10 +++-------
>>   1 file changed, 3 insertions(+), 7 deletions(-)
> 
> Is anyone picking up patches for stm32?

I will.

> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
