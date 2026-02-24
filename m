Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGKeIZLInWk8SAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:49:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA741894CD
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:49:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E8BCC8F28C;
	Tue, 24 Feb 2026 15:49:37 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013015.outbound.protection.outlook.com
 [40.107.162.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DED8BC8F285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 15:49:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNztXQQn0h5HXnKNvfmBEKG+SUZp3F1Tsv0xth7DDvj4+QpXl9aPRbRhaof7TBVysT3bzDSGPNYwTirxY7IOk1PK4IJKv/fBjWn73vRuoYvOJwQznKXRtFi2YIGyQaCedvT0Rz9SKCSKauef6P2mpHAcmok10EUn7z9gYLFs7f3HpysK26jGMuahzLhh5BFGwD+8hn67PJ0LXXI4Duq+G13VP6R1vXG05uYXi1+WgAGcAgkq4rY3oRsKZ3RTy9HFWTEPGXVFeXMZtN9CbsyGanxIQPdgU9qHOJofV7lAC58WMzIuj0lWOx2uYJyYgFIWZ02AEzSu9nP5iKRcliAspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3y6jtgqWHyYvfgWaaeIX27G8R67rt9fdFlpkcZio2Q=;
 b=Y04dOj96Dyl3uaPJs9p2DCuDW9GuC+g91LZvEVLe1pzhy/iBjEPXhd3cihnl2Eh17DJ/QI1ikOUZ8TxxcyC/ujX111VwV+NMHsr/2RxHwit82+4V+btRNDt8qnrF4LV07QFNrtB7ouc+8uhDNU13SU654H3Piv2srjqDkNK5nyfr/9lp/rZ3urMjVQFABPaTkzA4HAlnWvYip3p5ZvLPBysylPzcRkllrvBxudp+JOgHi1sUa3dD8PPVPcIjNEuMAYp4lMlvQB5nqbMBMH+IZAFdUE9JnQQtp50UhFc9kicBXuiv5Fn/tSF4FNnkkcTCpkox1yrZhS23iCA+haU9Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3y6jtgqWHyYvfgWaaeIX27G8R67rt9fdFlpkcZio2Q=;
 b=leCy4sK6Y8NgFExdcxjK1YBfb/QPB2O3zI2qhfy368M4RIFLFKjHvWGfpN4BggGCgc1ibZR6zrboSLdfeLSg9ctOPd15mDMVBc9ei9ZEFEZjThIKHdov7QQMZGgvTaslZZAQAim6DNhq/1kue4+YZIP3cGtwZQ3qIJctsgcBn7F6Cqm+ceJTbBt5HTJx/QpS7z1uZsIL12nyUYuIwTs5Zmo8F0zk8TMcwu2RwdSHwcfj8JbcM0B6ogcOEUrnavUjAkU1DTTJM+xr5EoP8cGzSbneZse8pBibQ6ckrO2ME7fvbH/ZmDMt7HjS/4C96HdCqNOvutkisJuW5kM8ktb1Dg==
Received: from AS9PR06CA0496.eurprd06.prod.outlook.com (2603:10a6:20b:49b::21)
 by GVXPR10MB9509.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:323::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:49:32 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:49b:cafe::8d) by AS9PR06CA0496.outlook.office365.com
 (2603:10a6:20b:49b::21) with Microsoft SMTP Server (version=TLS1_3,
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
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 15:49:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:51:48 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:49:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 24 Feb 2026 16:48:05 +0100
MIME-Version: 1.0
Message-ID: <20260224-stm32-i2c-dt-updates-v1-2-347cf6fca7d1@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF000001B5:EE_|GVXPR10MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: 631e05a3-1cbe-497f-3e56-08de73bc4d72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXRObXpsb1lMNnhXNkV0VmlYVENGKy9vYkFtZm8vSVUzbDRhSzRQQzlGaHdZ?=
 =?utf-8?B?T0NkK00yUnhtdHhNS0Z1T1hhT1RQbDJneU5tU0FuWkNFVnlLTnJraVVFUTdy?=
 =?utf-8?B?d00xWGU0QWJmSExDQ1NQdVg5bitTQklOMDUydmhCeFIyU0FvM1I2amRQcDFi?=
 =?utf-8?B?SVU2ZmJPNThib2R4NlRFcFRrWjRMQjdHQXJqTS9iN3JtM09FOUpPWGtzSm5K?=
 =?utf-8?B?QlBuSVVUTVJ1TUU2K2FnaSs3WVJJMWc1V0tXeE1zQXpkTGNCYktETytGR2Fk?=
 =?utf-8?B?Nzg1cTVnMjlzZmxkWUxoYkR3Sk1YcENTUllPVDZhb2ZBZWFhQmR0bE4zWGFp?=
 =?utf-8?B?aTkrbmczUXZBWFZFRG9GYXhvL1lrQVRJR1FyazdNNmQxWmZzUFRhMjV6ajVq?=
 =?utf-8?B?d2o1cExLdDBPOUV3VEVRL2Vaa24rQnZPWjdOaHRsL2lNRnJwZStremN1Rlho?=
 =?utf-8?B?QWprbm9QcHZaOVZ0RmNBTitSTjdVM0xhcFlTdUY5UER3dXpIa1FCUkVEY2tu?=
 =?utf-8?B?c1l2YVNMY2VWZVArdFR6cDI2Uy9lN3FkMGJPWVRLMGJRcjN6d0dicTgzejls?=
 =?utf-8?B?ZUU4emNXYVVSV0JkdDJrcThwMWVuRVJwd0dTWVR3OTN6OHJ0NTJ4eGlwRzU3?=
 =?utf-8?B?WFVtSUIrZFNKKzlxSDdlN3dMaE1MVEc5OXdsdUlhc09tNy90Z2czSFFYQTA0?=
 =?utf-8?B?RDRhVmcxTlBUK2pQODFvY0JHNzJHSmU5RWNyNTVtRy9uajZTUjQ5Z1lNYmI5?=
 =?utf-8?B?Q2RvQk1SeEU3YnRGeDdna0NwOTUzZ0syM0dzVDEwWGRPeXhydEI5Zk1YdkZD?=
 =?utf-8?B?TG1jaTliU1p4RXcxMDUzaE1IK01MeUtIc0JJaGd0NWVmd29Qd2FxOG1sb0Zt?=
 =?utf-8?B?R09uZDg1STVCRUZrU2Y4WjRpb2J4U296YTM4ZUlKOEs4eFhkRDJwRy9OV0wr?=
 =?utf-8?B?KzBVTXVKQStRVTdSRWRCUHpDemdieHp2Y3F4MnRIZXovTjdITTVGVGJIdVk2?=
 =?utf-8?B?MXFUeE5rcjI3RGZmNGRPOWc0MXl1NlpoeU0weFJRVVdEbDFKeGhsODFQOUZm?=
 =?utf-8?B?N3F4VnZBa1V0SGZQT3hBc1pXN3R4ZDdqSzBZd1VJdUhaR0hDY0RiK2tDM0Jm?=
 =?utf-8?B?ZHQvVlZ2VjI0bVJ1TTcrZ21abnFLQVNuY3JmN1V3eno5Z3BrcnQ1bDVLQno4?=
 =?utf-8?B?ZXpMYlNBUys0V1dHRncvNE55VWVOZHdiNmlZRER4cDZuV3RJdFU2enJxZy9l?=
 =?utf-8?B?cVdPWC9qNHRYMWF1Y29BTHlRTmVQSnQyR05BMFFzSFMyM0xIZEwrbERJRHJY?=
 =?utf-8?B?NDdGdm1SbEZ4S0h3NzRITllONFREYTk3alpxZ0VJMngxY1lCajNuMnc5VHBw?=
 =?utf-8?B?bVQ0Vno0TUpIcXZicFJKMnBuT2p1MmZkby93bFpmMExWNXA5VXE2Z2Zzb2tp?=
 =?utf-8?B?Yi9qZmVHenEzcGF1c0wzWndLa1BYbGhlMGt6eTJMUWRKQ0Rqa1lPUVNsc1Vz?=
 =?utf-8?B?ZUJSekVHV2ltdzVYc296cFBYRkd2VFdXNnlLcE90REljVjhBdm5RaWRPa0xk?=
 =?utf-8?B?UHpZM1NtQ1ZhcGFSektXQzQ4aGhvOWp6c1JGd0lVQUp1RTdnRk0zemRoR2tB?=
 =?utf-8?B?aktsUFd3YmRyczhoQzlUZCtCdllsc2hIVzRTVHprTmNKNmNsenNvTU9xdXJN?=
 =?utf-8?B?WlBIbmR5NGhnd0VjeVBjRWVOWE85eVRseUFpMlZjR0tLejI2d3VIaS83ZjJZ?=
 =?utf-8?B?d2l1OGwrUGtwK0hNRTBsOWRib2VzYnFmOFZjQWsvMHhBZDgwcW9jcUpPRXBa?=
 =?utf-8?B?Wk15bmNaWC9McVBaVUFJU1JqTngvdXhUOTBTbkNKUElVTWd6UnVDK2xoUFBp?=
 =?utf-8?B?UXg5RzZYY2pPS1FkajhwQTdWcGtuYks5cUEwM1dFZE1NRUdsQ3Jyelo3VkdI?=
 =?utf-8?B?QWZXWkJSYzZYMVduV1NuL3F0aHJ1eTkyNWd1SmtXMWVORmNaSnNzbE5UYXdZ?=
 =?utf-8?B?MkxtQlFOeWRyQU1CVCthMVVPdzhybXBaY1hUeWpYQUNMdUJ3RHpDdjJLMWNz?=
 =?utf-8?B?YW4yKzhPMERiditnNmljYzZZYkZ1OFpSMzIycHBwQURiODBpcnJWeDVXZ004?=
 =?utf-8?B?SnBkQlFtc2JWK1ZuSnNPRXVHYnpFenFrSkhjdDJPaWgrN0JBeWZRaGFmNDRu?=
 =?utf-8?B?cm5QZWFtTGxsdE5JSnN2UlgzZHB2Wk16SkVkMDBWSVhkNmlHUCs5L0tieG4r?=
 =?utf-8?B?dFZ2TG82VlFEZ3ZEYUEwa1BBVkpRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wDFpgOkmGKM1NdFa/CdcQvjZKxDlFQdXxlLCc/57KBURGJBUACC5eDXdTRbIECCvh0ZHynZHzv9Qzmh+8eKUIRs2McCWbRdfez7ELDGRUGm9wFZUCaeriMnh7SlolOYkB0PcyfFY3uEHCFoMWps86JShCHZfSpPfYfrXoa9CuggknGmE0A3GNC+N+hGrIATFML0XqfwIRMzhQugmHRJlUpMjbRx2QTpdGaiqm331INC4PFZF8HsKjsUCvV6fSopWgus79nSbFEDggl6Xs4NSvwuURsa4auU3m9OyousrDx56zYUztT4pyLX1WcX0pdjY0IW5aEfbXikgNR9Q/N4e7hpcHW9hbvT3O0+058l9XKTxFTSlNXGjzMxW/O7sC9Xgivz7zX/Vt2oKgXBpCX40UgEtJdnkgFXHveI9/m/ebsIUPLBpDLWTYU2LBIwbKG4j
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:49:32.2700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 631e05a3-1cbe-497f-3e56-08de73bc4d72
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB9509
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 2/9] ARM: dts: stm32: update i2c nodes
 interrupt/wakeup-source in stm32mp131
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_PROHIBIT(0.00)[2.98.140.200:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.188];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CBA741894CD
X-Rspamd-Action: no action

Update all i2c nodes with the following properties:
  - replace interrupts with interrupts-extended and rely on exti
  - add the wakeup-source property

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index b9657ff91c23..eacc48cc0fa9 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -469,8 +469,8 @@ i2c1: i2c@40012000 {
 			compatible = "st,stm32mp13-i2c";
 			reg = <0x40012000 0x400>;
 			interrupt-names = "event", "error";
-			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts-extended = <&exti 21 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc I2C1_K>;
 			resets = <&rcc I2C1_R>;
 			#address-cells = <1>;
@@ -478,6 +478,7 @@ i2c1: i2c@40012000 {
 			dmas = <&dmamux1 33 0x400 0x1>,
 			       <&dmamux1 34 0x400 0x1>;
 			dma-names = "rx", "tx";
+			wakeup-source;
 			st,syscfg-fmp = <&syscfg 0x4 0x1>;
 			i2c-analog-filter;
 			status = "disabled";
@@ -487,8 +488,8 @@ i2c2: i2c@40013000 {
 			compatible = "st,stm32mp13-i2c";
 			reg = <0x40013000 0x400>;
 			interrupt-names = "event", "error";
-			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts-extended = <&exti 22 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&rcc I2C2_K>;
 			resets = <&rcc I2C2_R>;
 			#address-cells = <1>;
@@ -497,6 +498,7 @@ i2c2: i2c@40013000 {
 			       <&dmamux1 36 0x400 0x1>;
 			dma-names = "rx", "tx";
 			st,syscfg-fmp = <&syscfg 0x4 0x2>;
+			wakeup-source;
 			i2c-analog-filter;
 			status = "disabled";
 		};
@@ -1195,8 +1197,8 @@ i2c3: i2c@4c004000 {
 				compatible = "st,stm32mp13-i2c";
 				reg = <0x4c004000 0x400>;
 				interrupt-names = "event", "error";
-				interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti 23 IRQ_TYPE_LEVEL_HIGH>,
+						      <&intc GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc I2C3_K>;
 				resets = <&rcc I2C3_R>;
 				#address-cells = <1>;
@@ -1205,6 +1207,7 @@ i2c3: i2c@4c004000 {
 				       <&dmamux1 74 0x400 0x1>;
 				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x4>;
+				wakeup-source;
 				i2c-analog-filter;
 				access-controllers = <&etzpc 20>;
 				status = "disabled";
@@ -1214,8 +1217,8 @@ i2c4: i2c@4c005000 {
 				compatible = "st,stm32mp13-i2c";
 				reg = <0x4c005000 0x400>;
 				interrupt-names = "event", "error";
-				interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti 24 IRQ_TYPE_LEVEL_HIGH>,
+						      <&intc GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc I2C4_K>;
 				resets = <&rcc I2C4_R>;
 				#address-cells = <1>;
@@ -1224,6 +1227,7 @@ i2c4: i2c@4c005000 {
 				       <&dmamux1 76 0x400 0x1>;
 				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x8>;
+				wakeup-source;
 				i2c-analog-filter;
 				access-controllers = <&etzpc 21>;
 				status = "disabled";
@@ -1233,8 +1237,8 @@ i2c5: i2c@4c006000 {
 				compatible = "st,stm32mp13-i2c";
 				reg = <0x4c006000 0x400>;
 				interrupt-names = "event", "error";
-				interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti 25 IRQ_TYPE_LEVEL_HIGH>,
+						      <&intc GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc I2C5_K>;
 				resets = <&rcc I2C5_R>;
 				#address-cells = <1>;
@@ -1243,6 +1247,7 @@ i2c5: i2c@4c006000 {
 				       <&dmamux1 116 0x400 0x1>;
 				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x10>;
+				wakeup-source;
 				i2c-analog-filter;
 				access-controllers = <&etzpc 22>;
 				status = "disabled";

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
