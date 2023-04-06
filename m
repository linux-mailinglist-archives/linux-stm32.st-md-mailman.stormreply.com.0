Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8558D6D9764
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Apr 2023 14:54:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 401C5C6A61D;
	Thu,  6 Apr 2023 12:54:33 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2052.outbound.protection.outlook.com [40.107.22.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED368C6A603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Apr 2023 12:54:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0iK6/Pa18XanQqYQhIwyI+EtY4Ka5TO72yhPTxYj+HtcaU8cs8hxrBuDNn7EIL8BKzOn910IdNIOzHmtmOaQ+FcyT5u/EMCLmy5ix7hC+s98QUrvs6sCgckXBY/bEnK710wthj1pUH9w+iLbaDFV1lEHnw7YARZOg56CBkRHlg9S7D74GbKdnsNkpltt66hZzKK2TftNWvV5fosePKvWIRfwdPWRkdZ6boAHdRkGAb+avO3t8O3flmw4nY5w83KBlHlzmiWdEcun6PNJB2wU/bQHiS4dTVQk7MllQQZ4f4h6qKP+i3dhQtT2wEIlAmUkTmVwoPc1qW+RRTDEaNotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnggLfUK1aetOJPiArlmCxjfN1eTCYhSJDWulsNRPd4=;
 b=oF4OgFiRztjeNxXMGW0dxm+UV8C/0UoP1mkdN48FpYTjpTRNZ5siVf8tejh4eSKKtbSvvo3Ja8M4Jp4mUiZV72ZfEbVDpZv6SSsyIqFpqdJyuaYR6jd6yLtVXw8E7jHz8vTtlWgXowvqNuTrLGdUA/4WNmhS+bGiF+i3RjI+xCM2WZ3JFBMCHfVyiiuyC4f7kS+3BkXbhbFUj8jH9SZsWODX3Jf4lhIwAcuhc7cgMBNQnwtQ8mhRETo3UJ5jIoLAvPPfFWJ8rlFBu/RioJhPz2Fh2vLDwM1ZubyKYek8ZysiER5BzPS0/noJqq+//hDHob7tJoTTQHEQjj+0JuPG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnggLfUK1aetOJPiArlmCxjfN1eTCYhSJDWulsNRPd4=;
 b=C2m22m91dk/gs0EwsHmxT6JLm+LCLNJuz9WxKOud3/M70KmQRCOXFyjzs7PoUDjDVjx3MazZ4I1v0TXFXkk6O2yV49Faml7GAw9w0R8uNvxNpGuvY9w6+F5Fj4jkR4xOPa3nNJe3ln0K4w8p4kWwKgw7RIWsg8nK1X20mjEyLAU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB6459.eurprd04.prod.outlook.com (2603:10a6:10:103::19)
 by AS8PR04MB8500.eurprd04.prod.outlook.com (2603:10a6:20b:343::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Thu, 6 Apr
 2023 12:54:30 +0000
Received: from DB8PR04MB6459.eurprd04.prod.outlook.com
 ([fe80::e555:cc9e:b278:15d9]) by DB8PR04MB6459.eurprd04.prod.outlook.com
 ([fe80::e555:cc9e:b278:15d9%7]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 12:54:30 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Date: Thu,  6 Apr 2023 15:54:12 +0300
Message-Id: <20230406125412.48790-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: FR2P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::9) To DB8PR04MB6459.eurprd04.prod.outlook.com
 (2603:10a6:10:103::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB6459:EE_|AS8PR04MB8500:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f028e5a-4050-4703-7338-08db369e1010
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8TXPyG+KigxHwN+zh0ewbf5ds0vjpVjD46eUDcl2SsRWbCS0TuOMnlyx+TQIy2bUFfNV092TVZ6dw9fiGn6L+zxx/V39lTv8qeRQAb8+dg9Wj5G6toOFAqzVTmVnjLNxssHxdFd0oR+vr5kIfMmOR+Ceh8XnPfQjFse9Pjx+pAHr3ViNTrG/TuuDX4zq5ppJw4HrstngbOiD+HKY+vGPmJ1uiNwyaZWb4NS/sUcK2858HdEAZOm6Be4fKe4F5p7PwRglpkSDvH7fKA44Zoh3k49Ib6OXZHxphUhN5U2aX7CzeTa3Ath1UE7KU4x83wtvYGE7R8nU2MW/WDgMDCiX3lWBtg1juTf+QU/waRlKxDdr0eW008OfUBSi2KKNyMBU4drr+o5hDZt+n6u16ycLtEzCmI2I5DkCB5PARk2CoLnlsZsK5AanfSW5mJkBQz/YQMTzq5HWL2IaBhyzMJxrn7HCHDI2xD0xIXuj5v0oSg0bmMYsShtNrKtyooDER3hDrPxKyVqcN45auPxC2OWjnlKGaVtDx3+tYTvfjSn4KO0lmP4SQfK9nbmlXIDIbDRW728tEOMt9FrikwAH8BJFbbg0oH6T0V1OjTT5SpOB04ZjWtaRINDpEQItrO7cGDMz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB6459.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(396003)(366004)(136003)(346002)(451199021)(38100700002)(86362001)(36756003)(38350700002)(54906003)(6486002)(52116002)(478600001)(2616005)(186003)(6512007)(26005)(6506007)(1076003)(41300700001)(66476007)(66556008)(66946007)(5660300002)(316002)(4326008)(6916009)(7416002)(8936002)(83380400001)(6666004)(2906002)(44832011)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PmKE66k0oYnlRd3Nlci7YDjfvzh73vpX2lNUwD/2rluwKlO1F+y5pfIFNyyK?=
 =?us-ascii?Q?i201bRlPERdMQ2o6MX6tZySBYvrFovTLZTdnbVGzCnoi3CdA/G4h0CSoGMMh?=
 =?us-ascii?Q?+y9wuWzyJZ9Pmq7VhCpOV1yRjWjoQtgmR20nr1etK2WqLmorUsZx5wRGzW7U?=
 =?us-ascii?Q?hu450Y9tKVG3sP8icvbHh+VayVKv8TG7fpdMzhnzp7IYlAUHHa21Z1hZYrIr?=
 =?us-ascii?Q?9ylTXfoOqedbNhH/E/fzbCoTxgue0BYH7ISBcRwr75Qg1tDGfG2QJk54dd1X?=
 =?us-ascii?Q?UcUfqAhCefrUxGWfxPXDZeQZaEjhurQpAEPFY6g/AeFPF6PbTFExs5jbFfVz?=
 =?us-ascii?Q?HcdPdCwySnwRHB3pOGrNJ0rPTd9heQHEbM2DLk7fqqsLpfbJmXr4VFbyTL+4?=
 =?us-ascii?Q?sLdq2TB8KC/2IF31jYidq1Zd1ngL+NyOsAn9SFcvIlVxMRqBOTwidTho/2oa?=
 =?us-ascii?Q?kk3rmZhT3kmnKnt4RbiruQgmTtPHvf6KnR6HBLnicfN0CA45QdoB47w98li1?=
 =?us-ascii?Q?TH+PbhIsOEmeir4EAmrNyBNqmWJOO84BepoL1v+Lww3Sw7+1uv5LL3KZ3f1w?=
 =?us-ascii?Q?7wGROkfwtnDiehOXgzXQqnZZTC689b+BYoXCiaTIXYscLX5izS64bNQUJL8D?=
 =?us-ascii?Q?bDTJTi74r9rp8brJ/bAcCyZb37EYKuDkLf9z73T2tHA9hqwVM4i+GNRxhuWc?=
 =?us-ascii?Q?tHRPqA0Wtp5bUV1Qnz1jn818HRq3C51dJeLWGHPn/e7lQ6ke5/W+DxIUPFFK?=
 =?us-ascii?Q?gS72lmVN7tvR2SNKx3QtwAkQo8B5Jru5AfL3ZI6vRzzZSyJFCz9JCAM3EpJx?=
 =?us-ascii?Q?lXJ+WEfG7efDgmpP7rLEqSIvAX7o2d/5rxA3Amp/RWy0QGj9Ti36macKqBh+?=
 =?us-ascii?Q?D/RAdYa51jHL/vk9+8VWIGO+JomB6GFakrLDGF8bBRDOGdmeGCTCmvJYW49w?=
 =?us-ascii?Q?fmhejv+56bAH4wDy0pscAMU3qXlPE3fa4wpz3V/J8pIwu6syNiLD2uC0VImz?=
 =?us-ascii?Q?gq5ULDuL64TMP0CpsyEezIa8QxH2O+dgLqM9kMN8Qo81Q12ZPX4F53pkZn8w?=
 =?us-ascii?Q?FUKM9pN9jTF9Lzn1FzZXZw3v1yhNGxdaBq0UVkeYjlKq+oWKpmRxibOeAZbZ?=
 =?us-ascii?Q?cRlo67r5KdxpK3EFVwQTogNkp7O88fAN5e0jjReiWiB3xJLYPNdDIMt77N+W?=
 =?us-ascii?Q?xJQvEGSo5W277N992U4XBuwxW40y6NRYXMryxwWex291HIv6J62nyMzaIRWA?=
 =?us-ascii?Q?Gyy1nJVXLA5m9LIb4jfJHX/q63K//11neHwB/++85WYjGV4Z2hFscISK19mz?=
 =?us-ascii?Q?agnwfRS0kXo/e28jdQL5wIXLYIJHZefuF9mkLLQ0iaHcz+yfr99L99KoHVo2?=
 =?us-ascii?Q?cewhnEEDKfDRCQfKvN4M2TNHvJ2DbftbOMzPV5eRiJcgmQnPaRItes/fRj59?=
 =?us-ascii?Q?n+pNRT4r/SC/9NM13DAix0z4NHQP2X60c2AuDIOopLfk5J3eX5uArM8pDQ2T?=
 =?us-ascii?Q?aLtRDok+/OfOVviGf2U8E1eQhNwhPN3oMtx6KDIJucSbYiCDk1+fCEZvUSnw?=
 =?us-ascii?Q?9aboDDTTKfnnaO1fTXMItCRbTO6fsoQXx52SWcM1NW7GYH76Nr2vZprsAH2G?=
 =?us-ascii?Q?Cg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f028e5a-4050-4703-7338-08db369e1010
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 12:54:30.7783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HX8fKBsKhsX+daNVG9a8B6ftuI4wy885h01mbwhgvIlvNjllc9bjaoOzDCpU2lBl/lHls5fDHOvorfyVRoDI7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8500
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: [Linux-stm32] [PATCH net-next] net: stmmac: remove set but unused
	mask in stmmac_ethtool_set_link_ksettings()
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

This was never used since the commit that added it - e58bb43f5e43
("stmmac: initial support to manage pcs modes").

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
index 35c8dd92d369..2ae73ab842d4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
@@ -393,19 +393,10 @@ stmmac_ethtool_set_link_ksettings(struct net_device *dev,
 
 	if (priv->hw->pcs & STMMAC_PCS_RGMII ||
 	    priv->hw->pcs & STMMAC_PCS_SGMII) {
-		u32 mask = ADVERTISED_Autoneg | ADVERTISED_Pause;
-
 		/* Only support ANE */
 		if (cmd->base.autoneg != AUTONEG_ENABLE)
 			return -EINVAL;
 
-		mask &= (ADVERTISED_1000baseT_Half |
-			ADVERTISED_1000baseT_Full |
-			ADVERTISED_100baseT_Half |
-			ADVERTISED_100baseT_Full |
-			ADVERTISED_10baseT_Half |
-			ADVERTISED_10baseT_Full);
-
 		mutex_lock(&priv->lock);
 		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, priv->hw->ps, 0);
 		mutex_unlock(&priv->lock);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
