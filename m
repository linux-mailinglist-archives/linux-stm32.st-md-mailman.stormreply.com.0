Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPomFXz2iWmuFAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 16:00:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F29331115B3
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 16:00:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1F3AC36B3E;
	Mon,  9 Feb 2026 15:00:11 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010052.outbound.protection.outlook.com [52.101.69.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C744C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 15:00:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccUWcltyVP3L5EtfHdqFn4dParc3YST89VvMbRm7hKu8mPG6r7DdYC5CMWUOSbO85OZKZSfgBCYkrMSfi0Q4kVWt79hoi9KVqyIrYz4prB5yMgM2lZ7fFHNpsUDeiJv5lW2N186IYh3zjqOjndhzEXHDdd0QHSn5RfXKEXOI246iDqZAkt+UTNpCb/92WtzFXw9/dnHII/UZx1J3eYVA4/YOAHbymCo1A+/BjTVxWUCJvix90ayUoz1aWQrph8138EXIX8fd/1uXNqIJ4WoLo2jA8pzqh/fUfZG0cBA7uBONY5NHWCIrqAALQ9WSlEPXV1+CQecwGbtA6DS5o5iXMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6k1Z5gwxCCmc/J0l3AFH8KQOlV4Ge9Y+JOAEiL0/sE=;
 b=ds5WP0OStt908colAzQABWnf0V5NUaidiqs0QPUak7nP3/RCLnHJLyiMkWH+5QWItT4P2npCtEKWorb+5xwwccz3cBCJYAlpipjKWIRKrmIeGHZ6bjxRT901c0JeSDdHd50nym+Uw5GGHOOaJsbAmLpnJckZT4osEeSQTzAyN3wVgoarWHZHttlqYEbvqOSXLvM0knukNYyXciynd+tBUyyMW1O4Q9WkMwecJSLfDKfCzj5/qB7i5cLQyzJml5yIYFvRHX1SLYd1jOXPlU/G1Pe1b6oR2U+ndUWc9plxcSnNMyvaeaaj3Bvk8HM1e+VRhrQI7twZ+cH1IqT0zXJ2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6k1Z5gwxCCmc/J0l3AFH8KQOlV4Ge9Y+JOAEiL0/sE=;
 b=Qpi6voK7Bq65onIWBVPaB4Uy0p6YQ1IOfQoZsZsPfljiPNBeuMBkExc1huLWSuPPJ10o0XelYZoRiiofR0FNoB+Iy1RhUDwDK9FHb8UyXPoFLOKEc8joqI5JV8jFIjkV+fuZyUoqRO1iSLmKdSJ7pwdQx87XC4Dv9dk03BZIHF1SVVavUIW8Gkoc4OI+hRspd9Rn3Eqhfl4VRZ/M7/GokGdlKaQt6LeObYBq2qJ3toseMxnTDgaCOdDy9nWe4asEsEdJUJjFeKmWeeRDtE8hsgLSrrfK8fmx3s4+w2Jmp8yUu0T08QBCrcaQ/pDYJT/WPXRrQlSr4dkoaQ8Osi0U3w==
Received: from DUZPR01CA0325.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::22) by DU0PR10MB5172.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:344::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 15:00:05 +0000
Received: from DB1PEPF000509F7.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::41) by DUZPR01CA0325.outlook.office365.com
 (2603:10a6:10:4ba::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 14:59:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F7.mail.protection.outlook.com (10.167.242.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:00:04 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:01:45 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:00:03 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 9 Feb 2026 15:59:31 +0100
MIME-Version: 1.0
Message-ID: <20260209-stm32_risab-v1-1-ef0b2b6a7e0a@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
In-Reply-To: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F7:EE_|DU0PR10MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: 1510a527-58fe-4a99-ae61-08de67ebe836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MmFybjRveWhtK1c4VHFZQThzVVZHSWxBUU4yWG9EVHp5bks1bkVEYUVid2Nn?=
 =?utf-8?B?REVWejJBTUI2SnFZSHVZTHRWR3JDWk14cS9pOCtaejF3a0dBT2VvdUFsWnBI?=
 =?utf-8?B?NitLZElzNmlXNTVPTm43Snh3WlJRaXB2cm1Qck9aWnBFemhCaHZuTm5uRE9p?=
 =?utf-8?B?U0RsMmhYc1luN3RKazdUbFFoaU9MMlN6SkE2Ry9wSGFRZ081cDV0WW9HR3Zs?=
 =?utf-8?B?RTNLd3E3MHYrMS9wM0U2dmxvZU8yUzl2TzJZSklqQ0dWejJhU0JTMHNmVjRE?=
 =?utf-8?B?UzhhcFNpUmgrVjFNYVdXQ2FKQzlWb0hxUmFFcE5mVE1KMGhQYzMrclRLdGhV?=
 =?utf-8?B?empBcVZ1YnUvajVuWThSZjZrN2pmby85VW95Tk5xUHlTT0FCS0YzNDh1U1hK?=
 =?utf-8?B?ajZWUEtHVjF6c29iR0pkdVYzaWYxcTR1T3hrV1lPejNWKzdGVWF5b0FXeGk2?=
 =?utf-8?B?OVlBV2VydlpEajRNR0VHeU9lY3M0SWxMQ2VvaXJkQUltdVh1bGJLVEltandE?=
 =?utf-8?B?UlRSYVl1R3Jaa1IwaWdHc0dra0ZFemN6S3A1NWlsYjdWZzc4a2RCaDlkcDVE?=
 =?utf-8?B?NHpCd2VJS1RGV2lLM3ZYTHJqU0VNbVUvUjhPeE5iS0J5WXRuK3RneTFvU3Zl?=
 =?utf-8?B?SWtjcGIwZkpKVXRjaVBOUlNMUlhUVlFDOVhLSjh4VmZTdXd1SVNGTEtKRDEz?=
 =?utf-8?B?NU5tMmxIbk9XMDBFTzNwNjdJNjNINWw2RjREZThOREczQ1IxUm1OUUNjQmFU?=
 =?utf-8?B?SXhYM2JQN05zaDV0MFFwSkl2ZUtjQjRuVHhTOXU5anQ1MlFzV01BSXJ6eGZn?=
 =?utf-8?B?eXBFNVlQanNGbWRzNWtHbjJrN3Avc1RHTXJETDlWY3VOSUd4SGFjOURncStX?=
 =?utf-8?B?S01LQ3AxNytCYmpJc0VvOVVWS3Vxd0RkZ3NhWGYwM01RMWxwTWFOM3l0ejNu?=
 =?utf-8?B?ZVAwRExGV2lJYnpuU1BqSHFFZlRtU2pXdllWckw1ZnEyV3FLVFpuL2JjZjNr?=
 =?utf-8?B?eDVuQi9CVk00a08ySnRnYXNhOU9iWUl5VjFFYUdrWEZucklwSkFLNFpabEdO?=
 =?utf-8?B?Tnp0VFNTZXBIR0F4VGcwWU41QUlkb3gzZ29mSitJOWpxdkFnZnBFaFRScDVI?=
 =?utf-8?B?V0hnVlZRUEV4OFQ2VzNUK243RGdxMkt6K1RJeDdjVXlTd0h5ZW84cXRUbE9h?=
 =?utf-8?B?MCt2L1NIMWI1bzl0VzRRcHJPcVBkdUppZ29wemgza2dhOSt4NS9Gc3diQjRT?=
 =?utf-8?B?RkQvR0VoYmRudkQzaS80cGd2a2JKNmNXSXNzdDBkTmVMT0NBS2pRM1A2TW1r?=
 =?utf-8?B?cE1sdUYwRloyaEFIQ05CNUpnK0JZMkp1bXhtL3hSZlh6ckw2amtPNGRSSm14?=
 =?utf-8?B?MWczZFRjZU5mRzQzSk1tcWVTM3ZBbmw2a3VVUEVPcVlVTkxHNXpoWUxDU3Jl?=
 =?utf-8?B?ZjhMamRSSXdYbW51OVlSRnJ2aGluOGVxeWhvb05tcE4veHI1WCtZanVWUUZB?=
 =?utf-8?B?ZWVVZ1pmOFVPeHhyU0t5N2lMcmxCTktlRUNqNUxlRnVrSFFUQnU4V1dpb0Rt?=
 =?utf-8?B?Wk5CMGorNmRrZ1B3QWZWMWVmN2h5Rm8vMEFRUVlONTYxa0ZCbjNTREgxUWcv?=
 =?utf-8?B?ekRKQnQ5cGwyOEc1UjVvSnlnWlZxY2wyRm0wdjZxMVNZb2JVdUV0S3FVNnd6?=
 =?utf-8?B?OFB1VnVDVHpnYzZXNW9JRjlWVVVOMytTTStHbkJ2bXFNT3VSRS9nRlNhemk5?=
 =?utf-8?B?T0dhS0dMcjY2VFE5MkRSeElib2VULzhKREtjVXh3N2FHcXVuK1FsOGlvaGp0?=
 =?utf-8?B?RSt0Tjl2RnZCMXFSckgya0NFNUtyRFNVeGNObXBUb24xMWgzRjMyK3F0ZzQw?=
 =?utf-8?B?cDdiVFE2dmdyYVNlRG9idXR4MmxnVG9iWUo5MVVLU3RHQmpJbmtrREpVNC9l?=
 =?utf-8?B?KzZQRmdwZThCZjBDL2UrcDNQN2pHQmQwWW1Kbm5DUU8rZUNkVTU2R2VZSEEz?=
 =?utf-8?B?alN0MmdKblBlWWFyTWFtVlp4QnFma05iSmc1S3hGRnMxb1EzTXAvQ3VPbkM4?=
 =?utf-8?B?dHQzTGJYc1JGNy8wWDdLY2NFMEJXbjgvVjZXTUJzdU9aV2J6TVVOZnJCeFla?=
 =?utf-8?B?NmVLNENhdjJ4aGZSUERmeVAySnVQWU93MFNrekg2cU83YWY2TWU3S0JYTG9a?=
 =?utf-8?B?SGJVaUhYUlJCVFE5cXFGZXN2dHpUUmxDVTlQK0pjR1l5dGlmMnlqeGk5VHRX?=
 =?utf-8?Q?uPXiwD86Sq8T5953dLccZc+bzPiXUpNRsD7Bez8LOM=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UWkWcEtrEXoxOIliaF5rPjYFejRE5vWxSo1OBCrlyswpasDqxyJFmbdVTZMgXZQA8tpLMThlJhvI/r7aUqSbd3QCp1QhrgQMEQsOH7tU6PUoMQ2cKXf1XvMX1TdJeHhhB1Ct+F88f1iV+CJZivTJrSlVH0ysQ42hOOJnqglH4NinU/NCnePZkqTeLdCdnMS9Y/ny+EWZUhzd0WXbNhEnYvo+c/mZxHPOWtm8wdn2aczGxAUm/LDaRZ1HKFX3iFpQ5uiFJfKtt8+q0SOdhNPaH0DhfWxrGdRIZedyEy5kHwyBgbLQvwL+W9gI+pX0Jws4nWxQPI4DuW/Scj2yvFR89dn0o6fX4vuYi8C0DurtgqHKaUXO6yTGrKI0e2CoUsO699eNp9lhKGQJj95lOElJQHDMOD9+BF9SU5Uz802q4HW5/G0gSoGXT0htw2ax1Q6Z
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:00:04.2997 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1510a527-58fe-4a99-ae61-08de67ebe836
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F7.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5172
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/7] dt-bindings: soc: st: document the RISAB
 firewall peripheral
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,420f0000:email];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F29331115B3
X-Rspamd-Action: no action

Add documentation on the RISAB peripheral that is a memory firewall on
the stm32mp2x platforms.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 .../bindings/soc/st/st,stm32mp25-risab.yaml        | 74 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml b/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml
new file mode 100644
index 000000000000..d05a683c594d
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/st/st,stm32mp25-risab.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/st/st,stm32mp25-risab.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Resource isolation peripheral unit for address space protection
+       (block-based)
+
+maintainers:
+  - Gatien Chevallier <gatien.chevallier@foss.st.com>
+
+description:
+  The RIF (resource isolation framework) is a comprehensive set of hardware
+  blocks designed to enforce and manage isolation of STM32 hardware resources,
+  like memory and peripherals. The RISAB peripheral is part of the RIF and is
+  used to protect internal RAMs by applying access rights per RISAB fixed-size
+  page. Through RISAB registers, a trusted domain, or the domain to whom the
+  page configuration has been delegated, assigns memory pages to one or more
+  security domains (secure, privilege, compartment).
+
+properties:
+  compatible:
+    const: st,stm32mp25-risab
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: RISAB bus clock
+
+  memory-region:
+    minItems: 1
+    maxItems: 32
+    description:
+      Phandle to nodes describing memory regions to be configured in the RISAB
+      by the trusted domain of at least a RISAB page size.
+      These regions cannot overlap. A zone must be within st,mem-map range and
+      can be represented by one or more pages.
+
+  st,mem-map:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Memory address range covered by the RISAB.
+    items:
+      - description: Memory range base address
+      - description: Memory range size
+
+  st,srwiad:
+    description:
+      When set, the trusted domain configures the RISAB to allow secure
+      read/write data accesses to non-secure blocks and pages. Secure execute
+      remains illegal.
+    type: boolean
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - st,mem-map
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+
+    risab1: risab@420f0000 {
+        compatible = "st,stm32mp25-risab";
+        reg = <0x420f0000 0x1000>;
+        clocks = <&rcc CK_ICN_LS_MCU>;
+        st,mem-map = <0xa000000 0x20000>;
+        st,srwiad;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index e08767323763..b9a1276e94a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25092,6 +25092,11 @@ F:	Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst
 F:	Documentation/devicetree/bindings/dma/stm32/
 F:	drivers/dma/stm32/
 
+STM32 SoC FIREWALL DRIVERS
+M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/soc/st/*risa*
+
 STM32 TIMER/LPTIMER DRIVERS
 M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
 S:	Maintained

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
