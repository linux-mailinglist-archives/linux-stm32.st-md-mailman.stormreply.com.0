Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCR8OVZOcmlAigAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:20:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F1A69C48
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 17:20:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52A57C87EDF;
	Thu, 22 Jan 2026 16:20:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02092C87ED5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 16:20:37 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60MFhr3j270235; Thu, 22 Jan 2026 17:20:15 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bunggghfp-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 22 Jan 2026 17:20:15 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LO3FA3W5KGy+TyWGOR4+jzD48Sq6fLK+CvGUhsD6iP2Ykp49XV4fAhozzUKYvFOThtsEiq4Kl491b+jJpW51uPLil7Liik2ttU0zNLMHdK5crtrLQg3+OYu35Ftcjb51TeSuj/+dLNuDVd+AmYINIGD4eSJD4gASee9pNAdC+VclsE99GBaHlfm3Xkzi3jDTOm+haEJ0zVQ1Y8NfBn/ZJjQBUUgYghsRfcTKnb8oAOLqUlnQPSSqw0luODo0LZLnoK9X8YGxZX058HQ8dcVs08+c4BT6bHb1zp/OiDiwczmB5vBR1BiwI/9ZmYAE9QJ2v3fRZpvxe+O3J92b3ftExg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WXg3iXMmpRHZCN2cjVNGSQhinaxSnLv1tVcF/S5ZuQ=;
 b=ImuEnIZPombnP+mO8D2IUZdIbCkpFBtbhvYD9GWMqM4bpr7hDk3T9w2+F2C3kTUed2Pxcri0belXZs93s6/e4lLnMSaK6rtPzEGTe0134yWcTBRydj7AgN6++VWaMhnl9DuYMyN6vyg4PkZcqjM//xydndf43LS7wg/hPpjcH0hHH5Wu+tXVcLISiGxJTz1ctFCOgRAf0Ng6BxeceTXFUaDlYYwGne6Su+cqEpXN7IhhBknu0/93Xhh/60G5fz8OC+Q30PFNDhO7OYPdGIvSnhhubOiFVgMdYE5sEVstXBuWzrwg+W9rpcOWcqDGOugyxOyAdLg+u6lGUSUjhIEqgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5WXg3iXMmpRHZCN2cjVNGSQhinaxSnLv1tVcF/S5ZuQ=;
 b=IPtoDImXDQtrg2jabk2OEWhS8NMaZRFszREluLOzWotraf0Pk2ps4WuxEoYw/6MThLa73bKUsr5zrJhH4tXo00S87iw69+nWk1jJPyUp03eDi0LmmTESteHMYTKTHh47owmUKmXxfNDq5c3NzdFliwetAePqjbzM+APmEKy2Q27tOG9GbV3yCC8CYSyOGGSuX8R+WzmCMNBMyF9jc4xoBcaq5r5VUdS35az1pilIfRjd6be/9J710E619T2xexjs9s67Qtv82vAeCZLZOdlE14slJN74cWGZcqw0TmulDl5gKHBzwZ0/gCYDE4Foj9/jxH5m/jX7nVjC+pqE6+Inng==
Received: from DUZPR01CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::13) by GV1PR10MB8348.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:1c8::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 16:20:12 +0000
Received: from DU6PEPF00009528.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::7f) by DUZPR01CA0063.outlook.office365.com
 (2603:10a6:10:3c2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 16:20:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009528.mail.protection.outlook.com (10.167.8.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:20:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:21:41 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 22 Jan
 2026 17:20:09 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 22 Jan 2026 17:19:17 +0100
MIME-Version: 1.0
Message-ID: <20260122-debug_bus-v4-4-28f0f2a25f2c@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF00009528:EE_|GV1PR10MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 88aa24c2-9167-4d7b-9c6c-08de59d21d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ym53WXpkb0xNVG51TmZzeWhYdVpkdjRGbklzUkYyL09mWTh6dTRkSkVDMlVw?=
 =?utf-8?B?VlJadGtVZ2Vhc2wyQW03ajBoajJmUjdMSllmOFBkR1EwYjZicUhXNGozWG5o?=
 =?utf-8?B?Y1lvdk4yakVQczJkMHRHblZjdUYyR0J1bXZjaVhRV3NFSTlWV296bWoxcnUy?=
 =?utf-8?B?RloxTTZYTDVzdHRjaWluVmtkZ0hBcUQ4dHk0MzVRRFpDT0VhSjFxeGNLSHNa?=
 =?utf-8?B?UjhyMlpkdCtHd09IelA1dDk0R0YzTjUvQ3ErT0hMZ3J5dGxHRGYrVXYxZW5I?=
 =?utf-8?B?Y295ZWNZNDVhNjkzSGI1cUlWWDRZd2ZFb0JpZ1J4aXpKcldYd3lYdjd1K004?=
 =?utf-8?B?ZUNZNC9DUm4zeE5aQ2hwOUZjZXgyV1RsTHQrT2JPYjJ0LzNnenhWS0dYakFK?=
 =?utf-8?B?cTBFQlkzY05yblpiQ0pMTVFGWmdRWDd4RW9GMS9FZXpsaTBETTFmaG5lQTZv?=
 =?utf-8?B?eFJ5NktQTkk5SHdKU2JueXl4NjZaUzk3blI4OUxtcDFjZGtWY2FIOHlWRWhM?=
 =?utf-8?B?Uld5RmtBNHU0dEtqMCtlZlR2enBGb256TE8xK3JwRHJpWTF3K2NpNTlnR0x3?=
 =?utf-8?B?V2o2MThVYVplRU5Ia1ViOEdLdVVXZ0VtU0JWbVM2TTBOYll4MVhiSWNQMmty?=
 =?utf-8?B?d0o4NS83VFhJMmJ5WTdRSyt6T3ptM2pYY1Y3R0JpdVQrNk5ta3dlbUI1cTg3?=
 =?utf-8?B?SjFaanphTENFa2o4TlBMelkvNDFWOGxjZTVuUUdoWDlsN3hablAyWlVtYVhS?=
 =?utf-8?B?ZHBYLzJxNjlkY0ozb055OEhwdmhyQm50SDFuZ1FzOTMydXUzMEpaWStyK3R6?=
 =?utf-8?B?WStlME96ZjhGazJoSGRUdi9BbHNYWTEzbFhUcHlkTjE3M2xGMDdjSUZ6NVJn?=
 =?utf-8?B?dFhCcDJ1WVlQMkJtRjQ3ZXZTeDBJd3RIOWx5Y3pVd3Ftd1EvWTViWlNRQ3pR?=
 =?utf-8?B?Uzl4dEcwZU85U0JCVEY5ZEdENDd4NnpTYUpjRHJzYjdKdi9TRHFBNUdxcmVw?=
 =?utf-8?B?Yjh5WWxzVE9FWXBmYXRobmFLcGszTUFBTWgzVWx3NlBOMW5zRjNXYzZTaVZQ?=
 =?utf-8?B?SG9YQisrUkkzemQzWE45cklScGdaNHRzRW1EMjcyUVlwNHBCcU1BbEdrT1Rh?=
 =?utf-8?B?eHk5OGNrN1hLbGlCakcyOGluQVRMT3NQeWRleEQyeERmMkdsT3g3SDVjNmMx?=
 =?utf-8?B?TWpYeWhxS0toWGg4VGxRalozdjYrZ0Q4aS9JSHNtUXQrWGlMZjg0TWlFbHgy?=
 =?utf-8?B?WlZRRmh5VXExTmcrSUIxcTdZemdNY0lydjd3dnhVUHpDQXgzNE1zU1p3MlRX?=
 =?utf-8?B?bTZ4TUlENE5wZEZsSUtIK2NFNEplSTFrMDlZeUkyc2tZWmJKdEFZMUZVTVlB?=
 =?utf-8?B?dDhIYlNnM0xoVGc3U1RnQlhkazRIMXh2cmZaTEhMN01SWWpFTnNVSFcvS0Zh?=
 =?utf-8?B?VkVndmdzdFZEZUtlMG5oTmtHc3pZNmRINnpJVWRUQXZtekRHMTNuWkFEUHB5?=
 =?utf-8?B?MmpZTXplUDB2REpGY2U0Ym5QOU1UNUt5Q1U3RHRub2dORjlDWlErNy94SnVB?=
 =?utf-8?B?MHl0Vjk1ZS91cWVybVpUWHpzaEVTU3VJY1lvbjFzNVg3ajBOR3BqVTc4VlNP?=
 =?utf-8?B?S2Z2dnBqS3gxcmtud3krVFJ4emtsZmE3dUwrMEJUU09LelVSNmVTMmh4L1VQ?=
 =?utf-8?B?NWhncit0R1h3UEJwRHA2L1FNTzh3UkVUaWFJQm5sYldTb1Nuci9zNmtRY2JC?=
 =?utf-8?B?eEdFNEs3RmtkR1FFNmZEVlFLQlErdmtlVXZUU0JrZXozd3k4b3lVRUJubXY1?=
 =?utf-8?B?eDdFOEhseXBsc3VDUHIwdkJvcWQ4NkVuN0ErdXM0R3gxSUhQeHlQeEdUSnlS?=
 =?utf-8?B?M3JqVjdkTllzRm9RMEFndE1RUmszbmFuOWsyaUdFUE1vSFpNTGpGVFU3cGll?=
 =?utf-8?B?NUsrNDFXZUU1WGZQV2t3QzhvQ3JkTDR3SmM1dUQ2a3MrQlp5VGE2V05CSmlt?=
 =?utf-8?B?RndkdldlSEdYa2IvSHFtSHBGdGI1a2Y2a0J6OGNZR1NJRC84T21LaENDNEdW?=
 =?utf-8?B?RHlhb1piaC9mR3RoYnkwM0ZTRWV5OVU4SitlMVpqbXlPdkNQRHNLRW55SG9n?=
 =?utf-8?B?RkdvTjN1dWVwbXArcGVneFFUUVMwNnExczdDc1VIcWJVd2IvK09OZzVZOXNL?=
 =?utf-8?B?ZWU2a3BaRmE2eHFXY1YxcEN1azZZTWpRN1V3bW9EV282Y2pFNXRLUkN4V1lu?=
 =?utf-8?Q?xkhOCtWQK/LPGWKtbg6cp0oxaplJKgxqXMWv0Rj9ZQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:20:10.6940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88aa24c2-9167-4d7b-9c6c-08de59d21d9d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009528.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8348
X-Authority-Analysis: v=2.4 cv=VdD6/Vp9 c=1 sm=1 tr=0 ts=69724e3f cx=c_pps
 a=zFavDl515riqcEWy6M9o2g==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=rg8MelPR9j8A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=E_Tl1f5C0o25NIMeFyMA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: d8orQOk7hDJ0HQScl5QOuaohTtz3s02r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDEyNSBTYWx0ZWRfX0KIF3e594a02
 7XniOpBPFsvOKZ529ALbS0imdAkjREiYbsOvrE9V3cdPunzdPvVltdjGqT8Big0ss8B5tPniefi
 UnGwoV1Lycfs+e9LsgAkQ1OjXJEu0kXcyzAxPmMUdUvaIuWN2wra2Hkka9/XUcG8n8G0UPSq+Bw
 oDsjKFLkBIvgti8nhyosYhOALsjK6SXWznXlvzb3bTkIQ6K6iNn1EJw/c98gq2DcztKS0w1eB2C
 sFzPWiB4odarPVOUnh0J0A1dKbOC2toTzAX0zc+N1+GtP6abkmEgQiTRdxsAgMXAAynk0WferK8
 IuLvDd2vVJ3EKde0UZecXsdFE+5+z8X+pp30UL3qcBcvCELj+5KKr+Rirk2FWcb9FRQvF+l3bwz
 T3oi23hHBcEqrqv+8F5goSi2O6zRGgCKFha2lmdbQpAb+99V1XyHNhfIzBrpo5UlrdfyXqRUAVD
 P2f4q9FnOAg7v+FMs9g==
X-Proofpoint-GUID: d8orQOk7hDJ0HQScl5QOuaohTtz3s02r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220125
Cc: devicetree@vger.kernel.org, coresight@lists.linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 04/12] bus: stm32_firewall: allow check on
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,st.com:email,foss.st.com:mid];
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
X-Rspamd-Queue-Id: 89F1A69C48
X-Rspamd-Action: no action

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
