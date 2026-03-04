Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cH1gAjvop2mDlgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 09:07:23 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ABF91FC2E3
	for <lists+linux-stm32@lfdr.de>; Wed, 04 Mar 2026 09:07:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B313CC87ED1;
	Wed,  4 Mar 2026 08:07:21 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012029.outbound.protection.outlook.com [52.101.66.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D1242C87ED0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Mar 2026 08:07:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HTpuaS5W7P5Lgih3DK+AwXmszDBt8sIX73I3Up8YpIGeSBgnjBbz7HOptuNSbe/HzQF9NkjoHtuVUvKaFd3IukrwBSHKbyvnl6IRKDqVuBAVn8uIrGzWefQi0M4lNb+SQzssOajRPBJT8siGP0zNR/odA5eRVk3AAiHweTMm5Xt0GroBi89B6Xc+ysymdUYdd7aBX81j33jqgvA15vKSUTnVPbu7C0/O+HAS2BfaUgg90aLIsOBRHuilVeZj9oD1aWbdS2gh8mO61mzEKTOENxnOsG2WlfkaA9kQ1VniAAnK2xaUrWT2w4B1BPhrdeBeZQ3Skx/HPwNou/ayZz2Kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1otjRTFzEQWHEopk6818BhFXdffta9D9NOt7veT7UM=;
 b=NrpKzuU953MQ5EwG2IPU/mN7Ez5dtLDgd22KsDZMzVguAXl9GAEzzPGLO17XHshvMKovSUdagBdUyVeylHJWlfXuqocahEjtxFaNbbS1YZwQY+jVG1AwATdQxerEVDiMrijI9hH9hb7N7fe3XprsVRHD7xp07VLCHVxL+mo/lA8bPM6f1ba8P/5CWjrV5+aTH6nx3yMgziKshwgOZAn1rSOx9vQDMxdzXegVg/QTodkCoWHyPAHEm7gcm+ypyMY/gibV0EtvlgsShoghawhqwerbjR9/Iw4XO2Yh72uOK//8nITGbd/hKfhe4STot5rTRfqhSodJR1z/zbkAXMuboQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1otjRTFzEQWHEopk6818BhFXdffta9D9NOt7veT7UM=;
 b=AR6NpBAoM9b2KnqrI77CtilJpETwaeBo4NflmZ7SdBJdQKBr1yECdYAbCrexRVoFTaM6Lmsty02Z9KPPiga8enAWAKkWLPB9L6YMVk1U8onKdty1N0HnD7SwkCTaaMeXggs/WVJ1OL/aoLXb7NrrAvB8Taz7DpWwbXU108pt7W/5bzko/DVg24gdKO5tLiMAx/iPAdEVWrdV7swX5xq0EEX9kgTTpA+vS6iFXgb/F65zhD/J65mgeiZMdIXFzPp9aSV9Tcv/8UyWL1g8TgT5Uq6qk+IUlyTqC1chnUrGb7w2XUaqTU5HhYw/rD6f194D8HTpUP94ek6ym5Y2rrAqVg==
Received: from DU2PR04CA0247.eurprd04.prod.outlook.com (2603:10a6:10:28e::12)
 by AS8PR10MB6336.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:522::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 08:07:19 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::32) by DU2PR04CA0247.outlook.office365.com
 (2603:10a6:10:28e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 08:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Wed, 4 Mar 2026 08:07:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Mar
 2026 09:09:28 +0100
Received: from localhost (10.252.5.222) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 4 Mar
 2026 09:07:16 +0100
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Date: Wed, 4 Mar 2026 09:06:58 +0100
Message-ID: <20260304-mp1x_alignment_issues-v1-0-19a8013782a5@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACLop2kC/x3MQQqAIBBA0avErBPMgYKuEhGSkw2UhVMhSHdPW
 r7F/xmEIpNAX2WI9LDwEQqauoJ5tcGTYlcMRptWo0a1n02a7MY+7BSuiUVuEtUai4ubsXMaobR
 npIXT/x3G9/0AnWPpB2cAAAA=
X-Change-ID: 20260303-mp1x_alignment_issues-62a3fdc37d03
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.5.222]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D07:EE_|AS8PR10MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 50355ef6-f650-48b3-5dc3-08de79c50e40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: ru6SNNPWGbZtOfY+Jp55gXPqAlJ+HSdJ5Wpl9F7OARPE0HaTlZvVlBCCgtRLKqsdpDmInzSife01h5SQq5ouISgh0gWbu5YoQjydexca3q5Btgvb2HCbWKbBcHRNOGQzjB5ZlD3b5YUQZqdpvnv4QDoiwg8/tNdxVgNhlsPJNKSAfumP75yVKV+OkvpvaSKx54yrhEOM/CtF5MWMcbnuiJ7DLw88wpmbR/iw177nxBdZ/aWZzDTIpaqc78C/EMOOoZYRpPljbDT5PXSQtt/0BmC/qAm3xxmnChK96IJ4hZnhc99ekG8D3l1cyHb/bQ82IHrUZap5jIB1laYhFkMAAtaGgOz5DxOiIo1EWHcRj3LE6vJZAvc8aswGWepy8PA3pibO96mcTAmDXDCZJ8I0YcgTuHYVlkwF1ZPYvJJ84+RYJ+q2Ix4kAvhlNq/trxTPE+EQeerVjZfzImTnTQTQWh1brATJgtR4HdhZqojNwNDloob4PJ1zzxuNyamXGdGOjS62gyIkpDzXmPjckLUoA6v7k3wrua1/FeKakLHPOii3dPrk6fjBlgk3xLaVbcna4uCphiwsFY8AVzJK9b25qrgnMofzf+F5WPndhTBPtil5jUmnRAs+JhgtjMSm7Hn8CpOqdxKrzhbYzBV1NKH9YVrtLbWC9EMxyK4OFgceqmGmGE5m/QMH6lx6tpmG8qbxElCB3tpSckCfHFR0+9comCqr/kOQDeGQ7wUwFgI1V9dOQeqJRWudgJyhEaqSRq7Mt0HBGLXRsIMcEzqLCOE+Eg==
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: N5D/H6gjvAENodiJNGC6y810HUhonC8ipqY2m2JFSXEdNkM3nwMOiuO18/2BMn8V6L+UH4QuEOhuvjkk0St3mgunvgfjKWxgDtwqcqD4lBobOHVQ08cxBbrXtHG4RaygaxDKqEG556SSapbWaCUdk2IzkEoh7/sxPUhJ+E054kJ5J5aBhjnwfOZ+z+p3T62OqDx2IQADLAfRoEzpprCMdyloN/5DwsGA9hCSUJDxXkggZd4pC3+xdUDqB1zwgtU1BOFYCP8wYYv+jBN7kXaUsbYNyAOQ0xqeN8Qdzho/wi70QVkIT6sqhT0uh8eNCY1NUGJ+AMuyQK+ZeTkYLtO3PmPOgfFIw2v8hLUcSk2ohvLS7vwGy5IIRnm22fLLa5dbS296iiwPqKG7gJKUIVTVDGSL1Y1J0KwB4SJLLgBv9XkP96+Mc6zm5qBohSiPM3vl
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 08:07:18.6692 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50355ef6-f650-48b3-5dc3-08de79c50e40
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6336
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/2] ARM: dts: stm32: fix misalignments in
 nodes of STM32MP1x
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
X-Rspamd-Queue-Id: 0ABF91FC2E3
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
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amelie.delaunay@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	NEURAL_HAM(-0.00)[-0.518];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Since the ETZPC system bus was introduced on STM32MP13 and STM32MP15,
misalignments have appeared in some nodes moved under the etzpc
parent node in stm32mp151.dtsi and stm32mp131.dtsi.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Amelie Delaunay (2):
      ARM: dts: stm32: fix misalignments in nodes of stm32mp151
      ARM: dts: stm32: fix misalignments in nodes of stm32mp131

 arch/arm/boot/dts/st/stm32mp131.dtsi | 14 +++++++-------
 arch/arm/boot/dts/st/stm32mp151.dtsi | 14 +++++++-------
 2 files changed, 14 insertions(+), 14 deletions(-)
---
base-commit: 291f393298f72091490dfa70ab4a0ebdbb4c7d7e
change-id: 20260303-mp1x_alignment_issues-62a3fdc37d03

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
