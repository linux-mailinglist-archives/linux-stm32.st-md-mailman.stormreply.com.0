Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEDBBF2023
	for <lists+linux-stm32@lfdr.de>; Mon, 20 Oct 2025 17:09:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7D85FC5A4E5;
	Mon, 20 Oct 2025 15:09:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A3DCC5A4E4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 20 Oct 2025 15:09:44 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KDAjsM009892;
 Mon, 20 Oct 2025 17:09:22 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49v27y84g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Oct 2025 17:09:22 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P2YpAzv8d9e+saPA/9OKU7q1ojeVgv73WNVvN9znS5+hEMsMLG1TI354NgBNqwB6JpsuB57zW1BwMGakVVel/CtSfHjbHyKj5iGnZ5S6AJFGrnPmYkT+PZ6qfBNYaAhu5SVKqDSUzu/2X3F+FNBhAgKlmwdgebtVx6W4acGxGe8ws1QaDaJkBlLWaCiPrB3kYV4FFhzOjuG+M77gNO/91MMud0XGMh92lkb1OvmQLzYkMVbbC+yxVnYC7gdlfyzG4jQ/33g1eRU4cRtnB7R5z7K0hh/uwwPrMnoOtfe3MaztAY03m9zp4jRwxQXFuwpX2SP9BHrXLe7CJjnbPT3o6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H+oYpuhA2eMMV8kLGYcLZaFXlqlXN9eswLzA14DjaXk=;
 b=A99w45JhnBAm9Gcra94z4+xDxVdp4Enrym/tvmvvYT0ZOHc+Bjf3RJ6qinJ279i4pUegEogsxQZHa44Wgy9MT5mOL2X0gFuKW0TjOwNjFVGdW2iXmLuAaBVA+uSI7Wsh+PJJZTpoERNXvbvjK0lpvH7XHbgAiZG8ZVGh6qrlrKpmqgmo1HzQeYbIdkGQ+bWgBFSv71BT3OvmPKZ0W+FuR7ETpBg7f25co7aPc+TeZ/RLdHyXryP2/IWq6rs9ZVeNP3YKF6GZDkR+XIOBqS2TehRIPEofjgyWh+4JzC4ztZdLZkghfpcjr5jq2GX810X09KINeCZCx+6YT3asTu0LxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H+oYpuhA2eMMV8kLGYcLZaFXlqlXN9eswLzA14DjaXk=;
 b=BmVjTh7arWWV8ijNDUYB4FzFTqvOqUzDWOObcK2+0j52xtYeK0V00Oiwp6tqZQ0Z+3AWQR7CcfC8PJwo7GL4LJ+AkT5E5RfUFTB6lrG9CPgT1rSQa95aez6ewLPnbM43scmHk9WzG6iJctzQ46+3+RIzhikZZpIyRo2OxuY8wWrFAU5uaLHVbPyKKxVPGYtAtyT3yFmcTeuu5Xn22KH40F+UvG2frFHO8+cHU9EYjxQHvIO8vOpXC8VNcgoPMbzSZwCw3wkMWzMQZ0WgIXBdZiOLAaWlU9IMQc1oX65MK+/G5XV9Zx0oEBa1lQspofLPE/rIVNje3I37gXgszCwHGg==
Received: from DU6P191CA0057.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53e::15)
 by VI1PR10MB3520.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 15:09:17 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:53e:cafe::a3) by DU6P191CA0057.outlook.office365.com
 (2603:10a6:10:53e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 15:09:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Mon, 20 Oct 2025 15:09:16 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 20 Oct
 2025 17:02:16 +0200
Received: from [192.168.8.15] (10.48.86.11) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 20 Oct
 2025 17:09:15 +0200
Message-ID: <0826a055f6b2e3e6b50a5961e60d1b57d1d596c6.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Conor Dooley <conor@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 17:09:14 +0200
In-Reply-To: <20251015-headstand-impulse-95aa736e7633@spud>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
 <20251014140451.1009969-10-antonio.borneo@foss.st.com>
 <20251014-affection-voltage-8b1764273a06@spud>
 <b4eca95eaa0e6f27fc07479d5eab2131d20eb270.camel@foss.st.com>
 <20251015-headstand-impulse-95aa736e7633@spud>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.11]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009523:EE_|VI1PR10MB3520:EE_
X-MS-Office365-Filtering-Correlation-Id: bbed043e-f371-4435-7a4d-08de0feaa31d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVoxbDh1NVVURDFUcmE0UTRXRkgyNXIySENJOHppT2NHWWd1dVFxV2FZcVQ3?=
 =?utf-8?B?NzNXMHJlVGxrZHhtcjFZVE9TMGZHS1dXSnM2V3FZQXdLT2VRbnJqdXN4ZCs4?=
 =?utf-8?B?KzdPYzNWcEtJMmtsVWtxR2M4Q2QwT09YZlhIMEExVkVRam00QjZKY2Y5Tlkx?=
 =?utf-8?B?QmxmeWs5NG9UbWJJR0FrM3U0bDVoOFlNanRuenVJa2JpL2xlOGpEYlAzU2h1?=
 =?utf-8?B?SmpWUDVpZVhVNVEwTzNBUEdqSnN3RjgrTkFraDJRQ3I5WkxSSWNRL21lWHpO?=
 =?utf-8?B?N3VHQ2pVRjd4WkxHRG5QQ3dmRmlHMGZGRXdBK1pQdTJpcWRHYmt4S2ZyQmkz?=
 =?utf-8?B?M1JQc0oyRmhXaEhDRWNmUlN2NHhOZkdSNlBydTkzMlBqV3d6QlJaN0pRckVB?=
 =?utf-8?B?RDlqb3Vpelo2Ui9tZXdMV3dqZm95WWxpT1dFMDArNENPWXd2VFAzZ2wzWnZ4?=
 =?utf-8?B?cnNqMGQxemdFTHNFdERXMWlyd3pwWGF2Mitad0M4RmxUcGIvL2NuR2hZZjZs?=
 =?utf-8?B?dHIxa1J6WUNoRHJvSmpza3FJN29pSjA4a0xYS1puak1Uc2VmbEdkSFlwemYy?=
 =?utf-8?B?M2h5VFdDOHJXNWM2MkZpTEd3WUwxUWNwQVVKNkF1NUJzK3JEZnZlYkdnNmU1?=
 =?utf-8?B?cEE3YTBUVlJpUjF3VnlMUGN4OG9qQ3BrY1VqbHdPZzY4THNVZUJzcDNNU3hN?=
 =?utf-8?B?QVBmTVlsUU9HYjlHb2RXWmgrRjBxckErbkNxQnJJcUcvN2UrNldNZUY3Qys1?=
 =?utf-8?B?WFZyVlFHRjFCcUE5c3BYZm56anViOE5CV3BtU3hwclc2MjdnZGUxZ1RFbzFN?=
 =?utf-8?B?WXBpUWljMlRKVVR6YTIwWWV1aHpjeGZzNWdKc1V0N3Rjc0kvSG5UYkZuN1pt?=
 =?utf-8?B?bUtneWgvU1REeHpwRzJxVkExZElyNi8xZTcyTithckpad1pVbGx5RUpjSHRG?=
 =?utf-8?B?UGtvYkJ2NWZpQ3k0RlRPVmI2eUFRemNEckpRZy9DSFZ5Ri9rd05MNTVUTlQ3?=
 =?utf-8?B?SEl3aXRlQ2JGYXhkbkxyYi9iYlN5aWIwUGM4RzJOc09KcmxWc3c0ZkphTVlq?=
 =?utf-8?B?VTR0Y2hvc3lWS204UTJnQ0ZqM0JveDczbzNGZUJFOGdBRWh5ZE5LdWJkalg5?=
 =?utf-8?B?Z01zSmVDQzRPSzFzbW1iSTZCckhLMDZpWHg0anBoUDBiakgrYXlxOUl1RmYr?=
 =?utf-8?B?NDNMcy9JR0JIWnJjek54cW5wemJEOXYvR2ZKSWhJRm14Z2ExbGxDbXJndGN4?=
 =?utf-8?B?QnJhQUNzNDRlNEdiV1dxMW5RVHJSbi9peWhJck5Cb1dod1BmdHNsT00zVFd0?=
 =?utf-8?B?amdSU3Y5RDJBSmxid0YzdmErcTErSVdKdmZ4VUhoUUs0M3kzbEljTWtyN1Fn?=
 =?utf-8?B?RW1nSmFYa0VDMVdFOURPS29iUE1uYmNDQmFWaGlPclVtS0p5eWhWVXZvZFlv?=
 =?utf-8?B?RWdTbjZFMXpBcFVuTDNhZW03NWVKQklGN1pURHordXNDaUNNdm13eDJza3RE?=
 =?utf-8?B?TVBMRVpvanZuRnhKRzQrN0Nwd0lHcG5Ec3VvRDJNc2lvQmc5Z2RZbVFmdVVp?=
 =?utf-8?B?TG16TkJYL1FPQ085N1doWERScTB2Mk9WUjB0NFloN29jdWpxa2NqeEdlSDN2?=
 =?utf-8?B?Y1JEUFR0akQ0ZmxsQVNkUFBpazJCWXlYTVVZUmpCbURVNVBNYis0c2dDaHY2?=
 =?utf-8?B?MEhIdjhSUUJNNksvMGl5cTR0TGR1SzJDZGl5bVhXSHpHdEk3SVNzSjBpdHg4?=
 =?utf-8?B?UEw3Z1BwSnlhZHcwejJMV0o0cjJrWW5SQmpEcDRUMnl2MlZWN2lRNnNuaGds?=
 =?utf-8?B?K2tjc1o0TmQyRlY3ZTNFc2drbzZmS1o5aDFUc2ZnSU1iM0lDODRaaVRJbVF0?=
 =?utf-8?B?R004d05td1AxQjQxZjlGVHZYRTFUblZ6STdlbCtoSXJHZWZpZ0pIckMxaGFx?=
 =?utf-8?B?eTZxcWszN1pDeG83bDlGakViOW85VWFIRFhmN2hoQU91NVpiVzFUREUyUkNH?=
 =?utf-8?B?Z0EyZW5aMndkbXptaWU4SlZ0RFRQaEtlNWJ0SVBkYUxwZTE0NENXUkF5czNJ?=
 =?utf-8?B?WmRTRU9rbzZ2TXB6U2RCTDdGcDh4bEZocVZjQWN6TDhCbWZtbHB3WXVjQkcy?=
 =?utf-8?Q?tFvs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 15:09:16.5129 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbed043e-f371-4435-7a4d-08de0feaa31d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3520
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=68f650a2 cx=c_pps
 a=xsPRXSxgE/lgwrq+xqasSg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qhru8l5LelLHS_U87ycA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX7/6Td0ZH/xj2
 7Zv36dFH+LhPiSFBIggmXycnQx62EdmFJaa2dzR7r+qaFc7DuJxqh7jx2jeU0g9Axzv/WMkG0Zw
 ACFE4G3C+MWvneJGSwKvaxmfOcGhUo0CEoJZEkI2fXPrTIKvllxygbnJQk1sutpj4Br7Gvr5Bp/
 kqlRbdl6+OPKcoMXEqJRJAhG7VIhoOBvvia1RXY3huLHLiwrkO4HXvwwOahI3Ha+8z2ohTSvvam
 6V2efNl/WFN5Hk7vLcFa30wqQd8xSSfJxOg0eGAXEO8vstgsN7idi5mzNzz2Ph5XnEQQ3juY9M9
 d99iDSpb1GWJZte/cBnJVBGjQF09D10eaZAyJ94uXvo0GtkByhn8KlQZlcIrDmeevHbUhx4DYZv
 W9RxhjLow661fnaxe4QQ3MozR3UTzg==
X-Proofpoint-GUID: 6l6Dgx20Lv1EaL0eQpGs-jJkuc11O7ao
X-Proofpoint-ORIG-GUID: 6l6Dgx20Lv1EaL0eQpGs-jJkuc11O7ao
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180018
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v3 09/10] dt-bindings: pinctrl: stm32:
 Support I/O synchronization parameters
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

T24gV2VkLCAyMDI1LTEwLTE1IGF0IDE1OjM1ICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4g
T24gV2VkLCBPY3QgMTUsIDIwMjUgYXQgMDI6NTY6NTZQTSArMDIwMCwgQW50b25pbyBCb3JuZW8g
d3JvdGU6Cj4gPiBPbiBUdWUsIDIwMjUtMTAtMTQgYXQgMTk6MTAgKzAxMDAsIENvbm9yIERvb2xl
eSB3cm90ZToKPiA+ID4gT24gVHVlLCBPY3QgMTQsIDIwMjUgYXQgMDQ6MDQ6NTBQTSArMDIwMCwg
QW50b25pbyBCb3JuZW8gd3JvdGU6Cj4gCj4gPiA+IAo+ID4gPiA+ICsKPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgIHN0LGlvLXN5bmM6Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZGVzY3JpcHRpb246IHwKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgSU8gc3lu
Y2hyb25pemF0aW9uIHRocm91Z2ggcmUtc2FtcGxpbmcgb3IgaW52ZXJzaW9uCj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDA6IGRhdGEgb3IgY2xvY2sgR1BJTyBwYXNzLXRocm91
Z2gKPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTogY2xvY2sgR1BJTyBpbnZl
cnRlZAo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyOiBkYXRhIEdQSU8gcmUt
c2FtcGxlZCBvbiBjbG9jayByaXNpbmcgZWRnZQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAzOiBkYXRhIEdQSU8gcmUtc2FtcGxlZCBvbiBjbG9jayBmYWxsaW5nIGVkZ2UKPiA+
ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgNDogZGF0YSBHUElPIHJlLXNhbXBsZWQg
b24gYm90aCBjbG9jayBlZGdlcwo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICRyZWY6
IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMgo+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGVudW06IFswLCAxLCAyLCAzLCA0XQo+ID4gPiAKPiA+ID4gSSByZWFs
bHkgZG9uJ3QgbGlrZSB0aGlzIGtpbmRzIG9mIHByb3BlcnRpZXMgdGhhdCBsZWFkIHRvICJyYW5k
b20iCj4gPiA+IG51bWJlcnMgaW4gZGV2aWNldHJlZS4gSSdkIG11Y2ggcmF0aGVyIHNlZSBhIHN0
cmluZyBsaXN0IGhlcmUuCj4gPiAKPiA+IEFncmVlIQo+ID4gSSBqdXN0IG5lZWQgdG8gZmlndXJl
IG91dCBzb21lIHJlYXNvbmFibHkgc2hvcnQgYnV0IHN0aWxsIG1lYW5pbmdmdWwKPiA+IHN0cmlu
ZyBmb3IgdGhlbS4KPiAKPiBwYXNzLXRocm91Z2gKPiBpbnZlcnRlZAo+IHJpc2luZy1lZGdlCj4g
ZmFsbGluZy1lZGdlCj4gYm90aC1lZGdlcwo+IAo+IHBlcmhhcHM/CgpTaW5jZSB0aGVzZSBhcmUg
c3RyaW5ncyBpbiBhIGN1c3RvbSBwcm9wZXJ0eSwgSSB0aGluayBJIHdpbGwgdXNlIHNvbWV0aGlu
ZyBsb25nZXIgYW5kIG1vcmUgZXhwbGljaXQgZm9yIHRoZW0uCgpMaW51cywKCnBpbmNvbmYtZ2Vu
ZXJpYyBvbmx5IGFjY2VwdHMgcG9zaXRpdmUgbnVtZXJpYyB2YWx1ZXMgZm9yIGJvdGggZ2VuZXJp
YyBhbmQgY3VzdG9tIHByb3BlcnRpZXMgaW4gc3RydWN0IHBpbmNvbmZfZ2VuZXJpY19wYXJhbXMu
ClBsdXMsIEkgaGF2ZW4ndCBmb3VuZCBhbnkgZXhpc3RpbmcgZHJpdmVyIHRoYXQgbWl4ZXMgcGlu
Y29uZi1nZW5lcmljIHdpdGggY3VzdG9tIHN0cmluZyB2YWx1ZXMuCkknbSBnb2luZyB0byBleHRl
bmQgdGhlIGN1cnJlbnQgcGluY29uZi1nZW5lcmljIHRvIGhhbmRsZSBzdWNoIGNhc2UuCk9yIGRp
ZCBJIG1pc3NlZCBzb21ldGhpbmc/CgpSZWdhcmRzLApBbnRvbmlvCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
