Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJU7L5OnjWkK5wAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 11:12:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6852A12C54E
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 11:12:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2EBFFC87EC9;
	Thu, 12 Feb 2026 10:12:35 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013035.outbound.protection.outlook.com
 [40.107.162.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8B25C87EBE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Feb 2026 10:12:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBNFgbK36j5NiJyDf6YpJa3Z2BNjZPgnmUfV8kBSAzFia3Uvx8J8H0aIV59+es1BPI42DfxMYvIbH/8jultkyc2osQB6zmwOwUvil6yxVZ4OnlwmCyf42xXKvOBTG3SRMJW+ESQiq3NNZkcyxSGlgz3V0D2I/3PAyY9fLKp4n7Nn4ESXtkHevIl8JqW09nFEeu0klcFj49hzRVMDljPEI9cwW/uEtJa4AWYGLF267Vgg22dCco1cMX8UYTMUG4tN+3bTGxeeh6A6yfSiarhFGNXpQgdXPNbl3aPJ+6Xlb+u4RnBJCaodHxzhLkNB0QWoV6ohrIdXcf7nO3EyF8eUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47+ONjsoN5DBXWAxqxRGIi3sBX85pIgWPLUDR9isXMs=;
 b=ETPs2M86Kxmq9LDRMw3WNsI0UWaDkxPO7/fdS0FAPDrUHRyL8RFLtEwYGzmKNy83WJ7C0wo3EDOQQiB1JeFkqGgGQEc58E9B3GSZn6OZWbbkiJLWcMzNKqVkhTUKHKUSqa5Ra4711I+dwVCxWcH6qi1cGUmToqUfhT5EAIvm+Ae1F7PEUTgy/0d0v30EnaeNXjACwq8QauB6OtVvpotiO5teApYZWgLksXdl8QE25uTSsGYJgX/N6T6DMSHWFWC4a3u3BNojMUm4H11QxI9kxj5/ZTyLhhRVmgAe4OaHxK0tdCCryMlDhhUOWTSzaw5vNdmIyCA04PkGQZb3hVVaSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47+ONjsoN5DBXWAxqxRGIi3sBX85pIgWPLUDR9isXMs=;
 b=NaQw38wr7GPDl+el2Vdy/Q1dtTY0CM6KqqUxCws3hwgDSxLc6sh+W9KG+gOBEoKnSmDcuneu5GzXhkUiCnUYZ2qB3O0RmdWB41VDbvJz2F5ZmJyeAC16DI0gLE4gmw5yyxYTMd0YTMP/FPDq5QvBlo61xXPqaruUkw+OXRFffGNR/yLKIoqE27HhUx+fKMMc+HgSdRocRJgtjaBVAR+cNGWVyveqCg+0ZpDmGUmQnsbUVhLe6A7UMMIgfO0UYH31+Xt+fxX3Jqd/Yh7G9b8ktx72vhK4W2c58M6L9pBWear4c6U56MErTtzYxMf/W93OBCBbS9srqsfjxXJMWXtESw==
Received: from AM9P250CA0021.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::26)
 by DU0PR10MB7359.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:445::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 10:12:31 +0000
Received: from AM1PEPF000252DB.eurprd07.prod.outlook.com
 (2603:10a6:20b:21c:cafe::4b) by AM9P250CA0021.outlook.office365.com
 (2603:10a6:20b:21c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 10:12:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252DB.mail.protection.outlook.com (10.167.16.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 10:12:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:14:13 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:12:30 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 12 Feb 2026 11:10:35 +0100
MIME-Version: 1.0
Message-ID: <20260212-stm32_risab-v2-6-02ef2859b596@foss.st.com>
References: <20260212-stm32_risab-v2-0-02ef2859b596@foss.st.com>
In-Reply-To: <20260212-stm32_risab-v2-0-02ef2859b596@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DB:EE_|DU0PR10MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: 1925a7e3-a95e-4329-6f01-08de6a1f3bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUtadTk3andEWEJMVW0zYURDbmwvb25rQzJFUldPcE1DS0hTTDdxVE02VXNT?=
 =?utf-8?B?OU9lRk9KVm9nUmVNM0lTSlo0RThKNmErYVVTUG5meldIUkdWWFU1RmxMZ0lH?=
 =?utf-8?B?N0JQSlB4dXN3M3J2S2hSQXFFTmoyOHY4OVVxNGRhaU03OEsyQ2xVY0ExWWtJ?=
 =?utf-8?B?azdlTDhoSGpPQURwMVZOcmlMeFlxdDlMOTJhL21BS09mSWtUM1NwWDQzekxO?=
 =?utf-8?B?eTh6K3NMa1J2OGQrbDhBeEo4V1JNR2xEQnp6dUE3UVpqa05DTXNZVTliMGZa?=
 =?utf-8?B?bm85UmlkUThSRTFyc2orTU1MZnpQL3F5SXpNeHhERDRJRUZQQllhOENDUGVl?=
 =?utf-8?B?WCtQelJsYURvOXFLZ1JUYmlDZzZvOHJuKzVPWUlFZGxTYXdFdm50TXVLUGxE?=
 =?utf-8?B?ellXdG5ZdE1NT2tUcC9UaHdDSnhwSzBFbzhpcFE3WWt0TlVMTHVvWmJPOGgz?=
 =?utf-8?B?QzlYY1pvWElZR2FpNms1VGNJRUtvMUFMaG0vWjcyUHZlL2dOVFNzdWYrNXVG?=
 =?utf-8?B?WGhMRzVTK2NYZ1FWUlVDMXpuS1gwZTg2T29UeExHbU1oWHZkbXcra041QzRi?=
 =?utf-8?B?RGtUWnNyb2c1WHFyMzA1SS9SQkQ5Qms2NmkvTFVHMEg3U3FVN3FNUHhqenBa?=
 =?utf-8?B?eFkwZW54NHorUFB1VUtWcTRwSEFWQXVPa2dhdm4zR0t4bG0yUTBLSWYxM0s1?=
 =?utf-8?B?R0xSdGJVMXBFcU5tbVVXTFQ0OU1DYms1T1FOR1lpRXNSMzh0T25Hc3QxWDJn?=
 =?utf-8?B?dGROV1BjUnA1aWltRldkRmtFM3lxbkYzWUQrYWRINWhwSzVNcU8rTHdyZmxw?=
 =?utf-8?B?ZFNnVmdHaEhpNjdoS2NuTktrVzJreWJuRHFRR2NnMm5BZzZtT2J3ZjM3dTBr?=
 =?utf-8?B?Q0F5Y21pMTYyNFozWGQ0WjZHeGNoWTU5YTZtbEpjK3JqU1MxRkpreG9TZStn?=
 =?utf-8?B?bFFndzd4TjZNYklOaVN2V2RwS2UzZ1hnTCtuWXNSakZ2YnF3SlpKYjVyMjlK?=
 =?utf-8?B?WkI0N3k0cFdRc3MzY0kxTUZJNHdYVzZwTHMvWnVwVmxydmI1OE00RE1CN21O?=
 =?utf-8?B?VjAyMExJT2NIRGNOa2pSVWtiRUNlK1Z5Q2pLWEtNeW1DYnN1Zjc5aWNBYTBU?=
 =?utf-8?B?d0JRUksrOS9pbmo3VmN6cGdWUkIwVjlCOEg5TEd5bTZxVVZtK3pNb1A1d3RI?=
 =?utf-8?B?ME8yNStrWjJoRTdsY0F1d0NjQ3I2RlBDc1Y3QXpqTHBYdVN3TVdNam5BMEJX?=
 =?utf-8?B?YkQ4VkM3aUJGa0U5b3hUNmdpd0grL2gwQ1hKSmEvekx3aDl1TWcwaDFxV3RM?=
 =?utf-8?B?dnBIQXIxcGI3anZLUjJIK3ovSmhaendiK0tYeEptR0Qzcm92eHVYNzVVN0d1?=
 =?utf-8?B?aWE5OFkxYUNxRlMyTFArVXJsU3c2VXMvT0p6bk5yR1ZOazNQSkdYMHB4Q0FB?=
 =?utf-8?B?ODlyTXdESW1ldVpvVGNVditKM0NRK2FRVnFpQWgrZFlvdnlOWVVWVEk1ME9Q?=
 =?utf-8?B?QjNGdDlTNVR2eUMwZ2wvamhTUThCNTFsUEY3bkZDSHdvc0g2aVFUZElmOXBZ?=
 =?utf-8?B?WHdmNXRhYmcyaWViamcxNjNOeGtMZGVQVmUzODBEajRnVko2YlRJKzBrai80?=
 =?utf-8?B?UU84L3p3cTVUdUt2K3RYOWMzZTdxa3RJYnljRVJNRGpBek0zK1pBZitPYk13?=
 =?utf-8?B?V0x1YmtqOEtucW9TUVBOc1l6ZUU3YlVDV2JtK1ZyVDhyL3JWeFhBejBOMEpV?=
 =?utf-8?B?Y0RLd0RJRGRRRlNBL1R4bmJwSzVCWFBRRkdEU01FOHVQNUV2Wkx5TFh5TmVu?=
 =?utf-8?B?SzZEWVRRbEtuQzB5SlVVUjVHNnpMd1JBRzFpazJMcVBzWDQwaVNrZkprZThN?=
 =?utf-8?B?SzZWRGZPVUo0cXUycDNTUGVMN1VQc1RrZGlxRElzbmh3ZnVicUlyODNFTEpE?=
 =?utf-8?B?MUxOdUxUVzluN2Q4eURsL204WUZXb2lLK2xsRzJHelhSZ3FwK3dUN2JUU1N6?=
 =?utf-8?B?c0VmSkN0Z2ZFWS9maVMxZVNmWDJCMFhjWWVBVkNRVnZQdFN3TlFXYldxWkdS?=
 =?utf-8?B?YkZpTmRPQ2ZhbkNiMU9nRVNDSnUzWHdlSzFUT25oVlpJeXkyajNXWmlKZ2hO?=
 =?utf-8?B?ZUNQQnhlNHhGaGViMnhsWE5lK0pCL0F3K1c4UUFsSW45N25vV0ZvSVFJWC9j?=
 =?utf-8?B?RmRraVg0c3dpT3pKVUpRSEIzVytmRlQzOXgybjFCZVU4RHRsMjZmUGpJNlVP?=
 =?utf-8?B?RkhzVEpNVktlVkR6WE5vSllTMFVBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: na1QafYp8m4gsxb1BWQ0PXfI7w3PvZwo8ap0+VqvJ1wwsJYuwFHz3BlodPi7TAsiMUuqP06EfK3cL2vlE8a4r6i0ArTyWJq11S74YuHUvWnjTzgz/JeHcEtSUQG1KrxBTL0B3Rj0Yz6wzLsVvx8LZ8Ia74m3J11i36n60hAWfAHnPLJKEtIY9wq1615BmXm7W8rUCZjguAflSy+6lKCLNWLY2JAvljsrEf59sj60y2G8X3EfayNoTQCRTPXELhNLngGYixhx6ZC+7MoWgI1+XY8QrjB/l6BNCmmqoSenql5vbStln/t8WMCipMrlCEog7ID7sb7YDh2QaJNWn7QKghGfxhItZkVuJrntr5O51ULHNG/hqNvgqyHea8c0hxVHT9ZmQiMG7Cq4aM/mEcU4tMcfQCtHwdrxuFGc48+b4KM7uRGY7mLFAH1s3PHfYLuh
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:12:31.1915 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1925a7e3-a95e-4329-6f01-08de6a1f3bc8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DB.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7359
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 6/9] arm64: dts: st: enable all RISAB
 instances on the stm32mp257f-ev1 board
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,baylibre.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,0.0.0.0:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6852A12C54E
X-Rspamd-Action: no action

To be able to dump the RISAB configurations, enable all RISAB instances
on the stm32mp257f-ev1 board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index bb6d6393d2e4..973acea6d248 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -352,6 +352,30 @@ pcie@0,0 {
 	};
 };
 
+&risab1 {
+	status = "okay";
+};
+
+&risab2 {
+	status = "okay";
+};
+
+&risab3 {
+	status = "okay";
+};
+
+&risab4 {
+	status = "okay";
+};
+
+&risab5 {
+	status = "okay";
+};
+
+&risab6 {
+	status = "okay";
+};
+
 &rtc {
 	status = "okay";
 };

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
