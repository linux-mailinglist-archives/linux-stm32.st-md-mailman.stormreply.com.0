Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oE+PFyq/nWnzRgQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:09:30 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D5440188D46
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:09:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87AA7C8F28A;
	Tue, 24 Feb 2026 15:09:29 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010018.outbound.protection.outlook.com [52.101.69.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6EFFFC8F289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 15:09:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMO3HPsRqn0EPr9t94kA4U2hsyQZk8r07z2BlyPBhoNnpzedqTkqPcG6rrON4GAKbaCglHW5EZTskk0LWrPczCW1CLW7aR5J8wy7q6kuzTJEnyyx32uGQOdxwkF/inHAXq53gut4H5AF/Uiw4zLTFd2p0cpABRmXR0ONs2MpeXffrhrvr5UsP8kntjcJbZlV/6+YzAe4VR2NpdSS37tvJOiSrdPdQcE2UJPW9tQnSaAs6GUCSi3uQjWkJkzBhwv5fLnPG2RTlG1YiIoME+HSRf+Vv4+4k/6aNSCJ3raouPMTRtv6K+nGc0MOXhqQyKPP87PMQfFogrQlRBU1rG5/uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8L09W996mg2QgCyJW4Mq63ohsHDJs+G1GSUTU+1jgM=;
 b=viJSZkqN8jiNP0VLqxL8UqVgevdf64WzbDoos7ZmwLdRIFW/c1bn9vX1nRIUi2+3dS0hLWZboKjwaxNkY7InVrQcqLro/ynP4voS4WqRLtSF7srFRBIBb2kTTOB4v0n/8kjVhYbRjAVXxJZ8Wh5TQzkUu3T1R5W4MFEFF39jA/01lvhJY/UbmzOwBVKRVlWE3FzUdumQbWIhXj27LAAYrt4716A00AyUP1/UPVIxXJMpvfj5a5UoMzhmR8OOnxvFej8NbJJQMqBNkUQSTUed8PyMdkX8gpBniq6nECWKMBTHEQquv5svpPx2Hdc30xSF9eDKqd2AXy2q/0ZV832k6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8L09W996mg2QgCyJW4Mq63ohsHDJs+G1GSUTU+1jgM=;
 b=Bt2R4phnm2w08jrYgG0r8K+DQ9qGq/7EEhjqHQAhykuhMJiw6OnEBGR+JxsIFPFK8AUvX96Zrv2wT0YY7L7Ro4P+kpDG9SbQaQzWXz1C1FW5DnAqrFaE17tVhGGKEfX7ASZd+os30ij81+AKFpGdcgNXH0f4gvdc8TXuxvPsNqoN1In/pVgqeFFRFu07MtXxurp3jDRQpCz7rbaW2whN80Rzpfg6Dp9207pVp2eKOUSiYv9ya0CbszUdpBJKTg1bASCInZLQfxN+8h7K9Kx6Gu0Uj5MEzcyUgB50WUq/uq5tTszmDV7+sHz93txAKJ3Q+TorlC7ikZgsfQk9duCWqw==
Received: from DU7P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::26)
 by AM7PR10MB3157.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:105::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:09:25 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::e2) by DU7P191CA0016.outlook.office365.com
 (2603:10a6:10:54e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 15:09:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 15:09:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:11:39 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:09:22 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 24 Feb 2026 16:09:22 +0100
MIME-Version: 1.0
Message-ID: <20260224-spi-stm32-chaining-fix-v1-1-5da7a4851b66@foss.st.com>
X-B4-Tracking: v=1; b=H4sIACG/nWkC/x2MQQ5AQAxFryJda0KHEa4iFhOKLgyZikjE3TWW7
 7/894ByElbosgcSX6KyR4Myz2BcQ1wYZTIGKsgXRBXqIajn5gjNS5S44Cw31s67tvLczC6AnY/
 ENv/hfnjfD568AihoAAAA
X-Change-ID: 20260224-spi-stm32-chaining-fix-5363946e7f3a
To: Mark Brown <broonie@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Clement LE GOFFIC <clement.legoffic@foss.st.com>, Antonio Quartulli
 <antonio@mandelbit.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.130.74.193]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|AM7PR10MB3157:EE_
X-MS-Office365-Filtering-Correlation-Id: 646f38e3-19e8-463b-0fc6-08de73b6b1c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGVkY1hLYVlqYWYyRENIVGdXM3pWYUVDUUpvZ2ZVSjhmVjFIOFYwSWgzaTUy?=
 =?utf-8?B?WUNJbkdKa2JiazRFZXBPL1FqWk5sMnJWc05vQWNGUnVsOHdYMm11SXU2VVRj?=
 =?utf-8?B?R20vUXltSno1bS9waFBsc004dUpja0FuMkFSOUN0OGgrcHRQbmFIQzBqLzBR?=
 =?utf-8?B?b2NhZnNsZWlPOGQ5U2NBZDhuM1FvejdQQnNNOWhBajVCV2JiUVFKQzhTbGdF?=
 =?utf-8?B?b3V0TGlONkdvbWovcnRXeXJBQ0FRUnU2dllndTg4a2R6b0d1TlRiR2h6SG9V?=
 =?utf-8?B?WkJTSjJqWTVRdkdSRVNTcGdrM0wvUUI5WjVQMTZxVU5IelljbldtakV5a1d6?=
 =?utf-8?B?U29qdHN4MDcvbkRHVlFwQXJqTnZPU3hLUjArUXViVW9kVk9LSkVtNkZEQkMv?=
 =?utf-8?B?NDlRZUlMcDBLd3ljVjl6SHp0TnpMNENBWUwyOWNmVHNNcFY5d1RMdk55WjRu?=
 =?utf-8?B?Q3dEMGs4NmdaUXJJV2JmdU5UTjBRaEdqdVdtcWNzNDBPNFNuamR0S0hPeUdk?=
 =?utf-8?B?L2VVNCt4UlZxcGFwVVArVjA1Y3dhOWNIb0N3MUlTZnVsL3ZxSXI5a1dFYkxx?=
 =?utf-8?B?T1ZBa0p3Sm0xZWlZSWhEUzRldDlPMlZ3QklXUGhERFNYWllwa3lid3FJajRE?=
 =?utf-8?B?dlhDc0NPSWVMKy95YndkUnh4Z2EyUmswTlc4bS93NTlmckJweFdYWWt0UlV6?=
 =?utf-8?B?NE45WCtYdUtKNzhWYklXR21PM3FLUjcrZDdydTlzcjNhZjUzRjRRaGdUUHBO?=
 =?utf-8?B?NnZtYllDS25QRGxsazBSSkJvVTVwR1IwUGJMbHdnTUJzdzg1SUlTMWh1dS9D?=
 =?utf-8?B?Z0RVMlhudzNhVFNOZWY3dFUzUys0R1l2djd2VFd6UnU0elF3ejVxcDg5V3c5?=
 =?utf-8?B?RytXbXNaTHNSajVUOXJjTWdlOGViM2ZWMDRhNDFCcXRIdUszcUx5YTk2OEU3?=
 =?utf-8?B?d3hQSzRJRmM2OGdJYkxidlFXNXh0dUNaTWE1MXhJTFpRYmxNL29mSExUMjVz?=
 =?utf-8?B?SFEzMENPUEZ2MWNzelF6OUF3R1BKNXJJdFJXSTFzV0x6ckFOQ3FtakFSdS9z?=
 =?utf-8?B?eXZzeVhkdnkrb2tKMzUwanM4VWhCV2h2U2QwSTJ5VWo0N000OGtYaC9YT1Fp?=
 =?utf-8?B?bFdRa2hzV2tNWWN1Vk1pamhjbEpjR2F1bElIM0lMN3ZMcDM5MEMzdGRkbEpu?=
 =?utf-8?B?SzQxTXJSU2dieUlqNnBHWitHTHdPaW93N3dGSjd2bjgyeVBnZmIySVlvUVZO?=
 =?utf-8?B?SWs0WUtzajVudEhuYnZEWTBaMG4vRmx6dTZwb01ES3dDbG1GTTZmY2dZZU50?=
 =?utf-8?B?U1RZRWpCUmJIOGdkSlZjeFdVamtSeG5NaThSc1hLR2ZaRVdkdG9ydnpJSXov?=
 =?utf-8?B?UEphQ0U2M3hsSGFaTk1sejV3YzJtQW1reDNrSEFxaGVITGFMZHJlSFdkZkEv?=
 =?utf-8?B?RFRLYys0eGxBSzBLMnB2eUxjUEhQZEtMMXRKNkxEUVovMkVNbHBjbWdvdnFi?=
 =?utf-8?B?TWFBV0c3dnVmZno4eFdsTFJSZTE5RW5EUE41ZUQ2UkxudUhmOGowa2JqRXJ2?=
 =?utf-8?B?MVhPd3Bib0FwYmowUTFLM1Jqa3JPK1lBdEVFbTlSTFphUDdmaUh1VVhSWnNG?=
 =?utf-8?B?QUIvaUdScWxMN1Y2TlUzNHRwdlNLSExybXJrKzhiR3dLbDdqZWZvWlllb2Nw?=
 =?utf-8?B?eFRISm5SVHFLUkkvR1VWcGtZNi9Dam1rVGVjMHA2U3B1cGQ3TWR5b2pvU1Fa?=
 =?utf-8?B?T0VsNE1CM1k1OUhwOGNGYkloTXhmcmIxYndwK0xRaHp3MEZNKzdIMXVhYngr?=
 =?utf-8?B?dUgyVGZYbmhvemwyQXllODJZODJQQWNaKzVkdURZbkx0eDVrb0szVGZveUk1?=
 =?utf-8?B?QzRTSmc4eGw5ZlRvbGswZmNLa1U5TFlkSXB3Y045UTBUOUs4a1d6RHpGWVBF?=
 =?utf-8?B?NndvczU3KzcyNjAwMWVFZnZvM3hySFYvQlVwNVltUDR1R2tRS2tOTTMxYnZB?=
 =?utf-8?B?dTI3VlVCYnBLS1VMTy9VMkpFR0YyNmRTVjJvOEc3c0N3Mk41Q0Jjdzc4MTJ0?=
 =?utf-8?B?a3l5MldoRlU5MGkyWlV0WlVrT0dnUmd0SkllU0RoVWxEUkhHb2IyKzh5bkV1?=
 =?utf-8?B?TnphTUVrRzdpYjBLWEJiUTJOa0RmQmJGZUVtOVBLNTRpTUoxYXNzUGhETHk2?=
 =?utf-8?B?czRLNDdUUkUvbExZVDlHM0lNWmF6S29rV1dvQWU3MlUvSC9QanNjVHZ5N25S?=
 =?utf-8?B?a3ZnbXltN3hqS0dhc2V3aGhhZG1RPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: iHE2B0CV5PzihKjkvNPiouLRJcjeRjozk4bXDMYoPkLykfplDm8fXm7LbnAqDCtll1Vz1121qvylHg0PpJjG2ONlrRX5IEXkzS7WBi2KofDa55I0/jEubeCgNz8rNHDXbRe7gS8BqKiSQZU4REIkmO+u9/JjEoH1PQ24xnyuaYcSQJoA63bClm29cxL1Z/YbGQrkZcT9Hjfb/HcZJ/eYogruRoEMOeHTY+LGbD0pwNquVtig1wu66Fbalsc7zEvF/v/RqIRJckcEu+rrUxnBpCNiBIwWpwYDw1g+BnPQiefbV54ztBGBLB59tjzvlskKAJMzlckWiXSzakUbFluleyO9emoJyirizk1p/nfsTfkL7l6CSaFxwYGnvnSTYe2gjNyLIMQahgqEeFU08ogCqsbvqa//IRhLQtQu6oCx1YyEqoj2vQiUXW328NaQXKjV
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:09:23.5387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 646f38e3-19e8-463b-0fc6-08de73b6b1c0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3157
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: [Linux-stm32] [PATCH] spi: stm32: fix missing pointer assignment in
 case of dma chaining
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:clement.legoffic@foss.st.com,m:antonio@mandelbit.com,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-spi@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,mandelbit.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.078];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D5440188D46
X-Rspamd-Action: no action

Commit c4f2c05ab029 ("spi: stm32: fix pointer-to-pointer variables usage")
introduced a regression since dma descriptors generated as part of the
stm32_spi_prepare_rx_dma_mdma_chaining function are not well propagated
to the caller function, leading to mdma-dma chaining being no more
functional.

Fixes: c4f2c05ab029 ("spi: stm32: fix pointer-to-pointer variables usage")
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/spi/spi-stm32.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index b99de8c4cc99..33f211e159ef 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1625,6 +1625,9 @@ static int stm32_spi_prepare_rx_dma_mdma_chaining(struct stm32_spi *spi,
 		return -EINVAL;
 	}
 
+	*rx_mdma_desc = _mdma_desc;
+	*rx_dma_desc = _dma_desc;
+
 	return 0;
 }
 

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260224-spi-stm32-chaining-fix-5363946e7f3a

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
