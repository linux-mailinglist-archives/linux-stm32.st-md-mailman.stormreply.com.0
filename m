Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CsYIBLBlmmzlwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 08:51:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BF84D15CCE9
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Feb 2026 08:51:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 301D9C8F273;
	Thu, 19 Feb 2026 07:51:45 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011043.outbound.protection.outlook.com
 [40.107.130.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 08F0ACFAC40
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Feb 2026 07:51:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQ+1qh5YjlGjd8mOz7ULC45zCihj7emQppybuyl1dv9j7+tHEN6xYCw4P5le2iAcVUHyIDOT+ZQDZNEg/T4GHb0U/YSgVok4jY5/1NVpPpZB8kjN+Xv4gbrl0M0LxEFiBdWVnc2ceJkvSK2Coa2S7RzMnc2iCqDtY/DEFeXelTsgYbKwEv9rnrj4VggaYqe8nvimgvHCAXHSMs1bePtZ7bAskYkXS0xxy6sFpXs5Nq74gLzpVAgs+Mk4lIBRrsUUPWrcU5KgP+30e/tOtgjB4TknemCcVMww8o3hPoGwAaI2ybo2TztU0VBnnEP9AORtpNlJ7aiepmVbDwqTuo7x6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ky8Ca+nZaqHt/yBIku833g6W9mruJMgIWKcDQ8slxPY=;
 b=ZQndicser67LTuH6Wrt16Cuh7SddItTzJr0H6DFYDrDE3t0djpJVesxOS559/17IXDVUGS0ssMXJ7Ctds8x4eoNzX08Ndi6gvN3iOHvPrkY55lWvLZ+wQOATxL3ncgq8KZjY76T8rimSwBAi/acGEuKu+uGakaip5HjykWTaF2SrOdXSOHmxjtq0jEd1nwZWvyVULzHVEY7iYnqlUANxHaNVsIi1/8+rFMWwUlqs/q4tTGCAC1XlvcmMRhEoUqnwYoe9EILhugs/VCphip3nVLA3QUM8umgtnsH2I1s64fFQNbzbrReeEcOCQTP6vt8MafBrfv14K9GUbzN/MpbY0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ky8Ca+nZaqHt/yBIku833g6W9mruJMgIWKcDQ8slxPY=;
 b=hKZfpUMlJKpuZanFuZNTZ4cmBwjBymDxQnzFZff36Yd2e0FEWgauV7btAqPq6AXwYIgoob7G1Ps9HuTa4GX8wRdGMWUWSDT8C/xGb+UPMLFI1GbFuC+EBDt8mBWnGyK47mCqVitogAWJI/S2eqvAxp8h7WZsRZTJ/gM8BW3/pWlbJ0u0WlLNlGw0A31R4Cep+E/wS1g93F/1vgUIeDNkt4EGVg9H+xWbrFLDFqbE3NGWJIclBugin17hxshu/h6Dzfcw7nCd7LenNqIQnjRjNUv3XuDomHboZtF/KHgoRiqXuWSHc8bju5tbKn3XBP/zLAnQJxzDy0+gie3sgq7Jxg==
Received: from DU7P195CA0018.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::18)
 by PA1PR10MB9179.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:441::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 07:51:38 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::1b) by DU7P195CA0018.outlook.office365.com
 (2603:10a6:10:54d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.14 via Frontend Transport; Thu,
 19 Feb 2026 07:51:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 07:51:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 19 Feb
 2026 08:53:34 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 19 Feb
 2026 08:51:36 +0100
Message-ID: <7639bae5-045f-4d56-8bcb-cddcb4e3d87f@foss.st.com>
Date: Thu, 19 Feb 2026 08:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rob Herring <robh@kernel.org>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
 <20251229232530.GA2753472-robh@kernel.org> <aVOzHWmlJ-eneS-2@sumit-xelite>
 <CAL_Jsq+_S8UY7s7WQg9jXuBXCYMBWVCy=kVDMdkKTx6RctqQJA@mail.gmail.com>
 <aVtqITUxy--E8HJt@sumit-xelite>
 <49f1808d-1e08-4f47-ac3a-5f2274086060@foss.st.com>
 <a17c017a-15f5-4ebc-9dd0-baab718dbe0a@foss.st.com>
 <aYrMp9wqk91-tQXn@sumit-xelite>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <aYrMp9wqk91-tQXn@sumit-xelite>
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009527:EE_|PA1PR10MB9179:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b3e4717-495e-40c7-954f-08de6f8bb634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V0wza1JaVEdTQlJFejlqK3hmN1RlS1VzTS9Fb2JudnNaQVBaem0wSWkvdy91?=
 =?utf-8?B?K0pTejV0OVY1RTJXYVpVQ3RxVUdkTU90S0JtcVMrWnFaeXY1NWlWRVNZUTVv?=
 =?utf-8?B?M1RVZXNZZUJlODJ4WDRCeEVlYXpXbktTU3JVSVBrTVd4MWd0TlJPdFZ0Q2xJ?=
 =?utf-8?B?TmdWejc5djFIeVpGdm9nQ3ZlN2xpWVdzaDY4UVdjRVgwQ0FZc0pOMmRWb0d1?=
 =?utf-8?B?Q2hIZW5oSitxblJrSmIwSnJibGllcWpDbUxBU01UWDZTSTBKVHJXTEZSWmVk?=
 =?utf-8?B?T2lTSnllZVlxVUJoMlYwZEE5OFNaM0xBMFFDZDBPZ0syb21wd1crTlh6RXBw?=
 =?utf-8?B?Z3F6NWxjQnNqWWgrME1OTW52ajkxd2NYeW85MWIranJCSjVOamR2S2E3d0hO?=
 =?utf-8?B?dkExRjVsREIra28zYzlDcy9hZWNJb2pqWldnUDY3cXlWOWsvWDVqRW1rdmJG?=
 =?utf-8?B?cjRFa1BTL0Z2Z2U2NVZwT1pBQzR2TzY4cG0yRWpZN0J4cWpUWDZpaVRuY1JT?=
 =?utf-8?B?MVV6Z0Y1WXdwdUFkbmRVYmd5TWtIazJpdmc4WkxhaWwxbC9TMGVzbnhnMktO?=
 =?utf-8?B?c2ppczk0bTczVklXK0dCU3dYbkRoTXhaTlhWV1RDUlZzT0RhS3BLbHZpYk93?=
 =?utf-8?B?ZDNuS0pBM0FTRjBvcFVWSGdqVXY3MnE4M2pSNnJkSWtuNkRlV0UzMGJyRnA4?=
 =?utf-8?B?ajJZRW9SVUxxdXZBdkEvWS9wWXdjOEtYZzhsd0V3eGJ2emxnb1dqTEo5ckE2?=
 =?utf-8?B?MHpNaDV3RkxwL0ZORUVKbkQ4TG9nbDN2ZFR3eXdyQnVqQ2hCOFdNL2RBUWJU?=
 =?utf-8?B?SVp0Q3lLNE9qc1ZpdXRLZFZNSUdsWUpUQ2hYaFFIOE85dEVLbU5qU3JLU3VJ?=
 =?utf-8?B?dmdQV2xKbGlxcE5WZ25FMWNmZ0F1TlNpb1JhL09JOENaaWI5Sm42TWxKZ0lS?=
 =?utf-8?B?WTVYOC8vRXlLa2JreGwzdHpsWkJ5U3JXK2Z4MlNVR0F1aUtVMG1Gclc0Zk5y?=
 =?utf-8?B?NW95ZDBWTkZ1R3J5K3NJaW9URFh2VllsaHp0ditId2JrWGw1YXZiRmh6bTBx?=
 =?utf-8?B?cENJZW1zN25XTDVIbC9LZ3AraGN0NmRGVFZrVVQ5blBaOUJIQ3BIWnl2c0NW?=
 =?utf-8?B?dFc0RFBaSnI0emVGYUROK0FrcVNkc3ord1VqZ0YzcnBmK1o3QVY5R1diY1pn?=
 =?utf-8?B?M0IwQlE1WmhzOHF4L2VOSDBSWGFzMmhWcFREb3Zsb1VpVHlFRmZOUEkvbm02?=
 =?utf-8?B?dGI2eEhHME1xS2VCUmZUVjZzMXN4MFNxeW5IczJ5bVR0MHp5TkZvbmNROE9U?=
 =?utf-8?B?eXE3ajl0Q2ZUOEl3c2drcFpkT2krMW44MG0zQU05WHo4UkQrUkFMWWNuS21z?=
 =?utf-8?B?N0t6R2JIMHpPdmdUcHIvdVFTd2xvc3M0K2JpUCtObTRnSlRabGxBdXJ2cWVz?=
 =?utf-8?B?Z1djUzVaRk9CVHd5aVZRNERuOTQ0QkxmN2dMNE83RUZIOG1vTXE3V0V3dElM?=
 =?utf-8?B?dTB6QjFIcTQ1NkVuczQ2QjlGMHZNaFUxMTVBMjFsT0VhVWEwdFlJM3JBTktj?=
 =?utf-8?B?c3FNYjFNRU9HdXZMRXNFU3J1cjF1QjJVUElVSEU4bTl3U25hcUs5cmFHZzFF?=
 =?utf-8?B?MmwzY0thWm5iSDVuTms2SEdBWlhYdkdGakpTSHRsYi8rQUtuMVMxalpZTVRR?=
 =?utf-8?B?TEk5OHNpdlliaHBxMFl6USs0a3JrQkpsU3ZWSExyRnYvMDdETFFTNHVGOUZ6?=
 =?utf-8?B?MUdiSklWcFZaN3JrdWxhWkV0anlqV3ZBWk9aL0d0VGRIMVBxZUhXSXdmUGlJ?=
 =?utf-8?B?ZkluV1dreDBiK29ZNzNKdzJCbVFrSTNuUFpHRjJPdWM2anpvRXkvVXR5Uzd6?=
 =?utf-8?B?cytuWmhQTzJNc2puSy8rdFR1YWY0SXJ1bzZxREpuNnNJZG11YzVLNUVhOVg1?=
 =?utf-8?B?dGtCU3kwbHFzUGxNY3BoeEYyS2JJYnJuYU1NTlFhRzBSNXFhYktXWnV6Yndy?=
 =?utf-8?B?VDVmVmtkU2RmRmw5RlV6aVFqS1NkWHhsUFV6clFmZVpPcGRUcEtBaVN2YUU0?=
 =?utf-8?B?MmN4RHFEdGE5NWxRUU8zY1g5Q3ZHZ3lOYXlSdjNPUGlaMHhtb3RvUUtNTlRC?=
 =?utf-8?B?RW1xQXZGOEJUNGUrSEEvTzBDVFErL1VDT2QyeEE1VkhnR3BSRFNMNk9xYXpr?=
 =?utf-8?B?NFE2RHVHc0JtRmtndERrMGpKNTBqR3lKR1BuT0hGRGhuSUIyUFVucmlFQTl2?=
 =?utf-8?B?R216dU1sWm5wZ2h1Rzg0amtqcm1BPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /qHmgWioz0gPklVYeoUlobyvOV4KTKN9jl68PoyGuuX0r7m3SUDhkwagoNGPUEqEIwjyQnZi3rI6UkLVIT2dODrREof+5cxee0qvXuX+CGU8mD4oeq+oBpwH3fU4w0KEoaOJqctCT3n2oHzP3xkci+jjSsWO7reBfCWmNCsQqHmdgOCfi7lJAKPTRDbYiFCzPBz1qirRTWYCd3IT43P+eLFn6ZHdKuMNVp29HmO/wrqSKl0mUPPC3SycAbS0QmCwAG8wEPyxoRG1Pn5CaImUgs+V+mcmpmD02HcOMjzUUSlB4t/CINpmYGe+ItLeSjLAGoIKzIiY+or808W11xFxT2kj0j1ydW6dU5n1l4j+HhDeQFve+yL1XW+iAwvjVRCHh8j/g0GRNmKspBixXfbBvchy6C5bUax2ymJ9/s0RTnnkETWr2QRXOBNWUgcKZmON
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:51:38.0087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b3e4717-495e-40c7-954f-08de6f8bb634
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9179
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Mathieu
 Poirier <mathieu.poirier@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, op-tee@lists.trustedfirmware.org,
 Sumit Garg <sumit.garg@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v20 1/6] dt-bindings: firmware: Add TEE
 remoteproc service binding
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:sumit.garg@kernel.org,m:krzk+dt@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,stm-ict-prod-mailman-01.stormreply.prv:helo,foss.st.com:mid,st-md-mailman.stormreply.com:rdns];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.972];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF84D15CCE9
X-Rspamd-Action: no action

SGVsbG8gUm9iLAoKQ291bGQgeW91IHByb3ZpZGUgeW91ciBmZWVkYmFjayBvbiBteSBkZXZpY2Ug
dHJlZSAoRFQpIHByb3Bvc2FsIGJlbG93IApiZWZvcmUgSSBiZWdpbiBpbXBsZW1lbnRhdGlvbj8g
WW91ciBpbnB1dCB3b3VsZCBiZSBncmVhdGx5IGFwcHJlY2lhdGVkLgoKVGhhbmtzIGFuZCBSZWdh
cmRzLApBcm5hdWQKCk9uIDIvMTAvMjYgMDc6MTMsIFN1bWl0IEdhcmcgd3JvdGU6Cj4gSGkgQXJu
YXVkLAo+IAo+IE9uIFR1ZSwgRmViIDAzLCAyMDI2IGF0IDA4OjQyOjM0QU0gKzAxMDAsIEFybmF1
ZCBQT1VMSVFVRU4gd3JvdGU6Cj4+Cj4+IEhlbGxvIFJvYiwgU3VtaXQsCj4+Cj4+IEp1c3QgYSBn
ZW50bGUgcmVtaW5kZXIuIENvdWxkIHlvdSBwbGVhc2UgcHJvdmlkZSB5b3VyIGFkdmljZSBvciBh
IGNvbmNsdXNpb24KPj4gb24gdGhlIGRpcmVjdGlvbiB3ZSBzaG91bGQgdGFrZSBmb3IgdGhlIERU
IGRlY2xhcmF0aW9uPyBJIG5lZWQgeW91ciBpbnB1dCB0bwo+PiBiZSBhYmxlIHRvIG1vdmUgZm9y
d2FyZC4KPj4KPj4gVGhhbmtzIGFuZCByZWdhcmRzLAo+PiBBcm5hdWQKPj4KPj4gT24gMS8xMy8y
NiAxMDoyMCwgQXJuYXVkIFBPVUxJUVVFTiB3cm90ZToKPj4+IEhlbGxvLAo+Pj4KPj4+IE9uIDEv
NS8yNiAwODozNywgU3VtaXQgR2FyZyB3cm90ZToKPj4+PiBPbiBGcmksIEphbiAwMiwgMjAyNiBh
dCAwNDoxNzoyN1BNIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPj4+Pj4gT24gVHVlLCBEZWMg
MzAsIDIwMjUgYXQgNToxMOKAr0FNIFN1bWl0IEdhcmcKPj4+Pj4gPHN1bWl0LmdhcmdAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gT24gTW9uLCBEZWMgMjksIDIwMjUgYXQgMDU6MjU6
MzBQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4+Pj4+Pj4gT24gV2VkLCBEZWMgMTcsIDIw
MjUgYXQgMDQ6Mzk6MTJQTSArMDEwMCwgQXJuYXVkIFBvdWxpcXVlbiB3cm90ZToKPj4+Pj4+Pj4g
QWRkIGEgZGV2aWNlIHRyZWUgYmluZGluZyBmb3IgdGhlIFRFRS1iYXNlZCByZW1vdGUgcHJvY2Vz
c29yIGNvbnRyb2wKPj4+Pj4+Pj4gc2VydmljZSBpbXBsZW1lbnRlZCBhcyBhbiBPUC1URUUgVHJ1
c3RlZCBBcHBsaWNhdGlvbiBpZGVudGlmaWVkIGJ5Cj4+Pj4+Pj4+IFVVSUQgODBhNGMyNzUtMGE0
Ny00OTA1LTgyODUtMTQ4NmE5NzcxYTA4Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGUgVEVFIHNlcnZp
Y2Ugbm9kZSBpcyBhIGNoaWxkIG9mIHRoZQo+Pj4+Pj4+PiAibGluYXJvLG9wdGVlLXR6IiBmaXJt
d2FyZSBub2RlIGFuZAo+Pj4+Pj4+PiBhY3RzIGFzIGEgY29udGFpbmVyIGZvciByZW1vdGVwcm9j
IGRldmljZXMgdGhhdCBhcmUKPj4+Pj4+Pj4gY29udHJvbGxlZCB2aWEgVEVFLgo+Pj4+Pj4+Cj4+
Pj4+Pj4gSXMgdGhpcyBnZW5lcmljIGZvciBhbnkgcmVtb3RlcHJvYyBkZXZpY2Ugb3IganVzdCBT
VCdzCj4+Pj4+Pj4gcmVtb3RlcHJvYy4gTG9va3MKPj4+Pj4+PiBsaWtlIHRoZSBsYXR0ZXIgdG8g
bWUuCj4+Pj4+Pgo+Pj4+Pj4gVGhhdCdzIHRydWUsIHRoZSBEVCBkZXNjcmlwdGlvbiBvZiB0aGUg
cmVtb3RlcHJvYyBzdWJub2RlIGlzIHZlcnkKPj4+Pj4+IHNwZWNpZmljIHRvIHRoZSB2ZW5kb3Ig
d2hpY2ggaW4gdGhpcyBjYXNlIGlzIFNULgo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+PiBJbiBhZGRp
dGlvbiwgdGhlICJsaW5hcm8sb3B0ZWUtdHoiIGJpbmRpbmcgaXMgdXBkYXRlZCB0byBzcGVjaWZ5
IHRoZQo+Pj4+Pj4+PiAnI2FkZHJlc3MtY2VsbHMnIGFuZCAnI3NpemUtY2VsbHMnIHZhbHVlcyB1
c2VkIGZvciBjaGlsZCBURUUgc2VydmljZQo+Pj4+Pj4+PiBub2Rlcy4KPj4+Pj4+Pgo+Pj4+Pj4+
IEknbSBwcmV0dHkgc3VyZSBJIGFscmVhZHkgcmVqZWN0ZWQgcGVyIHNlcnZpY2UvYXBwIGNoaWxk
IG5vZGVzIGZvcgo+Pj4+Pj4+IE9QLVRFRSB3aGVuIGl0cyBiaW5kaW5nIHdhcyBzdWJtaXR0ZWQu
Cj4+Pj4+Pgo+Pj4+Pj4gVGhhdCB3YXMgdGhlIHJlYXNvbiB0byBoYXZlIGRpc2NvdmVyYWJsZSBU
RUUgYnVzIGluIGZpcnN0IHBsYWNlIGFuZCBJCj4+Pj4+PiBoYXZlIGJlZW4gbW90aXZhdGluZyBw
ZW9wbGUgdG8gZHluYW1pY2FsbHkgZGlzY292ZXIgZmlybXdhcmUgcHJvcGVydGllcwo+Pj4+Pj4g
cmF0aGVyIHRoYW4gaGFyZGNvZGluZyBpbiB0aGUgRFQuCj4+Pj4+Pgo+Pj4+Pj4+IElmIHdlIGRv
IG5lZWQgc29tZXRoaW5nIGluIERUCj4+Pj4+Pj4gdG8gZGVmaW5lIHNvbWUgcmVzb3VyY2VzLCB0
aGVuIGNhbid0IHdlIGhhdmUgc29tZSBzb3J0IG9mCj4+Pj4+Pj4gc3RhbmRhcmQvY29tbW9uIGNv
bW11bmljYXRpb25zIGNoYW5uZWw/IEkgZG9uJ3QgY2FyZSB0bwo+Pj4+Pj4+IHNlZSBzb21lIHNv
cnQgb2YKPj4+Pj4+PiBmcmVlLWZvci1hbGwgd2hlcmUgd2UgaGF2ZSBldmVyeSB2ZW5kb3IgZG9p
bmcgdGhlaXIgb3duIHRoaW5nLiBPUC1URUUKPj4+Pj4+PiBuZWVkcyB0byBzdGFuZGFyaXplIHRo
aXMuCj4+Pj4+Pgo+Pj4+Pj4gSSBzdXBwb3NlIHRoaXMgcmVxdWlyZXMgYSB3aWRlciBzY29wZSB3
b3JrIGFzIHlvdSBjYW4gc2VlCj4+Pj4+PiB0aGUgRFQgcmVzb3VyY2UKPj4+Pj4+IGRlcGVuZGVu
Y2UgZnJvbSBoZXJlIFsxXS4gQnkgc3RhbmRhcmRpemUgY29tbXVuaWNhdGlvbiBjaGFubmVsLCBk
byB5b3UKPj4+Pj4+IG1lYW4gdG8gc2F5IGlmIGFkZGluZyBhbiBhbHRlcm5hdGl2ZSBiYWNrZW5k
IHRvIGZ3bm9kZSBmb3IgVEVFIGluCj4+Pj4+PiBwYXJhbGxlbCB0byBEVCwgQUNQSSBvciBzd25v
ZGUgaXMgdGhlIHdheSB0byBnbyBmb3IgZGlzY292ZXJpbmcgZncKPj4+Pj4+IHByb3BlcnRpZXM/
Cj4+Pj4+Cj4+Pj4+IE5vLCBub3QgYXQgYWxsLgo+Pj4+Pgo+Pj4+Pj4gT3IgZG8geW91IGhhdmUg
YW55IG90aGVyIHN1Z2dlc3Rpb24gaGVyZT8KPj4+Pj4KPj4+Pj4gV2hhdCBJIG1lYW4gaXMgd2h5
IGRvZXNuJ3QgdGhlIFRFRSBkZWZpbmUgdGhlIGNvbW11bmljYXRpb24gY2hhbm5lbAo+Pj4+PiAo
bWFpbGJveCtzaG1lbSBhbmQgbm90aWZpY2F0aW9uIGludGVycnVwdCkgcmF0aGVyIHRoYW4gZWFj
aCBURUUgYXBwPwo+Pj4+Cj4+Pj4gVGhlIHN5bmNocm9ub3VzIGNvbW11bmljYXRpb24gY2hhbm5l
bCBpcyBhbHJlYWR5IHRoZXJlIGZvciBlYWNoIFRFRSBhcHAKPj4+PiBiYXNlZCBvbiAoaW52b2tl
IGNvbW1hbmRzICsgVEVFIHNoYXJlZCBtZW1vcnkpLiBPUC1URUUgZG9lcyBzdXBwb3J0Cj4+Pj4g
bm90aWZpY2F0aW9uIGludGVycnVwdHMgdG9vIGJ1dCB0aG9zZSBoYXZlbid0IGJlZW4gZXhwb3Nl
ZCB0byBURUUgY2xpZW50Cj4+Pj4gZHJpdmVycyB5ZXQuIEkgc3VwcG9zZSB0aGlzIHJlbW90ZXBy
b2MgdXNlLWNhc2UgY2FuIGJlIGEgZ29vZCBleGFtcGxlIHRvCj4+Pj4gZXhwb3NlIHRoYXQgYXMg
YSBnZW5lcmljIFRFRSBub3RpZmljYXRpb24gaW50ZXJmYWNlIHRvby4KPj4+Cj4+PiBJbiB0aGUg
U1RNMzJNUCBzZXJpZXMsIHRoZSBtYWlsYm94ZXMgYW5kIHNoYXJlZCBSQU0gYXJlIHVzZWQgZm9y
IFJQTXNnCj4+PiBjb21tdW5pY2F0aW9uIGJldHdlZW4gTGludXggYW5kIHRoZSByZW1vdGUgcHJv
Y2Vzc29yLiBNeSBjb25jZXJuIGlzIHRoYXQKPj4+IHVzaW5nIG5vdGlmaWNhdGlvbiBpbiBPUC1U
RUUgY291bGQgaW1wYWN0IHBlcmZvcm1hbmNlIGJ5IGludHJvZHVjaW5nCj4+PiBsYXRlbmN5LiBB
ZGRpdGlvbmFsbHksIHRoaXMgbWlnaHQgcmVxdWlyZSBhIERNQSBhbGxvY2F0b3IgaW4gT1AtVEVF
IHRvCj4+PiBtYW5hZ2UgdGhlIHNoYXJlZCBtZW1vcnkuIE9uZSBSUE1zZyB2aXJ0aW8gcmVxdWly
ZXMgdGhlIGRlY2xhcmF0aW9uIG9mCj4+PiBhdCBsZWFzdCB0aHJlZSBjYXJ2ZW91dHMuIE1hbmFn
aW5nIHRoZXNlIGFzIG1lbW9yeSByZWdpb25zIGluIE9QLVRFRQo+Pj4gd291bGQgYmUgY29tcGxl
eCAoZHVlIHRvIGxpbWl0ZWQgbnVtYmVyIG9mIG1lbW9yeSBhcmVhIGRlY2xhcmF0aW9uIG9uCj4+
PiBTVE0zMk1QMikuCj4+Pj4KPj4+Pj4KPj4+Pj4gTW9yZSBnZW5lcmFsbHksIGlzIGhhdmluZyBU
RUUgYXBwcyBkZXBlbmRpbmcgb24gcmFuZG9tIERUIHJlc291cmNlcwo+Pj4+PiByZWFsbHkgYSBi
b3ggd2Ugd2FudCB0byBvcGVuPyBJcyB0aGUgbmV4dCB0aGluZyBnb2luZyB0byBiZSBhIFRFRQo+
Pj4+PiBjbG9jay9yZXNldC9ncGlvL3Bvd2VyIHByb3ZpZGVyPyBXaGVyZSBkbyB3ZSBkcmF3IHRo
ZSBsaW5lPwo+Pj4+Cj4+Pj4gVGhpcyBpcyByZWFsbHkgYSBoYXJkIGxpbmUgdG8gZHJhdyBzaW5j
ZSBzaWxpY29uL09FTSB2ZW5kb3JzIGJhc2VkCj4+Pj4gb24gdGhlaXIKPj4+PiBoYXJkd2FyZSBz
ZWN1cml0eSBhcmNoaXRlY3R1cmUgcGFydGl0aW9uIHZhcmlvdXMgcmVzb3VyY2VzIGFtb25nIFRF
RSBhbmQKPj4+PiB0aGUgTGludXggd29ybGQuIEFuZCBvbmUgZ2VuZXJhbCBwcmluY2lwbGUgd2Ug
dHJ5IHRvIGZvbGxvdyBmb3IgdGhlIFRFRQo+Pj4+IGlzIHRvIGtlZXAgaXQncyBUcnVzdGVkIENv
bXB1dGluZyBCYXNlIChUQ0IpIHRvIGEgbWluaW1hbCB0b28uCj4+Pj4KPj4+PiBJTUhPLCBpZiB0
aGUgdGhyZWF0IG1vZGVsIGlzIHdlbGwgdW5kZXJzdG9vZCB0aGVuIHdlIHNob3VsZCBhbGxvdyBm
b3IKPj4+PiB0aGlzIGhldHJvZ2Vub3VzIHBhcnRpdGlvbmluZyBvZiBzeXN0ZW0gcmVzb3VyY2Vz
Lgo+Pj4KPj4+IEhlcmUgYXJlIHNvbWUgYWRkaXRpb25hbCByZXNvdXJjZXMgd2UgbmVlZCB0byBt
YW5hZ2UgdGhlIHJlbW90ZQo+Pj4gcHJvY2Vzc29yLCB3aGljaCBzZWVtIGNvbXBsZXggdG8gaGFu
ZGxlIHdpdGhvdXQgRGV2aWNlIFRyZWUgKERUKToKPj4+Cj4+PiAtIENsb2NrczogT24gU1RNMzJN
UCwgd2UgbWFuYWdlIGNsb2NrcyB0aHJvdWdoIHRoZSBPUC1URUUgU0NNSSBzZXJ2aWNlCj4+PiAg
IMKgIFsxXS4gVGhlIFNDTUkgT1AtVEVFIGNsb2NrL3Jlc2V0IHNlcnZpY2UgYWxyZWFkeSBleGlz
dHMgYW5kIHNob3VsZCBiZQo+Pj4gICDCoCByZXVzZWQuCj4+PiAtIFBvd2VyIGRvbWFpbnMKPj4+
IC0gUmVtb3RlcHJvYyBXYXRjaGRvZyBpbnRlcnJ1cHQ6IENhbm5vdCBiZSBjYXVnaHQgYnkgT1At
VEVFIG9uCj4+PiAgIMKgIHN0bTMybXAxNS4KPj4+IC0gR3JhY2VmdWwgc2h1dGRvd24gb2YgdGhl
IHJlbW90ZSBwcm9jZXNzb3I6IFRoaXMgaW52b2x2ZXMgc2VuZGluZyBhCj4+PiAgIMKgIG1haWxi
b3ggbm90aWZpY2F0aW9uIHRvIHJlcXVlc3Qgc2h1dGRvd24gYW5kIHdhaXRpbmcgdXAgdG8gNTAw
IG1zIGZvcgo+Pj4gICDCoCB0aGUgcmVtb3RlcHJvYyB0byBkZWluaXRpYWxpemUgaXRzIHJlc291
cmNlcy4gV2FpdGluZyB0aGlzIGxvbmcgaW4gdGhlCj4+PiAgIMKgIHNlY3VyZSBjb250ZXh0IHNl
ZW1zIGluZWZmaWNpZW50Lgo+Pj4gLSBjb21wYXRpYmlsaXR5IHdpdGggc29tZSBjb21pbmcgSVBD
IG1lY2hhbmlzbXM6IFN1Y2ggYXMgcnBtc2dfSTJDIG9yCj4+PiAgIMKgIHZpcnRpby1tc2cgbWln
aHQgcmVxdWlyZSByZW1vdGVwcm9jIHN1Ym5vZGUgZGVzY3JpcHRpb25zIGluIHRoZQo+Pj4gICDC
oCBmdXR1cmUuCj4+Pgo+Pj4gSWYgdGhlIHByb3Bvc2VkIHRvcG9sb2d5IGRvZXMgbm90IGdhaW4g
Y29uc2Vuc3VzLCB3aGF0IGFib3V0IGFuCj4+PiBhbHRlcm5hdGl2ZSBhcHByb2FjaCB0aGF0IG1h
bmFnZXMgdGhlIHJlbW90ZXByb2MgVEVFIHNpbWlsYXJseSB0byBTQ01JLAo+Pj4gYnkgaW50cm9k
dWNpbmcgYSByZW1vdGVwcm9jLWJhY2tlbmQgd2l0aCB0aGUgcHJvYyBJRCBhcyBhIHBhcmFtZXRl
cj8KPj4+Cj4+Pgo+Pj4gJmZpcm13YXJlIHsKPj4+ICAgwqDCoMKgIG9wdGVlOiBvcHRlZSB7Cj4+
PiAgIMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAibGluYXJvLG9wdGVlLXR6IjsKPj4+ICAg
wqDCoMKgwqDCoMKgwqAgbWV0aG9kID0gInNtYyI7Cj4+PiAgIMKgwqDCoMKgwqDCoMKgIHNwcm9j
OiBzcHJvYyB7Cj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICI4MGE0
YzI3NS0wYTQ3LTQ5MDUtODI4NS0xNDg2YTk3NzFhMDgiOwo+Pj4gICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+Pj4gICDCoMKgwqDCoMKgwqDCoCAjc2l6ZS1j
ZWxscyA9IDwwPjsKPj4+ICAgwqDCoMKgwqDCoMKgwqAgfTsKPj4+ICAgwqDCoMKgIH07Cj4+PiB9
Owo+Pj4KPj4+IHJwcm9jMTogbTMzQDAgewo+Pj4gICDCoCBbLi4uXQo+Pj4KPj4+ICAgwqAgcmVt
b3RlcHJvYy1iYWNrZW5kID0gPCAmc3Byb2MgMD4KPj4+IH07Cj4+Pgo+Pj4KPj4+IHJwcm9jMjog
bTBAMCB7Cj4+PiAgIMKgIFsuLi5dCj4+Pgo+Pj4gICDCoCByZW1vdGVwcm9jLWJhY2tlbmQgPSA8
ICZzcHJvYyAxPgo+Pj4gfTsKPiAKPiBVc2luZyBhIHBoYW5kbGUgbGlrZSB0aGlzIG1ha2VzIGl0
IGEgYml0IG1vcmUgY2xlYW5lciBidXQgSSB3b3VsZCBkZWZlcgo+IHRvIFJvYiBzaW5jZSBoZSBo
YXMgdGhlIGZpbmFsIHNheSBoZXJlLgo+IAo+IC1TdW1pdAo+IAo+Pj4KPj4+Cj4+PiBbMV1odHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92Ni4xOC40L3NvdXJjZS9kcml2ZXJzL2Nsay9j
bGstc2NtaS5jCj4+Pgo+Pj4gVGhhbmtzLAo+Pj4gQXJuYXVkCj4+Pgo+Pj4+Cj4+Pj4gLVN1bWl0
Cj4+Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Pj4+IExpbnV4LXN0bTMyIG1haWxpbmcgbGlzdAo+Pj4gTGludXgtc3RtMzJAc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbQo+Pj4gaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29t
L21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIKPj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1z
dG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
