Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Sa6BZECi2kMPQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 11:04:01 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F028119560
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 11:03:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B711C87EC0;
	Tue, 10 Feb 2026 10:03:57 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013000.outbound.protection.outlook.com
 [52.101.83.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E326C1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 10:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8WBhXV0ZZiIj41vOfddKI+np1bmzPm5DUj1p+4CsiSMYRR00qAks/dxZC89ZIno249YyfUYG6qO7Io6nXCZKBGZVf3aSpA3HKeAyNlKfpUUk9GXL/xIcBCWqtLTlBZi9lOVmoThRQnZWL64UDQy8+eFceqvKFPC0oW9WdN4OU1ZSgXUQXKnJbW46o8jwYfavjOYXOfpV+NZCbClr0zG63EZ/V1togIjHGyk3sMLmkVMHclncse4X0+RXV+/rTsD48esNfqaPfxYI4QEl6htBG2GD2RG8OimMYrXORlErlOKXAcBPiqSdu+Knvh853K95R/DBZmdCZD1IOFiJLuE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOE8xK50LVNC2vo6WIvOKj85WNoxYu8GAz9RsmluCws=;
 b=WzYUeiGPDGRIvsd7lokZYw0r6Zcc3ZWOAhsgUyFHbUdIYWh43MjM/IPdx0/Va8udNk8HnNCFXxRw0tM18PTfSpfFZ3NNOyAy0H8qGSJuybBxnP6HJr/+jMtlm+QvSWrRp6rOubMWthr7ZQYnGyH/+08iFjZw4+AMEsj4ET1TuVBoCshsUYrvGd9ai5HSbks1cM76w1eTq2T8g438TkcWqkTxx+KpU8fxX6Pj3Henef25wLey56jyF9JQgsAuo9mtTBSKMHq3GzIYlaC0mHnQlPes0WyfXWFsDgKfzjYGxdG+afwh1tvH7XzccFGoWHtTm0qAR/UUTbiz8xxp3PgSPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOE8xK50LVNC2vo6WIvOKj85WNoxYu8GAz9RsmluCws=;
 b=ADHwGlNUC6TS8pcGq4cTTvCBy2YMBdxClsJ/rJbU7eBMEHR3EwRuOzSbxYEw5qcdYd5+s0nr0JgSINh9QYI6r6SpPftJUuZGIlLCgjO7RameFCJ/K3foCowhKgSMMTD7vlm0c6NTqbLEgQ0DWYJWGaqQb1lj/Kccuz6NVhB/ivRhMKbdCJkk/4dlcCevKkLEahhxHm7RcYiIqpX3CCrPZlwYG9KumIwDQh39PBXRNbleFTQY/2lFVJcbRBX6XnIbttg4ev+w1Plmhxa71lVVLREqegB6uu1XNM23q2Vbz5XlaMGQZs3knH9iruJpXztEZOwHnikLZplgmHIoa0tZCA==
Received: from AS4P189CA0044.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::13)
 by AS8PR10MB6972.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5a0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 10:03:54 +0000
Received: from AMS1EPF00000040.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::64) by AS4P189CA0044.outlook.office365.com
 (2603:10a6:20b:5dd::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 10:03:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000040.mail.protection.outlook.com (10.167.16.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:03:53 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:05:44 +0100
Received: from localhost (10.130.75.212) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:03:52 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 10 Feb 2026 11:03:54 +0100
MIME-Version: 1.0
Message-ID: <20260210-display-v2-1-0592bd514958@foss.st.com>
References: <20260210-display-v2-0-0592bd514958@foss.st.com>
In-Reply-To: <20260210-display-v2-0-0592bd514958@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.130.75.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000040:EE_|AS8PR10MB6972:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d310e1-be71-4b26-f1a2-08de688bb297
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3dzd0NoOFFxNk9BcWFucVNzMGcrTlhiU1M0UXJFTExLODMrYmFUaVhsc1JD?=
 =?utf-8?B?L0hma216cjZwR0hGZ3ZHejlSQnNtdjVXa1hTb3BTZ3lsOWhrZXNiNTdHK2hu?=
 =?utf-8?B?UTFSOS8yMEVJUjg2NDdyamxYQlRGeHRJeUdxcmdpN08vNDBZajFmMWlqdGNr?=
 =?utf-8?B?ZWo0MUNVNTNEMHRkNXgwZzZTanRKVWJkWEpqeXJuQUlrcHdlK216ZDRxQUFn?=
 =?utf-8?B?dVRPbEszMC9WandTazYvL0RScjN4bUJZYk5kSnE3Vm9lMERGQlVEMEZHbVF6?=
 =?utf-8?B?S3R4bDlQWlp0bGxVSG9qdDNBZW41TWZkSFA5SmJnQ1RzRnEvQzBibnVFZ3pH?=
 =?utf-8?B?d0twdC82VUVSUURxUHE4Q2tYaWx6VFZib3N2NXYzN3czZzJKSXdMdEd5bmdU?=
 =?utf-8?B?bUtWdTE4WE5GN0NIZFhjWmdsTjROc0tDQ1pzRzB4dHhWbnRHRC8wVm81QnRw?=
 =?utf-8?B?MnZlNnRPMmNLTkJxZmEyaGx1cUFxVDhEaXNKLy8rblExc0t5NTdXdjNnODV5?=
 =?utf-8?B?cDhCS04ySXdSYmlnZmdYQnJ5M1FjdVBRSHlpeVZvL2Y1TG80bVNsdFpQc29H?=
 =?utf-8?B?NFZlbDY0WWRwUnB0aFlDWGJPd3Vvb3BDV09MVXprZVdZcG5QQTdmdlBQakRR?=
 =?utf-8?B?R2kxRU1vMC9nY0ovU1hRYTNuM1lBN01TVVBzUDNkWXNnTU80N1NtMkFWOEhM?=
 =?utf-8?B?c1FLMzZJRDdKdTZna25IaUwxMlBHbzJEaENWa1hSVGdJeTZnR1hEazNDMllH?=
 =?utf-8?B?MDRCQmxvd2NFb0QrYjg4QzNrVGtGL3M0RVg0bmdzR3d1ckJXb1VoMVhzVkhI?=
 =?utf-8?B?TWFOa0VFTUs4bXRDSFNWZkdzNElvaityVDdmOUJLY2NEZjJpNW92Q3FIWmww?=
 =?utf-8?B?Z0JTTENQa0F3TUhxckdCVmpwS2lHdjRoQU50amxuejhmeEFyWTBqRVNNajcr?=
 =?utf-8?B?dUJwRjZxODNocUxIUDBEMm1ZKzJlRDRsaHVncHRndDN2YWd3NmNhZ2pHbDRG?=
 =?utf-8?B?aDZjQUEyR3dMcFJ3QUp4cm8yRmxIZVhaMEh6NFJyUWdsWEd5Rmk4QldwTTRR?=
 =?utf-8?B?blk3aWd4NXdHVlpiK3hlZVpVa2w1V0xIOGFDUVF2OC9relVoR1IyVVZFbDA5?=
 =?utf-8?B?SzhoeFFTcWJmWGQyOFcxMEVNalpoWTA4ZERNS1NmN2lIRVd5V3c1NjlJU1ZC?=
 =?utf-8?B?VFBkcFczbUNlTEtvWlVPdkZ3R3U2QlE5d0tpdmVTZlhOUEwzOWNnYzFrbkFx?=
 =?utf-8?B?ZDNVblN1VjBlSTM1b2p3WnB2QU1KUkN5UmhUSGRBZTJRbzAyRk1hTDJpSW0y?=
 =?utf-8?B?ei84QkdBMk80SmF3Mkp6RVFjWXJnM0tIa2RkdWI0ZDBnODZIR1JqeG1xSFJT?=
 =?utf-8?B?dGxPOEFJMnZhdW1XUXR1RVhEcXZxMk1JQVBWcEVKbGliclB1MTZNd3o3bzRw?=
 =?utf-8?B?dDhibkNjN1dGb3p0NXJBbUlSNjZyZnVCN2MwV3dYc2cxZFhYNFdjaEc4SXBS?=
 =?utf-8?B?eWt4RFd3NXZBRVczdFJhNGlXaTllWHdhMzRoL0tzSnlDbXZiajJxTzgxcjgv?=
 =?utf-8?B?YWkvZDRCV2Fsc3gvZWdGUUFtMjNxa1ZTd0RyTGFQbys3SlYxRWYzR0YzOVIr?=
 =?utf-8?B?MFFkTTRMcXcwcngySno1bUxJdGVqTVNDcThmS1hPZWRVWXNJTnFIclhDUHI2?=
 =?utf-8?B?SEJ3bTNYZTVDSjMwbTMzVTRaREpBeGtuSEd0d0JDd2dIOG9hcldqeHNPcVIx?=
 =?utf-8?B?U1o3bDZ2Y3MvUHY2Nm5DZFJ1aCt0M2M3NnBjMGJtSE83YlQrSGRROUltMzB3?=
 =?utf-8?B?WitudE1nbTFvWW1XbTJHTnVmYUdwK2tPTDJBa0REc3BHMmlmKytEY2pMbzR1?=
 =?utf-8?B?RGdPMHVjMTN1YWZYYUZ6eTVyOEZRcU9zdzdlU3hoZTBGR0lBNHd5TVR0eGJj?=
 =?utf-8?B?cllTVWpzb2pNZGxoUkswblZVb0NrNkRuVno5SWlRNFlWdXdhNUhjR0ROd3l4?=
 =?utf-8?B?cEV2MHdoM3BiSVdZN0hzVEkwd0xwaDQ5R21NQTQxTkQvQkJMakhvaVdOTlRr?=
 =?utf-8?B?Q2ltYjErUWlFWi9Tbk42bXROWExWM1VMcllXd1hyVG5TRGhsSzJhc0hQK1Uv?=
 =?utf-8?B?eUZ5N245MEMyVElwMHJpdzlSd1JQSGh2UDhGV0paTE11Sk16MG9ubzd6Yk92?=
 =?utf-8?B?bnhaN3VEMXVyWDhrM0s0NzJWZ3NwMkp2UUhNVElGRUpzVWdGbGwyZlJkbEVm?=
 =?utf-8?B?MUhSVEYydkNHdk9JdFZCMktaV1R3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: A1d5Fkk3PVTcBJOiEKTt8CItBIJOA7JeZyDpuAKrOzd25eyEv4FQWCxADum+KXU+DFt3ac/Kts74X/P9sKN7IZRfhbe2J5kM7ZhyPSIjQSlIXYqgOn1nFT/fKjvZhPIQxkLG2jBIXuv3wkSRmrrWZncqjlvvf85c503YqWQixEy2SMeu7B2r15q5zfiWmo5LX55DtFJoCk4jg8r0+mIDiQhL/R2ENiZaqgETSjRyMAqHqC3r8g3N7tVZFyu+rTsTkx2qq29CF1UiaCcYu7yzhgytoBgH9InOQsqW8xamax0KG2zEOK4QcIlaaGanf/MA5TIXVa+5yoA7N50P7Ju56XJF/ojfPx84kngQolQRDZiAvFy2XZbOu+SmouEbdQPztfnxX1YVifZ7fzAmA+wHic+ePOl8Ovitjlo4s3cH8n0qs6r5ByB+mgRBixNhA1ek
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:03:53.8420 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d310e1-be71-4b26-f1a2-08de688bb297
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000040.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6972
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/9] arm64: dts: st: add i2c2 pins for
	stm32mp25
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
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:christophe.roullier@foss.st.com,m:devicetree@vger.kernel.org,m:yannick.fertre@foss.st.com,m:linux-kernel@vger.kernel.org,m:rgallaispou@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,st.com:email,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email];
	FREEMAIL_CC(0.00)[vger.kernel.org,foss.st.com,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[raphael.gallais-pou@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6F028119560
X-Rspamd-Action: no action

Add the i2c2 pins used on several boards.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c34cd33cd855fb28b65a39b59b49e089345ce9a6..2f853f3fae6d84756300f19da32d6cb0297d9e20 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -212,6 +212,23 @@ pins {
 		};
 	};
 
+	i2c2_pins_b: i2c2-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 2, AF9)>, /* I2C2_SCL */
+				 <STM32_PINMUX('F', 0, AF9)>; /* I2C2_SDA */
+			bias-disable;
+			drive-open-drain;
+			slew-rate = <0>;
+		};
+	};
+
+	i2c2_sleep_pins_b: i2c2-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 2, ANALOG)>, /* I2C2_SCL */
+				 <STM32_PINMUX('F', 0, ANALOG)>; /* I2C2_SDA */
+		};
+	};
+
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
 			pinmux = <STM32_PINMUX('D', 0, AF10)>; /* OSPI1_CLK */

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
