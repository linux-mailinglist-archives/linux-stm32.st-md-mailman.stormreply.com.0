Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDo/MAAGgmn2OAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 15:28:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A63F7DA919
	for <lists+linux-stm32@lfdr.de>; Tue, 03 Feb 2026 15:28:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55D0AC87ED5;
	Tue,  3 Feb 2026 14:28:16 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4AF3C32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  3 Feb 2026 14:28:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VD5zs3FEB1/QLVh3HeSd4elERjMPNyzE6Ay7tQIwi9Khsv3F3hdPurfZpBUc/+RzREyPwl8yHaHvI3JzieINFfRq56MbL9xo3sNxoLHEMe/LhiomEedY89U0xA//uK+nVneBoOomnGHhL5n4LKxtEX5uDJz1Q2Y56GJfx3wwuAJAxq3/6uzRgljwOaiRjgh7T2oEVPxHzXjjsaqmRHtg0FigT07k13gLVhic6a+zk3WmT62kWxAkW6nB0+ZhePxV4lHzhRTYzQ3zJDbSyrPZh+Xz8DWXcirQ/0ZNJd59a8ZRvrNrs1yXPZsqO/ktPHMnEdWMrTqMnTVjQSwQ1+rI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cgoxLmC9h0jyjW+y5XafpKIl7ZRs6jXrfEOlk4IZ3go=;
 b=k+IKRtwY7FWEt4dEzzIvFvhLOmqaZLAzgnJ0jiqMFaxh5RHfDUtDsbNKBONNSkYNSs5R6SG8VRMMHN8eev5S+OSnKxWWYGlQcQoqcoMcDUCkVYr/lDA7xkoJZePCsA+JK0/0WeOMXqE0FGyWrJylzu0l50+is/SxTLujuoEgHiNS7jiEFIesr2mNx+DZnqOcCzGiC/RSy36sg6l5XBnDCJA8+YSvD3p8csh03/lwcKBls33jiO1J7lGGvGcgpUu6ESfprekdlLy63NFIkWGW6hevb/pAKpIe6MZYfSaYZ4qoFRASuVaQBR++EQwP+t8DPoOrhH7ViNfk9eXpfSWh9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cgoxLmC9h0jyjW+y5XafpKIl7ZRs6jXrfEOlk4IZ3go=;
 b=mAG9OJK46FdrtFAaBi57hJHXQ+4wv31S/wGbfxsAS5Qq4S+7rTW9Z0a6cqfhpRatHgeNKLvZvbtzEbRLg3FIvVDIZ79/eP8vdBwZrjuZswx/x6XPYquLB0nRBwNJi2UyTmXxGAzUA3CTWgHHlGPgpLIku/UrDo19hXhZpOeI6ryWuvVn//Xx6JVOAfrAvCUoCt2mcLBoArAkjqs13qE8puNFTv3tMDmUm8KZIUX8QRURJgs2x+N1WB7XN2+yYrrmwKOp/FNKT7Ilw0OPSqYbNhdp9kFS4MCtHryefq1jbOZO0k1SzeGYM85Mq8gxPEmgBkhna4WgoeCwPROzeEb1hQ==
Received: from AS9PR06CA0281.eurprd06.prod.outlook.com (2603:10a6:20b:45a::30)
 by PA4PR10MB5729.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:266::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 14:28:10 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:45a:cafe::d6) by AS9PR06CA0281.outlook.office365.com
 (2603:10a6:20b:45a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Tue,
 3 Feb 2026 14:28:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 14:28:09 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:29:48 +0100
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 3 Feb
 2026 15:28:09 +0100
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Tue, 3 Feb 2026 15:28:10 +0100
MIME-Version: 1.0
Message-ID: <20260203-upstream_uboot_properties-v6-4-0a2280e84d31@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM3PEPF00009BA0:EE_|PA4PR10MB5729:EE_
X-MS-Office365-Filtering-Correlation-Id: ed227583-99e4-4945-f31b-08de6330748f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0RYeGhRNTM2aW03amZTeFhLSVR0S1FKVDNYL0gzMSt5VU5ZU1pKTDFrdjFL?=
 =?utf-8?B?bHN4ZlJwRlBaeU5NbldObyt4d0JPTE5WTjd1VlJQVDgwUDQxeW5zQ0xMVnhy?=
 =?utf-8?B?bGJmbExIcTVxSkMwRG1TWFZtcjQxYTZyOUhRUjBVaVNpd1Z1ZUpqV0ZhOEtD?=
 =?utf-8?B?SWViTERXOVZOVmlPbmhZcDBrWUN4Qk9CbENtM1J0SFZJdkZBVE5KSlBSVEk4?=
 =?utf-8?B?S3J3aG9FZzgrb0FNV1FkUysyeCtNRmNWRXR5WlJBTkRYMXgxbm5JTDNOWmVy?=
 =?utf-8?B?ZFRVOXZDNmtPNEpPeXdxRDJGRTVpV1NsV1k4WEd6VHNpRURFWmpaV0Z6L2dp?=
 =?utf-8?B?dHpSRzNzOCswRUZqazNESk4wbDBzbnZVSGRxdVVZc1lZbHZEMTVnU2V6MDIr?=
 =?utf-8?B?WTQ0WHRLWmNEa2xxRktUdi9BTTNrUHVRakcwbHlxcVBYbEVTMFkwUW16b240?=
 =?utf-8?B?M1R2bEZnL29NeXc2QjJyNUpHcXFyUzdlV3ZrSHN6SFVlMlJOUWNCc0dDL0hD?=
 =?utf-8?B?Z0xtZkJzWFZEQU5vRlE3TWhtZ282cWh6eTA3bVNoUjNKcyswKytGcVRldk9R?=
 =?utf-8?B?OStjaFRGZWxpdHpDTG5sZFgyZ1B4MUdwQjRvMDNOWWp4ZlJDVzhHanNGUC9y?=
 =?utf-8?B?eTN6d0FGa3NWUm9TZFJtSmVtZVk3MGxodjExYWt6NVpOSlJ2ZkFMVFFZdWdY?=
 =?utf-8?B?SkwwaFhHcDI3ekF6ZDB3NGxUYXQ3NmN5NEk5aEd4VmlkNE1jRmM1NTFmZDdM?=
 =?utf-8?B?Y0ZyQmU2emliUVlTcUlONVVjRDBKRE5pc1ZJQWZhRW40VUVjdzhMM2tOL0tP?=
 =?utf-8?B?QlBCRGQrbW5MSzZxUDlyOUk3aVFxazJDdms3OTNJK3FiMVI0U1FkbjQyekk1?=
 =?utf-8?B?MlU5UFVjYU5wNWVpclVGVmo5NGMvV2xUemp6ejRSbHdaU1c2eFFKQ1ZoMlg1?=
 =?utf-8?B?VzdKbDRPRjBpR1l2QjJXQkx3Rm82cHIxQVhMeXFjYlorcnIwMWtXWXNHNXdR?=
 =?utf-8?B?SEM0UlI1YTkvMHVMbDF3aVRhWW9PQzRyTElNVWF2Wk9FRjMxM1p1di8zL2lO?=
 =?utf-8?B?UGVrS3hBVFAxZ0M0Y2tkSDZSakpqYmgrcTg1bENqZTJzdHhOc3p3RUZMV3FL?=
 =?utf-8?B?NmxWektZQlFDQ2lyRzluSzRyemE0OXRMT3E5TVd4TnJjRnllUGl0c0hmU2E3?=
 =?utf-8?B?SmVabmo3bFVWUW9vbWIwc1M4TmZ2QS9ucFowSDVyMGluSUJHVnlKN3V0Zysr?=
 =?utf-8?B?TnV1eDNGVUxnbGFsRm1hYm1HRE1hMnVkNUFobFJzbTA0TjNzYzN2TmNGNThH?=
 =?utf-8?B?TTNWRnpReENEVFY3dDg4RDYzY2lBcWRXTHNJYzZsZUl4em9zR1h4VXE3Z1g3?=
 =?utf-8?B?ZDFobUl3d3pNalB2Rkw1b2RNZVBZMzJkSFJla2h2NjA2eGJ4MjdROTcrdmJO?=
 =?utf-8?B?SEkvekdGWklQaUF4OXgxRnJnSjNRMjdIQnVwc0JVaUZwRHdQWS9najZDS3E2?=
 =?utf-8?B?SktDSGV1WURmL2MzTDZMbW9aVVV4VW9yaW5wQlpDVnVzZVU3dnZyOUJhL1I3?=
 =?utf-8?B?bGhKdEpKMmF3bGx4eU1WUWpZelV0djFLaHQwT0ZlcnlUVUQ0U2JTRnFBaFNv?=
 =?utf-8?B?c1ZKQ2c3V3pqY2dkNmlYN1N2MC9pK2RDWGlIZENTZUErU0gxdXorSHFqQTE0?=
 =?utf-8?B?YVJHMlhuSDM5YnJaQ1pFRGdRdWxnYVFrQlJLVUdMNDd0WG83U2FJdXBMaXYw?=
 =?utf-8?B?ZWZxRmpKOTNaVTA0VzMzNjhPTDBxWWJLOFpUbDJiaEp4VEprQlhwWU85MlJj?=
 =?utf-8?B?bVFyWlBoR0diR3lzVDBCbmtQTFV0aGVUdWpXaUQ3M0xXa3h1dWNqYmRYT2dn?=
 =?utf-8?B?WWM2akUzT21pTnlFaTRZRHFDTWp5Rm5qdzF4SW1ubnZHQWcxemYxUDZSWjZj?=
 =?utf-8?B?bTNwYkdhRlA2UWh3Lzlycm9zbklSN0FmYU1obGlhYkQwOTMxQmY1VmI2cGNx?=
 =?utf-8?B?aUQ3Nkx0RHFpUDNDYzNpMDRTbnhQV2dEVDlSQmNjK1B5MG93UkFmSDJtbGpB?=
 =?utf-8?B?c3pZK3Qwazd2SHoyUVowQnkvTVZvNUJNbzAxNUg4RjBLMG5WRzhDQzBsU3pn?=
 =?utf-8?B?VHdFSmRnQWRINFUvOE83a3EvNmNIN2p0c25qSHkwVU5JT1F0ZGR5b2dOWStC?=
 =?utf-8?B?UjZmNGZMR1JOTFRVK3dHcklpUFVqOThCWEdtK096UFpZUVNvWXZUVGFmTkY2?=
 =?utf-8?B?REtZWDJpV0g2Ynhvd3VsVkhIb0RBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9Jrzjs1WZcaLy8Rl0mujlLcyTux/ZVd0zEad70BJgKhhH/fLHa0eg+d6bgghneL412uQbgvLBBSU2IFW/tA/NtGX0aI8ZZJjUqhqO2WHtgx0q316eZWFAuXt7fNLb/63fEgKS/IWNoPZR2Rj2Mx5fLJgHnUm1Wb18+8MCxGTlf6gkfW23n3SL0jytQ8p3hdyesrHns4i6ILT0oCoVHUqvOctHfCLqvN2Ab/g3eKP0uQrNxz7DOkh8l9+kwtnhDPfE1Ab75wm9RK7Xnwv5EgTfH0zyQ+bEVZn48XD7bkqK0FF5y+A4RGf8t7lbyEgSuajpY0Z1GwuuXxOC6zkEemY3JL28bmYQtXlR80erMB1R1aqnx+wTk30oXDPdNdadbeOEwvIv9JH4RwCVu22FXinaICw4P1Zc+kFaCX+9xL9XMrLSjxbo1CS6g5rU8LmjOQ6
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 14:28:09.7590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed227583-99e4-4945-f31b-08de6330748f
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5729
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v6 4/7] ARM: dts: stm32: Sort uart nodes by
 alphabetical order in stm32mp13xx-dhcor-som.dtsi
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
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:patrick.delaunay@foss.st.com,m:cniedermaier@dh-electronics.com,m:marex@denx.de,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:kernel@dh-electronics.com,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,dh-electronics.com,denx.de];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[patrice.chotard@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A63F7DA919
X-Rspamd-Action: no action

Sort uart4 and uart7 nodes by alphabetical order.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi | 56 ++++++++++++-------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
index c18156807027..54ece71085c1 100644
--- a/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp13xx-dhcor-som.dtsi
@@ -241,34 +241,6 @@ flash0: flash@0 {
 	};
 };
 
-/* Console UART */
-&uart4 {
-	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart4_pins_b>;
-	pinctrl-1 = <&uart4_sleep_pins_b>;
-	pinctrl-2 = <&uart4_idle_pins_b>;
-	/delete-property/dmas;
-	/delete-property/dma-names;
-	status = "okay";
-};
-
-/* Bluetooth */
-&uart7 {
-	pinctrl-names = "default", "sleep", "idle";
-	pinctrl-0 = <&uart7_pins_a>;
-	pinctrl-1 = <&uart7_sleep_pins_a>;
-	pinctrl-2 = <&uart7_idle_pins_a>;
-	uart-has-rtscts;
-	status = "okay";
-
-	bluetooth {
-		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
-		max-speed = <3000000>;
-		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
-		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
-	};
-};
-
 /* SDIO WiFi */
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
@@ -312,3 +284,31 @@ &sdmmc2 {
 	vqmmc-supply = <&vdd>;
 	status = "okay";
 };
+
+/* Console UART */
+&uart4 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart4_pins_b>;
+	pinctrl-1 = <&uart4_sleep_pins_b>;
+	pinctrl-2 = <&uart4_idle_pins_b>;
+	/delete-property/dmas;
+	/delete-property/dma-names;
+	status = "okay";
+};
+
+/* Bluetooth */
+&uart7 {
+	pinctrl-names = "default", "sleep", "idle";
+	pinctrl-0 = <&uart7_pins_a>;
+	pinctrl-1 = <&uart7_sleep_pins_a>;
+	pinctrl-2 = <&uart7_idle_pins_a>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "infineon,cyw43439-bt", "brcm,bcm4329-bt";
+		max-speed = <3000000>;
+		device-wakeup-gpios = <&gpiog 9 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpioi 2 GPIO_ACTIVE_HIGH>;
+	};
+};

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
