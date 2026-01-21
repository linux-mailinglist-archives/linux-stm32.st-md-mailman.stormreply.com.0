Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDpqBknIcGkNZwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 13:36:25 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F4556E04
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 13:36:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71CC2C36B3C;
	Wed, 21 Jan 2026 12:36:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 47E19C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 12:36:23 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LCWV1m1548781; Wed, 21 Jan 2026 13:36:01 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bta06cc75-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 21 Jan 2026 13:36:01 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEbhttaFph0zDdAdcmhZAjSlufKTcMyJ4GvHqhg+rrTrgks8phYvFpMtEhZrYBiKUPQdU3zeJt1sZf3tSpJ+sTkN38+Aq4mJqmxZt+MYL2p2r+R9o3cI8O3+0BfBZSfXc4HHBUVXUuyviQ55qE75TV+dXjHLI/hBRTrPmOZN6V2v+WX7vOpcZMEHf35bF4C8TzHbL6kQf0hnb8JBWM2jRGFMrzE+VQVgbqbhwhQN8vfV+dFb9X6lSAiZ9I+sxT9fPDS4vcrMLodka5pxT9cmP9SaNVS8N+/91LuhFDpHKVGZ3lyOaV5BWC8DwjLoqVL6yg+z5IwLTbBw0xAo2sxg0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x69j+KwtehBG/F3KwB+xw3x5ggv6Oxye23T6TDjUTNQ=;
 b=xMXuSvC0DHlvD0BY4HbeyfjKIU8IC7DTXVzeXbkdxK3rZYRzqMMqFaapvVxI4JO4JPkztivFggU9F96R2gbtM5nVEoKqDcVn/apd+vb8tDQHnjdi/2SE2+fB6z/TyEIUe/AKwe6G519L6TYzjrSDMUGaOQcRWf4W/TP3RbrDZViVVvzUVuj1fvrqPphileYfM7jlFUroewYRIUk9cpk9qnKUBpwpf1kdTl1h/DjAuJsOjK5txKDbb5tJ2psZBI5ZtJMRJoKTw2EIvxANTmFcsSOB2ahZndwlmgjzlvyR37SazdRww0UYIPinG4BZH6++rJDovXc5e1tdHtBzm0GRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x69j+KwtehBG/F3KwB+xw3x5ggv6Oxye23T6TDjUTNQ=;
 b=EuUKL8thyKxOjjYTndTDS9QJ/sJV3y5Khj6nqztiIbuMXJjSKX2sMKdruCES6d5Qo1WdzwrgntwtBbsAvOC/O6QTCR9x1yKZr2Xsz6+62OZhkXSAPl4MaONJYzx5L1nCKMoruVT+/n/v1K14nKsLMp4Y6kFTCxyi9drYUNA2JSaNRTGFoTabZD8AW0iTCJk+VZoYYJ4JyKis3r7DkM2IMY6nLYLIWq5onkdw38zD91NzChtJ3P992l1o3gZKkKA1musJMLBABYcoxSNs6ObJhmXZs8VgJMarTgwPsbypa261f8nsBVnd7ga8ugFGMaVOzb/Sw+qEmPLkeSe/Tiv8Yg==
Received: from DUZPR01CA0258.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::18) by DB9PR10MB6740.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:3d0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.13; Wed, 21 Jan
 2026 12:35:56 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::48) by DUZPR01CA0258.outlook.office365.com
 (2603:10a6:10:4b5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 12:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:35:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:37:14 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:35:53 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:41 +0100
MIME-Version: 1.0
Message-ID: <20260121-debug_bus-v3-7-4d32451180d0@foss.st.com>
References: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
In-Reply-To: <20260121-debug_bus-v3-0-4d32451180d0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|DB9PR10MB6740:EE_
X-MS-Office365-Filtering-Correlation-Id: 09088706-f9b0-4dd1-1534-08de58e99ebc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGtXSGl3STZNKzFaaTZSRTAyRVNXV2pvb09OQ205dDN5RnhKbXJ4N3cyWkRa?=
 =?utf-8?B?dEJ4ZHIyME1hcXVwZXZ4a3lRN0hIdUsyYm1kSDlnbnlUcVY3NVcrbEl0cnNh?=
 =?utf-8?B?bW9jd0dLWkFkeDFKdzV5RXRGTjdaL2pXV3lVV0dCR1NqazVxanZ5UGQ0QWJO?=
 =?utf-8?B?eW1WMGdGYTNnZHYydHNiMytCY21VazhjTUw1ak96K2RELzByejl1REFwOVQ4?=
 =?utf-8?B?T3o5Rm1aNXhNZS9nVHpMU0dTTFVVdjl1N1UvbzMxbkNSWTV2WU80Nkx0WUdG?=
 =?utf-8?B?WDFJNDVoZFJ0MUxpZUxGV3lnQThJNE1nWFhPRlVYVWdlT2RWZnZ2NjBhN3pR?=
 =?utf-8?B?ZXhrelBvdXkxbFgrLzB5cHVidWU3WFZNUXM2SkFLNHRoTjg4b1JHOUxmVjNZ?=
 =?utf-8?B?a3ZhY0Qzd296R2pLWmk2MkNqdVBoT2tEQStZKyt2NXdXMXFxY1hpTnVHMGdy?=
 =?utf-8?B?emphbmNsN1hiUXpPSENVaGd4UW9jSXArYnFINkZEY2RQaGI0QmFubTI4VjlS?=
 =?utf-8?B?eHhWR0xxamdIbmxxaklyMDhvV3JtcUxVQXZNcFNYQUNjYWMvQ2hybEs4Tmpy?=
 =?utf-8?B?Nkt2dlhWN2pmc3Y3cU0zSUR2NTBnY1hUWWtHeS94QnFJajFvLzl5SUVFTkhn?=
 =?utf-8?B?S1dnUThoUVo0Q0FDMVpwYTBDVFcvbyttMVhjeVJaUUpITFVkN0xHZVVIUU8r?=
 =?utf-8?B?UU13WkpJa2xZTFQ5MkVlTmtLeWx1d1FhaHI1UkU3MUlsVWFWYkIvWVRYN3pp?=
 =?utf-8?B?RFpCN08rR2tUM3ROa2lXdEJVcXl6Z3Z6d3Q2a0M1aXg2UXFKZ2wyc3E0OURV?=
 =?utf-8?B?WU1FZngxOE9RTXBFMXNQbFJzNVl3UzFIZUgzU0hpYjR6Y0xkVkREQklySHd6?=
 =?utf-8?B?cVVpcDhtU1pDS3B0ZjdOSzJrcFFWQ2dvWm1SeGlzTXhsZ0xrSXk5Y2Uwc1Rr?=
 =?utf-8?B?QUpCOExUUjdyUHJsZDNjZjc3S0FBYUtSU2d3RC9JYmw5NXhQazh4MFl2dU9R?=
 =?utf-8?B?Mk5HanZIL1ozUnhQcE16UHZCVlhwN2U4YmJBRitrT2YvZTVtN0JRRk1BKzNk?=
 =?utf-8?B?RHFoQUp3RDBiNGRuOHlocEFaeEVoSnVRalJmampxeld6akYvUXNlbnFpSHJZ?=
 =?utf-8?B?SklUNTlzL2tBRjJXUktXWFRjb3ZHckYyMU5aSjdETXR3aHJLT3NJWnc2VlJC?=
 =?utf-8?B?d1Vrd002M01ZTTF0aUo4Z3BWbTlGNTZpWGx5bzIwRVY5akE2Q0dkUEVOb0Ny?=
 =?utf-8?B?VmdtekJUUjBZamw2YkxFVVZ6cXV3WkJxRFN1NkY2YkltSEtqbnI3YWlKMFRz?=
 =?utf-8?B?SExRMVpwREZhdUVaZmszNlRSRGdWRjNLelhUMG9aSzh1SS9ZMzRzclg0TWV1?=
 =?utf-8?B?UmduRzRFM3V3ZmZqQ3RSWDJlTDByUG9SajhUbTJqYVo5MU9jOEZibG4ySXRr?=
 =?utf-8?B?ZlYxQ3FnV0lnaFBoL3FsKzJ3N2U1ODc2MU51cGdQWllrTkhGaHhRaGtxbERl?=
 =?utf-8?B?R0l6TjZ0bUh5WURmSVh2ZXV0VDgyWXZOTDV3Z1NYanhQaVRMUW90ZlAvTDE0?=
 =?utf-8?B?QkpCQVIrMVdybFRYODdkWHRwS2dzUEhmWjV6TC9IK0hXRXpMaHdmMFBFZEZ2?=
 =?utf-8?B?b2VQeXE0TEZhSVVmVGVUU0lXZ0MwNGVBSXV1azVESmIrLzlBaVhVT0RNaVM4?=
 =?utf-8?B?YjJDSVRtUWpvYytiaEtwR2luSTJhcThUcEc5UHlwbnQ3a1duNGVHMXoyaGZG?=
 =?utf-8?B?UmtrdStDdEtRL2J6Sm5acVZ5MmF1RXJNZWh6Qm1GY3NISXladnF3eW5LdHZi?=
 =?utf-8?B?MlBPKzhLdTJkT0VUTXgrZjkvZU1WVlpiVDZ5SEQxUjIyQVZHZ1pvbG5oMWVw?=
 =?utf-8?B?NGtIdDRKZmY0aStVWlJIRE41Qlk2OTVSRjNDcXFoSDJpUm5QdzBoUmdXTExK?=
 =?utf-8?B?VjF6UlhndlJQc2k5TzUrUXN3c2RWRmp5ZStjZ2NzdTJBWmhmVnlmOTB4YWFx?=
 =?utf-8?B?RVZXaUNDK1BXY3VhamRWNW5lSy9UT0VlMzhONWp6Mno3Z0VlY3FaTmttUTRi?=
 =?utf-8?B?a2JNc1dvR0hTbmdrOWJZd2s4QlhUVXc2dXhqWlZIdjg4WXBoc0xBUFQzNzFh?=
 =?utf-8?B?RUFxM0pLSG03SUZsMDd1YVgzalFFRndKblF1RWhsL3gvWmRXbWhjeVFEMGdZ?=
 =?utf-8?B?NE9Td0pEQ3diZU9RKzhIMjRLd244WnBrSGpFZ0dVNHRiWXI5azBHNzRHV204?=
 =?utf-8?Q?e/bVmHrpz5lx5hYH8JxbC3cbJENFrS+4RivdrPvgMQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:35:54.5775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09088706-f9b0-4dd1-1534-08de58e99ebc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6740
X-Proofpoint-GUID: 4qvOhA2_zWGdRpjO8gJkTjcy2VkYfX3j
X-Authority-Analysis: v=2.4 cv=fuLRpV4f c=1 sm=1 tr=0 ts=6970c831 cx=c_pps
 a=T/jJOQ1jOsfbeIr9+q7grw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=-E33GuBO8opgirhHEr4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX3mkdTfGycRPs
 lHdbQNWHdOEQQs08c9mpoDTkkLJ3pED6Blnbyog1+KaBZZAg7XWois77gUK8oCY89M0m9HDEVE9
 d+1D1D0rCps9/YIQ6TbFhHD2T8A/GSWpZ5mykbGFOs+CSNqeSU6WV+8Pf9aMWTfgwAfmbqF43/v
 2QQMzdVyqp62w9WMpuOHuWGEUcUqArK+/YoqWxtocL1X7YFUFBYbiRdeQ6/mZAYt7NBPE2PKQTB
 cFB7S1/e77g71H+ojLk7OZjvYrQqSx8SuqbsuI96eOLXm31sss8H5ZW36cS8VDe/PZ/C3BnzMUB
 sgsuDaGG4q9xzOqowRYi64kgAk82Q1U1FMkToFH8p7RD3ZN5373zz/4KahN0dQIVxdBE1uKekh5
 e2wmNfzlwA9FeaLeomOGfSgg0PBMuFcyd7Ul/OtiCaMroQDutACgxVSfSsY8HFihFDH63gR35xr
 hEP0bJ8leJPeZ3ApPFw==
X-Proofpoint-ORIG-GUID: 4qvOhA2_zWGdRpjO8gJkTjcy2VkYfX3j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210105
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 07/12] arm: dts: stm32: introduce the debug
 bus for stm32mp1x platforms
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
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
X-Rspamd-Queue-Id: A8F4556E04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some peripherals cannot be probed if a debug configuration is not set
in the BSEC.
Introduce a debug bus that will check the debug subsystem accessibility
before probing these peripheral drivers.

Add Coresight peripheral nodes under this bus and add the appropriate
access-controllers property to the HDP node.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 118 ++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp151.dtsi | 172 +++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp153.dtsi |  68 ++++++++++++++
 3 files changed, 358 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index b9657ff91c23..315c2a952f60 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) STMicroelectronics 2021 - All Rights Reserved
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/stm32mp13-clks.h>
 #include <dt-bindings/reset/stm32mp13-resets.h>
@@ -964,9 +965,126 @@ hdp: pinctrl@5002a000 {
 			compatible = "st,stm32mp131-hdp";
 			reg = <0x5002a000 0x400>;
 			clocks = <&rcc HDP>;
+			access-controllers = <&dbg_bus 1>;
 			status = "disabled";
 		};
 
+		dbg_bus: bus@50080000 {
+			compatible = "st,stm32mp131-dbg-bus";
+			reg = <0x50080000 0x3f80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#access-controller-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			cs_etf: etf@50092000 {
+				compatible = "arm,coresight-tmc", "arm,primecell";
+				reg = <0x50092000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						etf_in_port: endpoint {
+							remote-endpoint = <&etm0_out_port>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						etf_out_port: endpoint {
+							remote-endpoint = <&tpiu_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_tpiu: tpiu@50093000 {
+				compatible = "arm,coresight-tpiu", "arm,primecell";
+				reg = <0x50093000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						tpiu_in_port: endpoint {
+							remote-endpoint = <&etf_out_port>;
+						};
+					};
+				};
+			};
+
+			cs_cti_trace: cti@50094000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x50094000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+			};
+
+			cs_cti_cpu0: cti@500d8000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x500d8000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				trig-conns@0 {
+					reg = <0>;
+					arm,trig-in-sigs = <0 4 5>;
+					arm,trig-in-types = <PE_DBGTRIGGER
+							     GEN_IO
+							     GEN_IO>;
+					arm,trig-out-sigs = <0 7>;
+					arm,trig-out-types = <PE_EDBGREQ
+							      PE_DBGRESTART>;
+					cpu = <&cpu0>;
+				};
+
+				trig-conns@2 {
+					reg = <2>;
+					arm,trig-in-sigs = <2 3 6>;
+					arm,trig-in-types = <ETM_EXTOUT
+							     ETM_EXTOUT
+							     ETM_EXTOUT>;
+					arm,trig-out-sigs = <1 2 3 4>;
+					arm,trig-out-types = <ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN>;
+					arm,cs-dev-assoc = <&cs_etm0>;
+				};
+			};
+
+			cs_etm0: etm@500dc000 {
+				compatible = "arm,coresight-etm3x", "arm,primecell";
+				reg = <0x500dc000 0x1000>;
+				cpu = <&cpu0>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						etm0_out_port: endpoint {
+							remote-endpoint = <&etf_in_port>;
+						};
+					};
+				};
+			};
+		};
+
 		mdma: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index b1b568dfd126..1559263204be 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -3,6 +3,7 @@
  * Copyright (C) STMicroelectronics 2017 - All Rights Reserved
  * Author: Ludovic Barre <ludovic.barre@st.com> for STMicroelectronics.
  */
+#include <dt-bindings/arm/coresight-cti-dt.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/stm32mp1-clks.h>
 #include <dt-bindings/reset/stm32mp1-resets.h>
@@ -274,9 +275,180 @@ hdp: pinctrl@5002a000 {
 			compatible = "st,stm32mp151-hdp";
 			reg = <0x5002a000 0x400>;
 			clocks = <&rcc HDP>;
+			access-controllers = <&dbg_bus 1>;
 			status = "disabled";
 		};
 
+		dbg_bus: bus@50080000 {
+			compatible = "st,stm32mp151-dbg-bus";
+			reg = <0x50080000 0x3f80000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			#access-controller-cells = <1>;
+			ranges;
+			status = "disabled";
+
+			cs_funnel: funnel@50091000 {
+				compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
+				reg = <0x50091000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					port@0 {
+						reg = <0>;
+						funnel_in_port0: endpoint {
+							remote-endpoint = <&stm_out_port>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						funnel_in_port1: endpoint {
+							remote-endpoint = <&etm0_out>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						funnel_out_port: endpoint {
+							remote-endpoint = <&etf_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_etf: etf@50092000 {
+				compatible = "arm,coresight-tmc", "arm,primecell";
+				reg = <0x50092000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						etf_in_port: endpoint {
+							remote-endpoint = <&funnel_out_port>;
+						};
+					};
+				};
+
+				out-ports {
+					port {
+						etf_out_port: endpoint {
+							remote-endpoint = <&tpiu_in_port>;
+						};
+					};
+				};
+			};
+
+			cs_tpiu: tpiu@50093000 {
+				compatible = "arm,coresight-tpiu", "arm,primecell";
+				reg = <0x50093000 0x1000>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				in-ports {
+					port {
+						tpiu_in_port: endpoint {
+							remote-endpoint = <&etf_out_port>;
+						};
+					};
+				};
+			};
+
+			cs_cti_trace: cti@50094000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x50094000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+			};
+
+			cs_stm: stm@500a0000 {
+				compatible = "arm,coresight-stm", "arm,primecell";
+				reg = <0x500a0000 0x00001000>,
+				<0x90000000 0x01000000>;
+				reg-names = "stm-base", "stm-stimulus-base";
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						stm_out_port: endpoint {
+							remote-endpoint = <&funnel_in_port0>;
+						};
+					};
+				};
+			};
+
+			cs_cti_cpu0: cti@500d8000 {
+				compatible = "arm,coresight-cti", "arm,primecell";
+				reg = <0x500d8000 0x1000>;
+				clocks = <&rcc CK_DBG>;
+				clock-names = "apb_pclk";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				trig-conns@0 {
+					reg = <0>;
+					arm,trig-in-sigs = <0 4 5>;
+					arm,trig-in-types = <PE_DBGTRIGGER
+							     GEN_IO
+							     GEN_IO>;
+					arm,trig-out-sigs = <0 7>;
+					arm,trig-out-types = <PE_EDBGREQ
+							      PE_DBGRESTART>;
+					cpu = <&cpu0>;
+				};
+
+				trig-conns@2 {
+					reg = <2>;
+					arm,trig-in-sigs = <2 3 6>;
+					arm,trig-in-types = <ETM_EXTOUT
+							     ETM_EXTOUT
+							     ETM_EXTOUT>;
+					arm,trig-out-sigs = <1 2 3 4>;
+					arm,trig-out-types = <ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN
+							      ETM_EXTIN>;
+					arm,cs-dev-assoc = <&cs_etm0>;
+				};
+			};
+
+			cs_etm0: etm@500dc000 {
+				compatible = "arm,coresight-etm3x", "arm,primecell";
+				reg = <0x500dc000 0x1000>;
+				cpu = <&cpu0>;
+				clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+				clock-names = "apb_pclk", "atclk";
+				access-controllers = <&dbg_bus 0>;
+				status = "disabled";
+
+				out-ports {
+					port {
+						etm0_out: endpoint {
+							remote-endpoint = <&funnel_in_port1>;
+						};
+					};
+				};
+			};
+		};
+
 		mdma1: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;
diff --git a/arch/arm/boot/dts/st/stm32mp153.dtsi b/arch/arm/boot/dts/st/stm32mp153.dtsi
index 92794b942ab2..17d52d93695e 100644
--- a/arch/arm/boot/dts/st/stm32mp153.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp153.dtsi
@@ -30,6 +30,74 @@ timer {
 	};
 };
 
+&cs_funnel {
+	in-ports {
+		port@2 {
+			reg = <2>;
+			funnel_in_port2: endpoint {
+				remote-endpoint = <&etm1_out>;
+			};
+		};
+	};
+};
+
+&dbg_bus {
+	cs_cti_cpu1: cti@500d9000 {
+		compatible = "arm,coresight-cti", "arm,primecell";
+		reg = <0x500d9000 0x1000>;
+		clocks = <&rcc CK_DBG>;
+		clock-names = "apb_pclk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		access-controllers = <&dbg_bus 0>;
+		status = "disabled";
+
+		trig-conns@0 {
+			reg = <0>;
+			arm,trig-in-sigs = <0 4 5>;
+			arm,trig-in-types = <PE_DBGTRIGGER
+					     GEN_IO
+					     GEN_IO>;
+			arm,trig-out-sigs = <0 7>;
+			arm,trig-out-types = <PE_EDBGREQ
+					      PE_DBGRESTART>;
+			cpu = <&cpu1>;
+		};
+
+		trig-conns@2 {
+			reg = <2>;
+			arm,trig-in-sigs = <2 3 6>;
+			arm,trig-in-types = <ETM_EXTOUT
+					     ETM_EXTOUT
+					     ETM_EXTOUT>;
+			arm,trig-out-sigs = <1 2 3 4>;
+			arm,trig-out-types = <ETM_EXTIN
+					      ETM_EXTIN
+					      ETM_EXTIN
+					      ETM_EXTIN>;
+			arm,cs-dev-assoc = <&cs_etm1>;
+		};
+	};
+
+	cs_etm1: etm@500dd000 {
+		compatible = "arm,coresight-etm3x", "arm,primecell";
+		reg = <0x500dd000 0x1000>;
+		cpu = <&cpu1>;
+		clocks = <&rcc CK_DBG>, <&rcc CK_TRACE>;
+		clock-names = "apb_pclk", "atclk";
+		access-controllers = <&dbg_bus 0>;
+		status = "disabled";
+
+		out-ports {
+			port {
+				etm1_out: endpoint {
+					remote-endpoint = <&funnel_in_port2>;
+				};
+			};
+		};
+	};
+};
+
 &etzpc {
 	m_can1: can@4400e000 {
 		compatible = "bosch,m_can";

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
