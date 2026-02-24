Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO80EpPInWk8SAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:49:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4C1894E4
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:49:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 74B4DC8F296;
	Tue, 24 Feb 2026 15:49:38 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013051.outbound.protection.outlook.com
 [40.107.162.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E01BDC8F292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 15:49:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=djKPQL1ngH2V4UOlGDOt4M/weiCPcZffDc4VgOQ+HZMgzszoTQ7PFpSFSOSfYjZr9uz71pOOfWfQwiynMWyCwK9fg6skx6WGqo5/tV7XXcivZ9XRiETU0Cq9O+jk40atpJag8mgpueZKo0Q4GT1w155LvZqFAhseaa/InbjUGNVBSJNLT3L1Lmw/8M2v200nzkoU/prlddVBLr31iM+5mbzaohd3BIEmN9S7nmLbSj301Mzs1xm1HgZc/9TIwm73UqOXA7LXilyAWKBIm0psmwQEPwA18CIVx1uYLe7587ldqtlNbvvCBEFdTLr+Vv3BfohraXPzhVN0Rff5WLUiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFmHGseMTFPud2Q049GMJOcymJHefrhDDZB1AyAyZh8=;
 b=E8dLjWrM0t6V4cJw28vNrmC3L4BF9iJrI04rA9UhE6VJzGwfwgwIGHKOt7+XUHBWApl/fDspHaB+cK6yxk+hANMV48DUEI5OQc6YZTN///mx0UBWAlRCwpsCpcXIqiq7jODzjvI0MVKCdtFnq5Q/ylh/aCzD+NiTjZKtHXcl8J+QN4Zjs4YnbLeuAOpRWy1+0OgXK1wTanzpSkB/9lPFVlSsKK7ZyeEiun1yyymUt+viBZ+RXFNImSVRrewYY2nrvQHpie7bQT2Sq8ofn5r9OIdeFeQj/xPKdH+pnyUHD4iPS/QChJCMsXnEtHYInmHpkAHdD0W/kDKHRYMUiVvinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFmHGseMTFPud2Q049GMJOcymJHefrhDDZB1AyAyZh8=;
 b=NeBpKK0zJH11Imh0RXar+PUyhTNaLQJHJLskiNidYRhzokZ5sQWtNezBKc9lodAGsExJjIVIz4EV4ARDQ41cHB0DOfsgE1U9I4vwa+4vLlnB56zWLCPf2hJP8YirY0EQ3IvZ8kD9/HMWToUnFzcnF2khWomFt35PdQtAf6C3pyaf3UFoxvtotYCHTVNNAiI1s1P5DAHrk2FTIQN73iRJNxqTUycgbbt5GxOUMAmbQ2e9W5Eu65pJTg5esx3fayVRFiwOKOZON+NkMOYyAu3C7gabXRdDfZGzdEovIs4b6VZSLHlMNGvU0Y+yeM4ncTCngpH/3a5wagSXvHQa/npyIw==
Received: from DUZPR01CA0346.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::29) by VE1PR10MB3950.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:162::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:49:32 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::80) by DUZPR01CA0346.outlook.office365.com
 (2603:10a6:10:4b8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 15:49:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 15:49:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:51:38 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:49:30 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 24 Feb 2026 16:48:04 +0100
MIME-Version: 1.0
Message-ID: <20260224-stm32-i2c-dt-updates-v1-1-347cf6fca7d1@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885A:EE_|VE1PR10MB3950:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e38e02c-3dd5-489b-fd0c-08de73bc4d14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzFLaEdrcnBGOGtkbnZrZ3BpQloyYlY0UDJqcGRtbzJQZkVHTVl6eGQwb09Y?=
 =?utf-8?B?cjBhVmM2TzZwc2hidEpwY1hJdmcrK3QzUi9HdUxEVjA2bXNwdm5mSnJlSXp3?=
 =?utf-8?B?V3BLM05SUk93Ni9kREgwclpsYXpCclhjSEN6Y2JlaURLbWxzdTdscDV3TFV2?=
 =?utf-8?B?dDhyNEh6dE13c0Y0NGdLd3U5cWd3YzlOa21XK210SWtYekRJcnVQMDNxT1ZL?=
 =?utf-8?B?NEM5OU5XSHZEKzhQQ2ovY3N6RUxMK2NUT0ZPTEsrZEFLU012VzhCWlMvV2wz?=
 =?utf-8?B?NmR4bktzbW90NldBSytLa1Jydnp4ZHJRV2o5T09NQk14N3ZXWkZwazN1M0M1?=
 =?utf-8?B?VlRzWWMveElseW40SVZhTjJOcCtPN2lUTjJjY3FTc3Z5YjZGZTExZmQ0clVT?=
 =?utf-8?B?TXpiRUFDL3FKb0RndTdYenp0My80L2VWSEc4V2t6aFc0OUVGSDA2UklaQ2Fh?=
 =?utf-8?B?cEVKWEQ0OGVlUmtxNzR3RTczWGorcXoyeWZLUkJSSnFLTDhvOVVjbTBZbjhj?=
 =?utf-8?B?VTR6WEpFSlFKQnNmOExHRFdld2NKV1UvV3JnVmQ2cjVVYjIrR3VNdkhHUjFx?=
 =?utf-8?B?TUNzcHY3VjZTZFdlajhDSXBSbU5ZcDlPRzIzUm1pYVo4bnVkSzg2WEJibUg3?=
 =?utf-8?B?S2lHZkxkbVE5eTBhOFkrSDRYQnA4UW1CNDhXcnh6aXJtcTVyZ2JCak02ekds?=
 =?utf-8?B?eG1sc1Q5cXZ4WFRzd2gyZDFIVE8vWGJOQlhLU3Y1QkU4SkJzb0pNc2k2Y0FP?=
 =?utf-8?B?Y0s0ZXRNNTd1QTJiYkRNdEt2Yk9tRklHZ1VTYUNmL1BscXdkRlFNeGdscmt3?=
 =?utf-8?B?TWtnSW1oUiszQk5GTnl0NER1NklCVjJYRXBRRDhtYW9NQStnMEhNSk9YUk5r?=
 =?utf-8?B?dGU5RTQ3Qkl2QjRrakdlQmhGZ3B0YXJvSGlNNkloRzFUZ3lRalRERmRWSE1L?=
 =?utf-8?B?OEtGZFJraS9LWGUweXNBWTA0UmdIR0pNVlQ2c1U4cTNjT0NnMWJVQXJRc3JP?=
 =?utf-8?B?RVBQRkVlQ2VMVStFaUZlVGF2K25VNU9iVXJwZFArc1pLOWhTNEw3d0haK3NB?=
 =?utf-8?B?SGN1a2FzUXdqcGNMcXlhYkc5TzNvUTJwdFMxNmZOdVpSZjJnSGxtU29lYnVm?=
 =?utf-8?B?aVhtenREakw5c3RkeFBhOThCYVVlam5WcU9DbTE5dTNwRG9LTHkyc1ExazZ1?=
 =?utf-8?B?V0RmVFFWbVpkaFhhQnVCODA1QTVvOVQyeS90eFNDUGJwOGQ1RVNhR3JqTWxF?=
 =?utf-8?B?UjVacCsvRDVMRlpIVHZyWDZTRVIxUEVpZjNtb3dtdk9aM0hTQWdqTXplMWU1?=
 =?utf-8?B?OVhuRk9xZS8rSU5PYnNydjFzVStUVHB1UTRFM1RNTjdvek5KYnptMWVtanp6?=
 =?utf-8?B?MGd6Q3V0T2h0cDUzNGptay90NmxRK0FQWElWbTFYNTN2b0c3UEswNjJKVDF0?=
 =?utf-8?B?ODIrRHBwejc0S1N3VC83bkI0SDlwaUdGeHZxYm5sVGtCZjhyNDZraFNJcVM1?=
 =?utf-8?B?d0U3NlZlZGx4QXNiRTVHUjFvYjhoV3MyVVJtU2dEb1R3K2ZRMVNaZWVOY1p4?=
 =?utf-8?B?UkNDOWxINDFtbUNEOXlyWkRvOEJnUmJjRDNtMTU3QisyZkFVU01tdFFSOFhl?=
 =?utf-8?B?dlgxWDc0OEFodVJBTFRwYy9CMnphV0Q1UUJzQXVXblZlZ0R3WUJWOXNNZkFL?=
 =?utf-8?B?bmZEdVFncDZvK3AwV3Iram5RLzE1elZUaVN4TW1YWGdDUzUyUnNmZ1Ara0pr?=
 =?utf-8?B?MExIN2dDRWVlQldUdFVCekl5SVFQZk9xblUzUjlpRUd0bHhYME1PbkpqT3JR?=
 =?utf-8?B?UXF2OFpQdGR1WFNvd2EwdEl6R1V2Q2kvWWVMQU0xYkM1QzRhUEE5UlUzc01t?=
 =?utf-8?B?Q2orQWloL0RZNzdZM0dzMWtvK2lrTVpOdHBzYzlDc2VWS0ZheHBEeWgwdFFq?=
 =?utf-8?B?RWtJTVI5endhVncwOVAyK1FtTXRJdS94MVFQNmJDS2lFb0hTUmlzY3VUNmt0?=
 =?utf-8?B?bnNpWjZuUDlhZzExSVh4RVpkaVlmTUVsYnA4VWt5ZmtvNzVtVG9DYkZhdUVS?=
 =?utf-8?B?elZiTXFVbHowK0ZheXgzMUtra0VPajUwTkZnVVoySTFLRCtkTlNQN1FBd051?=
 =?utf-8?B?bGR1MTN3YnJ4NnlycFI5NW1MOHFPSEhhUDM3WENzVFE4Rlg5K0NGOG5aMSsz?=
 =?utf-8?B?RjN2YW9zcTdja2FsQUFhVkkrY1FpRzJ3ZXpmRjhUVGR2YzZndDBQU0J1SXY3?=
 =?utf-8?B?YXBDYU5ZdHdPYU5LQnpIRHp4Y1hBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BqEqAy+tkLMcrIsIcBTFUQg9zFoVcAxCWX5g0nlcLNGlF/UrafkSh160h01HEkO9gnP7YuhwsS2Y9A0qeHtLrXm0Te6k371Zi2bjbTumRAjrSk5MDBkHmYff6WolDLX71eFeQFbp1MKW0crA/vW3BvrHRaRYWPhQCDF2yImRw8nHLRHfIy5b6isIp/HvGWMuNpiNsGUzAJIsv4a4mGBHxWmSASSN09ZrNhmfWz+r+GQKb3+Q8KX4MUp12jgCv8XCQ9n0puH6GENUQcqJ1WJRYWRTZaeG2vzB+p1c89MJmTuab+f0O15u7MeCDLQqCiJsc/frQIXK0ry4aPSbPxMX8q9vOINk0sqxl6wHKadRZ1qcamFpo27BfXrnAf58Z/2EHTpoXAdmeal8R8sSSfv7yXM2q3IX4gvG+7SNsuiTVWVaMXBEC53Oh6BH1jnKtGs+
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:49:31.6271 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e38e02c-3dd5-489b-fd0c-08de73bc4d14
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3950
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/9] ARM: dts: stm32: update i2c nodes
 interrupt/dma in stm32mp151
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,2.98.144.176:email];
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
	NEURAL_HAM(-0.00)[-0.189];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B1B4C1894E4
X-Rspamd-Action: no action

Update all i2c nodes with the following properties:
  - replace interrupts with interrupts-extended and rely on exti
  - add dma properties

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 42 +++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index b1b568dfd126..5dae9145ef93 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -867,12 +867,15 @@ i2c1: i2c@40012000 {
 				compatible = "st,stm32mp15-i2c";
 				reg = <0x40012000 0x400>;
 				interrupt-names = "event", "error";
-				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti 21 IRQ_TYPE_LEVEL_HIGH>,
+						      <&intc GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc I2C1_K>;
 				resets = <&rcc I2C1_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux1 33 0x400 0x1>,
+				       <&dmamux1 34 0x400 0x1>;
+				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x1>;
 				wakeup-source;
 				i2c-analog-filter;
@@ -884,12 +887,15 @@ i2c2: i2c@40013000 {
 				compatible = "st,stm32mp15-i2c";
 				reg = <0x40013000 0x400>;
 				interrupt-names = "event", "error";
-				interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti 22 IRQ_TYPE_LEVEL_HIGH>,
+						      <&intc GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc I2C2_K>;
 				resets = <&rcc I2C2_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux1 35 0x400 0x1>,
+				       <&dmamux1 36 0x400 0x1>;
+				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x2>;
 				wakeup-source;
 				i2c-analog-filter;
@@ -901,12 +907,15 @@ i2c3: i2c@40014000 {
 				compatible = "st,stm32mp15-i2c";
 				reg = <0x40014000 0x400>;
 				interrupt-names = "event", "error";
-				interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti 23 IRQ_TYPE_LEVEL_HIGH>,
+						      <&intc GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc I2C3_K>;
 				resets = <&rcc I2C3_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux1 73 0x400 0x1>,
+				       <&dmamux1 74 0x400 0x1>;
+				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x4>;
 				wakeup-source;
 				i2c-analog-filter;
@@ -918,12 +927,15 @@ i2c5: i2c@40015000 {
 				compatible = "st,stm32mp15-i2c";
 				reg = <0x40015000 0x400>;
 				interrupt-names = "event", "error";
-				interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti 25 IRQ_TYPE_LEVEL_HIGH>,
+						      <&intc GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc I2C5_K>;
 				resets = <&rcc I2C5_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&dmamux1 115 0x400 0x1>,
+				       <&dmamux1 116 0x400 0x1>;
+				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x10>;
 				wakeup-source;
 				i2c-analog-filter;
@@ -1829,12 +1841,15 @@ i2c4: i2c@5c002000 {
 				compatible = "st,stm32mp15-i2c";
 				reg = <0x5c002000 0x400>;
 				interrupt-names = "event", "error";
-				interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti 24 IRQ_TYPE_LEVEL_HIGH>,
+						      <&intc GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc I2C4_K>;
 				resets = <&rcc I2C4_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&mdma1 36 0x0 0x40008 0x0 0x0>,
+				       <&mdma1 37 0x0 0x40002 0x0 0x0>;
+				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x8>;
 				wakeup-source;
 				i2c-analog-filter;
@@ -1846,12 +1861,15 @@ i2c6: i2c@5c009000 {
 				compatible = "st,stm32mp15-i2c";
 				reg = <0x5c009000 0x400>;
 				interrupt-names = "event", "error";
-				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
-					     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti 54 IRQ_TYPE_LEVEL_HIGH>,
+						      <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc I2C6_K>;
 				resets = <&rcc I2C6_R>;
 				#address-cells = <1>;
 				#size-cells = <0>;
+				dmas = <&mdma1 38 0x0 0x40008 0x0 0x0>,
+				       <&mdma1 39 0x0 0x40002 0x0 0x0>;
+				dma-names = "rx", "tx";
 				st,syscfg-fmp = <&syscfg 0x4 0x20>;
 				wakeup-source;
 				i2c-analog-filter;

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
