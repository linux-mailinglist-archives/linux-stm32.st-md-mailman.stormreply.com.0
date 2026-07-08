Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l0v3FLSpTmqxRgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 21:49:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D1923729FB1
	for <lists+linux-stm32@lfdr.de>; Wed, 08 Jul 2026 21:49:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=ARMhS4lH;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=nxp.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 719C4C712B2;
	Wed,  8 Jul 2026 19:49:07 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 880ABC5663A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jul 2026 19:49:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/sLsNxaoA5x2+J/w4QtUt4/PvLHLJnrsfsZFWYHeMw95N0MPRyLsMlBcvfOKGYirBoLO4fAMGPO2Ni8X53xkUaIl7hWCCkREDKtEbk5iZy4DdK5xFY1Y63uAAGzGYvlDcvGAR88IljNdxSgJQ9FABb2NMwb7dI1hkjZVxq9fZMf8jWVuNMVLSevkoHallwZGTEH9x7B1ANorAcYILtj7Z4laZGlmZ0euSU06fGVpPWr9NvDoWqJGINjhvrfyqo/8xjU9BNjThfW5B5Jwf3Uu+FNganUu9CPfj7eiCaR/21dl8vweY9wDu7FZ3+oeuX5vcwXmQYBKwikY7iMVrldVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XfaEmAmhA3/LRZ1KASmf+cILHI69XhZOKYik6s/B0E8=;
 b=QLYz/KOMMWpAQMwEV5SBaIpp8CbT3niDQNddp/yRXtBxVCFhA6/db7EA9lM/diYRoPlUoYSlte+XbZpGBQEyAH1gGhjscVqKIvyJNbNhpDlifVfsu5oK8jiPYLyK6UeMMi2y5RRaE+FCh+GklgBNNCu+o0mSoBiUtXEYkWt4l11yL8TrVD+YV/eW6yBqOTHH5YMjAFfLwUBq7+7c6vQkA1z2veviiBP7r/E84VIi0B5MpetIkcv9HM3etoY9jgfwgaMZ04ciIHJ5iKNP7lXBPbtfxlRpYHVmErT5JcB8jJ/UOOgtdC3xfDfBmiUK9J2gi3cj56cljbQLnHHC0SN0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfaEmAmhA3/LRZ1KASmf+cILHI69XhZOKYik6s/B0E8=;
 b=ARMhS4lHWUmpivEIi6e0ztVswwnaKZ67wroGZQW42f7/wSJTsr8nqr30VMxbfnBx9qQoUZ/y2H9XEXhPmX2tYwtYwDDRUvMeDVCq1OmnYggeZCG4xaYuBACOqAKe+V1uIjl1ALZb02elIsWXTp77i3owb88Dflcx1RCz0f9t2O7G2gJ762VP8RvbEOUKAso2jSXOleCf3sxiSoDBrs45ZGFcVtf5g6L7N25YheLU/fNKKC37vSO1IR1ZNZ9c8AR4YwtgeW63jKkQjXMLkhbQVwOMMvD+NGcn3oHCx9uqO74LAALbXyxsgTgkRUOVozbhh5hZ1AFxGUeNz2CvR9o0EQ==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7150.eurprd04.prod.outlook.com (2603:10a6:800:12a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.14; Wed, 8 Jul
 2026 19:49:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 19:49:03 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 15:48:55 -0400
Message-Id: <20260708-dts-stmpe-v1-0-1f51d15bb358@nxp.com>
X-B4-Tracking: v=1; b=H4sIAKepTmoC/yXMywqAIBBA0V+JWSdYkD1+JVqYTjVBDxyLQPr3r
 JYHLjcAoyNkaJIADk9i2taILE3ATHodUZCNhlzmSpayEtazYL/sKOqqqEut1KD7DGK/Oxzo+l5
 t95uPfkbj3wHc9wOSq48VbQAAAA==
X-Change-ID: 20260708-dts-stmpe-98597a66fab1
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linusw@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783540138; l=731;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Mi/kVlI+lkKa9JV0ui54lnEc4jkHvpOrF5K19Niml9c=;
 b=1LcSusC/GxlOAfekhT6uy+z0hvX+O5L+0KXVkgPYQUFCBp/2b3f1rXSHVEMd3vKWMCi6z+naV
 dFNGq6Ac3ZXDnhNsF1Fuqktk03r42Ls3XpDAI2m/KI2yInaSLVrC/Ji
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH1PEPF00013307.namprd07.prod.outlook.com
 (2603:10b6:518:1::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: e088816c-8e8b-44ad-226f-08dedd29f671
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|23010399003|19092799006|1800799024|366016|921020|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: PZtxetOL3TbgA/gDpEdqeNC2gaVlaT3BX/Kj70Bb74NcdCZ2cJf0DWuwJnAcbkRYSzM0xl+9X3Fh4PwewAscBTQ6KKMnkEvYClu956NZr6kN4yDi0y0JpBKbJ/22iJ/SFk2wDxvcGFnA9q3tPZeK23sHKfWR+rc5MdOE6EKuMWUUMmmhGHXVWkcgjGpTCp+aAvoL5WLWZ5BQpje5EjSnRduXk0XFJ7RMzFNArx2jb29WAG8td/gBZzynIEIPRa6ADQGTccOrYKgxuZDfwYQZFpzc9XKitaHBgi6FEnJvwXjnvRJqiOGt36Qv5S6+VS6KiaiW4RhZicvAnZppRR7V7llb/Y9QWw+g1c9ak8NBIi5+BnB+yZ+7VzQ2xxGinf/wbHwSKF/W4NOd5EVhD6DrcRE46ShR3Z5pIAUb3VVnbCgdgi2AbtR/s26FDqPPcHFpN263dAGYzu73mHbExWazDomm8LHy3wtpiPSAOxt+3rVEnMq9cT7jP58EbeTZ6cEBT7tMxVwbgfcqPmghyRvJt/82VYqE7yXwmcoVqUf6L5BMS4ZDkm81pCPXUiE0l5ep01qLZPT9lBg9hff5vw9YpInzNTG+quPBELINQUs8js54jN5A1MskDbH112qgeCzt3OxA+/F5W+xP+5HdRarqOqfIzqyHYpIMUz4445zUfHj5qCbCLASYauqUjzOsDVGeCE+olaYa9bmYJ1+37acX2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV2PR04MB11799.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(23010399003)(19092799006)(1800799024)(366016)(921020)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmkwVGRqMDJKa1V5VFg0TXZ6a2ZJdDhNK3htTDN6YlNGR1lWOVh6cHVzazJJ?=
 =?utf-8?B?TjF4UUt1NUxZRm9ia2FhUlQzVnprb0FLYUZOZllQK2MrSDVlQ1kzR0pVOHcx?=
 =?utf-8?B?a1RzRXlLTm1ybUlLTTBjMmhJQSt0QXJTMDhBWXg3NXl0UVNmZmRnSnFoOUVx?=
 =?utf-8?B?aVRWRlZkTmtod3hMbzBpTFQ0SitaVi9IbW9FRHArQy9HdkE1WHkyM2E0RGk2?=
 =?utf-8?B?b21WWEMyRHJWZnZKemVZNnNxaVp0ZzVWNk5OZkxMSzZPZkYva2R5S0Jhb2d0?=
 =?utf-8?B?bjdoYzNobHJ3MnFZN0k3bFkrVzNNOEVUQzcwUS9Jd0dMWVVLdnBjR1RqeDlx?=
 =?utf-8?B?OS8vVlJYekhRb1g0Q2w3MklhM0szWXFZODZVVU9ZM1BTdWFUbTZuc1hEVkxX?=
 =?utf-8?B?Vy9TL1Q5RVk0T01Sb0dFVVlGcEc0aGkva1pyWng1WjU0Vjc5MHhTaFVSMTZN?=
 =?utf-8?B?MDBWK2s2R1NjOHloQkpCTTJBYWF0MVdRS1pNV1pIL0JHMHFhMkM2bUl5YWtL?=
 =?utf-8?B?aUdYeE1YZ0RUR21iRGlBR0N5aEh4SFVPY2hiRkoyeDBKR1BrL2pJemExVTJy?=
 =?utf-8?B?VlBhRXNWaTRjSEFMVThjeWh2dFovZk9EV2tPMlJTU3g4MS9VNkxBTHZNNDhU?=
 =?utf-8?B?NFI4MGJxa1JzalIrWUlvdXAyaUM4VkQyRjRRYTJsZVhkQmEvZHpOeGoxQVdz?=
 =?utf-8?B?bU44SjAwM0ZNd245WnphWlVaQkQzb0hzK3A4ZjNJWDhWWkIyVzY0RVBVMWs3?=
 =?utf-8?B?Mmpnc25lUEhvUDJGSFdyandRRE9hcW8xNm5qeWJHL0ZLRGs5M3JtZ3VvWElZ?=
 =?utf-8?B?MG5LSzlsb2Z1d1d0bW9kU2JZNCtzSzVGYmRBS0dkQ1Jiazh0eUdnL21OdVRn?=
 =?utf-8?B?L2NJY1lmdnUvL2E0T3JsWWdkRUE0RGpRZUJEQlQ5eERTM0U0OXJlMVl5eCtV?=
 =?utf-8?B?SXdaT1BMVllocmV6SlJrOS91eG5zbTU3SGtJeGtOZzJtTWZiL1ZXanl6b2Ju?=
 =?utf-8?B?aGNPL3RPQllnQmhCbWxLV1NBb1Q1V0lsZXg5RlhGdFovS21rbkdpeG1CbFlB?=
 =?utf-8?B?SHNEOHVXc2IxNE1NZFlBRFdZUnUzVDh1ZUFLc3JvZ2I3LzZuNU1oTWRmTW1E?=
 =?utf-8?B?aWZhdFVrL1FsRDJodC9KaWRRT2lCZ3dvTmVqMXMyTjk1NmFicDdwamwrMzNy?=
 =?utf-8?B?d3dZUjdjOHlxRHZWTWFaWTJKcjZpOVdTNzdDT2IyRUhublM2TUZ0ZlU1Nkha?=
 =?utf-8?B?UitDRjZVTWFpbWdkTE1LbjJXakVoRnB3U202bHBBR3RHU3NRdjBlSnVzek1X?=
 =?utf-8?B?KzdmOEh1blFkZzdWSUF1MTlRekIwYU5hUDZGOTh5ajhxL0pLRWhyRkpSc2th?=
 =?utf-8?B?aVJFZVdKS2czVjUzS1BSRWlJb3R5eXI5RXJCOXBCaHljdlJKWnh5aUMrMjV2?=
 =?utf-8?B?cFVCWlFOdTk0MkxXYXU1eW1NK1J5NEdVVkxvK0RMaUNaRHRab3FmVHhvZlJM?=
 =?utf-8?B?Q3dUQlJUaVgyUGtvS3E2YWNudnQ1aFlxU3BXakxINjY5STU1VlpDVWovODFR?=
 =?utf-8?B?YkgzMG5MMDNMUFZBMUhDVkx6bU80cHFMMjhNcEFkVWlMbWgrNEFJYmxFQ05n?=
 =?utf-8?B?S05RYnZpci9Sb1EwYjlzTE9KeGd5OGxPdEpnRHk3dDhoNTN3eFBmcmcySUtw?=
 =?utf-8?B?c3VGM0pCVytxSitoWEdZcy8wZkdCVTZ2WkFSR2phbExLUHY4UXhZajFUNGcv?=
 =?utf-8?B?RVZBUmx0dFlhRWxONldGL3NmQkdvVkdJdWs4WmF5VjRHQ1FLeTdYQW51U1JE?=
 =?utf-8?B?SUpaQUE3TTh1NUEzNVJIZGU2dU5ORS91OEdSd1Z4Rm1nZGRzMkdBcmp1QzBl?=
 =?utf-8?B?SUExQS9hMllXNzBNM0dUcStreGJYdGlzUTBFdkI4OGNqU3dKdENUWWpqWEh4?=
 =?utf-8?B?TVE1ZEtSQkNjZnpqd2toeGRHRWFTSXp6Mi9NUzlIMTVqS2RQdlZLcGJxZnBw?=
 =?utf-8?B?RXRpcjBQSlBXd2FJZWk2K2wwSlF6R3VkZXhOR1M1ZmxQUTMwTGR1RHA1K1Yv?=
 =?utf-8?B?VklQemdxWitra3hHTGpTcFh2N2FCVGtySXdZRDZ0WFhPRCtlelU2ejRnRDNI?=
 =?utf-8?B?dlp0eWhQVGY3bnBGYjlFKysvZjdQNzhuSHJhclByOVlXTGhSOFVZUFdJdjcy?=
 =?utf-8?B?bnJOUUFLcDJaMmVWeTdrSjlWVTZyTFAzWWNKejdwU2E5QVRmSDd5cTA5TWpu?=
 =?utf-8?B?RXBIRkRzY0pHZ1FyNEFxTnZaS05ZWDJQTDdkRTl5U2drWlB5a2twMVlSUDho?=
 =?utf-8?B?UXI2dWVqTDZIa3hIK2EzSUJqMFpKb1B4alNrUklxcmRxbE16UlVLeDVYSVoz?=
 =?utf-8?Q?T7WcNrap2zaKHED+2wgKycsdqClbgWKySBcMW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e088816c-8e8b-44ad-226f-08dedd29f671
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:49:03.3488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7HN75urJVojF9SwilBS8jRYgB2mrPWkrnLt6fPw3jpiInz38dISAJGqFlg1mhIj/j1U93Q4y16WsxIINk4LEpbSxKXygH6N2uw3BUh3KhupZqee0CDYnNZ0NX7ZDwKH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7150
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 0/3] ARM: dts: imx: cleanup st,
 stmpe touch screen related CHECK_DTB warings
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:linusw@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:-];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,nxp.com:mid,nxp.com:email,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D1923729FB1

cleanup st,stmpe touch screen related CHECK_DTB warings.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (3):
      dt-bindings: mfd: st,stmpe: add deprecated properties
      dt-bindings: mfd: st,stmpe: let interrupt property optional
      ARM: dts: imx: remove undocument properties of st,stmpe*

 .../devicetree/bindings/mfd/st,stmpe.yaml          | 25 +++++++++++++++++++++-
 arch/arm/boot/dts/nxp/imx/imx6q-novena.dts         |  3 ---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi      |  3 ---
 3 files changed, 24 insertions(+), 7 deletions(-)
---
base-commit: 6c94b38b83a04c43ea49004275f0391404051093
change-id: 20260708-dts-stmpe-98597a66fab1

Best regards,
--  
Frank Li <Frank.Li@nxp.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
