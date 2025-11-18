Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D8BC6A929
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 17:20:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3086EC62D2D;
	Tue, 18 Nov 2025 16:20:31 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD3D0C62D20
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 16:20:30 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIGEdYC110440; Tue, 18 Nov 2025 17:20:03 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013064.outbound.protection.outlook.com
 [40.107.162.64])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4ag6nwcvvy-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 18 Nov 2025 17:20:03 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ls5+u23SgFZf8qfCq1gwD88ZJlcHiBtjIAaKe9/dKbFZJTCZwhIyzRG0Nlf/MTUhuP5Tb1ywxzCbG2iAFaOkR109V/ZJYwLVige7cWUOacH1gNw9G/hA3x7iVhjJSoHA+WUuSobjLEIRfoIaxl8YkMMJHkyVQlnrsunejRfMKhF+rskGK+/ei+WsP7XR2sf0oEALdJWXcEM1/RCzJSANSLni43S0z1mQ3onIpTGtWeaMQLFuUBG+tMzv+CbCgPaskyo9kHraWXBu92Hq8cee+wJWFjDeTGQGmkwiH0Z7FyWYgiktDzJ5YqoB9ea699HapB6vpk9utSa5ZeOxc14/UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gEUSJ369ZE/fjnvdQQLfXnc21qQDrcb+lnKO5lvABg=;
 b=CY+EYeyuKVxYVw3fgOKjL6GAWF087HhuUM97wh2x6Z/30fu0FC+8UvmxvRnbSddnN0Kpw/DlU6V+LD2sJxNGgUP2rjJt+oYIr6bbO3UHSUVWXG8WkzRfzX16+o9Jbu4jfFJQc/4NMoi6VP+3TKK1DLxg5uwZHX5mBXeUoctSm/GzAoiOxR7GMpiVSW8xbcQB+opLVizqO+8BUDWXURWT7nTwXiHGHQ8LKNj18mTziB+6BN7fsZn1dNv3Y5D6wVE3js4TyOKyzgaBe81UmYJIjUdVr4MqEcovvCK39I1+/NLHGqoTYqZimfouAkR82gEMd+xBkibie5qDU/p7umyKNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gEUSJ369ZE/fjnvdQQLfXnc21qQDrcb+lnKO5lvABg=;
 b=ozGyr2/SBCgkqmEBUnlCBgSYiB9AcW4A9NM78XzmTSDS2Q7gc3ZMkesHY0ouIgxQPpnAZ/S3LW99ISnCkOOeBW6hfaSwgFHLXDu85LZXyV7wCTiuSvZX2bHCUujgNquAvfJ1mZtJG8e9wWgDFGV5Iwj1ka+h8R4fn+lE30WpXwBUaPSnwMF2UmU17avEAQXO98EP+l0VVyD8pqN8jk4DJjHtG+DJ23CcjPBUpYm6Y0QbBwe86vl8ZgurOvUnO7dw9jXUKfJZ3U6fDmLUyxYGiLtxeiYpphn0K/9oLKrYv2S9Zi2YTmiCOwO/d1J5yuLCEXc166WIqbNdkbFxiv8Xpg==
Received: from DU2PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:10:232::15)
 by PRAPR10MB5177.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:29c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 18 Nov
 2025 16:19:58 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::4b) by DU2PR04CA0070.outlook.office365.com
 (2603:10a6:10:232::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Tue,
 18 Nov 2025 16:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 16:19:58 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 18 Nov
 2025 17:20:02 +0100
Received: from localhost (10.48.86.11) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 18 Nov
 2025 17:19:47 +0100
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 18 Nov 2025 17:19:28 +0100
Message-ID: <20251118161936.1085477-8-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.11]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922E:EE_|PRAPR10MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: f2dbab0b-a6f8-4a9f-17a5-08de26be516b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nm5rbTZFc093dlMrSlZZVlp6cjlkdklWbWdReUZrcmM4cTRTemVUNnE4SFh1?=
 =?utf-8?B?K0U2ZHE5ZkU1MU9ScUdHbUprbDFIcXJlWXk5c3crU0x6TGRFK24wUzU5VHFY?=
 =?utf-8?B?WXBENkNmck5rNksyVlRnSkZuZVNXN3VtRDBVU2R1Tll4TFFRTURHa3RXTjlU?=
 =?utf-8?B?YkNzZk1ObG93QXNoMjBjZ3dzM1BhSjRqZVRCeU9ZZkN3MHRTaG05Qmxwanc2?=
 =?utf-8?B?bnJEemVnbVpGSjA2V2g2Y0dvNDNRVFFnR0xWVENkOS9MaVhOQmcwZEFHOWZK?=
 =?utf-8?B?eHBEbklDZVE4VGJaRVZqRUpxT0xlNUZUc3hpWXhTcHQ3NmxYVDZOMERlb2xL?=
 =?utf-8?B?bmZjTjFmQzhGQkRzRU9kdk5ML2p5TXFubHEvU2w4U0w3eVZnNlhBMGtuZFNt?=
 =?utf-8?B?RlBLa21nTk1XK1RyRlV4U1ZQQXpKa0JTdlR2Z0I5NGc2Y1dUM1N2YjZ0Yk1i?=
 =?utf-8?B?Mko2dDBQOEZzeFRsdlM5S2hlVXhyZk50SG9UTUxzUVJSeWw4b20rSjVDUGVz?=
 =?utf-8?B?cHIwOE1jMjJmWXcyTXNWVVdmWGJYaUF6RzdCT0lodUNGOCs3KzBHZWNZRCtY?=
 =?utf-8?B?YTVXTU4rSjhpMGwxbFRUWU1uY2pLMTF6aFFmS1NDZG5aYjRaU0ZrcVdrTjVU?=
 =?utf-8?B?VndyemlWeStSUTluNDh4SXFwMis5Q1NjeEpiVytBYzBEQmx1SXp1NUVKT0lL?=
 =?utf-8?B?aTgyWkE4NDZjSzQyd3NSQ0s1RkU5Q040anZYUkFuM2VuTFZveXdQRTN4S0pk?=
 =?utf-8?B?UjV6YWJSSXRrM0U5WFJJbWpMb2c1aEgvUWl4T2d3K282YUhtbFVadHI2U0dv?=
 =?utf-8?B?ZmRSUjIxS2ZKaWs4ZzVJQzd0bEladGVRTG9TcGFkc1NuYlBSQnFnR1hzd2ZH?=
 =?utf-8?B?K1I2S2YydGlnMFk2bVdCd3d4MVJWT0hMZWkwN2UrT2o0eldWdVB4Vi8xUGpO?=
 =?utf-8?B?TUpkdFJuTzlUVjQxVlIvc0FFNEVmQzJsbUw1QXlyWUZ0c0NibDRXZGlxSDRx?=
 =?utf-8?B?UG5FaStzZHpIVzRPT1IrSTNnOUFjUDVKaGlzb1JuV215Mm44dDBGd3VVYjJ4?=
 =?utf-8?B?NHJPZWxoQyt4d0Z5bTFUOWw2cEh5Yi9rU0lPTmVyYjhrVnpUZUg1ZWllaWk4?=
 =?utf-8?B?UkV2eGhWM2JFczIxcVFsSjZwVVBRUll2YVdrdEQ1UU1yOThFdkhkM3pUbWlX?=
 =?utf-8?B?RnRUY3E0bGFTK3l0YW04WHpudm90T0JPSkR3MmxhMy9lb0ZVZ0tBbTNlajM3?=
 =?utf-8?B?dDBqbittRFRlaVhoNCtYMzlyVGpPRFNyVGNGV0l1a1JKNkxjM1hQaXU3U3Rt?=
 =?utf-8?B?akVZQUltcGZsendySXdJZjNJU1VoNUxwb2FrSUVsVW13R1Z6eDhCcWw3MER1?=
 =?utf-8?B?Ris4cjdOSk00SFpKbXo2d0VqV0lmczArNXF5MjV5OFBIdG5JUkdUdjNyajlE?=
 =?utf-8?B?bVRZTncwc3V1RXB3b1ZHUjdBdFh4dmpwdW1jbWc3MzZCWFQyeW9IZlJmS1BZ?=
 =?utf-8?B?dENMSW9oM2U5SmlTbHFVdGlDc2xPNGp2K3ZuUGtvd01Fa2NOTFBDOTFuTzM4?=
 =?utf-8?B?dzdjcFFYK1AwNmVvM3NuUWY3MkZCYUdtUjEvNXJZN3luektuQnNqaUlVcTlM?=
 =?utf-8?B?aGpDTGRUVSszRW0xdFU4YkhxN2xFcWhoOG5OZlQ3Z1BSZndHVHI5NEI2SDB5?=
 =?utf-8?B?VGVYb015WWxjblRoSU1VZC95WlhZQjJXTEZZNVEzRUtMQW1WcERtZWlsNzZK?=
 =?utf-8?B?K1NHQ3VPeTBrRmxNaEdYQjk4RHZCUkFsbWpML1l6c0xxckM4aEZOaHNFUkpB?=
 =?utf-8?B?SUpFQm9SUzNNb0ZOR0dHV2xZT0EvVkVvU2pBN0FQRDF4TzdRY2l1a3R2aXJ5?=
 =?utf-8?B?aVI0aGs0RzEyYWxwNTBEdmNrd21HU3ZYOXc5ZnF4QVFaMWJwS0IrWWpZZElI?=
 =?utf-8?B?NnNLOGJBWDVYcFVKNS9YaXM0OENvdGx4bUZiQ05FWnh0SjlVZ1V2bG95MUt5?=
 =?utf-8?B?QUxRd0daWVNIZXBhU3JwdzU3K25WQW1TVzV5NkxiaWFFaW54RDdUOUt6ZFRT?=
 =?utf-8?B?WTZrZGVvV21uQy9NTVdkOWNQVFVXcHFaeEdxZlI0RC9LMGxVYXhZSy9abTAy?=
 =?utf-8?Q?w3xI9GBp2XhY0j7xCK7nZD0TQ?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 16:19:58.3635 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2dbab0b-a6f8-4a9f-17a5-08de26be516b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5177
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEzMSBTYWx0ZWRfXzVT4+VK/gZBi
 Wf3b/Ch+EBrr4u7Fs4yOHtSjC4g8JJSFsFOLzLIbHVEMo5FXZBBnSHIQx8axpegETZbU34oSLAR
 f1ql+j56KzmYi27BMlI/dvO6WadM5xBPeohUqYJ3q7W40tiJWGPY7+bLfI6WiAGSgU5bGgoEP3C
 2C/3S9IaH3XJWL4cqJ+AV2eB2HppsnwNTpFPBrQGOsAP1wlW5ZSCNa/fmKe+X7Oackl7dLmGVXo
 OwApHBS81BbjiIpgTuu3pIu9TB0vWRXUBJPkHOEWZQ32tzieV8bOgn8Dk5PGWcWhygdGVwOg6f6
 7QID0+8ue42tn6311o5wRtazh/Ab1NimmzUgpX0RdB2q6+AkPZ6TracurEDaJPtOSAB1EagvBwE
 1HKEpSn3UI+yaa1mLSc/UwxxLv4PNQ==
X-Authority-Analysis: v=2.4 cv=WPVyn3sR c=1 sm=1 tr=0 ts=691c9cb3 cx=c_pps
 a=G/Epo/7toeqeP4Tpj4wtjQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=cea_NRQtgjPfc7EDbk0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: sPxlp6XPB5LoyHYNkIywmynJq6nKl-eg
X-Proofpoint-ORIG-GUID: sPxlp6XPB5LoyHYNkIywmynJq6nKl-eg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180131
Cc: Pascal Paillet <p.paillet@foss.st.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <legoffic.clement@gmail.com>
Subject: [Linux-stm32] [PATCH v2 07/15] arm64: dts: st: add new package file
	for stm32mp25 pinctrl
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

RnJvbTogQ2zDqW1lbnQgTGUgR29mZmljIDxjbGVtZW50LmxlZ29mZmljQGZvc3Muc3QuY29tPgoK
VGhlcmUgaXMgYSBmb3VydGggcGFja2FnZSBmb3Igc3RtMzJtcDI1IGRpZXMgd2l0aCBhbm90aGVy
IGJhbGxvdXQuClRoaXMgcGF0Y2ggZGVzY3JpYmVzIHRoZSBiYWxsLW91dCB0aHJvdWdoIGdwaW8t
cmFuZ2VzLgoKU1RNMzJNUHhBSjogMTYqMTYvVEZCR0EgMTQ0IHBpbnMKClNpZ25lZC1vZmYtYnk6
IENsw6ltZW50IExlIEdvZmZpYyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNvbT4KU2lnbmVk
LW9mZi1ieTogQW50b25pbyBNYXJpYSBCT1JORU8gPGFudG9uaW8uYm9ybmVvQGZvc3Muc3QuY29t
PgotLS0KIC4uLi9ib290L2R0cy9zdC9zdG0zMm1wMjV4eGFqLXBpbmN0cmwuZHRzaSAgICB8IDcx
ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspCiBj
cmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9zdC9zdG0zMm1wMjV4eGFqLXBp
bmN0cmwuZHRzaQoKZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvc3Qvc3RtMzJtcDI1
eHhhai1waW5jdHJsLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0bTMybXAyNXh4YWot
cGluY3RybC5kdHNpCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAuLjMz
ZGRhMDlhOTcyYTcKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL3N0L3N0
bTMybXAyNXh4YWotcGluY3RybC5kdHNpCkBAIC0wLDAgKzEsNzEgQEAKKy8vIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0zLUNsYXVzZSkKKy8qCisgKiBDb3B5
cmlnaHQgKEMpIFNUTWljcm9lbGVjdHJvbmljcyAyMDI0LTIwMjUgLSBBbGwgUmlnaHRzIFJlc2Vy
dmVkCisgKiBBdXRob3I6IEFsZXhhbmRyZSBUb3JndWUgPGFsZXhhbmRyZS50b3JndWVAZm9zcy5z
dC5jb20+IGZvciBTVE1pY3JvZWxlY3Ryb25pY3MuCisgKi8KKworJnBpbmN0cmwgeworCXN0LHBh
Y2thZ2UgPSAiQUoiOworCisJZ3Bpb2E6IGdwaW9ANDQyNDAwMDAgeworCQluZ3Bpb3MgPSA8MTY+
OworCQlncGlvLXJhbmdlcyA9IDwmcGluY3RybCAwIDAgMTY+OworCQlzdGF0dXMgPSAib2theSI7
CisJfTsKKworCWdwaW9iOiBncGlvQDQ0MjUwMDAwIHsKKwkJbmdwaW9zID0gPDE2PjsKKwkJZ3Bp
by1yYW5nZXMgPSA8JnBpbmN0cmwgMCAxNiAxNj47CisJCXN0YXR1cyA9ICJva2F5IjsKKwl9Owor
CisJZ3Bpb2M6IGdwaW9ANDQyNjAwMDAgeworCQluZ3Bpb3MgPSA8MTQ+OworCQlncGlvLXJhbmdl
cyA9IDwmcGluY3RybCAwIDMyIDE0PjsKKwkJc3RhdHVzID0gIm9rYXkiOworCX07CisKKwlncGlv
ZDogZ3Bpb0A0NDI3MDAwMCB7CisJCW5ncGlvcyA9IDwxNj47CisJCWdwaW8tcmFuZ2VzID0gPCZw
aW5jdHJsIDAgNDggMTY+OworCQlzdGF0dXMgPSAib2theSI7CisJfTsKKworCWdwaW9lOiBncGlv
QDQ0MjgwMDAwIHsKKwkJbmdwaW9zID0gPDE2PjsKKwkJZ3Bpby1yYW5nZXMgPSA8JnBpbmN0cmwg
MCA2NCAxNj47CisJCXN0YXR1cyA9ICJva2F5IjsKKwl9OworCisJZ3Bpb2Y6IGdwaW9ANDQyOTAw
MDAgeworCQluZ3Bpb3MgPSA8MTY+OworCQlncGlvLXJhbmdlcyA9IDwmcGluY3RybCAwIDgwIDE2
PjsKKwkJc3RhdHVzID0gIm9rYXkiOworCX07CisKKwlncGlvZzogZ3Bpb0A0NDJhMDAwMCB7CisJ
CW5ncGlvcyA9IDwxNj47CisJCWdwaW8tcmFuZ2VzID0gPCZwaW5jdHJsIDAgOTYgMTY+OworCQlz
dGF0dXMgPSAib2theSI7CisJfTsKKworCWdwaW9oOiBncGlvQDQ0MmIwMDAwIHsKKwkJbmdwaW9z
ID0gPDEyPjsKKwkJZ3Bpby1yYW5nZXMgPSA8JnBpbmN0cmwgMiAxMTQgMTI+OworCQlzdGF0dXMg
PSAib2theSI7CisJfTsKKworCWdwaW9pOiBncGlvQDQ0MmMwMDAwIHsKKwkJbmdwaW9zID0gPDEy
PjsKKwkJZ3Bpby1yYW5nZXMgPSA8JnBpbmN0cmwgMCAxMjggMTI+OworCQlzdGF0dXMgPSAib2th
eSI7CisJfTsKK307CisKKyZwaW5jdHJsX3ogeworCWdwaW96OiBncGlvQDQ2MjAwMDAwIHsKKwkJ
bmdwaW9zID0gPDEwPjsKKwkJZ3Bpby1yYW5nZXMgPSA8JnBpbmN0cmxfeiAwIDQwMCAxMD47CisJ
CXN0YXR1cyA9ICJva2F5IjsKKwl9OworfTsKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0Ckxp
bnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWls
bWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
