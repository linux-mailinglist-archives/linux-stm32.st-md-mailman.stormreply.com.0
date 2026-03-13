Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP27G6rts2m4dQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 11:57:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAB8281D14
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Mar 2026 11:57:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9E13BC8F29E;
	Fri, 13 Mar 2026 10:57:45 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B9A15C8F29B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Mar 2026 10:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIMz1jh16vM4tXZpwbO7EC/XAKsnO5fzoVhAHo88+5tHVDoMLLRfcjYcyjHooVjSLGV/DNILmrfUAaXR3+i4W+yVsuyRZ0BDLGkhc6NU08Jd0z7i2jIkHgzArcgTtDE7aHBHY3pGvED9s+xA+OQ3G++SqeNKGsAUbx4na1YLezV15EVFbiRzfnAiqf/O0ImR7k2IfXZW42SdQyW6VCTd2hve5I8TKzIbiW3+Py4yEyC4PM/mylK9+cToGDHbSi3TbC3U9ew8N1qkYf2uASzmASQeWE4MIaBphGaiNp9PEVmOcskhhTs5MTAF0KE9FUr+bK2MPPmABtqRSxGQUBgPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYtLkffXcghrqEz9c92EUpXP0OAIWFAcQwu5IlJoR3k=;
 b=i7jcUoqCyXyvW136EHz6YpCU2uMwqYsGqVHS+vo5WaInbRKFtJWBaWgS+6Sst2lCFVoYCDnRtVuCUPri3svOc02kHuuC77Az3OgUYL11BQikLvmjAMMM2F4Av0NTWA9GE3M8vMOLhUEy/mstdibqLwrRcop5DOJSacYofRJ8KV5HUHLq6ejzBEwKEMuNjVLjRQY4vRMeqzSxIZobVJ3VFkUntUlCpJdqm9r5q+tKCZ6jXXaYn1kFG8qUSrOdT2XFizTfuSjaqn9GaC7KkFMwMcCy6K7gqS0MWFfx/uDzDvtAGym999Qd7KQghjf31XrVqpJ2Ibltm22mafRgMl7Npw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYtLkffXcghrqEz9c92EUpXP0OAIWFAcQwu5IlJoR3k=;
 b=k2/DjPeGhiqcBpOWezHfXwV5tJRLrNDNkS/dHPF28bREv4sXz3e5GJgsrsn5+gCbkCwx9u9YmsqIf4zlE5wXFyBdaTwYk97C15zkTh0dhSFQjN4mA6BjPsrpIrKAC3d11wcrHT0FKxLX3Qmmr6+lhXAvRuxoendxmqLHqeOrK1snf3uZFcU0OGabITTIUT2TndIL0rVM1FZhfcPUX3dKS1V32+Hg6tYcsLt3eyxy9YsDdXDO+HvrDVp6y6MFIMZWshLYUgGYK6OmAIcDtvmDzOJq0eMsrQZDlu7k/OeAKE7Ojiyaeike486NwVU5lJYGMMtl9kws7WmA5vZm/Cv0nw==
Received: from DB8P191CA0009.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::19)
 by DB8PR10MB3781.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:167::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 10:57:41 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::ed) by DB8P191CA0009.outlook.office365.com
 (2603:10a6:10:130::19) with Microsoft SMTP Server (version=TLS1_3,
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
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 10:57:40 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 13 Mar
 2026 11:59:55 +0100
Received: from localhost (10.48.87.194) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 13 Mar
 2026 11:57:39 +0100
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, <linusw@kernel.org>,
 <antonio.borneo@foss.st.com>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Date: Fri, 13 Mar 2026 11:57:17 +0100
Message-ID: <20260313105718.359614-3-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313105718.359614-1-christophe.roullier@foss.st.com>
References: <20260313105718.359614-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.87.194]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|DB8PR10MB3781:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b64024-d894-4241-12de-08de80ef5889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|36860700016|376014|82310400026|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: TvyonEfMHvLD6QHaZdcJDbEoIXj25TbuHmyOkMP4yc8PKg1aBRIVT6/PaygbMTLnrFF0z3ZlaQgJdb4eSZ1UYlxWyUwD3qdeoTTVUYTxzx07fDwgR1003xQS4gTN0qVBUM3vD0lxXjf5ySo2Qwo+1rtag62ZmQyj/aTjJnwKVSQAHfb/Ly93qv/H3H/qbM9qV6T7V3zpuTayHKXiymqKNsPJAaNo1EG1RqOE/EVkA31asChRgHzHHi4froC/2iklP5EOjAVbGShwMMinDqWcCCbhh6JV1ubmm0IdKrkXyhnU90rUU3WjDBMPKjNqEGJvXoxgjbi/V8BIezRML0gEU0ITz1/0uuhOqWBKo62h4fhagYhAmIFdEdZeOrgr//NZBoD5ecEqnUzx9X82fRUEowMSzXcLHa75kRIwTMwjsy24XG9Kg8eZKGInkiuHiixmKR6p4SMjqg0VKC9MLi0KraNCHKYe0ztqaZAItOzm8XI74e+FX96befGEumC1CDd49nG3UtW/VS95tqZBJ0RtVKMo0b5zTkfI27St+Iu/RxGLnnwOHpQpp00cfhw8+SL1145puezQZWxz3BwpkY7l71llgltbsvZres+rxYzFNtI7d3uXORvOWcx7tKhepLinwhU2Vb1XT4vVubb4aojTjnnvWIm3+TBHmz4hKcspG7B7nH9uP6TzKphdsKvsYPDJsI/l9bnvO4MtEzesLqZrS0F3vc2P6dacTFVn52v0130mlld9HzcngDxQazqI3LvnBJ87zEHtpIC0phRpQU7q8OeoNxNRETcUPEAKvk1J4OlrsSgTWjS31wk3onH+EhxT
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(36860700016)(376014)(82310400026)(921020)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ywi9gMnoGpzeyJ6dXTwf0oUMkK3KuuVPToynuZExYGJ5DHFR/MlWjuRRGLZNxGUhby6r3Es+7QDUcJda28GVwra2arXBNquQ4dxuz73yVn9fxIzfbB/JfZb9CMtjg1GU4igUljyi+jDhCm57/ld1ec8yQY23rbXdyUTad5p3cvTQkVzIfqzeH8eoQtIPNV5zcl8LllAdX5sI6LKJIQ0aQsMqhMK1HcT51+LK4+qT0KkrQZ1XxWKP/tFNZQ8RJwvGnQocABnqEUkXFCgWkadZt5PO1IADax76GqGwoZutNaCy2t0/w/Uk7HcD8+R2gY4PqA+mTrEKlNxDztEPA9d6eT5+i9H0D4+fS+fIthqbDxouoq5nwUgBuZwNEQ9zgrcyXHZLO6uGuSrZGJGSnVWTCl4Q6OBrrFOS6lpYdY8UTfiuOU1Mho36oGIVaZTY1Sms
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 10:57:40.3029 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b64024-d894-4241-12de-08de80ef5889
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3781
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH v2 2/2] net: stmmac: manage error case during
	stmmac_dvr_probe
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
X-Spamd-Result: default: False [5.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[foss.st.com:s=selector2];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[foss.st.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:linusw@kernel.org,m:antonio.borneo@foss.st.com,m:maxime.chevallier@bootlin.com,m:vladimir.oltean@nxp.com,m:christophe.roullier@foss.st.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,nxp.com];
	FORGED_SENDER(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st.com:email,st-md-mailman.stormreply.com:rdns,foss.st.com:mid];
	DKIM_TRACE(0.00)[foss.st.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[christophe.roullier@foss.st.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.935];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EBAB8281D14
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In case of error during stmmac_mdio_register, pm_runtime is not
cleaning before exit probe.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 26ac1cdc561c2..c3eaeffcb6aee 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8057,6 +8057,8 @@ static int __stmmac_dvr_probe(struct device *device,
 error_pcs_setup:
 	stmmac_mdio_unregister(ndev);
 error_mdio_register:
+	pm_runtime_put_sync(device);
+	pm_runtime_disable(device);
 	stmmac_napi_del(ndev);
 error_hw_init:
 	destroy_workqueue(priv->wq);
-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
