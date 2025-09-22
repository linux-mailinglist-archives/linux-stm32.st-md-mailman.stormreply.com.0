Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B73CCB8F9F4
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Sep 2025 10:46:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 46E01C32E92;
	Mon, 22 Sep 2025 08:46:19 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011069.outbound.protection.outlook.com [52.101.57.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E079AC32E8F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Sep 2025 08:46:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x/sq9PdOhrfrhLqqx4F8u+fjPHfhQJY5fpeU5A/gRmoNb+QAaXrJeztpK+Sl6sIfQej1FTMg5M+HcxqAe9xVLy2OhZYiAOPv7/ufYfPCdOQafvYmHaP13at00EdBqAFqdNdIHZttaoyoGEVzjPkDdskCE4vncFE0JmFCS177VpUgClfs0EtUI3Fbqgcb0+Auv+hHJCtMh3md2NicjseWuVmWXWdmE+UhB6qkWGV1UCPHRIO9NjjxX2B6zL5bKb6Umz0QEaRxogEmmErC7mq7E2lsXYM4FzmIgWLlE4pOrP1W3Ros68x/0Th8ncYnL73FHRAzjEvARxeVwbnQQ21Rww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8kcFklthVCxvrFCUz6khfhQXv2P0CQA7xbpE28i0RXU=;
 b=Y3m4h80R/5LIaWW+FxnVgkQQqn/ZOnUcIly+7zLmLEPCIn3TknoJHSVOUmkimHzTXJIzUOtZpwuoWlqMiDIvsU0O15jaFmbYzwe5G08thhlMpHNSM1Nx7qU+cJh0Iozw89oFtWGod4Ek4qEbBAxlSDy92hLsalxRpBeRd3u2mgkR4nsQS2SFzIjupPiV7XEeWGkAkJVeAiOmGFdA/bOnVIHD2yIYVUL2YYVwcR9j5fDSSFVQfz5nNEC6O7aiHf57WZodUxbsOsV2HstI9u67LDDK9qnt4Ax38iTaxPuyQnWtw1BXWYO6hamN69PgdTn89kRSZr1jSfa4V0zk4iuQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8kcFklthVCxvrFCUz6khfhQXv2P0CQA7xbpE28i0RXU=;
 b=b8ATZj9ayPIIiSkaqkUPoKUkaWWT1dbtQ7YvxmKyoTg+MdT2e32pQ1yhmuBmwdMjRhIjGQ2pQSbreEXB5d6RQtAw+xhG4XCOjr+rjY4d6COaJ/E9RFNmFdQQ2VotgP+i3Vjrn6FDVwBlb5/TWFEFiPZ/Hh7b6o9gDnZU2dqOJVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH0PR12MB7790.namprd12.prod.outlook.com (2603:10b6:510:289::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 08:46:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 08:46:13 +0000
Message-ID: <98c8f8f1-8261-4e28-855f-f26e0780030c@amd.com>
Date: Mon, 22 Sep 2025 10:45:46 +0200
User-Agent: Mozilla Thunderbird
To: David Laight <david.laight.linux@gmail.com>
References: <20250919101727.16152-1-farbere@amazon.com>
 <184ce83f-0063-43a0-a1c8-da23c5d03cf7@amd.com>
 <20250920111904.6d9ecb17@pumpkin>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250920111904.6d9ecb17@pumpkin>
X-ClientProxiedBy: BLAP220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH0PR12MB7790:EE_
X-MS-Office365-Filtering-Correlation-Id: ef34fb17-e740-4382-7f03-08ddf9b47c6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cG1RZ1J0eVBnMzFFNXNyRmN4cXlUSUt1aUltb21TcXBvemZiWnF4L2lWRDFY?=
 =?utf-8?B?a0l5dkt3V013VFQwQ1BJTXUwcTFzWmkrd3NKWlBVV1BZS3ZCa3o2ZG5nMjNj?=
 =?utf-8?B?RnNCYkRYOGpiTTFRTi9ZbkVTcGFxZStocEFFUE1yK2d6WUI5Z3ppRFI3K09K?=
 =?utf-8?B?NHF6V1h4WWpGOU1nVjdKYWZLZEpXVE1WN1pRdkx6RWhQWWxKcWxwZGRaNjdr?=
 =?utf-8?B?OWFmcjdlbGRSTHJGZ204V2lFbTg4ZFhMaGZDWUZ1T2NUUUZLTlo3MEx6N2ZF?=
 =?utf-8?B?ZTBFTXhtbXQ4SWROVTEvblF6cytkaFNhM2NXV2dvNjljelpWR2JBU1o5azB0?=
 =?utf-8?B?eTQwcWNiS3VTMWVTaE81QmM3TXh4UWl6dmhKS0lLODRtWmtWUWpFYzJXUlRP?=
 =?utf-8?B?ay9IaHNEWjBORU5hajNvOEV0c3VydmNHRGlENnZFenBOMTliQmlOQloyc3FH?=
 =?utf-8?B?aXFORDBjY2pacFJCVi9BMHlaS29xOWtxY2hnRStXbi90UjRyVGdTK3UyRU9D?=
 =?utf-8?B?aFZEdDRhT2VaTW5vY3NTMzZkeEV5dTRhY2IvdEw0WlNMaGdhQVZ4N0ZlQldx?=
 =?utf-8?B?Qm4vWUhocXZjV0FHbmxqdlRkeVI3M2VUeG9kRlYzRnlWaTd4UDlYZkU0VnNO?=
 =?utf-8?B?Zm8xMHZXOGJJT2FiTFI5SzR6MnlVS1RGWEFHWkMyVERBeDNxbzZtMWlIQkVa?=
 =?utf-8?B?QU9kN3BzY3VMY2JKL2k1NDR4VEFpUC9DcmZLRjkrMlNidVI2Rlp0em8wazNz?=
 =?utf-8?B?V3BZbi84VG9aNXZRU1VJRVpvMXBCSmthMURQNTcrZnNhWnFaNUNhbysvclVs?=
 =?utf-8?B?czVkeXNITDZjT3pXbWRXOUU4WjhiLzlPcnVrS2RxdVNjaTZnc3NKRmk2MTA5?=
 =?utf-8?B?M1o1UUwwdXhzaFE5MEkrMkU1cHBSSjc5d1RndjAwT2MvZnJqaE9aSmZ2djBw?=
 =?utf-8?B?cDd5aFcwclYzU3NKc2s2THYvNGtvalJKVVVGc1AzNE9LSnFkSllGNldyazg5?=
 =?utf-8?B?U0tueGhqQStWeHFzbmRBMDBBRmFNcjlNU1hUNW9tVjNmNUFhTXpvNlducnpC?=
 =?utf-8?B?WDBrMEFlMGFmMndpejdTamw3YlRjSVRYS3BYV2JySmNXS1FOVm1xN0daYnZ0?=
 =?utf-8?B?WVMzVDN5ZTNLUG1rNk5tTFluSUt0aGw3NHhmSUdCbjMyc3JXQkliZmFZSXB6?=
 =?utf-8?B?dU9EeVpsOG5KWVFDWXluYW00dGhZek9nbDVKSVdJTDkraDQzSjRYc0Q4RU9P?=
 =?utf-8?B?dXJHajBLVXIwNFg5S2FZUERQOVR4TVVtQ1hKN2NpS3JKWFZwbk5mN01Bb1N2?=
 =?utf-8?B?NUZTMEpXVXp1TkZBdWh1cTRCejVTdmRCS0srYUlxcjhXeHVuQWw2YVEzRXl5?=
 =?utf-8?B?WWY3ZlRJUG1DemFMQm9aYmhGbWNTZnBPa0hqbVVDT2dDZmpZSGNlcCtMY2FP?=
 =?utf-8?B?OElJdXE5UHNSNGVqVjc0b2xiNjhWQnRMR05sOVloYlVtM0pNbG9vN1M4aXVq?=
 =?utf-8?B?NkNnbXl2TnVtdUxBakZsdlpWWHBwN01TNmduZWpYTkQxNllOOXBrY0VoRTZP?=
 =?utf-8?B?cHVxcHRjdnJ0UUhIc3JmMGtJS0d0QWR0aTdMeEFnNlpGYVZZR0Z5a0J2K1ZY?=
 =?utf-8?B?QlJ5SkdheEVXNnRZeGdaQktXM1poMmJQVll0NENCMmVGcjI2OElpOXhRdlRG?=
 =?utf-8?B?ay9WRm9ibGhhb2Q3cGtibmRhaDlzTGtZcDFvT0RqYnhkMlRIVEcxeGppaElz?=
 =?utf-8?B?ZEZscGN5S291TVBwb0pOVnJYc1h5S09lWmEzMnZFUDEvSHFuMmxwNUM2TGMz?=
 =?utf-8?B?NnVCV1RocE1pYjlNUnExVEZma0xVaE1xTDRvYmZNTEFOZmY2RkRCZkxOcXpq?=
 =?utf-8?B?Z21iSW14SXdkRys5OHRscFhvekpMRzJxQ0k0UlVaV212TVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnpWR3VZSWc4UDRoYW0xVitXSnVlRnVQR0c0Vlh2aXhJc3NmRksxU01TQlMv?=
 =?utf-8?B?Q0tKaUpNZmIwaXNzRk14SU1tclpsUjJiazRJK1BsYkRuRG5CTmFOSU5tWUZi?=
 =?utf-8?B?SzlFaW0xa1g3UitJd0d3Z240b3lZenJub291VXV4ek5MbzF0cXNmaW1Mc042?=
 =?utf-8?B?ODZ3ODJtUE01UEJJbEJHK0dNd3RGVEo2aFBlZWxuRitXSmJwam1WZktVWjlO?=
 =?utf-8?B?TitaK0pueUJaOVM1a1lwb2RXdGNDRjJ3Q0E4UDlpMHkyWmpRMVpla3p1ZEwy?=
 =?utf-8?B?N2oyTldrcXFtNFhmRFovenBKNTNKdGd3UDVzbHExWkllaGxGSTR2Sk5OSmQ4?=
 =?utf-8?B?Q2NlNnBLSGRTU0JWdnYzQ1BlNVg0MW9PQ0wyaUVmWG1reHRuVWpKR05zVXYw?=
 =?utf-8?B?ZCs5VXlLMG4wK0xRK1RiMTdxQmc3L0tsajNEOGFFQWF1aHNsZHVFSU5aMmdj?=
 =?utf-8?B?eUcrOFNIR2xWQm5DRm5pbThMZnprR1A2bmJid3hGNnowVi9tWlgzc055U1hm?=
 =?utf-8?B?Tk91Y1E2ZGQwYUVIMFQyc3RJd1FmZnpmdEhpWFczalJQMitBYWswTGlSMVhw?=
 =?utf-8?B?WVlsZGlyZ3hiMkRzOEd0WHZyemtvL3gxUmlQT2g5UkhpeFo1SjAxSENjdjFZ?=
 =?utf-8?B?OHdQQUZIbE1TMzlRc21MQ1BFU1B2SjFYdmZ6czJ2RnZ5Y05RZ0FVNXVHTzRF?=
 =?utf-8?B?MytPU00xdTVSalR5aitoT0hWVk54QWdGVjM4d1lZZXA2Z0dCVTVLYTgzeXAz?=
 =?utf-8?B?YTluaU43MGtrWGhnTzNLdHB3bDZTb0pqTGhqb1hOdFdZWWM1b3VpUFlHUTRF?=
 =?utf-8?B?a2tWaVBlZndXUXc2MHdHck9Tb2x3eWpqWmZ0LzhBQzJPTGVqV2lEeUZrTnMy?=
 =?utf-8?B?V2hIYkpzQ0tUd2duVGc1WnJ6TEZVV0FJZVk5M0dlOUhHai9FVW5KT3VVWVI1?=
 =?utf-8?B?UDljaWtrZXhaWmdnS0ZHV1RoTUlBRFdMMUptclV3Vk9Wcnljcnh5bEZNMDlk?=
 =?utf-8?B?MzllRXIxNzZxMkpEajF6Sk13QnlLbkg0c3R4ejFGb3I3VE8yQ1lHa0l2N3ow?=
 =?utf-8?B?QmtvcmE4Yk9OOHA5K2RQU1VBUFlYdEVJMUJmZERsTVU3WDBsazNjdHgyajNi?=
 =?utf-8?B?dGVoUVVseE9TbTYvTFA2aDE0Y3JtNWp4TEN2a052SktlcDk5NzdCc3Z5NDgy?=
 =?utf-8?B?Ylo1WjdUMlRucVQwWEVRUVhVWFpndm03T2p3azVZckRYaWdzMHRoTU1kYWdH?=
 =?utf-8?B?Nmc2MVBnM09NOTd5Zi9Gc2JIYVhIVmY5bnVsbkQwOURCVkdtN1ZqVnFlb2F0?=
 =?utf-8?B?cy9JTHZNdDNZMGIvZnc3ZTk4OHBqcllRUkdOQXExOTFYYmJjdnN1S3NvS280?=
 =?utf-8?B?QVBSMkZCQnFnd0VvRTF3SmJteWUrdFAwM0NON0F2MmxjWTRiaEw4N2wrampi?=
 =?utf-8?B?Zm5JbGVLaFNhNTFmSkFpb09yNTRXMTZDcGpaOG1SSTlWQnRIcSt2VmNhdXV6?=
 =?utf-8?B?bkQ0QzBGTTBnZGJBOTNBSEdDZVpKazhvUW5rcjZpTUk1RTNqVW13QTBhMDNy?=
 =?utf-8?B?WE93bHlpaU5xckk2ejV3eld0OGIwNlNuV1NJbHpiMXBiU21EaVZINHBtRFgv?=
 =?utf-8?B?bXRab1RSaWdtZ2V1SGlEakVXSi9YUGNvc1N6RlNMeTV2UW9ETC93bVJydU9R?=
 =?utf-8?B?OGRmSjYxK3ppMU1URzV2QVU5a1J4YjBSZlFUcjloS1JxSDg2UytiaVFIWUU2?=
 =?utf-8?B?VS9ZQllsY0xJODFvc3RTMjcrSmtNL1RpUEdpYitFZUJQUnFqWENmSXRUcU1i?=
 =?utf-8?B?akxxRlh6aFM3V1hmV2k3QW9qdEJLVTZRUCtuVjZLN0g3Sm1YYkhhbjduVXly?=
 =?utf-8?B?TldobmdpWDEvYy9YUlBlM1hqRzNiOFZFQ21yY2V1ZFJFV04xYjhVbzVHd0FP?=
 =?utf-8?B?b3VSRjR2UWVIaTNobm5GSCthcmx6UEE3a2JPTmFJSVo0MmVsN2gySkZncjZB?=
 =?utf-8?B?ZnJ3R3U1bDZLTDR0djcrSHo4aFV2UlFRWjVWVkF2d1pXU1pWRHRQNTVBRDJL?=
 =?utf-8?B?Y1llTUh4dlcxYXNQWnVXRnJIMGFOYmwzSEFVQmhUbnhYWmFlU1ZvOVpkMm56?=
 =?utf-8?Q?Zqrwr8uR4YeZSte3ehEFJmFuL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef34fb17-e740-4382-7f03-08ddf9b47c6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 08:46:13.5482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oetdwlSlScsefrZU9ffzTGm7uqrLuTCKLiCpWlTi75F7bvsTR/lg3QeYk3Ei0bQc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7790
Cc: snitzer@redhat.com, dri-devel@lists.freedesktop.org, malattia@linux.it,
 linux-stm32@st-md-mailman.stormreply.com, sashal@kernel.org,
 bvanassche@acm.org, kadlec@netfilter.org, linux-sparse@vger.kernel.org,
 joabreu@synopsys.com, pmladek@suse.com, intel-linux-scu@intel.com,
 sunpeng.li@amd.com, linux-um@lists.infradead.org, tglx@linutronix.de,
 sean@poorly.run, qiuxu.zhuo@intel.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 alexander.deucher@amd.com, akpm@linux-foundation.org,
 freedreno@lists.freedesktop.org, Jason@zx2c4.com, airlied@linux.ie,
 dave.hansen@linux.intel.com, dm-devel@redhat.com, jonnyc@amazon.com,
 mihail.atanassov@arm.com, agk@redhat.com, ruanjinjie@huawei.com,
 coreteam@netfilter.org, james.qian.wang@arm.com, linux-media@vger.kernel.org,
 alexandre.torgue@st.com, linux-arm-msm@vger.kernel.org, mripard@kernel.org,
 peppe.cavallaro@st.com, evan.quan@amd.com,
 linux-arm-kernel@lists.infradead.org, tony.luck@intel.com, jmaloy@redhat.com,
 james.morse@arm.com, mcoquelin.stm32@gmail.com, brian.starkey@arm.com,
 herve.codina@bootlin.com, linux@rasmusvillemoes.dk,
 platform-driver-x86@vger.kernel.org, willy@infradead.org,
 mgross@linux.intel.com, linux-staging@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, linux-input@vger.kernel.org,
 kuznet@ms2.inr.ac.ru, linux-ext4@vger.kernel.org, harry.wentland@amd.com,
 pablo@netfilter.org, rric@kernel.org, keescook@chromium.org,
 jejb@linux.ibm.com, rostedt@goodmis.org, mchehab@kernel.org,
 linux-hwmon@vger.kernel.org, martin.petersen@oracle.com,
 dmitry.torokhov@gmail.com, David.Laight@ACULAB.COM,
 sakari.ailus@linux.intel.com, ying.xue@windriver.com, davem@davemloft.net,
 peterz@infradead.org, liviu.dudau@arm.com, linux-mm@kvack.org,
 artur.paszkiewicz@intel.com, hpa@zytor.com, anton.ivanov@cambridgegreys.com,
 linux-scsi@vger.kernel.org, x86@kernel.org, linux@armlinux.org.uk,
 kuba@kernel.org, jdike@addtoit.com, dushistov@mail.ru, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, hdegoede@redhat.com,
 andriy.shevchenko@linux.intel.com, linux-edac@vger.kernel.org,
 yoshfuji@linux-ipv6.org, netdev@vger.kernel.org, stable@vger.kernel.org,
 sergey.senozhatsky@gmail.com, robdclark@gmail.com,
 tipc-discussion@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 tzimmermann@suse.de, rajur@chelsio.com, luc.vanoostenryck@gmail.com
Subject: Re: [Linux-stm32] [PATCH 00/27 5.10.y] Backport minmax.h updates
	from v6.17-rc6
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

T24gMjAuMDkuMjUgMTI6MjEsIERhdmlkIExhaWdodCB3cm90ZToKPiBPbiBGcmksIDE5IFNlcCAy
MDI1IDE0OjExOjM3ICswMjAwCj4gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPiB3cm90ZToKPiAKPj4gT24gMTkuMDkuMjUgMTI6MTcsIEVsaWF2IEZhcmJlciB3cm90
ZToKPj4+IFRoaXMgc2VyaWVzIGluY2x1ZGVzIGEgdG90YWwgb2YgMjcgcGF0Y2hlcywgdG8gYWxp
Z24gbWlubWF4Lmggb2YKPj4+IHY1LjE1Lnkgd2l0aCB2Ni4xNy1yYzYuCj4+Pgo+Pj4gVGhlIHNl
dCBjb25zaXN0cyBvZiAyNCBjb21taXRzIHRoYXQgZGlyZWN0bHkgdXBkYXRlIG1pbm1heC5oOgo+
Pj4gMSkgOTJkMjNjNmU5NDE1ICgib3ZlcmZsb3csIHRyYWNpbmc6IERlZmluZSB0aGUgaXNfc2ln
bmVkX3R5cGUoKSBtYWNybwo+Pj4gICAgb25jZSIpCj4+PiAyKSA1ZWZjZWNkOWEzYjEgKCJtaW5t
YXg6IHNhbml0eSBjaGVjayBjb25zdGFudCBib3VuZHMgd2hlbiBjbGFtcGluZyIpCj4+PiAzKSAy
MTIyZTJhNGVmYzIgKCJtaW5tYXg6IGNsYW1wIG1vcmUgZWZmaWNpZW50bHkgYnkgYXZvaWRpbmcg
ZXh0cmEKPj4+ICAgIGNvbXBhcmlzb24iKQo+Pj4gNCkgZjliZmYwZTMxODgxICgibWlubWF4OiBh
ZGQgaW5fcmFuZ2UoKSBtYWNybyIpCj4+PiA1KSBjOTUyYzc0OGM3YTkgKCJtaW5tYXg6IEludHJv
ZHVjZSB7bWluLG1heH1fYXJyYXkoKSIpCj4+PiA2KSA1ZTU3NDE4YTIwMzEgKCJtaW5tYXg6IGRl
ZHVwbGljYXRlIF9fdW5jb25zdF9pbnRlZ2VyX3R5cGVvZigpIikKPj4+IDcpIGY2ZTlkMzhmOGVi
MCAoIm1pbm1heDogZml4IGhlYWRlciBpbmNsdXNpb25zIikKPj4+IDgpIGQwM2ViYTk5ZjViZiAo
Im1pbm1heDogYWxsb3cgbWluKCkvbWF4KCkvY2xhbXAoKSBpZiB0aGUgYXJndW1lbnRzCj4+PiAg
ICBoYXZlIHRoZSBzYW1lIHNpZ25lZG5lc3MuIikKPj4+IDkpIGY0Yjg0YjJmZjg1MSAoIm1pbm1h
eDogZml4IGluZGVudGF0aW9uIG9mIF9fY21wX29uY2UoKSBhbmQKPj4+ICAgIF9fY2xhbXBfb25j
ZSgpIikKPj4+IDEwKSA0ZWFkNTM0ZmJhNDIgKCJtaW5tYXg6IGFsbG93IGNvbXBhcmlzb25zIG9m
ICdpbnQnIGFnYWluc3QgJ3Vuc2lnbmVkCj4+PiAgICAgY2hhci9zaG9ydCciKQo+Pj4gMTEpIDg2
NzA0NmNjNzAyNyAoIm1pbm1heDogcmVsYXggY2hlY2sgdG8gYWxsb3cgY29tcGFyaXNvbiBiZXR3
ZWVuCj4+PiAgICAgdW5zaWduZWQgYXJndW1lbnRzIGFuZCBzaWduZWQgY29uc3RhbnRzIikKPj4+
IDEyKSAzYTdlMDJjMDQwYjEgKCJtaW5tYXg6IGF2b2lkIG92ZXJseSBjb21wbGljYXRlZCBjb25z
dGFudAo+Pj4gICAgIGV4cHJlc3Npb25zIGluIFZNIGNvZGUiKQo+Pj4gMTQpIDAxN2ZhM2U4OTE4
NyAoIm1pbm1heDogc2ltcGxpZnkgYW5kIGNsYXJpZnkgbWluX3QoKS9tYXhfdCgpCj4+PiAgICAg
aW1wbGVtZW50YXRpb24iKQo+Pj4gMTUpIDFhMjUxZjUyY2ZkYyAoIm1pbm1heDogbWFrZSBnZW5l
cmljIE1JTigpIGFuZCBNQVgoKSBtYWNyb3MKPj4+ICAgICBhdmFpbGFibGUgZXZlcnl3aGVyZSIp
Cj4+PiAxOCkgZGMxYzgwMzRlMzFiICgibWlubWF4OiBzaW1wbGlmeSBtaW4oKS9tYXgoKS9jbGFt
cCgpCj4+PiAgICAgaW1wbGVtZW50YXRpb24iKQo+Pj4gMTkpIDIyZjU0Njg3MzE0OSAoIm1pbm1h
eDogaW1wcm92ZSBtYWNybyBleHBhbnNpb24gYW5kIHR5cGUKPj4+ICAgICBjaGVja2luZyIpCj4+
PiAyMCkgMjFiMTM2Y2M2M2QyICgibWlubWF4OiBmaXggdXAgbWluMygpIGFuZCBtYXgzKCkgdG9v
IikKPj4+IDIxKSA3MWVlOWIxNjI1MWUgKCJtaW5tYXguaDogYWRkIHdoaXRlc3BhY2UgYXJvdW5k
IG9wZXJhdG9ycyBhbmQgYWZ0ZXIKPj4+ICAgICBjb21tYXMiKQo+Pj4gMjIpIDEwNjY2ZTk5MjA0
OCAoIm1pbm1heC5oOiB1cGRhdGUgc29tZSBjb21tZW50cyIpCj4+PiAyMykgYjI4MGJiMjdhOWY3
ICgibWlubWF4Lmg6IHJlZHVjZSB0aGUgI2RlZmluZSBleHBhbnNpb24gb2YgbWluKCksCj4+PiAg
ICAgbWF4KCkgYW5kIGNsYW1wKCkiKQo+Pj4gMjQpIGE1NzQzZjMyYmFlYyAoIm1pbm1heC5oOiB1
c2UgQlVJTERfQlVHX09OX01TRygpIGZvciB0aGUgbG8gPCBoaQo+Pj4gICAgIHRlc3QgaW4gY2xh
bXAoKSIpCj4+PiAyNSkgYzM5Mzk4NzJlZTRhICgibWlubWF4Lmg6IG1vdmUgYWxsIHRoZSBjbGFt
cCgpIGRlZmluaXRpb25zIGFmdGVyIHRoZQo+Pj4gICAgIG1pbi9tYXgoKSBvbmVzIikKPj4+IDI2
KSA0OTViYmExN2NkZjkgKCJtaW5tYXguaDogc2ltcGxpZnkgdGhlIHZhcmlhbnRzIG9mIGNsYW1w
KCkiKQo+Pj4gMjcpIDJiOTdhYWY3NGVkNSAoIm1pbm1heC5oOiByZW1vdmUgc29tZSAjZGVmaW5l
cyB0aGF0IGFyZSBvbmx5Cj4+PiAgICAgZXhwYW5kZWQgb25jZSIpCj4+Pgo+Pj4gMiBwcmVyZXF1
aXNpdGUgY29tbWl0cyB0aGF0IGFkanVzdCB1c2VycyBvZiBNSU4gYW5kIE1BWCBtYWNyb3MgKHRv
Cj4+PiBwcmV2ZW50IGNvbXBpbGF0aW9uIGlzc3Vlcyk6Cj4+PiAxMykgNDQ3N2IzOWMzMmZkICgi
bWlubWF4OiBhZGQgYSBmZXcgbW9yZSBNSU5fVC9NQVhfVCB1c2VycyIpCj4+PiAxNykgY2IwNGU4
YjFkMmYyICgibWlubWF4OiBkb24ndCB1c2UgbWF4KCkgaW4gc2l0dWF0aW9ucyB0aGF0IHdhbnQg
YSBDCj4+PiAgICAgY29uc3RhbnQgZXhwcmVzc2lvbiIpCj4+Pgo+Pj4gMSBhZGRpdGlvbmFsIGNv
bW1pdCBpbnRyb2R1Y2VkIHRvIHJlc29sdmUgYSBidWlsZCBmYWlsdXJlcyBkdXJpbmcgdGhlCj4+
PiBiYWNrcG9ydDoKPj4+IDE2KSBsaWI6IHpzdGQ6IGRyb3AgbG9jYWwgTUlOL01BWCBtYWNyb3Mg
aW4gZmF2b3Igb2YgZ2VuZXJpYyBvbmVzCj4+Pgo+Pj4gVGhlIHByaW1hcnkgbW90aXZhdGlvbiBp
cyB0byBicmluZyBpbiBjb21taXQgKDgpLgo+Pj4gSW4gbWFpbmxpbmUsIHRoaXMgY2hhbmdlIGFs
bG93cyBtaW4oKS9tYXgoKS9jbGFtcCgpIHRvIGFjY2VwdCBtaXhlZAo+Pj4gYXJndW1lbnQgdHlw
ZXMgd2hlbiBib3RoIHNoYXJlIHRoZSBzYW1lIHNpZ25lZG5lc3MuCj4+PiBCYWNrcG9ydGVkIHBh
dGNoZXMgdG8gdjUuMTAueSB0aGF0IHVzZSBzdWNoIGZvcm1zIHRyaWdnZXIgY29tcGlsZXIKPj4+
IHdhcm5pbmdzLCB3aGljaCBpbiB0dXJuIGNhdXNlIGJ1aWxkIGZhaWx1cmVzIHdoZW4gLVdlcnJv
ciBpcyBlbmFibGVkLgo+Pj4KPj4+IE9yaWdpbmFseSBJIGFsaWduZWQgNS4xMC55IHRvIDUuMTUu
eSwgYnV0IERhdmlkIExhaWdodCBjb21tZW50ZWQgdGhhdCBJCj4+PiBuZWVkIHRvIHBpY2sgdXAg
dGhlIGxhdGVyIGNoYW5nZXMgKGZyb20gTGludXMpIGFzIHdlbGwuCj4+Pgo+Pj4gQW5keSBTaGV2
Y2hlbmtvICgyKToKPj4+ICAgbWlubWF4OiBkZWR1cGxpY2F0ZSBfX3VuY29uc3RfaW50ZWdlcl90
eXBlb2YoKQo+Pj4gICBtaW5tYXg6IGZpeCBoZWFkZXIgaW5jbHVzaW9ucwo+Pj4KPj4+IEJhcnQg
VmFuIEFzc2NoZSAoMSk6Cj4+PiAgIG92ZXJmbG93LCB0cmFjaW5nOiBEZWZpbmUgdGhlIGlzX3Np
Z25lZF90eXBlKCkgbWFjcm8gb25jZQo+Pj4KPj4+IERhdmlkIExhaWdodCAoMTEpOgo+Pj4gICBt
aW5tYXg6IGFsbG93IG1pbigpL21heCgpL2NsYW1wKCkgaWYgdGhlIGFyZ3VtZW50cyBoYXZlIHRo
ZSBzYW1lCj4+PiAgICAgc2lnbmVkbmVzcy4KPj4+ICAgbWlubWF4OiBmaXggaW5kZW50YXRpb24g
b2YgX19jbXBfb25jZSgpIGFuZCBfX2NsYW1wX29uY2UoKQo+Pj4gICBtaW5tYXg6IGFsbG93IGNv
bXBhcmlzb25zIG9mICdpbnQnIGFnYWluc3QgJ3Vuc2lnbmVkIGNoYXIvc2hvcnQnCj4+PiAgIG1p
bm1heDogcmVsYXggY2hlY2sgdG8gYWxsb3cgY29tcGFyaXNvbiBiZXR3ZWVuIHVuc2lnbmVkIGFy
Z3VtZW50cyBhbmQKPj4+ICAgICBzaWduZWQgY29uc3RhbnRzCj4+PiAgIG1pbm1heC5oOiBhZGQg
d2hpdGVzcGFjZSBhcm91bmQgb3BlcmF0b3JzIGFuZCBhZnRlciBjb21tYXMKPj4+ICAgbWlubWF4
Lmg6IHVwZGF0ZSBzb21lIGNvbW1lbnRzCj4+PiAgIG1pbm1heC5oOiByZWR1Y2UgdGhlICNkZWZp
bmUgZXhwYW5zaW9uIG9mIG1pbigpLCBtYXgoKSBhbmQgY2xhbXAoKQo+Pj4gICBtaW5tYXguaDog
dXNlIEJVSUxEX0JVR19PTl9NU0coKSBmb3IgdGhlIGxvIDwgaGkgdGVzdCBpbiBjbGFtcCgpCj4+
PiAgIG1pbm1heC5oOiBtb3ZlIGFsbCB0aGUgY2xhbXAoKSBkZWZpbml0aW9ucyBhZnRlciB0aGUg
bWluL21heCgpIG9uZXMKPj4+ICAgbWlubWF4Lmg6IHNpbXBsaWZ5IHRoZSB2YXJpYW50cyBvZiBj
bGFtcCgpCj4+PiAgIG1pbm1heC5oOiByZW1vdmUgc29tZSAjZGVmaW5lcyB0aGF0IGFyZSBvbmx5
IGV4cGFuZGVkIG9uY2UKPj4+Cj4+PiBFbGlhdiBGYXJiZXIgKDEpOgo+Pj4gICBsaWI6IHpzdGQ6
IGRyb3AgbG9jYWwgTUlOL01BWCBtYWNyb3MgaW4gZmF2b3Igb2YgZ2VuZXJpYyBvbmVzCj4+Pgo+
Pj4gSGVydmUgQ29kaW5hICgxKToKPj4+ICAgbWlubWF4OiBJbnRyb2R1Y2Uge21pbixtYXh9X2Fy
cmF5KCkKPj4+Cj4+PiBKYXNvbiBBLiBEb25lbmZlbGQgKDIpOgo+Pj4gICBtaW5tYXg6IHNhbml0
eSBjaGVjayBjb25zdGFudCBib3VuZHMgd2hlbiBjbGFtcGluZwo+Pj4gICBtaW5tYXg6IGNsYW1w
IG1vcmUgZWZmaWNpZW50bHkgYnkgYXZvaWRpbmcgZXh0cmEgY29tcGFyaXNvbgo+Pj4KPj4+IExp
bnVzIFRvcnZhbGRzICg4KToKPj4+ICAgbWlubWF4OiBhdm9pZCBvdmVybHkgY29tcGxpY2F0ZWQg
Y29uc3RhbnQgZXhwcmVzc2lvbnMgaW4gVk0gY29kZQo+Pj4gICBtaW5tYXg6IGFkZCBhIGZldyBt
b3JlIE1JTl9UL01BWF9UIHVzZXJzCj4+PiAgIG1pbm1heDogc2ltcGxpZnkgYW5kIGNsYXJpZnkg
bWluX3QoKS9tYXhfdCgpIGltcGxlbWVudGF0aW9uCj4+PiAgIG1pbm1heDogbWFrZSBnZW5lcmlj
IE1JTigpIGFuZCBNQVgoKSBtYWNyb3MgYXZhaWxhYmxlIGV2ZXJ5d2hlcmUKPj4+ICAgbWlubWF4
OiBkb24ndCB1c2UgbWF4KCkgaW4gc2l0dWF0aW9ucyB0aGF0IHdhbnQgYSBDIGNvbnN0YW50Cj4+
PiAgICAgZXhwcmVzc2lvbgo+Pj4gICBtaW5tYXg6IHNpbXBsaWZ5IG1pbigpL21heCgpL2NsYW1w
KCkgaW1wbGVtZW50YXRpb24KPj4+ICAgbWlubWF4OiBpbXByb3ZlIG1hY3JvIGV4cGFuc2lvbiBh
bmQgdHlwZSBjaGVja2luZwo+Pj4gICBtaW5tYXg6IGZpeCB1cCBtaW4zKCkgYW5kIG1heDMoKSB0
b28KPj4+Cj4+PiBNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSAoMSk6Cj4+PiAgIG1pbm1heDogYWRk
IGluX3JhbmdlKCkgbWFjcm8KPj4+Cj4+PiAgYXJjaC9hcm0vbW0vcGFnZWF0dHIuYyAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA2ICstCj4+PiAgYXJjaC91bS9kcml2ZXJzL21jb25zb2xlX3Vz
ZXIuYyAgICAgICAgICAgICAgIHwgICAyICsKPj4+ICBhcmNoL3g4Ni9tbS9wZ3RhYmxlLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0gIAo+Pgo+Pj4gIGRyaXZlcnMvZWRhYy9zYl9l
ZGFjLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQo+Pj4gIGRyaXZlcnMvZWRhYy9z
a3hfY29tbW9uLmggICAgICAgICAgICAgICAgICAgICB8ICAgMSAtCj4+PiAgLi4uL2RybS9hbWQv
ZGlzcGxheS9tb2R1bGVzL2hkY3AvaGRjcF9kZGMuYyAgIHwgICAyICsKPj4+ICAuLi4vZHJtL2Ft
ZC9wbS9wb3dlcnBsYXkvaHdtZ3IvcHBldnZtYXRoLmggICAgfCAgMTQgKy0KPj4+ICAuLi4vZHJt
L2FybS9kaXNwbGF5L2luY2x1ZGUvbWFsaWRwX3V0aWxzLmggICAgfCAgIDIgKy0KPj4+ICAuLi4v
ZGlzcGxheS9rb21lZGEva29tZWRhX3BpcGVsaW5lX3N0YXRlLmMgICAgfCAgMjQgKy0KPj4+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYyAgICAgICAgICAgICAgfCAgIDIgKy0KPj4+
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jICAgICAgICAgfCAgIDYgLQo+
Pj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmMgICAgICAgICB8ICAgMiAr
Cj4+PiAgZHJpdmVycy9od21vbi9hZHQ3NDc1LmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDI0
ICstCj4+PiAgZHJpdmVycy9pbnB1dC90b3VjaHNjcmVlbi9jeXR0c3A0X2NvcmUuYyAgICAgIHwg
ICAyICstCj4+PiAgZHJpdmVycy9tZC9kbS1pbnRlZ3JpdHkuYyAgICAgICAgICAgICAgICAgICAg
IHwgICAyICstCj4+PiAgZHJpdmVycy9tZWRpYS9kdmItZnJvbnRlbmRzL3N0djAzNjdfcHJpdi5o
ICAgIHwgICAzICsKPj4+ICAuLi4vbmV0L2V0aGVybmV0L2NoZWxzaW8vY3hnYjMvY3hnYjNfbWFp
bi5jICAgfCAgMTggKy0KPj4+ICAuLi4vbmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1h
Y19tYWluLmMgfCAgIDIgKy0KPj4+ICBkcml2ZXJzL25ldC9mamVzL2ZqZXNfbWFpbi5jICAgICAg
ICAgICAgICAgICAgfCAgIDQgKy0KPj4+ICBkcml2ZXJzL25mYy9wbjU0NC9pMmMuYyAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDIgLQo+Pj4gIGRyaXZlcnMvcGxhdGZvcm0veDg2L3NvbnktbGFw
dG9wLmMgICAgICAgICAgICB8ICAgMSAtCj4+PiAgZHJpdmVycy9zY3NpL2lzY2kvaW5pdC5jICAg
ICAgICAgICAgICAgICAgICAgIHwgICA2ICstICAKPj4KPj4gSSBkbyBzZWUgdGhlIHZhbHVlIHRv
IGJhY2twb3J0IHRoZSBpbmZyYXN0cnVjdHVyZSwgYnV0IHdoeSBhcmUgZHJpdmVyIHNwZWNpZmlj
IGNoYW5nZXMgYmFja3BvcnRlZCBhcyB3ZWxsPwo+IAo+IFRoZXkgd2lsbCBiZSBhYm91dCByZW1v
dmluZyBsb2NhbCBkZWZpbml0aW9ucyBvZiBNSU4oKSBhbmQgTUFYKCkgZnJlZWluZwo+IHRoZW0g
dXAgZm9yIHNpbXBsZSBpbXBsZW1lbnRhdGlvbnMgKHVzYWJsZSBhcyBjb25zdGFudCBpbml0aWFs
aXNlcnMpIGFuZCB0aGVuCj4gdXNpbmcgdGhlbSBpbiBwbGFjZXMgd2hlcmUgdGhlIGNvbXBvdW5k
IHN0YXRlbWVudHMgaW4gbWluKCkgYW5kIG1heCgpIGNhbid0Cj4gYmUgdXNlZC4KPiAKPiBMaW51
cyBkaWQgYWxsIHRob3NlIGNoYW5nZXMgLSBzbyBoZSBkaWRuJ3QgaGF2ZSB0byB3YWl0IGZvciB0
aGUgbWFpbnRhaW5lcnMKPiB0byBhcHBseSB0aGUgY2hhbmdlcyAoZXRjKS4KClNvdW5kcyByZWFz
b25hYmxlLCBmZWVsIGZyZWUgdG8gYWRkIG15IGFja2VkLWJ5IGZvciByYWRlb24gYW5kIGFtZGdw
dSBkcml2ZXIgY2hhbmdlcy4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4gCj4gCURhdmlkCj4gIAo+
Pgo+PiBJIG1lYW4gdGhlIGNoYW5nZXMgYXJlIG1vc3QgbGlrZWx5IGNvcnJlY3QgYnV0IGFsc28g
bm90IHZhbHVhYmxlIGluIGFueXdheSBhcyBidWcgZml4Lgo+Pgo+PiBSZWdhcmRzLAo+PiBDaHJp
c3RpYW4uCj4+Cj4+PiAgLi4uL3BjaS9oaXZlX2lzcF9jc3NfaW5jbHVkZS9tYXRoX3N1cHBvcnQu
aCAgIHwgICA1IC0KPj4+ICBmcy9idHJmcy9taXNjLmggICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDIgLQo+Pj4gIGZzL2J0cmZzL3RyZWUtY2hlY2tlci5jICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgMiArLQo+Pj4gIGZzL2V4dDIvYmFsbG9jLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAgMiAtCj4+PiAgZnMvZXh0NC9leHQ0LmggICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgICAyIC0KPj4+ICBmcy91ZnMvdXRpbC5oICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfCAgIDYgLQo+Pj4gIGluY2x1ZGUvbGludXgvY29tcGlsZXIuaCAgICAg
ICAgICAgICAgICAgICAgICB8ICAxNSArCj4+PiAgaW5jbHVkZS9saW51eC9taW5tYXguaCAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMjY3ICsrKysrKysrKysrKysrLS0tLQo+Pj4gIGluY2x1ZGUv
bGludXgvb3ZlcmZsb3cuaCAgICAgICAgICAgICAgICAgICAgICB8ICAgMSAtCj4+PiAgaW5jbHVk
ZS9saW51eC90cmFjZV9ldmVudHMuaCAgICAgICAgICAgICAgICAgIHwgICAyIC0KPj4+ICBrZXJu
ZWwvdHJhY2UvcHJlZW1wdGlycV9kZWxheV90ZXN0LmMgICAgICAgICAgfCAgIDIgLQo+Pj4gIGxp
Yi9idHJlZS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSAtCj4+PiAg
bGliL2RlY29tcHJlc3NfdW5sem1hLmMgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICsKPj4+
ICBsaWIvbG9naWNfcGlvLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDMgLQo+
Pj4gIGxpYi92c3ByaW50Zi5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiAr
LQo+Pj4gIGxpYi96c3RkL3pzdGRfaW50ZXJuYWwuaCAgICAgICAgICAgICAgICAgICAgICB8ICAg
MiAtCj4+PiAgbW0venNtYWxsb2MuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAxIC0KPj4+ICBuZXQvaXB2NC9wcm9jLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDIgKy0KPj4+ICBuZXQvaXB2Ni9wcm9jLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDIgKy0KPj4+ICBuZXQvbmV0ZmlsdGVyL25mX25hdF9jb3JlLmMgICAgICAgICAgICAg
ICAgICAgfCAgIDYgKy0KPj4+ICBuZXQvdGlwYy9jb3JlLmggICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDIgKy0KPj4+ICBuZXQvdGlwYy9saW5rLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMTAgKy0KPj4+ICA0NCBmaWxlcyBjaGFuZ2VkLCAzMDYgaW5zZXJ0aW9u
cygrKSwgMTY0IGRlbGV0aW9ucygtKQo+Pj4gICAKPj4KPj4KPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
