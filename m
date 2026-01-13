Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A37D1A198
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Jan 2026 17:10:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52CFAC8F282;
	Tue, 13 Jan 2026 16:10:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D705CC5A4EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jan 2026 16:10:10 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DG6OI41492978; Tue, 13 Jan 2026 17:09:40 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bm174sfuv-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 13 Jan 2026 17:09:40 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qDvmAs1SL2SjBW+ixZpwkmgUBQYZCVXUEMo82m57N3HCnne6xDPWxDpPvGoG5Pv70H3sQy2bQg0Jsf7vwHywHgmwA2Zrut+fM8e2jlmiHUNqsR9eeinfieeXHYUcKwOiyYaxVsOmrSUbZtBEMyQ12Oxkm6UwgcR8v4qKS3kuwijdVGgNtR7HkcL/NqMDvHHibvd+5DashZc4v7oJgFjI+WUHASCECPww06HMyqAfycVCr+Bc6cZTuPcMd31OX8py4t5LTU74uOMKDGso2qAjAmXIL/zwELDQHSwWznRogSbeHSdKtA+gURe/A5i+FFwVeeJMLYkqwUmGwZYKrwGXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMt2s06F6DUAXs0R6vQxihhDP6PNGO3NyLZio15Vv8g=;
 b=huYd1s9WkL/Vb/Pa/EoCHbABOdtM6cCinn+MXoT/1TrExKpqpNcybEx39Tm3txTLmp02i57er+pUxrN632QwidaHcoruB2pcZUuUW1YKJI3p0Dl+eNkmenR9Uw1Cje9qmp2jgYa8w2csNIFoJ2sq+3wryt1MJMSutnAULWALumGbm2JtlkSynKmC3o51LlQjGWpRzLOdDhw5ug4cFY22kJ4YVrkUzTOFvF4ueRPutA97tIeJz3i4hK28SCJIvh85fW4jJtxKVcPi31WYWte+gpRWnfC2x277BXlx/kd2s2HGnTvjSChg1MS8Dl+drKstuEwvRBI2u+VtgIqO6QD1ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMt2s06F6DUAXs0R6vQxihhDP6PNGO3NyLZio15Vv8g=;
 b=TK2jiw7YDREU9Kf/H27y/WfVkb6CVLuB3qNnuF9NH3PQhrLToQIZcABpdL101mDI1nUWT7M3MdpI7bviNhNl+oTUyzXqRFi4UpO9PD54JKrDpQAo/e76sRplDMiMvmKQpB4Hek9iJTubRSHQk2M7CzPyO3kg/a7LWKtt3+2/TMHiD6Bi3kQVu07XnJkUIsJDWbOmlkRVvBo1uc540HMsWKXI/F3G3EfStWbKKwjYPLQx1A9GeoTeD0l5RX+sjMyOpzKx4SuOgcx0xUCWkA1TJGrNKKF9eqMscIRslGOkxR4yTsrjsN5lX0NU/klPxx8ly2U2JApxqYaZIOb7NIWAHQ==
Received: from AS4P195CA0035.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::19)
 by AS8PR10MB6197.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:54b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 16:09:37 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::10) by AS4P195CA0035.outlook.office365.com
 (2603:10a6:20b:65a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 16:09:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 16:09:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 13 Jan
 2026 17:10:54 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 13 Jan
 2026 17:09:36 +0100
Message-ID: <8b3b6cb6-31d0-425e-9894-bf33f2ea3dda@foss.st.com>
Date: Tue, 13 Jan 2026 17:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jens Wiklander <jens.wiklander@linaro.org>
References: <20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com>
 <20260109-debug_bus-v1-5-8f2142b5a738@foss.st.com>
 <CAHUa44Gc+q0qJ0XJ8Y-OMT2t9o0W_WeDMHg_S0HPC5i2Zmxhiw@mail.gmail.com>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <CAHUa44Gc+q0qJ0XJ8Y-OMT2t9o0W_WeDMHg_S0HPC5i2Zmxhiw@mail.gmail.com>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A796:EE_|AS8PR10MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 0961b325-6353-4230-3d88-08de52be2680
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WHp3dWVSY0k2U1lqeGZKRW5Hb3J0WVJqb0hjc0tVSS80T0orb3JGMWdVQ0pE?=
 =?utf-8?B?N2MxREJ6M0lwMzFXNHA2eTJ5RmZXeFR3NDFJQ1kxQWVKYWJBU0w4ZjZWKzdj?=
 =?utf-8?B?RytyWElpaXFsejdKTUorM2hvWWpQY0tsSmdFbTBIOFZnRnVabVlGR1NINW9E?=
 =?utf-8?B?dFNOYzVDYTFtNGdFK2lXZU9pYmVEbkpLMlczN0p2dVlhbUZ6ME9XaFJSU2ZY?=
 =?utf-8?B?OFZsV0ZVK2NYT3BUK3ZaVmQvb1VKd0VzaXRKc0h4Z2ROdmEwdk9TRERiTzhz?=
 =?utf-8?B?YXUreW92b09UV2tsblpPUlk0bjc3MDJvT0lzSHc0KzFWaE9rZUpPQUdZZGZi?=
 =?utf-8?B?ckFuRndDOHdrZmZYZzNaNS96eVRFS2lhelpmN2F0WHd1NTdieVV1d1JsZk9h?=
 =?utf-8?B?YkdGT0x3Q3pNbS96OWMvbFhlREtTOXRNMWdSL3ZtQi84QThTbmFhOWRYaGxD?=
 =?utf-8?B?eDJwbTg5bnp3KzY5UXZzVkxkYTFPVW5IZFhDVWNzWVNTQmZWeU1DTXh5NEx5?=
 =?utf-8?B?MmtKdEFubkJSckhoL3ZlNmhCZEVJL2dwTE9HVVl6L2ZmUkdDRTB1NHpzY2Uw?=
 =?utf-8?B?cUNoa2pJUXYzWWVyRFc3TWlFWEVrNnRlS3RvUEZIQmFIODNNNnRrVFBHSFdn?=
 =?utf-8?B?WmRhandBdGRxNFB2eVpQR3V0b1RERU9lK2hReGpWS2E1aUlub21UQXFaTk51?=
 =?utf-8?B?S096TysrWllldG1odDRCeU13TFNJTGlncWRmd1ovZHBEWGxiZ3RWd2FjU2Ur?=
 =?utf-8?B?Q0ZwTnF2L004RG00YzdsUjZ3VDlMUkk5Zkx1NlM2U0c4RlNweTdHLysyZkw5?=
 =?utf-8?B?KzNrZmpOaFV5L2EwcHI3WDQyT0VJUUV0bWlMaThwSTBGN0xVcmY0cDFkY3VR?=
 =?utf-8?B?L0xEeG5iYmEwQTRYb0czbTJyUmlZeFc1UDYySGRHL3lFWUM2bS9LV01PZVkw?=
 =?utf-8?B?NlRqQXFNV2tMbWcvOHEvV0V3VWFLMlVpNXlLTElyM0JiUll3T1NaeC81dnE0?=
 =?utf-8?B?Z1RhaFduakxIQm9uaGM2ZTdESXl2TXcwOFR4WXV6VVFwQ2FzWDdMOVM1Y0RH?=
 =?utf-8?B?ZTBzNmttTHJxYU9YUWFpMVVrdXVLaEZLSThmL0NEeWJCMTlIWTVldnBJNUVr?=
 =?utf-8?B?N3ZaTnIraEZ1dWN6L1VBcU8ydlU2TmE2VlNwVE55ZW5IdGJvbUlQSnJxQzRn?=
 =?utf-8?B?dGpJWFh3TFhtbDBOTUlGUzUxNnk1WFBVcDMxNTNMSGhZcTh1bnR6RTduZjdP?=
 =?utf-8?B?YTZLYjlkZ2d0eC9vMTJPbGlWS2tFY0dZUTdvTVRNRWxDWnF2cDlxZGdXZzdU?=
 =?utf-8?B?WVp4TDdULzdzUzlNb1RyU1N0aXdoQ2lhREZ1Zm9kTkpudEw0eTRpT0szQ3Z3?=
 =?utf-8?B?Z3hkMFZHUG9xNU15MGtPeVdsaElkTHB1QTFncTZ2U0EzUDcvK1FoazgwRHJ5?=
 =?utf-8?B?aDkveTBzMXRrdnk4SFJVeDZZRDlsdmtic05hZEN0UU1yOHRWb0FuY0dicGtD?=
 =?utf-8?B?dUVhTTE3OGJiSUlyeDRKa1NuSmYyN284NldjazVqYUxnbUhLcXZUcFBMaHBr?=
 =?utf-8?B?ZnMxR3h2Q24wTmF6OFgrNmV2TzlCRTgycjNiL3M4dm5Gc21xbC93RUlvTU5p?=
 =?utf-8?B?OVpKajJubEdhd0s1Q1Rwek0zcG82ZytxTnF2ck40c29oZjM4VjQwdDVhemk1?=
 =?utf-8?B?RVYyamRUMU1Rem5nR2thSlg1ckRtTFZZWWRNNG5zc2pRWkZ0YmdWcEV1RmV6?=
 =?utf-8?B?WVBLVWgzeit5aEdqQUFSWDNoeUNFSVRDT1NmcGtCeHk1Q2lFUmNMYVdEdVlR?=
 =?utf-8?B?eHkvbHhZZXV4Nzg4SEV2L0lCZkE3QUpRaDNHamdiTVVOMWFSbUtvVlV2WmNV?=
 =?utf-8?B?WjJPYk14Qi9ML0x5UDJnSS9PSVE0YXc2QWxJeFJyV21xbHJ0LzdDL3JBVjRa?=
 =?utf-8?B?YjN6Nm1OeWRMbmVvdEJzbFk5cUR2TzVSdDQ3bWp0M1Uwb3c0U0tOWFUyNkU1?=
 =?utf-8?B?c3VxNXpnS0tBd0xRK3k4YnJzMzdlcVZOck56amxQNnpTUXMvcURQNGxKQUsz?=
 =?utf-8?B?TzJHQ0VKVlpxNVJsNDVsUGJibytrM2t4QnE1Rmh0UTlrR0tRZEJkWVdiU1Yz?=
 =?utf-8?Q?XObQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 16:09:37.5632 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0961b325-6353-4230-3d88-08de52be2680
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6197
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEzMyBTYWx0ZWRfX3+bHDwGd6jdS
 3GqFjoFWs7Jsi1OpErm9ma4BAd7tAWkrLyNYLruM4k2R0WtNDTAVU2oZiHjyE/mrGvS0SVq6NPz
 bzfeuE81RPFDg2ZnNgrVkgyMgcV199ERUbyi4oF4TLAFvYBh/5ixHZJc4EcbT6qT86PFETJtFuc
 UqGCPK19P964+SuvHB+pZpicvS56cqumyWyCfL8umpv2sPcjHDStEGqWFfuEQRyOzKmK+R7R8Cn
 wnlonN5/0CG/iW/qwQlIBO0eqLJe+eRDgT3ZRF+a+c6i7n9B/d6eL51jLBoCUIUQAXTIAlAlDiS
 XsdOHLWUcVBDTKX9oXPbdIvqdHGpaGqs/bbKv/pWmzX/5KBuVsHnukxVP5BL+xwsEePGN0gB8+P
 DaNu1d/9EBozSNB4dqOJuYjMaXqOy69LVzSRoDGxywhKx33g5ecafGu6WTB73GdtvW4pBQNF0hK
 aLyPd8bi8J3BWyycvvA==
X-Proofpoint-ORIG-GUID: ICsK5xLa0A11BOQYmHjLth__5hZFIH-4
X-Proofpoint-GUID: ICsK5xLa0A11BOQYmHjLth__5hZFIH-4
X-Authority-Analysis: v=2.4 cv=atm/yCZV c=1 sm=1 tr=0 ts=69666e44 cx=c_pps
 a=7E8kR0TPtiWwzUzoHzRCyA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=IpJZQVW2AAAA:8 a=8b9GpE9nAAAA:8
 a=JUBgdCs-rIgSTqKGxAQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IawgGOuG5U0WyFbmm1f5:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130133
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 linux-gpio@vger.kernel.org, Leo Yan <leo.yan@linux.dev>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, coresight@lists.linaro.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 05/11] drivers: bus: add the stm32 debug
	bus driver
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

CgpPbiAxLzEzLzI2IDE1OjQ1LCBKZW5zIFdpa2xhbmRlciB3cm90ZToKPiBIaSwKPiAKPiBPbiBG
cmksIEphbiA5LCAyMDI2IGF0IDExOjU34oCvQU0gR2F0aWVuIENoZXZhbGxpZXIKPiA8Z2F0aWVu
LmNoZXZhbGxpZXJAZm9zcy5zdC5jb20+IHdyb3RlOgo+Pgo+PiBBZGQgdGhlIHN0bTMyIGRlYnVn
IGJ1cyBkcml2ZXIgdGhhdCBpcyByZXNwb25zaWJsZSBvZiBjaGVja2luZyB0aGUKPj4gZGVidWcg
c3Vic3lzdGVtIGFjY2Vzc2liaWxpdHkgYmVmb3JlIHByb2JpbmcgdGhlIHJlbGF0ZWQgcGVyaXBo
ZXJhbAo+PiBkcml2ZXJzLgo+Pgo+PiBUaGlzIGRyaXZlciBpcyBPUC1URUUgZGVwZW5kZW50IGFu
ZCByZWxpZXMgb24gdGhlIFNUTTMyIGRlYnVnIGFjY2Vzcwo+PiBQVEEuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEdhdGllbiBDaGV2YWxsaWVyIDxnYXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4K
Pj4gLS0tCj4+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgIHwgICAxICsKPj4gICBkcml2
ZXJzL2J1cy9LY29uZmlnICAgICAgICAgfCAgMTAgKysKPj4gICBkcml2ZXJzL2J1cy9NYWtlZmls
ZSAgICAgICAgfCAgIDEgKwo+PiAgIGRyaXZlcnMvYnVzL3N0bTMyX2RiZ19idXMuYyB8IDI4NSAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+PiAgIDQgZmlsZXMg
Y2hhbmdlZCwgMjk3IGluc2VydGlvbnMoKykKPj4KPiAKPiBbc25pcF0KPiAKPj4gKwo+PiArc3Rh
dGljIGNvbnN0IHN0cnVjdCB0ZWVfY2xpZW50X2RldmljZV9pZCBvcHRlZV9kYmdfYnVzX2lkX3Rh
YmxlW10gPSB7Cj4+ICsgICAgICAge1VVSURfSU5JVCgweGRkMDViYzhiLCAweDlmM2IsIDB4NDlm
MCwKPj4gKyAgICAgICAgICAgICAgICAgIDB4YjYsIDB4NDksIDB4MDEsIDB4YWEsIDB4MTAsIDB4
YzEsIDB4YzIsIDB4MTApfSwKPj4gKyAgICAgICB7fQo+PiArfTsKPj4gKwo+PiArc3RhdGljIHN0
cnVjdCB0ZWVfY2xpZW50X2RyaXZlciBzdG0zMl9vcHRlZV9kYmdfYnVzX2RyaXZlciA9IHsKPj4g
KyAgICAgICAuaWRfdGFibGUgPSBvcHRlZV9kYmdfYnVzX2lkX3RhYmxlLAo+PiArICAgICAgIC5k
cml2ZXIgPSB7Cj4+ICsgICAgICAgICAgICAgICAubmFtZSA9ICJvcHRlZV9kYmdfYnVzIiwKPj4g
KyAgICAgICAgICAgICAgIC5idXMgPSAmdGVlX2J1c190eXBlLAo+PiArICAgICAgICAgICAgICAg
LnByb2JlID0gc3RtMzJfZGJnX2J1c19wcm9iZSwKPj4gKyAgICAgICAgICAgICAgIC5yZW1vdmUg
PSBzdG0zMl9kYmdfYnVzX3JlbW92ZSwKPj4gKyAgICAgICB9LAo+PiArfTsKPiAKPiBKdXN0IGEg
aGVhZHMgdXAuIFdpdGgKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9vcC10ZWUvY292ZXIuMTc2
NTc5MTQ2My5naXQudS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbS8KPiB3ZSdyZSBzd2l0Y2hp
bmcgdG8gdXNlIGJ1cyBtZXRob2RzIGluc3RlYWQgb2YgZGV2aWNlX2RyaXZlciBjYWxsYmFja3Mu
Cj4gVGhhdCBwbGFuIGlzIHRvIG1lcmdlIHRoYXQgcGF0Y2ggc2V0IGluIHRoZSBuZXh0IG1lcmdl
IHdpbmRvdy4KPiAKPiBDaGVlcnMsCj4gSmVucwo+IAoKSGVsbG8gSmVucywKClRoYW5rIHlvdSBm
b3IgdGhlIGxpbmshCklzIGl0IGZpbmUgaWYgSSBwdXNoIG9uIHRvcCBvbiB5b3VyICJuZXh0IiBi
cmFuY2ggZm9yIHRoZSByZXZpZXcgYWxvbmcKd2l0aCB0aGUgYXBwcm9wcmlhdGUgY2hhbmdlcz8g
SSdtIG9wZW4gdG8gc3VnZ2VzdGlvbnMuCgpUaGFua3MsCkdhdGllbgoKPj4gKwo+PiArc3RhdGlj
IGludCBfX2luaXQgb3B0ZWVfZGJnX2J1c19tb2RfaW5pdCh2b2lkKQo+PiArewo+PiArICAgICAg
IGludCByZXQ7Cj4+ICsKPj4gKyAgICAgICByZXQgPSBkcml2ZXJfcmVnaXN0ZXIoJnN0bTMyX29w
dGVlX2RiZ19idXNfZHJpdmVyLmRyaXZlcik7Cj4+ICsgICAgICAgaWYgKHJldCkKPj4gKyAgICAg
ICAgICAgICAgIHJldHVybiByZXQ7Cj4+ICsKPj4gKyAgICAgICByZXQgPSBwbGF0Zm9ybV9kcml2
ZXJfcmVnaXN0ZXIoJnN0bTMyX2RiZ19idXNfZHJpdmVyKTsKPj4gKyAgICAgICBpZiAocmV0KQo+
PiArICAgICAgICAgICAgICAgZHJpdmVyX3VucmVnaXN0ZXIoJnN0bTMyX29wdGVlX2RiZ19idXNf
ZHJpdmVyLmRyaXZlcik7Cj4+ICsKPj4gKyAgICAgICByZXR1cm4gcmV0Owo+PiArfQo+PiArCj4+
ICtzdGF0aWMgdm9pZCBfX2V4aXQgb3B0ZWVfZGJnX2J1c19tb2RfZXhpdCh2b2lkKQo+PiArewo+
PiArICAgICAgIHBsYXRmb3JtX2RyaXZlcl91bnJlZ2lzdGVyKCZzdG0zMl9kYmdfYnVzX2RyaXZl
cik7Cj4+ICsgICAgICAgZHJpdmVyX3VucmVnaXN0ZXIoJnN0bTMyX29wdGVlX2RiZ19idXNfZHJp
dmVyLmRyaXZlcik7Cj4+ICt9Cj4+ICsKPj4gK21vZHVsZV9pbml0KG9wdGVlX2RiZ19idXNfbW9k
X2luaXQpOwo+PiArbW9kdWxlX2V4aXQob3B0ZWVfZGJnX2J1c19tb2RfZXhpdCk7Cj4+ICsKPj4g
K01PRFVMRV9MSUNFTlNFKCJHUEwiKTsKPj4gK01PRFVMRV9BVVRIT1IoIkdhdGllbiBDaGV2YWxs
aWVyIDxnYXRpZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4iKTsKPj4gK01PRFVMRV9ERVNDUklQ
VElPTigiT1AtVEVFIGJhc2VkIFNUTTMyIGRlYnVnIGFjY2VzcyBidXMgZHJpdmVyIik7Cj4+Cj4+
IC0tCj4+IDIuNDMuMAo+Pgo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1h
aWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
