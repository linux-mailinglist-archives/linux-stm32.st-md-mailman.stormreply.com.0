Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHdNIYZOcmnpfAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:21:26 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2758669CAA
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:21:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E15FBC8F26B;
	Thu, 22 Jan 2026 16:21:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51A2CC8F26A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 16:21:25 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60MGKPoc1518644; Thu, 22 Jan 2026 17:21:07 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013068.outbound.protection.outlook.com [52.101.72.68])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4buh90ssse-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 22 Jan 2026 17:21:07 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTju8DMGPkieheoRmRLwldznFHbGKriAT3pkY6/q6kEiZnzZ/NYYW58kpmtIBl0NFVgiHLIJhJSCuLrP+7lblKJnv/JWBbqG9ike+mnQy1lxZ1vHeplj5O4vd5T7OCiIPlwKyrtstHL5HcCag4Sk5QEv3EgavdKJKTKPd5DIts1n0l+T4f+Lim7azB4fn7l7MHwg39JaF7mZLEOqS03Aws8WNvS8P4PyMRNTxNe/82VvZcu//DkYhiwviy8nQmWDxYcsj/+3r5UPKeWK6WaZ8O+wZHHG4BMFKiEEY4nmcnrSmLy3yV4sJNdAzt1EQkgPEOlQXdclPaOtilbXtIdc9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHqeqowr6oP0AigY5SnPMenINrDk1GkoRAg0SCMO7jA=;
 b=o8DTn1ENyZrzjGpJ1/mrM75+WPAHfSDdwf2ff/aUZehUGbR+NnE/HF/BWzp+0dW8/gJlE/iS4q5Q/XabZpVbzlwA+t9+8V0YL6gIoILFAAkk4KlygKIeJ6SRtGDhiVmrPWVRO7Gpban+yZS4Zpwm/nKUTP0yQmvSbDMYJoWhFciPyftr6RrdHSXHed2CsM7BfE9vwnupA/oRuLJdN2g7+FCz7ck4uzBXikmmBPHe3g8ofd8uLft2GIeVQnXwX3zdfMirW0j9DWe4bNW+IJlQbj2hHbPHUQ5BU/E5bqnqoRh87Gp0+bx/l7OU4Y8ECYLDtTyJDdwaWEgR2sBux7XaKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHqeqowr6oP0AigY5SnPMenINrDk1GkoRAg0SCMO7jA=;
 b=hJuamwKzsa2Kpk0y0nXvziMOMlM18OYsTRjmKVqoVI5CWk7SZGmCd2N9Eer/ExdFtsm6WAUKKwBNcY94tHPp66rshmhrWCCX1dafzNBGHlU1ufj8XIRFMUh0fCH2ExkhCfLtH4zQRCqrTeh686OgiYqRUKM2MY25wkmZqwdGn6IwxkRyd9gTJ1kbhUr5TqJhXNGrJPIKUGfMgzd/fI+et8i5AAl8DKGiSqSOdPsJMsvFBLSunZMegUx/IY4WWXO8bN/C0snzFlL+6/yIuG4w4PA6PHCf89ppewk1QL83kXvsH+rfBxSMsNHMoHnHIyhfXdCC/6PYdV6lrhtk8nluiQ==
Received: from DUZPR01CA0140.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::23) by VI0PR10MB8716.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:213::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 16:21:05 +0000
Received: from DB5PEPF00014B9B.eurprd02.prod.outlook.com
 (2603:10a6:10:4bd:cafe::e) by DUZPR01CA0140.outlook.office365.com
 (2603:10a6:10:4bd::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:21:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB5PEPF00014B9B.mail.protection.outlook.com (10.167.8.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:21:04 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:22:24 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:21:03 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:22 +0100
MIME-Version: 1.0
Message-ID: <20260122-debug_bus-v4-9-28f0f2a25f2c@foss.st.com>
References: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
In-Reply-To: <20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
 <legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, <jens.wiklander@linaro.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B9B:EE_|VI0PR10MB8716:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6d8d05-d282-44fd-22bc-08de59d23d92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?amxhV1RVWEF2TUFVZW9ZNzNpV0NhZDVoakc2U0F0WUlZWmZXc3J0UUlPL1VX?=
 =?utf-8?B?czR2YURIT2x3WjRwRXZaYVlrb1A5VlU4T20zZVFta0JDKy94ak04bm5iMjYr?=
 =?utf-8?B?dm1ZaFpQbzBheUExcWxRYXJxWHNWaklROWVDVGNnNWpWRGJNTnN3SC9OMFVH?=
 =?utf-8?B?eW94ZU9VRy85TzM4MWc5QWpqNlBLOHlwK0FTd1dMWFJlZGpDeEx0Vm1XdHBE?=
 =?utf-8?B?eEdvd3V3NUpvanErMmZJanhzVmZKNExXQmZHOXpsdjJ3WUkyQUZpbUFualJL?=
 =?utf-8?B?SXNKNFZaNml0REFkcE4vendMeWpjUmV3ZEVvVnlXQTRvMmYzNFRNbjY3Vzhu?=
 =?utf-8?B?NElFZXdhYUdnSzdwekRGeWhlblZPVm5wdDdjVkp1YlMwSnRSOWRvRmFLR0Q4?=
 =?utf-8?B?d0tvMWIrTHRCSEJoTE1ZWVg4M0ZodEorT3o4RnZ5SXBQMVVmb054NlIvN01B?=
 =?utf-8?B?RENlNStTMkxudjRrYSt1R0VUT2c3cnh5anZFZXNuUzl6Z1l4UjduUTZra082?=
 =?utf-8?B?d1lrY0xNRFp5RG0wdURaY3hpS2hneS8xVHIvVFovdlRnMnl3STltVlFNUDNH?=
 =?utf-8?B?VTBPVENHenFxR2dBSm9iZVVmTVVNRDd3bDlMempZUEN6Qk9DN3dtMDU4NjBz?=
 =?utf-8?B?aXBQVExqaWppa0toM2MvS3pydzBQVm5idWllKzRiakcxMklMbzJuZzRmLzZD?=
 =?utf-8?B?a20zV2VpN05jQTZWSzJ0ZFZDNXZ0ZDVIMFA0M1FOclJQU1g3OHAzSFJoRjJK?=
 =?utf-8?B?Rkt1VGJsTmgxVlNDNjJBVi9QNFRrZzFCY0lrdzEycStZZ1lBYXdTTE5QQlpV?=
 =?utf-8?B?a0dDckU0RzViNWxzamxJZERKejgzWGdUN2tEa0hKQVJMODlkWGNPNXVtUTJW?=
 =?utf-8?B?Rk5zNDJPdkhwK0laYlBsN3I3cGZpZUU1WTlpL0xrZ1pvM1FKUm1XVlU4Vkdm?=
 =?utf-8?B?bnc0c0tYMUJIaTZPbEd3TGo5ditMZXhEZVhUYlM5QVM3MTlKbms3K25JU0pm?=
 =?utf-8?B?RlpabVVPcGhDQmtHT3cxeGdmQU82STZJeUFvTXNwK3V6SWQ3M1JBV3oyS0Q2?=
 =?utf-8?B?MVpRdU1pNHJGc0pJNWpEZW9TV0dJd3AybjN4NXI2NkhCdEh4VmFsWE84bDkw?=
 =?utf-8?B?Z20zODAyQTR2OE5Sdm96NG9ldkpoSVMvYlFaWkRMb09HWTljbm81SlQ5cE9E?=
 =?utf-8?B?UEFUeHE4OU1pMkRQNjRkeCtuTVYvR29OeHl0SmJ6NTBaOTYvbVFPQ2RyYlRP?=
 =?utf-8?B?YlZvRk5QNmN3WC9QWDJFOVZHcjNQTmFudWtRVmpkQ29yYkJvZy9wY0ZPSzNn?=
 =?utf-8?B?ODhvVGQ2MHRLN01UazcxMk80a1V1TDBjQVN3Z01nbGxGNXRmSzJpUDNqeXVN?=
 =?utf-8?B?c25WT3RJNnBqZDhMV1gyTFY4cnM5a21mRXhqWmZNTTZrUlZUKzNBbE91dzdF?=
 =?utf-8?B?UVBmcnlGQk12a1pLMGFaMkhKOVh3WXZZcFZ6cng0dDRkdTAyR2xDYjRXU01Q?=
 =?utf-8?B?R3R3MlFMRDlQNE94NkRPbjR4cUtRZm1yVWtZZjF2bzdXNlArdmFBSTRSbE9V?=
 =?utf-8?B?R1lqVHhlekQ0YXlFNUtqYjlSTXNaMXRuOUtrOHl2V0ZFdFNqNTVXRXpEaDhZ?=
 =?utf-8?B?Nk5QRUhzSjVrNUhXQWFIM3RnbHZhUVpCcXdxVzZmcSs5OUVnU2lqalc5TGtu?=
 =?utf-8?B?SzJJRlYraS9lT2dSU3NuM0FpUFRiN3lQMDVRS20rUHJncEVMTWJENXFiYTlB?=
 =?utf-8?B?Q1UvLytHbldRMEVBbElydmVzQnNBMVIrZjNWRC9XNk9LdTlCNWtCNlYycFRM?=
 =?utf-8?B?MkZlN202MzVvNEFhdUdza1ZIVFYxVEZRTUljRE1QV3A3RXdCQXdDeCtCaXFW?=
 =?utf-8?B?UnlrdTVTdis3alJhYkVlN0sreDdXbHorRVV5TWNGYXY0V084VEYzTytVaGdz?=
 =?utf-8?B?bUkrckVzbW8ybG82c1N3akZvSGxLYVlCNFUrSzlrcnB3THNpVC9OdkMwb0FM?=
 =?utf-8?B?bS9pUE8rd0pWVXF3K1hGdkd4K0Nzc21GZGpkSWc5ZStlVmEzS3NIblpibWNw?=
 =?utf-8?B?eWl0QUNYS3djaS9pUGlPNnJ2Wi9BSHU3U2F1aFpsYjcyZTg3OEgwNXc5bDho?=
 =?utf-8?B?NlhaMFAzUHdtRTBsNm9TcjB3MXFHdzBZNkNrNXBxTm9SVmlrTHZlR0VsYUV2?=
 =?utf-8?B?SE1QY1JwcE42M1VlU3ZTSGxYd0plUDJJZUtVbzJaV0FaMnplU2lPZUh5dGpD?=
 =?utf-8?Q?HC57YVhUab6mLBUpq565z9jNPQkpLdtARzlLmRPHLY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:21:04.3017 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6d8d05-d282-44fd-22bc-08de59d23d92
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B9B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8716
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX7R/Y8NtwL793
 GrohaPy/+eUE3cgEcioc2vWXEmw+cqhcbFlxuBlX/Xpndqwk8J5xzHGgzrULZabUAm2y3IluntP
 X76H3zqpMdP+XD9JVU5TMDihjRH7bEfy0nfZhqosXemjMh064HeCWztMrNP+oknvWlq3EExfLba
 c5gbrYFqjr3G6EUn2Dc38AcMH6I6ZOJ7/eHpO0Pg94NIQtWz4/FvL93vZ8oQp3YBKDbQrsoZ2oz
 8ROJhSlTqX3ybQqvVoI4OL/VlySMhhq7ICHvk8RT2jjk4i6m/Atm/6WK6VF50hOST3kfZ2k2FsE
 MG+Jy53iKg8fgFgYAHWmp6is8qvoB7uxB/w/zq9bjI4eXS1jSY5xGGTpihlmTLOnKvTM+Vgxeao
 MWg9PvTXPUoRVgjzuSgn1LYs2uOW2swMSh9zTvxJOMo+pjw1t+xie8jXu2V60j/io2HtoFmBBPx
 2qIwr4VcilaTqE2z4pQ==
X-Proofpoint-ORIG-GUID: MWoum8iObQrhZ9EHfaogqn2orReZcqFF
X-Authority-Analysis: v=2.4 cv=GbEaXAXL c=1 sm=1 tr=0 ts=69724e73 cx=c_pps
 a=KOiI8WV4eRqHkUZxW/2pzg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=6OkPYWvNmkp-oGry5mkA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: MWoum8iObQrhZ9EHfaogqn2orReZcqFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 09/12] arm: dts: stm32: enable CoreSight on
 stm32mp15xx-dkx boards
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jens.wiklander@linaro.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2758669CAA
X-Rspamd-Action: no action

Enable CoreSight peripherals on the stm32mp15xx-dkx boards. All boards
including this file are embedding a dual core SoC so this change is
applicable.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index fe2ab07ea4a8..c91204476161 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -140,6 +140,42 @@ &crc1 {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_cti_cpu1 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_etm1 {
+	status = "okay";
+};
+
+&cs_funnel {
+	status = "okay";
+};
+
+&cs_stm {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
