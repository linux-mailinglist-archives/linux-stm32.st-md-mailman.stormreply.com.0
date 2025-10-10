Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E684BCCDE6
	for <lists+linux-stm32@lfdr.de>; Fri, 10 Oct 2025 14:24:42 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5AACC555B8;
	Fri, 10 Oct 2025 12:24:41 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F652C01FA5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 10 Oct 2025 12:24:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjVLU6NzpC4Pl7B0KtP05AhC884+sqjxIEleLHaMyCw/67l4rUMHxAlaXSHNewRWGO2/F/xeu86eqxOh435cFXzRz/svc8cIDS3vQKaXTYbCQApup96Ur3vIaWTrhiTvGUn/X4sJL2invFm7W+djo+OXus6h40Zbvu91r/AAWzM5bejkk9SoQnnGZDjRq6SfFrsxFXSQbilwk6UDm8WL7pBgPefzqlLD/RYnM6N7mqnrNdGUNQbWQ0V1AJE3haLVqylyKIIc/tTVSqbdinvAN35qt5uEZcPvRQetsyLhF4pgdsGr6V9iGtT0JjMUMcGTk+/e2rBouF5Evhmdc/Za1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NrAdXIXaL0dVnlEFxjWUybCCxLXPgiyPBdqHAr31fHM=;
 b=jZe6iTp8mIsDnxKBPgxoLw7H/2z36wRhzYEjnKQvEOBCHDZ+wT4DVpQNBnwMyQJ+a5RBOT+O/ypYCYNTBWnJWLyNcVPSs7bpUq+J4wdL049XJN+9hpOp7UiYiZMfDRJ3WTpCoM3Nd77VisCOwU109MWSnXp+Jrj5IlJPVM+KLrlqnNmtpnKG9shQY/naHsqje3hT6CaT1caJQG5oUXUSQUFfMQpyRxMelN5jwKo0GrZ7wEwyxxw27xiTamqqiBfagJSTw0doIZG5WITBSspJVadOqh1uVoagiNuz8blelhJ+0/u1sWF8UmuW6oggHEmfmkvddALfe6ay4CZEUqHcow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NrAdXIXaL0dVnlEFxjWUybCCxLXPgiyPBdqHAr31fHM=;
 b=mF2+5y9oiUvr0EsAGF2mwIP0J4AJqaeqN7tparkTFNgCUnwC8ycjv10TsKGi+W774ySM76Rr1ghrKD5m39hFK3K+lIQQqdkk6i+wArolWM+hYYWQZ7yHXKiOoC7EcBX8vMGcK4id4HvnxDSbVqavPGuBXIK4G6fKJ6QTX08zeFSkXwM8QHU29yml9fkLJsEwR1jgKztN5mXnpIhjYcV/ATSwqW3azsQGeOiKosxeO7P3sUWjxGFr4Sxy1d2CCTx1EMUYpAJ+H3TQAaZ8UUzEmbBvz37+YZYt6NjipoS79/zkflwpKNPG2ZjDKBfl1t3F9hApIvYK4IPYOHE3Tq6pAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8449.eurprd04.prod.outlook.com (2603:10a6:20b:407::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 12:24:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9203.007; Fri, 10 Oct 2025
 12:24:39 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 10 Oct 2025 20:24:12 +0800
Message-Id: <20251010-remoteproc-cleanup-v2-1-7cecf1bfd81c@nxp.com>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Andrew Davis <afd@ti.com>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760099067; l=867;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=J3lgJlrgnyE+h6Kt/mR8twuUZfLUWoL14y/SvXjlDqU=;
 b=BnKH+rbkE7dVAD1N9k9Vq5fNJKH8MHSkXjneW9BmX0u6flKX/epoxntOrxtHemD6oaWe4IwWZ
 9cAR73tw1OfCTTcLrpZ7WieKoxcrYba49UoUFtUNEqJ7aH7Vro8chk9
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b006272-49dd-4448-2921-08de07f7fb5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZytKL3lxaHR0TENwbWdya0h4cDhTVSs5Q0VGdHU3WFBxSERwcnpJRWFaTC9P?=
 =?utf-8?B?alQ3TE5KWE4vdm9YdkRvNnV1Wk9Qb08xczhOanRFRGlDS3pMVVJFUDBiZ3Fo?=
 =?utf-8?B?OFhwcVBNVG5lOWYxcEJKWFJVNFJpeVlGSEZhVXRad2ZHRzRlZ1FHZFNoakgw?=
 =?utf-8?B?TlplN0FCdTY4alNNTE5PZWxveklObnJuazVtNlVOZ2tpeWZ5cXpFZjNjaWYw?=
 =?utf-8?B?elNaMG4rdnFxaW44VEtRN0o4d1VqMnJ5QWM0TUdWUjRrL2gwNFFWSFZDNFQz?=
 =?utf-8?B?bVlPZVh5OWo5dm5WcUZ6ZE03M0Z6blduSldtUnFJblN5ZklRcTdmWjlycnl2?=
 =?utf-8?B?V254UVZwQU1rdW8wckVKQ2p3NTZVQjZtY2pjd2JZSk5zcmVaYyt0Z3dURnVr?=
 =?utf-8?B?V1cwY3FmUXhrdno1dnl2S3VXY0QzS1paYTNiY205Z1VXTkFzNS9Rc1lYUysw?=
 =?utf-8?B?N3dreFcxRHlQS0dzNEQ5OUZTQmtIYTF2V3lXcFZ3MWZXanY3d0dqUERVck04?=
 =?utf-8?B?cGI3bG01R1o2M2pRQlpWK3U0NXpEd2JsYU5xREhhNFBQRnBMRGFoeTE5TGtr?=
 =?utf-8?B?U0JMd3NDWHdCbkQ2OUZ3aFI4d2RWYkgycXAwZXMwSnFYT0F0Y1UxUjg2RHAy?=
 =?utf-8?B?QXVVdUFvTjdnUDFzTHJRK0hPOW9mNkl0RVhlUkNkaGdrYThscFYxMDRSTkdB?=
 =?utf-8?B?S2t3ei9aVHZxK2dLNDVDSzRPRFhSZXFTRmxQQnRjaDBXcWczTmJGZDNBb1pL?=
 =?utf-8?B?cVptWWpuakZMWHRwVUlmSXJyTHdCaGJhZWIwdXJPOWdML3gwREo5QmFDaXNi?=
 =?utf-8?B?MjlXUHZ1UFZOR2NJSWFWVVRIVFRTQ28vbWkzc3ZQdU85VXlJWDNxSGZMK3Za?=
 =?utf-8?B?QW1lbXFQdkg2V3BMUE0rRE11QmNBbWhjcUFhcTlnTkFTalptTFFRbFlTdnA4?=
 =?utf-8?B?WTA2N1llL1BDTkpiUElNVHdGUUlXVlBNcTFKR3VqTWJ0NVdzSzN0VE10RHMx?=
 =?utf-8?B?N1lqazBoc0pFR1RuOGRFMUtkRWZ1WmtrY0R0MXlLNm9HTUhGWGsyUkRYcVBF?=
 =?utf-8?B?cEFRM0RjMU5tOFpDczBlVWhwTkh3TDZGZEsyQWdUMzNQNlJLUjlaOVZYcWIz?=
 =?utf-8?B?OVhIVUd3VUFCOXA1NzdUVENibDVkM2dKblJEcHVZV2xhdHVnVjh0QVRjOGZI?=
 =?utf-8?B?bWd6cVljbFB6enowYVhTSDFHM3JSZjBzMUh6aG9IK0g0OEJMd0lURFJBTTNB?=
 =?utf-8?B?UVowdTd6bzNYZTVoWHVnZTh2MWswclJpSitiLyt5QlV5eFRobHRrQWliK25O?=
 =?utf-8?B?WlVQVTE4blBDWm9lMCtyWXdFODZwNHZhcEUxSVQ3eWdRREk5R0IwdVprUWww?=
 =?utf-8?B?cnhCcytjMVR3K2srNC9ZZHZZbFF3aFEwQ1RjLzFMVnlXZmdjZVc1UmlBYm1x?=
 =?utf-8?B?VjNMWlBiaTU4Q0JFVWJ1a1VSL0l3eElZZjBxejNWazhIQ3pWYmduZ2VOK20r?=
 =?utf-8?B?bE5JZERwcXlJMnREVk41OTU5cmJHYWhiUzA2V1F3c2hLd3NOMDN3bm83Yzdr?=
 =?utf-8?B?bGlydXYzZUZIbkZIL2U1N21PVDVWeDhCQ2p1OVNEMHQ1WE5DWDZLbjAzNnNF?=
 =?utf-8?B?UE4wOC9zLzBPbko2TFVUSTJ2YXZVVDJ6UmNnUEZhMllrRTk4R3pSeHlkVC9a?=
 =?utf-8?B?cHFHbzRJeHdneGl6c3VTakxkdTQrQUQ1ME5BblZFR055UkVEaTcycU5ndW41?=
 =?utf-8?B?TkxCVWZxdnhxSGM2c1hNOU8yeGo3MXFGZnQ5dm9nMnJIRkl0MFU2NzlwbTNz?=
 =?utf-8?B?RkJGRFAvWDh3ZWN5Wm9yTDk1ZEg2MDRQRDJmdlppT0JHdHNFMm9NSFFDRkxO?=
 =?utf-8?B?em9zUWRFdXJ5ZFJNenhadUg3MjVUOURUK0VHbWlFWlprTFdlN3ozVDNuNHkz?=
 =?utf-8?B?VzgzSm5CUjNEUDhhTVozZytaOS83ZXdDQ3pkVy9jNFUwaU9mL0MybktIM1Yr?=
 =?utf-8?B?ZTNzd3ViYlJ3eEJ5amU1L1UxSGJ6TGZGOWxaUSswQlVuTTV1YUEzdHp4R05r?=
 =?utf-8?Q?M4sXJV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB8459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ynd4TGg3WVFuM2VLRGo2WURIbDdsVnZQQ0JRY2FYajA2SzVrK3cyLy9IY3hE?=
 =?utf-8?B?RXBlUmZZWUlONGI0cHpBcGcwREN3WUN0ZUJ4dU9IN3h2K0paZHZMbXp0Yzkr?=
 =?utf-8?B?Ty9XNkRkU2dONk54Y3FyNSsydDNzNmNmT2M1RDZPd0oxZEtLRmtIM2tQN0I4?=
 =?utf-8?B?ZjVGZVUwWXhaUTBVZkpLdEl4VkwvYlM3OU15S1JyU2lmYXhMVDFaZkxEUE5X?=
 =?utf-8?B?UXUzL09wTTBBYjRHOC8xQTQ4VTdyb2R5ZG9IUE1xVVdFenlMdjdCay8vbTJr?=
 =?utf-8?B?UE5pSmlIY3docEtBc0RvRkxYSjg3bjZXSkl3SXJTb0FkcFlKajB3SUdmN09r?=
 =?utf-8?B?eFVhc29qOWg3M05wRmlFd2RJWW9XTUpDcXowV01ZYzFFUDFOMklNSUEvdUta?=
 =?utf-8?B?bXBLbDVlMEVwQkVmeXB3TUpqQ2ZmWVZ2NUZGM2VRNXN3UDJmaHQ4UENUZXBa?=
 =?utf-8?B?SEJCVHRZMnFiaG81aDZEanhkQVVwdUgwdlVQRW1EZno4STF0VlhhbXNnMFRZ?=
 =?utf-8?B?VThDcDAvZEFBNy9ZMWhLSHRYQkxvUFBodG4vSDAyajRXaXNxZTZWS1p0WDdG?=
 =?utf-8?B?b1RFVHl1UUM5VTRUS2NVM3o3QjdpSUlTbm55STFweXphakt3RjV2L3VhMlZq?=
 =?utf-8?B?cVJjc3d3K2Ezbis4cko1ZkE3T2t5dTVrNVFzMzBoNmtrSXJTaEMxanUzbWV3?=
 =?utf-8?B?OEZndW5vN04vYnBKamhLMmx2elcyN0Y5VC9vYy9XM0hSZm4wTXQxSFh5NWFj?=
 =?utf-8?B?OVFYR1VzRS85UkhxeFVLNXhNNmJQcE02VGQ5ak5NeTh6aHhnM0JQNTF3MTN5?=
 =?utf-8?B?L3VDSVN4ajQzMWZWVzIxS0daWVhCWjEvTTduM2JrdVNxWVhkOXcyVXBqSUZK?=
 =?utf-8?B?VzN2cHZ5TkRVOXB5dmRUVHBqZVlzMzRobmV4WXlMNlBUdXhiMUVCSEoyTW9D?=
 =?utf-8?B?alBPNUVzRDIwem15VWEwa0V3ZGxnZVl6WEdPcjNsdkNqdGh3RzJzUHgrRVly?=
 =?utf-8?B?YmdTbXBpUDY5M002a3VSSWlxNmYveFAyQ25xS0lQSm5rSnBUT2crTjZTL09y?=
 =?utf-8?B?QWM0VytJeC9XWWR6VE9WZWRCUHNtRFhNTmVhbGM0bVRDaVVUM1FwT2txbkJw?=
 =?utf-8?B?VXVUdFIwZWJ2bkdSeXF6UXZvaW41dHRUNXAyaStuMU5RVmY1V1RxOUkrdHJx?=
 =?utf-8?B?RTlwWXlubjBzUU8wV2l4dkM0b3d4K05kcHV0VWlkdTlQR0pzNFU3cW1LSEhW?=
 =?utf-8?B?bElBSEpZaDhQRU1LOHlPazlvck1jMlI0WEU3ak9yYnZHWHdsbGg1MmFqRm5m?=
 =?utf-8?B?TEV5T3dDeHBnd01BQUZmUW5tdFBkSE4vYzRQanhmL1RkVGJva1RKRlhFNVFJ?=
 =?utf-8?B?ZUUxN2pvQU9uU1BIK2ptT3g2eGpKRXJXYkJiclp0NjR3STRCTXBEQlU0UlBW?=
 =?utf-8?B?bmx6THlJM2c2SklwOGp5cy8ySzNNZ2VJbDlMbmNnL2ljenpCRW5DRlJuMkY4?=
 =?utf-8?B?dG04ZXVYOUZvUFdBcFUwd09NMzU2c05TVmhERGVlWFFsWGxsVHgvQk1pRmkz?=
 =?utf-8?B?V0VNZVB1aU5kRVhCYTA1R2hGekU2SE1IV0d6NkRHbzVVQ0xuSGVjWmZNRisw?=
 =?utf-8?B?b0ltRmRxOW9lZmRBU1hlb3pwUmZxSDJwcE1NVC9hejhRd1FkTHc0OTB0Q0Qx?=
 =?utf-8?B?c3Z6RXBFNk5teWFxTDRjb3NwNWlkNjZqb2l0cDRNWE9KdHBtMkc1SVdSUk41?=
 =?utf-8?B?QUFVNVRxZ1ppZndSV3k2MnU3dzI1SGhOL2l4QTV2c3ZHSmFBY0x4dTZvcHNR?=
 =?utf-8?B?RHhKYm93UW1UdXByZm9hdmFxdnNUby9kdThEcFB5eE52RGRFam0wenNKZFdN?=
 =?utf-8?B?OUppWUdMOVpBRWtNRWwwRkxtMjBWNnRSSzlybXpNUXJMUS9BTmo3SFJZZHhF?=
 =?utf-8?B?ZDJndXRCa1pGTHpaZWMxWTA1OFhHTG5NYnZRR01DeVNCOTFuMjhXMDdISTNj?=
 =?utf-8?B?WXhmUGgvWmFrUkFXOUdkNHIycGJtSkJ3UEpObmoyWGNEMUNBTkxMS3dTRlRh?=
 =?utf-8?B?WFJNSDRoNjU4NEN5SVhLd3dXSmZ0QmhKMk8zMGFxUmVXUDZ3Ti8rVG1LbTNy?=
 =?utf-8?Q?9BdZjas5vrxLaLXElJBajSlK5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b006272-49dd-4448-2921-08de07f7fb5c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 12:24:39.0094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZF8W/XifigZBeOgSHMlSYjS8VoiLZKzGIjTXWLLg3BKM7hr8yh9SK6B0Qfv8SMa8ZxcCIFLerZz/0pdYhLM2jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8449
Cc: Peng Fan <peng.fan@nxp.com>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: [Linux-stm32] [PATCH v2 1/7] remoteproc: core: Drop redundant
 initialization of 'ret' in rproc_shutdown()
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

The variable ret is immediately assigned the return value of
mutex_lock_interruptible(), making its prior initialization to zero
unnecessary. Remove the redundant assignment

No functional changes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/remoteproc/remoteproc_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 82567210052893a501e7591204af1feb07befb22..29bbaa349e340eedd122fb553004f7e6a5c46e55 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1989,7 +1989,7 @@ EXPORT_SYMBOL(rproc_boot);
 int rproc_shutdown(struct rproc *rproc)
 {
 	struct device *dev = &rproc->dev;
-	int ret = 0;
+	int ret;
 
 	ret = mutex_lock_interruptible(&rproc->lock);
 	if (ret) {

-- 
2.37.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
