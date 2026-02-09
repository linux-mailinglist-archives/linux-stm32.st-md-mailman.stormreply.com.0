Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aP8NAz4nimlKHwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 19:28:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C21138A4
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 19:28:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3670AC36B3E;
	Mon,  9 Feb 2026 18:28:13 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010006.outbound.protection.outlook.com [52.101.84.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AEEEC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 18:28:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lh85Ewx22aBl6DhuytzJm9V7y50AX4DyCR3IGOnJA5tgN54PWgLquUHW+GsUmhxXRKpiRZkFT078N26DuY8pbxmiJ/1AMhGjOtviQwsqjP8aeoeYrrCXyW/RsLkCsHKwRFrtHxEa69u1/T/3tkXp5RTM3L5tIZ/SeEnu3VAH+DO8+UEWX7MM3TsS+x7uEDjuDKqvEVfvLPtqmtOc5co3980PM4c0OxTMz+5ypNwdnIhouDiJpFowWw2n64sdrLiOFcrkM5qeV2O3jXa8QxOSg515QF+k/XonUolxnA1aqPbSdV51G29UuR+eO3VBtE4aBBuKfWKKxqghUvRSPL6yCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mjo27vN7cBFgD/2OAPatQamLLaF1lARvpPFQNmi9fk=;
 b=ySkCdt+3wFTtPoEsKSMwPicw+VmOf+3jnvkIbb1xzyADTVYTxHi0HNneyJBNAT6oci0umqmjr+lbxQhx2vXOKr8IcT5fneSU7JezARE457pcW+baA+Y2Ql7rQwuKN9mYeagt9IbIhAJ0Q1mesVEezz4U0f7yygP6kCkjYxNCwx+x+WowNnA4MR4jLLHdQQ45ZVz8GCnohFcuuOPyL9zZCQq3dgnTZ1x6+gRR3imDwWE3zUOIZ7KKysfkvshRFOC1/oBY3FoAE6UrPrAsBAvacGQ31NDuCk2jVsR5iTdXUba3gfogbfC4oLMS9ZP1nswMKcLs3gngINbGinf+Pwf2IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mjo27vN7cBFgD/2OAPatQamLLaF1lARvpPFQNmi9fk=;
 b=gi1zEAhMRPri4B+re3TWrTxW34jUTSjvqV3q36/YY7ya9jy+7zyDwtMw1U5dNtTm39vnlMUPzxEosK/b+bxFt5/HyfMqe/cdqZwOaGFgdQ+e5R52iG7BhzKlLtOzXxv2xB5Ubzm3wfJ/bes62W03FxG/Ba/iXQKsJHSCg5NsDTZfcIFQ7O5NCU1H7xf8ThZQhKdLdI+hLa3B0ny3GVB72elsWfy09OargDwa2oyVh5zp5L4STl5aBUfHBEqgWi7lA3KN15sjO7ONp8RTsyTTfL9E+mVuyrWiUOMhoNYEcKphuAotZgSDTY/UPJahsvGmPX/CdmzBjDZG3RUBNMWotQ==
Received: from CWLP123CA0013.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::25)
 by AM9PR10MB4101.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 18:28:09 +0000
Received: from AM1PEPF000252DF.eurprd07.prod.outlook.com
 (2603:10a6:401:56:cafe::66) by CWLP123CA0013.outlook.office365.com
 (2603:10a6:401:56::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 18:28:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252DF.mail.protection.outlook.com (10.167.16.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:28:08 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 19:29:43 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 19:28:01 +0100
Message-ID: <05d713dd-ec4b-4ec6-a1b7-4e6453133d8b@foss.st.com>
Date: Mon, 9 Feb 2026 19:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bjorn Andersson <andersson@kernel.org>
References: <20260204105216.3929071-1-arnaud.pouliquen@foss.st.com>
 <20260204105216.3929071-2-arnaud.pouliquen@foss.st.com>
 <4a4e50f4-9e02-4ca2-8b3f-b01caa7df35e@ti.com>
 <1a175145-d29f-426a-a163-1d185b8b0348@foss.st.com>
 <b9b478ea-cec7-4b5b-8ae9-d0574c4eb02a@ti.com>
 <25df6720-da97-4f81-9124-bdb7e9542d56@foss.st.com>
 <a62kzllm4dgqavg47utvhb6m7oswcgenvq5nhw7tutyrs436lr@vtilvllrxkfb>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <a62kzllm4dgqavg47utvhb6m7oswcgenvq5nhw7tutyrs436lr@vtilvllrxkfb>
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DF:EE_|AM9PR10MB4101:EE_
X-MS-Office365-Filtering-Correlation-Id: 97148f05-5971-4fab-8440-08de6808f970
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODJ3VTAwRmpPOGIyemZNak5aZEx6bWx0YmJVbWM1cGRBaWdBdDBhWnNnSmVD?=
 =?utf-8?B?dGxqQmQ1eTg3YmxqaXJTeks2Wms2QVVTWFIvY3FvQ2pJcXBweUdWUmswMFFl?=
 =?utf-8?B?NmkwRm92ZElqa2gySDJBam9IbjMzcjYyd202Q004MmpLSDZwVGpwQ2dFV00w?=
 =?utf-8?B?NE5LN1cxa1RnN2FFMDBhM2J0eFFzZHZBVU1rNHBCWHA4MHdDNUt1R1NNZHR4?=
 =?utf-8?B?MSs2UlIyajFNdHMyaGZnRTJvVG1HVUI5Nm9vbHhjMjJDbXdxNlZ6ZzIzVlNs?=
 =?utf-8?B?S3VSTjV5QlR6ckpxSXNmR1YrZ2FISGNyZGhleGRjaVlvL3p0ZmV2S1R4azVR?=
 =?utf-8?B?WkY5Q0ZKaU9LaWxicGtqdjZjZEZGTDY3Y2xhRk9JeG0xYjRFMTdoVXlXR2Q2?=
 =?utf-8?B?QVE1YzA3cHFsa2lVamsvL0NVRmNxWEVhRS8vMTZ2ZE9iTk1ZVjRMU245MVRR?=
 =?utf-8?B?VHVRSjhXYUhQM1ZWYU0xWGZuVjRWZ0tjcHp4eDM2dVdhV2J1VFIwTjg2Y0lo?=
 =?utf-8?B?NnRQK3o2M0Q1QzEyYloxSmhVOEV6Y1BxWThyN1M4d2xMYUx4d2tiYmk3Mkti?=
 =?utf-8?B?OXJrTWYyaEdXSjJaQm9OYWtqQXk0N1hlRUxUOVA5ZnRYSXNLOUp5UUF0Q1ov?=
 =?utf-8?B?Vm4zRHIrTCtjZ0FpcGZnc09MV3NLSk5oblI1TWtBekk1SjVWZWk5Y0ZEY3F3?=
 =?utf-8?B?allVOGp5Mm5JOXBXTUFwaEtLSFdKTlU5ZTJpSHU1TDlRWWdwUzBYbWNsSHJ3?=
 =?utf-8?B?VzI3Ry9JUzRPdG9PanBjdTJNNmxIaWVqWjRUVGs5VDcxN0QvRXAzUjdoZ1NF?=
 =?utf-8?B?cWMrbE1FYW1kLzRLQVE0TnlTcy8xOVI1WWY4L055L2hmZElVSHBVYkNOcUdZ?=
 =?utf-8?B?L2daMkpMNEtVUEQyeksxS0cvQnVkRjQ3Nng3czBXbXV5V3F6NmFxMWJIQXlZ?=
 =?utf-8?B?bVdXak1PNnN4VjdKRU9FYUI3Mjk2eUI1clJkZGtmS0MrbDNSRHcybVR0TEZW?=
 =?utf-8?B?V3UxSUFMMUg3bHZGeUlxRUtvOUt2c0dVR0pvWUU5RWF0RWZsTVRiQkxFV0lS?=
 =?utf-8?B?OHBjUGsyazhpdm95TlFGVDd0bWo0UUJmejZKbGxMYjNBZ2hIOTNVSG9MVjBl?=
 =?utf-8?B?RDU4VlY1UnhmckZMNlZhMjFDcU56M2VjYUNHNW5xZ08wNFJrK2U3ZHFreXVq?=
 =?utf-8?B?N09kbndPTndrTjEzNTFiUVZKNUZnUDhkWTVNaDdFR3V3a083bG9aakFUZ1A2?=
 =?utf-8?B?K3RTVWJEdkxvSHVNWDRYVUdUNWRPeW5VNHZRS0kxVHhZLzRyQjkwS2xtQTZS?=
 =?utf-8?B?eGNGODY1WHUvd0NtS2t5MWt1MG5xMFpMUi9KZnppa1lwMjNFNDdEd2xVWlBq?=
 =?utf-8?B?OFlCeE9JTlFhSUF1V2gzbDNpM2ZySFJ0Z1JVQ0U2ZWNTaG55TFkyM2pyZ2dj?=
 =?utf-8?B?cWN3YlMzanlQS2xLQi9IQ2t4aCtkcGtDNnJHMDdoVmRway9VaFJCdWJQeGlZ?=
 =?utf-8?B?N3ZxZlRERmNYcVdFT2JSazNEMVpSMFR1Vkt4NmZwYUdJOXdMNWZ0YTNqSVRM?=
 =?utf-8?B?WGF1TEx5WmNkR0p4Q3gzTW5maHJLb3ZWRytpeXVLb1RsdUtDME1kSG1YZ0gv?=
 =?utf-8?B?eTVXZHJOOEY1VXMwaVBNT0NiNFBsVWFFeUkvZGlNVjN0Q05DM2phNWpsOUVB?=
 =?utf-8?B?eDFxWXZNbVkxaTdxZXphUHIxS1ZYUkVuaGx6bXlnWDNnRll0YlFlMVRmNUZx?=
 =?utf-8?B?Mmk4ek9HNUh3djZvdkFhcng4TXpLVUJ5aVZrRHAxL043NkV6c2JRQ1JsVWVx?=
 =?utf-8?B?a0VkL3VHZkpjNEpqd3VtWCtTQlZaQ1pPckh3VjE2ME1vejhuR0dHemE0TS9o?=
 =?utf-8?B?eDBVTG1Ta0lMZHRWRzZrUzFBdStlbTdvd3hMK3hzQnp2WHJ4bzc4YUJHb3ZT?=
 =?utf-8?B?VG1uWXg3dzEzSm9ueXZ1eTVzMGVEcmJpRFZKWm5TTERiNkxTVXRNQjNBK3cz?=
 =?utf-8?B?UlZaZUlQVytqYW9XRlFWTnlpYTlFWngzWGM3b1NiSmtJdjV3THYwa3loUy9x?=
 =?utf-8?B?Y3VsVFRCN005bEFJZ1h3Wk9CWElHSlhpRTVMRnBIUEt6YzFmTFdWVjhGTnNQ?=
 =?utf-8?B?cGhFWDV6RlZHTHk3YnUvZ1B2UnRteGliRHFZZFdIUzNzQlZhTGZFY2NFSUZT?=
 =?utf-8?B?UFEvajMwVDRBNjE4UUVmbXVKbXFwbU43dGNHbHROekN4T0w3dUk5ZjUzNDZY?=
 =?utf-8?B?Q3ArZlpOT1RBUDNvYXcwczRubFFBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: sdT1xITQYFv+WkqNZaeqrLMBjF0DBTIx2wiEY3v4P5RvhkNoEwCMBRr/yOLBSpCQzeKgKMknDWquH0Ql7/Syt7tnNWReNinp/f0h2gWZCW4D8NB6IY4WNiC1n6DlmzVB+M1nDXAlFu2LhWAaOrHZCwdoEKZOUvDoqWdt+XO1KogtWW0PoZPaVJpnNzVGZSXmqHZLzkpJPvoRF7zR6wwpU+UnSrUHwEHccJKkkPRgDQQTJKRABIFaNfbX2e/iNCykDOpg9vEENqgEkMp+QOFStGLA02SyuMhRmKF5Syk8WttxQRFAqo+CXpjt/tSgzW6c+dqhO7UK+wSrf/KBLeUSPpW1gw6qLa+Apw49rC5eoctPayd55QFxi6gHFcUeltdmeilWj7q/R6xJwbdts9s9zmZB6jS5b1t86gUz29kpiays7L+V2DJNGaWIPWTsXN/3
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:28:08.6320 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97148f05-5971-4fab-8440-08de6808f970
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DF.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR10MB4101
Cc: linux-stm32@st-md-mailman.stormreply.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Andrew Davis <afd@ti.com>
Subject: Re: [Linux-stm32] [PATCH v3 1/2] remoteproc: core: support fixed
 device index from DT aliases
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
X-Spamd-Result: default: False [2.99 / 15.00];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mathieu.poirier@linaro.org,m:afd@ti.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A17C21138A4
X-Rspamd-Action: no action

aGVsbG8sCgpPbiAyLzkvMjYgMTY6MjMsIEJqb3JuIEFuZGVyc3NvbiB3cm90ZToKPiBPbiBNb24s
IEZlYiAwOSwgMjAyNiBhdCAxMDo1MTowN0FNICswMTAwLCBBcm5hdWQgUE9VTElRVUVOIHdyb3Rl
Ogo+PiBPbiAyLzUvMjYgMjE6MDcsIEFuZHJldyBEYXZpcyB3cm90ZToKPj4+IE9uIDIvNS8yNiAx
MTo1OCBBTSwgQXJuYXVkIFBPVUxJUVVFTiB3cm90ZToKPj4+PiBPbiAyLzQvMjYgMTU6NTcsIEFu
ZHJldyBEYXZpcyB3cm90ZToKPj4+Pj4gT24gMi80LzI2IDQ6NTIgQU0sIEFybmF1ZCBQb3VsaXF1
ZW4gd3JvdGU6Cj4gWy4uXQo+Pj4KPj4+IEl0IGJlY29tZXMgaW1tZWRpYXRlbHkgb2J2aW91cyB0
aGlzIGlzIHZhbGlkIG9ubHkgZm9yIGEgZ2l2ZW4gcGxhdGZvcm0uCj4+Pgo+Pj4gVGhlIG90aGVy
IHRoaW5nIEkgd2FudCB0byBhdm9pZCBpcyB0aGUgZXZlci1ncm93aW5nIGFsaWFzIGxpc3RzIGlu
IERULgo+Pgo+PiBGb3IgbXkgdW5kZXJzdGFuZGluZywgaXMgdGhpcyBvbmx5IHlvdXIgZXhwZWN0
YXRpb24sIG9yIGlzIGl0IGEgZ2VuZXJhbAo+PiBkaXJlY3Rpb24gcmVjb21tZW5kZWQgYnkgdGhl
IExpbnV4IG1haW50YWluZXJzPwo+Pgo+IAo+IElmIEkgcmVtZW1iZXIgY29ycmVjdGx5IEkgZGlk
IHN0YW5kIGJ5IHRoZSBpZGVhIG9mIHVzaW5nIGFsaWFzZXMgdG8gZ2V0Cj4gc3RhYmxlIG51bWJl
cmluZyBpbiAvc3lzL2NsYXNzL3JlbW90ZXByb2Mgd2hlbiB3ZSBzcG9rZSBhYm91dCBpdCBzZXZl
cmFsCj4geWVhcnMgYWdvICg2LTc/KS4gQnV0IHJlbW90ZXByb2NzIGFyZSBjb21pbmcgYW5kIGdv
aW5nLCBhbmQgYW55Cj4gaW5mb3JtYXRpb24gd2Ugd291bGQgaGF2ZSBlbmNvZGVkIGluIHRob3Nl
IG51bWJlcnMgd291bGQgaGF2ZSBiZWVuCj4gY29uZnVzaW5nLgo+IAo+IEEgYmlnIHByb2JsZW0g
aXMgdGhhdCB5b3VyIG51bWJlcmluZyBzY2hlbWUgd2lsbCBub3QgYmUgY29uc2lzdGVudCBvdmVy
Cj4gdGltZSBhbmQgYXMgc3VjaCBwcmV2ZW50IHlvdXIgY3VzdG9tZXJzIGZyb20gcmV1c2luZyB0
aGUgc2FtZSB1c2Vyc3BhY2UKPiBiZXR3ZWVuIGRpZmZlcmVudCBwbGF0Zm9ybXMuCgpQcmVjaXNl
bHkgYnkgc2V0dGluZyB0aGUgYWxpYXMgaW4gdGhlIERUIG9uIHRoZWlyIGJvYXJkLCB0aGV5IHNo
b3VsZCBiZSBhYmxlCnRvIHJldXNlIGxlZ2FjeSBhcHBsaWNhdGlvbi4gVGhlIGluZGV4IHByb3Zp
ZGVzIGFuIGFic3RyYWN0aW9uIGxheWVyLgoKPiAKPiBBbm90aGVyIG9uZSBpcyBmb3IgdGhlIGRl
dmVsb3Blciwgd2hvIG5lZWQgdG8gcmVtZW1iZXIgdGhhdCBvbiBwbGF0Zm9ybQo+IEEgdGhlIFI1
RiBpcyBpZCAyLCBidXQgb24gcGxhdGZvcm0gQiBpdCdzIGlkIDMgLSB3aGVuIHRoZXkgc2l0IGFu
ZCB3cml0ZQo+IHRoZWlyIGVjaG8gY29tbWFuZHMuCgpUaGV5IGFyZSBhbHJlYWR5IGZhY2luZyB0
aGlzIGlzc3VlIGJlY2F1c2UgdGhlIHJlbW90ZXByb2MgZGV2aWNlIG5hbWUgCnNldCBpbiBzdG0z
Ml9ycHJvY19wcm9iZSgpIGlzIGRlcml2ZWQgZnJvbSB0aGUgZGV2aWNlIHRyZWUgKERUKSBub2Rl
IApuYW1lLiBUaGlzIG1heSBhbHNvIGJlIHRydWUgZm9yIG90aGVyIHBsYXRmb3Jtcy4gQ29uc2Vx
dWVudGx5LCB0aGUgCmFwcGxpY2F0aW9uIG11c3Qga25vdyB0aGUgbmFtZSBkZWZpbmVkIGluIHRo
ZSBEVC4gSWYgdGhlIERUIG5hbWUgCmNoYW5nZXMsIHVzZXJzcGFjZSBtdXN0IGJlIHVwZGF0ZWQg
YWNjb3JkaW5nbHkuCgpBbHRlcm5hdGl2ZWx5LCB3ZSB3b3VsZCBwcm9iYWJseSBoYXZlIHRvIHVw
ZGF0ZSB0aGUgZGV2aWNlIG5hbWUgYnkgCmhhbmRsaW5nIGl0IHdpdGhpbiB0aGUgZHJpdmVyIHRv
IGJyZWFrIHRoZSBkZXBlbmRlbmN5IGJldHdlZW4gdGhlIAphcHBsaWNhdGlvbiBhbmQgdGhlIERU
LiBCdXQgaXQgd2lsbCBhbHNvIGltcGFjdCBsZWdhY3kgYXBwbGljYXRpb25zLgoKPiAKPiBSZXBs
eWluZyBvbiBwcm9wZXJseSBtYWludGFpbmVkIHJwcm9jLT5uYW1lIGhhbmRsZXMgYm90aCBvZiB0
aGVzZSBjYXNlcwo+IGZvciB5b3UuCj4gCj4+PiBDb3VsZCBiZSBkb25lIHdpdGhvdXQgaGF2aW5n
IHRvIGFkZCBhIGxpc3Qgb2YgYWxpYXNlcyB0byBldmVyeSBEVC4gSXMKPj4+IHRoZXJlIG5vIG90
aGVyIGhldXJpc3RpYyB0aGF0IHdlIGNvdWxkIHVzZSB0byBwcm9kdWNlIGFuIHN0YXRpYyBvcmRl
cmluZz8KPj4KPj4gT3RoZXIgYWx0ZXJuYXRpdmVzIEkgY2FuIHNlZSBhcmU6Cj4+IC0gdXNlIG9m
IHRoZSByZWcgcHJvcGVydHk6IHdob3VsZCBicmVhayBsZWdhY3kuCj4gCj4gVGhhdCBvYnZpb3Vz
bHkgd291bGRuJ3Qgd29yayBpZiB5b3UgcmVtb3RlcHJvYyBpcyBhIG1taW8gZGV2aWNlLgo+IAo+
PiAtIGFkZCBhIG5ldyBwcm9jIG5vZGUgcHJvcGVydHk6IHdvdWxkIGRvIHRoZSBzYW1lIHRoYW4g
dGhlCj4+ICAgIGV4aXN0aW5nIGFsaWFzLgo+IAo+IElmIHdlIGRlY2lkZSB0aGF0IGEgZ2xvYmFs
IGlkLXNjaGVtZSBpcyB0aGUgcmlnaHQgd2F5IHRvIGdvLCB0aGVuIGFsaWFzCj4gaXMgdGhlIG1l
Y2hhbmlzbSB0byBleHByZXNzIHRoYXQuIFRoZXJlJ3Mgbm8gcmVhc29uIHRvIGhhY2sgYXJvdW5k
IGl0Li4uCgpTaG91bGQgd2UgY29uc2lkZXIgdGhpcyBhcyBhIHNvbHV0aW9uIG9yIGp1c3QgYW4g
b3B0aW9uYWwgYWx0ZXJuYXRpdmU/IApJ4oCZbSBxdWl0ZSBjb25mdXNlZCBhcyB0byB3aHkgd2Ug
Y2Fubm90IHByb3Bvc2UgdGhpcyBtZWNoYW5pc20gYW5kIGFsbG93IAp1c2Vyc3BhY2UgdG8gZGVj
aWRlIHdoaWNoIGFwcHJvYWNoIHRvIHVzZS4KCj4gCj4gQnV0IEkgZG9uJ3QgdGhpbmsgaXQgaXMg
dGhlIHJpZ2h0IHNvbHV0aW9uLiBIb3cgYWJvdXQgcHJvdmlkaW5nIG91cgo+IHVzZXJzIGEgcmVm
ZXJlbmNlIHNuaXBwZXQsIGxpY2Vuc2VkIGFzIHB1YmxpYyBkb21haW4sIHRoYXQganVzdCByZXNv
bHZlcwo+IGEgcmVtb3RlcHJvYyBieSB0aGUgbmFtZSBwcm9wZXJ0eT8KCgpJZiB0aGlzIHNlcmll
cyBpcyBub3QgYWNjZXB0ZWQsIHdlIHBsYW4gdG8gaW1wbGVtZW50IGl0IGRvd25zdHJlYW0gdG8g
CmZhY2lsaXRhdGUgbGVnYWN5IGFwcGxpY2F0aW9uIHBvcnRpbmcgYmV0d2VlbiBvdXIgU1RNMzJN
UDEgYW5kIFNUTTMyTVAyIApzZXJpZXMsIHdpdGggU1QgZG9jdW1lbnRhdGlvbiB0byBleHBsYWlu
IGJvdGggYWx0ZXJuYXRpdmVzLgoKVGhhbmtzIGFuZCByZWdhcmRzLApBcm5hdWQKCj4gCj4gUmVn
YXJkcywKPiBCam9ybgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxt
YW4vbGlzdGluZm8vbGludXgtc3RtMzIK
