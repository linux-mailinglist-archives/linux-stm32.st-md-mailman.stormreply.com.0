Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9HOJEj2KjGlTqwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Feb 2026 14:55:09 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2627E124FC1
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Feb 2026 14:55:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C0AE9C87ED3;
	Wed, 11 Feb 2026 13:55:08 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9313FC87ED1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Feb 2026 13:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lD5pW3OWp+pArLEBclt7mZd8HlfppwnU3fFH2GsVeHD0HJKENOP9ZoCQGs1/5SP92qUd2CZKBLa3t3tejER+j/xTku5n1hxvPVLVQ9ja8PZy/4IMuy8r8riCCsznPyspUyy5lhvTl3UpI4EAOobnjxixv/nsoI7N4TFLK09V3Ag9UZW67obh9yXxnr/0B81hMNAxeJ323ZEnB7OaLq5M4choMfofIE+LyguTs4eangqN2r9MaqCFhULdC/KQHwqg9bPCVwM5b7fG8tm9huBHE2lDE23AP8TMcXQkVHqj9uBA2VjUPjjg0zqGMph7uBp/m359+ynJ86aqyK+YU8YlXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ml57KqT5lzhPCBF4ThgoCaTT6BVdlM43pDiV1QmsKCA=;
 b=xN0ALO6765xdacelDEZxC2iND/8GU1WaFkTTSTbHEb26mPz8pasRSL0ZbGaZ9nvoK8l/eNHnOuSvLWiG4zZtlFgI+MtfKZWgdYQMyanIPH/1YGboNLmvmHrUJ+xNMNoTXeen/enLyi2tDUEgeR0Li/5X48HUsQcvAZZJTdg4GAaOM8fK/4zuhO6o333xBCm1XXCgwo01ifGd4FnlZoVEGxTm0+gUwsyrx/ZTrZyrlTctXvv+z8F+b9u8pJVY//agN3lfgd1c/QAiywRCF9f+az7K1/zj1oEVoqAnf2sbANkfJJlYUfoNJj6Jj17Qa8uUbn3p1vgnjhOXFg91T0cIAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ml57KqT5lzhPCBF4ThgoCaTT6BVdlM43pDiV1QmsKCA=;
 b=n1RxKLhVqccnbXqjnsiXvl3mdpmZc6x+TBXHIskVT+MxQLL73kUKkl+HR2ws5iO1pgdJ/0pysSLDvwB0QyUL39eJf8qcghXBzz+4gvMtgm+NVE375eiR+Z8+EvxLopvpfqbZkyrCnwLwwhsADqv78jUnk4JwMF9DCcqa7Ldsy9aIcW4W6Gh4ZeKkuBf/93e15jmOyCpyUOJY16XerFy4yBcXCntNl1UxGyy1CIh7A5TuSNsF7K2SXO3SKJgCOrWQ8uC/2zizUMFgUVZVTdgkNYEtTnM24eJoi2lsAOuskD0AstXADmIUEKgFGs4ytkx0DpLgxDIoemrjhAyMMj71NQ==
Received: from DUZPR01CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::16) by PAVPR10MB7010.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:305::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 13:55:02 +0000
Received: from DB1PEPF000509E8.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::58) by DUZPR01CA0009.outlook.office365.com
 (2603:10a6:10:3c3::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 13:55:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E8.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 11 Feb 2026 13:55:01 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 14:56:43 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 14:55:00 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 11 Feb 2026 14:55:00 +0100
Message-ID: <20260211-upstream_stm32mp21_bsec_nodes-v1-0-8379bf97b0bc@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADSKjGkC/x3MwQrCMAwA0F8ZOVtYMqjir4iUrI2aQ7vSbCKM/
 fuKx3d5O5g0FYP7sEOTr5oupQMvA8QPl7c4Td1AI/mREN1WbW3COdiaJ8qVMMwmMZQliTn0zDf
 yfJ1ShH7UJi/9/f/H8zhOgY5FA28AAAA=
X-Change-ID: 20260211-upstream_stm32mp21_bsec_nodes-16aa826a73dc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E8:EE_|PAVPR10MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ec61145-1685-43d0-94bc-08de697526e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTgrenJOR0h6ZkhZQXpnQnBNdStpUzBiQmFyUGkzOTFwajl5S2tIa2dpR2wz?=
 =?utf-8?B?SEt4VWoza0RPSmRIcGRxTURCSE5BRkswdDdtSUo1YkdMN0VuZDh1Ym1jNjVr?=
 =?utf-8?B?eThzTUxYbUtIRTBoeC9rVno1MDlRdERxeENoSS92aEFROWJrOGtVL3I0OXZW?=
 =?utf-8?B?M00xbFN2VGk5MUpFWDZhclZaUk5ZNXNpNnErdVNQbGNkNXRyaVdSSkZ0Vmhr?=
 =?utf-8?B?V2tmZ21VOWdpVHp0SVNTV0dmSWpXYVlwSkN5a3lVTVd5WFRKZ0ZVRlNqemgr?=
 =?utf-8?B?MTR0bkNLRC9qRGZ1MWN5WUJoTGNDazByVXFtWFFkYzRNY0JZcURDVlBFWjFC?=
 =?utf-8?B?TEJKRFVFK2xsZHJiU1NrdDJBdVRsSUlGbjVTSnhDUHE0d0tPN2p6NkpGZlNo?=
 =?utf-8?B?b2pUY0s4ejlmR25udlFYUytJWUE0UXhuVEY5UHpmcENOemR6WDE2TTAwNjVz?=
 =?utf-8?B?WDFNOXhrS2thdEdDekhKclFJdng3UFM0bFoyLzNDdXRLRTNGUmNsTWlUN21M?=
 =?utf-8?B?WjUvbUFCSjBVTHpQbERPRTRQRGRoMjdCaW9UeFFTS0pBc2NicGsvMHVrV3l5?=
 =?utf-8?B?eWxQVW5wZFZGNnlqanczdU93K2pJa2NRcThxZ1psdWp1NkFXSEpkYklSaXVY?=
 =?utf-8?B?MGhubHIrOXlYVlZkL1FTMi9oV1UwMUFVaytEdHNibUpZMmlMTmZKSjBqSjh5?=
 =?utf-8?B?ZmV4Y2RuL21GSlVTQnR2K3JzK0RvZGNGQmtwZ3A1anZPZEpTbTFTMG1uSldX?=
 =?utf-8?B?TGRrRXVYaGJNWkFzNFQxMDgvQzRWUkIwc3MxYmZLZ3lxanlraW5vcDZTWkls?=
 =?utf-8?B?Sm9ueWNIMDFHc080K2NJSGE3N3d2cVZHVEwwU3RLYW9EamlTNDdzWFBScHRl?=
 =?utf-8?B?TzhlSndlVjFTRk5Ya0JtY0pDNnl4K3dXWXlYTzJSS1owYjcweW5ocHJJZEpG?=
 =?utf-8?B?UlZoK0dDK3VTb01tOVRwZ2U3Wk5BeEMrSCtsODBUZG93dXhOa0pKVzNjdFY3?=
 =?utf-8?B?eDVNNTZJRFluS3U5Q2lQQThwMjY1cGZLNm9pY1V0d3pCWHA2VWRkdzFaK04r?=
 =?utf-8?B?bUYwMmNGM1RSa1I2TW1rOVNyRDQvdXExTDZjM3ZmVEdhKzRsQ3VFQVVqRjVN?=
 =?utf-8?B?M1JRL2EyM0VDTTFwelRJc2lENzJRZEs3QkFsVnM0dlBFZmRmOHhGMkJDQ1U5?=
 =?utf-8?B?SXQ2cTFaOVQzOE5jeUZTV0VNeTNtMmQ4aU1RekNsL28xclIzRUZwVGdGc2tx?=
 =?utf-8?B?LysyUkdjMno0K3ZxT0ZTaE4rWmhkcE05cXNqa1Q1c1JIZHplakwxVXp1ZHN4?=
 =?utf-8?B?YnJjOTlwVCtWNHA2a1hTUDJ5dEJPZ1BhSmxrWkNmVUk2dzdMWjB1dnQ5VURl?=
 =?utf-8?B?OCswc1puSjVhMThGdkF6QmZiNTBiUEFlcjk3azFxemtYeGpkMkYyMDBqNEtx?=
 =?utf-8?B?eFlUR0xMVlZDN1V3N1RmTE9mdG0xSDJ5Q0xpS1QwWEVpcEhNcGhoaktnMWxQ?=
 =?utf-8?B?NWRxRGtVcTVqdDNvSklod3g2NlNIMFRQWHA2ZzhnNFc1WFNpOU8vRVpFQ2hs?=
 =?utf-8?B?Y3QzR1FPem4yczM1aW9OaGlKaFJEdzk1R1RhREd5QkY1UVBlUS93NmdnS1pz?=
 =?utf-8?B?VjY4TTdqRmpxL240cmIrSTU3eUJySDFkcWpOSXNBa3QwZm5UWWcvK29jRlhj?=
 =?utf-8?B?dVVrazNxSFN2S1ZEZlNWK3ViWVFSdmV1VGc4UXM0dXBJUUZzWkRKait6M1hp?=
 =?utf-8?B?amJHLzZJTGdWcTJVVVJhVGl2KytmcTJlTVc0dGFKeUZvYzRQWkdhaHV3ZExP?=
 =?utf-8?B?YUNndlRGeDMzcjJKcWxObjRpSW9LcVkvdkdsa2l6N0tIdTZLaCtteVFKUWN3?=
 =?utf-8?B?V0FJZXRFZ3VSdnNabHFxU21zdTMyZzVNNTk2L05IcVJqY3NvSnpKd3FJR2dU?=
 =?utf-8?B?TnI0dGMvS0VsazlURFFEMUlFZTJJeVFMVnJyVk40UVNtdTViOWMrSWcrK1lo?=
 =?utf-8?B?Nk96UDF1VlNXcU5Od0xGVW9DVE8wNXR0VWRBbElaR1UrZEExV0Zldlpkc1FH?=
 =?utf-8?B?YkdUdTBvYmJ6WnhOT3B5ZmIzbTFVeTBCOVdSOFZLeGVZbVNTZmN2bjZIc1lt?=
 =?utf-8?B?V0EzNXQrNmZEVldrMzF2OFdNdzNHWkRTQUFEVGQ5UUljSE5yamVubmdURVNv?=
 =?utf-8?B?M3libThxTHFFTVZxbkdnbkFsMTFib1EwYU5DZkwrOU1qN3cvSkY4elRKMkF2?=
 =?utf-8?B?Q09KaWtLaDBhRG1LSlVvNmFleUNnPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lTpfWy6dqDT/x3+2sEk5OfmBJy9na6Lep78cG83QXwrCZgN1c1e++4t3XE/Pc+tuc2uTAdMebUrTGHeXQSe2kLpYKKonNQdVg1KvSdKrp7i59VSD1YVbpoHKB4VhxebzvheCKRZa+XPPbD5WhyT++yYmfkvDYCOqRJbuj2sBMFmRH6hzmb5qGHXX2txDPdznA1Hn+OKXIbs0s8c5c8gfr1xO6N5QHJL18i8dAaCJDGhPrfa5yopyoW0oNabXFObzCFHEkiUsSEcLfHdgRaCIE3ugGBC+2LZ07Sttuj9p81rDcUyVxegzKV/TVPJnlp1GWxT41fPtW3blV2OX1wFKp9ypXvpwowUGSoWXG2RoQY90Am+5HSkmlsXBxvdm2WcpMJJ1NVDOeaneHr6EfAX/HuA0gOVZLDasfCiFvQoLXbyO1iU52ISPDSY1ucIguD7S
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 13:55:01.6752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec61145-1685-43d0-94bc-08de697526e6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E8.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7010
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] arm64: dts: st: Add BSEC support for
	STM32MP21
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2627E124FC1
X-Rspamd-Action: no action

This series adds BSEC support for STM32MP21.
It adds bsec node in stm32mp211.dtsi and bootph-all property in bsec
node in stm32mp215f-dk.dts file.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (2):
      arm64: dts: st: add bsec support to stm32mp21
      arm64: dts: st: add bootph-all in bsec node to stm32mp215f-dk

 arch/arm64/boot/dts/st/stm32mp211.dtsi    | 16 ++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp215f-dk.dts |  4 ++++
 2 files changed, 20 insertions(+)
---
base-commit: fd9678829d6dd0c10fde080b536abf4b1121c346
change-id: 20260211-upstream_stm32mp21_bsec_nodes-16aa826a73dc

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
