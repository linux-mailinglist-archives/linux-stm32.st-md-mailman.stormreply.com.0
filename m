Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MzMJpbInWl9SAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:49:42 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E0189500
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:49:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C8327C8F28B;
	Tue, 24 Feb 2026 15:49:41 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012041.outbound.protection.outlook.com [52.101.66.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0222BC8F290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 15:49:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMsSv1EYuB9vNhAVTz4H1jKj9aagEhtam8Em81Xf0r4dO4tV+9h4DHPuSVM36QR6MKbiBgjHr+U1mGkRB7/h203xJvOXJIbs3FQfBF6Rj6SAli6mrQrLjp3/yr87oQPKswcyubRTp+mXaUEq0DpyWzQ5bnydM+c0ETUr40N9G6hYVay81rSo6FpNrND9i1HqVGWn3MdxwjdMntTTNGy7/jUtfagnkdifmP/7BBbZwyxz9TlESLuVuiSogBx2CHWKlBkW6FDPbA/1rb8t7EAO4W8uI/f8aj4PB+nGhbkkKhK5TWSq0xSRKW0b7lxZcZYil3jeWFvq9ZzR4gIvIB9lxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kxvmhcl25OnEgmKOcGrDUMIaZPGllRHoq8ISM5Op8EY=;
 b=e/TmPRM7jRHEXA7nhXeKtUcMXDS/N3by7Kgf3yvWzlRFaycYZIjenNuaMdgzvCXRwILZ7Wk/YfVeta8vkHsaJliaPYuhKlMPBj/tpqmz0iqZENOsvGCDuFHmWq9WKbA2/E2tJf+EaOXQM+vayv6jkCC49rtJ9xLI5KGR1uxctghChSGzaDfPd9BjMkW4ENeyKSxS/K9cy9e7MeBRaknmUpEY4gpC3ATePIS3Z3MerLJZcjcAm58osxO1ImBn4AF9vcr+TVTz+3npbNzZhS/SZim/15n+J5xYufXCpaYtNCP3O3nE3NeR82Td7aLZCPs5FwTlhhlbKBRGwLNC7W+qfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kxvmhcl25OnEgmKOcGrDUMIaZPGllRHoq8ISM5Op8EY=;
 b=faCcp8Ra6+enUD1MtbJpFk8/ts81x+EeOjPJ1blJN7DFWsnJqDPXOxIlfog6YAOlPZl9B4DXCTSSsBionNvem4ztoC8eGAvaNm/LozoHLPBPWRy2QqpSCj5CBTLBeynEJCeoWRQtUC+bijVUeRWLFLGyiqLLAhb8pfeDiZ3IA/Waio+WedPndMddoBog/yx3Xa9N70rRZbs9QSO76z+7Hr1JArjWsJ1r7/Z+KlXAnGd4NMlNn+eEoLjwruvELp84dTeIS8ye5etH+dwLyDGdnV3V8ffsB9ELzCUnb37JXc9CDXlQKUNGhUccS57AzOAjwzR+oeBkzgwiG6d0LZ0m3A==
Received: from AS9PR06CA0486.eurprd06.prod.outlook.com (2603:10a6:20b:49b::11)
 by DB4PR10MB6118.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:38d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Tue, 24 Feb
 2026 15:49:37 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::e7) by AS9PR06CA0486.outlook.office365.com
 (2603:10a6:20b:49b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 15:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 15:49:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:51:52 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:49:35 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 24 Feb 2026 16:48:12 +0100
MIME-Version: 1.0
Message-ID: <20260224-stm32-i2c-dt-updates-v1-9-347cf6fca7d1@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|DB4PR10MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: 930c2a5e-b0d9-4a61-9e46-08de73bc5076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2pXcFFMZFNSMWhmZDIrVjdRNjFXbm5Ba2R5eEVSYVNrWXAxL2JxQmJ3czZl?=
 =?utf-8?B?WFYvMXBERXRqZTBDR0dadWczelVxS1JSWXh6RzZmMkJ5YjQrdFgyMy9tV00x?=
 =?utf-8?B?NW5tTFI4ZHByblpVQmlQV0pBNGo4R0FidmQ5MitFeFhMUndlOGR1ckFmWlZH?=
 =?utf-8?B?b0piMnBXWkZIMUdUeVVnWTNRR0I1WlBETnh0WDYzQ29uemNOOVd6b0hYNEJx?=
 =?utf-8?B?VkdQYjk3eEphRUZFVVl2V2FKcFAraXVhc3FVTGxMT3dzTHg2Kzcwall2WERP?=
 =?utf-8?B?YVhTNDBUVUJiM2wxdThNYUFRM0MvaFRQT2REdUpjSmxEd0xNNUVKV3VMQVQ1?=
 =?utf-8?B?VXFmT3BuU1hMbHdiNldKakJ3eTNMVW1uY1hmWlVnL1NXNUV4QU1wOFZNSWdZ?=
 =?utf-8?B?VzNNOWd5ZE9lSlZOay9aeDhUNkR3Y05FSGtWUGVxSml3QkhCcXVTTWM0QWlS?=
 =?utf-8?B?Y3dYOG5RVHBXVkJNK2wvK1VRU1dYb3NjamlvTXFkUUFpblhLRVdGN3FIVWx3?=
 =?utf-8?B?Y2hVWUIzbFNRUGE2OW16Q1l1VDhuYTh0Z25CQk8rUm83S3V3d1EwRENvUnZp?=
 =?utf-8?B?RVFDS1Q2RjgwMHBoZmZrWHp4dEdMRmNCQ0YyOU45aC9mdC9GRllxbG5ySDNs?=
 =?utf-8?B?R3JOZHJvb2xxdU4zOFVIeDJ4aDJzakZXU3lTWG1kUjREWUdiN1N5eGFmR00w?=
 =?utf-8?B?VElWSWROMDhFa2JtOWFjeVJ5dUgvMXRiQVR3RmpVV0ZCd2U3VE96R2NHVjFR?=
 =?utf-8?B?UThDYzZRcXNpUFhGS1VOQTFpVFJCcXI4SjVBYklqL3BkYzRvT3FyQ3h2cGhh?=
 =?utf-8?B?d1Q5VXZ1ZHpQdGNEaDNhbGY1c1ZzTU1hSXFWWGxqNENtaE82QkFyMTdHWmpm?=
 =?utf-8?B?Yk1ZWms1YmVHZFlWSWxiYjBIeXdibWpDN29NdUpqdzFmNEkwYk5FZVh6VGJm?=
 =?utf-8?B?bUFlQ0FuUFRWUDlPMlEvZ2tOcmF3N05YRzVFdTdEL29BMlhKdVczOHVpZ0l3?=
 =?utf-8?B?YzhiZkRWY2w5QWlSSnQveU5mNWEvVjdFdlR4QlNTL25aWG1vSnBWMmwzbE1U?=
 =?utf-8?B?eXA1azNvOVNEYlViT2lLSUNGY0tTVzBoZ1F6V2hiN0JPSEk4SVFqb2JOaXRx?=
 =?utf-8?B?ekZFT0VCV21lSS95SjFqNlM2aDdGamtYOVhEVkFodis3YnFNSkVMV043ZWJu?=
 =?utf-8?B?ejNuVUFINkVDNVpqbU1HNWRDK045OHlWWVhLNW14U01XSDhLdUFIaG9oQ1cx?=
 =?utf-8?B?UGFNUzdPd0VwbThiUTMzU1N0Z05xcmJKQkJrbGI2bHRQVDlraUUvZ3REL3Ux?=
 =?utf-8?B?RE91R0JyYU5nN3MzOFhVMmdBRWZXTmFrU1cvbktMc2YybUQ0UStwbHdpMXFI?=
 =?utf-8?B?SURiOTNIcTBEQTRlRis0SDVkcWlyK3RKZmRpWjg3U2MzNnhtNldjUitSK3l1?=
 =?utf-8?B?U1Yxak4wNktrZlpyOXllVG9tY2p5L1hqRXV0MXRsam95cXJPNTU4M0lscDNM?=
 =?utf-8?B?eUNLb1dJNkNHWWtOMk5MNFBHSEVoZ1lwcnNPSlpQdm5TaTFMQU5QNUVlUk1T?=
 =?utf-8?B?bjkrazBNSGVhdzdsOGwvNnZlSjlNcmFENGxINngrbUFZWE8xOUEyQTBxWGhi?=
 =?utf-8?B?NnViUHR3NEdwV0hiSFgySnkyR3A3eEVkYVJlY2x2dGdWUjB2eCtTdzU0WVNs?=
 =?utf-8?B?TTFQWFVDdTlhZHFjcVEyMUR3R1djYXR6YSt3aytEWlVreG9paUJMNm85OE82?=
 =?utf-8?B?N2pXcFZhSVNxUjNZUzhJN29Gczd2a1lEWTlwRW5YUnZwRktaYlFVTFVPM29D?=
 =?utf-8?B?L0xkSVR5NkhCQVBjM3Z1UlhjNWphQTJ5Nnk5eTlxMkY0OU0rcE5kVW0xbWNq?=
 =?utf-8?B?cjJ0SUNnU29ETjdPSW83cHByK0dhMlZNeDVsOUUzVmZZS042TUtXMi9mblMr?=
 =?utf-8?B?d2ZhcnRnZER3dTlKZTZ1aCtBc2xiV2VXc0Y1WWhXRzJnamJ2SE42VVNmSWtW?=
 =?utf-8?B?VWM3aEFyV3I0bWUyaEJmMmd6a3Bibjc1MkxKK0k0c29peUJ0S3ZQdmNQWlhR?=
 =?utf-8?B?ejVVOFVqN0YvdFQ5Rnl5dmg2OEdYR2NTNnN4akdWS0hrSTJhTEZYbXBWeW0w?=
 =?utf-8?B?R0FlNjBiVVJTbkhqVjhDSTUyUkVvRmdZalNQNUVEOUo2Qmd4cmpsR0Q3L2JB?=
 =?utf-8?B?U0MzVjJjbE0wcytUZmYzWGFqeWNMb05zZnFmUlc5L21aUFVEa29YVWIvNndF?=
 =?utf-8?B?bnhGY1NFM0tCb0dXdlBVTlVRblh3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: LRcpFZN9I1RlEXGo5m7n9gGwCH15nmO3PJST6KGpalGFGyq+xKc4S/U183ejDUjqlbvgUi/A9jwwPuBg3OdMgt4cO0XtqIWzj3Fi2u6/rwisaigbrQINVC/JX7I7drz4G3u/lhxwVnI+PKXmvGDTojla63hnfaLaMAL43I1Z1x4fA1fUP/Gn7079XGlflC4pzzf59DDu7nlbTVW3b2DKo//cRoLTq5CJVzpp80GkgNplJ4KLgZjEsDqPCpKYpwvKixwEmizP45CzFKOD5Td5bcfhrOqKnXuphoGYBqHZYimt8KfoiMTq7w/Ob8TtrnsIs3kqCiAHCQ3KLotD/5MsFnuMwFbrEh8r9FEvXsmfCV0uwqEZkHvj41JWkxXTlxQixiC2lWrrsQrtjkjbJSgJZUgmjxAK+6KUEfjNYXuvV7yN0R1OCEI7L1oWkVsgpTXN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:49:37.3408 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 930c2a5e-b0d9-4a61-9e46-08de73bc5076
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6118
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 9/9] arm64: dts: st: describe i2c2 / i2c8 on
	stm32mp235f-dk
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st.com:email,foss.st.com:mid,0.0.0.0:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.068];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 104E0189500
X-Rspamd-Action: no action

Add nodes for i2c2 and i2c8 available on stm32mp235f-dk board.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
index 5ecc5ef61590..ff4b32a3b12c 100644
--- a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
+++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
@@ -117,6 +117,32 @@ phy1_eth1: ethernet-phy@1 {
 	};
 };
 
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_b>;
+	pinctrl-1 = <&i2c2_sleep_pins_b>;
+	i2c-scl-rising-time-ns = <108>;
+	i2c-scl-falling-time-ns = <12>;
+	clock-frequency = <400000>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
+&i2c8 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c8_pins_a>;
+	pinctrl-1 = <&i2c8_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	clock-frequency = <100000>;
+	status = "disabled";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+};
+
 &scmi_regu {
 	scmi_vddio1: regulator@0 {
 		regulator-min-microvolt = <1800000>;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
