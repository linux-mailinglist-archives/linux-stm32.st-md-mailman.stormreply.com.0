Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B50BCCDE3
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Oct 2025 14:24:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C48BDC01FA5;
	Fri, 10 Oct 2025 12:24:37 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011070.outbound.protection.outlook.com [52.101.70.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B0DFDC36B27
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Oct 2025 12:24:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTHyVquCbi6JMqu+hU+OtBloN2tmiNarLx+qNhnqlxVZe4X/ki4jna2Vg66JZ+gNfjbV3zzEJWpqFL60MRIIktAXLrwBpmunktlEq/bCMQrLCjJXfTBq8O6gB6eYqer/qvYRwzb8+dat5modugmgZgg9TBFA0atZ1r173IPMLnYmY/vi7XmYk1Qpbz3Oo4C4VMVnuHPPLxMGdBM1rJvZFdB0PluwyPcY8F5ykGdgtkOUr6LTxzKUiwasB7H474GHJdhAwmbqFJsIl/8g7608UDgyp3t4eSE4akYU4K+gy5xortb6GRNs8NeK+GfP5CvoeT14qSNHngJTz/WXxjwLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k2AJDRj1pfnh4AuS/woJM0MlIThvNwU/7B3FdJYnlzk=;
 b=qWvRQ0jPpVQ6FDhV3OqOtBimHG7OiRM/bS1DhZQhCxn4BDHIPF0DwnHeWbOU5XCwE+GyZslWttPAjblbbVlNR8HkDxRKGGMcW/E7Z9JTr3D6ERNDyyavoRvvVnP46F0BvDeT5gIMCEXbeC/4Httb4EsB7JWsMXgRpERs2t6gHv90GLAUL8nZzGOhfKq/rWhRiMqqyXbICF+elcHj8xd+zRljrfDJkfH3jxWo26k5XbFXYY4SiV3UFbi/4I9tHkWTSsxlESWc+Fd+3NMJB3Yxq8FbkWFz1xRjh46l4EMkgXIoNoExJvR4UpAONG+bwtE15f5ld8TXKW5mkfJ8UBBGRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k2AJDRj1pfnh4AuS/woJM0MlIThvNwU/7B3FdJYnlzk=;
 b=l5DVNHDH1OuFTPsefclZrwUNBip/7qHQMTbHGa/lwyKMZmpMrdsmjYXqDD17zEFbNmWSPiAaiQMgee6yaJMvAjI8w/uTIOSs0FyIcb5zSdYGi3BXB5x2YnLnLh4/5B2epZV03DdouEdOIdQ9aBq9lTQgF3QvObwnW74HOSK3JpB5L7BaluL89D1l2ty/xPcDwHVTySpmoqNh3wdokcrngP8416L7VBslrAcFMGnVtZly7/xwh82yNRUFFHwoCtBE2kopkUSpPV2DOlUxvuQ+yr7uJ++31CuuCd4mWWkvC0lVIPI3qF7NQlCq3icdI9RH9Gu98nyIftVnhuDGQSoiSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8449.eurprd04.prod.outlook.com (2603:10a6:20b:407::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 12:24:35 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 12:24:35 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 10 Oct 2025 20:24:11 +0800
Message-Id: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
X-B4-Tracking: v=1; b=H4sIAOv66GgC/22NwQ7CIBAFf6XZs5gFxFhP/ofpgcDWklggUElNw
 7+LTbx5nEnevA0yJUcZrt0GiYrLLvgG4tCBmbR/EHO2MQgUiiNKlmgOC8UUDDNP0v4VmTwpYxW
 OxOUF2jAmGt26R+9D48nlJaT3/lH41/5y6l+ucIYMe92PljTiWd78Go8mzDDUWj+xKTfSsgAAA
 A==
X-Change-ID: 20251003-remoteproc-cleanup-345cd50fe138
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760099067; l=1646;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=sb0d7iCIRjM4okMrJmOfw9vFf2eyfAXWCqvgxPLlEGc=;
 b=tXf1bFkcIlhyKFTdiWdBKWqvHCNVAwX5HxoM9BLZwuDFMLOrhFEC1f7APgKuoTN4oYLFvugpn
 ZNZ6cgI8RfhCzhwPO2DjM01dAlwsvSmc9aPKXyRIVRE56Z4av/YDZ1w
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 17460af3-bb12-4bbb-1652-08de07f7f921
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDg0TElreUZKUFdRVGduUjNIb05MNkdmcnJ6cU1oWmgxdGVPWDZ6K0F1Sm1J?=
 =?utf-8?B?MGRoUXJJQm15a2JQelVzVVdEc3JicmpXdnkxSCtxdGdQVENOckVaZE13bkh4?=
 =?utf-8?B?UVpVYTJrMjdjWlpqbXAxKzFqS3RzdkVxM2FEME9QdTAwc3FybmtCUlhKK2hF?=
 =?utf-8?B?OWh6OFc0YWVIVHNwL1VBWmgzYTZHYkYzckxyMFc1enV0VE1UTXNlRm9heHVu?=
 =?utf-8?B?UkVSUnRZM1A0TGhUYWpYaWhMMDEwMGFYd1lyQUsvWGFmeUlMTkhpRVdHZkQ4?=
 =?utf-8?B?eTRBSVJINkdFR1BkK1J1S20rZFFvdmQ4V1ZPMWhrZFkycGV1TTg5Q0FsV1Zz?=
 =?utf-8?B?dkkvcmpQTk5iU0lJU3hQUGZXU1JHMmQ4WUgzeEFacGQyQlMza3JYbFcyMTNm?=
 =?utf-8?B?cC82NDMwQ3RadkIzdEZlS200a1pnUTF0T2JPNkMwbG5uZENNQkl3ektVdjlr?=
 =?utf-8?B?eEFkbTFiWFV5TVRBOUo1MHI1Vk9PR0lkc1J4V3FNUS9HQzJCTUZUL2VSQmJP?=
 =?utf-8?B?LzlkdGNucjdUcHFYUXB3UzFUYlJrSWRYNFg1Z3RIMUE3bjhGS2g0QUV3c3ZX?=
 =?utf-8?B?dWEzZzFNVEtvRXBVbUt4VHNxRFY4WHJKYzl5ampvMFhGNEQ3WnF3ZXJCRHFn?=
 =?utf-8?B?RDAwMjNXZTZFeTJzUkhrcE4vOE5MWE5VUzdPZFFXTjdlOWEydmFkc1pSbHVO?=
 =?utf-8?B?VGhCTDExdVlQYmpZYWRVek44UmRnNi9hL2hROXRPUU84dnQzRWRFOThGMllh?=
 =?utf-8?B?QnJ6WmtINHozTmRRMFhTUk9nVXBNVlo3ZVp4cVlMS2ZENGllZ0lBUmhJQWJn?=
 =?utf-8?B?NDBVZExjUUEzeDg1NENGMkgxd3JlUlR4VkswaUFpcE9xWThxU3VkcHJJTCt2?=
 =?utf-8?B?RjJ6ZHNaNUNQREJpcG9aSno0cm1jTUloOXVYNVJReU5yUVN5LzZiM0hETzhv?=
 =?utf-8?B?TUF2TWRkR0ZML0kxZ2dZU3ZoU1B1aXdGbG94R29iZWxNbVc0VkZJbm80UWNj?=
 =?utf-8?B?ZUwzbURvbm5DZkNpL2RhTzMrby90SmNRYVZBR1ZsY0l1bUxDZFhxbVc3TU9Z?=
 =?utf-8?B?RHdZeHFjbzJwcFVVK0FKMGdxTlpjRzA1ZUV3N2syZGRBM2FNQkVYWndVaWZU?=
 =?utf-8?B?d2hFR0xRTHc4d2t2VHJlMzlLcGRPRWMrNjAyK20vUElhaThGL1YxMGxKZGpn?=
 =?utf-8?B?bnVDdy82ZVRvYmFDVlVqYTBlckx1eTJFRXJMY2N2NmpOZUV5YWlCSGJaY2Z4?=
 =?utf-8?B?TjZNcWgxeGZwTGZ1Vld0dWkzU0xuRDZNRkczNXY5aVYzMXpidFVhMllVRjc4?=
 =?utf-8?B?M1NrZFJlWHBSUE5qamY5VFBZNUNJMmRzYVBlZGx4MzBLMlVzUjVtQUh5Zy9R?=
 =?utf-8?B?anlhVzE2ZXJ1QkczNU0zS05TZ3VpbTY5bGh3SWtRQlZFdWhDcFNKTG9Mcnl0?=
 =?utf-8?B?bzhjZGFGdWJ4UUQzbjlNaXJUbXRYeThKbzVQRmwrMUkzOEZnVWNCL0RyR1Zn?=
 =?utf-8?B?QjRkOEVFRFFYaE9lR2ZGNzB1bEVYekI1SCtGbW1JN2JxMkxtajBoTkV4ZHFR?=
 =?utf-8?B?eGVSSWtJNzB1VkgyYldZTlJ2N2tEL2hTQVJIVGlPNGR6MVBXU1dDQXlOTEE2?=
 =?utf-8?B?Vms1dGxEWVozcTRpaWdrQjRYSUZqZEFXNzB2KzJPd3BaRm9TS1FtdnRTTUNn?=
 =?utf-8?B?U2ZoZVhyNlVldHdQNWl6WnBPVDAzKzloekQwWEQvcFlDV1YyWDhKV3FhMm1k?=
 =?utf-8?B?L1FZUk1nY2UyODRKWXkzNU1rblB5UWtTS2pTTlJLZGZBc1R3ZVhRZ2JETVpP?=
 =?utf-8?B?ZGU4REVyRUs5Ri9zUnRKN2ptT1UvOHEwdDRCUXhEQTYyYllESXBTRXE3eUVs?=
 =?utf-8?B?STVndVBCS08wRW9uZksweUJBeUY1a25pTTdIRFdYOGVjRTRZS1RqUnlMcmJU?=
 =?utf-8?B?cVc0YUlHaGlaQ0dhNFpBOW5yMENPYjVmd2xua2MrdU9ZcGJyTXFmc2NYTERp?=
 =?utf-8?B?Qld2TFl0VGVMQTBrNFNSL213NUdza3N2N0pNN2NIUUJkN3VtVDgxeEtacmI1?=
 =?utf-8?Q?+eUBPy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cElhKzI5RW9LQi9ud29PSWx5RVdRUy83dFhEU1IweldBbVEzeGwrNk1UdHhN?=
 =?utf-8?B?Ym5CZTRZL1RMWGxiVjIzSXoxTS9HZDJUZ0dJNVFPRDJYb3BCVVJwMStsVHVN?=
 =?utf-8?B?Y1g1OXVrM2RaRysrNkx1NVNMbEkxUzBsZklNNFc1bUhqQXNQc1BBdXY4TjhS?=
 =?utf-8?B?TVQrR2M2ejlxR09PL1NFV2l1K2Z2MjdBOVd6V2NqY256c0EzZUp3UU1TOU9U?=
 =?utf-8?B?MURrVHg2S0FOSDZ5Wkt6c3dsZ1N6eFdIdTlPOGVCanYrVkt4cmlkc2o0b3hU?=
 =?utf-8?B?TEVwenlkM1Z1WU51MlY2RjF2N2tBb0d4Y0s5WDVzamt6WnBNZWo5Qm1VMWJ0?=
 =?utf-8?B?M1lkNzVKeFk2SGVyN0wvS2ZyV3dnQmxVTExaRllvQStvT21VdWpoZU1ZU205?=
 =?utf-8?B?UzJLQlI0dkRKVStzTUxyK3hPZ2YvRDdaMEFWck1DODliS1ZvKzNUWkxrQTFQ?=
 =?utf-8?B?MCtLN2NEVVZuR1o3bXdhSzVFRlV6bTc5WlMrNXB1bFNPSTUwK3luNUtlenJs?=
 =?utf-8?B?RmptMGZCUjMxL3NyQVVydFk2ZkRNWnRYZnJKQWdJNGZ3SGdZbzZ3UkhLL0k5?=
 =?utf-8?B?NTFBbFJ5clBWdmpSQ1ArbUNMTDRNNUdCbFBhWkw2R01YZGRUZGwvR25KZXpY?=
 =?utf-8?B?eEF1OWp3ZW9VMStKNnhPUjNYRGEzRzFMZW5vYXREcENIOVpyczNORHBocitv?=
 =?utf-8?B?SXRNQzFOWmFoQnd1bHJlVjhIaEcxUkpZZnRuUUpTZHZWN0xvYUhjemRVSFo3?=
 =?utf-8?B?UTBkWmg3dW1kbWRpY3I2Z3ZMVlBQamppZ1B6bmRuaEk4eWdibnpOV2djVU9o?=
 =?utf-8?B?WDJHclNaOXJHWkI0ZnBNOHZoUGJSbkVuNGpESmd5dC83UkdIWVYzSVAxQ01C?=
 =?utf-8?B?TFloak1oVitxNDFTOW4wZldBenE1TWFIbnRJOUJPemJFenBwNFg5dlBIQ3lq?=
 =?utf-8?B?SXRPRUZjZmVMdzEvRjRMc3EyNktpTWFieExFOUtJRHYwMnN6MndSeCsvMnVi?=
 =?utf-8?B?VlVvdmY2L2xUb3RzMUdDVlU2VVJVQXFsYThpaXM5cC9zSmlpeExrUzlzdVRa?=
 =?utf-8?B?c0dzTFU1MGdIdDBiVW5Pc0prdTdtdTBKcVl6QkJFMnlROGRHc1h4WWpxdXY3?=
 =?utf-8?B?UjY2ekxqcUNnUXBSWW4wVWZzQWYvUlRpME0rZjhLWWhNWHBPaUdoNTk5Z1lZ?=
 =?utf-8?B?bnFaVTFKSjNLM3Q1SG1qNWt2ZU5ZclluOVQ0MWRNMWd3TFlWb04wOGIvczFB?=
 =?utf-8?B?aWl3OE1yOXdvaVY3Rm5FVU5jbXQ2ZjYxSVRNTFJLTlJiYzgyeS9SWW50NHk4?=
 =?utf-8?B?cnZrUE13ekFta0NHYkI1RVN5YTZ3MXI4Qmw3c05TVTJiZklHSlh0cmRGKzAy?=
 =?utf-8?B?Q3MwQkFhSzhUdlZwR0d5bXZGZXZacHlkV2JGakVKYUphM3VBb3VTdDkva0Qr?=
 =?utf-8?B?VFBSOTBybXRWdHlZWFY4dW5Gd2syRUNxOURudHhSLzVtQ3ZLWTdvR3FrRWR2?=
 =?utf-8?B?Q3RjMUhrV1hIcGdoWVpXbnhRRUgrQ29RYk44VGxyNFZiT2Z3dWh0eWlrcStC?=
 =?utf-8?B?SmY0SzR1VWpYV2RjbWU5bVZlcHhNSWdlVjlhTFY2ZkJrWExodVlxQUdpdUtI?=
 =?utf-8?B?TEVTRTMva0ZrMXFFMDFuMm9sM3pnSXZyeXlMakovdFlGVStQNDhjMEZCcEx2?=
 =?utf-8?B?aCt5azAyelFFazNtWk1MajlLZTdNejFES3l6endJS2dndFZKcW1ybC9vWDlO?=
 =?utf-8?B?YkZGRjMxRDE2SDZQNlVHckl2SEdGZlNPOWtNVlJRaHVQWm16RVhCZkFxYlNE?=
 =?utf-8?B?VHBxaVVPMitsQlU2U05tS0RGbDRsZGduQy9yWFZiSDVHNG9vczdRbmZFYjRE?=
 =?utf-8?B?ajVwOHhjZHQ3Q1VpSVIzQm81aWpJZHdwSDBnMG93UlFqbGRxUGlvbzlTdzZB?=
 =?utf-8?B?WG5wQWl3UlUzUXh4RzBBdUJLZ0V4VElKaDVxN1FNZFRheVBlenJVdStScmJG?=
 =?utf-8?B?eXlNQnNFQTN5Y0FSbU83czg0dXBOVTVudkIxU2JaRWdWWXFpdEU0MTJPMlVY?=
 =?utf-8?B?a1BMYTc4cU1hNDdEWUdXM09CSHFBR0pCdk5GMFVkSWd0ZGswRk0xaUJ2RU4v?=
 =?utf-8?Q?3So5wo4/0bJOHYKvODuiwsnAY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17460af3-bb12-4bbb-1652-08de07f7f921
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:24:35.2712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajTTs18tv/ZjCR4T8fd/YshYLVV1pZnswKnDJtyM2pzeEwJNwqNnzKdso3CeBr+N5caRsf+OmKF+Tp4q/399Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8449
Cc: Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 0/7] remoteproc: core: misc update
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

This patchset is a misc update of remoteproc_core.c.
Patch 1: Drop a pointless initialization to variable ret
Patch 2-3: Cleanup the included headers
Patch 4: Use cleanup.h to simplify code
Patch 5: Remove export of rproc_va_to_pa
Patch 6: Update stm32_rproc auto_boot assignment.
Patch 7: Use 1-bit bitfields for bool

I am also reviewing the rproc->lock usage and thinking whether we
need to add a lockdep_assert_held for some functions that should have
lock held. But not sure.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Add patch 6 "remoteproc: stm32: Avoid directly taking address of auto_boot"
  to address stm32_rproc.c build issue
- Link to v1: https://lore.kernel.org/r/20251005-remoteproc-cleanup-v1-0-09a9fdea0063@nxp.com

---
Peng Fan (7):
      remoteproc: core: Drop redundant initialization of 'ret' in rproc_shutdown()
      remoteproc: core: Sort header includes
      remoteproc: core: Removed unused headers
      remoteproc: core: Use cleanup.h macros to simplify lock handling
      remoteproc: core: Remove unused export of rproc_va_to_pa
      remoteproc: stm32: Avoid directly taking address of auto_boot
      remoteproc: core: Consolidate bool flags into 1-bit bitfields

 drivers/remoteproc/remoteproc_core.c | 144 ++++++++++++++---------------------
 drivers/remoteproc/stm32_rproc.c     |   5 +-
 include/linux/remoteproc.h           |  18 ++---
 3 files changed, 71 insertions(+), 96 deletions(-)
---
base-commit: 3b9b1f8df454caa453c7fb07689064edb2eda90a
change-id: 20251003-remoteproc-cleanup-345cd50fe138

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
