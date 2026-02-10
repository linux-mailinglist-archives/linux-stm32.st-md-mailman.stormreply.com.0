Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YkmwCpECi2kPPQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 11:04:01 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7F2119563
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 11:04:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5803BC87EC4;
	Tue, 10 Feb 2026 10:04:00 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DC554C87EC3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 10:03:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OUUglAe+ohQ5/1MhHwNDBGbldO0xvfQlKcTfRY2j+dTQuInDy7cftS52ofUz1CmJQllXFkFmdu7xzW3UZZGS7yTLoH/juqLjXRHJxuBrPsf9jCJPsqsnZxRN01ptwYKkUiX9K2Q5iHNAjP30yChB/7XVinY7AhaKjMbvJ6FDVyCNbqX0LlcAg2ojKPMcI9MSciIgvd00C59jnD5N2u6cCjIdYGDSkgGd60Z6FwC3oSgDJB+SxIM+08rrfJ7GKwxZ1Ecvdzze6lRp4ouGXBHY4uHrDAGijXF0J90wfNahBZGOj6nBARaGLi6z8l5kl5S774I14N2UagYoYLgV2rVApA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiKy/26XWsZZRFKq5+c3AmLYR6gHIqD80ID/yL/UwYY=;
 b=X+pYjYK5zgsDDz1jLhiCj0acTFxxSB+1sUBVraqaJIJr9bCZkVjT5YGPeGaTOlpXQUU6ZfadDGyZiS6HoVcfzsX1PKCvvkC8jDPKDOPkbZBvjvqrtx0DJjuX4HihDGyv1q/NI1EpzUwjEtmgPqRyMOpjcZCXBSaPi6mPcz/MRiU0Hp6Y0S/vHJBjuEzlLaEFDFpP1jTY1/MwC5pWTbncbm5ts1GXIhFagSDY9x7XGpevH5F71sfpdTXuxle4+ND+i4SSlZV2z+InQDOfflT8RQjA2aLStYXYIqbzoWieoDhzFqlJTGD9PE9vtKTOjPqGXYb78JZxbpXhsQa4Cks1AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiKy/26XWsZZRFKq5+c3AmLYR6gHIqD80ID/yL/UwYY=;
 b=bNiH+8JJpOw+c1kKCzDcP2GFYIfcjrVG8BKORPEEBRwBWQYjvdyuVs8dY9MOJYVSHnNLzy5eY9rYU0ABFYTbR/t/s/HkemI5WPDae9Ub3TRE+92ZtCq7TJCwgf7ajfL4yHp9iPq9pg7xoJwrvaH7vd0LCHxa6VLrFMilpHJclaro8iJD91HWOiJUjGbc4MnEpED0wXCnioQ1TWQq1Og8csTJTG+U3yqIVmvizdotwC6nsbZP1zeYoYs4GsfVNPLl0z7UmvGq9xddK/XssotkYOJ2X9jV5QK+MUo0hjgje5mXN356mPQjlSOkh2mcLO+Rt7iXGQ7o//w0p2hNrrXrrw==
Received: from AS9PR06CA0154.eurprd06.prod.outlook.com (2603:10a6:20b:45c::28)
 by VI1PR10MB7671.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1c1::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 10:03:53 +0000
Received: from AM2PEPF0001C70D.eurprd05.prod.outlook.com
 (2603:10a6:20b:45c:cafe::80) by AS9PR06CA0154.outlook.office365.com
 (2603:10a6:20b:45c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 10:03:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C70D.mail.protection.outlook.com (10.167.16.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 10:03:52 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:05:34 +0100
Received: from localhost (10.130.75.212) by STKDAG1NODE1.st.com
 (10.75.128.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:03:52 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Tue, 10 Feb 2026 11:03:53 +0100
Message-ID: <20260210-display-v2-0-0592bd514958@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIkCi2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNL3ZTM4oKcxEpdU0OzZKPk1JRkc2MTJaDqgqLUtMwKsEnRsbW1AN7
 g7PpZAAAA
X-Change-ID: 20260209-display-516c2cedc734
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70D:EE_|VI1PR10MB7671:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbda0c2-dbb9-4b74-5fbe-08de688bb209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2N4ZXY0ZjFacUk3bDdjbllsT2IrRkMrL1BtYjR4eFlia3FWSm1vcFo1cXNJ?=
 =?utf-8?B?L1hTNXIxMXloVFB5ZktIcjdPQkNXQ24wSk9WL3VMSVV6bTg4QldkWmI5VmU4?=
 =?utf-8?B?aVY5emxZYW40M2FUdTRmb2lrU1VDYmhLNWI5L2JZSldaRGFTMkRHN1k3TVJz?=
 =?utf-8?B?VjdtMDRlR293cjJibno0a2lZdzdpcWNUaWxjT3F2MEFCRXR0QlM4ZzNZcy9q?=
 =?utf-8?B?bm40Wnd1WDNZWnlrSE9TUFVZd3I2SHNqeVZSSEZNSnlEZUQ5QzBOSCsyLzZY?=
 =?utf-8?B?c25HOWg1MDdCWnc4NG5lSFhLZG53anJab1ZKMS8vMXg3SzArTjZTSWFIUFlT?=
 =?utf-8?B?OU5CYXA5c1FDUmhxa0lQN3VmVWpNeXdNQlBsNG9rTkF6Zlk4SzdOSnRiSmJr?=
 =?utf-8?B?ZWl3Z3NLaktSZ2duNGhBbVNZSFVSYU4xUGQwdWJudE5MQldoOTFENGc4YXFX?=
 =?utf-8?B?WG85enZ4MkNVRllwQVVncnBTMzdrS09qSFVkT3ZBNTZFdzRuSldTYU9ocGQv?=
 =?utf-8?B?YlIyVFZub0tKbTQxM25aQkx6c29TME05d1VYbzNIODJDMWNuTTA1RGwwNWpX?=
 =?utf-8?B?dTVxTVVZNGlMaTJibnhzVXNKN2hOZmRWdHVIdjVCbS9zS1RtZTVPWWNrRDZl?=
 =?utf-8?B?OStXcGJIR21CUDlQWjdVTmxnQUFoR2FiUitRcmJieXEvaEhqcG5VdUNGb1lu?=
 =?utf-8?B?Q0hkeks4WU5icTRzeE9IZkRXbXRqL29jRFp3RHFKYmZRbFkwRk5wVE1kZERU?=
 =?utf-8?B?N2YrRVlsM1lHelEvaHVzZU01SHVwcHhSRDYzSE5xMEFuZ3hxdmViWmtEQk5u?=
 =?utf-8?B?bS9LMlZsVmRJbk1GZEg0NFYrdkdQV2NCM1JiSWJQS3lDYUMyVzR1djgydXNZ?=
 =?utf-8?B?ZTJucmpSYWdlRFhObHB4VGlUR2ROTk9IK01PZFp4clVmRE1Ud0hadWFUeTlU?=
 =?utf-8?B?bjI1aC9uMERvVHRsQXpna29zMk1DN0x2RnJ4Qk55WHpDdVBXdmdCMllGdzRm?=
 =?utf-8?B?QmhISmFsY1l2c3NSOHhSTnNCVG96d1NEUWpWRWYxQ0M4aVo5QldtWkdIWVpa?=
 =?utf-8?B?T01ZWUhuY01BOUtDRmhVa3VCaGowRHc1Z1ZDaGxhZXpRSFc0Rmo3elkvdWMw?=
 =?utf-8?B?cXRTWjZUcnVRbnFiQ0lpUnloYmNDVnNuWjBocXhOTzg1ZHNJcWw4b0kxMnc0?=
 =?utf-8?B?S3BIWmVMd2FpbHlRdzhqeXYwVVRWd25LODF2Z2M2WnltdGlVR1BZd1JMR1Bi?=
 =?utf-8?B?ZllsWnZGTUxjUGVLNmM3ekF2dXBDMzBkQ3lVT0h4eWFVaUU5OEZoSGZFWkRM?=
 =?utf-8?B?eGQ0WjdhaFBWczhSenBZTkx0dE5ENkJFcjQ3cC9kSEQ3RjRRb2pObHR1cDF0?=
 =?utf-8?B?UHdNSE1oMzBaR0lCaDk0UXZPbnhzdW5jRHNLNUVVYjA3emI3d3VzbzFHSkM4?=
 =?utf-8?B?WlNhSUJUaW9zNzVjeDZ6WXJzQkxzN2tDdXdBQVFOTEtQelVaTlBtdFNkWEc5?=
 =?utf-8?B?dEZ0SFpPV1F1QUlXRzZvSTNoVnNJUHdZM0Q4WHhZejJLamV1WWdYRjJCbG4y?=
 =?utf-8?B?SndSMnRmc3RxeGF4L1pHbTFxTzc0TDBwMXMwRGRLZk5VYkd6MnJOTGJJNWt3?=
 =?utf-8?B?K2p1WmNEOE45YW9kSGhmREovT2FubEFxeWVXcUFwTTl1eXdicVRJdVY0ZExX?=
 =?utf-8?B?bUpkT0hHdDMzdWMvaUFMZlA2NEk1WHJ2KzE1U29NcXgvMHc4U3pSUkthSVkz?=
 =?utf-8?B?UURZSmp3WFovVGNqQUEyS1FDR1pFYlhsbytrUThHMWt1d0FpZlVQZlJsYVM3?=
 =?utf-8?B?NXlmN1ZvUHA0VWRUb0Yxa0ZqT1grYjdGZVU2cmY4cDNhb0x3bFREMTg4SU12?=
 =?utf-8?B?QzM3ZkZ4bVlDSmgvMXhSbVFhWHdxK1ZvS0VYN0pNR2p3cFpKeGVFN1RDdHNm?=
 =?utf-8?B?TU1kcXByRnNOR0U2akNtUVJtdXloSGl2QTdGOHc1cjhIWGJCZXpxbTdDVTBJ?=
 =?utf-8?B?czdkYUhlT0tyczZhaVN3Y3VDVllCYXNjT0Zkb2NCeGN6TzZuT0Ewbkt1QmVF?=
 =?utf-8?B?bFRHNzFEN094SjN1aVAydnYvY2ZYMjA1anB5TmtaWW9QSWJRcTZFZFdPOVRX?=
 =?utf-8?B?Y2pTSUNVckwrMVdsU3liUXRFMDRVOU55dTR1eGJyZ0w0MjliUDVHYVpHTkc3?=
 =?utf-8?B?UThpL3JDWDZFd1BpT05PbWIzYVB0NTVna3EzQXN6OGs4QzAxVS8rb0dla252?=
 =?utf-8?B?QUxoTXRmLzRiMExLSmV5NjBJSzRRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EUYVoz9d9/OMR5U4zH7FuB3Jijvqg5r9qBGeRMihBKYfVb1X7j++EdJ/3OsbX41IME9w6lp0rhx2mzAdm5+CHGe/h6IBkKFCJ3JcJFsJNVqlhBFMlqmOhJ+8dF+WXHV/VwEaqUt8k4n8VnleFoltZlwgaGE9nRocoiTdD33JHUUlrYCDqNrPR7DZ1Ltyv1v7BnCUQjISafZpMBp7aCYB6X1WZVxcgX1xEduZ94l+Ud2rOratBsIzqpa7kObTQdjS3W6RYHoPQY8ADE+9qfRIlKPH2Ev/h/NWRjkSiy24u8fHE4ngOuWgecM1DjtUvHLHxDcIUuJaiSOl/AwuYRwS6vfQ03hXTNmfIICVKywoc68hdc+fJYLVc6h3ye4bz9xZ3ki09g+TdJ0JX9+wESgzUpYduVfQZf3LdrGRSNWQuOZCWAXczTd/3iGU/HuzHNXo
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 10:03:52.9001 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbda0c2-dbb9-4b74-5fbe-08de688bb209
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70D.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7671
Cc: devicetree@vger.kernel.org, Yannick Fertre <yannick.fertre@foss.st.com>,
 linux-kernel@vger.kernel.org,
 =?utf-8?q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/9] Enable display support for
 STM32MP257F-DK and STM32MP235F-DK
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,foss.st.com:mid,stormreply.com:url,stormreply.com:email,st.com:email];
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
X-Rspamd-Queue-Id: AE7F2119563
X-Rspamd-Action: no action

This series aims to add and enable sufficient LVDS display support for
STM32MP257F-DK and STM32MP235F-DK boards.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Changes in v2:
- Added support for STM32MP235F-DK. A second series would have dependant
  to the v1 of this series due to the pinctrl.  Better send it though
  one push to reduce dependencies.
- Link to v1:
https://lore.kernel.org/r/20260205-master-v1-0-fe6399aa3aab@foss.st.com/

---
Raphael Gallais-Pou (9):
      arm64: dts: st: add i2c2 pins for stm32mp25
      arm64: dts: st: add ltdc support on stm32mp231
      arm64: dts: st: add ltdc support on stm32mp235
      arm64: dts: st: add lvds support on stm32mp235
      arm64: dts: st: add clock-cells to syscfg node on stm32mp231
      arm64: dts: st: describe power supplies for stm32mp235f-dk board
      arm64: dts: st: enable display support on stm32mp235f-dk board
      arm64: dts: st: describe power supplies for stm32mp257f-dk board
      arm64: dts: st: enable display support on stm32mp257f-dk board

 arch/arm64/boot/dts/st/stm32mp231.dtsi        |  19 +++++
 arch/arm64/boot/dts/st/stm32mp235.dtsi        |  18 ++++
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts     | 117 +++++++++++++++++++++++++
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi |  17 ++++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts     | 118 ++++++++++++++++++++++++++
 5 files changed, 289 insertions(+)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260209-display-516c2cedc734

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
