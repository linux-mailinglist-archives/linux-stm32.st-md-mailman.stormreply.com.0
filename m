Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDP2F5PInWk8SAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:49:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C81894E5
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:49:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8BCBAC8F292;
	Tue, 24 Feb 2026 15:49:38 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07E0AC8F293
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 15:49:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bo/snc+51oZVlpFJF4rDYIGCumzqi+Y5sGoj/zWiThdSYPfTxZ3NlndrtaMIKBCb9vx4xxcFPJOM7pZOoPULejVzKIE6WMciGr7IU1/BW/JYkJ1dBL23KZJHTHkRcWT23Xef82xmzfFDusXTMTNLh5FWJPenLL+oWApdha2S9d0qfxcUypwqHK7w9A24V0SLwtXz0+8t7rwoOxf6cLQSYP+9/bnVNLVw3I3i3GtyMKgRCwCDz7vDtf/K4AiprZVW8YN9cgr1jKRwnhNFNxyS2OpsJ6gfhuhFg6ZcMKxjKJkCmE2WZJwHcNyREaTW7qzlV9pSHw2q/efDBPD1x5IwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4jeeJK7/8CU8mzWvhj0dnvX+P3b6oD6yr4AHYU+LwM=;
 b=AHaqfsypTxmVCqiysxY0uxHUbtzoE8BmofXmdHQ41btQuCympvvUI3LADVeiBTFctN6k+NMHwygXZn3O93kKmY8GeakuOtg9hoG/ugWQ2Yk+UovhP32KPU+va6CjUWOTeucf7sl/WtCubKRoSKPhTPgCsb9rcWCAQqFNYipccaMblF7X7hKVjGj42KPkfwJs26vtx+kLtIzVZmA4p/6/hB+lUmEpe4p5BYU9gbyEoDSFrbqyPWNWavMkS0py6SAQO/+A1MdjpwHEzcA5S8a+ME2WD+GFdPw0zPllI9zeHrO7U5eLxUSHYPRqWfQp3O2LGe+6dKlZB5QhDwAIVSjMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4jeeJK7/8CU8mzWvhj0dnvX+P3b6oD6yr4AHYU+LwM=;
 b=aqqyiHZdFTMNcibxjcWsJr7mFoV7f81NpFxmSVJbPuP76gHzudpJUI620TMBPBn0d6tMP1Jb/21aS+I557epfjf7jv1npNaH7GWJIPZ/iDd2LIAwYKNMNLsFQCYwbZAIDKbkp49WDQNKDww3Px6uD634Sxj/RY/ZwkUKUhdGyjVf9PbmEIgH1dT8hyxyJpXJpsOObUkSJua8B0waSjaEHVltpkwlY1c3s3Mx4sGS3YpYVDbDvbt8fo7V9f19iHDFRquviJA0Xdokh85aFGiWQbjpWA/wIMCmeY0tS7oGheRAnHmvtTvqJzkCvj49DLk1G9Zo4wH0dF72a3tqXcAl0Q==
Received: from DU7P194CA0009.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::8) by
 AS1PR10MB5238.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:49:35 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::a) by DU7P194CA0009.outlook.office365.com
 (2603:10a6:10:553::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 15:49:33 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 15:49:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:51:41 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:49:34 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 24 Feb 2026 16:48:10 +0100
MIME-Version: 1.0
Message-ID: <20260224-stm32-i2c-dt-updates-v1-7-347cf6fca7d1@foss.st.com>
References: <20260224-stm32-i2c-dt-updates-v1-0-347cf6fca7d1@foss.st.com>
In-Reply-To: <20260224-stm32-i2c-dt-updates-v1-0-347cf6fca7d1@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.130.74.193]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|AS1PR10MB5238:EE_
X-MS-Office365-Filtering-Correlation-Id: fe17938e-87cc-4048-7145-08de73bc4f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y2JoNWUwbG96S0V2SFdtS3RRZTVUekw4NWpZNVlweXA2Z1ZvMHJCNWVKaG5V?=
 =?utf-8?B?dEN3bUo4WnNUNUY4TFo5cXA0ZnVGTXpXQjV2VzRrUVFlQ0xYNkV4QWIwb0N1?=
 =?utf-8?B?T3BjUzFRRkp5bzJKNVRJQ1BXQ25PT0tza2xkcHZnNVdUTHlSck92dDJoR3lw?=
 =?utf-8?B?cGRHOU1LUlV6eUM2dXFxWENNTWlQZUxnTHJQNitNd2V1dmxLMUw4RGZGVnhw?=
 =?utf-8?B?YzFUZXpzdUtoaVVyc0RrdTBlcjRGOWIwRXRCTUNCalpFYS9ZNENEM1NTcHB2?=
 =?utf-8?B?MTQvMVNUenFNWDlOc0pMWGRHM0U1a0M1amxEUUFBU3hQK1Vvc29mbjJMRWFJ?=
 =?utf-8?B?U2ZPOEU5bmRtUGEvTGpPaU40dlQya1VDMVNja2lueXRHOHdyYlRXemVxSzl1?=
 =?utf-8?B?T0FGcUNQVGZpK1B4UitMNlhQUVpkOGRwbzU0My9YY3c1TGROaFpsRkxWS0pY?=
 =?utf-8?B?ZGJ2VUF6bFRJOUxDWUZML0owSWZHZVZCdEU2YXZKK1RFbDdsOW9WeUJQdVE4?=
 =?utf-8?B?YkdabUd1T1lGcVNwVmFvREVUV0xXOVgzcE5QYUU2YWNQNkhjYUFhSzZYUjhh?=
 =?utf-8?B?dzBVRWtHU1pHVThpb0dXNW1aYUdTb1ZpMWVhQk1UMUVXR0h4RCtMT0tacUc4?=
 =?utf-8?B?V3RLUjdjT1o4N3AwNjNGWW0wOEN6ckJaQnQ1RTNaUllESGNqbTRPZXhOY3RV?=
 =?utf-8?B?ZWp5UTNveGlqWkhyRjQvT0dnVE0rTU5BcERwc1FSaERQVjZVbm1TZXB4ZlNh?=
 =?utf-8?B?RVBYWElRUW9RSVBYZStMQk8rT0h6bkdqTE9Fa2tVMCsvSnlDUDlIZnFxQU1D?=
 =?utf-8?B?WDJwMi9LMlQ1S1JNSFVrQUdNWlRaMjErTTBHYWNpTXhwaUZHR20rdUwrOEgz?=
 =?utf-8?B?bjZDWFIwNnpvbXc3UEg5eDdKcUhEMEJtM2djS0ZiNUhTaFl4Y1hFb3FVV1RP?=
 =?utf-8?B?ZjdYUGVtcXVJTWk5bU90T0ozTnlVRDJXd21YcHNBaXd2Q1lyRDE3Z2FGUUs2?=
 =?utf-8?B?WDlNVjhnK1ByZHNPOHZaZXB2dko1UG9jUCs3VERsTnBoVmNMSWFWMVhhd0x1?=
 =?utf-8?B?YlJZSzhGaXFCTVpoeU1BaGdsdnk5VVlSODNwbmdWRjlCYklTV3hJb3lBSHNQ?=
 =?utf-8?B?ZmpVK09scTR3Wm40b1FRdENiWmFueEtMQUQrUFdqdWZoc25KSmM1enV6MnZx?=
 =?utf-8?B?ZVEwNTV2OVp4cXRKMXcwazYwZHVDSmwvOGVXb3RnSmRpS0V6VDJ3Um5qNjZJ?=
 =?utf-8?B?d29LZVM2L3UraTAvWk0vcUZZM3IxTGx4aStPakpibVVkbldwYlVTVk55WFYx?=
 =?utf-8?B?Qlpqa3dUR0ZUalkva2JGME92ZHhvTkRqZGFIcDN1aXRyTkxDRW9FRVBiWEkv?=
 =?utf-8?B?cHlFaW1Vb3JiQ2xwYTBtRFFuQjQxR1ZBZHBhSjJIVTl1MEowRUFqbHh2Zk1h?=
 =?utf-8?B?YnN3Y1pDZVJoYXpxY1RxSjliMFRMZU11ZkxxSnp0U05PMXpkdG1LUndwWk5a?=
 =?utf-8?B?dXFsRWxIcXFsY0xHd0NqZE5pUTlNVVZ3d095Ty96Umw3NHU4TVFnMFhScHB3?=
 =?utf-8?B?VytoK1I5UE14bU9mRGlOZjdPS1gxbUU3Z0xPNnVvakpTWk9VNG4wM1RZVHBM?=
 =?utf-8?B?allNcUNVa3Z3YUdIeEl6N0k0cUI1WlhtUzREMmo5WHY1YTgvbGZTa3puQTJo?=
 =?utf-8?B?TVJicVFVc0NyZ3R4c1VFOUU3VWtOWWZiOGl6eWRVci9qaHpnL1M5UnFLZUlt?=
 =?utf-8?B?RFNMVTZZSzJUeEQwcVIrK2xwdFR3MnIyYWwrZ3o2V0t0YjdrUFlta1hveWor?=
 =?utf-8?B?cTZkQmlOZFRNV0JkKzloREo4bFRlR3hRS3FtVEEvSHM2VFRhc212UXdkQjEw?=
 =?utf-8?B?cmtZdVZoWnlWQXVkVzRETTZHTmJqODlucDVyS054V3JIaXo0MGUrRFFIQ0xE?=
 =?utf-8?B?QWl2SWNLc0NvcUNrRFBhQjBRbkp5UVc3RkpmQnZxamRmS2xIcHQrMlRmR2JB?=
 =?utf-8?B?OFlYZUZyampUbmNBWHR2TGU0akFtMWJseHBGTkU1VTlIOWtEQUxIdjJGNWEv?=
 =?utf-8?B?ckpyNHA5RjBzbjdaTmJPVWt3eGY5WHlvSFNYVFIxdkg4YnVSL2dXT2xISDBG?=
 =?utf-8?B?Z1ZXT09PMlE2L1ZJdDVaY2U3eHBxYUtmS2hjS2I3WlVFYUlvTWpLU0tIdWNn?=
 =?utf-8?B?TG5rcWpFRVlKRTdZUUxyb01zc0poQmFDYkVqcVgzOXUzNjdWQ1NjOEpkc0ZK?=
 =?utf-8?B?RjNIdCtDOVlpeEVERGJsN3hBQVV3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TVZHtenS6Sz5eX1TyNRtDMqnJI9QN2HzC08diWAl+t6VgsDN9ckXmtAISXOaju6o1jxnggSo21fSgx16h4oVU5LpOdmGRPUzr2zien5UdAfzhRG6WYnEirp1Abv+QB7cI+/7sHYE0nY/p0y2NTrz24lboPPiiPaoXavHRT50UpXoVFcBLRcmHOZ4O6ZSuzDzcfAGqOtnX3uPesiL72qkNQDNuOavnu5Zd5eObC/FfcfYvB3Cxkeo9tZG8KV30bx+8ANYdrtBeeU3j0yksdFxMDRnMmvhbgVvgX43vu1nJSf4TOPjnCODNASvbP3mwJ0W2Dls0CLZrD7ygcvKUn0fJH6gt1e10ct0kqvJQroEMgoudqovR1KUcw2Z2AlQVenELP8Xao7Vd30coQVmjAgnE21ufr/dDHkTQ60CM7ntk9xc77O5/eEN8s5YXtXZvGGK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:49:35.4783 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe17938e-87cc-4048-7145-08de73bc4f60
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5238
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 7/9] arm64: dts: st: disable DMA usage for i2c
 on stm32mp257f-ev1
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st.com:email,foss.st.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.104];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C90C81894E5
X-Rspamd-Action: no action

Keep DMA resources available by avoiding usage of DMA for i2c transfers
on stm32mp257f-ev1 board.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 852a73b0c516..14e033f365e3 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -261,6 +261,9 @@ &i2c2 {
 	i2c-scl-falling-time-ns = <13>;
 	clock-frequency = <400000>;
 	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
 
 	imx335: camera@1a {
 		compatible = "sony,imx335";
@@ -299,6 +302,9 @@ &i2c8 {
 	i2c-scl-falling-time-ns = <7>;
 	clock-frequency = <400000>;
 	status = "disabled";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
 };
 
 &ommanager {

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
