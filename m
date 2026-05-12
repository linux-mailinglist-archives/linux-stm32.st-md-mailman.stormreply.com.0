Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JdfAc88BGoqFgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 10:56:47 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E095300D4
	for <lists+linux-stm32@lfdr.de>; Wed, 13 May 2026 10:56:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C970C8F294;
	Wed, 13 May 2026 08:56:46 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012060.outbound.protection.outlook.com [52.101.53.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D355C8F287
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 May 2026 17:19:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0NNxBv9VAjlbtdrsNK0rYPJ24M1wRHh6gWeQfBxdb3oqc6SBmQgMusno69qOiXsDaPB8CqKM8lqCd70O2y/YinXvz1IKXqaWQ49RKbDJ71MizHd7Y08KmnFlyCje+HaCLiYDfD7UBLb4JUgSn5iR487gZay4GkrBs9bTTJZ90vEyyBFf04Ju+tIru3bbJXoo2YcrFrWpHm8VWbE18VUN3PP7V4qIc2Or8W4XxT2WplWxHK/PthV1EBKMkVHHHGAV2EpQk592143P9aMDJ4vrCb2bl4Lsc7C0UYRz93YXrd0d/lAc/C4gUDNMYxtNGW/hsxlF68fZ9U/+AjutO928A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cy+7exeeIfq5FKQxMtjAscZFi7SvMoUT7upvgBBofQk=;
 b=t59MwtuauLiijw/taTyG6P/I/Xg270OR7/I7keWrVECY0Q13wMuZ1QitlRZPpZN8xuFTntLeXRm2YyGsaReGms6znJwIAi8KPZ262avbCO3M6zeeO66vudstTtpux85WSnRNeTpVq4lzjCHbOZIBu3tqwJ1pyE6xGrWmI5UTUQzWExqpy/xK1xluYRC/GCKZzef4/f6HA0Mv7XUfcPGy+Qf5/k+sVpJ2w2SNlLkPUUIAxAQSe9cwvGBpCYR0w4hDoEARme0gLXsHSEVm+tBkKYTm2Mt1wDm3YZwGJiNOKjXr66JBKItKwnhJr1tV3xjmEuqsPn8Tw1gIaW9tXHcWcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cy+7exeeIfq5FKQxMtjAscZFi7SvMoUT7upvgBBofQk=;
 b=XcJz08u1tiSwrJaxsitOGV32Hr17XCtEAZpecShYlbMLVVRCCC9lY6ruh4Wulpc+RcXbdIXwiHvxbhRlt3rAXgwCgaP6UlqtrBOllW/YYgzsAc5hIi36BpO1pbPTw+98JX3G60Cxgm6ZA+4JIH5LATj3nG1UvI+jud09PAmKkTE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6448.namprd12.prod.outlook.com (2603:10b6:8:8a::7) by
 PH0PR12MB7932.namprd12.prod.outlook.com (2603:10b6:510:280::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.19; Tue, 12 May 2026 17:19:39 +0000
Received: from DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a]) by DM4PR12MB6448.namprd12.prod.outlook.com
 ([fe80::62c2:71cd:7fdc:987a%6]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 17:19:39 +0000
Message-ID: <cb737dc0-ffcc-40a1-ae8c-0a19714d0dc8@amd.com>
Date: Tue, 12 May 2026 10:19:35 -0700
User-Agent: Mozilla Thunderbird
To: "Shah, Tanmay" <tanmay.shah@amd.com>,
 Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
References: <20260511211841.284809-1-ben.levinsky@amd.com>
 <20260511211841.284809-4-ben.levinsky@amd.com>
 <3b7f009c-dc4b-4fc0-becc-4d07eb4ff016@oss.nxp.com>
 <9e3a88d9-1679-43ae-a96b-62a29bd45d9d@amd.com>
 <DM4PR12MB6448B1E51D58F3F8B11171F683392@DM4PR12MB6448.namprd12.prod.outlook.com>
Content-Language: en-US
From: Ben Levinsky <blevinsk@amd.com>
In-Reply-To: <DM4PR12MB6448B1E51D58F3F8B11171F683392@DM4PR12MB6448.namprd12.prod.outlook.com>
X-ClientProxiedBy: BYAPR01CA0064.prod.exchangelabs.com (2603:10b6:a03:94::41)
 To DM4PR12MB6448.namprd12.prod.outlook.com
 (2603:10b6:8:8a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6448:EE_|PH0PR12MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: c02c406e-28c3-47ef-f1a8-08deb04aa5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|56012099003|22082099003|18002099003|11063799003;
X-Microsoft-Antispam-Message-Info: XElNRuEe7gjXYrAU5oG0Q9GwSW7B7JY1ko/Bn0waUOB74ccm2/eKjhqPK/lAN4o0t7SOIYEqV4QS2U9YlLAtv5RPIbc7YYuBeVjX3CMgomwiGT2l54SjC7FOpwUqjHCSHfgoQjSCL6uuZUEC6Q2PbuGGlk+czd3wAAzsCmhhCu08QdNWZrwRQwl0iGE9Z4Bin+6UKjslbJI6dVd7F87uHnsHou6zU7hjW8fO9IuxUD2fTNoSE1YJ0t9Bm5klH9gbhgr+FpKTywzGX+cjN4baADscNSdz6gMH8g0xDmnKemhUBkIgn367cyMVf/WoCw44vhInBAd6fvumbVWo2Er//dEpos09nm1rAciuKjurheQ1RKmXezaJ6mcdBp4R7U928XcF/Lsp8cHgmqRYjrHm7QYGNMibV3mg8U5ed0FCnkEANz9mmCmXVvvDxyaTj1f3FpJW4TnCfI5UdhPSLRSv1QL42zFybD57thdY/gmbtQ6tPMsHHt3JdZ4vwVBFmFks3TS8Z+s1DCQFxam82rAst4A3KZshrkd9QVc3YrWSKSFx/Toe16e7AfFkSuh1er86Ra02ekJFz3kKzyjkIeA8PstpsaJ+3Hai//20heFDxnKr/y00CZqXwBGNHSCagiIFS9qmRW1Wgb0/UzpZkZwnxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6448.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(56012099003)(22082099003)(18002099003)(11063799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHl2bWpRclhEZHkzbTEyeVRVaS92VjZnMVZSbzlTZEVJcFJMMVlja1dkN1lF?=
 =?utf-8?B?WklURjF3NTE3RGd0MWtLeEI5djI1b3VHbG5xSTFQUFB3NHR3d29VMTNiQXht?=
 =?utf-8?B?M2RhSkswYXRCaENOeitZOGQzUFpVNkRCOWNyK3lCVG14eTVnMUpOamE3aXZY?=
 =?utf-8?B?MGQxeUFVYjZCYjBCRURBY1RhMWZXYllRdExBYzJTTkU5ZkRxWC9wR3kwOGFi?=
 =?utf-8?B?VG04SVZsR2dRK2Y0RHd2MnppaVFnb2NNSnBZcU9lK1VqbVRtZkZ5SDVTSW1m?=
 =?utf-8?B?R0ppdWVrSjJmcFVDTFp5eklObktXMllMTy85VDRuVCsxbElPK1NFei9PMWl2?=
 =?utf-8?B?UW1XUlpocDFmQnFhOEtJV2JqS00zdEtZMTZidFdwUGhtOTZxWDRNRkZhSjdS?=
 =?utf-8?B?Z1JsVE9oQUVlWWl0TG5DRVpyVUdxcHJWb05NZ1g2cWtXMy9Kbk5lcHI3L1JC?=
 =?utf-8?B?S1RhZnlEV0RkQXNwM01XMFVINlJlcVJnVk9GKzhNMG5qYXhCVXJlamVKcnRL?=
 =?utf-8?B?QW4ySVhjcjN6WlFuS1RlYzRJTmVZMlRJT28waHdRL3ZlVi9PK0JranNKYXYy?=
 =?utf-8?B?THZGV1o4emVXbEt4UTlqQUVvUjI5SEl1RDJMYnR0dGphNEM2UGtDNGRJK0JJ?=
 =?utf-8?B?VkMwNGl0ZXhrNmRhbUQ5TlovYzVtQWNxbTFvY2dwU1BNZVpYLzhBdXJQbU9m?=
 =?utf-8?B?bTNkU28zM1IwMWhRblNSQzU5WE9LcGEwazRwRjJ3Q1BrMVVsd05uWEZTQzVS?=
 =?utf-8?B?Q1Q3Sm5Kc21HdHBDMnVSZzhUNC9RbURCRmpWd1dwaWExdXRTK3NVbEZNMmN1?=
 =?utf-8?B?QnZ5RGV3aDgyb3p6VW5sbnlsZ1JQNy96UUo2UEpQSjl5ZXV2SzN2dGZHQVJ3?=
 =?utf-8?B?a1lmNTVBUTIxRGI3cEcxUFNXRDg0RXQxV3EzQi9NY1h1ekVkdEw4WFhJRmtq?=
 =?utf-8?B?RmdPMXA4bTVIZ3QyOCtad3M2UHd5L1paei9HeXlpWElTRkdteVZKRG40NDlM?=
 =?utf-8?B?ZzRTWFllT0FlT3hGTXhsQ0tXWGo2ZEFDSnlhQWEzRFFwUGttZnVRQmNRVnVy?=
 =?utf-8?B?ZFFwNExrcUtPM3dUV3gyclRYcVhRbEtyNFp2cSs1TzBTbStsNnN5dWQzR3pS?=
 =?utf-8?B?VU56b2phK0s1QnZYSzlqMzJINFJYR0hsV0dyQVB5eGVRRU5WQUU2YXdteTcy?=
 =?utf-8?B?RDM2YzA0alZYb0w4SGd4cTQwemp3eGMvY0VFTnFnUnYwYi9CaVpxclorMkp3?=
 =?utf-8?B?TjlvbHY4bU9reDhxWnlvTUdJaTBRdWNHS0wzemJnTUEyMFdCcUJ3MkMrRTgv?=
 =?utf-8?B?VjFuRVVUZnJIRlJSN1RPdjJXRjJUNkdOSU51Wk9TQ0tvQjNzMjlyZmp5UUZV?=
 =?utf-8?B?dUJkQk1UdnZyZk5ZUS9DWWRQVUo2YmpXeFl0ZHF4bk5JUnVac254QjF1c001?=
 =?utf-8?B?RDZnNHA5aEtWeXE3SkJHcmVqOHdZQzB2YlFNK1Y2Nk9ON3pudVBDY3gxcWhj?=
 =?utf-8?B?cklCb0FXQmlQL1k3d25wdWkrTGRFcFIvSVhBQkwwTHNRNGFkN3gvZVJaSzd3?=
 =?utf-8?B?UXRNbCtEeURtcE5LeU5CRnJYRmFqTmwxUW1lUVoyOXF3bEpGQlJ0bU5DTzdN?=
 =?utf-8?B?RGZzQWNzVktFYzlaalEwVWJ2UjVoNTV3eHBSdUdSZyttejh4eFNxNzJDbkEv?=
 =?utf-8?B?ZzJvL0g2ZCtXeDhDK3F2a3MrZmVDeTMxR0JtVXJGTHFoWjZMeXZkeDR5SVhR?=
 =?utf-8?B?ZlVESTk3VnRMSzJWNTlFUlUwV1JnT0hWNkVVME0vaHFJZnZoeFhpM2YwalJ2?=
 =?utf-8?B?OXVaenJyY29jTHNMcDFPck9CNkFIMUNJclI3cUlsdjFRVXNQejVmRWJ6L1Nz?=
 =?utf-8?B?NEhLaWpoSXB2dUd3OEorUFZKSVhEWklMZ0VTQlpTc3ZkdGU3STQyTzFUWmZW?=
 =?utf-8?B?WCtWaGI2TzJpZ3RzVHppb1M0V2djR0JuWHNYeHdvb3JYcElrWngyYStFRWtD?=
 =?utf-8?B?ZDhFRFNjaVVHNmN5V3REdnZzcmtUK3JtUmtWYThvRDBzM24xQnk4ckdZR3Av?=
 =?utf-8?B?YjBtbzRiVFpOUFk1Uy9FZWJaQTZWcTdnZWM2aExBNlRhcllOVFN3K3dvV1pV?=
 =?utf-8?B?VXVEanl4Q21rNFdGV1hOS3FkdXJraUUyWFBiN3k2STZ1aVJkQ1RUV0lCcmtn?=
 =?utf-8?B?WVhiSFArYm9FMXhYQXN5blRyQVBNU3pneUdYa0oxRXJ0eGlHVDJlb0NvOTVv?=
 =?utf-8?B?N0ZxV1BYUFNkSnUwL1FQcUlNcjlZazBHY1YxS3pvdEhrYk9jWWRsWVc0YXc1?=
 =?utf-8?B?NmpvWW53WEZzb2NMeUdueGlmZHhURnVUcVROb3A3d3N5R21iOU9yQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c02c406e-28c3-47ef-f1a8-08deb04aa5c0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6448.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 17:19:38.9582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9yYRULqp1VlqE8l+RvoIZLcKoM5UG0P5RLG5jExPOlnK6ew8+8Yaw0FSo96f7ou3yTHct6PsCN/BscT0F7Z2Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7932
X-Mailman-Approved-At: Wed, 13 May 2026 08:56:45 +0000
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH 3/4] remoteproc: add helper for optional
 ELF resource tables
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
X-Rspamd-Queue-Id: 86E095300D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.89 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[amd.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[amd.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tanmay.shah@amd.com,m:daniel.baluta@oss.nxp.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:linux-remoteproc@vger.kernel.org,m:arnaud.pouliquen@foss.st.com,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:mcoquelin.stm32@gmail.com,m:geert+renesas@glider.be,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:magnus.damm@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kernel@pengutronix.de,m:festevam@gmail.com,m:patrice.chotard@foss.st.com,m:linux-arm-kernel@lists.infradead.org,m:mcoquelinstm32@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[blevinsk@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[blevinsk@amd.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,st-md-mailman.stormreply.com,gmail.com,glider.be,nxp.com,pengutronix.de,vger.kernel.org,foss.st.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REDIRECTOR_URL(0.00)[aka.ms];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,renesas];
	NEURAL_SPAM(0.00)[0.910];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Action: no action

SGkgRGFuaWVsLCBBcm5hdWQsIFRhbm1heSwKClBsZWFzZSBzZWUgbXkgcmVwbHkgYmVsb3cKCk9u
IDUvMTIvMjYgMTA6MDQgQU0sIExldmluc2t5LCBCZW4gd3JvdGU6Cj4gQU1EIEdlbmVyYWwKPiAK
PiAKPiAKPiAKPiAqRnJvbTogKlNoYWgsIFRhbm1heSA8dGFubWF5c0BhbWQuY29tPgo+ICpEYXRl
OiAqVHVlc2RheSwgTWF5IDEyLCAyMDI2IGF0IDc6NTPigK9BTQo+ICpUbzogKkRhbmllbCBCYWx1
dGEgPGRhbmllbC5iYWx1dGFAb3NzLm54cC5jb20+OyBMZXZpbnNreSwgQmVuIAo+IDxiZW4ubGV2
aW5za3lAYW1kLmNvbT47IEJqb3JuIEFuZGVyc3NvbiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+OyBN
YXRoaWV1IFBvaXJpZXIgCj4gPG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPjsgbGludXgtcmVt
b3RlcHJvY0B2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LSAKPiByZW1vdGVwcm9jQHZnZXIua2VybmVs
Lm9yZz4KPiAqQ2M6ICpGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT47IFNhc2NoYSBIYXVlciA8
cy5oYXVlckBwZW5ndXRyb25peC5kZT47IAo+IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtIDxrZXJu
ZWxAcGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtIAo+IDxmZXN0ZXZhbUBnbWFpbC5jb20+
OyBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgTWFnbnVzIERh
bW0gCj4gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IFBhdHJpY2UgQ2hvdGFyZCA8cGF0cmljZS5j
aG90YXJkQGZvc3Muc3QuY29tPjsgTWF4aW1lIAo+IENvcXVlbGluIDxtY29xdWVsaW4uc3RtMzJA
Z21haWwuY29tPjsgQWxleGFuZHJlIFRvcmd1ZSAKPiA8YWxleGFuZHJlLnRvcmd1ZUBmb3NzLnN0
LmNvbT47IGlteEBsaXN0cy5saW51eC5kZXYgPGlteEBsaXN0cy5saW51eC5kZXY+OyAKPiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcgPGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZz47IAo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1yZW5lc2FzLSAKPiBzb2NAdmdlci5rZXJuZWwu
b3JnIDxsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1zdG0zMkBzdC1t
ZC0gCj4gbWFpbG1hbi5zdG9ybXJlcGx5LmNvbSA8bGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbT47IFNoYWgsIFRhbm1heSAKPiA8dGFubWF5LnNoYWhAYW1kLmNvbT4KPiAq
U3ViamVjdDogKlJlOiBbUEFUQ0ggMy80XSByZW1vdGVwcm9jOiBhZGQgaGVscGVyIGZvciBvcHRp
b25hbCBFTEYgcmVzb3VyY2UgdGFibGVzCj4gCj4gCj4gCj4gT24gNS8xMi8yMDI2IDI6NTUgQU0s
IERhbmllbCBCYWx1dGEgd3JvdGU6Cj4gID4gT24gNS8xMi8yNiAwMDoxOCwgQmVuIExldmluc2t5
IHdyb3RlOgo+ICA+PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBmcm9tIGJlbi5sZXZpbnNr
eUBhbWQuY29tLiBMZWFybiB3aHkgdGhpcyBpcyAKPiBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2Eu
bXMvTGVhcm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uIDxodHRwczovL2FrYS5tcy8gCj4gTGVh
cm5BYm91dFNlbmRlcklkZW50aWZpY2F0aW9uPiBdCj4gID4+Cj4gID4+IEFkZCBhIHNtYWxsIGhl
bHBlciBhcm91bmQgcnByb2NfZWxmX2xvYWRfcnNjX3RhYmxlKCkgZm9yIHJlbW90ZXByb2MKPiAg
Pj4gZHJpdmVycyB0aGF0IHRyZWF0IGEgbWlzc2luZyBFTEYgcmVzb3VyY2UgdGFibGUgYXMgb3B0
aW9uYWwuIFRoZSBoZWxwZXIKPiAgPj4gcmV0dXJucyBzdWNjZXNzIG9uIC1FSU5WQUwgYW5kIHBy
b3BhZ2F0ZXMgb3RoZXIgZmFpbHVyZXMgdW5jaGFuZ2VkLgo+ICA+Pgo+ICA+PiBTaWduZWQtb2Zm
LWJ5OiBCZW4gTGV2aW5za3kgPGJlbi5sZXZpbnNreUBhbWQuY29tPgo+ICA+PiAtLS0KPiAgPj4g
IGRyaXZlcnMvcmVtb3RlcHJvYy9yZW1vdGVwcm9jX2ludGVybmFsLmggfCAxMiArKysrKysrKysr
KysKPiAgPj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4gID4+Cj4gID4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3JlbW90ZXByb2MvcmVtb3RlcHJvY19pbnRlcm5hbC5oIGIvZHJp
dmVycy9yZW1vdGVwcm9jLyAKPiByZW1vdGVwcm9jX2ludGVybmFsLmgKPiAgPj4gaW5kZXggMzcy
NGE0N2E5NzQ4Li5kZmY4N2U0Njg4MzcgMTAwNjQ0Cj4gID4+IC0tLSBhL2RyaXZlcnMvcmVtb3Rl
cHJvYy9yZW1vdGVwcm9jX2ludGVybmFsLmgKPiAgPj4gKysrIGIvZHJpdmVycy9yZW1vdGVwcm9j
L3JlbW90ZXByb2NfaW50ZXJuYWwuaAo+ICA+PiBAQCAtMTQ2LDYgKzE0NiwxOCBAQCBzdGF0aWMg
aW5saW5lIGludCBycHJvY19tZW1fZW50cnlfaW91bm1hcChzdHJ1Y3QgcnByb2MgCj4gKnJwcm9j
LAo+ICA+PiAgICAgICAgIHJldHVybiAwOwo+ICA+PiAgfQo+ICA+Pgo+ICA+PiArc3RhdGljIGlu
bGluZSBpbnQgcnByb2NfZWxmX2xvYWRfcnNjX3RhYmxlX29wdGlvbmFsKHN0cnVjdCBycHJvYyAq
cnByb2MsCj4gID4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBzdHJ1Y3QgZmlybXdhcmUgKmZ3KQo+ICA+PiArewo+ICA+PiArICAgICAg
IGludCByZXQ7Cj4gID4+ICsKPiAgPj4gKyAgICAgICByZXQgPSBycHJvY19lbGZfbG9hZF9yc2Nf
dGFibGUocnByb2MsIGZ3KTsKPiAgPj4gKyAgICAgICBpZiAocmV0ID09IC1FSU5WQUwpCj4gID4+
ICsgICAgICAgICAgICAgICBkZXZfZGJnKCZycHJvYy0+ZGV2LCAibm8gcmVzb3VyY2UgdGFibGUg
Zm91bmRcbiIpOwo+ICA+Cj4gID4gWW91IGFyZSBjaGFuZ2luZyBsb2dsZXZlbCBoZXJlLiBJbml0
aWFsIGRyaXZlcnMgdXNlIGRldl9pbmZvIG9yIGRldl93YXJuLiBBdCAKPiBsZWFzdCBJJ20gdXNl
ZAo+ICA+IHdpdGggc2VlaW5nIHRoaXMgbWVzc2FnZXMgaW4gdGhlIGxvZ3MuCj4gID4KPiAgPiBT
bywgd2hhdCBkbyB5b3UgdGhpbmsgb24gYWRkaW5nIGF0IGxlYXN0IGRldl9pbmZvIHRvIHRoaXMg
aW5zdGVhZCBvZiBkZXZfZGJnPwo+ICA+Cj4gCj4gQWN0dWFsbHkgY2FuIHdlIGxlYXZlIHRoYXQg
Y2hvaWNlIHRvIHRoZSBwbGF0Zm9ybSBkcml2ZXIgPyBUaGVyZSBhcmUKPiBtYW55IHVzZSBjYXNl
cyB3aGVyZSB0aGUgcmVtb3RlcHJvYyBzdWJzeXN0ZW0gaXMgdXNlZCB0byBsb2FkIGFuZCBzdGFy
dAo+IHRoZSByZW1vdGUgY29yZSBhbmQgdGhlIGZpcm13YXJlIGRvZXNuJ3QgaGF2ZSB0aGUgcmVz
b3VyY2UgdGFibGUuIFdlCj4gZG9uJ3Qgd2FudCB0byBtYWtlIGluZm8gbGV2ZWwgbG9nIGZvciBz
dWNoIHVzZSBjYXNlcywgYXMgdGhlIHJlc291cmNlCj4gdGFibGUgaXMgbm90IGV4cGVjdGVkIGlu
IHRoZSBmaXJzdCBwbGFjZSB0aGVyZS4KClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLgoKSSBhZ3Jl
ZSB0aGUgaGVscGVyIHNob3VsZCBub3QgaW1wb3NlIGEgY29tbW9uIGxvZyBsZXZlbC4gU29tZSBw
bGF0Zm9ybXMgaW50ZW50aW9uYWxseSBydW4gZmlybXdhcmUgd2l0aG91dCBhIHJlc291cmNlIHRh
YmxlLCBzbyBmb3JjaW5nIGEgc2hhcmVkIGRldl9pbmZvL2Rldl93YXJuIG1lc3NhZ2UgZnJvbSB0
aGUgaGVscGVyIHdvdWxkIGFkZApub2lzZSBpbiB0aG9zZSBjYXNlcy4KCkknbGwgcmV3b3JrIHRo
aXMgaW4gdjIgc28gdGhlIGhlbHBlciBvbmx5IGhhbmRsZXMgdGhlIHJldHVybi12YWx1ZSBiZWhh
dmlvciwgd2hpbGUgcGxhdGZvcm0gZHJpdmVycyBrZWVwIGNvbnRyb2wgb3ZlciB3aGV0aGVyIHRo
ZSBtaXNzaW5nLXRhYmxlIGNhc2UgaXMgbG9nZ2VkIGFuZCBhdCB3aGF0IGxldmVsLgoKVGhhbmtz
LApCZW4KCj4gCj4gID4+ICsKPiAgPj4gKyAgICAgICByZXR1cm4gcmV0ID09IC1FSU5WQUwgPyAw
IDogcmV0Owo+ICA+PiArfQo+ICA+PiArCj4gID4+ICBzdGF0aWMgaW5saW5lIGludCBycHJvY19w
cmVwYXJlX2RldmljZShzdHJ1Y3QgcnByb2MgKnJwcm9jKQo+ICA+PiAgewo+ICA+PiAgICAgICAg
IGlmIChycHJvYy0+b3BzLT5wcmVwYXJlKQo+ICA+PiAtLQo+ICA+PiAyLjM0LjEKPiAgPj4KPiAg
Pj4KPiAgPgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4v
bGlzdGluZm8vbGludXgtc3RtMzIK
