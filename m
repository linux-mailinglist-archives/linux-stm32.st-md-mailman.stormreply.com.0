Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E58D862F
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Jun 2024 17:36:52 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44542C6B47E;
	Mon,  3 Jun 2024 15:36:52 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2065.outbound.protection.outlook.com [40.107.8.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A25BC6B444
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Jun 2024 11:31:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVit0okO3sRnLvT+PthRZyTLwDkk/mnPjNCOHtnNPD8rzlYdAb0f6Gy34EWTC4VCrXzepGs8NzsKB+UDUMUawPwoZaz+SQb8sZtW6r/bgGcc865ou6GG0H1FUe/2+JdRAYo4kNZQ/z8UxAobAeTtvEx6kg8kD8wt50LzMiY0w+kcVjLKyPIQwBe9eGmPAMBw5JES5QqCKnVK5YXmsHf0iB/sevhPVi414p7TJwyBCvNNpn185Scwn5sfF0FzoQ1kXFjzDcJygT/6YqzL0+Bdt0S2vdJnYCswb0oUjg4oHsePgys3gAE0kcMIhGSzmX4KfUHe9JysCwrzYE+QM1G3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SdAgPq6ZV83Tx5gHd6WdQuRCPsjJiMdoXHy2u/cU74=;
 b=hpoy2cpFePwbZfqZ2lKFaMdaIPva+WJYKhU/xEnKlBy/MYaLC31u2QZOkiRyiIATE7MMD/kDjRUkbafNdjbRtgkFE7r56ziS9b06qg78BG62wskU0TAwjBzE+I5V9fAW4XjRf12YwA/mYxzN5k2WxmARagZi0uBVHOiHHxIrjWG3AsHaEXKEwgO3dJ0kgfPEVi7BOJYkCiQId+5uxwe2zsvNNhfX02K6br2+w67ZR9JYPhheOP3OMuyuzWPD28nvYGmsksJUcSGRbaQahSHJSSIIC5+QQiObUTW9fpN3SlkTYPo8BHyzuWRKAg968Jy+hINGFp/n+uDEWhWiybXydA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SdAgPq6ZV83Tx5gHd6WdQuRCPsjJiMdoXHy2u/cU74=;
 b=Mw+xBw5tG0JKUqSGcoMUKbrVj3wIWyYq1DXFI4wplHIjK9KJ0zTkG7VV2szuKXL7MPvfiUnh+SB2NsIHLFxk2orp4kQ65pikfj8LeGPGYRtb0EbYCtAPeH8NQUqJvcK3zBmA25Xr33/CRxD3Fsff13uH2pjDRT9gKu1L88hV6Rc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by GV2PR10MB6958.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Mon, 3 Jun
 2024 11:31:03 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%3]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 11:31:03 +0000
Message-ID: <d5ce5037-7b77-42bc-8551-2165b7ed668f@prevas.dk>
Date: Mon, 3 Jun 2024 13:30:57 +0200
User-Agent: Mozilla Thunderbird
To: Christophe Roullier <christophe.roullier@foss.st.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>, Jose Abreu
 <joabreu@synopsys.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Marek Vasut <marex@denx.de>
References: <20240603092757.71902-1-christophe.roullier@foss.st.com>
 <20240603092757.71902-8-christophe.roullier@foss.st.com>
Content-Language: en-US, da
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <20240603092757.71902-8-christophe.roullier@foss.st.com>
X-ClientProxiedBy: MM0P280CA0023.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:a::9)
 To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|GV2PR10MB6958:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d47feb6-1718-4d82-2456-08dc83c0a6b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|376005|7416005|1800799015|921011; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ME0zL0JLN1lWUkxETnkyUVE5bnVoMmNmbFh6U1R2b1FOL21JU1lUVmpXWkZ4?=
 =?utf-8?B?bXZLOHY1ZHltKzExdkpGbXQ4S3VIb0M5VmFpTzBxdWVCM0RZdVB4UDJVZTZT?=
 =?utf-8?B?RDMrR3pUUEhESkJXQzdJZGY2LytpODVHWnBSZyt5V2VRcEllRjRBNTVNRHpF?=
 =?utf-8?B?Z1h2TXd5aUxBalc0Z243UzJOU3Z4dzVpbHJUOWZEeHJVMXBleUlmMjVYenV3?=
 =?utf-8?B?eklrdWZXRmdyZ3BEbGZ1WXN6Tmg1MHdiNjBCQ08rUzNpbCtsVC9VR3JPa0NZ?=
 =?utf-8?B?U0tzcTNheTNrNUE1djM1K1lZUGNYQ0NyMTV1aWZ0NmRhbmxma1owZmIwV25l?=
 =?utf-8?B?MncrcmV0Q1VaMTNHSmFidEFOdzFkT1ZSaFFuakxRcGZEQ2NMMXdxNTY4dnIv?=
 =?utf-8?B?RmxCQnN2N2pDOGVTY1o5NmtOVk1QR3pFeG1EdTlFQlI4MEgwWFY4MjQ4Y0Zj?=
 =?utf-8?B?bVBISk1DUlFwSmptNElCbkFjWG8yZU9MQVgwSTd1ZXYwb0RHRFZwaFMxOGVl?=
 =?utf-8?B?Vk54T0NEdk0yVkFlbGZGblE4Vm1nbmVUVGZYZlJHOEtXVDB3WnRTcTVnWkVG?=
 =?utf-8?B?RXpIM3o1NXhITTZqS3pYS0IxVWxIWXluVjQ1VmxocENXME1SMWNRVHpjcUZE?=
 =?utf-8?B?c0JpY0JhRHlLaU53MlZyUThPWDJ3ZHpuZy9YU0Q2WFdDZGpMdGdkbXo3WmFn?=
 =?utf-8?B?N1ZvTkFVZjhSNFM2cWJLY3BhTThrMSszd1hma1lGODZRTGhsaFhSNEhRQy9I?=
 =?utf-8?B?QTNWUVBIVXFNOTVnYmczbWxFTVhNOCtkeVZCRlZPd1dvRDNDYmI3UkJlUU50?=
 =?utf-8?B?NzlvNHladThSYlhmRThvWE5UNGNBcDVFamVDemV6emJBYVRvV1BTSlVMZEtu?=
 =?utf-8?B?VFNDdjZMMkpsTnExZW83aTJZQkczNjg1cHMxbW5SUi9QZHVQU1NRWFRCd0Jx?=
 =?utf-8?B?U1NqbkhneHM0UHZHY01sU1FSekpXd25va0crMUYyQUNVaDUvb2s1cmozS0hl?=
 =?utf-8?B?UnI4V0ZEaGNOSHF2c3Rmd1VZalZKVldjS1Uva1l0VmIxRFZsc0ZTRkdtT3Z5?=
 =?utf-8?B?VVp4UGNWVFl2WTU3eUhhYisyVlUzMGFvbEI5MFFUSEVieCszU2MzbmlhUlhU?=
 =?utf-8?B?dU0xVDVUNlpGY3dBRzZyeWFFb05RQUgxSWplam1LZFlQTWpwaldoQXByU0xa?=
 =?utf-8?B?dU1sRVlzTGNab3NVVXJuTTF5c2EyK2VCVXVQQmNkZTNwZkR3UE5RVXVjS252?=
 =?utf-8?B?UGtqVkdiZzViY0Zrb3JPRmkyVzNhZE9MTDJVOGVHTTZ3L3FIQy9jRURzSFBC?=
 =?utf-8?B?K0RhUEdyUWVHQngvenJzVm9WZC9DZzBWMzVPaVFEUHNieW5LUkJyR1J4Q1hr?=
 =?utf-8?B?M2dqdXdaY0V3ZVBOOXc5aHBiaSt3VGEyN09aSndPdS8xNi8ySmE1emg2SUlh?=
 =?utf-8?B?MmVGN2lEK21DVm9iVVI2S2ZHdUZ1eGxKbHVCUTBlOTNOdjBhZ3JWL2NvVkZY?=
 =?utf-8?B?TWo0Rk9tbmdSdXlmRS9Xb25YaVVhUjZsem04c29FOVRYTDlmS2t1VTIvVkRZ?=
 =?utf-8?B?L2ozT3ArOU1BQ2lpWWRkKzRpcUxTNUMweDYwWXB4enNmbGoyeHRIa2JBT0d4?=
 =?utf-8?B?VWJsaGgweU4vSXMyb0NIWVhrci90aU8xYnpqVlpENEJxZGFmSitFWVBheVRk?=
 =?utf-8?B?VDVWY3pDbVZIY3BSZUw4Nm1NZ0xKejVXZDJQZmJGYnk2a2MrcDJoeUo0UHRD?=
 =?utf-8?Q?Ebj64oBA7EOObH6unUkMWwlHAuzIEOPoltute8Q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(7416005)(1800799015)(921011); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1BtdmtaaHlqeWUvc0JFUDZCWUR3STl5L1duZHJuMURHVnNvOWU2SG5BSGdJ?=
 =?utf-8?B?OTAyeHlwZkxoVEdoR2RxWEtQbDBmR1RWY2xBbE9NUlZuTjVab3FlaWF6bEx2?=
 =?utf-8?B?VXRMUnJmWnAycS9iblZkL3lheVZQb1ZUZGlRMDZKYUJnQ3A3ZnFGUUVZNDk2?=
 =?utf-8?B?STN5c0QrU2E2OEVxbklZQ2JaUTErNHZvSGZmQlhXR0c0R2c2TnFscXVyQVU4?=
 =?utf-8?B?V2RkSkN5bWwxYnFqc2xaQzVhcit2Y0ZibzRqYzBnVS93QWRjMm9RcjZrdmpH?=
 =?utf-8?B?VU10TmlvN09NRDJPL01oYnBxM29vd0F1VVAraUdxVzdhTXBJYWEwc3JOcDRN?=
 =?utf-8?B?WUdBSEZuUjN0cGNpbE9ZQkkvVjkwbWxKWG5YVCt5NEpBNUtLOXV1UldZL3lD?=
 =?utf-8?B?Y3VJRHRBTHAwRm9tRitVNDhvSXp2NmNWZ2c1aVRkcjZsRDlNQktOMnZRaEdY?=
 =?utf-8?B?QjV3U0RMeS9NYVJxUGRJczMyK1VNU2FrQmg2QnVaL2ZPN002d1RKSWRiZEZ1?=
 =?utf-8?B?ZVc2N3JQMkt1cTRpZVU2THc4Yk9pMjZNQzlqblA3OHFCNmlDbzV6UGcyR25j?=
 =?utf-8?B?enBSYTNMKzF0cmFCNm1XZ1BnRDl1Nm1iTWt1NVZJS2loQmlPcWhaR0QrMHlw?=
 =?utf-8?B?SDJKSDVCVHZ6R0JSdks5ZFpBeG9qd01hSWgyMGJMVWwzK3lmUVd4MkwwUGZR?=
 =?utf-8?B?eTVpQ1NxRkdwQnVLenhIRXhyQWViUC9FTXNSVmVmL2l3cDlHZ1kwOExYcExu?=
 =?utf-8?B?a3RhdnJvVmF6cUlKTDcvcHpvNVA1WkkrYzNLNWJObHlQSnNKVkRDeE9CVEtI?=
 =?utf-8?B?NGU0bUJscWZ6Mk1wUWNDMUNIdzNjMzN3OWpUdzVza0xUWVY0b3h5bmpBbHlv?=
 =?utf-8?B?b0FTVENZWlhxNUNwRS9GV1QzVE02VUtDMHpoQmhxejhoSDdSUlhhUU1SalNT?=
 =?utf-8?B?b1pod1p1Q3loYlREdHFBS0pDRnErNGxNdklnY2hseU9rUFNvUzN1QzJDNDZQ?=
 =?utf-8?B?c25CRkl0VFg4TENuUXdBVlJpSnRuOFU0YU93UU5WeGJ0RzZNY1ZSZkVvTnJl?=
 =?utf-8?B?QUFvNEJoSjdodDI2cGVQZTZ3NjJHaG1rZ0lDZlh0aWU4ZkxScWlmSG1DU3Ey?=
 =?utf-8?B?NWJqb2xNaVIrN1pFVTg4TkR5Y05jUXlrYkcyWElvUmphZExVeVl1dVJScWc2?=
 =?utf-8?B?bmZTS2IzTU1PT3FUeENZN2NyMXVTUkZLQ2ErZnF4bEQ2T2pneE1GcWRuOUpE?=
 =?utf-8?B?NTJVeVFFMTNUMXJiYUtMdEJTY2k3ZmJBbXl1dG1hbXRzWDZEaS9sYU84WXN4?=
 =?utf-8?B?aWU5ZlJFa1FQVHQvd2NWbThwdzRwMnp3VVdHOHdTR1dxdlZ3SDAvQ2pzQ1NM?=
 =?utf-8?B?LzZPdEdXdWRlR2l4Tmh2bXpsU1RjdWtBcjVwTlh6c0N2eXYweUplRWd0WTZz?=
 =?utf-8?B?bUtOMDVxc3c4N3hpRjhxRkJEUll5VFFYeEdYa3VISDdRb1lZbEkvUFZ2MFls?=
 =?utf-8?B?ZlZyL05oZktLZVNiQjBESzk5RXhGamorVFpBWTVCVk1PN1V1MnIyOXhLVCtl?=
 =?utf-8?B?Q29vY0Y3MVJsU1dxdnkzZ00yVHBRbXJLNjBMcHIyMW5IMFhjalF2Z1lsNXFW?=
 =?utf-8?B?YkJWYzJRMGxqSEdlSklBVmU3UW5KUVRicXZReUJQS3E2YzBiSTZpaWVNeS9i?=
 =?utf-8?B?N1M2R0xyS3JRYi9wbGk4SlYyVDZkVk1UKzZsOGN4VE5tcGpNOTVMQlgySjFp?=
 =?utf-8?B?OTc1NWFqaE1BNmpNdFVSNE5LWGdFQkFFaThkSEhUVUJEbnkvdUV5dEthTlFZ?=
 =?utf-8?B?MjNSVnc2eDcxSWkxZ092STcvT3VWSXNuTHJMZTY2cGdXb1RaUCtQa01WZzRq?=
 =?utf-8?B?Y0NiY0RpN2F0UTM5c094OUJzUzhTdy91TXhLZ1VpcStkdGZ1d0ZRTjV4d2Rh?=
 =?utf-8?B?b1BUS1JqYkM4QjZ0RnhUV0l4VThhSnBvQUpkdTkxYmhoR2JGeVdOS0puRzVI?=
 =?utf-8?B?cW1RL2lqQ1dyZkc3azZnSjErblFzWEJ2dWxOb0xJd0svT3dnY0d3U0lJUnB4?=
 =?utf-8?B?MllOK1BrTmVlUHAremVvS0tjNFg1RW5hTGRPdUg2UkhMM1RmVXpsbHF0YnVD?=
 =?utf-8?B?ZElRNEdSWVFiQ0tPTWcwWFQvVDdmN3FpMW8wMUVaTlIrUHNpSnI3Zk1peHBM?=
 =?utf-8?B?WHc9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d47feb6-1718-4d82-2456-08dc83c0a6b3
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 11:31:03.4898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZxun+SZYc+x2+XRnMKTHK7hx6vrufb1OvkP6n7XDMenVcxwJ8zRSHD3440ikdLYoErSJNt6IIUx/Ijohi0rEos4IF2aZnBqkCmgdn2jJwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6958
X-Mailman-Approved-At: Mon, 03 Jun 2024 15:36:51 +0000
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 07/11] net: ethernet: stmmac: add
 management of stm32mp13 for stm32
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

On 03/06/2024 11.27, Christophe Roullier wrote:

> @@ -259,13 +268,17 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
>  
>  	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->mac_interface));
>  
> +	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
> +	val <<= ffs(dwmac->mode_mask) - ffs(SYSCFG_MP1_ETH_MASK);
> +
>  	/* Need to update PMCCLRR (clear register) */
> -	regmap_write(dwmac->regmap, reg + SYSCFG_PMCCLRR_OFFSET,
> -		     dwmac->ops->syscfg_eth_mask);
> +	regmap_write(dwmac->regmap, dwmac->ops->syscfg_clr_off,
> +		     dwmac->mode_mask);
>  
>  	/* Update PMCSETR (set register) */
>  	return regmap_update_bits(dwmac->regmap, reg,
> -				 dwmac->ops->syscfg_eth_mask, val);
> +				 dwmac->mode_mask, val);
>  }
>  
>  static int stm32mp1_set_mode(struct plat_stmmacenet_data *plat_dat)

This hunk is broken, and makes the patch not apply:

Applying: net: ethernet: stmmac: add management of stm32mp13 for stm32
error: corrupt patch at line 70

The -259,13 seems correct, and the net lines added by previous hunks is
indeed +9, but this hunk only adds three more lines than it removes, not
four, so the +268,17 should have been +268,16.

Have you manually edited this patch before sending? If so, please don't
do that, it makes people waste a lot of time figuring out what is wrong.

Also, please include a base-id in the cover letter so one knows what it
applies to.

Finally, I think you also need to sign-off on the patches you send
authored by Marek.

Rasmus

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
