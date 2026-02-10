Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAE2EWkBi2npPAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 10:59:05 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD16511947D
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Feb 2026 10:59:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A0A73C87EC0;
	Tue, 10 Feb 2026 09:59:04 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012022.outbound.protection.outlook.com [52.101.66.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A05BC1A97F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Feb 2026 09:59:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVf84UYNjxhlH3o/FkY99hHS++sIs0Ma66n6AL82bqr26Seqph/XPDqpbXTkjrIlnQSYfZABEPvr7ChJVowdXzRUtsR1aHkj+LzvLLdekgv3yLdzuzC7LDNKBRIanXbgyY/mOV1HXt29iUJrG8JvT6DlCiZUBx4g6zZHW4wEMfUB6qhtP2+Izr9+jS7YPRKB2U6D97mmikKU+CxPe2vgCDkSZENbp+bIx/wIGMCiqetxNaf/FaDWsn5lLcFNPHoSOsycqAzGplyLBNLgVkU8kc5DLMDZRbhT9QvfJBAOZP3gicNrnAGRIQpS70c44wg2HFjUVClciiC6uwU0q4Adgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yy6+UR8mAAT+oN/VnGrd4/vwD2Sy7qYU0EOtFCbnBAg=;
 b=DqpQy4Ihg6KE3xRybJcnliDJpyh5E2/ogOee/3jEMMXebjjMe7KTrCQehEDQZdZHBC4Vtpd2lzb+Jh19un5dCcHAIZitL178CtkX+zxu4wLe1oO8YCmQqzSunDhN4TB2mGxCns6Av5d61JCxNUf9KIrLf/08j0k6vEZsOJN8JbWC0TxlvZe43uOrXUnzZpOuBfamEnjyjpVlSRGckum/r5xRsoOhuoKHV+teI8W9Mp5PU0DR92NRClMEbMNBv2bPIJ0fiNfeQ2Uz2LD5qJ7cwn/ECne/E4yAgo7PYxl6QsyKXeslV6Lhs/ucKKfIWQVHMsmAqO8XdAFz2XsAam3b5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yy6+UR8mAAT+oN/VnGrd4/vwD2Sy7qYU0EOtFCbnBAg=;
 b=N0jTtkgWFovacKscFIniAXFZo5lBw5AmVufqJ0tncP3OgSVzW5qjhuKU8h8MS5yu9JwkEuUedJGLrMaCzD49lFKyxiQSquI2C1vwIkXGGNjJ8FKOt+pbgxUKALJrpWgfNAN971WELRZDSRdlTLEVZtCx2MEfrBH3O03T2oHRGhA/4Pth8HtGkZI9bKXNpaYNHQ+q8ZIfqQzkd50RqAeUcNjOZDsxId4XO7muXAJrV3HrRVQWIxB0P5+9bR4iMmfLvK1MUH16NnoJI30l2ebD0M/kwjtH1N0HySmVE9Xv5ef3MRw3boongqLC36tGqnBMN2Vo9+MMf3+GenRu3xywyA==
Received: from AS4P190CA0020.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::8)
 by AM0PR10MB3523.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:155::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 09:59:00 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::bd) by AS4P190CA0020.outlook.office365.com
 (2603:10a6:20b:5d0::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 09:59:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Tue, 10 Feb 2026 09:59:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 11:00:41 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 10 Feb
 2026 10:58:58 +0100
Message-ID: <ce0fb318-34e9-41c8-9d81-babe6b8561b2@foss.st.com>
Date: Tue, 10 Feb 2026 10:58:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20260209-stm32_risab-v1-0-ef0b2b6a7e0a@foss.st.com>
 <20260209-stm32_risab-v1-3-ef0b2b6a7e0a@foss.st.com>
 <c4212679-9e39-47d0-8a53-62427e2ef7aa@kernel.org>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <c4212679-9e39-47d0-8a53-62427e2ef7aa@kernel.org>
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A62:EE_|AM0PR10MB3523:EE_
X-MS-Office365-Filtering-Correlation-Id: c2e1dd9f-4eab-4669-3c79-08de688b03cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVVpSnhUdDFvSXFaWFVIUjVjMlBTVjhvclJuT080Z3RZakFlN0Jlb1dyRy91?=
 =?utf-8?B?bk1NOFhqU2F5QXhXOG5CMElTbVBYQ0NrdEpsK3VENnN4R1FsV013Q2xjZHlK?=
 =?utf-8?B?L3Fza2N4ZHZuUFB6NklLZDZ2NFBvUklRSnV1eThMOS9MQWFwcUJKM3JobGFO?=
 =?utf-8?B?U1p1SEZQZ0JmaHZwUEtHaFNrbEhCL1VHTFFHRG96ZUdGd3JUNFF5YjBWeFZm?=
 =?utf-8?B?Nm9LZjVuRlZQT1dzLzZ0OThEM1FCemcrYWRDZWROSnVnc1JYZ0RVUWorLzNU?=
 =?utf-8?B?V1BFMXdMQ0FDV0doMlJoTHFBYlpNNjl4NDd6dFk1MWo5bW5hOGpIQTBkL3dE?=
 =?utf-8?B?NjBxQWl6Y3FTOVhoVVprZ29rcmtzVEtsSE1vRldPUXo2SnByd1pNSE4vbnhn?=
 =?utf-8?B?N1ZybzB2alI1TWpHZUozOWUrVnZDRHhKTXYzU0JEdWtxSGFucGFYNnFBUUYz?=
 =?utf-8?B?NTFYS1A2M2xJUnowN1lEY2MwSThlc1RZa1p6QVhKd1dSV0FGR3Ria0Z6TElZ?=
 =?utf-8?B?OEhNTG5sVFhFN2FKa2F2RTIyVmp3S0hLQTZhSW1uaHFRVXltRWtKcUo3RzBN?=
 =?utf-8?B?eVpGTUM1VjVmTitHUnVJNkRNUEVSQ1dnWkpjS3AzS0R2NHZPdUxsd3N6dUxa?=
 =?utf-8?B?KzJZYTRYczVpcUZTMnhRbG1Kb2syRStaVzYrZEdKRlRlSDVwODQxbStrZm05?=
 =?utf-8?B?VUJTSmQzdjdNdVVKSXJTRldHTS9pdm5XLzBQN1Q0d0kvaVQrcWJSaVQ0cWha?=
 =?utf-8?B?R0JKcHFJYTkwcm1UMGJ2M0VsVTUrTHVsMlI2VEdicGNhSEY2TURxMHo2MXZj?=
 =?utf-8?B?LzE2eXFPOGdkRjVlV1ZGZHV1QzdOM0pLdXRWdDAzWkFnclZsMm5zcHRKRjZL?=
 =?utf-8?B?NG03R3E2ODJHbi81MnR4TlNhK3hEVXVEOUZTTVJadFlzVWEzWVcyVDIxSzhu?=
 =?utf-8?B?ZmtONzBIY2pwUGF5WEsvNGxFME4yL0I3T1NRVXlzUzM1YTNrUW90dWhwc3dW?=
 =?utf-8?B?YzZjNGU1bG5oRzZ1a2xneHR4Y2p5Y3UrQ0JIUHBvNFhoeUM0czZSWW5NWFVh?=
 =?utf-8?B?Z0xOaUFpdHhFbHlTa1l6dXJIck8rRXdmS1FNNkhXd2JQRE5KZ04vVzRLWThn?=
 =?utf-8?B?bXJacEo1ZzdyQVRvWFNyN215Vm5RcjJzdHpTaU52N3R2SDc5Z1FRR2J4bkJU?=
 =?utf-8?B?Y1FoMnZMck5STFhEVkNhN0pibkNBMENZTEV3ZzJHOGsxY0NTdDllR2owQnpK?=
 =?utf-8?B?Q2J1RzlRcjAxR0t2cXlhYnJIU2VjL1NEZnJMa0ZWMFJXL2xHVGYxU1VUZlpM?=
 =?utf-8?B?NU9rV0l2TWNiRjZQUjFuZ3FQaldCQlBuRVYwQmVkR2ZObkt2dWhMbWk2NkpM?=
 =?utf-8?B?eWJwczRFYUhQd252b01SQjkxY3oyY0hOK0JvTUh6b3U1VE9ZRDlTUlVxM1NI?=
 =?utf-8?B?WWtEcVJ3aDQzazJaR1IzWTNTbkZmSjhuVnZUeDQyNyt3dVBSZE9oQ2dqc3Jk?=
 =?utf-8?B?ZlhWVy9nZm1SMXIwVXRJS0hSZU16ckUyblZ3dnd3aE00S0VWamNRRG5KOERr?=
 =?utf-8?B?U20vK01zNVZ1Z2dkY1pDbWpvc0J0OGNUMitmaTUwbnBOM0N3MGkvdmIzb2VM?=
 =?utf-8?B?Rmd5NDM0akliTmN1ZDZBRWZERkp2eEo2QTg2bjJtVC9INXhGb2R2SUY1ODFR?=
 =?utf-8?B?SjV0U1dXRHR6ZElhdWp0QWlTcjI2em9pZUZIYS9TSmpBTG1HS2MvQnovZThH?=
 =?utf-8?B?eXErZTlaV2FIay92UzZIZUx5N1NRdEFZdDA2aGJTTTdoQ0kxZVp2RHFQaHN0?=
 =?utf-8?B?cVk0dmVwMDVtU1BUL0JoK0UwZElBVzFXelFkdGFGTG5BdkpqYVgybk42dTc5?=
 =?utf-8?B?enJCd2tQM0txbzBraXhKT3VYNUJsWTBRQnZtVy9EWlJJcHdrTG12VzVKWEFY?=
 =?utf-8?B?eC96dTI1bHJQWTA3c0RpZGFFeGRxWTBYU2tsR2NsbDZzTUgwcjN1NVpCbDVR?=
 =?utf-8?B?cUxwd2lVNmJKYkpqL09KUnkwSkdrWEpMdVJNdHpFdWQ3MEdIejRVdy9HNUo0?=
 =?utf-8?B?VTN2clZjMHJmQlRaQnB5YjF5QWh6WTF5ZHNQS0tQc0h5WXN5dnVyZW9jckVh?=
 =?utf-8?B?SzU1QWhxR3Rxc2M2cnR2S2tybUx6aG1Na1RES3NCUS80VDN1TDI1eVEzV3Mw?=
 =?utf-8?B?YVVTTDFFT3ZYbFJzaFRyQW9oa0p3cFByZ1BxOGREVm5wWGlMcDhSQ1RoRkNq?=
 =?utf-8?B?cG82K3g0UGJydEEzQTBKK1lEOURBPT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pPtz7XqQ1h++4lt6j079dDBRov2CmTF0lfUnWI1uxbEg97HLi7IdvaunJea5mD87Ev3Qo12OZ8/HT+2yDt9fqpa4fqplPlNm+NGubJyk0oAAum9En2oBwnicCoWjObDEtO+mSqK7tf2UhfUro2jKFnACi4sNwEJlIJl60Qvoom70hhlt6cFtDckfaivrmIIkLjhW/XZY+c6X0mMMiV7G5aMw1PTqrrMIABMDx+mt/k/zOY19JRcE+Lg3ciC0ONM56yChcDHeEv3cw9lN/4h8fMo1X3fktVXLp2h3QG+AoYIl3T+DwICS5zs7qrQg28PWmx9MjCpk82lw2hOxXlFsE4s6toZ9uwCV/rMPYKzXevfmzOjMBaS8qTMccxu349MFwG1ruJfA+nAh9xKHb8yXpDbq34tV0VJYf6H07Ux+r0UDI/xW6eySD9Kvo6vmrfCp
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:59:00.5828 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2e1dd9f-4eab-4669-3c79-08de688b03cb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3523
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 3/7] arm64: dts: st: add RISAB1/2/3/4/5/6
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:devicetree@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,foss.st.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,foss.st.com:mid,stormreply.com:url,stormreply.com:email,st.com:email,420f0000:email,st-md-mailman.stormreply.com:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[gatien.chevallier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[foss.st.com:-];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DD16511947D
X-Rspamd-Action: no action



On 2/10/26 08:51, Krzysztof Kozlowski wrote:
> On 09/02/2026 15:59, Gatien Chevallier wrote:
>> Add RISAB1/2/3/4/5/6 nodes to the stm32mp251.dtsi device tree SoC
>> file.
> 
> And what is RISAB?
> 
>>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
>> ---
>>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 48 ++++++++++++++++++++++++++++++++++
>>   1 file changed, 48 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> index a8e6e0f77b83..e9d8338b2017 100644
>> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
>> @@ -1733,6 +1733,54 @@ pcie@0,0 {
>>   			};
>>   		};
>>   
>> +		risab1: risab@420f0000 {
> 
> It appears here as node name as well, so it must be a generic name, but
> I do not recall it in DT spec or my knowledge.
> 
> Best regards,
> Krzysztof

This will change as well.

Best regards,
Gatien

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
