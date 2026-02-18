Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO+GLg56lWl8RwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Feb 2026 09:36:30 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A606A1541FD
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Feb 2026 09:36:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64454C87EC6;
	Wed, 18 Feb 2026 08:36:30 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011045.outbound.protection.outlook.com
 [40.107.130.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 93F5EC8F275
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Feb 2026 08:36:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMYmRl2UO3ykT/g4cLXtzcASDz3qU7A5MDz88PUWaVvBY0/t72nToZNE0UcNf7wGGdXQ2p0uAoPaBZ6xNIajx56W7Ng7n8YvX+wWwQa61R2jfn5+1sEYROQ9JZtbrY8my4UNBs8fsufkNtF7QJkVCSyK1P0d1zn4k/7yOn9C5uDuUNikV5ZEb4gKp1Sg483fYnhWaS76gy2cbD8Mv/+M7v3l9mJFd5ZokBw8xacmB74WiLJOtE5PQruhzxr9uOFEKmmlq9ZqIBZs7T/aPnqQuVLYv7WJsZJCVbzvsjhCtvjj6FzKw6ZCJGbJ3tdX6X+L3GpKx8NuapeZg7LUVq134w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XO6J8iOx5cIjP1Zjl1MNHWelznWXUKNT95lAkvUwWUE=;
 b=W7XzSwHdvIMTTVrkyHzZgMbB2zB5MXLf8DRY/QFnJWZUtF/AdpgZjaDH4zOELH8jszKXRh0/aXY/kBcOPT6XjnpaPUbqOCsNxWg+sHuZbDmFmN1EcwGYbQGuCrjTaOWZTCHfYj1woOmbfpeF4NLHTDadKo5/jqyAkGC9KaQpi/7anAnUiRMD1gy416uKavaKMokRZ5dvAZBqk60sCCgi+IsLYg4DC3UFXbstvw3eApyqOBv4w/7MTJe2HglJrt7OHxNzzd2lEubrR5R7vQk84NzYeDKV9YprZYDMlylt1AQtm4OiAmJbI9Awp6wU95wxdAWAmOCjL7exoXNlVUNvrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XO6J8iOx5cIjP1Zjl1MNHWelznWXUKNT95lAkvUwWUE=;
 b=kDdSVg1Rw8rH0BtwPb01cAoKheEeg4WuDzLrBFVrlwY4svNdaLRJaUOMRcN+/OkWYdSk62p9VHco6xCjHfRWAZe/lXRzOEmQPfNYLv9uaJROR13QINH+533syqCCAUDm4jW9FkyrtgcxEeVV9DLX9kDJRsoTpAVAXauwF0WACh/yWju2MsrzF+PSuJB768gSvNZGBeQfwczupyVq7wiHJg9s7RIHamOTQ+qiaEX0MbvzNbGJU01zOJ+o9s0gO+kORnOxzEnSYs4jBk4kxoV+yPMV4VrZIcW1laEALgg/dJraNk1IH5Vs54wnrj99kv7Y/guXfpkjRDx1o5Tus5LZ0g==
Received: from AM6P194CA0070.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::47)
 by VE1PR10MB3855.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:16e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 08:36:25 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:209:84:cafe::e8) by AM6P194CA0070.outlook.office365.com
 (2603:10a6:209:84::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 08:36:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Wed, 18 Feb 2026 08:36:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 09:38:08 +0100
Received: from localhost (10.252.6.190) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 09:36:22 +0100
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Date: Wed, 18 Feb 2026 09:36:16 +0100
Message-ID: <20260218083618.67805-2-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218083618.67805-1-christophe.roullier@foss.st.com>
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.6.190]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|VE1PR10MB3855:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7b2aa4-7027-4e8e-1761-08de6ec8ccfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Su+gOWPl/HUIIfosctz8T3OVv2WsFpvDJ/dTRBj1mZm+cbfVNiNnFDgSCzSS?=
 =?us-ascii?Q?Bv6VCCJpbmUcHXEcrdlhe4QOUCzIbtsxDSK6Z8CcYAlc0u3s9B0g/JBeY0qG?=
 =?us-ascii?Q?Q+cBrLWTl8zFSdQ5GnM2N0gG2WxW4EccWpznq46/0G/SoTOYQ52zQVbyfnp2?=
 =?us-ascii?Q?rspvffOr2gXNr6WSYI1XaGvmTqtXNdGu5R9O79cXSkTVBCcEcZ5nWSk5K1Dy?=
 =?us-ascii?Q?+aKJZLg67Lem6cuob0vQqEB3lhNMqlPyOHBPIZlJCMOHGdthsLVxSB1EWGPt?=
 =?us-ascii?Q?Y2+d845PEj1bDMDpx64rxwYQVgFYMVBe6MWg9Co4aojToJN1JTsi/clLBa2H?=
 =?us-ascii?Q?X0ap9x8sTF+UHFiGiGSOrHGZF5kfwCbxKXKzGm2V77biBC2Or9GgfDUvAMfy?=
 =?us-ascii?Q?Jlk3juZMJk88UtY5QcX4yNKccrCGstPvOmTh7LPEVsfRF7OuuFH8tZyKHKa5?=
 =?us-ascii?Q?7A9siRYfU/yhQz3tdtm/9cjZOp4mKfLtCmgYSfssT3Koe8+ljlJtz+lAvLAE?=
 =?us-ascii?Q?KnOX154sqQwAbPM5rjk4+LYtK3Cyar4liLxD1YI+Jxcl8Rr0awO0CARUFo/1?=
 =?us-ascii?Q?FR03dMDz69UuaRhS62S2BsIekZBLIV+/SmXNa7iz5EsHVuFNnpMfb7lCn+GX?=
 =?us-ascii?Q?RQ62/DJ4i7w+5LciQSzPKxRKTQzxD4r2Lp4Revrws5A1aIMaG3doZXr2JwGn?=
 =?us-ascii?Q?7h/xUh1Ga6UEBj8JP5o7jJFrv5Q1/nl/yLonzK5+ZMwVZ5Ji59OFY6zyzNhk?=
 =?us-ascii?Q?IkK1U6IJHVA1D1pkAKZoOe/1ZlZ1Ui2VMuRDm1ZrbvBefoxssUcbrUSbir59?=
 =?us-ascii?Q?q2tuxr9LhpnMwcUvmIL6T3t0Td10+rksMZxDKE9KYn2SdY/S8ii6cIVk3L0n?=
 =?us-ascii?Q?PepqMdae9z6ycvzNEgu5LUb64duy9qTrOLaQsX/n9kzBLW7N2b/MyQjhInlE?=
 =?us-ascii?Q?gZkLhleQdbkh30Cj4LVErjZBZCtb1jw76LPkCtr/ay1WO/QLfGcpDy9+VfcV?=
 =?us-ascii?Q?6UcOGfTXIY39ObxTHHF41jedZcQ1Uwe3d4tpqefT0oKFyKIHJ5PAS9Suq7VQ?=
 =?us-ascii?Q?WI0ojEsTXQN5x9lPwsqr72OoJj+tFQDbQToiM8q6i6VR6ey/f3RBZbGts4qp?=
 =?us-ascii?Q?JX/AU2mS2vTGZTV13i3BCEDqoO8uemFX1gv/xGPZSjqz6QUDShLqUIPKcQmT?=
 =?us-ascii?Q?QlnC6Od9RpHslj4RzYA2XUMrtAN4SfHwZFTfng49IuQWhuD3MdN+86LcZsct?=
 =?us-ascii?Q?oEInbcYx8FmRFhpkys9H1gulCzucQWWanXI6HrTuSoTT3Wjp+jvQpBOo+DLK?=
 =?us-ascii?Q?J0WPTqIni7uWrV6skwkEmPuL7H+xaCxdyvASysfVa6ayOc6D8XIp2qZcrnZ5?=
 =?us-ascii?Q?/X49nLWGDi7lm7yJrezTYmfGv4Lm1TZS8bP0DHwb+R89h8jtdsXgIcN0zAsI?=
 =?us-ascii?Q?BI2FBtEf4koGwco94u+h1brzXESHV1JjQBoHgPfDvr+bU26aFpi6cVVUIYnx?=
 =?us-ascii?Q?fnD1d9KXRigJZVjVD0uPTHT+OMpJ/SaXmgp4Pfnkblah0UQIupo7+szHmQig?=
 =?us-ascii?Q?NgxKYnXK/ZqEqIqjGN/ffqLH3kW7lILjrmxkN/kA4DFZ1dMA3i+lfHfNrWA6?=
 =?us-ascii?Q?lFMQ2NTbrw8Gsmh8HhsXueyGRM0WH8oMLHpQ7+Jm2DR8eNHKCH1zqHGxtxgg?=
 =?us-ascii?Q?+eiMYFioC0OC27z/GLeYnyJs4yc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: B+HAabBJQrXwiB5Iza8pDlppxsq0vcNH7wX+BgRiKsi6Pl/KzUNGoQGkOMDTioFaZ0Alk3X1Bje/oUCIu8wZ9mY/s0eTUuAATIhDa0nz8Wr8iBNQOLnRlOoIIIB/IoNQ194Uc7iHKCrOmnZDe170zfhcrpDdcsJenS9lajxeO1rLDCEnxeR6OkrxQQb+m1Qk8MDMO5zl+2ff1qaWPyXsjinFx90LCUVAp7DTSwSJaSzXvoECAHwpqBq6zCrUAmMg6A6FsUBofzf9qUjieZW3li4vyaeRQC8P7RmXVlhFHk/DkZ0X7t4ML9LWOAcmHWM3xUd0RFKvg5lIWb/NqbtNYRzS4nqd2ryHaP9OH797vK6LxGE+Y++noW8mrBF+QkOnwpWDqA6ICOUyHXbu5lMiTlGR07E6WFoDmxRbLPEKxUO0LnKHRGrY04tYgoWHrk2x
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 08:36:24.4122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7b2aa4-7027-4e8e-1761-08de6ec8ccfe
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3855
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 1/3] net: stmmac: fix pinctrl management
	during suspend/resume
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:vladimir.oltean@nxp.com,m:christophe.roullier@foss.st.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A606A1541FD
X-Rspamd-Action: no action

In the deepest low power modes the pinctrl are lost and never restored
if the interface is down.
This commit makes sure that pinctrl modes are set in all the cases.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index c63099a77cc0c..067b17f03cd09 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8133,6 +8133,8 @@ int stmmac_suspend(struct device *dev)
 		ethtool_mmsv_stop(&priv->fpe_cfg.mmsv);
 
 suspend_bsp:
+	/* Select sleep pin state */
+	pinctrl_pm_select_sleep_state(dev);
 	if (priv->plat->suspend)
 		return priv->plat->suspend(dev, priv->plat->bsp_priv);
 
@@ -8194,8 +8196,11 @@ int stmmac_resume(struct device *dev)
 			return ret;
 	}
 
-	if (!netif_running(ndev))
+	if (!netif_running(ndev)) {
+		/* Select default pin state */
+		pinctrl_pm_select_default_state(priv->device);
 		return 0;
+	}
 
 	/* Power Down bit, into the PM register, is cleared
 	 * automatically as soon as a magic packet or a Wake-up frame
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
