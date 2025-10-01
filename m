Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 611FEBB0BBA
	for <lists+linux-stm32@lfdr.de>; Wed, 01 Oct 2025 16:36:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 58A15C3F95B;
	Wed,  1 Oct 2025 14:36:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 66162C3F953
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  1 Oct 2025 14:36:42 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591DrQcZ021441;
 Wed, 1 Oct 2025 16:36:25 +0200
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49e524h2j1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Oct 2025 16:36:24 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAwIfZin+2Esd7X3hoHCymuUP71cVYefrmmYjSHl2BHzeadB/vsvGl13kseSbAyh9wlqYB7ylSbJXeB3cOpEUBDDV/jLzVSizUhytpdrWZnjLvxzxlZmlQxssBp/JfKSsVVNXFqiRMfsRsswpoetrW4UGcgBdat9OoL6BMwo8W6cWffPa9AqehIwBmUgWDkZSUWUIXeQdRPB5AOJfOtc5ZPGZcC428QIf8Cqm2mhexIDHGMwwIP+9MoFsb7HyJPEs+FCujvpmf6TYMpWNbZdTyb2ZS78oGE5z3lvu9pCN4d3LvVMLAB//Mcd5ZW84icooKYnlOjNvEnXNHRsZZaSjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxNDHWI8EtKOnLxTbDP0hDXAvrPsTnRC88/A9UjlzP4=;
 b=gEQemhmIDamliEjg2V4WhsMVieewY5++gBan6a091bZlw3YsBBVMVGvXnbosm/ca2X/abROmMtHTCHVNfiIMWCVxZqlLh15r/FJSJ5AXSJ9fkPSCMxgXhIORP7a9gXWykUHzFVyoYpvxlpuE2yphYrdgRHmnPMtHfE1n5/hyhTaypkaXfFZCcc/6H52cgrhcnI/O/XPTen3wVhN12NW88v6GArdYO+gczhq4U2vpNJs+aNVApoy6tiizPj4DG1curoI/EJvbK5twfaAh4cTePeE2DW8OX9bd3veo32lBe7o51dJv4+d4DO3dS/g9f6xhMZssq0yS+KmHLWbvBdVU2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxNDHWI8EtKOnLxTbDP0hDXAvrPsTnRC88/A9UjlzP4=;
 b=S2qTgDK1wfwiuAiiIujiwMFIh8PzFIw88xmbUJN3Luw/kX84Qq+olwjX7ELCrjBjIuVWfzosYfRu7JdwoQpIcoaxavHFvXVfa5I8jz4qiclKg+fZR2kBc+somR2plUDQ0C/ufEKFpLqw1tE/rtQae6m6tGqX1O9eP5qURKxXbufp4XqHWOKr5j1Eos426+ORLqYJx8L/6g2ebB0HCddRzZp8dAk4MlBTUbHS+9gTaRDDVsAAgDPMZlhPhqFR9XDfsu4QtnB9FWt1ePGBtYDVQvyHcR64FHL8jq8DtXXlurDz9xkOIXLAPcSj67YRh/vQwZ786LG7HSbsOkiLlrT8/g==
Received: from AS4P189CA0067.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::25)
 by AS8PR10MB6889.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 14:36:21 +0000
Received: from AM3PEPF0000A79B.eurprd04.prod.outlook.com
 (2603:10a6:20b:659:cafe::d0) by AS4P189CA0067.outlook.office365.com
 (2603:10a6:20b:659::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Wed,
 1 Oct 2025 14:36:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM3PEPF0000A79B.mail.protection.outlook.com (10.167.16.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 14:36:21 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 1 Oct
 2025 16:34:02 +0200
Received: from [192.168.8.15] (10.48.86.11) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 1 Oct
 2025 16:36:18 +0200
Message-ID: <4de485fc717a1b469979c32852f58fa3c4b20607.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 1 Oct 2025 16:36:17 +0200
In-Reply-To: <CACRpkdZCKXYEegV1cK6X9A9k8ORLWweBQs40PWYuTof3JgcC2w@mail.gmail.com>
References: <20250905135547.934729-1-antonio.borneo@foss.st.com>
 <20250905135547.934729-3-antonio.borneo@foss.st.com>
 <CACRpkdZCKXYEegV1cK6X9A9k8ORLWweBQs40PWYuTof3JgcC2w@mail.gmail.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.11]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A79B:EE_|AS8PR10MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: a77cbd00-4a7e-4992-a7c2-08de00f7e419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWJCbzNqdHlTenkxbHdoZktFd3pCaHlpdFJYclR6N2hTSmFpODREYlNPZnZ3?=
 =?utf-8?B?MUJGN2RoU2l3ZGJUSDhHU0o4ejhxT3J1Tlc4ZkxYNDVkWDlxQk9hVmdYUGN3?=
 =?utf-8?B?YWRNRStjSERBV1lMaGtvSy9kNEdTYjZER1BSeUs0TUhHNHFZb3FUSlNvd25t?=
 =?utf-8?B?ZUF1bUJUUzFhR05MQkYzeElmNGEwK1hWOHRNSnR2djA4T0cyMXpDV3NWNTBJ?=
 =?utf-8?B?Y01WU25zcFlmMmhYZUZzSkFPT25GU1hWOUt5RFFMUVZHbTdSd29vbFpDVFlF?=
 =?utf-8?B?YWxTT2xSNkFZcDJmL1BQQmFRU28vVHZpWFowRGk3QlQrbTc5aFdua2NxMXhn?=
 =?utf-8?B?VnVEV1FTcEkrNVNuMmY1aDMyNzRZS1QzQ01hR0EyNzIxd3ZTYlAxV1kzUTVw?=
 =?utf-8?B?bTFNYjlYa2wvL1kveXBTK3pOVWFKRGxLK1JXZUxHL01ldzZ1OUVwcUIySXFa?=
 =?utf-8?B?ejNEZ2Z1M1FXa0FLSWFxbTM2WXIybFFiRmZacTBTNEJxdzU5b2t0MWcvbzUr?=
 =?utf-8?B?aTFtem9JaVpVTmFiajhnQ0ZaNVU4cEp6V2t0UWVGRHpieTZqaE5xVTJ5cHN5?=
 =?utf-8?B?eEhkeC9vbHdTSnozb2NlWFhZbWhJSE03aDZvMWZCY1RyVjRpT0FYdUN5SzVL?=
 =?utf-8?B?VGR5ay9jK1dzM1ZYWDVORHdRczVEMW84N1FLcFVPRlViQU9VanJkQmRLUnV1?=
 =?utf-8?B?SDJIOGhkWk16TDRqWGUzc2FtcDhxYzRXbGFtZGxpZ0VVRVFGdUFIVWlaSUhk?=
 =?utf-8?B?blRTczBZa3VEMEpHQ1FpMXM2aUd1VHRJWkxXTlI2WHZTKzY2ekNQN3k3T1FI?=
 =?utf-8?B?aVFLcWM0L3V4eWxIUGI4c3hkZzd5VUY0RnRGY0hqaFdEN3FtSjR6Z0ZLbGxT?=
 =?utf-8?B?cmpIdmFWL0w3MllXTWI4djI2OFJJUmV1d3dVTmRtN1FaTVRZUDVPd1ZKV3o1?=
 =?utf-8?B?Y2hxZHpmOUY5WnlBOVFGdGw1enEwQlRNQ2FDR01GVk1MZzJWRTd1NTF6T2tq?=
 =?utf-8?B?WWw1TS91RjlMSWxqRk01eDdEWU1kMURoRTJ2UE5TNkRENzhEUFRUa1hCNXdQ?=
 =?utf-8?B?SEM5OXRzbHZBZUtKU05SNENFbzdnRFdGVVFHcEhWdmNnSkRlbmpIcllOSlpa?=
 =?utf-8?B?empTVEMrbnRDVHQraUZabUh5QmRueE5YZ1YxLy9nN3hRMnAxT092TjU1Nml6?=
 =?utf-8?B?MEJkQjR2bWdJdUxkblBRZW1OQXJVc3F3NkZjaDJocGxzY213T3V3NWRSS0R4?=
 =?utf-8?B?blhGOUdNdjdUbHhPTHVwZUVaVnhJY2VXS0ZMQWw2UEhHUTVzRXAxcmNLaXRa?=
 =?utf-8?B?YitBdkVYd0kzTlYreHdzMmtvQU5rQjN0cXRqZWxTbkZlUURGNU9OcjhZNG01?=
 =?utf-8?B?TWNqbFg4MGZZUm9PQmJjOGUrNUV2K2s1UVN1M2lTcWEzVzlQc3oxY21ZTjFZ?=
 =?utf-8?B?L2t5STI5OUp0RFEyZG9SMnNPYzE1QlhyNlNldUlLRkRqeXZQK3pBdjJzdFl6?=
 =?utf-8?B?dHM1YStwMW11Qk9qNVR3R3FjbC9ZZ3lvVnVYSm5UT3EreXBuSGlzYWU1VEVV?=
 =?utf-8?B?ZGJja09adCthdXRvRUtxSjU3cHFVUi9BOGVpTjlFTXFNRDFvWkh6MFhMbjVO?=
 =?utf-8?B?ODNqMy94K2x3WE1KejJRbjJSYnloaEhoQTJsQWtVUHhQejIrQjRBSkxPTStC?=
 =?utf-8?B?VndmL1h2OWpjZUwvbDZqcHhMamFxKysxdjEyR3J3RXJDeVdEYk9mMjBiR1ps?=
 =?utf-8?B?d3JJNW5VbkJHQkFXQm1VLzZHTGc2S0crUHRvYXRjOVhDdjhjdWJkbnlNeXRC?=
 =?utf-8?B?bmlQNktJaEw4akgvckt1UGMxQmRTeTFkMmNJMThZUndJV0x6eldGTVFmbnJy?=
 =?utf-8?B?dTFIUUdGT0FYelpwNzdvQzNtN09lZDc2eVpXV3BGZHlXd3hWK1pNRjFqL1gv?=
 =?utf-8?B?TDhpZ3BjUkQxY0tTSVJVUDVya3RaUXd0Ly9lV0N0M3pEbjFrdnlSeGgxTEF6?=
 =?utf-8?B?cGZPazBHbkVJK05QajdGL1BiakhJQU5IcUNzTjBYRWxCQXV2YlpGYndzMG94?=
 =?utf-8?B?SFpuckdSM0h0SFhMMjFVM05NeXBKS3I3V1NSQ0VCVlZKeHlOQzZ2SWJES1Qv?=
 =?utf-8?Q?POiM=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 14:36:21.6070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a77cbd00-4a7e-4992-a7c2-08de00f7e419
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A79B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6889
X-Authority-Analysis: v=2.4 cv=HqN72kTS c=1 sm=1 tr=0 ts=68dd3c68 cx=c_pps
 a=pFRPcDjQwgjs8gOseP4dhQ==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10
 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8 a=jL_698374_RyKRYFt48A:9 a=QEXdDO2ut3YA:10
 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: e3VXBdg0JwODfQInJKe2BnH28_VwXHgE
X-Proofpoint-ORIG-GUID: e3VXBdg0JwODfQInJKe2BnH28_VwXHgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDIxNiBTYWx0ZWRfXwOg2jvkyBECh
 rFy21pF2OcVednRGhxkVrrqO82qwaaoTR4XMd6XbbgFmnIvhbk4sgqzGqRmNwtvSVG4Fydsf9XU
 vohGNBgmNDbZu4l/fT0//K4CNZYchesU+v7NCNl/sNFGpyeu87VTo92UP/Ut4LmphryiQ+5ij48
 6iGio4iMBeCKXMXbkfPOMS4zXvMmP99qr9zPJRF5WefomHhrI1otm3KKO5OUqOopQeFc1IwZzM8
 +4AQxaO4bLcIjCygHENi2RYsotfL901cLj0d4nj5+DE+jYK2YCW6QLDibJ0z1zLH6tpCYuPAzQf
 pzHuAdflkyjHk+eXGSg2/OcIi8MUhU3VCNZhzuOSZxJXMzP5NduwizNTxJqb/gqlnFEH9awg0nQ
 YdtWbFyQT/ke8nhxAxdns+5cLzPvnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509260216
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Christophe Roullier <christophe.roullier@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH v2 2/9] dt-bindings: pincfg-node: Add
 property "skew-delay-direction"
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

T24gVHVlLCAyMDI1LTA5LTMwIGF0IDE0OjIzICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOgo+
IEhpIEFudG9uaW8sCj4gCj4gdGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+IAo+IEFuZCBzb3JyeSB0
aGF0IGl0IHRha2VzIHNvIGxvbmcgZm9yIG1lIHRvIHJldmlldyBpdCEgOigKCkhpIExpbnVzLAoK
bm8gcHJvYmxlbSwgdGhhbmtzIGZvciB5b3VyIHJldmlldyEKCj4gCj4gT24gRnJpLCBTZXAgNSwg
MjAyNSBhdCAzOjU24oCvUE0gQW50b25pbyBCb3JuZW8KPiA8YW50b25pby5ib3JuZW9AZm9zcy5z
dC5jb20+IHdyb3RlOgo+IAo+ID4gQWRkIHRoZSBwcm9wZXJ0eSAic2tldy1kZWxheS1kaXJlY3Rp
b24iIHRvIHNwZWNpZnkgb24gd2hpY2ggcGluJ3MKPiA+IGRpcmVjdGlvbiAoZWl0aGVyIGlucHV0
LCBvdXRwdXQgb3IgYm90aCkgdGhlIHZhbHVlIG9mIHRoZSBnZW5lcmljCj4gPiBwcm9wZXJ0eSAn
c2tldy1kZWxheScgYXBwbGllcy4KPiA+IEZvciBiYWNrd2FyZCBjb21wYXRpYmlsaXR5LCAnc2tl
dy1kZWxheScgYXBwbGllcyBvbiBib3RoIGlucHV0IGFuZAo+ID4gb3V0cHV0IGRpcmVjdGlvbnMg
d2hlbiB0aGUgbmV3IHByb3BlcnR5IGlzIG5vdCBwcmVzZW50IG9yIGhhcwo+ID4gdmFsdWUgJzAn
Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEJvcm5lbyA8YW50b25pby5ib3JuZW9A
Zm9zcy5zdC5jb20+Cj4gKC4uLikKPiA+ICvCoCBza2V3LWRlbGF5LWRpcmVjdGlvbjoKPiA+ICvC
oMKgwqAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4gPiAr
wqDCoMKgIGVudW06IFswLCAxLCAyXQo+ID4gK8KgwqDCoCBkZWZhdWx0OiAwCj4gPiArwqDCoMKg
IGRlc2NyaXB0aW9uOiB8Cj4gPiArwqDCoMKgwqDCoCAwOiBza2V3LWRlbGF5IGFwcGxpZXMgdG8g
Ym90aCBpbnB1dCBhbmQgb3V0cHV0IGRpcmVjdGlvbnMKPiA+ICvCoMKgwqDCoMKgIDE6IHNrZXct
ZGVsYXkgYXBwbGllcyBvbmx5IHRvIHRoZSBvdXRwdXQgZGlyZWN0aW9uCj4gPiArwqDCoMKgwqDC
oCAyOiBza2V3LWRlbGF5IGFwcGxpZXMgb25seSB0byB0aGUgaW5wdXQgZGlyZWN0aW9uCj4gCj4g
VW5mb3J0dW5hdGVseSBJIGRvbid0IHRoaW5rIHRoaXMgd2lsbCB3b3JrLCBiZWNhdXNlIHNrZXct
ZGVsYXkKPiBoYXMgYSB2YWx1ZSwgYW5kIHdpdGggdGhpcyBzY2hlbWUgd2UgY2FuIG9ubHkgc3Bl
Y2lmeSB0aGF0IHdlCj4gd2FudCB0aGlzIHZhbHVlIHRvIGFmZmVjdCBib3RoIGluL291dCwgb25s
eSBpbiBvciBvbmx5IG91dC4KPiAKPiBXaGF0IGhhcHBlbnMgd2hlbiBzb21lb25lIHdhbnQgdG8g
Y29uZmlndXJlIGRpZmZlcmVudAo+IHNrZXcgZGVsYXkgZm9yIGlucHV0IGFuZCBvdXRwdXQ/CgpJ
dCBtYWtlcyBzZW5zZSEKCkkgd2lsbCBhZGRyZXNzIGl0IGluIFYzLgoKPiBJIHRoaW5rIGl0IGlz
IGJldHRlciB0byBhZGQ6Cj4gCj4gc2tldy1kZWxheS1pbnB1dCA9IDx1MzI+Owo+IHNrZXctZGVs
YXktb3V0cHV0ID0gPHUzMj47Cj4gCj4gU28gdGhlIGRyaXZlcnMgdGhhdCBuZWVkIHRoaXMgZXhw
bGljaXRseSBzcGVjaWZpZWQgd2lsbCBuZWVkCj4gdG8ganVzdCBkZWZpbmUgb25lIG9mIHRoZXNl
IGluc3RlYWQuCj4gCj4gSWYgeW91IHdhbnQgdG8gYmUgdmVyeSBkZXRlcm1pbmVkLCBtYWtlIHRo
ZSBzY2hlbWEKPiBub3QgYWNjZXB0IHNrZXctZGVsYXkgaWYgZWl0aGVyIHNrZXctZGVsYXktaW5w
dXQKPiBvciBza2V3LWRlbGF5LW91dHB1dCBpcyBzcGVjaWZpZWQuCgpTdXJlLCBJIHdpbGwgYWRk
IHRoZSBwcm9wZXIgdGVzdC4KClJlZ2FyZHMsCkFudG9uaW8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
