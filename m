Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNl5LNvInWl9SAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:50:51 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD818955E
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Feb 2026 16:50:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1183FC8F28A;
	Tue, 24 Feb 2026 15:50:51 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011022.outbound.protection.outlook.com [52.101.65.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 672C9C8F285
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Feb 2026 15:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ouJiloTl0gFvJ+B21ya8kPE9bqnIyH5+fucefRn+3vHLvwGgVGJ10P893/x3BQYoKnvON58OXmG58qgsvubhPW42fFMfO5LTeXMmGu4zRxaR41oyt8LRcEC212fZg9Oi0A0gi4HoZ6r2uiTguPblPrV7QSBsNkWnQxkb0dpMFFkddd0fFASI0qWJxP/Pzd8xKtBgZDgXY6o4x0tN4Mf9s61a8pT9tYcoits6z5t3XuHu2p28w0zUo4SihWwKE50P0h81tKU47zg80eZ1oO59ymoZoiaBRaOau2V/gNOJ5uknmyjA6eB5g/PcmP9/Cxu4EwxJDw514luuHMaN02GyzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YT69B0qGxblAjTyt7XPuHtVKttD81wdAlcfWtvHoEjA=;
 b=ospYZa6lmxWESWDq6320/OhcDA4nHRvU/FjYGZvwoBIsoOPhJWRJzDI+SBu5/ONlPVPEN5JB2XaNXLUtIFHv4egjnenwmox24VAmF3ECQ0g6q6cTMobvEsICAewpJRAnE/pan/m30aUCllxGNHF3dtozYH2CPgWbzM/dnNsbMhbkuClgAxdVYwiuiRfp7QDnzbxlSsuD1qfzysr1o61EnWtQp4zvXKNKot6D3IQoIcwTMKD0PuPwobPLn014+wINTCejRympNOB+aRml0VpnabYgYQqZ65UZ8P1lOFZhK2PrE7kWrthi7n/BD9lPUq59Et8hvREiy30pkHLpBA4Vrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YT69B0qGxblAjTyt7XPuHtVKttD81wdAlcfWtvHoEjA=;
 b=f8LlcmhEwgyJbGMCzaK+e4iHUvYlTmLBRFbjJyE77vNYY0VjudY5BCkzpRiY8Hyto9QVLcZbkROUYeKue+qA4FNLt7zWbaB3Lx14a0bjaAiX7tr7YSzCwx/TrETT6RVMIUYLxaZC/qLKg2JJg48qDbarJO0PkzEoZmi5aAMOMeAZLWyUTMqKJl69vKaKXlofYFmEi3kwjZqIdSZzZ0CIQfLbZ5gER+FE7NWyEC8vq2VVRtmM4sooeAfS7wg5nSPVpcDUWDtGlA4tuPlDttkX2Lxu1wjoBMr1QjMBskN1WlG0IOJWc7CUL0pTBSVQqn5ZsflxVNKK2ZnHKMu5n0AEww==
Received: from DU7P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::34)
 by DB9PR10MB8215.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 15:49:34 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::73) by DU7P194CA0019.outlook.office365.com
 (2603:10a6:10:553::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 15:49:32 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 15:49:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:51:40 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 16:49:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 24 Feb 2026 16:48:08 +0100
MIME-Version: 1.0
Message-ID: <20260224-stm32-i2c-dt-updates-v1-5-347cf6fca7d1@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885D:EE_|DB9PR10MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b62911-9e17-431e-196e-08de73bc4e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2RHUkdVUFliS1QwVUJtWDEvQlpkVUdBREh3dFJuZmNTVzJ4NUpNaWV1d1Vz?=
 =?utf-8?B?ZUpOMUwvZWhEdko5MEd4QWFIdms2SkpGcGI2b0toekdXTEtZR0cvUm1HUWtT?=
 =?utf-8?B?OHhSYVB0cDNjTmVGYkIySWRuNDBta2dNdXF4Q0xqRERoS0syRnI0bGxqOEVk?=
 =?utf-8?B?dDBEdWxMblFxMkt3OWVKeFpZL0hkWVpEZVdRUm9CbEYzWjlkZWNpNjU2enk1?=
 =?utf-8?B?OVhTY2JVUWt5WittdEdDbThZK3A2eTJWU1BmZjFEWnNKTW5aZ3FoWXVwMERz?=
 =?utf-8?B?bXVOdUV4MXFyM2JjMU9zcCs3RkxlL012TVlEV01TVk01THQrQ2tCSXN5NElh?=
 =?utf-8?B?VUJVd2xULzErM2NkNnIxY3JJaDRyaHQwL0NTMkhNdS9WNk5uWDE3MHFmRWtY?=
 =?utf-8?B?UmdSNUJGbVA4T2NZOHJ4L0k5S0NnR1R2QjJGVjNVK0hBVldPYnpwNXZoVEJC?=
 =?utf-8?B?ZGVKVWdRcDBqampqam5BVW5oMmV3ZktkVnlUNitEcVVvVTVnWGtpMjkySlFp?=
 =?utf-8?B?RThtOTlDYXpoMXRIaW4yWXd3aDlJTUFOQlBWREZ0bzhVUHlvVmRhVVFPdjJL?=
 =?utf-8?B?QUwzdWNjVkhQYkQ5WDFuTkxVWEpBcGw3N2IrYnA4aENNSDltNU41aExhVEM1?=
 =?utf-8?B?UzVtYUF4YVN5WGtkTmo1VTM4czBlaHF4S0g0a1lGNCtrTmdCbDBCSUpwRWpW?=
 =?utf-8?B?N2FTWS93YVhwVTV5M0Z2anM3MjNOZ0lOalVhdlVTQ2RaUEk1cDVhY3RkM25T?=
 =?utf-8?B?TmhaQnJOY3JqRHQ2SmVBSmtyOFJ6ZG1ENkIwR3JKQWtlMml6YTIwS21iYm1X?=
 =?utf-8?B?SEVDS3U1eWpPbmJqR3hEQ05pNksxVHB2K1hNREF6bzZHdDQ3dkRqQmx3V1Rz?=
 =?utf-8?B?bllVTHZDTGlkTnNsdTRMeHBOQ3lld0tMMVlpa3pCTStyazFwRE52TlNFNnE1?=
 =?utf-8?B?STYxRnYyM2lybFBBOFVYYklBV3M3K1BGSFk1TFJPbWFydGlJb3ROYktrTERY?=
 =?utf-8?B?NWsyb3dGci9OL0R4REVJMjFBNExZak5FTjc3enBIbnpvMllYTG9NdEhMamRX?=
 =?utf-8?B?eWpZbGRSSmk4UWY2dnlwazErZkZlUm9EZzJJaXpZZ3dma0EzaG1DUVBtZzc4?=
 =?utf-8?B?eWtoLytVUGV0MHdZd0dlL1dZVUNOZmZsQmphL0kwMU5objZFcm1BaXVXOG5U?=
 =?utf-8?B?azZmY1M3dGdzWWhzT1AzdDFWK2RneGFuQnNTMllzdUk5d0wyUE9NZXMwVVhm?=
 =?utf-8?B?UGJmY200ZTNBZmZYWitUd1hjY3V3ejVVc0ZRUVlnYVpYcXY0Mm54RGVvemhW?=
 =?utf-8?B?amJ0OW9USndSTGppVEhGZktNcXgzU1NqaGI1TGFHKzIrUU1keFlsVVJNU1VW?=
 =?utf-8?B?SXBORldWa0xMbHBrbmEwUklYWGcxZ3ZaZDZIVnNLcDNCNHo1T1k5SkE5VnJt?=
 =?utf-8?B?dWgwMFh0T1BjQ0IwMmppNE5xY0hRVisrRW9mRlJiWDV6aHNYdWpUWmNhRVhh?=
 =?utf-8?B?Z2loQ0dDTDVIQzl2dlZKOFQxdWdqRUozR3ZLZnFBSWVLcGFGTGxLbHNqNnk2?=
 =?utf-8?B?cFppZWRacU5yYVhEUVJjMm9EQmNFMWdJTWQzS1Z5alF3RmxVVXdrU1ZLSjRC?=
 =?utf-8?B?VldLVDhpUk9kRXBRYTRNa1BLL3BEa1JscWxkdnJxaUJySjVycUhFK3BNeURJ?=
 =?utf-8?B?WHZyK2hqUVBPRzdENW9XVkdIVng0a2prcSs1T0pCWkk3bUNGa1l0S2RoQzgw?=
 =?utf-8?B?N0VPYnBXbEd4eXZDQ25KYzRUWHN0bVJlVDRlMVh2UjdZUnNHZUNNTHZKTTQy?=
 =?utf-8?B?OWl6dGxLVmNabHZaVmJYUi9pWGRCb29BZVd6RytnQVlZanpWUjRKSk85RjZ6?=
 =?utf-8?B?bGxOR3d2ZmlTVklJU0hwSUY4dkRxR2NBZlhMeTNnUVV0Nkg0U2FkTnBiZW13?=
 =?utf-8?B?RTVNMkxHUS9tck5VbmdsazNibENhQ1gyQW5VQTNNeVIrYU9HeGNZRmg3ejFq?=
 =?utf-8?B?VzhGRTlHUy9SVy82SkhtUFIxUkVUNGZYYkhxd05BM2NnOUEyUE5maWViZzdj?=
 =?utf-8?B?cGppMGNmWkF3THgyaVdqTkxHWFBsYVlxYWNLRVBuT0hlcmpNWERKMVhHeTJ2?=
 =?utf-8?B?NDh2VXhsQVh6L1gyZkxkaUpZWXFzN1E3OUJIYjQzV294QmFwM2Vma1IrS3N3?=
 =?utf-8?B?dE55NWhremw4c092d1ZBcUxqSzMrNDJaR3VMNG9Sd3lmOVVZOFpudzBhdW5q?=
 =?utf-8?B?K0o1R1FzNWkxdy9FY05tMEd3WFpRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VjlphF/QmFa3mZTSYMd7d+Ud+KkM4yJPs0F4gXrYlS82H1X0JF8AoWS0RljhavlSPSUswZl7D0pIkxRkoIAYEdMnYqw2wV7G9L1bZAIRy57PqIUFQ2GhvCS6ZXqUqOdVlwFxeKqEbgpNZq3UR9QWPmKDp4ChXiKjnAgHiE9GXUt0lKoAkWk5fQdId7sjHjN++L14DRnL6Fh4xfgSFPTGT/fL1raf9gC6diaclfhzq48HOdXWuiRQg20RyeTuXJNUfVJhImEVBfRfjB9njOWCr3EChfak5jRVLych1mwYkxaEeZ4t7iAcbXMWKjQBOYhPVuAwodXDtMD8XCFeCK+Naiu472tzbRZp2ms8bnkZkzapqvgKXqxCrzNeF8PMe8VL4TrQUVAYTkbhF5nns62/XzJqLAgFDG+jrO0iG3tZnsdDz2zOoHCeKMnnc5NiGUOs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 15:49:33.9589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b62911-9e17-431e-196e-08de73bc4e79
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8215
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 5/9] arm64: dts: st: update i2c nodes
 interrupt/wakeup-source in stm32mp231
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,2.101.25.32:email,stm-ict-prod-mailman-01.stormreply.prv:helo,2.190.131.192:email,st.com:email,st-md-mailman.stormreply.com:rdns,2.100.46.192:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[foss.st.com:-];
	DBL_PROHIBIT(0.00)[2.100.85.208:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.150];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 50FD818955E
X-Rspamd-Action: no action

Update all i2c nodes with the following properties:
  - replace interrupts with interrupts-extended and rely on exti
  - add the wakeup-source property

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index b5d81d1ee153..1121dca7880f 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -354,7 +354,7 @@ i2c1: i2c@40120000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti1 21 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C1>;
 				resets = <&rcc I2C1_R>;
 				dmas = <&hpdma 27 0x20 0x3012>,
@@ -363,6 +363,7 @@ i2c1: i2c@40120000 {
 				access-controllers = <&rifsc 41>;
 				power-domains = <&cluster_pd>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 
@@ -372,7 +373,7 @@ i2c2: i2c@40130000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti1 22 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C2>;
 				resets = <&rcc I2C2_R>;
 				dmas = <&hpdma 30 0x20 0x3012>,
@@ -381,6 +382,7 @@ i2c2: i2c@40130000 {
 				access-controllers = <&rifsc 42>;
 				power-domains = <&cluster_pd>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 
@@ -390,7 +392,7 @@ i2c7: i2c@40180000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti1 50 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C7>;
 				resets = <&rcc I2C7_R>;
 				dmas = <&hpdma 45 0x20 0x3012>,
@@ -399,6 +401,7 @@ i2c7: i2c@40180000 {
 				access-controllers = <&rifsc 47>;
 				power-domains = <&cluster_pd>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 
@@ -668,7 +671,7 @@ i2c8: i2c@46040000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				interrupt-names = "event";
-				interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts-extended = <&exti2 25 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&rcc CK_KER_I2C8>;
 				resets = <&rcc I2C8_R>;
 				dmas = <&hpdma 168 0x20 0x3012>,
@@ -677,6 +680,7 @@ i2c8: i2c@46040000 {
 				access-controllers = <&rifsc 48>;
 				power-domains = <&cluster_pd>;
 				i2c-analog-filter;
+				wakeup-source;
 				status = "disabled";
 			};
 

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
