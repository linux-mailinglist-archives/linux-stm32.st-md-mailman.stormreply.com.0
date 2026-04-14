Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MGu/GFJd3mlfCQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 17:29:22 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE9F3FBD8D
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Apr 2026 17:29:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87246C8F292;
	Tue, 14 Apr 2026 15:29:21 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 29B22C8F286
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Apr 2026 15:29:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ud+VnPAZCUnIvxuE8M0xG8kS5+jv1Ory3zyTcXCl8S+otAQ9L7JYkkgKSC4J6/AzpPSW5XVeWXcWriwAurETisAhqcOhJTm/cki6olP1H9gQpxAA7biybxTF1EU+MwxnPJPA7DZlJ6zPffI5QvBZQxFhPdcJQG0kQu6Gtpg7QD7l2rT6fuM8HXmxQTrE+tayeuuRNlsaKbTheAVgc3EmwRnhZakuTkQVF+MTYBbP1JjAXW2ZypMdNGqhpjJrjS9I3Atfe0dk1uuklBIFgtBRwXdUQeBPCzMGZcjGejll9H5vvrs+U7ziW0dj7iEMfSZfspvxXC413y+9zTOXbBT3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Rv2hBr+cq9z5FsQM48NbdcxB8xr/I6jecP4znGx7DQ=;
 b=lj6kWZ+nbFV3OVcQ3DWGRFGHtgasUpZNOc5IUqkyDq4KimKCUxsESAXxoLKtQpBnTzHjqQXnZSrLPqBHLyCpoN+BcOmMfUBze23qU9nF0U8Ic3cCFfKpu/n6ywEoNEZnhVNRFnpTBFvjnyMXi6txRCHWtXBqbtVfS+W7NaZcpR5RwDk9np/v7fz0ZDZPs5bKRtMSPoUUvf+q2zchFlW2yNkQWy6OzxuYfDGMyn0wuXW1rMJg3qpDr1mMMrwUvDRyuvRS00df4YIV6f0eN8KY1JOUoJClk/FZcW/rpznzH6+ZOxvh1Nc3SqJkmfUMYBhwEgCQt0D0rqqifzBpxbcoqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Rv2hBr+cq9z5FsQM48NbdcxB8xr/I6jecP4znGx7DQ=;
 b=fuupeLPAHMLx4IMN0Fyr0LDI/LsYnyHdz5LBWJDbBNG3x09ch79wT7DHrp/QyilaE5FZ9wt6WT389BNNTn57T7e2yZzJfkOcYQqhRJmJHxO4AWKPnS5r8WHjLWz43pDF6LEi4w2s2pmRndjVZPGzMeV1SDk0/jT+orx4wFd1OKd5lrgsZxWlSd8wFAuMwg/tLezwnGKugrRpuzx4qeAwjdZbNMWqo8NSJm1DZ/Rx0yq9a0H21ZqGtXnKcD9R2u1I75zDiBu+82MwrnAttEcws4AWi1BwpKDCqIvF0Pxsurna6XDSY1Z1gq7mhtR2lBVv+k/FOs0tCaf/neo+d3ZqFQ==
Received: from DB8PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:10:110::26)
 by PA2PR10MB8577.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:425::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 15:29:16 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::a4) by DB8PR04CA0016.outlook.office365.com
 (2603:10a6:10:110::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Tue,
 14 Apr 2026 15:29:15 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 15:29:15 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:32:24 +0200
Received: from localhost (10.252.12.46) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 14 Apr
 2026 17:29:15 +0200
From: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Jens Wiklander <jens.wiklander@linaro.org>,
 "Rob Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Conor Dooley" <conor+dt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>
Date: Tue, 14 Apr 2026 17:28:55 +0200
Message-ID: <20260414152904.1679724-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.252.12.46]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|PA2PR10MB8577:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e39fe9f-9cd7-4d86-6ed2-08de9a3a969d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|30052699003|376014|7416014|13003099007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: +sexLr0348SR898SlzKRzwNZWhMJ4+lU4TL14M1ukPj9pnMB55l7CQvLiJqQ/yZgBptrMvPDh5VXPf1HILhdpoOHRct+PCNpTcclEHx7D+yyj+wkchn324UW7jNh5D6QMdBimOm1lbo7jhonWiXNkk2ctU6m/1Sz4fV+bO/fimoY3AyLPrFvEtj+e2ECRkpwzJ7VB9mKYAH+9JhPOfpeLx3c49qMPax1dFN1ujwjjNMd2tf7pXouWvGEDdDtNpGES8dGp/LdOOt+aAjgUqIntN2AIUq/zbIyGEf48DJvMNbXrT3TnachFcVz2B2oWS3zoICLdgEKOdATaM4Q7a6kakkSG6mOoQKIkLIc0u+hj+m4oLbqINcruOCMkkgMJC80k0AvpIKPtMJuMZhreVZUQw4im+Yc/PDBzsV7/6mtAYpTLSPZBLjyaQsLyyMe6JDDUQ6EbuAAHleqOrvIBcHHX0qZZb3AG+jI82DIYQycWvJGXtFDq12VYtpSsGWaa0NhiYnE5c1r+752gx31k6rQtTNk1Q8eSfup2sjErbFsMY5aHufkFNgbE51yQ4v+46wCXB8qYLCEsgpcNplyZ+qcAaJw29hm443JpBMR1SRfWcqnVrtibOztCDU1AD/Y/W/bbgH3zaKuK7oGQZQNT44JS3UF7tDmEM62Hz3AEWpobLrbdpud7QAVI4qu/y4azMbtSeiv4Fd6WdeQDb31mgF/xO5CM6rQCh7gvgF17gcbEAc=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(30052699003)(376014)(7416014)(13003099007)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /u9j1UbjCxwLX6108yMfeGaHBMcIxkQmGTENIRWujESQENLfdqTDPyGgQSvtbCOSpUeBU+l4Qe6QAcrgGilZYk0BjvdPxe+vpTvaQl8CjvFFWFpxIVQQ62db3k2FY6Rork73xtKzZp4r1xPBrxxFk3cLM97Y60xIOHhDRSjy2P6YrdUgQrxDgwfokhi0RhEZRVTgoHyUdnKq853bhb+cmmACamIMOkZmaA/Xp5VmGU/SAttN20OPYdX8Fpfr7ILyvsDZM0m6EPxzw6SBJQ0qu3P1UdLdqtIPSn5sQzOHowIfw9h3+hO5FindZlAyCiOQsEqzYanfVDCCEi9X8YUZ9V7S9OixzjiOwBCnHXTx79KhRP7eA3Aj/UnFf4En33QIFq4JbdGOzLkaIDILmh7mKvc9X4eatK+USvELXI0e8YHlcn1JOHK/KZH5nYo5S2IJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 15:29:15.7640 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e39fe9f-9cd7-4d86-6ed2-08de9a3a969d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8577
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v22 0/7] Introduction of a remoteproc tee to
	load signed firmware
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [5.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:jens.wiklander@linaro.org,m:robh+dt@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:op-tee@lists.trustedfirmware.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:robh@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:url,sign_rproc_fw.py:url,0.152.150.128:email,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[arnaud.pouliquen@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.570];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EFE9F3FBD8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

TWFpbiB1cGRhdGVzIGZyb20gdmVyc2lvbiBWMjFbMV06Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tClRoaXMgdmVyc2lvbiByZW1vdmVzIHRoZSBzdCxzdG0zMm1wMS1tNC10ZWUgY29t
cGF0aWJpbGl0eSBzdHJpbmcsCndoaWNoIG5vIGxvbmdlciBzZWVtcyB0byBiZSBhY2NlcHRlZCBi
eSB0aGUgRGV2aWNldHJlZSBtYWludGFpbmVycy4KQXMgYSBjb25zZXF1ZW5jZSwgdGhlIHN0bTMy
LXJwcm9jLXRlZSBkcml2ZXIsIGludHJvZHVjZWQgdG8gc2ltcGxpZnkKdGhlIGNvZGUsIGlzIHJl
bW92ZWQuIFRoZSBTVE0zMiBpbnRlZ3JhdGlvbiByZXVzZXMgdGhlIGV4aXN0aW5nCnN0bTMyX3Jw
cm9jIGRyaXZlciBpbXBsZW1lbnRlZCBpbiBWMTkuCgpUaGUgZGV2aWNldHJlZSBpcyBub3cgc3Ry
dWN0dXJlZCBhcyBmb2xsb3dzOgoKICAgIGZpcm13YXJlIHsKICAgICAgICB0ZWVfcnByb2M6IG9w
dGVlLXJwcm9jIHsKICAgICAgICAgICAgY29tcGF0aWJsZSA9ICI4MGE0YzI3NS0wYTQ3LTQ5MDUt
ODI4NS0xNDg2YTk3NzFhMDgiOwogICAgICAgIH07CiAgICB9OwoKICAgIG00OiBtNEAxMDAwMDAw
MCB7CiAgICAgIGNvbXBhdGlibGUgPSAic3Qsc3RtMzJtcDEtbTQiOwogICAgICByZWcgPSA8MHgx
MDAwMDAwMCAweDQwMDAwPiwKICAgICAgICAgICAgPDB4MzAwMDAwMDAgMHg0MDAwMD4sCiAgICAg
ICAgICAgIDwweDM4MDAwMDAwIDB4MTAwMDA+OwoKICAgICAgbWJveGVzID0gPCZpcGNjIDA+LCA8
JmlwY2MgMT4sIDwmaXBjYyAyPiwgPCZpcGNjIDM+OwogICAgICBtYm94LW5hbWVzID0gInZxMCIs
ICJ2cTEiLCAic2h1dGRvd24iLCAiZGV0YWNoIjsKCiAgICAgIG1lbW9yeS1yZWdpb24gPSA8JnZk
ZXYwdnJpbmcwPiwgPCZtX2lwY19zaG0+LCA8Jm1jdXJhbTI+LAogICAgICAgICAgICAgICAgICAg
ICAgPCZ2ZGV2MHZyaW5nMT4sIDwmdmRldjBidWZmZXI+LCA8JnJldHJhbT47CgogICAgICBpbnRl
cnJ1cHQtcGFyZW50ID0gPCZleHRpPjsKICAgICAgaW50ZXJydXB0cyA9IDw2OCAxPjsKCiAgICAg
IHN0LHJwcm9jLXRlZSA9IDwmdGVlX3Jwcm9jIDA+OwoKICAgICAgc3RhdHVzID0gIm9rYXkiOwog
ICAgfTsKCkFzIGEgY29uc2VxdWVuY2UsIHRoaXMgdmVyc2lvbjoKLSByZWludHJvZHVjZSB2MTkg
Y29tbWl0cyBmb3Igc3RtMzJfcnByb2MuYyBkcml2ZXIgLCBhZGRpbmcgdGhlIHN1cHBvcnQKICBv
ZiB0aGUgc3QscnByb2MtdGVlIGJpbmRpbmcuCi0gZHJvcHMgdGhlIGRlZGljYXRlZCByZW1vdGVw
cm9jLXRlZS55YW1sIGFuZCBzdCxzdG0zMi1ycHJvYy10ZWUueWFtbAogIGJpbmRpbmdzIGZyb20g
dGhlIHNlcmllcy4KLSBleHRlbmRzIHN0LHN0bTMyLXJwcm9jLnlhbWwgd2l0aCBzdCxycHJvYy10
ZWUgdG8gZGVzY3JpYmUgdGhlIGxpbmsgdG8KICB0aGUgVEVFIHJlbW90ZXByb2MgYmFja2VuZC4K
LSByZW1vdmVzIHRoZSBkZWRpY2F0ZWQgc3RtMzJfcnByb2NfdGVlLmMgZHJpdmVyIGFuZCByZXVz
ZXMgc3RtMzJfcnByb2MuYwogIGZvciBib3RoIG5hdGl2ZSBhbmQgVEVFLWNvbnRyb2xsZWQgY2Fz
ZXMuCi0ga2VlcHMgcmVtb3RlcHJvY190ZWUuYyBhbGlnbmVkIHdpdGggdGhlIHBoYW5kbGUtYmFz
ZWQgbG9va3VwIGludHJvZHVjZWQKICBpbiB2MjEgYW5kIHVzZXMgYSBkZXZpY2VfbGluayBiZXR3
ZWVuIHRoZSBTVE0zMiByZW1vdGVwcm9jIGluc3RhbmNlIGFuZAogIHRoZSBURUUgYmFja2VuZCBk
ZXZpY2UuCgpNb3JlIGRldGFpbHMgYXJlIGF2YWlsYWJsZSBpbiBlYWNoIHBhdGNoIGNvbW1pdCBt
ZXNzYWdlLgoKTWFpbiB1cGRhdGVzIGZyb20gdmVyc2lvbiBWMjBbM106Ci0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tClRvIGFkZHJlc3MgUm9i4oCZcyBjb25jZXJuIG9uIHYyMGNvbmNl
cm5pbmcgcmVzb3VyY2UgZGVjbGFyYXRpb24gdW5kZXIgdGhlCnRlZSBub2RlLCB0aGUgZGV2aWNl
IHRyZWUgaXMgbm93IHN0cnVjdHVyZWQgYXMgZm9sbG93cyxyZXBsYWNpbmcgdGhlCmNoaWxkLXBh
cmVudCBoaWVyYXJjaHkgd2l0aCBhIHBoYW5kbGU6CgogICAgZmlybXdhcmUgewogICAgICAgIHRl
ZV9ycHJvYzogb3B0ZWUtcnByb2MgewogICAgICAgICAgICBjb21wYXRpYmxlID0gIjgwYTRjMjc1
LTBhNDctNDkwNS04Mjg1LTE0ODZhOTc3MWEwOCI7CiAgICAgICAgfTsKICAgIH07CgogICAgbTQ6
IG00QDAgewogICAgICBjb21wYXRpYmxlID0gInN0LHN0bTMybXAxLW00LXRlZSI7CiAgICAgIHJl
ZyA9IDwwIDA+OwoKICAgICAgbWJveGVzID0gPCZpcGNjIDA+LCA8JmlwY2MgMT4sIDwmaXBjYyAy
PjsKICAgICAgbWJveC1uYW1lcyA9ICJ2cTAiLCAidnExIiwgInNodXRkb3duIjsKCiAgICAgIG1l
bW9yeS1yZWdpb24gPSA8JnZkZXYwdnJpbmcwPiwgPCZtX2lwY19zaG0+LCA8Jm1jdXJhbTI+LAog
ICAgICAgICAgICAgICAgICAgICAgPCZ2ZGV2MHZyaW5nMT4sIDwmdmRldjBidWZmZXI+LCA8JnJl
dHJhbT47CgogICAgICBpbnRlcnJ1cHQtcGFyZW50ID0gPCZleHRpPjsKICAgICAgaW50ZXJydXB0
cyA9IDw2OCAxPjsKCiAgICAgIHJwcm9jLXRlZS1waGFuZGxlID0gPCZ0ZWVfcnByb2MgMD47CiAg
ICAgIHN0LGF1dG8tYm9vdDsKICAgICAgd2FrZXVwLXNvdXJjZTsKCiAgICAgIHN0YXR1cyA9ICJv
a2F5IjsKICAgIH07CgpBcyBhIGNvbnNlcXVlbmNlLCB0aGlzIHZlcnNpb246Ci0gVXBkYXRlcyB0
aGUgZGV2aWNlIHRyZWUgYW5kIGJpbmRpbmdzIHRvOgogIC0gQ2hhbmdlIHRoZSBjb21wYXRpYmxl
IHByb3BlcnR5IGZyb20KICAgICJycHJvYy1zZXJ2aWNlLTgwYTRjMjc1LTBhNDctNDkwNS04Mjg1
LTE0ODZhOTc3MWEwOCIgdG8KICAgICI4MGE0YzI3NS0wYTQ3LTQ5MDUtODI4NS0xNDg2YTk3NzFh
MDgiLgogIC0gVXNlIHRoZSBycHJvYy10ZWUtcGhhbmRsZSB0byBhdm9pZCB0aGUgcGFyZW50LWNo
aWxkIGhpZXJhcmNoeS4KLSBVcGRhdGVzIHN0bTMyX3Jwcm9jX3RlZS5jIGFuZCByZW1vdGVwcm9j
X3RlZS5jIHRvIGFkYXB0IHRvIHRoZSBuZXcgYmluZGluZ3MuCi0gVXBkYXRlcyByZW1vdGVwcm9j
X3RlZS5jIHRvIGNvbXB1dGUgdGhlIGRldmljZSB0cmVlIGNvbXBhdGlibGUgc3RyaW5nIGZyb20K
ICB0aGUgVEVFIFVVSUQuCgpNYWluIHVwZGF0ZXMgZnJvbSB2ZXJzaW9uIFYxOVs0XToKLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KVGhlIGRldmljZXRyZWUgaXMgbm93IHN0cnVjdHVy
ZWQgYXMgZm9sbG93czoKCglmaXJtd2FyZSB7CgkJb3B0ZWUgewoJCQljb21wYXRpYmxlID0gImxp
bmFybyxvcHRlZS10eiI7CgkJCW1ldGhvZCA9ICJzbWMiOwoJCQkjYWRkcmVzcy1jZWxscyA9IDwx
PjsKCQkJI3NpemUtY2VsbHMgPSA8MD47CgkJCXJwcm9jLXNlcnZpY2VAMCB7CgkJCQljb21wYXRp
YmxlID0gInJwcm9jLXNlcnZpY2UtODBhNGMyNzUtMGE0Ny00OTA1LTgyODUtMTQ4NmE5NzcxYTA4
IjsKCQkJCXJlZyA9IDwwPjsKCQkJCSNhZGRyZXNzLWNlbGxzID0gPDE+OwoJCQkJI3NpemUtY2Vs
bHMgPSA8MD47CgkJCQlzdGF0dXMgPSAib2theSI7CgkJCQltNDogbTRAMCB7CgkJCQkJY29tcGF0
aWJsZSA9ICJzdCxzdG0zMm1wMTUtbTQtdGVlIjsKCQkJCQlyZWcgPSA8MD47CgkJCQkJbWJveGVz
ID0gPCZpcGNjIDA+LCA8JmlwY2MgMT4sIDwmaXBjYyAyPjsKCQkJCQltYm94LW5hbWVzID0gInZx
MCIsICJ2cTEiLCAic2h1dGRvd24iOwoJCQkJCW1lbW9yeS1yZWdpb24gPSA8JnZkZXYwdnJpbmcw
PiwJPCZtX2lwY19zaG0+LCA8Jm1jdXJhbTI+LAoJCQkJCQkJPCZ2ZGV2MHZyaW5nMT4sIDwmdmRl
djBidWZmZXI+LCA8JnJldHJhbT47CgkJCQkJaW50ZXJydXB0LXBhcmVudCA9IDwmZXh0aT47CgkJ
CQkJaW50ZXJydXB0cyA9IDw2OCAxPjsKCQkJCQlzdGF0dXMgPSAib2theSI7CgkJCQl9OwoJCQl9
OwoJCX07Cgl9OwoKQXMgYSBjb25zZXF1ZW5jZSwgdGhpcyB2ZXJzaW9uOgoKLSBJbnRyb2R1Y2Vz
IGEgbmV3IHN0bTMyX3Jwcm9jX3RlZS5jIHJlbW90ZXByb2MgZHJpdmVyLgoKICBJbnN0ZWFkIG9m
IGZ1cnRoZXIgY29tcGxpY2F0aW5nIHRoZSBleGlzdGluZyBzdG0zMl9ycHJvYy5jIGRyaXZlciwg
YQogIGRlZGljYXRlZCBURUUtYmFzZWQgZHJpdmVyIGlzIGFkZGVkLiBCb3RoIGRyaXZlcnMgYXJl
IGludGVuZGVkIHRvIGFsc28KICBzdXBwb3J0IHRoZSBTVE0zMk1QMnggQ29ydGV4LU0zMyByZW1v
dGUgcHJvY2Vzc29yIGluIGEgbmV4dCBzdGVwLgoKLSBSZXdvcmtzIHRoZSBiaW5kaW5nczoKICAt
IERyb3AgdGhlIHN0LHN0bTMyLXJwcm9jLnlhbWwgdXBkYXRlcyB0aGF0IHdlcmUgaW50cm9kdWNl
ZCBpbiBwcmV2aW91cwogICAgcmV2aXNpb25zLgogIC0gQWRkIHJlbW90ZXByb2MtdGVlLnlhbWwg
Zm9yIHRoZQogICAgInJwcm9jLXNlcnZpY2UtODBhNGMyNzUtMGE0Ny00OTA1LTgyODUtMTQ4NmE5
NzcxYTA4IiBjb21wYXRpYmxlLgogIC0gQWRkIHN0LHN0bTMyLXJwcm9jLXRlZS55YW1sIGZvciB0
aGUgInN0LHN0bTMybXAxNS1tNC10ZWUiIGNvbXBhdGlibGUuCgotIFJld29ya3MgdGhlIHByb2Jp
bmcgc2VxdWVuY2U6CgogIFRoZSBtNEAwIGRldmljZSBpcyBub3cgcHJvYmVkIGJ5IHRoZSByZW1v
dGVwcm9jLXRlZSBkcml2ZXIsIHdoaWNoIGl0c2VsZgogIGlzIGluc3RhbnRpYXRlZCBieSB0aGUg
VEVFIChPUC1URUUpIGJ1cy4KCk1vcmUgZGV0YWlscyBhcmUgYXZhaWxhYmxlIGluIGVhY2ggcGF0
Y2ggY29tbWl0IG1lc3NhZ2UuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmVt
b3RlcHJvYy8yMDI2MDMxNzE4MDMyOS4xMjA3NjI1LTEtYXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0
LmNvbS8KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJlbW90ZXByb2MvMjAyNTEy
MTcxNTM5MTcuMzk5ODU0NC0xLWFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20vClszXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1kZXZpY2V0cmVlLzIwMjUwNjI1MDk0MDI4Ljc1ODAx
Ni0xLWFybmF1ZC5wb3VsaXF1ZW5AZm9zcy5zdC5jb20vCgoKVGVzdGVkLW9uOgotLS0tLS0tLS0K
Y29tbWl0IDU5MWNkNjU2YTFiZiAoIkxpbnV4IDcuMC1yYzciKQoKRGVzY3JpcHRpb24gb2YgdGhl
IGZlYXR1cmU6Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClRoaXMgc2VyaWVzIHByb3Bvc2Vz
IHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBhIHJlbW90ZXByb2MgdGVlIGRyaXZlciB0bwpjb21tdW5p
Y2F0ZSB3aXRoIGEgVEVFIHRydXN0ZWQgYXBwbGljYXRpb24gcmVzcG9uc2libGUgZm9yIGF1dGhl
bnRpY2F0aW5nCmFuZCBsb2FkaW5nIHRoZSByZW1vdGVwcm9jIGZpcm13YXJlIGltYWdlIGluIGFu
IEFybSBzZWN1cmUgY29udGV4dC4KCjEpIFByaW5jaXBsZToKClRoZSByZW1vdGVwcm9jIHRlZSBk
cml2ZXIgcHJvdmlkZXMgc2VydmljZXMgdG8gY29tbXVuaWNhdGUgd2l0aCB0aGUgT1AtVEVFCnRy
dXN0ZWQgYXBwbGljYXRpb24gcnVubmluZyBvbiB0aGUgVHJ1c3RlZCBFeGVjdXRpb24gQ29udGV4
dCAoVEVFKS4KVGhlIHRydXN0ZWQgYXBwbGljYXRpb24gaW4gVEVFIG1hbmFnZXMgdGhlIHJlbW90
ZSBwcm9jZXNzb3IgbGlmZWN5Y2xlOgoKLSBhdXRoZW50aWNhdGluZyBhbmQgbG9hZGluZyBmaXJt
d2FyZSBpbWFnZXMsCi0gaXNvbGF0aW5nIGFuZCBzZWN1cmluZyB0aGUgcmVtb3RlIHByb2Nlc3Nv
ciBtZW1vcmllcywKLSBzdXBwb3J0aW5nIG11bHRpLWZpcm13YXJlIChlLmcuLCBURi1NICsgWmVw
aHlyIG9uIGEgQ29ydGV4LU0zMyksCi0gbWFuYWdpbmcgdGhlIHN0YXJ0IGFuZCBzdG9wIG9mIHRo
ZSBmaXJtd2FyZSBieSB0aGUgVEVFLgoKMikgRm9ybWF0IG9mIHRoZSBzaWduZWQgaW1hZ2U6CgpS
ZWZlciB0bzoKaHR0cHM6Ly9naXRodWIuY29tL09QLVRFRS9vcHRlZV9vcy9ibG9iL21hc3Rlci90
YS9yZW1vdGVwcm9jL3NyYy9yZW1vdGVwcm9jX2NvcmUuYyNMMTgtTDU3CgozKSBPUC1URUUgdHJ1
c3RlZCBhcHBsaWNhdGlvbiBBUEk6CgpSZWZlciB0bzoKaHR0cHM6Ly9naXRodWIuY29tL09QLVRF
RS9vcHRlZV9vcy9ibG9iL21hc3Rlci90YS9yZW1vdGVwcm9jL2luY2x1ZGUvdGFfcmVtb3RlcHJv
Yy5oCgo0KSBPUC1URUUgc2lnbmF0dXJlIHNjcmlwdAoKUmVmZXIgdG86Cmh0dHBzOi8vZ2l0aHVi
LmNvbS9PUC1URUUvb3B0ZWVfb3MvYmxvYi9tYXN0ZXIvc2NyaXB0cy9zaWduX3Jwcm9jX2Z3LnB5
CgpFeGFtcGxlIG9mIHVzYWdlOgpzaWduX3Jwcm9jX2Z3LnB5IC0taW4gPGZ3MS5lbGY+IC0taW4g
PGZ3Mi5lbGY+IC0tb3V0IDxzaWduZWRfZncuc2lnbj4gLS1rZXkgJHtPUC1URUVfUEFUSH0va2V5
cy9kZWZhdWx0LnBlbQoKCjUpIEltcGFjdCBvbiBVc2VyIHNwYWNlIEFwcGxpY2F0aW9uCgpObyBz
eXNmcyBpbXBhY3QuIFRoZSB1c2VyIG9ubHkgbmVlZHMgdG8gcHJvdmlkZSB0aGUgc2lnbmVkIGZp
cm13YXJlIGltYWdlCmluc3RlYWQgb2YgdGhlIEVMRiBpbWFnZS4KCgpGb3IgbW9yZSBpbmZvcm1h
dGlvbiBhYm91dCB0aGUgaW1wbGVtZW50YXRpb24sIGEgcHJlc2VudGF0aW9uIGlzIGF2YWlsYWJs
ZSBoZXJlCihub3RlIHRoYXQgdGhlIGZvcm1hdCBvZiB0aGUgc2lnbmVkIGltYWdlIGhhcyBldm9s
dmVkIGJldHdlZW4gdGhlIHByZXNlbnRhdGlvbgphbmQgdGhlIGludGVncmF0aW9uIGluIE9QLVRF
RSkuCgpodHRwczovL3Jlc291cmNlcy5saW5hcm8ub3JnL2VuL3Jlc291cmNlLzZjNWJHdlp3VUFq
WDU2ZnZ4dGh4ZHMKCkFybmF1ZCBQb3VsaXF1ZW4gKDcpOgogIGR0LWJpbmRpbmdzOiBmaXJtd2Fy
ZTogQWRkIFRFRSByZW1vdGVwcm9jIHNlcnZpY2UgYmluZGluZwogIGR0LWJpbmRpbmdzOiByZW1v
dGVwcm9jOiBzdCxzdG0zMi1ycHJvYzogYWRkIHN0LHJwcm9jLXRlZQogIHJlbW90ZXByb2M6IGNv
cmU6IEludHJvZHVjZSBycHJvY19wYV90b192YSBoZWxwZXIKICByZW1vdGVwcm9jOiBJbnRyb2R1
Y2Ugb3B0aW9uYWwgcmVsZWFzZV9mdyBvcGVyYXRpb24KICByZW1vdGVwcm9jOiBBZGQgVEVFIHN1
cHBvcnQKICByZW1vdGVwcm9jOiBzdG0zMjogQ3JlYXRlIHN1Yi1mdW5jdGlvbnMgdG8gcmVxdWVz
dCBzaHV0ZG93biBhbmQKICAgIHJlbGVhc2UKICByZW1vdGVwcm9jOiBzdG0zMjogQWRkIHN1cHBv
cnQgb2YgYW4gT1AtVEVFIFRBIHRvIGxvYWQgdGhlIGZpcm13YXJlCgogLi4uL2JpbmRpbmdzL3Jl
bW90ZXByb2MvcmVtb3RlcHJvYy10ZWUueWFtbCAgIHwgIDM2ICsKIC4uLi9iaW5kaW5ncy9yZW1v
dGVwcm9jL3N0LHN0bTMyLXJwcm9jLnlhbWwgICB8ICA1NSArLQogZHJpdmVycy9yZW1vdGVwcm9j
L0tjb25maWcgICAgICAgICAgICAgICAgICAgIHwgIDEwICsKIGRyaXZlcnMvcmVtb3RlcHJvYy9N
YWtlZmlsZSAgICAgICAgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL3JlbW90ZXByb2MvcmVt
b3RlcHJvY19jb3JlLmMgICAgICAgICAgfCAgNTYgKysKIGRyaXZlcnMvcmVtb3RlcHJvYy9yZW1v
dGVwcm9jX2ludGVybmFsLmggICAgICB8ICAgNiArCiBkcml2ZXJzL3JlbW90ZXByb2MvcmVtb3Rl
cHJvY190ZWUuYyAgICAgICAgICAgfCA3ODkgKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL3Jl
bW90ZXByb2Mvc3RtMzJfcnByb2MuYyAgICAgICAgICAgICAgfCAyNDkgKysrKy0tCiBpbmNsdWRl
L2xpbnV4L3JlbW90ZXByb2MuaCAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwogaW5jbHVkZS9s
aW51eC9yZW1vdGVwcm9jX3RlZS5oICAgICAgICAgICAgICAgIHwgIDk4ICsrKwogMTAgZmlsZXMg
Y2hhbmdlZCwgMTIyMCBpbnNlcnRpb25zKCspLCA4NiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9yZW1v
dGVwcm9jLXRlZS55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9yZW1vdGVwcm9jL3Jl
bW90ZXByb2NfdGVlLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L3JlbW90ZXBy
b2NfdGVlLmgKCgpiYXNlLWNvbW1pdDogNTkxY2Q2NTZhMWJmNWVhOTRhMjIyYWY1ZWYyZWU3NmRm
MDI5YzFkMgotLSAKMi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFp
bG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20v
bWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
