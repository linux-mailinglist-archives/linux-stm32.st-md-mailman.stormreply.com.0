Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBunFV+njWkK5wAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 11:11:43 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E2012C4D6
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 11:11:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A14DAC87EC9;
	Thu, 12 Feb 2026 10:11:42 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013002.outbound.protection.outlook.com [40.107.159.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A449DC87EBE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Feb 2026 10:11:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uz49qUzMaBb3is6KmpIzpTDb+GNC38ZajyHCJnGfyXXUKujolig5nU4zEeQS+CwY5xTyflQqYUrYQ3ffG3PKTjHfcPnZdKtFUWb8rtqEElYerRTdC2P00YY5Lv35OK8GHIHVf0DXSDGCZXCxUEXQNKST2QlP/TLmQX/eVqsugxK2yhEtfCxRn8mOFK6I1nCxNofuj7G1/pwDDHEqS3mOV2J+XGtRXwEBVKnWs2ihusqWNyR51mwy//pJ6tJF2Uf1fRFG/NYzB+eriMoATTpA/EONtYrKM7oCAU2Zttqu7iRA/sLp8QnILgqx2WPTAlCFgnCqQeby3TiCeYggbp0onQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/tfMQ3Fwt58NDVeCF2Ij5XIuyx/yztIZi79Cs9Gmlg=;
 b=RqWvhxdrUt0+w1Ccon/HkrIuo+u4+5TzjH5JAZFfLUgy1nN9rYFK3/bsjTGX2DGbLfWH6/2gK6S1+O2XL+1zY07WMaf9iD1VGo7R7OdhBjaV6u0FiyshtbwEriFdqp5p4dgqWsvTOn8WtmNV9Nv0cdN0uo4xywaZ2G/CkxHGY/yLixmt9aG/XO1Ts6aCN5oSOcMZRgu0LKgmroPGDJzGGugTBf+EeBwviEsom/t4nyqseb3JB+rB+F2bSKhfIpmJFOtWEsubI+u1WPhSE96QxUJpBYCxhpDr4YQEFJIbpvqbrV2B2e3SiyktyvJsyT2uAQkdkfc5JJpWq0P6q2OP9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/tfMQ3Fwt58NDVeCF2Ij5XIuyx/yztIZi79Cs9Gmlg=;
 b=MYLqSrlyf7ql49sr5KC6N5Ag+e7MuK93hga2TOCCStgSghmdVvoFEA97L6AvdWc9+uYfcmOvZGML4KWn9BOVW1ZVxzmlv7kRRlX8ffXA8K1un3v0siKGVKduixmRm+XGPC23p0/rkxnsAnjO1A+1JeM7AGWq1jm09p2AndgbCBCp7kAN68JXGULMphzQHmqLvkIk0sbEfMtmcZCkfQmL7GZo72qvSmh5kh7txHzyBZgmhgkK8okB6Bq6vz9zN5rBje2Ty0bx7deNZ30J7UpQBC8W9wI0eknRXHtJo4V05fK3i6Sf2KCX7Q2S5uMphe4NZNAfVc3IZsOdGlPAkxC/Rw==
Received: from DU2PR04CA0299.eurprd04.prod.outlook.com (2603:10a6:10:28c::34)
 by DU4PR10MB9640.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:645::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 12 Feb
 2026 10:11:38 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::17) by DU2PR04CA0299.outlook.office365.com
 (2603:10a6:10:28c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Thu,
 12 Feb 2026 10:11:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Thu, 12 Feb 2026 10:11:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:13:29 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:11:37 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 12 Feb 2026 11:10:30 +0100
MIME-Version: 1.0
Message-ID: <20260212-stm32_risab-v2-1-02ef2859b596@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF0003922D:EE_|DU4PR10MB9640:EE_
X-MS-Office365-Filtering-Correlation-Id: 1399fd32-5515-4efd-148f-08de6a1f1c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WnhGWkVyZ0Nad2oyQ254TkZUTkJCUHlqQjV3NlU1d0tuZmtlZUgxSk1JenNP?=
 =?utf-8?B?T0N0eHA4d0lyUGowL0pyYXpUSVRMOUFNRmFjS1E2YlhUekpQR1M3WlV4TW43?=
 =?utf-8?B?MzdwbUhUaytRRm5GZEYzNWJkNWo0TlpXeXVCbTlyaUhKdFlvSmV2ZlVMbXZi?=
 =?utf-8?B?bGpFdEUwdnRCWDY1TG9UVXhVTHV1VzFNdGdYODBBTm5HZzFEaUJLQWp6N3Rt?=
 =?utf-8?B?S1JORmV3UmgwdEV1cXRXNzc1c2dwbXlkRHhXUUdVczEwTTR4VWRuNTNXMHJ2?=
 =?utf-8?B?NEw0b3pVY2c2Z2kzazQ3RDRncEF5QkdZQ0tUSmlGcGU0REI2UXFrcmd2RG5F?=
 =?utf-8?B?S3ZoZ2h0VDBxckZBWHMydTJiVjJINWc3bDIwL2o0L2NqR2FmZUdaejM1OXVt?=
 =?utf-8?B?bmpuMjlGbHB3ODBwemR3YUc1V3JHQnhxWHo5aTl0VTJabU43QUtLVjdtVndL?=
 =?utf-8?B?U2paL1VsTlZzaW1CWEZGcHZ1ZG5NS0ZIRFBQTS8vek9OZFpKQ1J3eEgvRFJL?=
 =?utf-8?B?WEJPcEp6eFpSb0ZISjZ1L2xaRHFkSWY2VHMvcG8zemVEQUF2WCsrRFBpN2JB?=
 =?utf-8?B?cmZrR1dkUVRIZnJqZUlMeTdzRTdDTmxJdDlzdUdrREYvMmlHMkRmVklkU1Rs?=
 =?utf-8?B?VzA4V0hzcGNlNkxHLzB0TEJnQ1VyTno4R3A3WGpDQkJNbTZET0RHUWcvc3ZR?=
 =?utf-8?B?WmNOeThQaE5mMVFSTGl5Tm9YcS9GOWlheW5LQ2c1Rk1aR09mUDd2SzhkN0hB?=
 =?utf-8?B?Sk5rMVJ1ZHJqaUIzZnEvTkZBNXV4VEMvTEx5ZUtucytYenE4N2wzMXVBdEJr?=
 =?utf-8?B?RnJQTlFjeGVDaWdvV2U2L0xjbWxBYTEvMXNjbG0yNldLb0FwZUZjUDBPYmdC?=
 =?utf-8?B?b2R1dFVyc0lwcERqclA5SEw1RDREbkpacmRPK0IwYlc1ZEJPa3djT2dRWUl5?=
 =?utf-8?B?VnkwTFVYQmN1VENOVUpDbkhSQW1YRkg5aVl5TUw2RWdSRjVwREJLLytybXhk?=
 =?utf-8?B?M2pPb2RlRzVGZldSaURCSTBqZW9tbkFtUnprMjAzb3FqaHJlOTVieGtCcGVm?=
 =?utf-8?B?dE54bld3ZXFuYWgyVDg2eXorV1BEV2pDSkh4QmFRQ0l4SXdvdnF4SW9Ua2Y4?=
 =?utf-8?B?T0dsaVZmUm1COGhVLy9lNlVQRDk3MzhEOHVVMVVCNFA1eFdvRkpxUVI5YWZP?=
 =?utf-8?B?SkNxb0FYbFo5ZHB2cHVENWNnVXB4ZUhOK1lJaHFLWHNNVlhPaGtnT0w1Qnlv?=
 =?utf-8?B?WWFxdW4vNFMzRGwwSGN2SmNxcVl1ZjlmSFBMQ3pZUG1hYzJQN3F3bjY0VXk2?=
 =?utf-8?B?bllyVHFuekpQRG9yYjJrRzlHSkhiVXc0aTJlVW93QTJQNTZBVEsyVHhwZnhh?=
 =?utf-8?B?UWNZbGVNdUZoc1ZPTXFuM3krUngwS0FHWUlCSTZUK0E4ZXU5Q1QvOExxZnJq?=
 =?utf-8?B?NFRCU0ppM25ISXh3WERUVEZGamh1dm9haHdIaEhrOFoyeU9Bclhnekt6dlFa?=
 =?utf-8?B?ZW51TkhXcFRBRTlwMXd0S2RxbTBudGpNUmlzMy9EYXZYUlY2OWxXTCsrRnB1?=
 =?utf-8?B?VUhKUFJGTFR3a28rRFVsazljYTljazArMkVZYy81TUN5M2FMQ21ONllHeldy?=
 =?utf-8?B?QUNseURnaUVWM3p3ZDlnWU9SYytOZFBoOFRnYVBkc1Q1Q29nVHVRMkJzdHdh?=
 =?utf-8?B?clh3c1E1OFFWMU95MFJoSGR6aVNSSEx3Y0xTWWZJUFltc0VQQjJFSlZ5R1B1?=
 =?utf-8?B?TjVPNmZuVkMzOWxMaTYzRStObUYyMTNNWjhvKzdsTDhRZGxMeGlVTEhVczF4?=
 =?utf-8?B?azZxMzRjYkd2QW9yVENYOGxlcEVWRml5VXJvZkRNVjY0azQwQW9VK2E1ekdv?=
 =?utf-8?B?RnYyOFFrWjdHZXFzSlNjTGpTbVpzSFo2RDF3cDE0MjRKd3dRVUg3Tnlnbm52?=
 =?utf-8?B?MHNPeVZjMUNEWTl5R1NQRzdhV05JdGczMGVMSzAvRE03QWRrR010cDZ0UHBH?=
 =?utf-8?B?WDJTYWgxRlhqa3A3WUhVSGM2Wk1ldENISDlIT05pSE1KZVRxL21wdzRuNi9N?=
 =?utf-8?B?WStxc2YraVBZcUk3ajdwWEFEUzk5eHVic1pybDAzYUlyeThnc0RadjFSWTBJ?=
 =?utf-8?B?RTRxL1hDblJDM0JiblY3eGNxcGVBRVFPYzBRSGs3YkJPWFZ1WDJGcDlBK2JD?=
 =?utf-8?B?aVhRZmFsN1pQMnBQNit1K2E2L0ZKbk8xMlVyK1FGbjhvNU13dk5IV1ZIa2xE?=
 =?utf-8?Q?qzMG3MLffEz/c8vLJjVAI4H2B8q3TjTtakzsqbv3nY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TwYVrCCwsKgiRR2gmbfxE9TNsvjTs2NfaL/b5mkyMG6Avmkwig4eiKC3DRZN907u/WMR08t2LHjOY95XIoVm5R0Sm7EiynNsWZOMTViJsr0dP3lrYUPdbLEln6fHI9pHbL1OYae4JJAsXpba5xOh7SWdSyL/stFxpl2PJ4uGJjcVHAYXngcBZt9Fet9fMGNBFPZSirE8T3hNRz/cRg10Qjo/aHopH/OrsHAIOkWZQ9nXNRDQafCF8VkD9DZlIlT+IqPE3loIofQzxeX/JOg45mdVqbQMSkp7Oms3z8iw/58qIc20rXGepnW33/tTAX1kuwA4bp1WPR0oElwBVpww1uNIR1Qww4U3HAHSaKs9eIkZDrjzbOatrsL3LsNYUiHaYbOMyKf3QIKGoWPfM72+Hi+tYSSoUvRtIldk+tLTzxtJsigp+gwLN5G01j36H1dH
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:11:37.9586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1399fd32-5515-4efd-148f-08de6a1f1c12
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB9640
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 1/9] dt-bindings: bus: document the RISAB
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,foss.st.com:mid,devicetree.org:url,st-md-mailman.stormreply.com:rdns];
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
X-Rspamd-Queue-Id: E8E2012C4D6
X-Rspamd-Action: no action

Add documentation on the Resource ISolation peripheral unit for
Address space protection (Block-based) (RISAB) peripheral that is a
memory firewall on the stm32mp2x platforms protecting internal RAMs.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 .../bindings/bus/st,stm32mp25-risab.yaml           | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/bus/st,stm32mp25-risab.yaml b/Documentation/devicetree/bindings/bus/st,stm32mp25-risab.yaml
new file mode 100644
index 000000000000..f614f2287751
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/st,stm32mp25-risab.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/st,stm32mp25-risab.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STM32 Resource ISolation peripheral unit for Address space protection
+       (Block-based) (RISAB)
+
+maintainers:
+  - Gatien Chevallier <gatien.chevallier@foss.st.com>
+
+description:
+  The Resource Isolation Framework (RIF) is a comprehensive set of hardware
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
+      These regions cannot overlap. A region must be within st,mem-map range and
+      can be represented by one or more pages. RISAB has a 4kBytes page
+      granularity and each page can hold different access rights.
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
+    firewall@420f0000 {
+        compatible = "st,stm32mp25-risab";
+        reg = <0x420f0000 0x1000>;
+        clocks = <&rcc CK_ICN_LS_MCU>;
+        st,mem-map = <0xa000000 0x20000>;
+        st,srwiad;
+    };

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
