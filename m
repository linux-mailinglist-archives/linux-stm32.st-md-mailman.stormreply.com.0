Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J62Fqrts2m4dQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 11:57:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E942E281D13
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 11:57:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8EB47C8F29C;
	Fri, 13 Mar 2026 10:57:45 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 393C8C8F29B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 10:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DrP6BSL+TlpZ65ZNPWdrXI5Npj175rj3GzU4v2tdrFEfZCeJ3u3Fc4qO79qeHWXWRecUhFER898rQcOLcJpuj0k+ao3jgX6nDEFOA41JS4S++kLm9+WfGiw+sMpa8UBN3U7XSVzis0nY8eUZJuqV565x4n7ezojhOIqnKh94hFyGdLKZElDX1GEdt1OFSQww6OHWv1YRSNalJqAAzQ+9nowitJkycujZTapdHGP6jqTfG5ri9wC7cntKMG5iCCa33GZ7Xkqua5DHCEEOtYOQORNZgykAhVde006FLCkVr5OqVE2U8dbm2+Y+/95b9lPzU0knQwcMt1p6rtfU/uTB8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGQpx+AJllAdYpO+If5LgpzDRd1knbEJnsP2b/jmHxQ=;
 b=jLRcpSjGaGRa9wM9RDZNMAv2M5DyK71H1haqAkIAuf5o5ir+BValVvcISKH1iAJ+3+SYaJYRrqTKFUdxHpH1zi7TFGbrJXhQdLLAVR52//KG6GiGQTyzUvSkTP907CyelmKg1Sujx4rO5MzqPAixT3wRodnYoZJCM/2pCd+mPa6SHRZwLYFOW+1XakJc++yS2+Twfk3XGGseISTvhtNcJP3nvZuqBqyW/NnUtIbjzxhNo9CboIs66MdgoGGytO9cIOl2risVj6wN3RNPb8DbdThTfhdCHS5bFeLcVwSQngJsVuExINFye8gYOb/k1eC3j/vzKD0CvdjbHPth3gSvAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TGQpx+AJllAdYpO+If5LgpzDRd1knbEJnsP2b/jmHxQ=;
 b=mpmXzv0DkQfyrKa/Fp7Fzf5sRm7fj7VF/Am8aEgfVsHRVsL9UfGMHeWuYeRO+rxYalqDpEQ2ye+bntm5VQitw1/H4QfccKcfWByCEHXG6YMbYW4McSJfEaOuLSDBtiN2nN8aUKs2VpkAxlf7Pi0QolAb5PgN3wFb4ldd3kV/IrV0uj8gb/91fmcDGiHWbnGnyZLEWhB+BjwLCq5F9iJOVerUFwjhFbB6jdZXmkg2S+fjOGFlDa+YZwZ7GZt9v4m5kj3vOhnjuN7B7OBISDRFGuXCDpf1eWlu0GZSLcBYd0W18B29Ihj/ejVq2gHYTXXT+J/iSn1ZLZabU8EzH3hItA==
Received: from DB8P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::29)
 by AM7PR10MB3159.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:10a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 10:57:40 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::29) by DB8P191CA0019.outlook.office365.com
 (2603:10a6:10:130::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.27 via Frontend Transport; Fri,
 13 Mar 2026 10:57:39 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 10:57:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 13 Mar
 2026 11:59:54 +0100
Received: from localhost (10.48.87.194) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 13 Mar
 2026 11:57:38 +0100
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, <linusw@kernel.org>,
 <antonio.borneo@foss.st.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Date: Fri, 13 Mar 2026 11:57:15 +0100
Message-ID: <20260313105718.359614-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.48.87.194]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|AM7PR10MB3159:EE_
X-MS-Office365-Filtering-Correlation-Id: a88ba5a4-722a-483d-4061-08de80ef57a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|7416014|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: ln6eSKLWpkC6Xk6yVUZhcWlsu3PMSHb2SBCBGBesEthiUflMkW7u2ZNqh6c6t07VBDSNbkG66S5J5EniyYx0daoMyDHiBuV+wBnAq9lqc1+1R5A6SPCOcK8+JKCkpauCOeCd0me39NP2wIV1pNg7unC+Xg3C2PKEsDDE1KU6ApLwH3LepTMEk/XQMtislUcIzgARaC8dTvWOMlqACxDAF+x/qHd0qeGmCb+nGuBl2XXKVOKIFqspJpoTLGtdZoJurhqZ/cqr4ZsAq9Bvz1g7m7S74pituGR9/wM3AqAdasMgbvFisMWXeUlwB3Z+qrvQHVwNLa9Wv32niiSvYni8ATOLdDvxA00jSJk81EhE4F71AKnIVueZKvXSQIvfk78ZOc5NuuILO1CtUtIVEssVtkvIchdHQY2wdw09i/LyzhvRcogYnw4KBkfPNbyerfytJ6n9sh0XCjwOw2Hx5X2P89NAnzxTzT4DXHVIVevrgex3Ohei33O7X+Fz0rUS2yt7FmkcykJobm1gyUqg6M5y84htJy2FzhbnW6uZaKYbEoZfV9P3bcfynKRevbbk5MT/h2E9fxsDeQa44O5JfKGgVJdRYg5rJ7ZSwMs3l/TvIMjiUOWgc9NOjb8FBX4TYPBt9gif2TTgYaQNbkmbTOyRI597x0npiPdlHWiVEgpP+6GjiqgBUTCzIZcz8HR0kbNQBfNyuKIqShnIGxr8PHukq9ZT6y5sDxkv6NzVtVWGwSRK1Ry1APDUD5VJKie8upl0oANlOUeTzGzoSdI4Mwuks+KgRzICAwbZvR2YSF19nCt7j0ABHS1ZAbdY+2nGYKH5
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(7416014)(921020)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nOOcSDqhZdurerV5KiA1Cj19yUYeZZASr+rxZWp0WsEHwqGlrtsuTP7FFm6qa3GY3vl4H53oUk5MnnhwHRlTJ3K9IipRppADGtBx6jB+c2ANws4CWV4y27wKOHCebkJ2/dznyRfkhBJI9kqQ4ekJsWJIhvQ21vdhzOMLvvz6DgHFO5opVVIqeG1kJX8v2mRYetl274ungG/lLDcdm3RI6xiqJkFS/I2p6Dj3ma7RRHuzr8BTWbuwOYNjwgGZkOpu0mZcBtNxZawWibNhjqcXYS7dTbipoKxtjuyz9nvsgYTv9oGLJujn4pDu8pxPck3vrSH7QuFW7Igy1yvhksLQpvkFE0UMuQJ01uuPOcJL4YZAyVQ/dwcPSSH1fwMJbkBecTO87Y6k70zowTUBsmKRttt7r2OJ3Sta8sfSO4xkciduzv5cJfvoRh350kAuaL4u
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 10:57:38.7989 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a88ba5a4-722a-483d-4061-08de80ef57a4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3159
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 0/2] Fixes for stmmac driver
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
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:linusw@kernel.org,m:antonio.borneo@foss.st.com,m:maxime.chevallier@bootlin.com,m:vladimir.oltean@nxp.com,m:christophe.roullier@foss.st.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,nxp.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.936];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E942E281D13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rmlyc3QgY29tbWl0IGZpeCBlcnJvciB3aGVuIDoKMSAtIERlYWN0aXZhdGVkIGV0aDAgKGlwIGxp
bmsgc2V0IGV0aDAgZG93bikKMiAtIFBlcmZvcm0gbG93IHBvd2VyIHByb2NlZHVyZQozIC0gUmVh
Y3RpdmF0ZSBldGgwIChpcCBsaW5rIHNldCBldGgwIHVwKQo9PiBldGgwOiBzdG1tYWNfaHdfc2V0
dXA6IERNQSBlbmdpbmUgaW5pdGlhbGl6YXRpb24gZmFpbGVkCiAgICAgICAgIHN0bTMyLWR3bWFj
IDU4MDBhMDAwLmV0aGVybmV0IGV0aDA6IHN0bW1hY19vcGVuOiBIdyBzZXR1cCBmYWlsZWQKClNl
Y29uZCBjb21taXQgZml4IGJhZCBjbGVhbmluZyB3aGVuIGVycm9yIGR1cmluZyBzdG1tYWNfbWRp
b19yZWdpc3Rlci4KClYyOiAtIHB1dCBSZXZpZXdlZC1ieSBmcm9tIFJ1c3NlbGwgZm9yIHNlY29u
ZCBjb21taXQuCiAgICAtIHVwZGF0ZSBmaXJzdCBjb21taXQgd2l0aCBSdXNzZWxsJ3JlbWFyay4K
ICAgIC0gRHJvcHBlZCB0aGUgdGhpcmQgcGF0Y2ggZnJvbSB2MS4gSXQgcmVxdWlyZXMgYWRkaXRp
b25hbCB3b3JrIG9uIHRoZQogICAgICBwaW5jdHJsIGZyYW1ld29yayB0byBhZGQgYSBuZXcgc3Rh
dGUsIGFuZCBJIGRvbuKAmXQgd2FudCB0aGlzIHRvCiAgICAgIGJsb2NrIHRoZSBvdGhlciB0d28g
cGF0Y2hlcy4KICAgICAgSSBkbyBub3QgaW50ZW5kIHRvIGRyb3AgdGhpcyBjaGFuZ2U7IEkgd2ls
bCBmb2xsb3cgdXAgb24gaXQgaW4gYQogICAgICBzZXBhcmF0ZSB0aHJlYWQgdG9nZXRoZXIgd2l0
aCBBbnRvbmlvIEJvcm5lby4KCkNocmlzdG9waGUgUm91bGxpZXIgKDIpOgogIG5ldDogc3RtbWFj
OiBmaXggcGluY3RybCBtYW5hZ2VtZW50IGR1cmluZyBzdXNwZW5kL3Jlc3VtZQogIG5ldDogc3Rt
bWFjOiBtYW5hZ2UgZXJyb3IgY2FzZSBkdXJpbmcgc3RtbWFjX2R2cl9wcm9iZQoKIGRyaXZlcnMv
bmV0L2V0aGVybmV0L3N0bWljcm8vc3RtbWFjL3N0bW1hY19tYWluLmMgfCAxMiArKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKLS0g
CjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlz
dGluZm8vbGludXgtc3RtMzIK
