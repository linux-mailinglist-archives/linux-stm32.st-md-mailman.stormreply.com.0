Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xvhkGq34hGn77AMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 21:08:13 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B9931F708A
	for <lists+linux-stm32@lfdr.de>; Thu, 05 Feb 2026 21:08:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3199DC87ECD;
	Thu,  5 Feb 2026 20:08:12 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013018.outbound.protection.outlook.com
 [40.93.201.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 85662C290A0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Feb 2026 20:08:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyWbFLxokiVNRIvuue3WqJIY57QBCVALqlaqiSmZnQsXEN6yCwOyV07Pvx9OQTZZLOu7O8ZDq8paH+Q29xsY4os+Dxkuo3MvHjEzAgJLT7XdDs2Jcn6Vl4UHN1LcggOqbiA8m7cXRLV9mVLoeaSSQf7awu719TXQbh3bLbLNM2Fby927xLVI451RNiRK2ukKgWLh4pAYSdnrIbmHv4BKZk94p8wf0mxkYPYgDbGRTD70PfrgcsNCSfDCysp9a9ucv/Fa0JKs6XqTM0PPFM+TgtuhswcUNivoQUsxK1MyGgIQ739619R+GLgrQA4q7CoNLRJpoF5s+7f0Ka68znlKsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VlQ9fn7jgTAY2Bpv9ysAPoUy4+Kw/XZsIf6Misinn8=;
 b=wkF072XiNyVx/n0s4WbbGvEqoNHt3AM1/CcZiFitCKUaW0l8DHECST5u0Yb6tfkSNRDlw99lwyetQMcInNOWqMkMr+pePL1Cg/hrnqFNXFspQX2LmQDd3T0iWs7TUVrakrIi8KTw0Xrj26P8z+S9tGXUyUwrKUQE+NKugu8Yd4/Fmy2vL3y+d4ZBLZ4T/daVAkjWOOCPaC+Oz6rl0PT5s4LDklicRV7XfeN4aojd6mqujcCGfXtkXZ2kq6hy4fdN4bzVvGW+nRlCndiMJ9Rx+qsaE/AphjpQdTXVaPEWf2Z8Ryyq0mwo2Dq72wbislFfJWTeeCWmIMoAmOHTbq+N0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=ti.com; dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VlQ9fn7jgTAY2Bpv9ysAPoUy4+Kw/XZsIf6Misinn8=;
 b=ZpCT2MHqKCLsbMCYD3pMvjt3LJPzKSmXQI4AeVU6go6bB0NDJwXRw6LVZfHoec06UW4zvzCXXWtp86Q/p6DDwWof1Q/pPNEqMBfHZwS+Pl3UYNtWj9/97GkQuxmbt/OH0KxL0/Zj1ZNlM+0xnbiewq2RFCWRb1EF/EQ6M3dxEDQ=
Received: from SJ0PR05CA0125.namprd05.prod.outlook.com (2603:10b6:a03:33d::10)
 by SA1PR10MB5736.namprd10.prod.outlook.com (2603:10b6:806:232::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Thu, 5 Feb
 2026 20:08:07 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:33d:cafe::58) by SJ0PR05CA0125.outlook.office365.com
 (2603:10b6:a03:33d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Thu,
 5 Feb 2026 20:08:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 5 Feb 2026 20:08:05 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 14:07:49 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 14:07:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 14:07:48 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 615K7mUQ4009717;
 Thu, 5 Feb 2026 14:07:48 -0600
Message-ID: <b9b478ea-cec7-4b5b-8ae9-d0574c4eb02a@ti.com>
Date: Thu, 5 Feb 2026 14:07:48 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Bjorn Andersson
 <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
 <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
 <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
 <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|SA1PR10MB5736:EE_
X-MS-Office365-Filtering-Correlation-Id: 76439056-99cc-4624-b8a3-08de64f24677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVh3c3dpT2Q1R29nQ1daWUhMYUlpc0tTZy9nSnoweEFPNHZBV3VXaFFzaENN?=
 =?utf-8?B?VXU4elZCcmtuS0RMcDZXQVJUV3dCYVFFUmtPSFRTMnZ4WEwydzZUQlhBNDNM?=
 =?utf-8?B?NVhsa09vMjhGWXk5bXdiKzFEblc4cUpMc3NCYmIybTRGUndycmdwc2ZKQlVl?=
 =?utf-8?B?WEt6U05PTmoyb0FTOVhpVGFhbFZkOVdrZFZUUm9xQUt2VTJPTFQ1YkNFZ2FJ?=
 =?utf-8?B?OXJMVTRSTk5tZkoxaFBNKzd1azFHQ2hrRWtUVnFDK3BPc00zUHNDdkZoQUVN?=
 =?utf-8?B?clpmNXh3Vmh3NmhzT2xteHFOY1NLd05BUGV3T3Z6YXMwcEM3ZjZHRWJpRUMy?=
 =?utf-8?B?UEVvcEh5T0Zkd2NpLzlEUC9KdmM2WWVhTmYxYVBEU3ZldStpQUdkaExwTzZq?=
 =?utf-8?B?ZVJWOEt4QkpwZGQvVkRkbzIvUkpUS0o5cHRZZE92WlBaU203bExXcmtQUE5s?=
 =?utf-8?B?b1NqWFV3cUh0dnovRFRUR1VOaXJQUTV4R1NlQmpwRFcrRjgyMWhKQWJCdFRQ?=
 =?utf-8?B?amFjY1k5VCt5cHhxSTFadDZKQWRQNmlCWVlKdlV3emtqbU5tRHlJdHc5QTUr?=
 =?utf-8?B?RVlOdjFaODMwNElXcHBwMSs2V1V0eVJ1ajRkWnlSMGVoQkV5QmhmQStyWm9N?=
 =?utf-8?B?NTZ2ako4TzFRZXpVL3BNMHBPdC9PWnArOERGZ3FLYlJoS0hEQXdqb2RpZnYx?=
 =?utf-8?B?ZDg5Q3dpYUJ5ZmhoNHR3SlQrY2t0akUxV3hZajVOYTZBT004N0N1bWNwVXU0?=
 =?utf-8?B?ODFWVmsvQ2tqeDR6Y1AyWjBPOFRZa2xKa1I0dlRPdEVIMFVDVFBwNTN2RmNi?=
 =?utf-8?B?MFBnZFo2OFc0TmtYWXpZY3pmMkhNVTlmMUhTemNMdVRDR21WVTVHcXZwUytO?=
 =?utf-8?B?RjRQSHI2R1M5aGtCanUxbUVhVDR3S2txYTV1LzRKZUFIZUpzYnBwMEhVbEw1?=
 =?utf-8?B?NHl3d1YrZ2MyRGtqZ1pnU3pGTEVNNFc0cjI1UXRKM3BqbmE4Z2VZMzNFUzdt?=
 =?utf-8?B?YXRZQ2JGNytCTmJ1ZTVOd2Vpb25VeCt1NHFKS1M1RjZrWTYwUktkNU9QWTNU?=
 =?utf-8?B?djA1Nm5HditKK3plVTUzMXozWDZXV1BWUjhodkFJU3U4YnJPVUc3Z2g0MGhj?=
 =?utf-8?B?aUpKQzRoeFFBNWN2dEdhTHhUSzY5MzZwalQyT204RDdkYUN2RXlJSGlkT3Y3?=
 =?utf-8?B?N3R3SVp2eldsL2VtTFMzMkZMbTBFa2NyWCtvMnVaemFhZk9HTVJURllwSnU2?=
 =?utf-8?B?cG83QzVJUy8vR20vcEJDVWZCeGh2V3k2VnJ3UW9jazEwdllWbmpkNHIrSUxO?=
 =?utf-8?B?VUdIUElTMVJoTWFSZC9zV2lrTEgzRFQ4dUZMTWpJV3JkVVBNZGx1UUJNR1Zm?=
 =?utf-8?B?NWxHNjd1SXQzL0F2YmxCdG5zK2RRNDJzdEFyN0dncE9ZaXM2ZCtJcjJnWUl4?=
 =?utf-8?B?MzJnKzhCQlJPcEdsSlVHdnlEYUliQWptenhjWnlIWitrY2dzajJJU0d5T3ht?=
 =?utf-8?B?bFh5eDdPc3FxdUM4TjdzOWFlTHRwSmIzdFBYZUNraXowZWZZUUNCcFF0Zy9D?=
 =?utf-8?B?Z0Q5d1o3cTU0ZDdRbkxqQzVoaGEwVVFyUFhEamJ3QU5DTzBuNWw0Q3pzSjM2?=
 =?utf-8?B?NUlOWmlNOW52TFJQOTVHVEp4elV1MjR2SUN0VE9VdDJNYWIwbGF4SVNGQm1a?=
 =?utf-8?B?bVlLUmF3c0dxbGtCWEU2OEhoTDdVNjBxdjNvSXNuUHlvV3pOc0xuQko2Q3o1?=
 =?utf-8?B?MTI1M05FQVpLdjZCZzZYdGdpa096aGl0eWt4N2NMSFJGaFZzbmI1cnVaa0dF?=
 =?utf-8?B?WVk3VXZObFJOSmFjMDU1YWZucGxVanR2NVRHMDlPcE1sNktETkxGUTI0ZEYv?=
 =?utf-8?B?Y3J2M2xHYkRGM1VZamR6L0IvS1VzTGszQWZlZEs0ZndrNVhKOXF1MmhYNUwx?=
 =?utf-8?B?eDd3VnRsdzh4T3MrQkppdTI2MkxjWDk0V1Y1NFRtZWF5VlgyemxFMHFxZ1ox?=
 =?utf-8?B?ZU5EcjlIcEtvc0hGQTc2aGhvbkhROElpMGZHdlpJQ3BqVjNsbTVyZTZBdTdz?=
 =?utf-8?B?Ni9BdXFXN1JHQjJvc3granJLemltTkNjekxiTmp3Q29tZDNpbXQ0ZkRZTzVY?=
 =?utf-8?B?YjBYZTlnbHhEMEJOYmhhSnNKeW9FZGlzQWNEZkRRS1hreWdBSW5HUWhEcEtN?=
 =?utf-8?B?Uk1GL2hoYUtHQzZJM3RORzBack1RcHo5ZnJlRVFlaTFjVlZXYjMxancrOHQ1?=
 =?utf-8?B?K08xelpHR1hDcys5aU9uNm9POXJ3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet201.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0MWnRePpgEKupU7kxIqaXtfXqKiokrCRpnAe+zZhdnIbFVtTtC12Fn4D3fLln/LSqehHLAwL4SaD/cFj95nmxcD4TFp0N5bOKOD6a74JfvFHVbo+eiqBYMh1iIafnfRksxymWnEspJs6zIq6qD7iduPhbnAUZkJ1xxwbGyq0epjk0MeOPt1KIJ63YoRgQ6+d+Y1dKom8X2bbzi80dXrKvIROJxF55eJ8Nw0Oq58EjO9PFafg0jXFt4XquGqp7p6hrqwCRiZ1VW8J103uY2PFyTqfj/gYE2AFqqBoQ8uDkRerVeJca9d4/W2TD0hx/KHbbY5A88ih5feC+i+MBt60VQKgk20ZKdhfcDUVy7hP3ZNKyQDy5GFn1W9SUKXQ3HXS4C4bRt3uSSBFnPLfM+Jwz4US0fEDvwmT/SHjYFs4Cig7W+BN1AnRXJ++x/Icru26
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 20:08:05.8929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76439056-99cc-4624-b8a3-08de64f24677
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.195];
 Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5736
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
X-Spamd-Result: default: False [4.39 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[ti.com : SPF not aligned (relaxed),quarantine];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[ti.com:s=selector1];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:arnaud.pouliquen@foss.st.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[afd@ti.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[ti.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[4.135.171.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B9931F708A
X-Rspamd-Action: no action

T24gMi81LzI2IDExOjU4IEFNLCBBcm5hdWQgUE9VTElRVUVOIHdyb3RlOgo+IEhlbGxvLAo+IAo+
IE9uIDIvNC8yNiAxNTo1NywgQW5kcmV3IERhdmlzIHdyb3RlOgo+PiBPbiAyLzQvMjYgNDo1MiBB
TSwgQXJuYXVkIFBvdWxpcXVlbiB3cm90ZToKPj4+IE9uIHN5c3RlbXMgd2l0aCBtdWx0aXBsZSBy
ZW1vdGUgcHJvY2Vzc29ycywgdGhlIHJlbW90ZXByb2MgZGV2aWNlCj4+PiBlbnVtZXJhdGlvbiBp
cyBub3Qgc3RhYmxlIGFzIGl0IGRlcGVuZHMgb24gdGhlIHByb2JlIG9yZGVyaW5nLgo+Pj4gQXMg
YSByZXN1bHQsIHRoZSAvc3lzL2NsYXNzL3JlbW90ZXByb2MvcmVtb3RlcHJvYzx4PiBlbnRyaWVz
IGRvIG5vdAo+Pj4gYWx3YXlzIHJlZmVyIHRvIHRoZSBzYW1lIHJlbW90ZSBwcm9jZXNzb3IgaW5z
dGFuY2UsIHdoaWNoIGNvbXBsaWNhdGVzCj4+PiB1c2Vyc3BhY2UgYXBwbGljYXRpb25zLgo+Pj4K
Pj4KPj4gV2hpbGUgSSB3aWxsIGFncmVlIGl0IGlzIHNsaWdodGx5IG1vcmUgY29tcGxpY2F0ZWQg
aW4gdXNlcnNwYWNlIHRvIGxvb2t1cAo+PiB0aGUgZGV2aWNlIGJ5IG5hbWUgc3RyaW5nIHJhdGhl
ciB0aGFuIGJ5IHNvbWUgc3RhdGljIG51bWJlciwgdGhlcmUgc2VlbXMgdG8KPj4gYmUgYSBnb29k
IHJlYXNvbiBmb3Igbm90IGRvaW5nIHRoaXMgYWxzby4KPj4KPj4gTXVjaCBsaWtlIG5ldHdvcmsg
aW50ZXJmYWNlcyB3aGVyZSB0aGUgL2Rldi9ldGg8eD4gY2FuIGNoYW5nZSBlYWNoIGJvb3QgYW5k
Cj4+IGF0dGVtcHRzIHRvIG1ha2UgdGhhdCBzdGF0aWMgZnJvbSBrZXJuZWwgaGFzIGJlZW4gdHVy
bmVkIGRvd246IGhhdmluZyBzdGF0aWMKPj4gaW5kZXhlcyBkb2Vzbid0IG1ha2UgdXNlcnNwYWNl
IHNvZnR3YXJlIGFueSBtb3JlIHBvcnRhYmxlLgo+Pgo+PiBTYXkgeW91IGxvY2sgeW91ciBNMzMg
Y29yZSB0byBycHJvYzwxPiBvbiBvbmUgU29DLCBpdCBkb2Vzbid0IG1lYW4geW91ciBuZXh0Cj4+
IFNvQyB3aWxsIGhhdmUgdGhlIHNhbWUgcnByb2Mgb3JkZXIsIG9yIGV2ZW4gaGF2ZSBhIE0zMyBh
dCBhbGwuIFNvIHlvdSBzdGlsbAo+PiBuZWVkIHlvdXIgdXNlcnNwYWNlIGNvZGUgdG8gbG9va3Vw
IGFuZCBjaGVjayB0aGUgbmFtZSwgb3RoZXJ3aXNlIHlvdSBtYWtlCj4+IGJhZCBhc3N1bXB0aW9u
cy4gTm90IGhhdmluZyBzdGF0aWMgSURzIGZvcmNlcyBzb2Z0d2FyZSB0byBkbyB0aGUgY29ycmVj
dAo+PiB0aGluZyBoZXJlLgo+IAo+IFRoYXQgd2FzIGFsc28gbXkgaW5pdGlhbCBhcHByb2FjaCwg
YnV0IGl0IGlzIGRpZmZpY3VsdCB0byBpbXBvc2Ugb24gb3VyIGN1c3RvbWVycyB3aG8gaGF2ZSBs
ZWdhY3kgYXBwbGljYXRpb25zLCBlc3BlY2lhbGx5IHNpbmNlIHRoZXkgYXJlIGFjY3VzdG9tZWQg
dG8gdXNpbmcgZml4ZWQgaW5kZXhlcyB3aXRoIG90aGVyIGZyYW1ld29yayBBQklzLgo+IAo+Pgo+
PiBUaGUgb25seSB2YWxpZCByZWFzb24gSSBjYW4gdGhpbmsgdXAgaXMgbWF5YmUgdGhpcyBtYWtl
cyBib2FyZCBzcGVjaWZpYwo+PiBkb2N1bWVudGF0aW9uIGVhc2llci4gT25lIGNhbiBzYXk6Cj4+
Cj4+ICJPbiB0aGUgU1RNMzJNUDI1N0YtREssIGNoZWNrIHRoYXQgdGhlIE0zMyBoYXMgYm9vdGVk
IGJ5IHJ1bm5pbmcKPj4gYGNhdCAvc3lzL2NsYXNzL3JlbW90ZXByb2MvcmVtb3RlcHJvYzMvc3Rh
dHVzYCIKPj4KPj4gd2l0aG91dCBoYXZpbmcgdG8gZmlyc3QgZmluZCB0aGUgcmlnaHQgbnVtYmVy
IGJ5IGNoZWNraW5nIGVhY2gKPj4gYHJlbW90ZXByb2M8eD4vbmFtZWAuIEJ1dCB3b3VsZG4ndCBh
ZGRpbmcgc29tZXRoaW5nIGxpa2UgYSBuYW1lZAo+PiBzeXNmcyBkaXIgc3lzbGlua3Mgd29yayBl
dmVuIGJldHRlcj8KPj4KPj4gYGNhdCAvc3lzL2NsYXNzL3JlbW90ZXByb2MvbTMzQDc2MDAwMDAw
L3N0YXR1c2AKPiAKPiBUaGUgb25seSBiZW5lZml0IEkgY2FuIHNlZSBpbiBjaGVja2luZyAvc3lz
L2NsYXNzL3JlbW90ZXByb2MvPG5hbWU+L3N0YXR1cyBpbnN0ZWFkIG9mIC9zeXMvY2xhc3MvcmVt
b3RlcHJvYy9yZW1vdGVwcm9jPHg+L25hbWUgaXMgdG8gYXZvaWQgaXRlcmF0aW5nIG92ZXIgZGV2
aWNlcyBieSBuYW1lLiBIb3dldmVyLCBpbiBib3RoIGNhc2VzLCB0aGUgYXBwbGljYXRpb24gc3Rp
bGwgbmVlZHMgdG8ga25vdyB0aGUgcmVtb3RlIHByb2Nlc3NvciBuYW1lLCB3aGljaCBpcyBwbGF0
Zm9ybS1kZXBlbmRlbnQgYW5kIHVzdWFsbHkgZGVmaW5lZCBieSB0aGUgZGV2aWNlIHRyZWUuCj4g
Cj4gQXQgdGhlIGVuZCwgdXNpbmcgYW4gaW5kZXggaGVyZSBpcyBzaW1wbHkgYW4gb3B0aW9uYWwg
YWx0ZXJuYXRpdmUgdG8gdGhlIG5hbWUsIGFzIHNlZW4gaW4gb3RoZXIgZnJhbWV3b3JrIGltcGxl
bWVudGF0aW9ucy4KPiAKClllcywgYm90aCBuYW1lIGFuZCBudW1iZXIgYmFzZWQgaW5kZXhpbmcg
d2lsbCBiZSBwbGF0Zm9ybS1kZXBlbmRlbnQsIGJ1dAp0aGV5IGFyZSBub3QgcHVyZWx5IGVxdWl2
YWxlbnQuIFRoZSB0aGluZyBJIHdhbnQgdG8gYXZvaWQgYWJvdXQgbnVtYmVyIGJhc2VkCmxvb2t1
cCBpcyBpbiBkb2N1bWVudGF0aW9uLiBJIHNlZSBkb2NzIGFscmVhZHkgdGhhdCBzYXkgc29tZXRo
aW5nIGxpa2UKCj4gVG8gc3RhcnQgdGhlIFI1RiBjb3JlIHJ1biB0aGlzIGNvbW1hbmQ6Cj4gZWNo
byBzdGFydCA+IC9zeXMvY2xhc3MvcmVtb3RlcHJvYy9yZW1vdGVwcm9jMi9zdGF0ZQoKQW5kIGZv
bGtzIChvciBMTE1zIGJlaW5nIHRyYWluZWQgb24gdGhlIGRvY3MpIG1pZ2h0IGFzc3VtZSB0aGlz
IGlzIGluCmFueSB3YXkgYSBwb3J0YWJsZSB0aGluZyB0byBkby4gV2hpY2ggd2Uga25vdyBpdCBp
cyBub3QsIHRoZSBudW1iZXIgbWlnaHQKY2hhbmdlIGV2ZW4gYmV0d2VlbiB0d28gcGxhdGZvcm1z
IGZyb20gdGhlIHNhbWUgdmVuZG9yLiBXaGVyZSBhcyBpZiB0aGUKaW5zdHJ1Y3Rpb25zIHNhaWQ6
Cgo+IGVjaG8gc3RhcnQgPiAvc3lzL2NsYXNzL3JlbW90ZXByb2MvNzgwMDAwMDAucjVmL3N0YXRl
CgpJdCBiZWNvbWVzIGltbWVkaWF0ZWx5IG9idmlvdXMgdGhpcyBpcyB2YWxpZCBvbmx5IGZvciBh
IGdpdmVuIHBsYXRmb3JtLgoKVGhlIG90aGVyIHRoaW5nIEkgd2FudCB0byBhdm9pZCBpcyB0aGUg
ZXZlci1ncm93aW5nIGFsaWFzIGxpc3RzIGluIERULgpDb3VsZCBiZSBkb25lIHdpdGhvdXQgaGF2
aW5nIHRvIGFkZCBhIGxpc3Qgb2YgYWxpYXNlcyB0byBldmVyeSBEVC4gSXMKdGhlcmUgbm8gb3Ro
ZXIgaGV1cmlzdGljIHRoYXQgd2UgY291bGQgdXNlIHRvIHByb2R1Y2UgYW4gc3RhdGljIG9yZGVy
aW5nPwoKQW5kcmV3Cgo+IFJlZ2FyZHMsCj4gQXJuYXVkCj4gCj4+Cj4+IChhbmQgeWVzIEkga25v
dyBzb21lb25lIGhlcmUgYXQgVEkgZGlkIHRoaXMgYWxpYXMgbmFtaW5nIGZvciBvdXIKPj4ga2V5
c3RvbmUgcGxhdGZvcm1zLCBidXQgaWYgbm90IGZvciBwb3NzaWJsZSBiYWNrd2FyZHMgY29tcGF0
IGJyZWFrcwo+PiBJJ2QgbG92ZSB0byByZW1vdmUgdGhhdCBvbmUgYWxzbykKPj4KPj4gQW5kcmV3
Cj4+Cj4+PiBJbnNwaXJlZCBieSB0aGUgU1BJIGltcGxlbWVudGF0aW9uLCB0aGlzIGNvbW1pdCBh
bGxvd3MgYm9hcmQtc3BlY2lmaWMKPj4+IG51bWJlcmluZyB0byBiZSBkZWZpbmVkIGluIGRldmlj
ZSB0cmVlIHdoaWxlIHN0aWxsIHN1cHBvcnRpbmcgZHluYW1pY2FsbHkKPj4+IHJlZ2lzdGVyZWQg
cmVtb3RlIHByb2Nlc3NvcnMuCj4+Pgo+Pj4gRm9yIGluc3RhbmNlLCBvbiBTVE0zMk1QMjUgU29j
IHRoaXMgY2FuIGJlIHVzZWQgYnkgZGVmaW5pbmc6Cj4+Pgo+Pj4gwqDCoMKgwqAgYWxpYXNlcyB7
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIHJwcm9jMCA9ICZtMzNfcnByb2M7Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgIHJwcm9jMSA9ICZtMF9ycHJvYzsKPj4+IMKgwqDCoMKgIH07Cj4+Pgo+Pj4gV2hlbiBh
ICJycHJvYzx4PiIgRFQgYWxpYXMgaXMgcHJlc2VudCwgdXNlIGl0IHRvIGFzc2lnbiBhIGZpeGVk
Cj4+PiAiL3N5cy9jbGFzcy9yZW1vdGVwcm9jL3JlbW90ZXByb2M8eD4iIGVudHJ5Lgo+Pj4gSWYg
bm8gcmVtb3RlcHJvYyBhbGlhcyBpcyBkZWZpbmVkLCBrZWVwIHRoZSBsZWdhY3kgaW5kZXggYWxs
b2NhdGlvbi4KPj4+IElmIG9ubHkgc29tZSByZW1vdGVwcm9jIGluc3RhbmNlcyBoYXZlIGFuIGFs
aWFzLCBhbGxvY2F0ZSBkeW5hbWljCj4+PiBpbmRleCBzdGFydGluZyBhZnRlciB0aGUgaGlnaGVz
dCBhbGlhcyBpbmRleCBkZWNsYXJlZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBcm5hdWQgUG91
bGlxdWVuIDxhcm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tPgo+Pj4gVGVzdGVkLWJ5OiBQZW5n
IEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4KPj4+IC0tLQo+Pj4gVjM6Cj4+PiAtIGZpeCBkb3VibGUg
c3BhY2UgdHlwbwo+Pj4gLSBhZGQgUGVuZyBGYW4ncyBUZXN0ZWQtYnkKPj4+Cj4+PiBWMjoKPj4+
IC0gSW50cm9kdWNlcyBycHJvY19nZXRfaW5kZXggYmFzZWQgb24gTWF0aGlldSBQb2lyaWVyJ3Mg
c3VnZ2VzdGlvbi4KPj4+IMKgwqAgQW4gdXBkYXRlIGNvbXBhcmVkIHRvIE1hdGhpZXUncyB2ZXJz
aW9uIGlzIHRoYXQgdGhlIGNhbGwgdG8KPj4+IMKgwqAgaWRhX2FsbG9jX3JhbmdlIGlzIHJldGFp
bmVkIGlmIGFuIGFsaWFzIGlzIGZvdW5kIGZvciB0aGUgcmVtb3RlIGRldmljZSwKPj4+IMKgwqAg
dG8gYmFsYW5jZSB3aXRoIGlkYV9mcmVlKCkuCj4+PiAtIFJlbmFtZSBEVCBhbGlhcyBzdGVtIGZy
b20gInJlbW90ZXByb2MiIHRvICJycHJvYyIgdG8gYmUgY29uc2lzdGVudCB3aXRoCj4+PiDCoMKg
IGtleXRvbmUgZHJpdmVyLgo+Pj4gLS0tCj4+PiDCoCBkcml2ZXJzL3JlbW90ZXByb2MvcmVtb3Rl
cHJvY19jb3JlLmMgfCA0MCArKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4+PiDCoCBpbmNs
dWRlL2xpbnV4L3JlbW90ZXByb2MuaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAzICsrKwo+Pj4g
wqAgMiBmaWxlcyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY19jb3JlLmMgYi9k
cml2ZXJzLyByZW1vdGVwcm9jL3JlbW90ZXByb2NfY29yZS5jCj4+PiBpbmRleCBhYWRhMjc4MGIz
NDMuLjRhMDI4MTRjNWQwNCAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvcmVtb3RlcHJvYy9yZW1v
dGVwcm9jX2NvcmUuYwo+Pj4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9jL3JlbW90ZXByb2NfY29y
ZS5jCj4+PiBAQCAtMjQzMyw2ICsyNDMzLDQzIEBAIHN0YXRpYyBpbnQgcnByb2NfYWxsb2Nfb3Bz
KHN0cnVjdCBycHJvYyAqcnByb2MsIGNvbnN0IHN0cnVjdCBycHJvY19vcHMgKm9wcykKPj4+IMKg
wqDCoMKgwqAgcmV0dXJuIDA7Cj4+PiDCoCB9Cj4+PiArLyoqCj4+PiArICogcnByb2NfZ2V0X2lu
ZGV4IC0gYXNzaWduIGEgdW5pcXVlIGRldmljZSBpbmRleCBmb3IgYSByZW1vdGUgcHJvY2Vzc29y
Cj4+PiArICogQGRldjogZGV2aWNlIGFzc29jaWF0ZWQgd2l0aCB0aGUgcmVtb3RlIHByb2Nlc3Nv
cgo+Pj4gKyAqCj4+PiArICogTG9vayBmb3IgYSBzdGF0aWMgaW5kZXggY29taW5nIGZyb20gdGhl
ICJycHJvYyIgRFQgYWxpYXMKPj4+ICsgKiAoZS5nLiAicnByb2MwIikuIElmIG5vbmUgaXMgZm91
bmQsIHN0YXJ0IGFsbG9jYXRpbmcKPj4+ICsgKiBkeW5hbWljIElEcyBhZnRlciB0aGUgaGlnaGVz
dCBhbGlhcyBpbiB1c2UuCj4+PiArICoKPj4+ICsgKiBSZXR1cm46IGEgbm9uLW5lZ2F0aXZlIGlu
ZGV4IG9uIHN1Y2Nlc3MsIG9yIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLgo+Pj4g
KyAqLwo+Pj4gK3N0YXRpYyBpbnQgcnByb2NfZ2V0X2luZGV4KHN0cnVjdCBkZXZpY2UgKmRldikK
Pj4+ICt7Cj4+PiArwqDCoMKgIGludCBpbmRleDsKPj4+ICsKPj4+ICvCoMKgwqAgLyogTm8gRFQg
dG8gZGVhbCB3aXRoICovCj4+PiArwqDCoMKgIGlmICghZGV2LT5vZl9ub2RlKQo+Pj4gK8KgwqDC
oMKgwqDCoMKgIGdvdG8gbGVnYWN5Owo+Pj4gKwo+Pj4gK8KgwqDCoCAvKiBTZWUgaWYgYW4gYWxp
YXMgaGFzIGJlZW4gYXNzaWduZWQgdG8gdGhpcyByZW1vdGVwcm9jICovCj4+PiArwqDCoMKgIGlu
ZGV4ID0gb2ZfYWxpYXNfZ2V0X2lkKGRldi0+b2Zfbm9kZSwgUlBST0NfQUxJQVMpOwo+Pj4gK8Kg
wqDCoCBpZiAoaW5kZXggPj0gMCkKPj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gaWRhX2FsbG9j
X3JhbmdlKCZycHJvY19kZXZfaW5kZXgsIGluZGV4LCBpbmRleCwKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPj4+ICvCoMKgwqAg
LyoKPj4+ICvCoMKgwqDCoCAqIE5vIGFsaWFzIGhhcyBiZWVuIGFzc2lnbmVkIHRvIHRoaXMgcmVt
b3RlcHJvYyBkZXZpY2UuIFNlZSBpZiBhbnkKPj4+ICvCoMKgwqDCoCAqICJycHJvYyIgYWxpYXNl
cyBoYXZlIGJlZW4gYXNzaWduZWQgYW5kIHN0YXJ0IGFsbG9jYXRpbmcgYWZ0ZXIKPj4+ICvCoMKg
wqDCoCAqIHRoZSBoaWdoZXN0IG9uZSBpZiBpdCBpcyB0aGUgY2FzZS4KPj4+ICvCoMKgwqDCoCAq
Lwo+Pj4gK8KgwqDCoCBpbmRleCA9IG9mX2FsaWFzX2dldF9oaWdoZXN0X2lkKFJQUk9DX0FMSUFT
KTsKPj4+ICvCoMKgwqAgaWYgKGluZGV4ID49IDApCj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IGlkYV9hbGxvY19yYW5nZSgmcnByb2NfZGV2X2luZGV4LCBpbmRleCArIDEsIH4wLAo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9LRVJORUwpOwo+
Pj4gKwo+Pj4gK2xlZ2FjeToKPj4+ICvCoMKgwqAgcmV0dXJuIGlkYV9hbGxvYygmcnByb2NfZGV2
X2luZGV4LCBHRlBfS0VSTkVMKTsKPj4+ICt9Cj4+PiArCj4+PiDCoCAvKioKPj4+IMKgwqAgKiBy
cHJvY19hbGxvYygpIC0gYWxsb2NhdGUgYSByZW1vdGUgcHJvY2Vzc29yIGhhbmRsZQo+Pj4gwqDC
oCAqIEBkZXY6IHRoZSB1bmRlcmx5aW5nIGRldmljZQo+Pj4gQEAgLTI0ODEsOCArMjUxOCw3IEBA
IHN0cnVjdCBycHJvYyAqcnByb2NfYWxsb2Moc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFy
ICpuYW1lLAo+Pj4gwqDCoMKgwqDCoCBycHJvYy0+ZGV2LmRyaXZlcl9kYXRhID0gcnByb2M7Cj4+
PiDCoMKgwqDCoMKgIGlkcl9pbml0KCZycHJvYy0+bm90aWZ5aWRzKTsKPj4+IC3CoMKgwqAgLyog
QXNzaWduIGEgdW5pcXVlIGRldmljZSBpbmRleCBhbmQgbmFtZSAqLwo+Pj4gLcKgwqDCoCBycHJv
Yy0+aW5kZXggPSBpZGFfYWxsb2MoJnJwcm9jX2Rldl9pbmRleCwgR0ZQX0tFUk5FTCk7Cj4+PiAr
wqDCoMKgIHJwcm9jLT5pbmRleCA9IHJwcm9jX2dldF9pbmRleChkZXYpOwo+Pj4gwqDCoMKgwqDC
oCBpZiAocnByb2MtPmluZGV4IDwgMCkgewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIo
ZGV2LCAiaWRhX2FsbG9jIGZhaWxlZDogJWRcbiIsIHJwcm9jLT5pbmRleCk7Cj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZ290byBwdXRfZGV2aWNlOwo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvcmVtb3RlcHJvYy5oIGIvaW5jbHVkZS9saW51eC9yZW1vdGVwcm9jLmgKPj4+IGluZGV4IGI0
Nzk1Njk4ZDhjMi4uM2ZlYjI0NTZlY2M0IDEwMDY0NAo+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9y
ZW1vdGVwcm9jLmgKPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvcmVtb3RlcHJvYy5oCj4+PiBAQCAt
NTAzLDYgKzUwMyw5IEBAIGVudW0gcnByb2NfZmVhdHVyZXMgewo+Pj4gwqDCoMKgwqDCoCBSUFJP
Q19NQVhfRkVBVFVSRVMsCj4+PiDCoCB9Owo+Pj4gKyAvKiBkZXZpY2UgdHJlZSByZW1vdGVwcm9j
IEFsaWFzIHN0ZW0gKi8KPj4+ICsgI2RlZmluZSBSUFJPQ19BTElBUyAicnByb2MiCj4+PiArCj4+
PiDCoCAvKioKPj4+IMKgwqAgKiBzdHJ1Y3QgcnByb2MgLSByZXByZXNlbnRzIGEgcGh5c2ljYWwg
cmVtb3RlIHByb2Nlc3NvciBkZXZpY2UKPj4+IMKgwqAgKiBAbm9kZTogbGlzdCBub2RlIG9mIHRo
aXMgcnByb2Mgb2JqZWN0Cj4+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5j
b20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
