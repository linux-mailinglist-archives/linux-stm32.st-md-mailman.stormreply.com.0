Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE000CC6536
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Dec 2025 08:02:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D5E1C7A834;
	Wed, 17 Dec 2025 07:02:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C5FF6C01E77
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 07:02:28 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BH71ZEL3409096
 for <linux-stm32@st-md-mailman.stormreply.com>; Wed, 17 Dec 2025 08:02:28 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013021.outbound.protection.outlook.com
 [40.107.162.21])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b3bbea0t3-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Dec 2025 08:02:27 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2qa5xelHgMl/azQpSbyemNByPDyqN3yLy8E9G5igZnjcapVSxoss30k65g5b5aXVII2Ousx9gJJcWDrb4cAy+w/F/NczW9w7/vNQd8WOgFCOS1cNyi18ujwHI3GRFu/WaZzvYRPzswMnazciEnz3ReuMU1t6CQqO9hoouYpiy1gWXdLOQwld+d0tw1Z5LKWYmAfg6Aad8TGyrjPzz0wiTBrY0yJK60CqnjoFjM2o/ni+gx9ESl8Ta2yFMERRjeFO46Paxi9xfp+SJCuPEwRBm8NLfyd7z23DHVFG8o1Iq8VoYyTYYks0hLLKxUByTQlcG6WoMbydHbriIQB0QNYxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbiOurQME0/0vy/LnCDTsRZFsjwLGW6xYjMcCE/AEBI=;
 b=Qaem0xRQ5G6o2PmDqciGX2K5IO118isAd69Sivbwh/lxODQwRhjxi3aE+fTOctCYNeSqXOi+6IPAqMNXn3R5cXRtfe2E6AScaE4MpwPqMTB6k59uU69klR+jhdg8kZuFaWi/fNz94V7GyiRKfrzVs/dO45CFbp78dDtb8ja0FwHpmoBr+JhLGJP+6HnrozJxSn7K7OV2h7k6u9Pf+5wYStrz/hmR+VFgHphW2Jl7/jbYOhjTPbPpquQJ7oqgdMhxsWtPznJrvrQ/+EckFPPx0ogAJkMAqQwjPzo1M9ULgOutrmtYQSTiaVB8drTRn3c6+CMG24YoJMkMvhd0g3OKlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbiOurQME0/0vy/LnCDTsRZFsjwLGW6xYjMcCE/AEBI=;
 b=gL5AxnMgcQszYQ4aohFEDnndaVs7HQ85AyZNHTHMmBa0nTicl2J/3xiMKhInR91iCxqqUAHmeJBsrJBHH/sx4i/QzY6o3vO+ygha7elwAxlhyk+z9oCEX4YRO2bKMWjz8zWuSnhDBktndXfwjGskN/D/e0fPnbKRMj0dO15AYio+5kAZKi9WGSvoJPDax3LhbS1LWQlkvpuDPz71jkkadTOli4fnH09eb1L7OC+Owh6JRg8RVJxpcGNf9dHGqH5b7IGrDalBz8cS6G8Rp+8aBfO8K/pb5DxzY+/2DldT2NpD5y0CaEoPo5b0HEIfvVFjTNmk9kIBqncWRk/l5QKyUA==
Received: from DUZPR01CA0176.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::12) by GV1PR10MB8773.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1d5::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 07:02:24 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::29) by DUZPR01CA0176.outlook.office365.com
 (2603:10a6:10:4b3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 07:02:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 07:02:23 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 08:03:11 +0100
Received: from [10.48.87.93] (10.48.87.93) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 08:02:23 +0100
Message-ID: <8eada53a-5e5a-43cf-870c-09229a89cc9b@foss.st.com>
Date: Wed, 17 Dec 2025 08:02:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <linux-stm32@st-md-mailman.stormreply.com>
References: <20251217023721.1684244-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20251217023721.1684244-1-nichen@iscas.ac.cn>
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000B61B:EE_|GV1PR10MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 175d1a09-416c-4114-9f20-08de3d3a3ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3JTMFBIVm56Q0Vtc3JWVU5ld0grcjlwVUdPV3FadW5OYyt3SlJBV2xpRlh3?=
 =?utf-8?B?TEIwSElMOVdjaWtuZngwc1cxcW1HbVdqd05MbmE0aXRKR2xqd2N2eklCNk1h?=
 =?utf-8?B?KzkzNUZpWUx3dkNoVUlhL0Z3aEJEZXQ3anlreWVIUktDWG4yYWRmZjFnR0kv?=
 =?utf-8?B?RVI5c0k0a0h1b1kvK0JJNkg3alpQVlRmK2pvUmlnZEY1NThOc1JtRk8ybjR6?=
 =?utf-8?B?VmhOYVZwUyttZ29NbGxXL2haMzN5RWw5MVNmd2d1SUs1Ujh0akpHSVIrWGdm?=
 =?utf-8?B?MVF2TG9YVHBWWEc4UXlPcnBpUzZIVjhRa2tDWjZtbE1YdnNyZEg0ZWdMakdK?=
 =?utf-8?B?Zm96Y3NLNllEQkM5eWZTU2pYVmMxQzRNeTlFTVpFOFdNZ0luZVNWekNoTGMv?=
 =?utf-8?B?ZFlqOGpnUjB5T1VKVWJ4NjdzWjlQRGxvcElDa0hycExaN3BaZVlLdmMxSDdC?=
 =?utf-8?B?Zk9pZFhxdlBXNis0dVBIcVluVlZnSUltaXlLUFR2N09lV0RyZTQ1NXhJMEZP?=
 =?utf-8?B?OEFjU25oTFArZDNaSGN2dFJ1bWNmUm5ycW1rNDdKaFRZMGc5ak95bGZ1WFJ1?=
 =?utf-8?B?RHFjTmRwd1dENHNjWnFXdHpYNnZ4dEhNeDJTNmpmai81TE12WE5RN1ZTMUlr?=
 =?utf-8?B?MGdMTjh5STgrVFpnZEIxenNEdW1rdnVyejR5NmNldDFoSXZEbUUwTEtkL0h3?=
 =?utf-8?B?WVFoZzhhRWdVUzRLYTN3aFdGS3NYTDlodE8yVnRrVVR6YzlxUE94bDVra0dO?=
 =?utf-8?B?cDlXemxNZ3BnSDA3NTFrNFhkLzZROHA0SDB5SXlLOW5DSG1OTDlUQUZsMEd2?=
 =?utf-8?B?bHJKcjcxSGlJZkFuaml4bUhScUVnTVpPcG5Na2xLbC9lY3FuTlBqcHEyNW9R?=
 =?utf-8?B?UlFVYzhmcVdBY3k5UVY3RGlMTTRibjZPQVpSaVJyNVRnRzkrck9HSDY4d3JN?=
 =?utf-8?B?R0NZS1VIaEVNckw4Q0poK2J6aWRMUTREREFXbm5YanA0R3BGZFV3VDEwanRM?=
 =?utf-8?B?UnNyUWVhaHIxWWlqOFBhRlNGMFZZSlI4TUhyZzMzQm9zNTJ4QUZJQkthb2hI?=
 =?utf-8?B?dXhqZVpkRVFaaDlsdFRibURDZ3VKNE1uanU0UXVIcmQzaUora2kzRFFQK3Ev?=
 =?utf-8?B?ZkhKVjllN2VpSExTU1RBZC9VbWNObVhoV3hGam8zWlRNaGw2dDZzOG42ampS?=
 =?utf-8?B?dEhDbE1ianZDSVlmeHhHMERYZXFLU3c2Ry9oZG5rN056ZjFjdmlweXhLOXdt?=
 =?utf-8?B?ZVFrL1RjcEVQVFhpTWpUNTNSMEFNNjhnbEM4T3EzTlJIOWkvaEx5aVJFUDR2?=
 =?utf-8?B?TmNsckg3bDdmTVUzSnUybFgvZ3ovV0JUNnFvUXZ4eklER3M3TmNYd0R6TzFR?=
 =?utf-8?B?NGlaS1VUenM1QU1oSFR2aVJQTlBBendsamNrWk1HWXNIb0cvTlVRRkE2ZUpp?=
 =?utf-8?B?Tm9XS2ZDQWRBNmxiTVQvZG1uRTZqd1NmQ2ZqcVMzd1hPNjF0Ymo3WXAzcHZM?=
 =?utf-8?B?WjlBMkJZMXFzcW5DdmNJM2xIaURPU0lnRFVJMEtQbEIxbHQ0Q3ZFZnNCMXh0?=
 =?utf-8?B?R21yZTJZVE5lLzY3dkZyN2JIaXgxNnBYSVp0RlNQY1dJcUsvSWVsdWxrR3RP?=
 =?utf-8?B?NGJHY3RZK1g4Zm5VS0VhYjFxMnFXSVNhRXZPbHdVWDJJVGV3b2Z3V2MzaFFK?=
 =?utf-8?B?d1FhQVd5am9EZGtqZ3pFaWZNNDhOQktTUkNhTERNY3RrbXJSOXZCam5iV2hL?=
 =?utf-8?B?TFU1Qm9qSnc5SXh2SnVzR3diU3ZRV3hTMWM0T0kxMXFEMVVaeEIxN0s5SWo2?=
 =?utf-8?B?c3dsamJLbkRLbTh0TkhKTEhqU3QxWHI0cWh4R21DRVR0WkxvRDBuMnpDM1VK?=
 =?utf-8?B?L0VXbU1hanhjMWR0R3pxOUsrQ1R6TW1BRjl6cHJzWTJHMGFYa2lIcFZEdk1P?=
 =?utf-8?B?ejBjM2NBQ2orUGxaaEwxdjRZRTlIdzlJUmJyUUJNYXlHbUlXQzNnU1lOWjlG?=
 =?utf-8?B?algzUU9Rb3hkeFFxeVVJSVFUNTF6WThYMCtQa2VKQWZRTkhSZHFuOFhvd29k?=
 =?utf-8?B?UjY4NHNLdDRjeWhEUmVxV25jVlMwNEhWbFJoeEJSeXJoWURBN21IejFzY1N5?=
 =?utf-8?Q?1SNo=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 07:02:23.7291 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 175d1a09-416c-4114-9f20-08de3d3a3ae0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8773
X-Authority-Analysis: v=2.4 cv=JK82csKb c=1 sm=1 tr=0 ts=69425583 cx=c_pps
 a=lY8KjCQ9O7Y0HqcpAT++Bw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=GqV-0ptb2sBNZNKjqo8A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: YziEn4e6j7pxtd5F6IZmwxZxFGhjtWf9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA1NSBTYWx0ZWRfX01+5z1RM4/DA
 z3jKAV4+u2V3zaub8WD7gDTOsbsUMQQdrEiujWjyWKTEbD8fPiLOA6vdUgf0RsyyzWdh3fPFXlV
 ByjL3yMz5FI+QubvSQMWTlxpSh94+jJTFCewMyGhjlz/Vg6J6N2BPWr77CpZ2zkiVaXAaPn/erw
 IPLXoG2MW3k5ZfTMcFNpntzgFhWpbeq7/fGgvbRUpF9SE9qTi8PQlzFHWJQzJwDfDbYBq/QiUF8
 ajkPfIypKdQwB5vuAGhYYqKJviztFJxde17rkZ8basnTrO8wLppP1VsnTTDWoks+TouGhKfirc5
 y9MY2oA69o3BHs9aHRoHpLvWJTRG8gMMbAsa740xE6AkmdIIHSGjp5iYex6WrdaAJ1nRjervM8o
 MnPZ72cZkM2X+3j8tMcT43WEMl/VvA==
X-Proofpoint-GUID: YziEn4e6j7pxtd5F6IZmwxZxFGhjtWf9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170055
Subject: Re: [Linux-stm32] [PATCH] spi: stm32-qspi: Remove unneeded semicolon
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 12/17/25 03:37, Chen Ni wrote:
> Remove unnecessary semicolons reported by Coccinelle/coccicheck and the
> semantic patch at scripts/coccinelle/misc/semicolon.cocci.
> 
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/spi/spi-stm32-qspi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-stm32-qspi.c b/drivers/spi/spi-stm32-qspi.c
> index 2a0ee96786fa..d1df66875809 100644
> --- a/drivers/spi/spi-stm32-qspi.c
> +++ b/drivers/spi/spi-stm32-qspi.c
> @@ -153,7 +153,7 @@ static void stm32_qspi_read_fifo(void *val, void __iomem *addr, u8 len)
>  		break;
>  	case sizeof(u8):
>  		*((u8 *)val) = readb_relaxed(addr);
> -	};
> +	}
>  }
>  
>  static void stm32_qspi_write_fifo(void *val, void __iomem *addr, u8 len)
> @@ -167,7 +167,7 @@ static void stm32_qspi_write_fifo(void *val, void __iomem *addr, u8 len)
>  		break;
>  	case sizeof(u8):
>  		writeb_relaxed(*((u8 *)val), addr);
> -	};
> +	}
>  }
>  
>  static int stm32_qspi_tx_poll(struct stm32_qspi *qspi,

Hi Chen

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
