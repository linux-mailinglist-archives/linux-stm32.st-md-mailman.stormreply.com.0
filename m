Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKwVIyHIcGkNZwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 13:35:45 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 317A456DCF
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Jan 2026 13:35:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EF978C36B3C;
	Wed, 21 Jan 2026 12:35:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 146E5C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Jan 2026 12:35:43 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LCZQNG2006010; Wed, 21 Jan 2026 13:35:26 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011018.outbound.protection.outlook.com [52.101.65.18])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4btcn4ukpc-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 21 Jan 2026 13:35:25 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXk6ISZ9NNRwuQGtTGe2uQdoPDp+BjbCJckMtkn2GCYxM9R1YalBi2gWYSpfZKNhgG1fiKmx+0BZzttrOVCQFrShmxbYFF9TNT4KlaECTsh1QNZ7FBGSecuh3m2+O8bN+7qBjMqnHQTGygL8eM5rL1fJgmUOn2I356bA0p+tf623AZFg2//shTogLExIM2fXPJWcp2bMS/h2qRPlq1IHXV6N2QGXiQcFh4rgrRF/d4320uSLvVdp2Ve+5sUOWvnMBRZ0zwkHfccL1toy3csZQlxGn5zM5Ig4IsWmzwJVAUa3iy6Lr/7ZaoKV1/00t6E2cwf4z07Jl1ppvBT+Nlz0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WXg3iXMmpRHZCN2cjVNGSQhinaxSnLv1tVcF/S5ZuQ=;
 b=oTxZT3JJQUHX8JAmJfnBZgbKIjw58xSG6SVMNTETpU6O75ZvaPA9TmlGMxr57mNYz0Ru4gCATdQ+rSmZ5g1DYsOyw4/YGRAd6Jz8YlHsOSHLwVSG5xm/XFgx6waDdFhinKi2tW2m2XrfGuMi0IYbb7cfAHfufVDc+B/leps7r7YBbHPyWaTWDmEN81tVSTLlSCK6VmXosmMdeKOXkV30OuZxQo8TNyFbR4QdlTid5y3OZwwcKG7HaGtgZCc5eq9Ezy4eBICYU8VWzXL5xY2WGbO6JavZAhevl1lkLYfM1p8KDHpvZlb65sEuxsChBlSClzEtmxr7tz+N/+LyDoVBDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WXg3iXMmpRHZCN2cjVNGSQhinaxSnLv1tVcF/S5ZuQ=;
 b=Jv28iywfn2wdg14DlkgD6VQlBGv8RCDZEuefGoYspfTU09zBifIBZTHQdFcfKRCRmaM1y1CIGNPI+y6NySa5ke0Lw6EVbjOtSOQiSNgbAq9eAoe/uyLng07yC1R+vS081GS3yXNxNReAkSiUulgkzNTTXUHrWM0DsYru87j5uOfCxioIURuxKfM6Uf3oeEEmN8czHBLEGia4lYj3LsQ5vGysHWy9NoxLU6kDUnTSnPOOAnAtsVOy246mKXL0M8Y9bcj+ofDuNElaAJPZdtzD0O68GtYxUAwZGDqFhgwC0YfQurQhEJeSz5P1KF5f4AnNA10ZJ3ehADcTHdRzXW451g==
Received: from DU7P194CA0029.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::22)
 by GVXPR10MB9044.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 12:35:23 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::59) by DU7P194CA0029.outlook.office365.com
 (2603:10a6:10:553::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 12:35:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 12:35:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:36:42 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 21 Jan
 2026 13:35:21 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Wed, 21 Jan 2026 13:34:38 +0100
MIME-Version: 1.0
Message-ID: <20260121-debug_bus-v3-4-4d32451180d0@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|GVXPR10MB9044:EE_
X-MS-Office365-Filtering-Correlation-Id: c1a8ea06-f9f8-48e5-041f-08de58e98ba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|36860700013|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N0FjL2dLd01zNFVraG92SURKSndsVjc1ZDk4MENpY2ZHRURKTW41ckxMT01w?=
 =?utf-8?B?UzRRODZUaWNFbUJyaFRhb3U5Qkh2bktzWkFVc2dTNnVpMnhwYzVwMkVhb01m?=
 =?utf-8?B?eU5BTUg4ZGR4VWpOdmpaN2EwcW1TNlpLZWs0SkpERHo5QW9vanBCaFpaWXVz?=
 =?utf-8?B?NGN5eXc4czhqR1hBckpXbXhPbFBzeXJlSmgrbC9IdFFlV0dpc3R0WEo0cm5J?=
 =?utf-8?B?VjluZWQ2TEdFOEN5OVBtUklDNWZDRjUrQkdtR1o0VVpOejhzTkhoc2hBcUpr?=
 =?utf-8?B?YkhEcE4vT1B4YlhCYWVBZ012Y1Mvc2hoRUNtRmlvanA5SnJycFJ2aHNlL1Fl?=
 =?utf-8?B?ZWx6dHZPVjB3UU5jeUpXRU5NL05yaGY5UFF0TE01Q3ZwblNRdkNwL1ZiK3dJ?=
 =?utf-8?B?SjQ1RGNTZVBmdTdHVWhKVnVCT3dXWERVNEhBbDJqZHMwMmxQeUZVT093K01y?=
 =?utf-8?B?V3NrNzlyQjdxVUU2WFR5dEg2eThmN3VIblpJWlZLeWtoYkNYaXl0bzEwYmxS?=
 =?utf-8?B?ZStHb1dWMEp6b1ZUUnp4cGFwNWp3cmMwNGV3V1U0SXFucHcxb3hiNUprSE4v?=
 =?utf-8?B?WnFmeVNCQnNoWncyVnVXSkRPY0hMTEwzei9kTjcxOGFnOXBGMHp5Q2FsWTBs?=
 =?utf-8?B?UjdQRUIveGIvYlR1bVFDaEV1NmRvdlFuUWhGYzlaeU1sQm5LVUFobjhGZEQy?=
 =?utf-8?B?M3Q1VnRmZUI5NGFJeXBaRVAwcG4ydEV5RjRtd0pPMmJwRlYycXpEelhwWlkw?=
 =?utf-8?B?OXFrWXJ4RldsZmtBOHFJd1JGWDlXUStjd0ZseDZneFZRb04zL1hZTStiV3oy?=
 =?utf-8?B?NUhTR2NHSU8zWVVKbnZQeFFMZTR3Z2JVOWFQdjJnMWRoYy9yb0NsQ1pienRt?=
 =?utf-8?B?NVkvblpwd0JCSTFmR3Y0M09uVVZDM2YvV0x2MWlPZWUwazhETGZOanpKTFdq?=
 =?utf-8?B?eEtRNzRxbUdrcFAwL3NaMk9GUjdPclJwaUcvbGFEY0pTQ1RHMVdOL0tOQmxM?=
 =?utf-8?B?dDlaSDZaeEx2ekpxUWJuRUFNTW8rSlY2bXFZSW1ZRGp1MHh1Q3dhN2g1OFRs?=
 =?utf-8?B?QTQxTmo2TnV5VGI4a0pwaGpmaGkrSVZNa1pCbG9tbVFxNmRvMW5KaFBPRnFT?=
 =?utf-8?B?SWZPUkJUUlRyNVBoK0hxblpJMzY2c1dCTlFNTzJDVmQ3N0trRDdYWG9zMkhs?=
 =?utf-8?B?Q2piZ3I3UVh3bjM4RGRUcExVVHBrdlhScVhlbnpraVFXc2JRZXI3SDk2YkFS?=
 =?utf-8?B?ZVVFY2ZCNyt6MjFWdnh5L1N2NWhtY1VHZFNKc3g3d0NTQkNPdVBDLzBmWC93?=
 =?utf-8?B?a1VJUlJINURBR3FPQkxCTUlmVmtRbEcvbjhxeVhIZTZuS1VJZE9VUDFwOEU1?=
 =?utf-8?B?b1psWEk0d0svdmdNZGsyUTJFejI1OEdrOUtJY21FMWZHTEVyVVY0bXFGMFhX?=
 =?utf-8?B?MXFFYm9wZmxQRGFtbitkSE9XczJjUzVuU0l4SkhiS0oxNVpNb3hmMGtRUUpO?=
 =?utf-8?B?UW1QZEk3cEtHY1crOW9Ca29RMWFhMXIxd3hweG53ckxGMXBWOUxFQ3VvY1Y1?=
 =?utf-8?B?VmFZREhKNlloMjRCZ2d6Vk1zTld5MjR3T3NoQlZhWTAyenJTT3UxZGVveXlr?=
 =?utf-8?B?dnhPR29iaTFVdFBvdXZMd1d6eHJ5cnExQlIyeHMweFpqL01mSlA0ZnhySjVQ?=
 =?utf-8?B?MWVoZW9sMy9icE9hcTl6cnI1RXFEcnhqUkFNbFhLU2ZZSzZNdUhSWVg5b1gx?=
 =?utf-8?B?bWs5TTBPNjQzUFJoeXp3aTI3M2gyMXhLdHFpV3Q1RVpRSFgxZW11SU4zblJH?=
 =?utf-8?B?TWZqbi9BL21iTlgwbm9mNGRGaTIxMTl1TVQ5dnBPamU3bjN0N1Y2Mnp0Yndl?=
 =?utf-8?B?bkdWWC9lbStsb2lUTXIzYURNaXcwVGtyNkd6UkFVcVFRQmpMRkdtLzNweW1K?=
 =?utf-8?B?VXhSSi9aNjVPbzJ0aGdxZWI1T2VsN0RjK0VYdTJoZWw1K2pib2M5ckZSVlgr?=
 =?utf-8?B?d0Z1YlZJTDc2dDJVNGhjSzg1TXRIMTU5cTArRUdnMUpPdFpzelFzVHZPc0pz?=
 =?utf-8?B?RXhXQVo0MHNrNnJoSm96QWRkb0JZTlBhb2VMM0xRWnlQd0d3MU1uWU1QRzB6?=
 =?utf-8?B?c2dhOXM4MDJPTm13eDRLcERxQzYxdVdrSk8vMjZVUytsVnVZQlh1R1RYcnJq?=
 =?utf-8?B?YmNUU01TelRTSlAxek9Rb3hiLy9BRjMwTUExUjVVZWkwWDZOUEJxT2VTTXZp?=
 =?utf-8?Q?HmzY4WGWBYMLRCUKbqV3PSFOJ7ga2NMLhIMxzev+Ag=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 12:35:22.5494 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a8ea06-f9f8-48e5-041f-08de58e98ba5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9044
X-Authority-Analysis: v=2.4 cv=Fec6BZ+6 c=1 sm=1 tr=0 ts=6970c80d cx=c_pps
 a=ce04CMPyoBEZ2AUYtGd0Qg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=E_Tl1f5C0o25NIMeFyMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwNSBTYWx0ZWRfX8nt52V8Ia0aJ
 qV34KiLxZEZqCqejmt4UGjeqZhB9eG9gVBTaIvK45k8YkOLk3Wv7+/0qg8qgMxVj7NNL1YLLvfw
 toonqIHJrRWPQA91Vs3nhDWVgptaVFvSVFymSW7Bdj5HqriVH0NTlpDmlZ+BQslUbpA65XjAvyr
 7BzI0AvT6hIc0OqpXf2QnNvZEjRml7ZSrX5k0eT9NdVfa1fy0WN38ojjjLeM0v8zSnL5dFYqPXq
 DNtUG0i4FJLkKq4k9e4P+/RpySUOqWiS7N6qk9j92hucNB4t+TWtk3D6NBAAV4BowYcqJqwXGWC
 HiyJGuekVrIovresb+sOgsmolVWN0nMhmpEOsSgmqACk4B9QjmbaKYtv4snzrfvZ1rhdFVfO6x0
 rN3pZQUQ21xdAa3zeqLezBFymuIiWki/jVsuqeRUDLEdNTfXZkEkXyBjCdLpoXo4ZATZbIQubtW
 jXZ+0AY2fSyYFqobePw==
X-Proofpoint-GUID: rO1z6PkZJbX9uX2sQEWV-gwY7Rb_dL24
X-Proofpoint-ORIG-GUID: rO1z6PkZJbX9uX2sQEWV-gwY7Rb_dL24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210105
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v3 04/12] bus: stm32_firewall: allow check on
 different firewall controllers
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid];
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
X-Rspamd-Queue-Id: 317A456DCF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Current implementation restricts the check on the firewall controller
being the bus parent. Change this by using the controller referenced
in each firewall queries.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 drivers/bus/stm32_firewall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
index 2fc9761dadec..2717754d811d 100644
--- a/drivers/bus/stm32_firewall.c
+++ b/drivers/bus/stm32_firewall.c
@@ -274,7 +274,7 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
 		}
 
 		for (i = 0; i < len; i++) {
-			if (firewall_controller->grant_access(firewall_controller,
+			if (firewall_controller->grant_access(firewalls[i].firewall_ctrl,
 							      firewalls[i].firewall_id)) {
 				/*
 				 * Peripheral access not allowed or not defined.

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
