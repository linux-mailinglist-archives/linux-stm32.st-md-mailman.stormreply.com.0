Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPItO5f2iWmuFAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 16:00:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8621115EC
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Feb 2026 16:00:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F03F5C36B3E;
	Mon,  9 Feb 2026 15:00:33 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A472C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Feb 2026 15:00:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=maqQ/S8lwBL+RuZreFkmaO2CHdb6DkRtCu8kGz4gEsQZ2X3anhK+PBn5gvU+GDxShqOx4mnIrX3tV4tz76V7hPzPwOkQuiAVDjIMSL7UfWg08BRcY/hGGhDaAJ+Fdf3mCLSh8L3Mn2GEomAXlNJV4ffE+k0rcNRFdcr653SZks4J913D7ziY0XNUsueWBPvRXqwUOpMcy5tTJaO7MU+Vxwv0e8h9AUcmUxmBK4OyJ11adwpejTNWF++Herb8SuqSAf78FtW32znRgcUfK4+C/9Ag1xIxlxot3x2rgQzRrQv7ZXwwAsnIb/iuxfRkT9/+oMsXQ72p/SndA+sYFAN6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvhUcXWeBocTPg5PLVy3L0DwVIR79cQ7KpM7A/iVYdk=;
 b=mfM+Hnu6tiqaQG0cryssgq+3KCL518VA6VtNqc4Jq8okHOwjOue0JlZqffKro6nXuR+tE4t4yce62ZIAz7bofq3dTQ5XM+E8OlvFsJQaIYmd0Emhjoc4hJYGibvIjadoyvANPAEfn3aGJabOaPzsqSqlpRGAdUp9WG4LovJWP2cpDpkwJGA7EV+TuqZeDYKuZEMJcqgBFLGE83duMDSWl/SGjx67pcb1M4k7Tdc51PaewjbnVAaA2ce/2ayCrhMXbaTmh/bWRqESqazK10btc1RhxiLFbH+Hg9Kj64Vn51v8XVJF7URsi/k0ngARw9ItD0umLll7YGkUC+0GfQO2EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvhUcXWeBocTPg5PLVy3L0DwVIR79cQ7KpM7A/iVYdk=;
 b=TjWJaUCg2pEXQ54qcArmX0MgNPegXqmw5BnH9YrLKU0pTCtJiROPJJ7Ouz+H4EBHVBm26LQX0qaj6ubhl3ySTkWfVT0NwbOs4nagngwWTLeZzGGRHgTRR16cADQ6kHZoxgjWPbSaFWpziTv1ZTcdD9J79QOT56l6x5gXJZsU+cAkFSyFceQ/1JHlYcbCgtDBHy6Uid5RfJIXXRvBLibK6KrrScvZ7YD5LVS28zK4EUoUlnqUm722cNiaycyHGlzGLz7T/be06aFgvVwIiQgU4A1t6QE1a7BmZoMRSi3tEjotISQVmt5FlcBovpqqd20L4r1486x9mllI9Bf5iABzAQ==
Received: from AM0PR02CA0141.eurprd02.prod.outlook.com (2603:10a6:20b:28d::8)
 by AS2PR10MB7369.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:607::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 15:00:27 +0000
Received: from AMS1EPF00000045.eurprd04.prod.outlook.com
 (2603:10a6:20b:28d:cafe::e6) by AM0PR02CA0141.outlook.office365.com
 (2603:10a6:20b:28d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Mon,
 9 Feb 2026 14:59:46 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS1EPF00000045.mail.protection.outlook.com (10.167.16.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 15:00:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:02:15 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 9 Feb
 2026 16:00:25 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Mon, 9 Feb 2026 15:59:33 +0100
MIME-Version: 1.0
Message-ID: <20260209-stm32_risab-v1-3-ef0b2b6a7e0a@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS1EPF00000045:EE_|AS2PR10MB7369:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d7a166-dcff-4f79-dfdc-08de67ebf5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a01sSFBGdTg1dDR5WmhNdHhrMDFtTTJUOS9DRUhFb3R0ZDVaS1NJaitJZ0hh?=
 =?utf-8?B?U3lWVGVUQXRYM1pmT1FrNC9wSDdQYjlOV05JTlBweW83YWtObGtiVWcwaTE4?=
 =?utf-8?B?b1VGUXNDNGJyWlBwZ3hyU2ZDa0pwYllBRnNzZjkzZ3ZxZmcwWkltOGNKUlZR?=
 =?utf-8?B?UE9PeStFMWtOMGsxNFg0UTJ2OTBTeEZFVUdIc29oTmNHZThxRjU5bjBQc3RN?=
 =?utf-8?B?Y0RzMlpNWmJmdExWVldjRVVmdTBvR0YvZGllZXc1T0RIYW4yMU9PUlFSbklK?=
 =?utf-8?B?NW9ydEdMaVFubXJla1ZtY2xNdXhnZ05YU2VQSWxkRnh6ZUh0Q3dEQ3dOMEJt?=
 =?utf-8?B?RGdNSHVrcWNmZm5Zcy9SLzVNaWJMekF2cVdDcTNtUzNaRnJTdktUWkEyUDRE?=
 =?utf-8?B?dTJyKzFrNHMyWDgwOS80bDFPQU5icndpcWNrd21vQXVpeCtjMm00OUwzVkEy?=
 =?utf-8?B?bGJXZWU2T3h2Q1RYbGQrZmlZdEREU04xQ1AxaVdvOGJNK3luemJZOCt2d0Ro?=
 =?utf-8?B?QmlCdGJERko2ak8wdmJNWDFudnRpdkhUVzF3R3NOSkEybklYV0t0WU83dVpI?=
 =?utf-8?B?NkNQMm5aWWIwZmpJYVd4YzdQMXZaS3VCV0ZYR3dFbEhpcEhBME11UUgweHow?=
 =?utf-8?B?dzVyR3E4WExwdXViZS9HcUg5bmVqRUZ6Q3k0ODNJdDdOTWpJcjJUZjVEUWhr?=
 =?utf-8?B?c0hzbWxBOVZVVEs1Z2lYOUpHSXNBSlpIZVRackQwam1QWm5sQU5qYTV0MFZD?=
 =?utf-8?B?RHAxdnJEN09IRTk2Y1pqemovRVZwRWJNbDJJSGMzbjduSkF4aThjRUxaZkpk?=
 =?utf-8?B?dFhQNG1RSWNjWnNDL1pvMytvUGtsdnlaZjk5T3ZlYjc0aDc2ajJhVUoxS1U5?=
 =?utf-8?B?enRja2hGbjZWOHowcmlwRjlrdmRRbWp4Q0krUWcxRVE4cHk4Qld0c2FoZ0o2?=
 =?utf-8?B?dHE1OG9ucFo4U0N4K0lGY09jbFZTZFJVaitLVjJmZjd1T282VE1qME1IcUMr?=
 =?utf-8?B?SFR1aVpGbVhkNE9xeU1iQ2c0RS8vL01NSXFjV3VIbE9zcm4wbXZIUmJyaE91?=
 =?utf-8?B?SGxOcStLS3BtN3Q1M3U5b3Rzby9WVi9hK1ZuSXg0aVpzMTB1THhvYjZ6SnhF?=
 =?utf-8?B?QmxSRFBjTWMrQ2hOd0hQMnFrNjZiNkFTSFJMditJKzd3QUpsR0FWeGZwcmhk?=
 =?utf-8?B?YlV5M2FXdU1XazBHNGp3eHIvQllERThxeTdibW1wUkxSUTZmNDlzc0laSHh5?=
 =?utf-8?B?UjBaNUQ3aVlxcWpaK01QRjFtcGNTTHRSditjVlFxUEQ2TnVrMDR2ajFTTmdQ?=
 =?utf-8?B?aTJlM0grT3puSDZjTDUzYlVkaGNmVDV4K1BqNVNzWlhGcGU2R0Z2WHpROFh6?=
 =?utf-8?B?VzEzZkxwekxLOVljOFowcDc2cWUzZ2pVWStzVlNBU1lpQ1MwbFBxc3BlQndZ?=
 =?utf-8?B?Y3cxeG51cGtERjNCOWxiSzZNdEdlTFRINnJ6THlLOFFJUlgyQ3VxTUNheWZs?=
 =?utf-8?B?d2cwRmY0VnZVM0RraHViMTl4WHVGZS9WcEI4VXZ0MC9McUw0UkZUQW5zdmR3?=
 =?utf-8?B?M2xhajNDbnZLSEtOZjJrNHF5Q0JsS2FlbUdsWE0vSlAvczlaeDdzZE9HdndO?=
 =?utf-8?B?YW5HLzQ4RHpkNlpWRUxIbmtUSk41WUN5eWM3VTBDY1ZETmpvNE1sNHI2R3Z3?=
 =?utf-8?B?N1NER293SUZnSEMwVnllSEgyWTIyc1NPL3VZTGhNanIrS3lNWFlQVzMzeHZm?=
 =?utf-8?B?MUVKS0l5Tk9HU3pqWnhFYlZ4UGVYZEwzVThKU1lvN2E0R2tQQ3hSL0NRL1JS?=
 =?utf-8?B?T2hsbDJCK0xsUnJ4b2hORmJoM0JVbEpwQ25XeDFoR0Fidld1WmFkeUNicEt5?=
 =?utf-8?B?V1pxczcrczVtUHkzSjZLWGcxWHE1TnZRcXY1Ny8zdlRpWlI5K05UbTdid1Yv?=
 =?utf-8?B?cXZSNG1OelN5M3krY3VaMndEeE5pNlF0SFJjZlBPVUhwVWxTUmhFOUNaakMy?=
 =?utf-8?B?Zk5kUVVCZWYxcXFlZWgvSXNlanBlSmJOcDcvTXFndGtIdlg0SGFkcEtiRXJM?=
 =?utf-8?B?aUJrNHViN3hjZzY3OUhLZ0w5bjdJOVdmMEdWNmNmQTRLTnZLZS8wbEhTa3Z4?=
 =?utf-8?B?b213bnJHOXlCWHo0OVBjQWRmN0VFQnFpenRNNU5pTGNRcG5XV1RXcVJzOC9o?=
 =?utf-8?B?NUdyQ2lOMVduSTNSS2tZSkxjVnlNWUdKN05iMUlNb0E5eUlRQ2FQWktOYzlB?=
 =?utf-8?B?VXpBZlN4L1ZTT2xKM2E4SEdURHV3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UKwyjCUGiKJgrlqwCjN2VWT+klwn4ohnjv0mPZBmOjyROx9j74tJv9LCfdfLu++HS1twIRhVn478KYpAlwfXcph6FQzNnKRSAIrlr8ioI88sV2NkXI+IE2TLWyaheYBbIM9dw+k8ryhNGksv5/1mHxOEca3oRo2t+fEhng6u4bH9lRNxsGrMgoLfz/xKdAyXj1XGe9wnXFru2UNWOgSoU9a1/4eFAuJRn7G1uicGPA1laTsGvTHVdoW4spHWdxVCKdXUyL+I5MFB4NalQsuO7HLan7pkpvB8NRp5XJ7j+lsvQCT6D40mgf2cQqNNRWPyFXrZoMjAbDMWsKgpEpAI3+jC2Tn6Wh4re2TY3kD1oEkB3NCA8oXDegx7YmqfHrGcaaLm6rzj6bI7zpZJgDN9/NFD3DGevxPf50kXKRjpNI4npdaE2RD3YZ/t5vGUvqOA
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 15:00:27.1217 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d7a166-dcff-4f79-dfdc-08de67ebf5cd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS1EPF00000045.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7369
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 3/7] arm64: dts: st: add RISAB1/2/3/4/5/6
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
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:query timed out];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	RCVD_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_PROHIBIT(0.00)[2.130.179.64:email,2.131.1.96:email,2.130.101.32:email,2.130.218.80:email];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,420f0000:email,0.0.0.0:email,foss.st.com:mid,stm-ict-prod-mailman-01.stormreply.prv:helo,2.159.99.0:email,2.130.140.48:email]
X-Rspamd-Queue-Id: 6C8621115EC
X-Rspamd-Action: no action

Add RISAB1/2/3/4/5/6 nodes to the stm32mp251.dtsi device tree SoC
file.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 48 ++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index a8e6e0f77b83..e9d8338b2017 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1733,6 +1733,54 @@ pcie@0,0 {
 			};
 		};
 
+		risab1: risab@420f0000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x420f0000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa000000 0x20000>;
+			status = "disabled";
+		};
+
+		risab2: risab@42100000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42100000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa020000 0x20000>;
+			status = "disabled";
+		};
+
+		risab3: risab@42110000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42110000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa040000 0x20000>;
+			status = "disabled";
+		};
+
+		risab4: risab@42120000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42120000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa060000 0x20000>;
+			status = "disabled";
+		};
+
+		risab5: risab@42130000 {
+			compatible = "st,stm32mp25-risab";
+			reg = <0x42130000 0x1000>;
+			clocks = <&scmi_clk CK_SCMI_ICN_LS_MCU>;
+			st,mem-map = <0xa080000 0x20000>;
+			status = "disabled";
+		};
+
+		risab6: risab@42140000 {
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
