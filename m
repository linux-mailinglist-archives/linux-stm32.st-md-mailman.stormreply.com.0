Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJWIKVSnjWkK5wAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 11:11:32 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E457112C4BF
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 11:11:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7A13BC87EC9;
	Thu, 12 Feb 2026 10:11:31 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010069.outbound.protection.outlook.com [52.101.84.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 03FB2C87EBE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Feb 2026 10:11:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mr2zeEGKpkF7ZypX8WM3+/0KzpD5jBKk7L9muJfjLllW3W4yaa7c1wa4ya9kz+ohKBhR54GiSdG7E4Vwz69vXaij4iieyaQfkxv6uNoYMA688Po1FItGs8xa8CZqYTlM4XEbDaMBSAwJs+p47ss3UY0wkLN+aUgiI20M3QD4M1i3IESuCEz0XUfMrnIvlO5xHs++zZPmC5YqI6ZPIejpvdp5XF2yp/vz+KC92Xzmq7z7Nl41naABR92LPL2VKmlTTilcr88it02dGsqdw/9IlIjDSq9pjBccCxm+C9pzKaO+AxLYlKW27IPJzve1oCpcR2IlUOK5ZMpsXXgaLNr2LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JK/Q7PC+vRbb1FdlB681sH+CUWnzybNA5wXxd8dDBPI=;
 b=PLF0miqfiAVdg5aVdChrT+YrjuhDKYj1PUEJYZTb5WXbUG5iVafJDznWmz8rdByA2EjXDigwGNOTAwBm78mHDgOeiajfk0BPRBCqKbQJVXfpaYSBgkpfgrAbz+VH1rFIqk6dgC7UWHTSp2dTDxdFxxG8C9kYdcfWJbIQXACnM/VAc+H2xFtQcknMvBlvJqZp40ouM3iZzhQb5+HLAOLHHrC+OuZwchisAedEU42s95BBBL4YaAIWOvsH/sBTsj9C0hAPV1RW5DSZHpiAtM0rt9npyjhrqucHPZJ0ZJHVm5aaAKoII4a0ltSTSlKtjJ+Kys9Ayo2YUUnkF4hYb2yRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JK/Q7PC+vRbb1FdlB681sH+CUWnzybNA5wXxd8dDBPI=;
 b=FXpkD6Qd6rLZQmL1fFfrIFGX0gjJjIv+XlqOXPkZKEEGFhjPO/LX5lNa01VQAIF/Jt6kHOBiVqovhu41V1fIGBs+Oy5s0hYqSycx08BikkLFcM0M2xdHidWdPQqIT/LD9+9yQqVRMtJmcICZx2luuhFUGq45xoW2NJiEpAzruyJuG0WxZ9jZXUWXWsBGi+effWo6u1VO8VrdA1acu4DC8qtusr7/fv4QRNU4ZhYJaXWbe2abncasWsbxwTs41mzY9OoINAl1982SP0CuIVGxLGFXdl/WlmfUobOMhUaLNrBXOkzfmUU1A94PiHKNQCup3/6ueBWFSB5ymz00oA0FZQ==
Received: from AS4P189CA0047.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::19)
 by DU0PR10MB9198.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:5dd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Thu, 12 Feb
 2026 10:11:27 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:659:cafe::8d) by AS4P189CA0047.outlook.office365.com
 (2603:10a6:20b:659::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 10:11:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 10:11:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:13:09 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 12 Feb
 2026 11:11:26 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 12 Feb 2026 11:10:29 +0100
Message-ID: <20260212-stm32_risab-v2-0-02ef2859b596@foss.st.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABWnjWkC/23Myw6DIBCF4Vcxsy4GgdjLqu/RmAZwqLNQDENMG
 8O7l7ru8j/J+XZgTIQMt2aHhBsxxaWGOjXgJ7u8UNBYG5RUvVTyKjjPWj0TsXXCBOdHd9HGGw3
 1sSYM9D60x1B7Is4xfQ58637rf2frhBQYpFOut2eU9h4ic8u59XGGoZTyBbqkwF2oAAAA
X-Change-ID: 20260209-stm32_risab-4fbcdb834c43
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
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|DU0PR10MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: 269ca3be-3cc8-49b2-19a3-08de6a1f158c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|1800799024|376014|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Qzl5VGNhZ3lUZ21YVktWZHhJZTZZRVRWOExVZlFndDVIL2NnSEpOTW9YT3JS?=
 =?utf-8?B?WFBZYzRkaGRlV2kzRHFJcXh5a3d2N01MRk9xbDNCVm53TmxvNzBFM1drUml0?=
 =?utf-8?B?YzV1TUZSdDhGdnV3Ym9kWTUzT1gwamkwcStGYm83Q3RrTVpHb3NqR05JYldX?=
 =?utf-8?B?RzRBZTVSNkdObnZFOXlKN3FnZVBDSEtod2FPa0lMQXpoZGlTUDNqOU1FNnNr?=
 =?utf-8?B?TjhmQlpTQmRlSFR4SnpJN3BqTU8zaHpQbm1PQUU4Ym9wMkJtYTNkN05IZ2Rv?=
 =?utf-8?B?d1NWQWFUam1PcDEvUENnY203V2dIK0FyR1E5MEorOE1GSnhkQlRPbE1WTGpn?=
 =?utf-8?B?WEhRbFdzUi9EV2J4M0Fjb21rU1Awa0JIMWNybVRiVW1ZdEFWKzBLZVZHOU12?=
 =?utf-8?B?bldSS1haT041SDBqMDNKaHloM085Q1c2YWRVQVZhL1YyODhocjlRWmkyMXdo?=
 =?utf-8?B?TjhTbHAyUE9uZDNIb1JaRU9ua3NhZm5MaFFJdXNKN3ZXZE8ySzR4cFlYeHQ3?=
 =?utf-8?B?T0J5WGQxYlZGajJRaEpGQ0pmNE9pL2FXWjhOM1Q3RXRGV1BlMExJczlJaVZJ?=
 =?utf-8?B?VG02bU9YaW1zRHA3SFhZczVZUEx5ZTRORmpEbGVWVVNrRS9yY3U5UG1JS2c2?=
 =?utf-8?B?UEw1aTRlZ25HeUFObXMrWmZKQW43eHhVREYybDN0TmNPYlYybzV0VHJYb1M5?=
 =?utf-8?B?eGtPTHVVci9SelBBK2tJRXFZckZtNVdzNzBqNHY1cUEzV3U4dUdYUnZWWUkw?=
 =?utf-8?B?Sy9TZ3dzdHhHSTcraWVWMFJCNm5JMGhKTGs5SjhLaFRDUm44dTRGNVIxdHl0?=
 =?utf-8?B?eStQeVhJcHN3a3BzMitDdHVyOG9VVThWbkpRdXNUMUM4SlNWMmZmMWpLWjVl?=
 =?utf-8?B?SGVXMDZ0RHJWaHJDRXVjWVZ3TDUzR2pqS0lWeGlRYW1rdWtyeDVGRkhEOHNq?=
 =?utf-8?B?Q1c2TU5CRVZ4aExNL1R5M2o4TXMxa1R6WDh6Znc3UDFrSE9DWWpHQ2gwSWpJ?=
 =?utf-8?B?YllKbGRyOWkrQ1N5d0ZOYXdJWjBtbHNpRUJGaUhseXFNbUZyamZ4U0UxWFlU?=
 =?utf-8?B?SXdhNG5jVUYvaEhhTzNzb0JscmpXL3lpbTBoZ0lQRCtQTmNzT0RBeGtLb0NH?=
 =?utf-8?B?RUFsYWd2eE1rNktYODh3Q3ovd3VwZmkrTGV4UHFqNE1xbE5kdlc4dVY3QXVn?=
 =?utf-8?B?R1p3YjVBSXBtTmhiYmx3N3ZoL1V1eHJIaTE0d24vZ1ptZG5aTzMzeGswbTJN?=
 =?utf-8?B?V3ZEcllRekJTL3NrWUhYVUtzVlZEUFFHMUlUczk5RDJaMnJseUlJeGlua091?=
 =?utf-8?B?aXhzdjNnOGRmdWJnOENDa0RxZXNqdmIxMkdReFVZbUtlUER6Y1lUdSsrczNn?=
 =?utf-8?B?dTRRYnJaOVVObmU4ODYvbzFnYldoSzR3SUw2VWJaOFo4RC9QTjFiQ0NEMm5N?=
 =?utf-8?B?LzB5aDRrNGNKbSsvUlhqWWFFWGk5OG5EU081dm5oajgyblVXM29sZUo2WHNq?=
 =?utf-8?B?dmdsZ01acG5Lcmd1a1lnUzFGRUFjRGxjQzdPd0NMd016L3dmeUtwcGFDdjNN?=
 =?utf-8?B?UVo0bVhYc3VySWU1cFVSbnN0NmYxaEFNZG0ySDhOM3hrM09sNElmaVZTMFNq?=
 =?utf-8?B?N2dHU05ZZFRJUzlyT1ZvV0ZOWGtxa3dIMVBWeUhiKzlkWUluVEVDVExlY044?=
 =?utf-8?B?WFgxOTRUOVNxUy9OU0VxWTBRdncxdWprU3R6Zmg4eThjeHRGNyt1Qkp4bkZY?=
 =?utf-8?B?S2pYRjcwWVRaODlGZG9RVXcrYzIwdTZsQUdRUHNwM2l2SDV2UUNsaGlZSFhS?=
 =?utf-8?B?dUFFTzFCbmt1bkh6UnBCL2dxaFRkTEdEK3FjOUcxZlovRW5kc1ZzSVNVK2FK?=
 =?utf-8?B?SW5DU3RkRTUvZVhnRUxyNTJ2bU5ZaW9uL29IeWUyWThZZjlibzJPWFhuK2FR?=
 =?utf-8?B?ZEVHWmo5S09lNkpTWkt0R1UwR3lWZGRyU2cwMGwvT1hMbmlBbGxKV1V6VEdx?=
 =?utf-8?B?Y2NnUFRjZjJMU3dpd3FCWGR6c09vOXV0QnpIZHRrcVFJTmhmNytaY3ZjMjY2?=
 =?utf-8?B?MzBRTWNaK3plSmVQMzhvZjBrVWs2M3J1V0Y2eWhuejZ3WlIwczB2RUpuQ0dN?=
 =?utf-8?B?aHN0TEQvbFM0ODR4aDZscjlmb2pnRGVsNUcrbEQrOHhDZTI0ZlVZYWhnMDBV?=
 =?utf-8?B?N1VqQ3hrbmpyTndmQTkrajJpMlBaMkkraHVYMG9CdkszY0QzNWFRRDZtMGIx?=
 =?utf-8?B?Z1kxMXR5UGVBOVlmUTJMNXp1eExRPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: do7vQa+Cfwb+ZnU+5yxqgjlqP+J7imb4ywqGsKiDrlmzQZmJpK7nep5ck2y5lvXRukQuddK6QGexRhaLDXBk3pHquPqR7kIyc3G+Ym3zbJzIgVbpvHFOLQE+MvfGIp/BTQ3CQF7KPoa9aHoBXRqX9KQosDtN50QpLV0ry+awBhMzZd8RKFlWfV5L5Xo+jW5AWEBWgf25eff1qeb6Ue2s/2bGqvAuauUafrgmzZbkn0sJUjXohJycb/UbdW8BrIhshLtF+gh21KRH9sbYruCvUQBOwUG1ZcEJhBX52c92Ib2TTA59xRMQ3odcm1kic9XjsjmNFlRmRSvZ4urj9Gi5+c6DtkUBxjrD28iyfHNwTkOMWuM/gCY0AHp4kSU15oGRWNAs0OLDbcqsq//7vlNRcHlkcV+qR+aURSjukNTTmtgmSn1VM9bYoJU607y5VzEs
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 10:11:27.0409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 269ca3be-3cc8-49b2-19a3-08de6a1f158c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB9198
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Theo GOUREAU <theo.goureau-ext@st.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/9] drivers: bus: add RISAB dump debug
	driver
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:theo.goureau-ext@st.com,m:linux-clk@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com,baylibre.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,foss.st.com:mid,st.com:url,st.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo];
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
X-Rspamd-Queue-Id: E457112C4BF
X-Rspamd-Action: no action

The RISAB peripheral is part of the Resource Isolation Framework (RIF)
and is used to protect internal RAMs.

Memory firewalls configuration on stm32mp2x platforms can be quite
complex. The RIF configuration is done by the Trusted Domain CID
(TDCID) that is running in secure priviledged mode. However, the
configuration can be read in any mode.

In order to facilitate the memory firewall configuration (check if
correctly applied, what rights for which range, etc...), add a RISAB
configuration dump driver that is embedded only when CONFIG_DEBUGFS
is set. This driver creates a debugfs entry to dump the whole RISAB
configuration in a readable format [1], as for the RIFSC.

[1]: https://wiki.st.com/stm32mpu/wiki/How_to_analyze_IAC_%26_SERC_errors#RISAB_dump

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in v2:
- Move the RISAB driver in the bus directory to group it with other
  STM32 firewall drivers and framework
- Change all RISAB node names to firewall (not official node name
  looking at DT specs but seems generic enough)
- Change how the RISAB driver build the RISAB file entry name in the
  stm32_firewall debugfs directory
- Elaborate what a RISAB is in commit messages/dt-bindings file
- Add more entries to maintaines stm32 firewall files
- Separate MAINTAINERS modifications in a single commit with added
  entries
- Introduce CONFIG_STM32_FIREWALL_DEBUG switch for stm32 firewall
  debug features
- Rework tags for patch 2
- Link to v1: https://lore.kernel.org/r/20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com

---
Gatien Chevallier (9):
      dt-bindings: bus: document the RISAB firewall peripheral
      bus: add RISAB dump debug driver
      bus: rifsc: use new CONFIG_STM32_FIREWALL_DEBUG switch
      arm64: dts: st: add RISAB1/2/3/4/5/6 nodes to stm32mp251.dtsi
      arm64: dts: st: add RISAB1/2/3/4/5/6 nodes to stm32mp231.dtsi
      arm64: dts: st: enable all RISAB instances on the stm32mp257f-ev1 board
      arm64: dts: st: enable all RISAB instances on the stm32mp257f-dk board
      arm64: dts: st: enable all RISAB instances on the stm32mp235f-dk board
      MAINTAINERS: add entries to maintained stm32 firewall files

 .../bindings/bus/st,stm32mp25-risab.yaml           |  75 +++++
 MAINTAINERS                                        |   4 +
 arch/arm64/boot/dts/st/stm32mp231.dtsi             |  48 +++
 arch/arm64/boot/dts/st/stm32mp235f-dk.dts          |  24 ++
 arch/arm64/boot/dts/st/stm32mp251.dtsi             |  48 +++
 arch/arm64/boot/dts/st/stm32mp257f-dk.dts          |  24 ++
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         |  24 ++
 drivers/bus/Kconfig                                |   9 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/stm32_rifsc.c                          |  48 ++-
 drivers/bus/stm32_risab.c                          | 336 +++++++++++++++++++++
 11 files changed, 616 insertions(+), 25 deletions(-)
---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260209-stm32_risab-4fbcdb834c43

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
