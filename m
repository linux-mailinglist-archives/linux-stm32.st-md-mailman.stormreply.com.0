Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OA82CpTInWk8SAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:49:40 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 046751894F2
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:49:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B74D1C8F28E;
	Tue, 24 Feb 2026 15:49:39 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013009.outbound.protection.outlook.com [52.101.72.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55EF3C8F292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 15:49:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0Aylr48nz/mz2XGZiG7vEodnOqMdrJZyx2p2o0oh4EGfhO0XfaXSbTwc/yx+piHtfarC8yY4HH34YDrnBm72sz1/Gf1lUumWc7sWd4sfsKFnY3R2ACnNQe2k7qndc/z2Y1t9chq9WmRwD0Yb00FJWzE9kW9iDPTtNNF1g91R68fOqpKmcSa37wE+EJliP+5POhoKcSXGTxR7Cwl18p3lJXNJkpAhZ8of9/aVhMoMYWzj3gEn/wlHBQGOQlbQ/RfBsfvI8kBGPrNlfRPLja3gf4WO4dlfC1lCo0qlfCepqsU5/HAXxnpK0uzKN7dg8L0Zw7ueB809ABvKbSSsnYW1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0C1z4Kh9U5yC+A1wVAddKD8P9gjD1yb1wUmyNkEkI8M=;
 b=AOR5KgagApG69VJrQZeCc0rn8WYclyjMQhDpJVmpoz6vcbpr1BexvADwI8LDKIEFOyv6tRid6gep6pKe53RIIY722n2vM3xKlx56L+6iCOJe6RW/EbL1F6ksSyWYdVnWYDgyr/5jwoiK8+qYhoE6XR3ojo52GyH87Oy/6kelpgykI7g0jtdcyzvf4XT7uvQvHV2XDPRqUx0dMQAfQO792FHFmY8uP9xjjmtTOp4qRxOcnLeod9NslffWJl0qzjSggSwa0urIL7mI+Vf7A5VXE/WVLw/xQV8PKAy9/sjwkbEm7ZGPm7LdT1f+fAzSIgQI7mGVhfjT0Rnuxin9COB/Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0C1z4Kh9U5yC+A1wVAddKD8P9gjD1yb1wUmyNkEkI8M=;
 b=bWx/cJQzmZ53BIS7t7F5MEGacr3XfZLQWlJiOwxnUybH19KtnDDbp3lBtLNc5wT5DqF3OzevuhI5WdXq6OWfDsmL7JRlq3BiH5M4KyXW5OlZbRPCjVvUctMLSYmCb3ZnwKXF11r+egoRTvaL4PZ16LfqmGF1hZLxGajfzVZDP38g5VIs6fLCLfxPGa8/UdTwVkImM008ioMFrxE2Xn+3K6fvxQDHnfaXcRIWQ39gARe+YetzqQ53nNXv4CWDFplK0yAE4oqgjAkBtmLDc55CPYuvshXWtMUtO2x81TJ3KG+uFv9Tftn2qPyEdn9TjNigLIUldTFsnm6q/hWW5N7J4A==
Received: from AS9PR06CA0501.eurprd06.prod.outlook.com (2603:10a6:20b:49b::26)
 by GVXPR10MB8528.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:49:35 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::af) by AS9PR06CA0501.outlook.office365.com
 (2603:10a6:20b:49b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 15:49:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 15:49:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:51:50 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:49:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 24 Feb 2026 16:48:09 +0100
MIME-Version: 1.0
Message-ID: <20260224-stm32-i2c-dt-updates-v1-6-347cf6fca7d1@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|GVXPR10MB8528:EE_
X-MS-Office365-Filtering-Correlation-Id: d685a364-c76d-42e2-5e1d-08de73bc4ec2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bC9XM3pDZ3dtRXUycWlGNXg3SkhXZjlnQUFSM1VqYXc5RCtCY3JORVNDWU9K?=
 =?utf-8?B?RUlWSUpNQjkySDdDNktxaGRJWWFvRVhoREdVZWNnbW9xTURlSGcrL1hyOW9j?=
 =?utf-8?B?UmFuY21RN2pyMmRQMC80bkk4OWZKZ3RkMFIwZjFlbWtyRmdiNDFmYmxTVEFC?=
 =?utf-8?B?WllNU0xSSnNkMVNEeEwrc0hnL2tudWpya3ZqSUdJdUdnTnNZNlNMN09YaHpY?=
 =?utf-8?B?c3ZXSldzRksxQkhCVm1KQS9rSkVmMTVVUUp3MVFRRTlMeHlKSTRYRG9iK0FK?=
 =?utf-8?B?YnpJYjFjYVJaaytucmlYRlRLQzV2bXAyVi9kS2s2eUIwTnoydW53L2lUN3Mr?=
 =?utf-8?B?UHRVRmpoNDZYUzFnUnFjWUhQZzUxWmFMaHNEVU1jeEpGUnVvdkpXZDYwMlJX?=
 =?utf-8?B?UFlyN1JwMkJUWm1kZlU0cHI4aXdIQUs1ODhNYi9MTHpzeUtiYlJpaW5RdUkr?=
 =?utf-8?B?SUlHRStjcjg0ODkrZ2s4Z0dpWm54TE1CcGhsTm5Ia0N1Z0Z2Qk1vcE9JVVVC?=
 =?utf-8?B?VjBXWXVhb2M2NWx5WW8rUW5tZlRjMmlPRk5OS2xldlNoeGUzSmF3ZnBNYk5Z?=
 =?utf-8?B?VmVDQWhMb1BOTzQxSEFySzB2RUhFTXZqTVA1TytieENjbHJyUXRuamRvbVFq?=
 =?utf-8?B?eFl5b211aTJwdGdzZkJXMXFZN2JZaFVnck1hdm1ZZTJHS3lnbi9JOFQyMmJk?=
 =?utf-8?B?a1MvR2JNSklnT0U3SG13cy9rMXp3RGhsc08vRkF6WU96Y0NxZGRaYVNjQUdI?=
 =?utf-8?B?enhPOTVUc2c2SVBkM2xncU52aXNRNGRaZWpXVU0vcERnOTF3YnhTaFVTckdp?=
 =?utf-8?B?RkxKZGtreUllVmt6MFh0KzNxNnBqRGNNNmpXS1NGR2xTc1ZZZVZyL1NNZHNU?=
 =?utf-8?B?eEVUcExUYnNsU1R2ejgvbkJlZ1NLeW85SWVIZ0JDb0NvaFZ1djM1WVdOSkQ5?=
 =?utf-8?B?aDl2Vlhkb3MrTVlaWWJHNzEraFlPNVNUUjU2cmV1Qmx0d1ZjQWc0azhKWk02?=
 =?utf-8?B?ZlpXZ00xRVZwR25hdmhLU3dlWVlydVJUd05wVTBZdVVGeStkV2FhRWhZY29M?=
 =?utf-8?B?Q1J3ZlNHMlZBL1dzV1h5cHhDc2ZMdy9GNnprQ1IycWpEcEpnbFRGemFVdkNZ?=
 =?utf-8?B?TGtZRlZxUjk1T3BnQ0VLdlErRHVicFk3eVdKUTd4K2xGd3FKTnZoTkE5UHFq?=
 =?utf-8?B?RThUYTBBdHF2OW9Wclg0SWFpZVhrQXNmQXd6OVN3RCtMdDc4cFIycUFrQ29t?=
 =?utf-8?B?UVk0VnhJSStWbjVXc0xzS2RHRlRWbDVkU091UW9EaUliTU1HbGJkYWRWakpJ?=
 =?utf-8?B?R1hhemJmbU5hTEVVR2VFQ2kvRytHN3pDYXBGRnZrUmZjbHhsY0RrYjJ5SGZ3?=
 =?utf-8?B?RElWMGdyenl4bUtkcFh2NnQwa3I1Y2pNeUh3VzczYmlYSHlGbFh3U2lxaUs4?=
 =?utf-8?B?M2d0aFVwdFRPcVcxYXlSQUovNGs4SFR1ZThSUmhRUU04T1pvVENmSHN6QzQ4?=
 =?utf-8?B?SGh4d3FVRFd4NGdlNjhxUzZKdFQ3UzZQUlh6OHVwRlJhRDZzaVYzZUoxdWV2?=
 =?utf-8?B?bHdBU1dyclRQNGZiR3E3ZDlzeEtEU1dCV3gxT1p6TkRxMm5oQmZSTktuMjJ4?=
 =?utf-8?B?dU1hZUdpNzZ4d1V1S09MeEEyNURsSWlOb2tpblI0N3YzOW41a1RBS2o2dHF6?=
 =?utf-8?B?dkNtVGQvRnl4NFBrY2VnSkdFbis2R1hFWjE4dUQrNFJGRzVTdnJ4OThZN21q?=
 =?utf-8?B?Wm1XYlVCKzNVbURnUDZieFh4LzRKS1Avd3NTQlpSelZ6dDZyQ2tvOWR1NitQ?=
 =?utf-8?B?S0Jqb3VXV2FNTytGQWR0MHhzazdxTm9abzI5NzlieEtYa0JSNHJvZDdaRnBE?=
 =?utf-8?B?dTRXVFA4ckNUd2d4RVBzWW0xS28vdjEyaGdTeFdPWEFYTi8zdzZGYlR3OGZ6?=
 =?utf-8?B?T05YcDVZZTdTNi9ERk51S1I3ODNwVzI2RXUvVkR0NjNlSm43OE13RGIxVTlJ?=
 =?utf-8?B?bHVyY0RpTlhnTG00SXVyWFRUTkF2Z1lOTFJCUlZvQ2o2MFNsbjNmT05OV0hu?=
 =?utf-8?B?NTY4TlBWRmYyWjJuYXNDanFQNGRrdGJ4WnE1QzFWNXZKSThuU1RHSVBBM3B6?=
 =?utf-8?B?M2E4bUhTMzVacG92RmJjQmhLZ0hRcnpoT0VmSDlnZmpUNGJPUmQrcFdPODd3?=
 =?utf-8?B?TUEwQVE4WWFybVl1R2hiVXBZd0NrRXA2UkNlM3J4eHI5ZzZna1p6RFZFb3RO?=
 =?utf-8?B?aXZvODkxa092bEtnWW93V3F3S3RRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6z+aMErfizO6oETCjtPtiFyDBvgiLhbssvql+2g/XBHpYuTwjYoVacPaT/2SRKCYrDU5BJZxmYNtaPKJI72WQ2XJf9xxIt4mTGLuxa3BCepxUT7PEh8DjUX5HssCDbqpdg4tPckbDHr1YY1U1oKCMhDikrv5L3NHBZ1JhMY/8s3WZY6nREw//hqJeO9m8hWMyF48tEo/nhQWieddeG+1GyRwcSBNDBhXq/j76bkGWHAzYh4PHHqoB3wcAwPkU6QL6GKNgbD+nzAF75DS+V27ktiqjld0qNgP5Yd2tMuQrNlYNNTrRzTkpiyE6mDk+MgmEvKUVqdV6XVTWzjoPwwoshokmvlFJH9xJ8YrjZHfX0xQi+s+0HXfV4WIM5uEw6hZtx5i0xKG1t761V3k8grFS49n23kpKvHEWX25u0y2kGFsO3e5Qy28LSFN8PTahTIN
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:49:34.4757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d685a364-c76d-42e2-5e1d-08de73bc4ec2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8528
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 6/9] arm64: dts: st: add i2c2 pinmux nodes in
 stm32mp25-pinctrl.dtsi
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
	NEURAL_HAM(-0.00)[-0.182];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 046751894F2
X-Rspamd-Action: no action

Add a 2nd set of i2c2 pinmux nodes (i2c2_pins_b/i2c2_sleep_pins_b)
in stm32mp25-pinctrl.dtsi in order to be used on the stm32mp257f-dk

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c34cd33cd855..2f853f3fae6d 100644
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
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
