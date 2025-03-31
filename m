Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBBFA76455
	for <lists+linux-stm32@lfdr.de>; Mon, 31 Mar 2025 12:35:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E58A3C78F98;
	Mon, 31 Mar 2025 10:35:41 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013030.outbound.protection.outlook.com
 [40.107.162.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6A0BC78F95
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 31 Mar 2025 10:35:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJo3KvS07SvKkqbzcqME2bxx9gQcEoLRmCMAMlvQ2eyFZOoJCzgPqky6YyaTWd2C1W80XNwoANyJ848okmUs/VtSOKHZVAGij9xrQcKZs1nz/gMipeIdcJcFv3wPa78me9CPfFhKMuCBZ0/9Gf0umjoB35nGrp0gjc0TgXW3OspoBRKYpHqpSgH2HMwAgKYqgicUCLboZcH55SZiORuUN9ZXt4Mgmx2O9+UyjAFRhoLKyQR1ACqVDWDTRj1i+VtMJBLIbRiTj/KZGDm/jtBcYexM0DzY59FB6nzZk6/NO/OqfPyDUhnqda/m3i2P7Bb6kp2coEZPuvAhkHWLjefwYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buF+oFZUjJTeZkoeUl7ey4pz3EtuA0+GsJFVpKYcO/Q=;
 b=I+/V6rQKkxZ0zjQrYX9lZrNO1gBK2WG6UUxLZatTPdf05VWoEXVCivdWi9sg2vt2Sm+8l+cz6WIAAR4bUG5D/Ml09orm9BAlD8Gx4UiyiS9HvMOxZCfB/KSgjZf0bOz1GBCpNARxa7bA20HQoc3jFx3MSl87z1ZdSwqeubZKb83Lt+Flvs8CS5x5tmcx16DyfY+MAmv8fMdMulgJ9/7N/rhgXVLY3ZMY9t6IujuC0KSqy1Hl7YuICyhNyvc/e0xB6SLwbtPM7gte/dNBt6JqHxzXkK1rpy4z4kINOp7J+HRhAZIH5sPPdZJzl+LnyvFEICufg9fpImr5q01GqAP+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buF+oFZUjJTeZkoeUl7ey4pz3EtuA0+GsJFVpKYcO/Q=;
 b=KfAUgrMP3RDejC19+ZxM8ERCpTuCOp5YOUm6kM4euviSbvWX9GP4bQmDNdcjBVHCZJcivWBuTGK3J0Ghy/oyHhZkvq86gomEOS2z0xvOmUS90y96wejWmCvU+Q6W9nD3f4wJ2XEyUm5RwEzY/CW10p+xxIch1uZGDIi+lq+6z4aW169xmy+ab01sFKoHN4d06o/nvgD4hKyNZXYuqYCP6VfIC28ZJAwZ0PoxZyKNQ2F+NlSFlYd3+8nWLF/6OVjW0QQe0jxbdYS8/iBOMejAI+wyjn5E3hbUL7DUSvJPgDt9AHEP6MjBNlAtXwwo5iegvs1ItfKVR4J+Hv1cO3TcmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by DB9PR04MB9703.eurprd04.prod.outlook.com (2603:10a6:10:302::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 10:35:37 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.052; Mon, 31 Mar 2025
 10:35:36 +0000
Message-ID: <7053e5e5-289a-00d0-8f18-41d1cfc52e9d@oss.nxp.com>
Date: Mon, 31 Mar 2025 13:35:33 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
References: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
 <20250328134208.2183653-3-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250328134208.2183653-3-daniel.lezcano@linaro.org>
X-ClientProxiedBy: AM0PR02CA0024.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::37) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|DB9PR04MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: baf1b17d-5976-4933-b863-08dd703fc615
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjRSUElmcGpMTDQvWm9GekxxQXBkcnhYQWZtcnNHazdpaTkwa0NPSWJiNGd0?=
 =?utf-8?B?SHRrSS9WblFZZU1uTUFZSWdweVRIWlNYYXVLQXVkV1loWU5uMHNwREFUUVlZ?=
 =?utf-8?B?M1o0NGZiRjZTclpRRmNOcjhRcElLQ2hTeCt2VEc0TTRUUXVtVUxacUc2dExU?=
 =?utf-8?B?eEhHZmRzM21sTEpHdms2L2dQK0VwbnVGY2M4blpkQjhVSEJZTFBOc3hMaVVW?=
 =?utf-8?B?R3dmR2lxUllkRUErMjhXWElFZjk0UEFJTE5QUGxaQlR3TWs0QlJSQkl5RmNr?=
 =?utf-8?B?L2s2bUdoYzRPazFhTUlwVFhRaHhJUTlCKzFNSEtOQWVYNVdNWjNjcG1ZNXY4?=
 =?utf-8?B?SDVjNlVybUV0NDBJMXk3a2RUWFJRbnZqOUFmNi8xdnVMRHQvSVNSb1RnNTBY?=
 =?utf-8?B?c01YMnF2aTNnSU16enFMK0UrQnhJREFqbGFPcDBzYW5TM0hBMTBDT1FodThR?=
 =?utf-8?B?Uk9BVHkvYWozUCtJazZOejdNbHExRDNyWnFNVitsc1YzTEZOelFuR005UjVq?=
 =?utf-8?B?Q2c3eUtkb2kwc2tsaHlJc215U1h3ZDVIUlY4SW0wNkhITGxCeUxXRStBV0sr?=
 =?utf-8?B?N2F5anBBNlJia2djYmNJVUxRYjdDVzV2TEVySDdRaFBlUlpweG5tTEEralRx?=
 =?utf-8?B?UGRycUY5dVRBaXpIdnFTZG1xc1JIdUN5UEYxbVZIYkozQTY2T3Q3blhwL3hN?=
 =?utf-8?B?NTlXb0pHTFcwMnJwaytoQ3Z3cG4xZTQwL1o4eEwvSi9ZdjRBbmhxMmN3eW82?=
 =?utf-8?B?UUZXaXp3WGdRaEx1akw5Rm5xL2R1bjIrS3JNUTlYZEdMd3FvdzFKOWZZbmFY?=
 =?utf-8?B?eHgwSjN3UWtBUmlPZU1DUGpuVU5zUVF3bS9OT2JadkdiY1ZPL2tkOCtUYjhj?=
 =?utf-8?B?eWh0Ukx4QnRiVGlSalJlMlZ6eTl2UEhHTjlZUVZCbk8vL2VJc2pPb3FSWjJV?=
 =?utf-8?B?T2xVZmRvTWNXQVlaRnZGM211ZjI2MEJPY0djOXFna3ZpeFA3N3U4bndaa3ky?=
 =?utf-8?B?azY0TnV5YVpUakI1VERKZ1k4N3MwUTlQUS9pNnAyTml4aW0wY2JkRytQRWFt?=
 =?utf-8?B?bm1JOE1jQnB5dVZCc2pUeEJvaVdyOXh4Vk5abTMxc0V0YlNEVmE2WjdIRktv?=
 =?utf-8?B?WHVwdTUxWTRhWHovOUNDdFFSSVRVOXV2c0dQbENsLy9iVlZLaEtpL0RmSG1N?=
 =?utf-8?B?RTJrOVZKckVxdnNHbmN2TVBqZkt5ejJCeFBxN0ZkK014dXNoTnU4a1ppUXVl?=
 =?utf-8?B?KytxT2RJOC9jMmZPR3g3ZFFvbGh3WVZYMVYzYVJFVkFwNTN5OTBuWFJTUzhV?=
 =?utf-8?B?T0huMSszRUI4V0ExK3MxU2pYNlBsNW1FQ0FNMVpIZXZMcmJrQlYrTDZIdTFq?=
 =?utf-8?B?d1Z5SXdxTmNNck1EbzhWbzI0a1pZR0xCaGp1R0ZySlhIc3Bjd2pOVWRkeTNX?=
 =?utf-8?B?eE0rWWVIYTg2eFF1Y2RIMkRnU2FrUWpmbEFtelZVbDR1aHl4L0F4cnpIUzNv?=
 =?utf-8?B?Rm1VT1FCdjhGWWMwK1RDaHRKVCtOK0JGTU1BTnh0b3MxSDk3ZitwbFdiVWZP?=
 =?utf-8?B?SUhzY2lVV2NyR2lzd0ZKWFMzaktyNUJZRFMxTGNTaFl3cUIxSkFpMkQvc3U3?=
 =?utf-8?B?cytwRkt4aVF2U3g3akg1OURvRmxxaXpBajNBVm1pN0tXR3cxS3Z2eU1IdjRq?=
 =?utf-8?B?T2NuVFBBejZNZXpydE0rQVlSM3dyTkN6MGxZUllVRk90UTNnSUxXWGlKVWZq?=
 =?utf-8?B?ZURDaGJ0WGRHYkU3STZhNU5NcnJ6QUozWmVoeERDVEhSYTNtTmNSWFFaTm5F?=
 =?utf-8?B?YitSQkE2M3pmdlZrN1RIUTVqQ21UUHdrYkFxdjg4MGRjNXFPMFVsa0IvWUNi?=
 =?utf-8?Q?UqqoT43a/TBnO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU2PR04MB8582.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDJIWXZ0TDI4dkhManl6Z01FMjQzbmFoRzRMWHpQRHhIQkhneWtXYnpPbTIy?=
 =?utf-8?B?Z0xFSk5yeG1OaTFsT05uSVBQdXlrV0RId1pVcVlJY0Jya2dyZTlUV2tsZmxh?=
 =?utf-8?B?dTRFUEdWamo1VERxTFlFYTNhdFN4d3R4T09EbmxTcnFaak9oMFc4MXI2Z2g3?=
 =?utf-8?B?aVUvT3owU05QY2s0NE91VTZFb2tjblRDbkVadDl4Vi9mNFpHbldwbkdnOEJ2?=
 =?utf-8?B?algxUkFsQWowbE9lSURjWmJoVXJGanY4dm9XUVBNR3lRWitRdlRpZGhzZ0No?=
 =?utf-8?B?NVVSaktBVnM3Z0QrY1VOL3lUamcvZXA4N2tNY0gxRDE2MXBoTHdDVi9pR0J2?=
 =?utf-8?B?RDNlSEo0RHdHcEduNlFiSTJmeVFHVmE3aStsM1FlZEJpYnplUENPd1IyWk1S?=
 =?utf-8?B?ZDgvZDVvdlZBaU9rWGRxS3hGdWF1d1B0S2FGaElPUEwxWGp4THUrSFRhS2NY?=
 =?utf-8?B?ZUtvMDFvR1NUa0JzY3dqMzNuMjBLZkRvOHJ0SkdURjhZbUllSVJoVFBpRHJk?=
 =?utf-8?B?ZVRYWWlGdVE3SUllQnhnQ0I1Qm5tejdvbnNZNEx4UnpNem9xTk1SYzd6K29G?=
 =?utf-8?B?NzA2azREMzZPY2pPS09sdHZnWVlvcWxBK21KWjMxMjlBUmJZV0x3SGM3VWcx?=
 =?utf-8?B?NlVHUEZiU21XSDZKTE1vVmdlYnZqVlQyNkRBaTk0WGRmMG9obWtRMGdGYzRV?=
 =?utf-8?B?NmJNQitMKzZyT0ZhSFQvVVdINjh3bDZXajFEc3RHemplY0lDV3VobVFESzZv?=
 =?utf-8?B?aXA5YW9LYmVDSzJpVDVXWnlKT0IxVU5md3lta3VKaVlrekJPZ2lIb1kySVIv?=
 =?utf-8?B?UmtNb0pEV0ZKdFpSQlUwbUZqc2ErcEk2YjBzYW54Yk5sdnlrbDMvY3pmazY3?=
 =?utf-8?B?WFVFYnZtdjRYU0UwdmVvOCsvUWJPUTEwUGFFa2U3VytLRVVZMUcxaTcxVytS?=
 =?utf-8?B?b2Z0MnhTUm5YMVRHaTByN1VJZTdWNEVvUGR0ZVpDaml2Q3h5VTErelVSSVll?=
 =?utf-8?B?Znloc2liV29JbFlTc1dQOFAraXlyMnpoT2pQWER0c1VJNmtydzQ1VEdIeWZX?=
 =?utf-8?B?bGIwbjRvNWVxUis2RlBQVkRsWVZtVU9xdm5DYTZleUpaKzFObllvUXNxOWhF?=
 =?utf-8?B?ek5sZ3RqTkhIdWhjREJweTh4clRLN2JDREZiY00rNDNKSkVUSEJnT212UUJQ?=
 =?utf-8?B?MWNEOHVLN0xzNDVaMUovRDRuZ3hycjMzaU9YeVBvemkxZFNqZTlSa1VJbTI3?=
 =?utf-8?B?ekx3TG9uM0liUlUvZ1Y0R3JQTDNRUUd3Qk9xbWlIdXRRT3Myd3RpdmlnbTJB?=
 =?utf-8?B?emI2VjRPbHBPaVl2UDNSMXpqcUxmVVloSjA1ZGFiOWZVRHdQcXlqWFI3b0dq?=
 =?utf-8?B?Sk44dnQyTUVhU2VwTitmdkJtdWxnZzZBVktZdTFvc1dLVXNWczNGbFlVQklR?=
 =?utf-8?B?bENmeTI2aVZnNk5LVG9wLzVrdDBVSGl2eHdBMmNaWGtGYXBFZ3crczlHSk8w?=
 =?utf-8?B?SVp6Z1ZQakF4VGdLWlo1aHJDV0dXV252ZHBOWjdVNVRHRTRvK1ZiSTN3bU1W?=
 =?utf-8?B?VlZTb3VYRzByMXZKdU55Q1NWOWsxSTNXdm84cXhxMS9TMjZUWUVmemJNSmxo?=
 =?utf-8?B?QXNhTVBsSEZPSllrRzVENS8yMm9jRk82R1Jxb3FjZnBNSVY0MmVYR0x1a2hY?=
 =?utf-8?B?YXZIbUtuRi9YRTdYSERHdjhMSlhveTJrRFdVM0dqdXZtV2dDQVFza1RvYXNI?=
 =?utf-8?B?d3FYck5odXhENCtKbThrWjdWSE9yVk1YVWR3dURJMU5idnFYNW9Ua21VMUF5?=
 =?utf-8?B?VGp0YVFvaTNPU0g0RWdMS0o2RU5mZVZvMElaMWhsUHdHVk45UjZlUWdOK0RT?=
 =?utf-8?B?aEM1bWR1OUllUVN3R1lUeWsxL1RpZlNySDByZEsrMVlpTmFhbjRiejBibXNG?=
 =?utf-8?B?cnkxYnNlbXhNeVV5SVBFbWdNRW9PTURVOERER0ZPNVhPRTAybWJDMmtjTWhk?=
 =?utf-8?B?SjZkOHpTSksxMGozTG5yRWd1MEFzcnNRTUYxenJQWnRiK0lBYWlaOVFOaGY0?=
 =?utf-8?B?Wk5xMmN4YWZJMmxFS1JYOGpoL3dnQ2x0dG5acSs3UnFOZEVoOERMcW1zMmlX?=
 =?utf-8?B?MlU3dmtBNDdTaUZMK3h5a0FLS3R2VUVmY2lKeEppcjV2cnZtcjczMXRHWTRU?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf1b17d-5976-4933-b863-08dd703fc615
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 10:35:36.7948 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KkLOE2jif3V4F8z8eap3TekVsWP2S+nhjfigNLWzxr9aLdIquHyT9FUOi/OspKZazrQBj134cvisWakxa5qiXut12z3hiq4EOb/CWBnLKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9703
Cc: S32@nxp.com, "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, Larisa.Grigore@nxp.com,
 linux-kernel@vger.kernel.org, krzk@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, thomas.fossati@linaro.org,
 ghennadi.procopciuc@nxp.com,
 "moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 2/2] clocksource/drivers/nxp-timer: Add
 the System Timer Module for the s32g platform
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

T24gMy8yOC8yMDI1IDM6NDIgUE0sIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+IFNUTSBzdXBwb3J0
cyBjb21tb25seSByZXF1aXJlZCBzeXN0ZW0gYW5kIGFwcGxpY2F0aW9uIHNvZnR3YXJlIHRpbWlu
Zwo+IGZ1bmN0aW9ucy4gU1RNIGluY2x1ZGVzIGEgMzItYml0IGNvdW50LXVwIHRpbWVyIGFuZCBm
b3VyIDMyLWJpdAo+IGNvbXBhcmUgY2hhbm5lbHMgd2l0aCBhIHNlcGFyYXRlIGludGVycnVwdCBz
b3VyY2UgZm9yIGVhY2gKPiBjaGFubmVsLiBUaGUgdGltZXIgaXMgZHJpdmVuIGJ5IHRoZSBTVE0g
bW9kdWxlIGNsb2NrIGRpdmlkZWQgYnkgYW4KPiA4LWJpdCBwcmVzY2FsZSB2YWx1ZSAoMSB0byAy
NTYpLgo+IAo+IFNUTSBoYXMgdGhlIGZvbGxvd2luZyBmZWF0dXJlczoKPiAgICAg4oCiIE9uZSAz
Mi1iaXQgY291bnQtdXAgdGltZXIgd2l0aCBhbiA4LWJpdCBwcmVzY2FsZXIKPiAgICAg4oCiIEZv
dXIgMzItYml0IGNvbXBhcmUgY2hhbm5lbHMKPiAgICAg4oCiIEFuIGluZGVwZW5kZW50IGludGVy
cnVwdCBzb3VyY2UgZm9yIGVhY2ggY2hhbm5lbAo+ICAgICDigKIgQWJpbGl0eSB0byBzdG9wIHRo
ZSB0aW1lciBpbiBEZWJ1ZyBtb2RlCj4gCj4gVGhlIHMzMmcgcGxhdGZvcm0gaXMgZGVjbGluZWQg
aW50byB0d28gdmVyc2lvbnMsIHRoZSBzMzJnMiBhbmQgdGhlCj4gczMyZzMuIFRoZSBmb3JtZXIg
aGFzIGEgU1RNIGJsb2NrIHdpdGggOCB0aW1lcnMgYW5kIHRoZSBsYXR0ZXIgaGFzIDEyCj4gdGlt
ZXJzLgo+IAo+IFRoZSBwbGF0Zm9ybSBpcyBkZXNpZ25lZCB0byBoYXZlIG9uZSB1c2FibGUgU1RN
IGluc3RhbmNlIHBlciBjb3JlIG9uCj4gdGhlIHN5c3RlbSB3aGljaCBpcyBjb21wb3NlZCBvZiAz
IHggQ29ydGV4LU0zICsgNCBDb3J0ZXgtQTUzIGZvciB0aGUKPiBzMzJnMiBhbmQgMyB4IENvcnRl
eC1NMyArIDggQ29ydGV4LUE1My4KTWlzc2luZzogJyAuLi4gZm9yIFMzMkczJyA/Cgo+IAo+IFRo
ZXJlIGlzIGEgc3BlY2lhbCBTVE0gaW5zdGFuY2UgY2FsbGVkIFNUTV9UUyB3aGljaCBpcyBkZWRp
Y2F0ZWQgdG8KPiB0aGUgdGltZXN0YW1wLiBUaGUgN3RoIFNUTSBpbnN0YW5jZSBTVE1fMDcgaXMg
ZGlyZWN0bHkgdGllZCB0byB0aGUKPiBTVE1fVFMgd2hpY2ggbWVhbnMgaXQgaXMgbm90IHVzYWJs
ZSBhcyBhIGNsb2NrZXZlbnQuCj4gCj4gVGhlIGRyaXZlciBpbnN0YW5jaWF0ZSBlYWNoIFNUTSBp
bnN0YW5jZSBkZXNjcmliZWQgaW4gdGhlIGRldmljZSB0cmVlCmluc3RhbmNpYXRlICAtID4gaW5z
dGFudGlhdGUgPwoKWyAuLi4gXQo+ICsjaW5jbHVkZSA8bGludXgvY2xrLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9jbG9ja2NoaXBzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9jcHVob3RwbHVnLmg+Cj4g
KyNpbmNsdWRlIDxsaW51eC9kZWJ1Z2ZzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9pbnRlcnJ1cHQu
aD4KPiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2ZfaXJx
Lmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPiArI2luY2x1ZGUgPGxp
bnV4L3NjaGVkX2Nsb2NrLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC91bml0cy5oPgo+ICsKPiArI2Rl
ZmluZSBTVE1fQ1IoX19iYXNlKQkJKF9fYmFzZSkKPiArCj4gKyNkZWZpbmUgU1RNX0NSX1RFTgkJ
QklUKDApCj4gKyNkZWZpbmUgU1RNX0NSX0ZSWgkJQklUKDEpCj4gKyNkZWZpbmUgU1RNX0NSX0NQ
U19PRkZTRVQJOHUKPiArI2RlZmluZSBTVE1fQ1JfQ1BTX01BU0sJCUdFTk1BU0soMTUsIFNUTV9D
Ul9DUFNfT0ZGU0VUKQo+ICsKPiArI2RlZmluZSBTVE1fQ05UKF9fYmFzZSkJCShfX2Jhc2UgKyAw
eDA0KQoKU2hvdWxkbid0IHRoZSBtYWNybyBhcmd1bWVudHMgYmUgZW5jbG9zZWQgaW4gcGFyZW50
aGVzZXMgdG8gYXZvaWQKcG90ZW50aWFsIGV2YWx1YXRpb24gb3JkZXIgaXNzdWVzPwoKWyAuLi4g
XQo+ICtzdGF0aWMgaW50IF9faW5pdCBueHBfc3RtX3RpbWVyX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gK3sKPiArCXN0cnVjdCBzdG1fdGltZXIgKnN0bV90aW1lcjsKPiAr
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUg
Km5wID0gZGV2LT5vZl9ub2RlOwo+ICsJY29uc3QgY2hhciAqbmFtZSA9IG9mX25vZGVfZnVsbF9u
YW1lKG5wKTsKPiArCXN0cnVjdCBjbGsgKmNsazsKPiArCXZvaWQgX19pb21lbSAqYmFzZTsKPiAr
CWludCBpcnEsIHJldDsKPiArCj4gKwkvKgo+ICsJICogVGhlIGRldmljZSB0cmVlIGNhbiBoYXZl
IG11bHRpcGxlIFNUTSBub2RlcyBkZXNjcmliZWQsIHNvCj4gKwkgKiBpdCBtYWtlcyB0aGlzIGRy
aXZlciBhIGdvb2QgY2FuZGlkYXRlIGZvciB0aGUgYXN5bmMgcHJvYmUuCj4gKwkgKiBJdCBpcyBz
dGlsbCB1bmNsZWFyIGlmIHRoZSB0aW1lIGZyYW1ld29yayBkb2VzIGNvcnJlY3RseQo+ICsJICog
aGFuZGxlIGEgcGFyYWxsZWwgbG9hZGluZyBvZiB0aGUgdGltZXJzIGJ1dCBhdCBsZWFzdCB0aGlz
Cj4gKwkgKiBkcml2ZXIgaXMgcmVhZHkgdG8gc3VwcG9ydCB0aGUgb3B0aW9uLgo+ICsJICovCj4g
KwlndWFyZChzdG1faW5zdGFuY2VzKSgmc3RtX2luc3RhbmNlc19sb2NrKTsKPiArCj4gKwkvKgo+
ICsJICogVGhlIFMzMkd4IGFyZSBTb0NzIGZlYXR1cmluZyBhIGRpdmVyc2Ugc2V0IG9mIGNvcmVz
LiBMaW51eAo+ICsJICogaXMgZXhwZWN0ZWQgdG8gcnVuIG9uIENvcnRleC1BNTMgY29yZXMsIHdo
aWxlIG90aGVyCj4gKwkgKiBzb2Z0d2FyZSBzdGFja3Mgd2lsbCBvcGVyYXRlIG9uIENvcnRleC1N
IGNvcmVzLiBUaGUgbnVtYmVyCj4gKwkgKiBvZiBTVE0gaW5zdGFuY2VzIGhhcyBiZWVuIHNpemVk
IHRvIGluY2x1ZGUgYXQgbW9zdCBvbmUKPiArCSAqIGluc3RhbmNlIHBlciBjb3JlLgo+ICsJICoK
PiArCSAqIEFzIHdlIG5lZWQgYSBjbG9ja3NvdXJjZSBhbmQgYSBjbG9ja2V2ZW50IHBlciBjcHUs
IHdlCj4gKwkgKiBzaW1wbHkgaW5pdGlhbGl6ZSBhIGNsb2Nrc291cmNlIHBlciBjcHUgYWxvbmcg
d2l0aCB0aGUKPiArCSAqIGNsb2NrZXZlbnQgd2hpY2ggbWFrZXMgdGhlIHJlc3VsdGluZyBjb2Rl
IHNpbXBsZXIuCj4gKwkgKgo+ICsJICogSG93ZXZlciBpZiB0aGUgZGV2aWNlIHRyZWUgaXMgZGVz
Y3JpYmluZyBtb3JlIFNUTSBpbnN0YW5jZXMKPiArCSAqIHRoYW4gdGhlIG51bWJlciBvZiBjb3Jl
cywgdGhlbiB3ZSBpZ25vcmUgdGhlbS4KPiArCSAqLwo+ICsJaWYgKHN0bV9pbnN0YW5jZXMgPj0g
bnVtX3Bvc3NpYmxlX2NwdXMoKSkKPiArCQlyZXR1cm4gMDsKPiArCj4gKwliYXNlID0gZGV2bV9v
Zl9pb21hcChkZXYsIG5wLCAwLCBOVUxMKTsKPiArCWlmIChJU19FUlIoYmFzZSkpCj4gKwkJcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGJhc2UpLCAiRmFpbGVkIHRvIGlvbWFwICVw
T0ZuXG4iLCBucCk7Cj4gKwo+ICsJaXJxID0gaXJxX29mX3BhcnNlX2FuZF9tYXAobnAsIDApOwo+
ICsJaWYgKGlycSA8PSAwKQo+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgaXJxLCAiRmFp
bGVkIHRvIHBhcnNlIGFuZCBtYXAgSVJRXG4iKTsKPiArCj4gKwlyZXQgPSBkZXZtX2FkZF9hY3Rp
b25fb3JfcmVzZXQoZGV2LCBkZXZtX2lycV9kaXNwb3NlX21hcHBpbmcsICZpcnEpOwo+ICsJaWYg
KHJldCkgewo+ICsJCWlycV9kaXNwb3NlX21hcHBpbmcoaXJxKTsKPiArCQlyZXR1cm4gZGV2X2Vy
cl9wcm9iZShkZXYsIHJldCwgIkZhaWxlZCB0byBhZGQgZGV2bSBhY3Rpb25cbiIpOwo+ICsJfQoK
V291bGRuJ3QgcGxhdGZvcm1fZ2V0X2lycSBhY2hpZXZlIHRoZSBzYW1lIHJlc3VsdCwgYnV0IHdp
dGggbGVzcyBoYXNzbGU/CgotLSAKUmVnYXJkcywKR2hlbm5hZGkKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApM
aW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
