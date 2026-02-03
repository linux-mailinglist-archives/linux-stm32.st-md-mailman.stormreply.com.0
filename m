Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLtmNQAGgmn3OAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 15:28:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464DDA912
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 15:28:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 36C3BC87ECF;
	Tue,  3 Feb 2026 14:28:16 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013034.outbound.protection.outlook.com [52.101.72.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2F3DC87ECC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 14:28:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BchKYVqwJX9q2+zuDvi4zwSvpktPgGFiHdCr2V0LPtJga6fjbe++G5x6icT5h0aFZlg86w4POe6gUvMOZIPW2ItONPQSsCaSYsvtL0u4AjyOZIt4prGDvD3XGoiqFs1ESPa6t5x+sKiUUHU20uvbclssTnOteu46p0/nLS0GZSYC4lnsxHVhs4qv1fVeIpSmrDy9Hmk2/1yjKt+RathHrXzMNvF5PGOi0D+r+HMi8x4U2Ur9P6jCaeUE1YN7iWSBUWknPXc1S6LXKdwdYCdRUOB3vuvq3ejvHVz0COD4m5TZ/H3C6Iny2yTnz9JsuSaVaUOBlz9nTceBh33arn3anQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwq7UWY5KJ2LdZG2zOLcv5CQYXlgsIeYbTVQDO2TEKw=;
 b=Pf321zb2IVq2+bRjgMesxk0R3iPfwd1ynPTNunetGVdK45czR1xBcypU84vHw6g1JPDY7JBuep67hxJ8FgKjgSIWp9tZpuROpN6lMe6shU5qLvaxjoZxjDNpu2/FxY9qJO3IJjTgiP/W5fVfQ50jOSN9/B+FsvrEWh19lh22Jvm5ZxqV4uGLOCFE5bkyaGCToI8Yh4qhKAD1suLWM0RtS++UpCV3nSXJBUMQgTpAGDEcCatbMzOPo+R4BxlSrGoyaUULvNsvLi3FcbQCenhCJgP2iRD88Q3SaVHl97LM88l2XEt8SowQ7rsZIsEDfoAK8ImJEW73VYC9CeheDnK6SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwq7UWY5KJ2LdZG2zOLcv5CQYXlgsIeYbTVQDO2TEKw=;
 b=T3WOYhXQ5fU/t7/wGxpb6sFx23fK3BNycfJgDzVg9vyT+V1fC2FIJeMdNWrxwzyUERWlmT2K5Um5iP3UKl1/ISK4XKcyvN1UnHcxQS5OjF2ghUggjA7vu8CqqcPWIYUKp2gBKxNfHgquqVuVeki7OSeJU5hdqCXHAdd/FW6JPpk2fcNTLWN4BpeJKZtIfgVsOwG1dCfR6YVxNfIPgBtfnokqRq1T4sptEfsV+Xn/s/LDsRb2qk3VDXIWmFRO6ro6ZkeaAqNEZv9fCUCxMC6If0iHGOYF6p5rE+IPj28peVGMZV1rhmWzaSaC+zB/ChqCWoV1XNcFHOOx6ezMPq+cIw==
Received: from AM8P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::24)
 by AS1PR10MB5553.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:474::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 14:28:10 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::de) by AM8P191CA0019.outlook.office365.com
 (2603:10a6:20b:21a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 14:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 14:28:10 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:29:56 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:28:09 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 15:28:11 +0100
MIME-Version: 1.0
Message-ID: <20260203-upstream_uboot_properties-v6-5-0a2280e84d31@foss.st.com>
References: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
In-Reply-To: <20260203-upstream_uboot_properties-v6-0-0a2280e84d31@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Patrick Delaunay <patrick.delaunay@foss.st.com>, Christoph Niedermaier
 <cniedermaier@dh-electronics.com>, Marek Vasut <marex@denx.de>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004C:EE_|AS1PR10MB5553:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d0b838-6355-4ef4-1a48-08de633074fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWVwZ282RWJPYTFpa3pqdkZ0WnNoVXZtYWJLQlplVWQ5OTMzWGlxeG5MQzNv?=
 =?utf-8?B?bjMvSnhwQ2xPZzZRSDMxZzRmSWJ3SVpkczBmdFgrNXFOQmswaVBvbG9KQTBk?=
 =?utf-8?B?N2R5NTZBZjUrK3laWFpNcmx2TWhOcUFyRVlUQVdqbllRWWNzdTlKaGtuQ3FH?=
 =?utf-8?B?WkhQMUdqYUdDcDVyR0UwTkVOOGNtTDJpMUJtaWVJekpoY2lIMjlHUk01ZUFl?=
 =?utf-8?B?Nkh0QWxseUhTakx5Tms1dHZaWUZyallqK0p3U0pEOUtQS2xzellybVo5NWFD?=
 =?utf-8?B?SmRGZDJ3cFRxMjN6QTVudGs2WDlJTysvZXYyQk1HeTRGYXZmbWovSjhBTFBl?=
 =?utf-8?B?cksvMk1wZGRtcS80L0MxVndMRi9UajVPS2RiZjhqV2FYaU9rZ3IydXZFMkhx?=
 =?utf-8?B?SkpnUzgvRHJodnI3Qzg2aDRHWERYNzZJLzArTHBEMFFnSnJKbFplRlluMENO?=
 =?utf-8?B?WjdMeTVrSnFnQyszU2tLcWJxaDBXNEJZTlUrUkY4bERCSVBKL1p6SzNDOE04?=
 =?utf-8?B?OXM5dnBVdEJmYVdaN081emZRdGQ5TzBSQzVhS0thRHJtRC9scCtORkVrTVhv?=
 =?utf-8?B?dGRWV0hDWWd1R21jNjZIakdKRktmMm5HS1REdVBibUh0SEFkRDdWNC9YTyty?=
 =?utf-8?B?QzdDVmQyQXlOaVVIYndUL3NVdWIzRGo5azJ1YVFhUThDRFZvbWVERk85SEhi?=
 =?utf-8?B?WGR6ZmN4VjByd1hnZVRsSmxNN1BHWG5KaXk2a3pZL2hxK3hmM05QSkowUEVY?=
 =?utf-8?B?TjVkMktLWU1CbEdTNktGVXlqWC9HdGJJNG4rVFo5NlA0NmZCVjd5ajBscmh4?=
 =?utf-8?B?RTlUbW1xVDNPM2N2YTN3bkcxM0g3MGJKOFZRaENxb1RJNHBueE5USWRWbnIy?=
 =?utf-8?B?QzZERkgyRmJ0emxXdlVqQXZETDM0d0tkQTFDN09XclBLQ3RPWGlFU2c1dEZJ?=
 =?utf-8?B?S1Z6ZEorNEMrZWN1Q2FwcDNqNU1UYmhuaDlrMVQzc0dPN1lDekRwTGlkZFMr?=
 =?utf-8?B?bmM0OHRhZ0FKRjBIelVIRGowQlN2ZEdlQTlYZnkxSWNFTnNacE5PTEREeXk5?=
 =?utf-8?B?Q05tMHNBK3E2SDFSUzNVLzJ0cE9sUXVLTStHT3VUU0wrY0NqbmhFVmlscWlC?=
 =?utf-8?B?VHZDTWtUUEVhU0xJKzdFczlQMjVhQzNvZ3lla2VpT1RoWGtPc3VZZVN3WHhX?=
 =?utf-8?B?bkJZanhTSWNpRjFZVjNmbWFNU2dTMURpVmlpYTNQbGwrVDRJbnZkWnBzWHNX?=
 =?utf-8?B?Q0ZkUk9adXdDODkyYmhoM1hUTUpwa29DRmxRbGRpUkFvSzd1alVwWmJXemVI?=
 =?utf-8?B?SG9QQ3V4d2RGU2lMQ2RQbFVXRUNMQXFQdFQrRGR3SW9UVU1oY3BVMmlIT2NT?=
 =?utf-8?B?VnlMcGV5a3dPS0RENXFsL1dxdlhHMlByeTNVZVY5aytSVjVMUmtvTVFJUFBD?=
 =?utf-8?B?ME05VzFoK0JGRG1zR3ZETTFFMk9TL00ydU1YM3VHdXVobm5oR3d5ZmM2NElD?=
 =?utf-8?B?TGhXbmJ4eGFvN0NWVlFCU0lVbHRXZTlDSkR0WVgyZVljRm4ydlgxZWRKY1Fu?=
 =?utf-8?B?UVpRMnpTMlBFeHlGUjRNS28xNFY3RnVBQnZ5eUZKQXpkY1lUNFVFakEwSFF1?=
 =?utf-8?B?ZFhndEp3SFlTN2Z0QW9tMmpIWTEzOXFwbEZ0RVpZWnowZHZkM21xNnU0eFZP?=
 =?utf-8?B?Uzg0bHZQOG5UUURhRmdTWkw0aTZ4R2ExSkZNSTJLeXFHSmpYbzdzNGdTNzgw?=
 =?utf-8?B?cXZ1UDc0YWZTVW03dTR2enNTYTdSRlkvdko2Y3ZNblJCOW1pa2E4bmNwQmFX?=
 =?utf-8?B?bklNc3FuL2RMenpNbUxDQkFPZXM4S2dVZUh6djFNK0l2SkVxQm94c1pyelgr?=
 =?utf-8?B?THltTzN2ZjJpMC8zUkxSL05rM3dSamt2bXFKYWFIMmswRjlVZkV6bG1TNFdP?=
 =?utf-8?B?SnhqRmZHZ0t6VlhPcEY4S2h4V1pZemM2aTBNSWlqeVB4OWI2MlNrVXYvSmNR?=
 =?utf-8?B?cEc0TFRJdGEvU0sxNnVJY2o4d0JraUJlUW5LdytEbjFtWEg2NzMvL1NVZUlv?=
 =?utf-8?B?VjU1dk5OdGZRdGlmOEhpRWd5S0N0TDdqUFRKenJ5U0Y5WE5Bb0F0RFRkMld5?=
 =?utf-8?B?M0ltaVNrZVlWWXdhb1MxNjVrWFNjM2dpVmVLZU90NmlJTWNweGtseXZUOGRs?=
 =?utf-8?B?MHA4eXZqaW13c0hCVVhqRkN1UE9yVTg5WDRoa3NTT2lSNTQwTms5amRhM2J0?=
 =?utf-8?B?SkhjZ2pTSDg0NFVzNlZFUTZJVzBnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DPQ8npYR1ZjUoz3bh31+ZNXzcuT/kx3TmtF7tBEhGff/BgT0QPQ9Q+hY5Zl4w/5VJ5H8X3/DJCaG6EzabQwnbx+16b6LMiFRlSqKFHu7uPhlKWeClhqkWT4XqWg7AUxf0f0sLFs1W+jELye73kWBgaki9Ih7o4jYayovS7GBmVHQudEn3iflDfVh/vimp9jE4U3hwEA+uCTc79amgTDTo8VZrzNlhfjY/RDcn46yiOcRVHZAZHVGg2WdTNR/yb96Gh/hIjnCKHEPLeEw7PEjucUK11/eNlA8ikQW5FmfgKo4koTyBoaFGXltuYoNkmJ9cFC/2ld+nQcDGisFRWESreJQEwHN1cUEL7Aup4tH6rI6zJfUJIV6bVjvEfjpBEOsOShr3Mz2HX2F9WWpm4bQ0rkA/1p6IFwt7P0M5IvkXNyi2evYfo5vv5coP2GCm9my
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:28:10.4557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d0b838-6355-4ef4-1a48-08de633074fc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5553
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 5/7] ARM: dts: stm32: Add boot phase tags
 for STMicroelectronics mp13 boards
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
X-Spamd-Result: default: False [4.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrick.delaunay@foss.st.com,m:cniedermaier@dh-electronics.com,m:marex@denx.de,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:kernel@dh-electronics.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,dh-electronics.com,denx.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,0.0.0.0:email,0.0.0.12:email,0.0.0.10:email,0.0.0.58:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_PROHIBIT(0.00)[0.0.0.19:email];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8464DDA912
X-Rspamd-Action: no action

The bootph-all flag was introduced in dt-schema
(dtschema/schemas/bootph.yaml) to define node usage across
different boot phases.

To ensure SD boot, timer, gpio, syscfg, clock and uart nodes need to be
present in all boot stages, so add missing bootph-all phase flag
to these nodes to support SD boot.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi             |   4 +-
 arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts |  21 +++++
 arch/arm/boot/dts/st/stm32mp135f-dk.dts          | 101 +++++++++++++++++++++++
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi  | 101 +++++++++++++++++++++++
 4 files changed, 225 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index b9657ff91c23..3d77bdaa945a 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -36,7 +36,7 @@ arm_wdt: watchdog {
 	};
 
 	firmware {
-		optee {
+		optee: optee {
 			method = "smc";
 			compatible = "linaro,optee-tz";
 			interrupt-parent = <&intc>;
@@ -91,7 +91,7 @@ intc: interrupt-controller@a0021000 {
 		      <0xa0022000 0x2000>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 	};
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
index 9902849ed040..526ab2e1a93c 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts
@@ -350,6 +350,21 @@ timer@12 {
 	};
 };
 
+&uart4 {
+	bootph-all;
+};
+
+&uart4_pins_b {
+	bootph-all;
+
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &usart1 { /* Expansion connector: RX:pin33 TX:pin37 */
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&usart1_pins_b>;
@@ -367,6 +382,10 @@ &usart2 { /* Expansion connector: RX:pin10 TX:pin8 RTS:pin11 CTS:pin36 */
 	status = "okay";
 };
 
+&usbphyc {
+	bootph-all;
+};
+
 &usbh_ehci {
 	phys = <&usbphyc_port0>;
 	status = "okay";
@@ -432,6 +451,7 @@ connector {
 
 /* LDO2 is expansion connector 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
 &vdd_ldo2 {
+	bootph-all;
 	regulator-always-on;
 	regulator-boot-on;
 	regulator-min-microvolt = <3300000>;
@@ -440,6 +460,7 @@ &vdd_ldo2 {
 
 /* LDO5 is carrier board 3V3 supply on STM32MP13xx DHCOR DHSBC rev.200 */
 &vdd_sd {
+	bootph-all;
 	regulator-always-on;
 	regulator-boot-on;
 	regulator-min-microvolt = <3300000>;
diff --git a/arch/arm/boot/dts/st/stm32mp135f-dk.dts b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
index 8dcf68b212b4..59c0d41acd54 100644
--- a/arch/arm/boot/dts/st/stm32mp135f-dk.dts
+++ b/arch/arm/boot/dts/st/stm32mp135f-dk.dts
@@ -179,6 +179,10 @@ &arm_wdt {
 	status = "okay";
 };
 
+&bsec {
+	bootph-all;
+};
+
 &crc1 {
 	status = "okay";
 };
@@ -226,6 +230,42 @@ phy0_eth1: ethernet-phy@0 {
 	};
 };
 
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
 &i2c1 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&i2c1_pins_a>;
@@ -360,6 +400,7 @@ goodix: goodix-ts@5d {
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
@@ -367,6 +408,7 @@ &ltdc {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&ltdc_pins_a>;
 	pinctrl-1 = <&ltdc_sleep_pins_a>;
+	bootph-some-ram;
 	status = "okay";
 
 	port {
@@ -376,6 +418,22 @@ ltdc_out_rgb: endpoint {
 	};
 };
 
+&optee {
+	bootph-all;
+};
+
+&pinctrl {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
+&rcc {
+	bootph-all;
+};
+
 &rtc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&rtc_rsvd_pins_a>;
@@ -387,6 +445,14 @@ rtc_lsco_pins_a: rtc-lsco-0 {
 	};
 };
 
+&scmi {
+	bootph-all;
+};
+
+&scmi_clk {
+	bootph-all;
+};
+
 &scmi_regu {
 	scmi_vdd_adc: regulator@10 {
 		reg = <VOLTD_SCMI_STPMIC1_LDO1>;
@@ -410,6 +476,10 @@ scmi_v3v3_sw: regulator@19 {
 	};
 };
 
+&scmi_reset {
+	bootph-all;
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a &sdmmc1_clk_pins_a>;
@@ -420,9 +490,24 @@ &sdmmc1 {
 	st,neg-edge;
 	bus-width = <4>;
 	vmmc-supply = <&scmi_vdd_sd>;
+	bootph-pre-ram;
 	status = "okay";
 };
 
+&sdmmc1_b4_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&sdmmc1_clk_pins_a {
+	bootph-pre-ram;
+	pins {
+		bootph-pre-ram;
+	};
+};
+
 /* Wifi */
 &sdmmc2 {
 	pinctrl-names = "default", "opendrain", "sleep";
@@ -454,6 +539,10 @@ &spi5 {
 	status = "disabled";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 &timers3 {
 	/delete-property/dmas;
 	/delete-property/dma-names;
@@ -535,9 +624,20 @@ &uart4 {
 	pinctrl-2 = <&uart4_idle_pins_a>;
 	/delete-property/dmas;
 	/delete-property/dma-names;
+	bootph-all;
 	status = "okay";
 };
 
+&uart4_pins_a {
+	bootph-all;
+	pins1 {
+		bootph-all;
+	};
+	pins2 {
+		bootph-all;
+	};
+};
+
 &uart8 {
 	pinctrl-names = "default", "sleep", "idle";
 	pinctrl-0 = <&uart8_pins_a>;
@@ -601,6 +701,7 @@ usbotg_hs_ep: endpoint {
 };
 
 &usbphyc {
+	bootph-all;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
index 54ece71085c1..4efaca84a72c 100644
--- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
@@ -54,6 +54,46 @@ vin: vin {
 	};
 };
 
+&bsec {
+	bootph-all;
+};
+
+&gpioa {
+	bootph-all;
+};
+
+&gpiob {
+	bootph-all;
+};
+
+&gpioc {
+	bootph-all;
+};
+
+&gpiod {
+	bootph-all;
+};
+
+&gpioe {
+	bootph-all;
+};
+
+&gpiof {
+	bootph-all;
+};
+
+&gpiog {
+	bootph-all;
+};
+
+&gpioh {
+	bootph-all;
+};
+
+&gpioi {
+	bootph-all;
+};
+
 &i2c3 {
 	i2c-scl-rising-time-ns = <96>;
 	i2c-scl-falling-time-ns = <3>;
@@ -216,9 +256,18 @@ eeprom0wl: eeprom@58 {
 
 &iwdg2 {
 	timeout-sec = <32>;
+	bootph-all;
 	status = "okay";
 };
 
+&pinctrl {
+	bootph-all;
+};
+
+&psci {
+	bootph-some-ram;
+};
+
 &qspi {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&qspi_clk_pins_a
@@ -229,6 +278,7 @@ &qspi_bk1_sleep_pins_a
 		     &qspi_cs1_sleep_pins_a>;
 	#address-cells = <1>;
 	#size-cells = <0>;
+	bootph-all;
 	status = "okay";
 
 	flash0: flash@0 {
@@ -238,9 +288,35 @@ flash0: flash@0 {
 		spi-max-frequency = <108000000>;
 		#address-cells = <1>;
 		#size-cells = <1>;
+		bootph-all;
 	};
 };
 
+&qspi_clk_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
+&qspi_bk1_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
+&qspi_cs1_pins_a {
+	bootph-all;
+	pins {
+		bootph-all;
+	};
+};
+
+&rcc {
+	bootph-all;
+};
+
 /* SDIO WiFi */
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
@@ -285,6 +361,10 @@ &sdmmc2 {
 	status = "okay";
 };
 
+&syscfg {
+	bootph-all;
+};
+
 /* Console UART */
 &uart4 {
 	pinctrl-names = "default", "sleep", "idle";
@@ -312,3 +392,24 @@ bluetooth {
 		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
 	};
 };
+
+&vdd {
+	bootph-all;
+};
+
+&vddcpu {
+	bootph-all;
+};
+
+
+&vddcore {
+	bootph-all;
+};
+
+&vdd_ddr {
+	bootph-all;
+};
+
+&vref_ddr {
+	bootph-all;
+};

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
