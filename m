Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE983B82A2D
	for <lists+linux-stm32@lfdr.de>; Thu, 18 Sep 2025 04:21:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 033D7C3F93E;
	Thu, 18 Sep 2025 02:21:20 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CDCF9C3F933
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 18 Sep 2025 02:21:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=py3714lcsPMbTsNcXxyS5lgC5zWar9R54GkhT7pPHwPNnX7JBGZD4z8COId4Ktdg/qSqQKGV75WCcb493ZzXtxKGAc3MP58A7kKiFgn3wfIU4VnLXh/FfFi9ReU3d8AfnOb163il7Wc6fWfysHRQv4mw/ww9Ql7lluUwuCJywJzkECGcRT8eFqoHLJsXoIcFfOhHqhcMigEUmch/Na6Mogs09HYl+oeoyFMPmCtzz+sGoALLxipw6WPwWy31eABJBjf2hl55qwTyEE3hGP3/6d7adoS3dpOyYtOtJsbFRX9yaR08utqV16PREyLUttSQvf4nkNLaaqgJW+9BN8pScw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMziIIQfQ8pupA94I4xz4HzrEti2gUZ4kKI38vZec1Q=;
 b=mVhaO8IYz6srCEw+17m5lBkjfPbILzB6i6Sjx/7IsbhIEgWh7xDJPKuDzZAyd3k5yDuPxZoNJz0qlAQkisi2iP0JfAfTBHfmRQ/kjwKUUzjDgYNwpPSed7UvtjZhwIS7KDsJ0UUkT1TohT4JKziNowogCOM7vFK7yTEEbB6PxdlJM6iw9DCP19013i1SPXPONzi7sW8or6t2uTK09FMO4LkzoL2lXP35Kn7/Q7g/guVxyu276djeZmOjhd27VrjbbmCQwDUOSxMthLQqjIRh8fxB4/BOOU7L+hj76bwVEoHF/EUMFrKY8+QNEFtGDzaoN1hZw+C2MQBq4mndLildHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMziIIQfQ8pupA94I4xz4HzrEti2gUZ4kKI38vZec1Q=;
 b=GTY+OUN9NBGAYwwGSnkTvxmwmf0VLjlCSWMNI52bhuMsExLW4DAjZGo65CMzfoJh3Vj6SjkDrWpvFsp3+ySkfgLBIgYj5xDWaeEwbovCHm/PQnp9djPRXBEmT4ZAA67h6BGiU5aOs+o8Yr9EMeTDURDhzfQBfvXDQN6KmtuVe6ZhKmYJ31lHKvORz0np2jEh/s9EgTF95tYNia75S2dDZ4PCpVIr5yUmKCD3Y1/yeD9QGuqQCVGEVKj24wl35fGJnR+xVy6CR6bMIonOOabxeNObIx1ExFBiZUt6nmbg7NL5wZA33h9rBwh8ovLo2QmeaMOx70Mo1bBTAGT2r7QCPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM6PR03MB5371.namprd03.prod.outlook.com (2603:10b6:5:24c::21)
 by DM4PR03MB5999.namprd03.prod.outlook.com (2603:10b6:5:38a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 02:21:16 +0000
Received: from DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076]) by DM6PR03MB5371.namprd03.prod.outlook.com
 ([fe80::8d3c:c90d:40c:7076%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 02:21:16 +0000
Message-ID: <071bc895-b26b-4f78-91c7-fd6d53a11e11@altera.com>
Date: Thu, 18 Sep 2025 07:50:59 +0530
User-Agent: Mozilla Thunderbird
To: Jakub Kicinski <kuba@kernel.org>,
 Rohan G Thomas via B4 Relay <devnull+rohan.g.thomas.altera.com@kernel.org>
References: <20250915-hlbs_2-v2-1-27266b2afdd9@altera.com>
 <20250917153345.27598d55@kernel.org>
Content-Language: en-US
From: "G Thomas, Rohan" <rohan.g.thomas@altera.com>
In-Reply-To: <20250917153345.27598d55@kernel.org>
X-ClientProxiedBy: MA0PR01CA0067.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::13) To DM6PR03MB5371.namprd03.prod.outlook.com
 (2603:10b6:5:24c::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR03MB5371:EE_|DM4PR03MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: ab416b2d-9a70-47de-b973-08ddf65a0b7c
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2dFK1kySlYzb0tUR24wbEZIOG90N3htMU9HZGdVMTFMaW5lb3psL0toYmZp?=
 =?utf-8?B?T1YyWkFiSUYyOUgrVUhjaEdxVWN3TGwxQ1Zhc3pGQWkzUlBqRTN1c3ZnZ2Uw?=
 =?utf-8?B?YUJXT0lOTFJETFVVWXl0ZlY2K3lLRzlHR1YydlAydDUwMDcreTNvMjFsWGZt?=
 =?utf-8?B?UmZLUGdnRVp3S3IvZ0RhbVBzenZYMEhtSURENHVINjQwNkdIUTNOV0dvNWdq?=
 =?utf-8?B?V09Xa3FYQzdMVlQ2cmJxV3FsaDFRNExlQWt2ZzFscCtMWCtmNHhZcWlFbHU0?=
 =?utf-8?B?cWhRUU1hSlVGY3d5WEpwWW90K0UrYmdRYWZTVjlVQTdlaS9JNFBkSE9Qb0cv?=
 =?utf-8?B?OFVXdzcxRVJxTWFVb3NYcy9KcXZza3VvVHNqVlA3eXYwblBoN3JtMVY5dmU5?=
 =?utf-8?B?eDA4OGtQZlpyWGxNWUY5VFdSUzA4dHZncDAzeEtUbWMwVXBMcXhuN1hMR3Np?=
 =?utf-8?B?dVFDZVBld2lIa2JpRFMrNS9TUXBVOGlPbld0UXJod1A3WXphQytQUXR1a2pR?=
 =?utf-8?B?ZUJIVHpTYjdUS1lRUGhTNm1DQkFWL1I2eGMxaGp4QVM3SEJac1Azc3JYQkJi?=
 =?utf-8?B?M0JGdDFiNytwRFBXajJkeXVtWEgxNHlFc0V2WUNNcUZwSnV5VnZjM3RWaGFj?=
 =?utf-8?B?bUxHWUE2bVhiM1dVZHNydGNDTGFrUzI2SWVoaDBkdExiZ2taN3puOFkrY2c3?=
 =?utf-8?B?ZjRXVlhEL2hPcTJHWnEzTmxyRE92dUZsMnYyY1htb1IwcnFKWXFraTUwdVB3?=
 =?utf-8?B?VDR3LzY5d05vaXhheGpYSEJzVXhjTEgzSEUzakdyWHdhZXcyN0VVTEE5enZ0?=
 =?utf-8?B?RmpjRDJsUTRrNUZ5dVFTY0xFa3NObWhMY3FuOEdpWXBTMXVMMXdSZlV3NndF?=
 =?utf-8?B?Tm1nUnNRZWVEckRDZHU1M3IrcWxMWlNzVHNpRENCODM0TlJPLzZFbmR3dkl4?=
 =?utf-8?B?TkFhdTNCYlFsMjcva1dPZFEyWTJHTWZTWi8wSnVTZFovRzhEWHl5Mkl6c243?=
 =?utf-8?B?MjY2L1p0TUpuYWN1L0FHYnQyVitOeGVLS25wK0FEV0daZmF3dnQrb3BxREh6?=
 =?utf-8?B?Q1ZwbzB1YjhWNU04ci9Ba2poWitYNnJVeUVxTGpWeS9uWWNjTHhnV0d1V1M4?=
 =?utf-8?B?TGtZeENoRE1SdzZDK0l0NEVtTDhnTzlES0VUV1JVMEMvczVDTGFBREMrc3hE?=
 =?utf-8?B?ZWY4cW9ualN5OGJ4OWd0Y00xdmVHaEhwUkNwbjZTN3RublRZaDkwWWlodVk5?=
 =?utf-8?B?SG05L2Rvc1l4RGUvR1I2UzJlWWI2cGpsUzBFMmN3cDZTUWNJdjlZN05EM0sx?=
 =?utf-8?B?MmFGWUJkYm1Ga29IeVV1VGQ0ZHRCOGgzYXdtT1BNa1RONHEvUGp1cmNEQ1l0?=
 =?utf-8?B?NFVsVGltVzZ4Mjg4eTNGaUNHbllTTFh5SExUODdLSzF5MEZHdEdjYnZsOEpq?=
 =?utf-8?B?NDFFdHFqdEFXelNBYXYvQ3NLMnZ1YWJYbXJQTmRicEI5UnUwM3F5RmZxUjZk?=
 =?utf-8?B?NU8rSzRmSVJDUFJndzg2M3pJWlhBeERzMXJGMy9qN2lxL0tJSHpwMUsvRVpp?=
 =?utf-8?B?QmNCVlZqTndoSFR1c0JadGU5TjlRd2MyVlNMd1Via09GNHBhUTJieXl2UlZU?=
 =?utf-8?B?cmtrM1E2WEhCK1EzcVNtbGVQN0hVU2Jhd3hGSU9pYXIwZldIU2pQNFEwNXRu?=
 =?utf-8?B?TUQ3MFM4UDRMSXgyaHBnLy91TWh4MWNjcStsVmlldU9GMFhEdmhHMDR4YVRB?=
 =?utf-8?B?ZWRlc1dEMGRKckpEOGZIQ3RFQ01wZzJrSmZPTzgyRjh1Q25BTjJGU2RyaWs1?=
 =?utf-8?B?Rjl4R2R3eHdKY3ZkN1lpR3Q2elc2UHQyaVZXSXE0ZWVYZmh0dkZJWDJiWnJy?=
 =?utf-8?B?eWt0b3FOeVp0RDJBK2dZMHpKbW5hWjVVVzVGNVZiVmdZSGoyRmRUV2V2cERx?=
 =?utf-8?Q?Nce6WxoaHbc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR03MB5371.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmlXUjhZU3N6VWhoK2JWNks2akhVeVpQZGJlVi9FRCtFbGJtRkFUM2hoVmZY?=
 =?utf-8?B?UVlQT25RUTBxd2c0aVkzb3VOc2xWQ1BoaEFUNlF5dGppUnIvNCtoTzBJMzk4?=
 =?utf-8?B?ZzNzSS9WK1dEVVNQKzZqT3Q2aFo4VTFUY1VXUGgwQkU1blZ0d1RSSzJaVm5D?=
 =?utf-8?B?WXJRVW12MFBkeEpLeXpKL3ZVMzBCNTlXRTNPa0w0QkJYRkhQcjZScXFGUE4v?=
 =?utf-8?B?cldZMFZMQ09QZHlUc1ZjTkNZUVh0eG5CMXlYa2J2ZzUxVWdWVVZyNm5mNHZl?=
 =?utf-8?B?NVhzR0k2U01iTWVLckxFRUw5RXdXM3l4OVpna0g4UDVORzgwLy81WDk1c3V5?=
 =?utf-8?B?QWdLZnE1M0J5KzM0RXRYNys5ZXZYY2pLanF0WFpscG50R3Y3cUI3RUtsamJ1?=
 =?utf-8?B?ZmdBU0xZaFN2SFBoanVKaUNLcGdlbG5pQThSdWNSUmcvMUxRbms3OS81MHhx?=
 =?utf-8?B?VW9aa2U0Z1J0L3lpaEYwYy9UdlplYnM4K1hza3Vtb05mS2tWbUgxekY5SXUx?=
 =?utf-8?B?ZForQ24rYzRKUFhBeFZyRlpGNWNqQnhiWExiOXJadFNMcmdubC9SR3RDUVBK?=
 =?utf-8?B?a0l0K01xZ2JmQ0lSKytlQWNWVi9aZktQVWxpWVpQYUZXcUZ2Q0VRekxBVWV2?=
 =?utf-8?B?clR5Tm1LcWVlTkJvb3QxOGJYTUdreHlpMmNkSGJDUjJQaXNrTXdWb1ZYbXVE?=
 =?utf-8?B?RUQyUWpuaDRSUE13K3Z2K253R0FXNVkvS3FNYU45eHNKeWJGdmdoVElXb1ZZ?=
 =?utf-8?B?bmg2eUZkMzk0MCthaXhRSGtGN0NmWVBtLzk0cEF1SHlZY0FZek96SUxlVFBU?=
 =?utf-8?B?RlFrUHlJckNUMko2b3NlbCtPcGtNblJ6enhMenN5cVJ2cGtYYkhadkcrQ3pw?=
 =?utf-8?B?VE9pVDlaT1JIb25qbjhuN05oNzJqL2RpbEhkWWsvbWRqRmZ6R2kva2xwaUVY?=
 =?utf-8?B?ZWQzU0ZZZ3QwOE9hb1VhM2RLQTZsY1RZQzYyaUNmYVdYQXZVZVV1SnJlK2xL?=
 =?utf-8?B?WUw4SGMvT0NhTDRSQm5yLys0N3UrWlJ0OG1uTXV3NEZHdldOM3F6d3FVaEtQ?=
 =?utf-8?B?ZzUrb1ZHVm56ZmRYSkExUEppSGpGWDZXOUkzdjFKUlVKNnFNdTI4MlpiTXpX?=
 =?utf-8?B?TENjZVkzajM0ZFBTT0lNTXRLZlVXdzhJU0RjNjd2VmdJVnpHelEzSWRhSFp3?=
 =?utf-8?B?T3p6TjRsb3E5b24vazd6QVovQ2xwKzlwcUlwRUlBVDd4UXdjbUZoVkhaQXpW?=
 =?utf-8?B?dVdFVkxiNmJqTmhZUmF6a21QMjRaYWh1T3FDVkxDdURBdnp2UUJRNGxZaWty?=
 =?utf-8?B?aDNjVEtlaU9HNGFud3N5VWZMZlY3cGdpaEp6WWM5bUdxK0ZMNFZTMG5lOHBs?=
 =?utf-8?B?SktZUDk2Q1pKQ0RMWng0dFoza0VKeWd2dkhJVG5BVUdZdVNLeUpDbEQ5eWsz?=
 =?utf-8?B?NDhadERaNjA2QjI4UFVydUxqVDhROWNSWlkrZE85dTh5UktSRjNPY3VWTU1V?=
 =?utf-8?B?KytwTG8xaitwQXJBR2crSU5wKzJGc1BleG9JRXhvdkxrRUdYb05DVTh0b1No?=
 =?utf-8?B?M0ZLSTVvVEM4MHl2WXYyN1JGMGhvS3crTVZLZ1FndTZRc2RwUlB5MTZ1U1Yz?=
 =?utf-8?B?NnhmR2RSL0QyL3FUS2Y2eElEemwrMFJ6TGxQTUZTT1ZWR3FJU0E1SkU3VmtI?=
 =?utf-8?B?dWFsOWVQdUhWaHFOYW0vR3lBRWkwMVZqYitheUI3dTluMm5DRURMaTE4ZGwv?=
 =?utf-8?B?cVlFNWNZdXJZaHhxeGtRQ3crcjNxYXB6V0dZb2hjMHhRbWsxcDIySGFKVk5q?=
 =?utf-8?B?eStSdzlmOXl6SUFlWjNBVzg2YW1wMzRrbmZBNHBtK3d2T3JDUFFhWDNKYnVV?=
 =?utf-8?B?WmV5Wmt4SzRuMXVVL3ovRFNsOWZPc3RiODFDdHcvdElGVi9oYXVoVXJGUnp1?=
 =?utf-8?B?NjY4Rlh4TEdJSHJBQmM0WVlYVzQ2bFNhMkJKMklQTmZGQTJlVytIak5ybkxu?=
 =?utf-8?B?MXNoV1U0U1lqVXlkdm1Oc0ZtdzYwWkRNMGtTaytUZTZXVVd1b3Jka2tXSHE5?=
 =?utf-8?B?Yko4UWhxU3JaSmtObWw2eVdYUHRONkJ1QytPdlhKT2Qvb2lHS1RxeUNpSWZz?=
 =?utf-8?B?RmJGYjYrbkxIcXIrZHBKekNUZEpGVUlEMEw1NjZhVlErbG90OXcrV2I4bUxD?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab416b2d-9a70-47de-b973-08ddf65a0b7c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5371.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 02:21:16.0139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pAEAtQApg+J7v/LiIuuw/ksaPVnVJARbxFYtAFft9nC0klMFFhszOXwY/rxXxZVGFfHHd9pTGHS1GIduHRNfnOrUb+uq49oFCVsKb/jeyI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5999
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2] net: stmmac: est: Drop frames
 causing HLBS error
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

SGkgSmFrdWIsCgpUaGFua3MgZm9yIHJldmlld2luZyB0aGUgcGF0Y2guCgpPbiA5LzE4LzIwMjUg
NDowMyBBTSwgSmFrdWIgS2ljaW5za2kgd3JvdGU6Cj4gT24gTW9uLCAxNSBTZXAgMjAyNSAxNjoy
MjoxNCArMDgwMCBSb2hhbiBHIFRob21hcyB2aWEgQjQgUmVsYXkgd3JvdGU6Cj4+IEZyb206IFJv
aGFuIEcgVGhvbWFzIDxyb2hhbi5nLnRob21hc0BhbHRlcmEuY29tPgo+Pgo+PiBEcm9wIHRob3Nl
IGZyYW1lcyBjYXVzaW5nIEhMQlMgZXJyb3IgdG8gYXZvaWQgSExCUyBpbnRlcnJ1cHQKPj4gZmxv
b2RpbmcgYW5kIG5ldGRldiB3YXRjaGRvZyB0aW1lb3V0cyBkdWUgdG8gYmxvY2tlZCBwYWNrZXRz
Lgo+PiBBbHNvIGFkZCBITEJTIGZyYW1lIGRyb3BzIHRvIHRhcHJpbyBzdGF0cy4KPiAKPiBJIHRo
aW5rIHRoZXNlIHNob3VsZCBiZSB0d28gc2VwYXJhdGUgY29tbWl0cy4KClN1cmUsIEkgd2lsbCBk
byBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPiAKPiBBbHNvIGFyZSB0aGUgSExCUyBhbmQgREZCUyBh
Y3JvbnltcyBvYnZpb3VzIHRvIGV2ZXJ5b25lIHdobyB3b3Jrcwo+IG9uIFRTTj8KCkV2ZW4gdGhv
dWdoIHRoZSB0ZXJtIEhlYWQtT2YtTGluZSBCbG9ja2luZyBpcyBvYnZpb3VzLCB0aGUgYWNyb255
bXMgSExCUwphbmQgREZCUyBhcmUgZnJvbSB0aGUgZHdtYWMgYW5kIGR3eGdtYWMgZGF0YWJvb2tz
LgoKSExCUyA9PiBIZWFkLU9mLUxpbmUgQmxvY2tpbmcgZHVlIHRvIFNjaGVkdWxpbmcKREZCUyA9
PiBEcm9wIEZyYW1lcyBjYXVzaW5nIFNjaGVkdWxpbmcgRXJyb3IKCknigJlsbCBleHBhbmQgdGhl
c2UgYWNyb255bXMgaW4gdGhlIG5leHQgdmVyc2lvbiBmb3IgY2xhcml0eS4KCkJlc3QgUmVnYXJk
cywKUm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
