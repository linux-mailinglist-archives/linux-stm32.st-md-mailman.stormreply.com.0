Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIhxDLp7jGkcpgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Feb 2026 13:53:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FAF1248E7
	for <lists+linux-stm32@lfdr.de>; Wed, 11 Feb 2026 13:53:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 27303C87EC9;
	Wed, 11 Feb 2026 12:53:13 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011068.outbound.protection.outlook.com [52.101.70.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51D11C87EC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Feb 2026 12:53:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YwpOHOS3nBHB/NvtzdihqetroapzywIFgRwzjBRq2Uv77JmQ1W2AGSbEhOI350mhGpHKN7OsHUhCIvxtFhK14qtdqJJW49mjSo6b8as/lsNE2Ojbca0lFzfmWFPY739V/iuBfhUW6++Nr+ZPqnaLhvg95gWfTiW+2cORIc8sXGxyeRzpe+UlG/pCSxGxgo6oDvNMcF5MBbr0mfyuYt0yTr8XA5Vg4fpYx8D8/YhuGhueCdifVyNavA3AMVFRKAaV8gtarDIvjjR+yzRpJx9gf/rvKaBooNSNEaJ8RNbzsKBEzIw1z36wF2fzMuwVksv25ZqnEe82RQJuh0oE3OCl6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etuGccjzH+hwyEqNcgVvbfOLyck872kv1fXHhpjtqbg=;
 b=GGpVBavYiDoUZWrRCfsfbSM6T9JLdmG/sqtGbNLCBImM3332KCBYzReBY5JAWEQsxgp2Dd0GZrqAc9OZEWb54Hz/3201OTrd7B++/y4Q7ntoPjZA3eqirajyBpc70nsbhYrIFILaMA6YMRR1DhCOyJz41pVGtWqcYpOU47STDyNoXi93aQvg9rV0n8wljH8wAgIaiX6mgSvrFcweL9txf15u9jm0KjMga0hedieojARXPy5dCjmCVWWZUL6tQDK9lVGw37sYT/WG4eCflUhU8kkygV3tQ34NhJSIqlqqZk8ZsE0fWB+GxGiiN4cDouapEWfkMAQyCTu4demJvwrUdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etuGccjzH+hwyEqNcgVvbfOLyck872kv1fXHhpjtqbg=;
 b=KpJDXgljAS/dJOik799v6G6xLs68t+V1A1LsNSiv1Gr4jnRFWvcucxLKl5rIUTmYVn6rSr5QnY9jrySP1nd4JCsi+6c2BzGCQ2o9BgVtOeBd0oW54WWuW1ydzA0eYSFp2oIXgxW6DsuNSuDIqPXNQqyMNiYBlj/p5qBZWXilihnJInxfVkHNcVF8GtpyFS1SFOSAfSIqckSOgJvgC221xk71FIJzbdGq+r2DJGhBb53Gj7rQrDbxmDn5XG7ozedhbV49LSEaF9tdfJTVcUtzvqrkCEumGL7iyYSp/EjzyYRaE522z1S4JWf4wmc70Wex6b2yCU/XcjGB1NvRsVf1cQ==
Received: from AS4PR09CA0028.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::16)
 by PRAPR10MB5180.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:278::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 12:53:08 +0000
Received: from AM1PEPF000252DC.eurprd07.prod.outlook.com
 (2603:10a6:20b:5d4:cafe::b7) by AS4PR09CA0028.outlook.office365.com
 (2603:10a6:20b:5d4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 12:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252DC.mail.protection.outlook.com (10.167.16.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 12:53:07 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 13:54:49 +0100
Received: from localhost (10.252.21.36) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 11 Feb
 2026 13:53:07 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Wed, 11 Feb 2026 13:52:30 +0100
MIME-Version: 1.0
Message-ID: <20260211-stm32-csi-pad-retrieval-fix-v1-1-0db0f08baad1@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAI17jGkC/x2MSQqAMAwAvyI5G2gqWPQr4qHUqAE3GhFB/LvB4
 wzMPKCchRXa4oHMl6jsmwGVBaQ5bhOjDMbgna+dJ0I918pjUsEjDpj5tPyKC45yYxXJOa4DjU0
 AOxyZTf/3rn/fD0k5CQhtAAAA
X-Change-ID: 20260211-stm32-csi-pad-retrieval-fix-3a100e671f97
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Hans Verkuil <hverkuil@kernel.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.21.36]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DC:EE_|PRAPR10MB5180:EE_
X-MS-Office365-Filtering-Correlation-Id: c56f6251-7023-4016-6513-08de696c8137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vko5RnN6OER5dzBkV0EwTUhQV3g2UURSL2E3UnhjeHoyNDJ5SUpZZjQweHIy?=
 =?utf-8?B?dkN6Sks0MHZ1WmFqdzNFQ1lidFZyeVE2cUgxUTdzWTE5a29IUFA0RHZRT1p3?=
 =?utf-8?B?Wms4ZUVTZVpqSWZJejdTaGxDdEVFNVBNZVBpekhGS3IzTEJsOENDczcxcnBz?=
 =?utf-8?B?ajJSQTYyY2dncFl1cWQ3SHJnS1RVVXNhN1l3emhEZGxPTVFmOU9hWXNBYmVJ?=
 =?utf-8?B?ZHJYa1FuTkdzQW95Mm5XNkxHZ1Y1anM1Ykx0OC9PM2RSQUxYc2tlNG1VREg4?=
 =?utf-8?B?bFdKMUlzWFFHYkx4Kzc0dlZRRjR4TExUM1F1T1NRYXBVUm1lWC9VbitxUmJ5?=
 =?utf-8?B?RTltc3ZkOElNRmtBVVRseGlsbjF5ODR6OGc4b2F0ZTdLWC9GTnl0Syt1VHV1?=
 =?utf-8?B?N1phL3k3MG5sQ2RIdm0vVVdpV2UxZlZMdnJWMkxxZjJ0cTQ5RE1kT3hqV1Fr?=
 =?utf-8?B?QnJ6MXI4Q09PTmJ2NlJubUlHS3p4ZWoyb3VuSkRLS1Nrc1JwQmJ3Z25EVGhG?=
 =?utf-8?B?TzQ4WkZMZWR0dzRLT1dpL29VUzBOTVRHUSttMGpHSUgzbHducTdsbi93clI3?=
 =?utf-8?B?YjQyTG9PWCthSmJNd0NLWU9YL0N1UE1mWXkrbm1CVnZLWEEraTRVV24zT0ha?=
 =?utf-8?B?SlVnSVFYdlMzdmZWQS9DR0hXVjhtUmtUR3pxRUR4Rm5vWFNPVHNRSUZXSFdR?=
 =?utf-8?B?Y2JDMGFUTitUdkR4VG1TVjRGcFJDVVFiSU81TVV3Y251Z2xOZDl6R05lQ0FY?=
 =?utf-8?B?VExuMkhPa2tGbXpKdzF5QjFIYy8vUG5aNVFnYnZZSWpFblM0OTFRc1FQS052?=
 =?utf-8?B?SmlubW9WSk5xKzVIeVR1VDZDUTlvT1BiWGswZ2NhMHl0RVVUMVFzWlRHMFRo?=
 =?utf-8?B?K014N1h6NlExQ0lEWEgvdTg5ZWNkYm1IaVpDR0M4WWJSRlg3VDJJNVMvWWFi?=
 =?utf-8?B?Vk12bU1nVmJjMG5QTU0xQ3lacXJjYmpoUGowMGs5SWxPdHhlMHk1RTlGbzJj?=
 =?utf-8?B?UGxINzFVdmNCaVQ3SG5ER2RIMENEVmhvc01ncFhKT2JCYmhDTWtDTklXZzRM?=
 =?utf-8?B?UE1wbzZobEN3N0IzTlE2VmZoVWNTNUdBR1JwdVpHTHQ1M2Nzb241aXdBb3FI?=
 =?utf-8?B?aGZRanU0b0tGRFovbnduQmxvRi83VDU0TDRiK3Q1Z1VYWkJOSTZ2ejZPTWlL?=
 =?utf-8?B?Tk1ncGMrRDdqQUkyeXNHZHFXZjNzZ01XcVFhSWJOQzJqNkg5M2ZMQWxDa1hY?=
 =?utf-8?B?bG1OZ1FXMjZtTXkra2VzYUtoUXlkQk5rdXI0elpURDJMOUdGeklUVzhVcEQ4?=
 =?utf-8?B?VEltTVV6eW84RldCM3Y3b09qR3ZjVkVaN1lSV2p4dmhQVkFCS3M5bGUraXJT?=
 =?utf-8?B?dlNqc0hQVTFHZ3lIWGRQTFpvdnhtcE9mQjljaWQ4MDVHUTV2NjNncWlOTmtS?=
 =?utf-8?B?YTFkR1htREpkanBGYXVFT0hzVnNkYVNOZW1zV0ZKN3J5eUFFR0p2L09tTlk4?=
 =?utf-8?B?UEx1T2loU0x2ZWVkUVFnZmcvQkgrbEpLek84YWVsdC9JQXl5emcvUUxGVExB?=
 =?utf-8?B?YUVKalludEd1TWxXdXo5QkQxN1pPVW5rcGNOa0dvcERuVU5JYmRRQWExNjA5?=
 =?utf-8?B?NUhvek5QWDBLSHVHL05rdloyc3A4c2VReHQ0KzA3ZmUyUVlQRytZTFV2NFll?=
 =?utf-8?B?ZXJrQWpvNTMzenhlTks1emdnTWdDb0ZxRmFrSUkxU2o2WXBURlJRdzV0aHlZ?=
 =?utf-8?B?dzJ6NE01eDZKSmhUU0VYNUpWMjMvazFkTDM1aFFkRU04RVFTMWVoWXJoSkVS?=
 =?utf-8?B?MDhpQnhQeUQzM0V6UmZLU2pZSGFxYkFha29FV1pyNWdrZXh4REUrR2JpUWNF?=
 =?utf-8?B?cWpTcTczZEFXd3FtOS8xWlhMY24rYTZEWkNHTm5tSmxHMVVIeEZNdlNDa0tk?=
 =?utf-8?B?OXZ0QlE0RWY0dFdNUHFidXlzaytTLzJqUlR4Y2I0Mkd5VjZETGh1K1pMYmF4?=
 =?utf-8?B?b2F6NDBxU0xHZXlSbGlpcitBSTVpV0lMTVhXZFgvL3ROZldHeUJ4eE9oc1lh?=
 =?utf-8?B?OUZaaml1QklueXEvSERtSEZuNllCV05YU2xvQXRrTXIyOXNtUmhhQzBjcTZM?=
 =?utf-8?B?TGZXbWM1L3AyaGxydVBnNytvVkJxRG1jR2JoSWdPLzJQTFRHZXg4U3k5Rytv?=
 =?utf-8?B?Z0Z5MnpPaXhxTkJWNlpLSTViRGNZZFNzYThudGlYNDNVeFVISFU5WENIcW5O?=
 =?utf-8?B?OWlFcCt2aVBWQ2Zrc1hlaTFtb1dBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kI9qaMb/mzVGJdWStHh1/1iwVta2wfGzppF1U82M5xIAHgiz2la17ND9qnmGR9IKizPKiQ0y0347ZwbgGv+vgPcnMA7p/IfJ8LZHyU7h8ey/UEG6163boaOuq7f5aZZEAm0gB3Q/UzJtGewaXwuBwD/lUf8hANS9L4QOyqvRofIaH/qJzrMfIPaPSjkVdgtJl3WfG+U7s5KMEk39lincUybr1fuyubH1M3FATn57qRipkXH5jwyjFXpsLdFiMm8Rkf3exmYgIyrcvD3qxlwsw3he6OrByIS5hKR36X1y/+moUIC7R4r14svPffSmYVYwYSaDKudXmGwHixl7DZyv5YGPizaG3G7Q1SWsIO9YwHxtokTgmjNYeD1ulHstRf+RQ4a36bGV34xtOkAc7uYuS1aIP6cbaEJhvGs+csehM1dauAD6M+nwO27D/hhfDzUQ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 12:53:07.7513 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c56f6251-7023-4016-6513-08de696c8137
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5180
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 stable@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: [Linux-stm32] [PATCH] media: stm32: csi: correct remote pad
	retrieval
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:hverkuil@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:stable@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,st.com:email,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 91FAF1248E7
X-Rspamd-Action: no action

The function media_entity_get_fwnode_pad is called in order to
retrieve the remote pad, which is the source of the CSI.
However this function is expecting the sensor endpoint fwnode
and not sensor device fwnode as it is currently given.
Correct this by properly relying on the notified matched fwnode
data instead of the subdev entity fwnode.

Cc: stable@kernel.org
Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index fd2b6dfbd44c..ecd0ed8e76b5 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -825,7 +825,7 @@ static int stm32_csi_async_bound(struct v4l2_async_notifier *notifier,
 	int remote_pad;
 
 	remote_pad = media_entity_get_fwnode_pad(&s_subdev->entity,
-						 s_subdev->fwnode,
+						 asd->match.fwnode,
 						 MEDIA_PAD_FL_SOURCE);
 	if (remote_pad < 0) {
 		dev_err(csidev->dev, "Couldn't find output pad for subdev %s\n",

---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20260211-stm32-csi-pad-retrieval-fix-3a100e671f97

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
