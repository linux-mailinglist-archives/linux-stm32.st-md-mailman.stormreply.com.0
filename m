Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFiZMKROcmnpfAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:21:56 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDE669CFB
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:21:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3436DC8F26B;
	Thu, 22 Jan 2026 16:21:56 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DAB65C8F26A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 16:21:54 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60MGK6KA261015; Thu, 22 Jan 2026 17:21:43 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011029.outbound.protection.outlook.com
 [40.107.130.29])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bumsf0q6h-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 22 Jan 2026 17:21:43 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iisEhdCg4gJNg2O2blNM2EyYp1azFAfckeCbPnD9xVMfft0UfgX1EF9GF2zGZgPtoqzDKQmahA91MFRYsTJKi1HEheT9EkxFBJvit/rtmsoTOfaxIcBR4Fo5vz75s0XVkGX9WLtmitzLsSiS4lz0vtt63HpKZVQA8u5n52mPwipHY9tQ2hPSD8gUbMLnleZWmysQ+nXVKP1gvzhQ5CDcS9izA46+MYepSzTl/x9zowKkp2H9aBVkZii2tq/EsEFoEum2BWxQgQFX3A946uSGY+dmeyer9c544obE1uoSyrc2LMkT+ZmP9J2hfvhC5RrbWNvupM4dYSyH0XPwNMwBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFR9s3knidTh7f75ywsXqW9oZcytAjSEBTQf3YUrRKY=;
 b=jysXd4YIc3RrxfpISGvx6S5YiGaXypQUVivrkj6XPiWO69cGahHigyXzkN11oaFeoo62Kn9GTCG+d7T4ESQAoVFpYnRpLiJ0624zBOhCDnSfU5Oq/EQfMXaJuWQTBpyuS0IRCDAJ3aPevXympIDS8JWsbCiumoQcREa7y0eEiBukoaXRRaFeR+Q4mIbVSCuYjAG4Pwtnqg1/0UrDrrnK7LUrusJwdANXAL+6fwrqI8xFW46LxBR0lk4fMiG0kPfG2wK3OkWunDb6ey89qc/Ea2vtZ4YSei+HraF29MC0GAtXJG7P6K/0YEla4TyfusvyYKAILZi3BDw/5hQ/olecEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFR9s3knidTh7f75ywsXqW9oZcytAjSEBTQf3YUrRKY=;
 b=gAZMZaF+d7/S7tuM7yOFUL6e0chKLm4Gv3vyIMklNybZu1r6kKVV3Pc9uwUDUMCxDibrk1OP6XyepXOOoPsJ4zjJbU9yal2jKYxjBCG7M8o5upiee6diNBshQ/ZhWp2z3Ozi0GjIFY38geePUGlT4U94zaSvLvA9betbCSjD3Pqpb9bSDb03mBAj93ybdX7WjMsCcHyny5lj1vc+N5yeUcRr+VyKUD9/f0GHx3ecJxTWH/duK5ZFo0fKxaxNT2qJyqTK+f2g4zYchGocMgR3/SycBMN1VIsiP5ZBgTY9zToWv7PXuvz0/X0A19RysPjKbDK8vqk6VneTU8S5vzHa/g==
Received: from DB7PR05CA0018.eurprd05.prod.outlook.com (2603:10a6:10:36::31)
 by AS1PR10MB7960.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:472::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 16:21:37 +0000
Received: from DU6PEPF00009529.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::cf) by DB7PR05CA0018.outlook.office365.com
 (2603:10a6:10:36::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009529.mail.protection.outlook.com (10.167.8.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:21:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:23:07 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:21:35 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:25 +0100
MIME-Version: 1.0
Message-ID: <20260122-debug_bus-v4-12-28f0f2a25f2c@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009529:EE_|AS1PR10MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f7be6e8-8bd7-49e3-d9c2-08de59d250c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REYzc0REaEJRZUt6QXJJUkVZbnloOW5MNWxnRHIxdnlpUlBWTU91ZG9VM01G?=
 =?utf-8?B?ZXNIZ0tCQ1FGc3lZT0RWQ0JKZ0M4M2xEcGE1TDRqbUZqb291WjhQcDhLMTZz?=
 =?utf-8?B?Yy9XTEg4MFhxTkZxYnBWRW44RVUvWmdRU2hHUEV4ZHp0bGtMT25aWW5UUWty?=
 =?utf-8?B?NThYMDloekFGaWRMWVI4SXF4bTZ5Q2E0bE1hdnZHY0xuNlpiTVljT3ZGcC9T?=
 =?utf-8?B?YWZpd2JoSFNTd0VMUUZXOVlOV094R1FlMEFaZWxzTnhCbHE5SFBsbXFCSlBW?=
 =?utf-8?B?em9vUmtVUEhSRUkvM2lQVmZBTEZSZGpsT3A1Z0dsSHMzUkJSNVpRRlJYeUFV?=
 =?utf-8?B?akF3cTJDYjhqcjJobEdjYzEzUGswTThXR1BRaG0yRFB0amdNeWdLSlQ2dno4?=
 =?utf-8?B?Wm9vb04yQ0tJbG8vYzlVM3d2WnZtZm5iUXJSTHRoVGI0UXJadVV5QVN2cVE0?=
 =?utf-8?B?SHdCbDJYUGNZU0VTK014TVpQZ1Uvd3U1emVFWjgxRHJMY2IwZXRuZXI5T012?=
 =?utf-8?B?Z0F0VXhyeXhhM2RtRjdqWGorYS9kYnViYW9KOEJ5NzJaSHlCdW85Sy9RMzIw?=
 =?utf-8?B?OER5emFheVFTNU5taWpmM0FIU21DQktuWnFzeG1zbmtXQkNROVluY3Y4WG9S?=
 =?utf-8?B?dzR1NzhIZHBMcHorajN5M21taG54K29aRUIySWxaVzVnRytHWHo1RE5YeExx?=
 =?utf-8?B?Y1d0WSs4VlhSNVQwRXBwTk1Kc3JJbENuYmlIb1ljejM2TjRpV0wzd01zYUll?=
 =?utf-8?B?c1hGM0NhQmRtS1RKc3kwRnExSG1WZjFHSExkTVB2MC9Yd3J6bnJOMjZVOW01?=
 =?utf-8?B?b1JIRGZkVmJtSXgvbmFjaWJjb1hHSGVyZ2ZHcFNSVW9Id1JIak13MUExYmxz?=
 =?utf-8?B?M3A0UUFWcjczdnNDb3hTU3R4UlVCNUhWc3pMVlZMMXhJSWVLa1ZGQUpIRmtu?=
 =?utf-8?B?dlI3YUh4WHdvTFZyUFpzUVdHMXZKalFjZkhscFowRXd5V1dhR3JTZGhEd0sw?=
 =?utf-8?B?UjhxZkJ5TDU5dHZuU05XZURHTXRJLzZRZlM2bVZmOEJhSnp0QUJaVEU2eVRh?=
 =?utf-8?B?SGV2RTRUMVlLa3RyWDc3N2paenA5U28yeWMvNmoxdWdXMjcvNng1eWFKQUY1?=
 =?utf-8?B?Si9wRGkvbkJ3K3lzQTl2MkV6bHFTbHIwWHpBRlFpNGNkVHhnbUUwUW9BVlNv?=
 =?utf-8?B?OW9UQW9wTmFkNTd1WnlNdVVFcDJUbHprQys2R0s4Y2NSc2dNdUVFamNqS0kr?=
 =?utf-8?B?dGFGUGVSTldaaDVzb0txMnF5Q1N3d1RvZHNmVzNCUTJRUm0zc1hnT3U0aEhO?=
 =?utf-8?B?cFRKWnV1Mzd3QjlvZSs5d2JxbE1UaHF4cE54dDJsYVo4TkN6MVFqUG9sMXJo?=
 =?utf-8?B?ejhWRzZpbTNDb3d1M3h3cktvUEQ3YnBwcG9WNVc1YVJiYkZNZm5TN3djMURw?=
 =?utf-8?B?ZEhvdUlxL1J1UzY4VGFmMjZyMzRBNzFGQ2xia21nZDNZRHpNN095S3pMWjB0?=
 =?utf-8?B?dFZkOWJ6TlhEdFpBeTdIcG9OdWJ0dVA4UFM5MENQSFJpcUhROGZjQjZHSzlv?=
 =?utf-8?B?d0pHTTJUTU8wMFBEN3lXNUpjZTZUcFcxbU5aSUliYTRxM1ZoeVU0ajR3L3hC?=
 =?utf-8?B?UmVjVGpQTHBKUFlKTXZFd2JzY3FhUUh0VnA2NFFzczE3bkJBeFBoem1OeDdn?=
 =?utf-8?B?eDVhMTQ5UUM1Wk1HVllNV0JYbHR2Z0Q2dUlQVENWTm9iYVJiZERtd0VLWjl2?=
 =?utf-8?B?ZlFlUURPcklhb1BUMFgxNEVoNXJLQ2xaZjBIcFNNbnU1ZWVFT3pRSkgzaW9S?=
 =?utf-8?B?bkRGL21FZkZzSk1qVlgyUGNzcHlIQVRhQTdPMzh4Y3Zyd2c4dE5uQUFEOWlS?=
 =?utf-8?B?MEdxSkZwL3J0K1dFNEtuYmptS013bDdyOFJMNFloSERKQ2JWZjhGeXpnWGkz?=
 =?utf-8?B?YzJ3clI2bVB4Nzd3UjBrOVR6OVRvMll5aHRZSW1BZTk5R25WODRGN2J3U05K?=
 =?utf-8?B?OVpVdjZqNUlVUkhkNm1jQ3pjcUVubFJ4SWN0bjBLS1JSSjJEWGx1WWwxNHBQ?=
 =?utf-8?B?czJOOEMrQUxVTUhoc2N1Yk5HV3hxeGxEekVPRm5kcXQ1WHdhd1N2cnI2bUxW?=
 =?utf-8?B?MFlreHZGWFN4VDdBZDRGT1JKTmlnU1ZDQTIwaFgwcGRoUkdFR204Ump5dVps?=
 =?utf-8?B?Ukx5V2lxYjdjZFBkdmpYeGE0MlFjaERndE9kWStnc2VROHNOczNlZUZKRytp?=
 =?utf-8?Q?IEWX+LJozmosb5ack9rNiwq7DTjYp0WehGkAzgPS00=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:21:36.5343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f7be6e8-8bd7-49e3-d9c2-08de59d250c7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009529.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB7960
X-Proofpoint-ORIG-GUID: 5uG_dMMXxXPqYTWqTQj62hlQK2M_9Qeo
X-Proofpoint-GUID: 5uG_dMMXxXPqYTWqTQj62hlQK2M_9Qeo
X-Authority-Analysis: v=2.4 cv=HbUZjyE8 c=1 sm=1 tr=0 ts=69724e97 cx=c_pps
 a=FCXGMy8pXViI/SoB7+PbHw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=prQzqxCaf5vTWlbXWNoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX3ZaSgkj6r7HH
 W2TmN4j/Bia5aDOYpfuSCnZfA/HgtY5jl0ZT13sMlRYUDyInJkm8bZPo5mY0iKg+kFJsiwbwSV4
 HED4lN8LS1//HDe2E2xRFVKzYCrumZTxpwIVqLqM0Xff2hDvSLZIoDr7ROeFM7QnenlaJuu/oVb
 Jm3NHVOUBwuKBmEMG5PkGzA9Gmmmd0kGgFTiU+KbkAyHU0p9DMK+UtgKawTTP1dRz2v9nE2JjgV
 dbEP/liiTTCRia0XQulscT4aTOWxUfUVwUYPaGPoEvrik1Hy/MRFTdk0lbdNWajRQT9Mo1EppEP
 VkIK5PBaRAPr8fYj8445Mqa/RUyIG8jm5U4uzLPbk/de9akXSdnwlpC02yrLqTne7Oe31zJzfzo
 hcUpLa9k8H33guMs89uMiiCw+JVMb1nxLNEFIuKTxvzKBms9lElH0jx2H+lsUZ+Djx8alCJAi4m
 JIkJ2xCnSTvYxQAIwBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0
 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 12/12] pinctrl: stm32: add firewall checks
 before probing the HDP driver
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@linaro.org,m:james.clark@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:leo.yan@linux.dev,m:legoffic.clement@gmail.com,m:linusw@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jens.wiklander@linaro.org,m:devicetree@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:legofficclement@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[arm.com,linaro.org,kernel.org,linux.dev,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email];
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
X-Rspamd-Queue-Id: 6BDE669CFB
X-Rspamd-Action: no action

QmVjYXVzZSB0aGUgSERQIHBlcmlwaGVyYWwgYm90aCBkZXBlbmRzIG9uIGRlYnVnIGFuZCBmaXJl
d2FsbApjb25maWd1cmF0aW9uLCB3aGVuIENPTkZJR19TVE0zMl9GSVJFV0FMTCBpcyBwcmVzZW50
LCB1c2UgdGhlCnN0bTMyIGZpcmV3YWxsIGZyYW1ld29yayB0byBiZSBhYmxlIHRvIGNoZWNrIHRo
ZXNlIGNvbmZpZ3VyYXRpb24gYWdhaW5zdAp0aGUgcmVsZXZhbnQgY29udHJvbGxlcnMuCgpTaWdu
ZWQtb2ZmLWJ5OiBHYXRpZW4gQ2hldmFsbGllciA8Z2F0aWVuLmNoZXZhbGxpZXJAZm9zcy5zdC5j
b20+Ci0tLQogZHJpdmVycy9waW5jdHJsL3N0bTMyL3BpbmN0cmwtc3RtMzItaGRwLmMgfCAxNCAr
KysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi1oZHAuYyBiL2RyaXZlcnMv
cGluY3RybC9zdG0zMi9waW5jdHJsLXN0bTMyLWhkcC5jCmluZGV4IDBiMWRmZjAxZTA0Yy4uY2Nl
NDc3ZTg2ZWY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0z
Mi1oZHAuYworKysgYi9kcml2ZXJzL3BpbmN0cmwvc3RtMzIvcGluY3RybC1zdG0zMi1oZHAuYwpA
QCAtNCw2ICs0LDcgQEAKICAqIEF1dGhvcjogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50Lmxl
Z29mZmljQGZvc3Muc3QuY29tPiBmb3IgU1RNaWNyb2VsZWN0cm9uaWNzLgogICovCiAjaW5jbHVk
ZSA8bGludXgvYml0cy5oPgorI2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0zMl9maXJld2FsbF9kZXZp
Y2UuaD4KICNpbmNsdWRlIDxsaW51eC9jbGsuaD4KICNpbmNsdWRlIDxsaW51eC9ncGlvL2RyaXZl
ci5oPgogI2luY2x1ZGUgPGxpbnV4L2dwaW8vZ2VuZXJpYy5oPgpAQCAtNDYsOSArNDcsMTEgQEAg
c3RydWN0IHN0bTMyX2hkcCB7CiAJdm9pZCBfX2lvbWVtICpiYXNlOwogCXN0cnVjdCBjbGsgKmNs
azsKIAlzdHJ1Y3QgcGluY3RybF9kZXYgKnBjdGxfZGV2OworCXN0cnVjdCBzdG0zMl9maXJld2Fs
bCAqZmlyZXdhbGw7CiAJc3RydWN0IGdwaW9fZ2VuZXJpY19jaGlwIGdwaW9fY2hpcDsKIAl1MzIg
bXV4X2NvbmY7CiAJdTMyIGdwb3NldF9jb25mOworCWludCBuYl9maXJld2FsbF9lbnRyaWVzOwog
CWNvbnN0IGNoYXIgKiBjb25zdCAqZnVuY19uYW1lOwogfTsKIApAQCAtNjE1LDYgKzYxOCwxMyBA
QCBzdGF0aWMgaW50IHN0bTMyX2hkcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCQlyZXR1cm4gLUVOT01FTTsKIAloZHAtPmRldiA9IGRldjsKIAorCWlmIChJU19FTkFCTEVE
KENPTkZJR19TVE0zMl9GSVJFV0FMTCkpIHsKKwkJZXJyID0gc3RtMzJfZmlyZXdhbGxfZ2V0X2dy
YW50X2FsbF9hY2Nlc3MoZGV2LCAmaGRwLT5maXJld2FsbCwKKwkJCQkJCQkgICZoZHAtPm5iX2Zp
cmV3YWxsX2VudHJpZXMpOworCQlpZiAoZXJyKQorCQkJcmV0dXJuIGVycjsKKwl9CisKIAlwbGF0
Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBoZHApOwogCiAJaGRwLT5iYXNlID0gZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlKHBkZXYsIDApOwpAQCAtNjcwLDggKzY4MCwxMiBAQCBzdGF0aWMg
aW50IHN0bTMyX2hkcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogc3RhdGlj
IHZvaWQgc3RtMzJfaGRwX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewog
CXN0cnVjdCBzdG0zMl9oZHAgKmhkcCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOworCWlu
dCBpOwogCiAJd3JpdGVsX3JlbGF4ZWQoSERQX0NUUkxfRElTQUJMRSwgaGRwLT5iYXNlICsgSERQ
X0NUUkwpOworCisJZm9yIChpID0gMDsgaSA8IGhkcC0+bmJfZmlyZXdhbGxfZW50cmllczsgaSsr
KQorCQlzdG0zMl9maXJld2FsbF9yZWxlYXNlX2FjY2VzcygmaGRwLT5maXJld2FsbFtpXSk7CiB9
CiAKIHN0YXRpYyBpbnQgc3RtMzJfaGRwX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQoKLS0g
CjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
