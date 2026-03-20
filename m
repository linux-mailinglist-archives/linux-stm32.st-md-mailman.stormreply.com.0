Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGORFkMavWnG6QIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 10:58:27 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C28982D85FA
	for <lists+linux-stm32@lfdr.de>; Fri, 20 Mar 2026 10:58:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5A7FCC87EBD;
	Fri, 20 Mar 2026 09:58:26 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 421F0C35E2B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 20 Mar 2026 09:58:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvdlmVWEnaDd/9uU/geVulVuM/BkRHd6Cn6zC39LpymsIc/Wl85ZWGmac/05kzHp6bJWoaWzOHWwwVgOJ6nJH/YRCAtFUXRXpk4iunKRpbLW014nCVmmLjhfshNojW3OpacXUbutNjBLNd2ERaxO4b5hfOv86Q9OwlO4+pSMFRZUA06cuejPn3ztQCFSfjzJxJpBU2IWjQ1uRBQBnJcfFn52e4z5iLCUD2mIKtyuxgOdw26vfuhkNswSo3Zaig3OhXAsFKGccXegMVZwaMryE2tTJHLUvlo0VfIeaCr4sJYUrAfddBRQk7myN2nqAF/lwc/g8ZpZQwi46y8YHxW1pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q6f8KIaTB3VIRYAauVWqQbIbdfBj7xAZYF8Z0O/Xw64=;
 b=eXGETTRkzsvYwESPO4b0ZpWRAM7HF/hWtbQL6TyN9W9F9Uj+WQJ9o1sBA+0AayAOJcAnNaOBddqC8867flbR+BC/MUVhH1g3YLwwbi5frw+sdVGL1+3ftbUusYHcE1okhNayQYA/mmSbPGbEVgeLyCQl9rtKtfdly1bWErA285Dw3IMsSrLaGN/ZhaqFvixjQCRRQacCHzsieun10KFG8qaRRabDlvzOdEKtk9GuczPQdwSZnspvTwcv+pT0wGk6WxmrmJ3alpBKze89R5bEaFEMPgvOR9Mm1hUDSzharFrb4ucaumhVIbGpO7gKOfL2pULgt/qUwlqoeHgdcd1eFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q6f8KIaTB3VIRYAauVWqQbIbdfBj7xAZYF8Z0O/Xw64=;
 b=OejwxGQZ+qviuiCYiUl21BkcgI5Wfi23UZJwgDTepjWJL0g7rYXkqGS3ykR48hst2nLArU+Tujt7ii6RDPFtWBkdnKivC9WK77EiAxWNav0AwYgs5a3HbDIYfQNZvuuDCXLzbdc+uv0DUDUtYk4dEd9bV79raORmKHEPrKOfELmAmpHu06RY7ke54eoOrAa73k5FMAqoMt4FmPwi6eYpPCoiYN0lurY7SXKGlGnrYPkML7wUa3RnXXuHII8UBzoNsqDOBzfGVzULd2E14ptikQYbzKxhViOLQtGiwTV+DSudvKcM7Pr5pNe2GW0ngFbdSQOUNPGfXaxwJVwi/Ib6Pg==
Received: from DU2PR04CA0022.eurprd04.prod.outlook.com (2603:10a6:10:3b::27)
 by PAWPR10MB7675.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:358::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Fri, 20 Mar
 2026 09:58:19 +0000
Received: from DB5PEPF00014B98.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::c5) by DU2PR04CA0022.outlook.office365.com
 (2603:10a6:10:3b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.23 via Frontend Transport; Fri,
 20 Mar 2026 09:58:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B98.mail.protection.outlook.com (10.167.8.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 09:58:19 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Mar
 2026 11:00:55 +0100
Received: from [10.48.87.127] (10.48.87.127) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 20 Mar
 2026 10:58:17 +0100
Message-ID: <df0a0d1c-5cc2-4ec6-99d3-30b8f9ac593a@foss.st.com>
Date: Fri, 20 Mar 2026 10:58:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20260317180329.1207625-1-arnaud.pouliquen@foss.st.com>
 <20260317180329.1207625-3-arnaud.pouliquen@foss.st.com>
 <20260319-glistening-ultramarine-ibis-1eb3d6@quoll>
 <420953af-6a12-4277-8c31-062db01f78cc@foss.st.com>
 <0068d43a-e875-4f4e-aff6-3e8330e66c82@kernel.org>
Content-Language: en-US
From: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
In-Reply-To: <0068d43a-e875-4f4e-aff6-3e8330e66c82@kernel.org>
X-Originating-IP: [10.48.87.127]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B98:EE_|PAWPR10MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e1aca9-5303-4ff9-0678-08de866736bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|36860700016|376014|1800799024|82310400026|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: I18KFJ5HdPw/cywMGwjEGNSVvK4KVIdI8ZF0dObBibscNKDIU+4ZkqFXC7mNUaweJeByGIvligXv52ZAnKq9B6cy1RFhVp4zw5SQ3VnHZwcJaqLJJV0audhJZOukAOYoVZ17kT8QQSJKebL2tCdLjts1bf7W7NtiBaEq77BsLyaTdSwbW530ZXvrNvAvVxN9mUkwV727mKBS7RtWIYfiNYCvZ9Z5Uld+nlVIEyImI5uNFHX0jDAmdtWv+tVf+EFoZ3syZr+4sASNaksMxMtK2SIH/hbzm1ScjRPxvlmoJHzhs1ysu4apcAWK18IYyE8ikL0pBCpI6hOd8WpOOtM09Yt+NYPpQO1oiEjE7ImHxiTIQQC7ekxy6e64nqY2F+FIPonTanOt3ovrtwyg1J1dcnuWb+b3K0hZEP4n0AlDsrZr1L9QTcRV5oIyNBK/EzwvzzpT6H4aTkdwLUEmuBknCVB213IRTH8vSZTvkLyIj7GAPiWKVvFGkAUEJtKHEylz7IxT3cYiUkjJ651WreGjUJgw+GVVotSeAyk92O+EmJ/WiO0nKsB47pz2ioKLfjkZTfpTBhDH3M3vZ4VUQuWuDRGtLNcKgYO6+Dwf+r1LyMigQ2WnTuH3PgxGODdBGJWE6/c7XTZzE0q1OoyKtTeBvdKdqI9awXopmeD6hYqox0F21dR9rIvA3zcMEZaPXPTgLtSbM/sR3L6ABsa4UsiD3BDPn/CKpH6QHyaVfPFrGHQ=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(36860700016)(376014)(1800799024)(82310400026)(13003099007)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zDaOSdoe0ff4mUTHRLkP8ZrsqSFwHCaspMRFRUGHdoN0Br9uP3RYqwNVThx9gqXO+gPHxXxhZhfncR0en29ElzJ578HHzbEoxQOKyvZY0KKFxypYIBDjuMs6SDPl/VIpQTGrkUreEmhUT1LGBhJqsm5x+vDrnLX9jpdud+BlP209NrdfcxAsBAR8BT603Ybnzv/NX0vqRUZ5xivMDMHxVpiOb784yoNtaJ96mR/WEfe4RPaLhojc99Fl5zf3KVbdzEeERFaCk+aL8LgFUbkhjGjWuQmub6XbhexrxuxmxRWX0nZ0BNvPqEcJNFqYLgzTKsQlvMqO9ksxM3Ctc9MyhIxJ2ScqO5aUGo+PoZTU6m2wPY3f1b7oYje3qmYfAkXx8Ms0lSB9PiGfiQ7jwEH7CfS5HfNEWLNenlt/Wdb2wR/GBXW4RpCfLRQBUa6TalGe
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:58:19.0181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e1aca9-5303-4ff9-0678-08de866736bc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B98.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7675
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, op-tee@lists.trustedfirmware.org,
 Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v21 2/6] dt-bindings: remoteproc: Add
 STM32 TEE-controlled rproc binding
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:mathieu.poirier@linaro.org,m:op-tee@lists.trustedfirmware.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh+dt@kernel.org,m:sumit.garg@kernel.org,m:krzk+dt@kernel.org,m:jens.wiklander@linaro.org,m:linux-arm-kernel@lists.infradead.org,m:conor@kernel.org,m:robh@kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,devicetree.org:url];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	NEURAL_HAM(-0.00)[-0.932];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C28982D85FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CgpPbiAzLzE5LzI2IDExOjQxLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDE5LzAz
LzIwMjYgMTE6MzEsIEFybmF1ZCBQT1VMSVFVRU4gd3JvdGU6Cj4+IEhlbGxvIEtyenlzenRvZiwK
Pj4KPj4KPj4gT24gMy8xOS8yNiAwOTowNiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPj4+
IE9uIFR1ZSwgTWFyIDE3LCAyMDI2IGF0IDA3OjAzOjIzUE0gKzAxMDAsIEFybmF1ZCBQb3VsaXF1
ZW4gd3JvdGU6Cj4+Pj4gQWRkIGEgRGV2aWNlIFRyZWUgYmluZGluZyBmb3IgdGhlIFNUTTMyIHJl
bW90ZSBwcm9jZXNzb3IgY29udHJvbGxlZAo+Pj4+IHZpYSBhIFRydXN0ZWQgQXBwbGljYXRpb24g
cnVubmluZyBpbiBPUC1URUUuCj4+Pj4gVGhpcyBiaW5kaW5nIGRlc2NyaWJlcyB0aGUgaW50ZXJm
YWNlIGFuZCBwcm9wZXJ0aWVzIHJlcXVpcmVkIGZvciBTVE0zMk1QCj4+Pj4gcmVtb3RlcHJvYyBp
bnN0YW5jZXMgbWFuYWdlZCBieSB0aGUgVEVFIHJwcm9jIHNlcnZpY2UsIGluY2x1ZGluZyBhCj4+
Pj4gbGlua2FnZSB0byB0aGUgVEVFIGJhY2tlbmQgdGhyb3VnaCB0aGUgcHJvcGVydHkgInJwcm9j
LXRlZS1waGFuZGxlIi4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFybmF1ZCBQb3VsaXF1ZW4g
PGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+Cj4+Pj4gLS0tCj4+Pj4gVjIxIHVwZGF0ZXM6
Cj4+Pj4gLSB0aGUgbTQgbm9kZSBpcyBubyBtb3JlIGRlY2xhcmVkIGFzIGEgY2hpbGQgb2YgdGhl
IG9wdGVlLXJwcm9jIG5vZGUKPj4+PiAtICJycHJvYy10ZWUtcGhhbmRsZSIgcHJvcGVydHkgaXMg
aW50cm9kdWNlZCB0byByZWZlcmVuY2UgdGhlIG9wdGVlLXJwcm9jCj4+Pj4gLS0tCj4+Pj4gICAg
Li4uL3JlbW90ZXByb2Mvc3Qsc3RtMzItcnByb2MtdGVlLnlhbWwgICAgICAgIHwgMTA4ICsrKysr
KysrKysrKysrKysrKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMDggaW5zZXJ0aW9ucygrKQo+
Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmVtb3RlcHJvYy9zdCxzdG0zMi1ycHJvYy10ZWUueWFtbAo+Pj4+Cj4+Pj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL3N0LHN0bTMy
LXJwcm9jLXRlZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3JlbW90
ZXByb2Mvc3Qsc3RtMzItcnByb2MtdGVlLnlhbWwKPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uY2E0ZGQxYzhlN2IwCj4+Pj4gLS0tIC9kZXYvbnVsbAo+
Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yZW1vdGVwcm9jL3N0
LHN0bTMyLXJwcm9jLXRlZS55YW1sCj4+Pj4gQEAgLTAsMCArMSwxMDggQEAKPj4+PiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQo+Pj4+ICslWUFN
TCAxLjIKPj4+PiArLS0tCj4+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMv
cmVtb3RlcHJvYy9zdCxzdG0zMi1ycHJvYy10ZWUueWFtbCMKPj4+PiArJHNjaGVtYTogaHR0cDov
L2RldmljZXRyZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCj4+Pj4gKwo+Pj4+ICt0aXRs
ZTogU1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyIHJlbW90ZSBwcm9jZXNzb3IgY29udHJvbGxlZCB2
aWEgVEVFCj4+Pj4gKwo+Pj4+ICttYWludGFpbmVyczoKPj4+PiArICAtIEFybmF1ZCBQb3VsaXF1
ZW4gPGFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20+Cj4+Pj4gKwo+Pj4+ICtkZXNjcmlwdGlv
bjogfAo+Pj4+ICsgIFNUTTMyTVAgcmVtb3RlIHByb2Nlc3NvciBjb250cm9sbGVkIGJ5IGEgVHJ1
c3RlZCBBcHBsaWNhdGlvbgo+Pj4+ICsgIHJ1bm5pbmcgaW4gT1AtVEVFLiBUaGlzIG5vZGUgaXMg
YSBjaGlsZCBvZiB0aGUgVEVFIHJlbW90ZXByb2Mgc2VydmljZQo+Pj4+ICsgIChVVUlEIDgwYTRj
Mjc1LTBhNDctNDkwNS04Mjg1LTE0ODZhOTc3MWEwOCkgYW5kIGV4cG9zZXMgYSByZW1vdGVwcm9j
Cj4+Pj4gKyAgaW5zdGFuY2UgbWFuYWdlZCBieSB0aGUgTGludXggcmVtb3RlcHJvYyBjb3JlIHZp
YSB0aGUgVEVFIHJwcm9jIHNlcnZpY2UuCj4+Pj4gKwo+Pj4+ICsgIEZpcm13YXJlIGxvYWRpbmcs
IGF1dGhlbnRpY2F0aW9uIGFuZCByZW1vdGUgcHJvY2Vzc29yIHN0YXJ0L3N0b3AgYXJlIG1hbmFn
ZWQKPj4+PiArICBieSB0aGUgVEVFIGFwcGxpY2F0aW9uLiBUaGUgU1RNMzItc3BlY2lmaWMgZHJp
dmVyIGhhbmRsZXMgcGxhdGZvcm0gcmVzb3VyY2VzCj4+Pj4gKyAgc3VjaCBhcyB0aGUgbWFpbGJv
eGVzIGFuZCByZXNlcnZlZC1tZW1vcnkuCj4+Pj4gKwo+Pj4+ICtwcm9wZXJ0aWVzOgo+Pj4+ICsg
IGNvbXBhdGlibGU6Cj4+Pj4gKyAgICBjb25zdDogc3Qsc3RtMzJtcDEtbTQtdGVlCj4+Pgo+Pj4g
RHJvcCAidGVlIiwgaXQgc3VnZ2VzdHMgdGhhdCBjb21wYXRpYmxlIGlzIHRpZWQgdG8gaW1wbGVt
ZW50YXRpb24gb2YgRlcKPj4+IHlvdSBwdXQgdGhlcmUuCj4+Cj4+IFRoZSAic3Qsc3RtMzJtcDEt
bTQiIGNvbXBhdGlibGUgc3RyaW5nIGFscmVhZHkgZXhpc3RzIGluCj4gCj4gVGhlbiBwcm9iYWJs
eSB0aGlzIGJpbmRpbmcgbmVlZHMgY2hhbmdlcywgYmVjYXVzZSBpbiBnZW5lcmFsIHlvdSBzaG91
bGQKPiBub3QgaGF2ZSB0d28gY29tcGF0aWJsZXMgZm9yIHRoZSBzYW1lIGhhcmR3YXJlLiBNYXli
ZSB0aGF0J3Mgc3BlY2lhbAo+IGNhc2UsIGJ1dCB0aGVuIG5lZWRzIGV4cGxhbmF0aW9ucyBpbiBj
b21taXQgbXNnIHdoeSBpcyB0aGF0Lgo+IAo+PiBkcml2ZXJzL3JlbW90ZXByb2Mvc3RtMzJfcnBy
b2MuYywgYW5kICJzdCxzdG0zMm1wMS1tNC10ZWUiIGNvbXBhdGlibGUgaXMKPj4gdXBzdHJlYW1l
ZCBpbiBPUC1URUUuCj4gCj4gVGhhdCBpcyBub3Qgb3VyIHByb2JsZW0gYW5kIHN0cm9uZyBuby1n
by4gT3RoZXIgcHJvamVjdHMgYXJlIHN1cHBvc2VkIHRvCj4gcGFydGljaXBhdGUgaW4gdXBzdHJl
YW0gYmluZGluZ3MgcmV2aWV3IGFuZCB0YWtlIHRoZSBiaW5kaW5ncyBvbmNlIHRoZXkKPiBhcmUg
cmV2aWV3ZWQgYW5kIGFjY2VwdGVkIGhlcmUuIElmIHRoZXkgdGFrZSB3aXRob3V0IHJldmlldywg
aXQncyB0aGVpcgo+IHByb2JsZW0uCj4gCj4gSW1hZ2luZSB0aGF0OiBzb21lIHdoYXRldmVyIHBy
b2plY3QgdGFrZXMgd2hhdGV2ZXIgY3JhcCAobm90IHNheWluZwo+IE9wdGVlIGlzIGxpa2UgdGhh
dCwganVzdCBpbWFnaW5lIGZvciBzYWtlIG9mIGRpc2N1c3Npb24pIGFuZCB0aGVuIHlvdQo+IHNl
bmQgYmluZGluZ3MgdG8gdXBzdHJlYW0gYW5kIGNsYWltICJ0aGF0IHByb2plY3QgdG9vayBpdCwg
c28geW91IG11c3QKPiBkbyBhcyB3ZWxsIi4gR3JlYXQgbG9vcGhvbGUgdG8gc3F1ZWV6ZSBwb29y
IHN0dWZmIHRvIHRoZSBrZXJuZWwsIHNvIGFueQo+IHN1Y2ggYXJndW1lbnQgaXMgZm9yIG1lIGEg
d2FybmluZyBzaWduLgo+IAo+IAo+Pgo+PiBOb3RpY2UgdGhhdCBJIGhhdmUgYWxzbyB0aGUgc3Rt
MzJtcDIgU29DIHRvIHVwc3RyZWFtIGV4cGVjdGluZyB0byBoYXZlCj4+IHNpbWlsYXIgY29tcGF0
aWJsZToKPj4gLSBzdCxzdG0zMm1wMS1tMzMKPj4gLSBzdCxzdG0zMm1wMi1tMzMtdGVlCj4+Cj4+
IERlcGVuZGluZyBvbiB0aGUgY29tcGF0aWJsZSBzdHJpbmcsIHRoZSBoYXJkd2FyZSBiZWhhdmlv
ciBjaGFuZ2VzLgo+PiBXaXRoIHRoZSAieHh4eC10ZWUiIGNvbXBhdGlibGUsIE9QLVRFRSBhbHNv
IG1hbmFnZXMgdGhlIGlzb2xhdGlvbiBvZgo+PiByZW1vdGUgcHJvY2Vzc29yIHJlc291cmNlcyAo
bWVtb3J5LCBjbG9jayByZXNldCwgcGVyaXBoZXJhbHMpLgo+PiBXaXRob3V0IHRoZSAieHh4eC10
ZWUiIGNvbXBhdGlibGUsIE9QLVRFRSBoYXZlIHRvIGVuc3VyZSB0aGF0IHRoZSBMaW51eAo+PiBo
YXMgdGhlIGdvb2QgYWNjZXNzIHJpZ2h0IHRvIG1hbmFnZSB0aGUgcmVtb3RlIHByb2Nlc3Nvci4K
PiAKPiBTdGlsbCB0aGUgc2FtZSBkZXZpY2UsIG5vPwo+IAo+IFlvdSBjYW4gaGF2ZSBhIHByb3Bl
cnR5IGRlZmluaW5nIGhvdyBMaW51eCBzaG91bGQgYWNjZXNzIHN1Y2ggZGV2aWNlLAo+IGUuZy4g
YmVjYXVzZSBGVyBkb2VzIHRoaXMgYW5kIHRoYXQuCj4gCj4+Cj4+IEZvciBpbnN0YW5jZSBpZiBz
dCxzdG0zMm1wMS1tNC10ZWUgaXMgc2V0IGluc3RlYWQgb2Ygc3Qsc3RtMzJtcDEtbTQsIG9uCj4+
IGxpbnV4IHNpZGUKPj4gLSBvbmx5IG1lbW9yeSByZWdpb25zIHVzZWQgZm9yIElQQyBzaG91bGQg
YmUgZGVjbGFyZWQKPj4gLSBtZW1vcnkgcmVnaW9ucyBjb250YWluaW5nIHRoZSByZW1vdGUgZmly
bXdhcmUgbXVzdCBub3QgYmUgZGVjbGFyZWQgYXMKPj4gbm90IGFjY2Vzc2libGUgYnkgdGhlIExp
bnV4ICggbWFuYWdlZCBieSBPUC1URUUpLgo+PiAtIHJlc2V0cyBtdXN0IG5vdCBiZSBkZWNsYXJl
ZCAoIG1hbmFnZWQgYnkgT1AtVEVFKQo+Pgo+PiBZb3UgcHJvYmFibHkgZG9uJ3QgcmVtZW1iZXIs
IGFzIGl0IHdhcyBhIGxvbmcgdGltZSBhZ28sIGJ1dCB3ZSBhbHJlYWR5Cj4+IGRpc2N1c3NlZCB0
aGlzIHBvaW50IHdpdGggUm9iWzFdLgo+PiBbMV0gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjQv
MS8xOC8xMDAKPj4KPj4gRG8gaXQgc3RpbGwgcmVhc29uYWJsZSB0byB5b3UgYW5kIFJvYiBvciBz
aG91bGQgd2UgZmluZCBhbiBhbHRlcm5hdGl2ZT8KPiAKPiBHZXQgYWNrIGZyb20gUm9iIHRoZW4u
CgpBIHByZXZpb3VzIGFja25vd2xlZGdtZW50IGZyb20gUm9iIHdhcyBnaXZlbiBoZXJlOiAKaHR0
cHM6Ly9sa21sLm9yZy9sa21sLzIwMjQvMi8yMi8xMjY0LgoKV2hhdCBmcnVzdHJhdGVzIG1lIGlz
IHRoYXQsIGlmIHRoZSBjb21wYXRpYmxlIHVzYWdlIGlzIG5vIGxvbmdlciAKYWNjZXB0ZWQsIEkg
aGF2ZSBsb3N0IHRpbWUgYmFzaW5nIGFsbCBteSBvdGhlciB2ZXJzaW9ucyBvbiB0aGlzIAphc3N1
bXB0aW9uLiBCdXQgdGhhdOKAmXMgcGFydCBvZiB0aGUgZ2FtZSwgYW5kIHRoaXMgc2VyaWVzIGlz
IGFscmVhZHkgYSAKY29uY2F0ZW5hdGlvbiBvZiByZWRlc2lnbnMgcmVzdWx0aW5nIGluIHZlcnNp
b24gVjIxLgoKTXkgZXhwZWN0YXRpb24gaXMgc2ltcGx5IHRoYXQgeW91IGFuZCBSb2IgcHJvdmlk
ZSBtZSB3aXRoIGEgY2xlYXIgCmRpcmVjdGlvbiB0byBtb3ZlIGZvcndhcmQuCgpUaGUgY29tcGF0
aWJsZSBzdHJpbmcgaXMgb25lIHRvcGljOyBJIGFsc28gbmVlZCBhbiBhY2tub3dsZWRnbWVudCBv
ciAKcmVqZWN0aW9uIG9mIHRoZSBjb25jZXB0IG9mIHVzaW5nIGEgcGhhbmRsZSB0byBsaW5rIHRo
ZSByZW1vdGVwcm9jIApkcml2ZXIgd2l0aCB0aGUgVEVFIHNlcnZpY2UuCgpUaGFua3MgYW5kIHJl
Z2FyZHMsCkFybmF1ZAoKPiAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWls
aW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczov
L3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0z
Mgo=
