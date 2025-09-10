Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 368DFB5133D
	for <lists+linux-stm32@lfdr.de>; Wed, 10 Sep 2025 11:53:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 834D9C36B3C;
	Wed, 10 Sep 2025 09:53:04 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CFDE6C36B0E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 10 Sep 2025 09:53:02 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A9qXJW021684;
 Wed, 10 Sep 2025 11:52:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 3QkxBTDcycrNoF7YyXTaTjPbl0wB31nsfpnHrzz0ubE=; b=NbGfaDhBtMx9jE5r
 M4Qlhq6aNpgsLBxkpurhGZ/6q63HWqElEzLNky2Ad+NQrz+eI04SHIssMnQUyPz6
 tfcD0bOvEIeQF/O0LID8zZnW1sLFHE7xwOaXm8aiKYzbtlUvJ3/UHd051dIrk3ob
 mI/ZWYwZdnMvbNncPVIc2+4PCZ1aZL5VgM8nWX79BkdP3UQmeKP66trLqeUcbfCV
 BBMWLYl7WcX+OL8HcqFnjm0oxOuCQtZqaf7JS+uy8XzGLLdr7MD6sl9j+fUdtHoy
 0tqJYcr2D25CA5y4VHeYw7bW3yUjY/IOm3qzlAPQZZe00y4hrH+9xAs1dRk3t0cs
 lcDOew==
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4934xjgq19-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 10 Sep 2025 11:52:47 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSrO/lKFILnVo5CdN00nIICbGQN9ZFt4Y9DddtSwHi+RkAgctBDjz+Gq4M09hh5Ln5mlw6CrRTnmYSoyrDJQYN2/4oSVXyiK4o5H6I2Ck/BVR9qgPuOEGyWZp/3TLbyDVMSGD3rDe3UODLOiHjA+gK+66bfLjQikYJCi+LRe0l2S2AWEifjwsx7Tdn6ihAssU8aeEjCeivWxjaqI2EgGAlfMM44K0KpREXQOy2rU3MpeLJXT25P9e24UfBB/dzM5MqMkXRGACtfr8nwDHPq9Bw/rPc7n6in7ok3D8ldZNameciTCZnMJQ6qt2/lUS4MlFtUauyHTPxj+bl0V1NLv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3QkxBTDcycrNoF7YyXTaTjPbl0wB31nsfpnHrzz0ubE=;
 b=ytR0BmfAENecZCbG4jknpxIZifvM7d5XlsZxFWaNDjwo+0/ZWQB1L9GmueAQL3L+colUE9RU7H54ghOnXuOFEp+uUboT6oaWA8Vph/AoxZH0WWNIMINiS3WHNEatlvJvTORiLAWqBItRbiSIdbFdT9PX86Yum0+jF78LJgv4tNYplYYP1fltf4XTufFZWbXEqyg7vVNdhZHPuZVkHFlw+cDtvW3i+e8UBOioeMWTWYD0Aj035zS6dW4dR0a4NpfxtPrXyon9cmdOwy3VFPJ14ltAQLUYk/5QVF9ObofvZubVw7uwiC0q51g1Af+DuNvZbNKYlxRIakyqCSYdV8vRnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=stmicroelectronics.onmicrosoft.com;
 s=selector2-stmicroelectronics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3QkxBTDcycrNoF7YyXTaTjPbl0wB31nsfpnHrzz0ubE=;
 b=RKRJdcDU8zDmh9+06/5MRrUFedju9+G5x1gyuEpzPRWysfIIYH0D5lVoP+FDB/YJSvL2Z6CcaSNfj0you0UX4xkg+rHsNwk0LmNeOXtJ4A5avxqqKwme1YS2ApcljFBjRTXlGnYWjMOtjgV69pAsTGdZnydMBQ6MssQYeuRnSTw=
Received: from AS9PR06CA0424.eurprd06.prod.outlook.com (2603:10a6:20b:49e::8)
 by DBAPR10MB4137.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1c5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 09:52:41 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:49e:cafe::9d) by AS9PR06CA0424.outlook.office365.com
 (2603:10a6:20b:49e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.23 via Frontend Transport; Wed,
 10 Sep 2025 09:52:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 09:52:41 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 11:45:32 +0200
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 10 Sep
 2025 11:52:40 +0200
Message-ID: <96765443-481a-4e4a-86ac-961e50af28a8@foss.st.com>
Date: Wed, 10 Sep 2025 11:52:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 "Gabriel Fernandez" <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>
References: <20250909-b4-ddrperfm-upstream-v6-0-ce082cc801b5@gmail.com>
 <20250909-b4-ddrperfm-upstream-v6-1-ce082cc801b5@gmail.com>
 <9a46c8a8-1d25-410c-9fa2-267eb4040390@foss.st.com>
 <19e664da-df4c-4bc0-84ce-41e4364f10bc@gmail.com>
 <7cfb167a-26df-4abf-a6ec-73813a1a0986@foss.st.com>
 <22a485b9-1b86-41d3-a42c-f813eea94697@gmail.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <22a485b9-1b86-41d3-a42c-f813eea94697@gmail.com>
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|DBAPR10MB4137:EE_
X-MS-Office365-Filtering-Correlation-Id: b8817310-79d5-4a52-362e-08ddf04fc895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|36860700013|30052699003|82310400026|7053199007|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zmo1OXh4YlIyYVJKQnRNM1J6akxRUmJTdlNLVzAzV3BOSFlCTXNNTmF0a3V0?=
 =?utf-8?B?RnRSb1NtS0hQS21FQWtlL2JoT0VmUzJ3M1NoK0VkcEhFZnpmbldnSnNoYXZz?=
 =?utf-8?B?TDlYOVdSQjFJdjFQanBkQ2xIRjVhOCtLanh3anYwTWlhNlJsZElxMEErK2ph?=
 =?utf-8?B?bFhVMisxUnpmNGJRUDVXd2QxQnZhc3FnbkpzZE4ycjlHT2RiUGZDT2RFWFRS?=
 =?utf-8?B?ZjIxRkkyZGJFU2trV1VCT0UwZG16eEdJcXYwZ2xFbjNjUzFCSlh5QVM1RFZL?=
 =?utf-8?B?MzRwbVMxYjJKZVdEb3BnUzFWNzFNQnBEeHYxUXdKSHoxTFRUVVRnbHorQ1J6?=
 =?utf-8?B?Z3dhS29sMzhMWGViOFEydW95VU9XblowNGdoQjBmOFhlZVp3RjhqNStuVThp?=
 =?utf-8?B?YjVoOEI5eUIxMFQ4dWZCc296ZUJWNk14NXlDUk5SKytBUGhqSFJCWm4vK3ZN?=
 =?utf-8?B?ZU4zRTBBQmJvSmlhYUlFaU9GQnRpS1BhNmkxTHF0UW4wcTVBcDhxTjFZcXli?=
 =?utf-8?B?R3ZWRXliSTFuYmlhalhsWXBBQWNTeDNKcEUvQkNOemxKRFNyTko3SXVsOUcx?=
 =?utf-8?B?SUc3Q2VjK1MwMGlMRHBQM2FzTTdBVy90MUJDcDIxZXdTZmRJZ0VNek9KSVA2?=
 =?utf-8?B?cUJrcXBDdDdrSmZxVDhPM0ZuYVo1UUtlVTk3TTI1bWNHenB4Q2ZRNTlRaTRo?=
 =?utf-8?B?WUFIRW9rL1ZJcTlXZDdLRFdneVhrYWxlSFptYk9Bb0E5ckdSTmhmWHpvVm9Q?=
 =?utf-8?B?czVZQWhBQVhyU2lUMWxFbnduZHpmMXRyclF1NnB1UVo3UlZXWEgrbkx4Ty90?=
 =?utf-8?B?OWhnOEZhM29kQktBTUJxd1R1d0dqdFptdE50VGNFRnVRNWVuOUlja0wvNjZY?=
 =?utf-8?B?S2taaVdKM01rRHl5OENXMUVLVGwxMVY4VXV6QUkxUU85NFVTR1g2eGdzUXZ0?=
 =?utf-8?B?ei9kOVdVNEZkSXN0ckdCUi9BTXNMWTIySjJ5bnVYclZkNGkvU0I3WmNFc01y?=
 =?utf-8?B?YTVUbU1SZW52bTBVOWVVbGRscW1DQnJZaW1WbHJsZFpBU1BKcWdabkhXb3Zo?=
 =?utf-8?B?aFJpejF0Q25sdEE0Um5DNDhLaGQ5RFdXeEdYdkVNa0JENEdCZ1JrUWRIOWI4?=
 =?utf-8?B?eEtWRE02c3N0UmRDSHJMejl2OFJOVXF0cHp5SWl4WTRlbFRGbjN4WHNIZXd0?=
 =?utf-8?B?bFpGM1BaUXoybk4yaVBBK1hoQ1paUTk4N0h4ZE9ZRGorTVByMUZSakhQUWlF?=
 =?utf-8?B?YjFaOVkyRlF3ajcreER3bmpaTGdGZndpTHZYZG9pRlpFaVQvRlo0ODNCZ24z?=
 =?utf-8?B?TVFXYWZNeVdrU2l4SlpVMWFVNll4Tk92RG81K29lV25ESy9ORGZENzlwNDRC?=
 =?utf-8?B?SzAwVDE5Y2FIUWFNUTF5L2NPdTZKV0s1QTlhb2xhZUd3dVI2YkZDNE5GQzZT?=
 =?utf-8?B?VExCRUx6WkY4T2VCL3h2SERNT05XQVZsazVWSFh3Sm8rMHd3cmpWVXFlMEtU?=
 =?utf-8?B?VEVBMlJaWE4yMklQVFNwdlZSdzVTUFk5ZWkyOGNlYjhEWmJPS0szY09hc01r?=
 =?utf-8?B?emNYSFNTZmxLTzVxOVg4RWVNL3d0dC9IRERBeXc2YXJBTCtHV3VqRnkyZ2I5?=
 =?utf-8?B?YitSdnE1cE9nMWZTRU9nNW5iSnNFM2RDbFN5UHkrU2tsSTVlSThDRUdKbklz?=
 =?utf-8?B?UmVROVBXM01RZ0RUblhrSGpGUW5weXBzYlVpcVU2QkpnWXJLaG05eXRKMER6?=
 =?utf-8?B?K01Da01VRVRqK0x3YVZDNTNDR1IrdjZKWE1wSjJRbSt0YWw5aFFFcGFLYVdm?=
 =?utf-8?B?ZUFwS2F5QXEvZFF5NElhNFZjdFJLMENBYVhhMUcvSEl5OVA1VEhkUmZsMjRF?=
 =?utf-8?B?Vld6V3ZINEl2TzFBRk1oVGNNd2sxK055UkNPR0tobElkLy8zeU4yWVZFNmpy?=
 =?utf-8?B?Q01WU1l2cktkOVVDUzZiQXdWd3dRT0ZISkI4akhqdVU5V0tTUktpUUdqRE83?=
 =?utf-8?B?K2xteWlpUFB4Q0tmRUpZVzZqb2YrYVc2dzk5TWZOSGUwTmx5V25nemdhRDla?=
 =?utf-8?B?dWNxam9UZkhzZEcySTRIUGZJYm1zd2ZreTRUZz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(30052699003)(82310400026)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 09:52:41.3953 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8817310-79d5-4a52-362e-08ddf04fc895
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4137
X-Proofpoint-GUID: BpwbNuEBvSuLigD2oDnIRfWHcPtSJ7zl
X-Authority-Analysis: v=2.4 cv=GuFC+l1C c=1 sm=1 tr=0 ts=68c14a6f cx=c_pps
 a=JRzJ8T7PdTfL/uBtHARA3w==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=ei1tl_lDKmQA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=FUbXzq8tPBIA:10 a=8b9GpE9nAAAA:8
 a=pGLkceISAAAA:8 a=ogtmliehB0OFRgiU3f0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDA2NiBTYWx0ZWRfX3RKPElTNdAgV
 EHnxU2Fsx8Gnp3+Kper0GT84R4Ra1wmbe14847DEe/r9r18ps2NblqSu7QA71KgDpLXOV7sOkWm
 wk2SyBUNfX8Dffzb65EL+6H2tv9TAhgXuxs1leYqF8RRenULSIj1ue2YxeAmMB183VOEzJyPDtM
 cS8VOL7jr5iEBU7MSTG+UkkJjkkMDtj8tUwIQQqXwQPZjDTw59/krcUTH9kPXEURMXah/SAYpl3
 m2B0NETPhDuP1H1qoo11/ruWztwbErYx/wfHgcWec/bbP53z6NP41NZ5zAli69Yh2Ljna2iBwvK
 0gDopY7q0WwG9nQrmOqUn5itXDivZo9BzkWXy/96aMsgocXOv7xKYJ3O+e2OdRQKl/KnNuwmtk5
 qgIeWKUI
X-Proofpoint-ORIG-GUID: BpwbNuEBvSuLigD2oDnIRfWHcPtSJ7zl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100066
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-perf-users@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v6 01/20] bus: firewall: move
 stm32_firewall header file in include folder
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

CgpPbiA5LzEwLzI1IDExOjQzLCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4gT24gMTAvMDkv
MjAyNSAxMDo0MiwgR2F0aWVuIENIRVZBTExJRVIgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDkvMTAvMjUg
MDk6NDcsIENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPj4+IE9uIDA5LzA5LzIwMjUgMTQ6MjUs
IEdhdGllbiBDSEVWQUxMSUVSIHdyb3RlOgo+Pj4+Cj4+Pj4KPj4+PiBPbiA5LzkvMjUgMTI6MTIs
IENsw6ltZW50IExlIEdvZmZpYyB3cm90ZToKPj4+Pj4gRnJvbTogQ2zDqW1lbnQgTGUgR29mZmlj
IDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgo+Pj4+Pgo+Pj4+PiBPdGhlciBkcml2ZXIg
dGhhbiByaWZzYyBhbmQgZXR6cGMgY2FuIGltcGxlbWVudCBmaXJld2FsbCBvcHMsIHN1Y2ggYXMK
Pj4+Pj4gcmNjLgo+Pj4+PiBJbiBvcmRlciBmb3IgdGhlbSB0byBoYXZlIGFjY2VzcyB0byB0aGUg
b3BzIGFuZCB0eXBlIG9mIHRoaXMgCj4+Pj4+IGZyYW1ld29yaywKPj4+Pj4gd2UgbmVlZCB0byBn
ZXQgdGhlIGBzdG0zMl9maXJld2FsbC5oYCBmaWxlIGluIHRoZSBpbmNsdWRlLyBmb2xkZXIuCj4+
Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdv
ZmZpY0Bmb3NzLnN0LmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTGUgR29mZmlj
IDxsZWdvZmZpYy5jbGVtZW50QGdtYWlsLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+IMKgIGRyaXZlcnMv
YnVzL3N0bTMyX2V0enBjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDMgKy0tCj4+Pj4+IMKgIGRyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgKy0tCj4+Pj4+IMKgIGRyaXZlcnMv
YnVzL3N0bTMyX3JpZnNjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDMgKy0tCj4+Pj4+IMKgIHtkcml2ZXJzID0+IGluY2x1ZGUvbGludXh9L2J1cy9zdG0z
Ml9maXJld2FsbC5oIHwgMAo+Pj4+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL3N0
bTMyX2V0enBjLmMgYi9kcml2ZXJzL2J1cy9zdG0zMl9ldHpwYy5jCj4+Pj4+IGluZGV4IDdmYzBm
MTY5NjBiZS4uNDkxOGExNGU1MDdlIDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL2J1cy9zdG0z
Ml9ldHpwYy5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvYnVzL3N0bTMyX2V0enBjLmMKPj4+Pj4gQEAg
LTUsNiArNSw3IEBACj4+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC9iaXRmaWVsZC5oPgo+Pj4+PiDC
oCAjaW5jbHVkZSA8bGludXgvYml0cy5oPgo+Pj4+PiArI2luY2x1ZGUgPGxpbnV4L2J1cy9zdG0z
Ml9maXJld2FsbC5oPgo+Pj4+PiDCoCAjaW5jbHVkZSA8bGludXgvZGV2aWNlLmg+Cj4+Pj4+IMKg
ICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KPj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4K
Pj4+Pj4gQEAgLTE2LDggKzE3LDYgQEAKPj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3Jt
X2RldmljZS5oPgo+Pj4+PiDCoCAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPj4+Pj4gLSNpbmNs
dWRlICJzdG0zMl9maXJld2FsbC5oIgo+Pj4+PiAtCj4+Pj4+IMKgIC8qCj4+Pj4+IMKgwqAgKiBF
VFpQQyByZWdpc3RlcnMKPj4+Pj4gwqDCoCAqLwo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9i
dXMvc3RtMzJfZmlyZXdhbGwuYyBiL2RyaXZlcnMvYnVzLyAKPj4+Pj4gc3RtMzJfZmlyZXdhbGwu
Ywo+Pj4+PiBpbmRleCAyZmM5NzYxZGFkZWMuLmVmNDk4ODA1NGI0NCAxMDA2NDQKPj4+Pj4gLS0t
IGEvZHJpdmVycy9idXMvc3RtMzJfZmlyZXdhbGwuYwo+Pj4+PiArKysgYi9kcml2ZXJzL2J1cy9z
dG0zMl9maXJld2FsbC5jCj4+Pj4+IEBAIC01LDYgKzUsNyBAQAo+Pj4+PiDCoCAjaW5jbHVkZSA8
bGludXgvYml0ZmllbGQuaD4KPj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPj4+Pj4g
KyNpbmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaD4KPj4+Pj4gwqAgI2luY2x1ZGUg
PGxpbnV4L2J1cy9zdG0zMl9maXJld2FsbF9kZXZpY2UuaD4KPj4+Pj4gwqAgI2luY2x1ZGUgPGxp
bnV4L2RldmljZS5oPgo+Pj4+PiDCoCAjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4+Pj4+IEBAIC0x
OCw4ICsxOSw2IEBACj4+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+Pj4+PiDCoCAj
aW5jbHVkZSA8bGludXgvc2xhYi5oPgo+Pj4+PiAtI2luY2x1ZGUgInN0bTMyX2ZpcmV3YWxsLmgi
Cj4+Pj4+IC0KPj4+Pj4gwqAgLyogQ29ycmVzcG9uZHMgdG8gU1RNMzJfRklSRVdBTExfTUFYX0VY
VFJBX0FSR1MgKyBmaXJld2FsbCBJRCAqLwo+Pj4+PiDCoCAjZGVmaW5lIFNUTTMyX0ZJUkVXQUxM
X01BWF9BUkdTIChTVE0zMl9GSVJFV0FMTF9NQVhfRVhUUkFfQVJHUyArIDEpCj4+Pj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2J1cy9zdG0zMl9yaWZzYy5jIGIvZHJpdmVycy9idXMvc3RtMzJfcmlm
c2MuYwo+Pj4+PiBpbmRleCA0Y2YxYjYwMDE0YjcuLjY0M2RkZDBhNWY1NCAxMDA2NDQKPj4+Pj4g
LS0tIGEvZHJpdmVycy9idXMvc3RtMzJfcmlmc2MuYwo+Pj4+PiArKysgYi9kcml2ZXJzL2J1cy9z
dG0zMl9yaWZzYy5jCj4+Pj4+IEBAIC01LDYgKzUsNyBAQAo+Pj4+PiDCoCAjaW5jbHVkZSA8bGlu
dXgvYml0ZmllbGQuaD4KPj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4KPj4+Pj4gKyNp
bmNsdWRlIDxsaW51eC9idXMvc3RtMzJfZmlyZXdhbGwuaD4KPj4+Pj4gwqAgI2luY2x1ZGUgPGxp
bnV4L2RldmljZS5oPgo+Pj4+PiDCoCAjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4+Pj4+IMKgICNp
bmNsdWRlIDxsaW51eC9pbml0Lmg+Cj4+Pj4+IEBAIC0xNiw4ICsxNyw2IEBACj4+Pj4+IMKgICNp
bmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9kZXZpY2UuaD4KPj4+Pj4gwqAgI2luY2x1ZGUgPGxpbnV4
L3R5cGVzLmg+Cj4+Pj4+IC0jaW5jbHVkZSAic3RtMzJfZmlyZXdhbGwuaCIKPj4+Pj4gLQo+Pj4+
PiDCoCAvKgo+Pj4+PiDCoMKgICogUklGU0Mgb2Zmc2V0IHJlZ2lzdGVyCj4+Pj4+IMKgwqAgKi8K
Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmggYi9pbmNsdWRl
L2xpbnV4L2J1cy8gCj4+Pj4+IHN0bTMyX2ZpcmV3YWxsLmgKPj4+Pj4gc2ltaWxhcml0eSBpbmRl
eCAxMDAlCj4+Pj4+IHJlbmFtZSBmcm9tIGRyaXZlcnMvYnVzL3N0bTMyX2ZpcmV3YWxsLmgKPj4+
Pj4gcmVuYW1lIHRvIGluY2x1ZGUvbGludXgvYnVzL3N0bTMyX2ZpcmV3YWxsLmgKPj4+Pj4KPj4+
Cj4+PiBIaSBHYXRpZW4KPj4+Cj4+Pj4gQXMgdGhlIGZpcmV3YWxsIGhlYWRlciBpcyBtb3ZlZCB0
byBhIGRlZGljYXRlZCBmaXJld2FsbCBkaXJlY3RvcnksCj4+Pgo+Pj4gSSBkb24ndCBtb3ZlIGl0
IHRvIGEgZGVkaWNhdGVkIGZpcmV3YWxsIGRpcmVjdG9yeSBqdXN0IHRvIHRoZSAiYnVzIiAKPj4+
IGRpcmVjdG9yeSB3aGVyZSB0aGUgInN0bTMyX2ZpcmV3YWxsX2RldmljZS5oIiBoZWFkZXIgZmls
ZSBpcyBhbHJlYWR5IAo+Pj4gbG9jYXRlZC4KPj4+Cj4+Cj4+IFllcywgbXkgYmFkLCBJIG1peGVk
IG15IHdvcmRzIHRoZXJlLgo+Pgo+Pj4+IG1heWJlIGl0IHdvdWxkIGJlIGNvaGVyZW50IHRvIGNy
ZWF0ZSB0aGUgc2FtZSBraW5kIG9mIGRpcmVjdG9yeQo+Pj4+IGZvciB0aGUgc291cmNlcyBhcyBu
b24tYnVzZXMgZHJpdmVycyB1c2UgaXQuIEkgY2FuIHRlc3QgaXQgb24gbXkKPj4+PiBzaWRlIGlm
IHlvdSdyZSB3aWxsaW5nIHRvIG1ha2UgdGhlIGNoYW5nZS4KPj4+Cj4+PiBEbyB5b3UgbWVhbiBj
cmVhdGUgYW4gaW5jbHVkZS9saW51eC9idXMvZmlyZXdhbGwvIGRpcmVjdG9yeSA/Cj4+Pgo+Pgo+
PiBSYXRoZXIgaW5jbHVkZS9saW51eC9maXJld2FsbC8oc3RtMzIvKS4gYW5kIGEgZHJpdmVycy9m
aXJld2FsbC8oc3RtMzIvKQo+PiBkaXJlY3RvcnkgZm9yIHRoZSBmaXJld2FsbCBmaWxlcyB3b3Vs
ZCBiZSBncmVhdC4gSWYgdGhhdCdzIG5vdCB0b28gbXVjaAo+PiBvZiBhIGJ1cmRlbi4KPiAKPiBJ
IHRoaW5rcyB0aGF0J3MgYSBiaXQgdG9vIG11Y2ggZm9yIHRoaXMgb25lLgo+IEFzIHlvdSdyZSB0
aGUgZmlyZXdhbGwgbWFpbnRhaW5lciBJIHdvdWxkIG5lZWQgdG8gbW9kaWZ5IHlvdXIgZW50cnkg
aW4gCj4gdGhlIE1BSU5UQUlORVIgZmlsZSAoYW5kIEkganVzdCBzZWUgdGhhdCB5b3VyIGVudHJ5
IGlzIGxhY2tpbmcgdGhlIAo+IGhlYWRlciBmaWxlIHBhdGgpLgo+IEZvciBub3cgSSB0aGluayBp
dCBpcyBub3QgdXJnZW50IG5laXRoZXIgbWFuZGF0b3J5Lgo+IE1heWJlIGluIGEgbmV4dCBwYXRj
aCBzZXJpZXMgPwo+IEV2ZW4gaW4gdGhlIGRyaXZlciBidXMgZGlyZWN0b3J5IHRoZXJlIGlzIG5v
IHZlbmRvciBwb2xpY3kgc28gYWRkaW5nIGEgCj4gcGF0aCBsaWtlIGRyaXZlcnMvYnVzL3tzdG0z
Mi98ZmlyZXdhbGwvfXN0bTMyX2ZpcmV3YWxsLmMgaXMgYSBiaXQgCj4gb3ZlcmxhcHBpbmcgYXMg
d2l0aCB0aGUgZmlsZW5hbWUgd2UgYWxyZWFkeSBrbm93IGl0IGlzIFNUIGFuZCBpdHMgZmlyZXdh
bGwuCj4gTGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsgIQo+IAo+IEJSLAo+IENsw6ltZW50Cj4g
CgpZZXMsIGxldCBtZSBoYW5kbGUgdGhpcyBhZnRlcndhcmRzLCBJIGRvbid0IHdhbnQgdG8gcmVz
dHJhaW4gdGhpcwpwYXRjaHNldCBmcm9tIGJlaW5nIGFjY2VwdGVkLgoKVGhlcmUgd291bGQgYmUg
bm8gL2J1cy8gZm9yIHRoZSBmaXJld2FsbCBmaWxlcy4gYW5kIHRoZSBSSUZTQy9FVFpQQwpkcml2
ZXJzIHdvdWxkIHN0YXkgd2hlcmUgdGhleSBhcmUgQVRNLgoKR2F0aWVuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
