Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFe9IoGnjWkK5wAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 11:12:17 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B0212C52F
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 11:12:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EDCFBC87EC9;
	Thu, 12 Feb 2026 10:12:16 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013002.outbound.protection.outlook.com [52.101.72.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29176C87EBE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Feb 2026 10:12:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GBTMURvrh4QrI3k6059ze++j5/tNp7zUhq73QF9VeCsC5pu3gQR3tOpxQ+ZliSPfNqksgQTovpZCqFWeK0uANQOlpw+ZYReR5Q+jnP/clvgCdRf+wWPxLC5w0riPS7vp/6Ov9cwaSGEFnviiv/5OBqpQCK7kyK3aWPuX+Kp10xO+Zvs//c+tOGisFkfqnduP+A7x1v3+Qv+MCVVD1qOEvho10e5cy1iB5u6C2dVGwlSROHCjM6CmnyA9HdeGDEjPQtpBS7lp8NqCs/q9Hlob1J1zS2I74RXQ+MPnvr7hQ8gcRaqwlNSHV7TNaJN2f2c+3jZy+A8ZQOKBNTEONyNqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGAINNrlADYVNgji7lBhRbnW3sGNwUoyQIMZVaOiTzw=;
 b=IsLzZPrmxcv80+tYf2eLcIAeomoSovb+3D0qT3TDITlZ2rAwRzL1Xqeeq7WT80ozUTC1NtcCqpAkiBUTw6wTemzE5SC1ntvblalHSorX5PUM8xvGsXXC/L0zS80s8ZFx6LV3Bqvx2Hk4vwC1/NaDkM6r2VlHORnk7C8lrnpSkUblqMaA4hlaYmvGXuKLXd9X59jixqtZNn0RL/utPrlAzQan3MEv8/R9TqQi/5pzZe5e6pWa90/CeeGeUc/bybv+TdoogySMDHnT70fV83sNCXtbM2m9O4gn2cvyANrg9T5V+IFc7ZULoOlze+g61bTn2CpyDHl2BPglJWy3v7l0MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGAINNrlADYVNgji7lBhRbnW3sGNwUoyQIMZVaOiTzw=;
 b=joLX0AvfIG3rVPzkqccOStY/iOSSR8n5pBfxMB2qW9EGgzTodrlCluz8B9PLq1Kg8fGXPEMKQ4T3SJEFBZk26qcDViX63GrCbYFBerZTIosjzjjYBh4iGknO3rFwidHtyZEzXY0p4mCRvsQwKc7FhgX/JeVBpQIslssYO/tZDXHfVxBVrDDwwLJFgoNlUn5xEB5WDVodMixLiWmo5uT+wJs8//migViMWRFKe863ZCrCjzvI9ycpzy9mycfm+9/5oo+nF3EeTyb6PlqUv/qX0sRpCehUxuW0LxdMvrrm22zUfCdzLKc0RFmOsv28XlCqjfzt+H0T8uduPMUNzB7INQ==
Received: from AM8P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::23)
 by DB9PR10MB6690.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 10:12:12 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:21b:cafe::23) by AM8P251CA0018.outlook.office365.com
 (2603:10a6:20b:21b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Thu,
 12 Feb 2026 10:12:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 10:12:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:13:52 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:12:09 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 12 Feb 2026 11:10:33 +0100
MIME-Version: 1.0
Message-ID: <20260212-stm32_risab-v2-4-02ef2859b596@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E1:EE_|DB9PR10MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: d422aa0f-719d-4be6-0f93-08de6a1f2f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qk9QeGVuNDR1b3l2WURtUlBtTzRMc0ZMNFI1VDNVMjFKSDZLZW9ZTTNSM1dx?=
 =?utf-8?B?SXNZYndueFRVOWlqUTRIOEdNN2ZhNnlqSkdyNVBtQnBPWE9lc0lYQVlaWHl2?=
 =?utf-8?B?YkZqbmRRcnFKRkYwbzV5TExvT1ZGY1kzVmxSbmw4QysyR3k1U3E2aTU2a045?=
 =?utf-8?B?SFFqbFo0c0NiWGNJU1JSaWwzNlJCRUtxYm12M2tTUTFoMCs4NHoveXliaVBL?=
 =?utf-8?B?V0tvZFNPaURUc3kwRWw0eStMSUg3V0pDNkdMajhQU2NGaUV2STlWYkM1Y0tF?=
 =?utf-8?B?NG0vV1Q5WXZxUE5ORkRoZlFCSEk5cDNkRlYvb2JHSWlRdTlrbEVHdUd3YnBh?=
 =?utf-8?B?K1FSWElsNGY4UXdpb1ZaNmVic0FnNUFXVkxjYmxJcFZrQjVzc2lrc1dpT3R0?=
 =?utf-8?B?ZG5icTBkZTJkL2RLMXluSWVqY2pjalZKMWtzRHhIOEs2YytkUXpwK2JrM1V0?=
 =?utf-8?B?NjFyLzdrOFZrOGsySUU0MElQaUUrTlVMcVBaUkhNQmZQV1JNZm9JM2trRFFl?=
 =?utf-8?B?NGxGMTBTb0lORmc2YXNxZ1pNSVhJQ1ZsQnIySE1ldDUwblhqcEJqMTVWYnlv?=
 =?utf-8?B?T0hEKzhrQ01TdHJJM1ZlU2V6eXlpcU9pRWZRanlXamVickoxcm1SYVA4ODF3?=
 =?utf-8?B?UXdFQmRTbjJGRERuSWFyK3A4WE1wamtWdzRyaXh4dG9tZVFrU3ZLMkJyYWxL?=
 =?utf-8?B?YkJpclB3SGxWUERKbmJ6THprMHAvdDdOYjdjZ3c0c05uR05Tdk5ZeTc5dUNu?=
 =?utf-8?B?QjV0bE1NbDNoWW9oL0kvSjc5RGxDNW9rNzlDNEpFTER1QlpMQ25Mck1UVHRn?=
 =?utf-8?B?Z0RiWEg2N0R5RG5oU2R5bmhabUtnMTAvb0syYnRmbFF1Q1lsQmcydklFUW8r?=
 =?utf-8?B?Y3hJQWhIa0o0OEJOeDlXc2xBUlZRcFhFcjYwTEZvYy9vMlAwbHM1TzB4aEFt?=
 =?utf-8?B?YWZ6eDJiWXNzaUxYTVM3NTZtWDVNSEZLa1BoVkVTamVENFRpbFpyenpIODdn?=
 =?utf-8?B?Uld4eEhLQ2VmQlpHY2ZBaGpGMTJ6SVpQVUNlSUp4TWZNdEsvakhGMExyaTZY?=
 =?utf-8?B?NmUxLzdFUnpUdTM4c0VNcFdJckVpWnd2b2NKVU05TmNrdlRZSW92RXpQdlZG?=
 =?utf-8?B?MG1ZbnUvK2ZSSHl4R1hFeklkKzhaMlNmYWw3VGRKcENnc2lndFZyazFlZnhB?=
 =?utf-8?B?a3dhZnI3Ulo0ZEZnUWJ4VVh0TC9XMGJHTnExdEt5UU8xSEVLSmpnWlk3RVdI?=
 =?utf-8?B?VHppM0paQlhnUXVxSTJKK2dzQWNVVWhQbDNZZkpyKzF3UkVnMktHRG95RjFL?=
 =?utf-8?B?ZzN1QUR4RVJIQ3BGU0RHU1BudVdEZE9JYXMyWjNhLzgwOVlvYlAvcStSNkZV?=
 =?utf-8?B?aitkaTR6b0Zqd1JTTXpXZ1JDTU5oQWtQbFFqOGtKUmJINVF1VStrYW9PUW9r?=
 =?utf-8?B?T1pWVXV5SUJtZVVydU9rSTAzYzNqalhHOWJLNkpONGxncFRYWFdvTTYrWURw?=
 =?utf-8?B?NnByOGN4anlUUkdFaVVQcU5MSEIvb1poZHFNeTdNdGE5UjVUWVhmcU9kN0JQ?=
 =?utf-8?B?UDR3Q2dDUUoxVmNFUjRDRXZBdDlTT3pLVEFYc1B0UjdGMEN1OXljbkRnQjlV?=
 =?utf-8?B?YVBObHdwbVVmRTVkWU41VjM3K3ZBZkRKNUJEeWUxOXdKRGY2ZDFJbUxWUGVH?=
 =?utf-8?B?SDBYWmozUkNnL0loeDJGVjNwZnFXRzhjeC9rK3Yzb0cyUTlySEZ4OEMvSUh6?=
 =?utf-8?B?MzkwMTJ5cWR4NHJndk1wek10SUFWUkxzb2k4emRwd0tZK1liWC9SeEkxMGRu?=
 =?utf-8?B?bVJEK0V5RytqUk9tQytDMnNmRzlxYzRtbHpiNDM2UnJmdDVkcWU2SkFnbnB5?=
 =?utf-8?B?WGlxUGNrQ05naVVjR0xxMVNIVDJ6YUlHcmFzbGF6N3BnczNma1lEUVBlbnl3?=
 =?utf-8?B?U0syVVR2Wk45VjN5TEVDc1RiQVhSVGZydDNLejVlTWNJWVp3Ymd2WUl0L0JP?=
 =?utf-8?B?QmRMazdwUTdNcVJJcllEVnEwUVUvZTNkZVdBTGRrM2l6c0V1NVhZcG8yOHln?=
 =?utf-8?B?L3dWOTdic3RLNlV1NmI5blBZNXhncGVEOStieTAvZ0xMNWprQ1U1dkZvSDlP?=
 =?utf-8?B?MlZnUE9yMEszNFdXWjZidnlIVUZ0ckhvdk84bWtzZGxHeitwcnAxeWxtTisz?=
 =?utf-8?B?WDB4TGRSelYvczBSVVZDVlkxUklFQUNJczhBRlNLNTNEN3AzQ095QVprK1NH?=
 =?utf-8?B?eitNMnliOHdleFlwa0ZvTFJEWkJ3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AE1ymF8e9V6k6/ovqsS7DsitKw1mCJyAe52Dv1ydbfe+hqxLjI1XQ0NX7KSYPaVI5k/45QCyN6L31UWGnzYn0uhAx1IvzF1boqqucwqxW+Ex9ZBvbEV49DYhejZN6vVnGkx7YsbJL3hvBcckRqidIqa7RAltFsjN59ROqhV55rdY1G899eCNWI6dpTE/eSVxP3LltaHdd9AxpnKbNp1MBoIpc+flCEQtcDck90uCWt1B35YuMSuqzb6tkal/Z0dOdpdGrzdgp2FwtKwqLdrXjkBRMFzZNB6IO7BBhP1dlI4+jtV/3xmzinCo4hFH94GACIwJqgS586KUjCT7RY9XQBVcThrdXpAe0BCiVlQKCYH4x3S8r0OzC7ZFsNgvPixVJNRLjlBCqeeFByfUe+K+moNA0TAoLWQH1g7JepAL1MXFtPHOl95xAVyK0Ccaw7JT
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:12:10.0281 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d422aa0f-719d-4be6-0f93-08de6a1f2f2e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6690
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 4/9] arm64: dts: st: add RISAB1/2/3/4/5/6
 nodes to stm32mp251.dtsi
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns];
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
X-Rspamd-Queue-Id: 31B0212C52F
X-Rspamd-Action: no action

Add RISAB1/2/3/4/5/6 nodes to the stm32mp251.dtsi device tree SoC
file.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 48 ++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..b413430939a8 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1733,6 +1733,54 @@ pcie@0,0 {
 			};
 		};
 
+		risab1: firewall@420f0000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x420f0000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa000000 0x20000>;
+			status = "disabled";
+		};
+
+		risab2: firewall@42100000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42100000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa020000 0x20000>;
+			status = "disabled";
+		};
+
+		risab3: firewall@42110000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42110000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa040000 0x20000>;
+			status = "disabled";
+		};
+
+		risab4: firewall@42120000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42120000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa060000 0x20000>;
+			status = "disabled";
+		};
+
+		risab5: firewall@42130000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42130000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa080000 0x20000>;
+			status = "disabled";
+		};
+
+		risab6: firewall@42140000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42140000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa0a0000 0x20000>;
+			status = "disabled";
+		};
+
 		bsec: efuse@44000000 {
 			compatible = "st,stm32mp25-bsec";
 			reg = <0x44000000 0x1000>;

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
