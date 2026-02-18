Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pT3RHA16lWnCRwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Feb 2026 09:36:29 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD461541EF
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Feb 2026 09:36:28 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38CCEC87EC6;
	Wed, 18 Feb 2026 08:36:28 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0E652C87EBD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Feb 2026 08:36:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPTrQuik0zVfTj3fWkhAnA2Ye/QippAZFxxErRVL6VWggjuAiPDzcNjrZfLWM/IdUVSDxyOFZhykTONyFUNBjSN9m+r/RSFH74c4ljAoz25Z4LiYvEqZaysUsYb/lYH6Bs8wj/BLWIsFogOFq9IMfbXdKKUhDinik2iRJB369yOS31ayn86JEwUChMe5QqBEAh6q/TLpAWnMSOa1nrymTIc+sud4GqeXZBGH7S+dENbccsRoMNpRjuWfjlJc/y4o/AGvKLG0gv5geTtoEmIjtW73D9Rim3kn3J9Ov/YT8itUjGoR6Z/aEc0iO4rnQFNskTa0r63DzW/+LHt8TJI2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFml97od/WAOLQCUZ3m8RECZA6fG672YeSsD5ZCEDvQ=;
 b=w2pGv88WKK9jmnyZ9MChR91DDPJRpTpA4Kk9bS1WBJrnT0ZmGBqeLfLs2jMZdle/4wcn/f/r0fjFf4LsP3atiWltryC3JBLgTuU5DV2Kgwf6VH53i0St9IqAGB0TRgbAV8fJNAPm/arqyDAR7hLHNRlGTmG45Ond5uAnCtqfgueVV2j1yHkE0t38B+wDTuTrvwFHBmYwcnrcTjZAOHLj4UimQD1X3hakRk3GKpeQIyc8Sm+YcnasxDGlqgX/wB0CKzlPW4z+W/koiiX11Yy0BAve3ce1MOxStLlVfzK6US5B+FcbS0OOlmTY16e+8CI7F94vtO7Kq7rMml8VgdSIlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFml97od/WAOLQCUZ3m8RECZA6fG672YeSsD5ZCEDvQ=;
 b=dK147n1Oc7unpaM0pOzcNPoB1kKjIffTDWPIQhXFYV1U+6qgqfRu3atnYCEOy/Ai4ratYdMbMNna31r+xSmgL2oJaFf0UcwspjMZOzkwFIDXc6sR9ld6b0bv/tuKSAXGcUNlCX/5vjLd47Qvsn0GfDNqOKpzb/I1h6AhBC2SW4y6hZqCr2tucCEEb28+uRlNtRgXuWUR9O/7OlUOXk0EJvnGHoHtYzcNV7LDWqeAvrJnbtTGcUubfwVdNW5CJp3U1x9YWYWw1pK+o8OZ8Mk2r4zieDBdqVRrmU/WPWlwDyhS4BlEOgnnj5xuQ5QdP/b31oUfLQPJlDLKK5dujoJMXw==
Received: from DUZPR01CA0242.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::14) by PAVPR10MB6913.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:30e::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 08:36:24 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:10:4b5:cafe::1d) by DUZPR01CA0242.outlook.office365.com
 (2603:10a6:10:4b5::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 08:36:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 18 Feb 2026 08:36:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 09:38:17 +0100
Received: from localhost (10.252.6.190) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 09:36:21 +0100
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>
Date: Wed, 18 Feb 2026 09:36:15 +0100
Message-ID: <20260218083618.67805-1-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.252.6.190]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0D:EE_|PAVPR10MB6913:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a87ee6f-c99d-4d80-d07a-08de6ec8cbbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yJEGFylffjb6nqk2VAk12CUsNHdvY91bd9jQ73g5KTSI7Oahl135ph1/4ilh?=
 =?us-ascii?Q?pOB6fsM67BL3tTxZIzYWUynlfZOfWcY2QtLTlegxy4TiFA/FMMNoh98wNqDk?=
 =?us-ascii?Q?4gMI0EJ6AO3MBL8G/1x5xE98MQBow9lniPLeFzKTpCzZfxW8q8IFeK26+dfg?=
 =?us-ascii?Q?uNoVbdkN13HzONWEInVpOx2nQG/Ov/kcd3sios1b8PjOBqEJO/VAaVzOo44/?=
 =?us-ascii?Q?GqK37uf1aFg2oomRLxTGhkzT37Ej3yo/oPbba6wwaF2juDlPayGdR+uFwOz5?=
 =?us-ascii?Q?dZMqKELU06PTxRFAsVZ3YxCfDbBzRICWe0EAG0CivuF3GpsxBoUEeCVNbcO2?=
 =?us-ascii?Q?KLQDgpzjMJFMp+9EzfDWrH4edQhlWuwVRhp+F5YuvOsBJT+8J6dIPVOM8dM8?=
 =?us-ascii?Q?63FxEvuxZyAzJ3Z0zgAoy8VmIwpJ43xoGgA4aHXIWWJ3NKh0ELmHNfnxrN7g?=
 =?us-ascii?Q?L6eKltAgmmTTthUFNBVOBdftS3JZ+hnHP8Z1zSbcQWW5lKv3LCEccrlqwlvJ?=
 =?us-ascii?Q?q5SbcTgM/ICAaYPm5/kjaZV51h6pBTATL+0Trvsos4AFexZgBKYsliA8LY7J?=
 =?us-ascii?Q?lsDbjoYU8XZ3DQTuJEWOwTRN+bsXKk/mkmF85anY9zJ//hb0sXR3eC2oULAs?=
 =?us-ascii?Q?Tji2F3a/uLkEsIJWoP7pWgg2A3ZUUiCS/hlVQTig0YArLOcZw8mP8Ujmg9Qy?=
 =?us-ascii?Q?swBNq5dsb43AzZfVAv7e/xuhQjGh3sZm/Iep7gthJ4LFSLr15EPuO1TO5JcX?=
 =?us-ascii?Q?+vZCesE16uaUsb37a1ps0baCNr4dEYH+HJU/JgAb8/GRgSoVMo97d2HyfpNV?=
 =?us-ascii?Q?0WYYImjU0qXCTOC0bFHxNAVRZLDHj2rF7unn62aL5go2dOwkJDKfiPV9gOAf?=
 =?us-ascii?Q?DnkftasYU4gkSRBfP+ca5jNCAiIHRhmdGXS/pqUm3G0BbJg8ljsnOWpabBUQ?=
 =?us-ascii?Q?/Fs+0LzXXH2u+hmCAg6AuHUBBMmS7nG3Y64d7pGYVWvyU98MUH6MgbCxL1Tf?=
 =?us-ascii?Q?+vogW3MaijqEQpEQHCupgtJntFGN5zwVhhyjJqHZXk0BGOjMu5LGfReqWSmU?=
 =?us-ascii?Q?toZDic1/u2REt7PvvoO3rt+9bvim8y24tmGTojmg7iLh/dVv6UokiyO7xXDV?=
 =?us-ascii?Q?xc31oSfWtwTAZpmWT9iGi+2BcAe5m6+KZAqTpKWTKpBs+Ulxr67TbEvEL35o?=
 =?us-ascii?Q?xpYDV4ghz5q/n7Cb9jv5x6X10RAaV7iV9Iu0X3sja37AM3KJ8dosMy3zuKmF?=
 =?us-ascii?Q?p1AZ9oRsRUWhV9FV84MYkEYTx4CFdtZyNqIfHrrkjD0BqUyHRWlGjW0la5NS?=
 =?us-ascii?Q?16RuE9V7TbIABJrBKce3Xh0AXdVfKr5Imkm2+4AuZDpCwtdkyUpoqDhvlUof?=
 =?us-ascii?Q?zxY+z6OWU40vUGJhTb5W62yis99YcroOSc2xiLSVOZ6/N80cLjX6ix8ioqTa?=
 =?us-ascii?Q?vLS268fEtTR2T3q5TcyMDIRi58aNCJSC+jXZUjpCj05ewVHfAtE4hrEoIu65?=
 =?us-ascii?Q?JEJEBgAjn/AYZ+Np09ylB5+N/+0Ff9K4YdSzbfzciKzKq2WKB5Jd/KcB0+LB?=
 =?us-ascii?Q?3fGh//++K/FO1i2LHLGpCAhEfkVOTKoQIa9t+WCDXH/oGUnD6o2Ehb6V4j9v?=
 =?us-ascii?Q?jbVnmIUvsP2W/4rqxsvYrxXzAYlSMWaXc+bmDZdP0vkYI2auRqN4lYbPUWam?=
 =?us-ascii?Q?Cu4Nyw=3D=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yuvMJcPDJpegkIkfssyEYL6lCTzZ4bukeA0gXRKH1M+a2j6N4Zjh//17RIiBjPmOMRWFWiWc6h3z6O6N9Nj2ul66V5BA5up3Drd2DbzmhCKwyd2hsJK0Q/cX+ShT6r8jDZry1gjmlL9vKsXSZPsvA0156Fha7wLgzrMZ5zdSWZnKMuUU11E7+hY+fUfUlPTDjJSSz47SLJ95HWVwXvT/NKTiLfPs9Wsdct14F0MFi0CUNKGpSD5ipFKi0C0F7CphJP+JZnv8rQBxVBRy52SbVNaoGN8ehbd1w14q9t9AdAGXeSxvjnYC43zgR2R2shASx3Di7hp/8pHrG96LfoK8EUv4W87DgJ2FKgy5ZlsJ+Lsd+x4Rikzl+ss/ZPeKQH1ufnw8BHbZq+m6eJJp4qHIenpXTrFM3TZCTjz0OE1JHeqzlLJNYncYPKxQwbjmCF2c
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 08:36:22.2712 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a87ee6f-c99d-4d80-d07a-08de6ec8cbbc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6913
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH 0/3] Fixes for stmmac driver
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
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
X-Rspamd-Queue-Id: DFD461541EF
X-Rspamd-Action: no action

First commit fix error when :
1 - Deactivated eth0 (ip link set eth0 down)
2 - Perform low power procedure
3 - Reactivate eth0 (ip link set eth0 up)
=> eth0: stmmac_hw_setup: DMA engine initialization failed
         stm32-dwmac 5800a000.ethernet eth0: stmmac_open: Hw setup failed

Second commit fix error when ethernet driver is unbind,
ethernet pinouts always set.

Third commit fix bad cleaning when error during stmmac_mdio_register.

Christophe Roullier (3):
  net: stmmac: fix pinctrl management during suspend/resume
  net: stmmac: restore pinctrl when driver remove.
  net: stmmac: manage error case during stmmac_dvr_probe

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

-- 
2.43.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
