Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA675FAC47
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 08:12:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D10FBC6504A;
	Tue, 11 Oct 2022 06:12:05 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2056.outbound.protection.outlook.com [40.107.105.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE2D7C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Oct 2022 20:48:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2KpbApWShG2RHiLTtzZHU0+WRckxO9HhSEYZ6bIgz6nDMWlgHUfnbg/gH1xU9NxPJD6ySB4HvnKnu2uH9DMZCnONbFaf1QB/cPJg9v+gLnuclz45rN77jNK/1JUI6wkekME19suEy24LQZdmBmbeAPDf0d+4ngpxoHnNlVfuKewZEwaRRSAeiSsTC1PqTw8HOksWtiHw7FxVnJWOR94Qlb0gryJV1WbAeh/mqoURnWehKlzACARQKDW7GISUsY6dqq8F0kfBrJXXiWcI+OBfEypY8qsQQXDQo8xan4VnZX9Ebvxg7k5HV88SoKyyCkn8930d1chEhgUGrxtBgUo9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ziL0ZJdG3/BSd2EePcpwNj1CvB27Ws5/zYaQ0SfMR0=;
 b=hueWPzpeljzxUz5YX6YH9SvRSjkk/ETGDP1OUz0EXm1v4qSCAFt22NSVZ2cVJHGY8e4aqWFigU+Dnkq51NkTUQ6/STConr9XC7ak59TIzbvplUosvPitxtPnTlBHyZRJsEhUnFj+JinJa4ghBQOophb0DKhu+Rd0zYrjeJ+F1VIuuIFb7+yQ9yZrjAwNCI9vNo9AHJIG3qH6x3vuFSCTJveszHE0YfegUtrrNmX/QYXlTtFWvPHUtKH5n5tY9VUO+WnmsIYE4yR/+MWpwP14KQfC+3Z3uHjkDmMovCQCJKP9SNJymMoEvLo3lgVn7IYjqRKzBAGkZQTvZWWO2bf4hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ziL0ZJdG3/BSd2EePcpwNj1CvB27Ws5/zYaQ0SfMR0=;
 b=JwRngmtCWFQoxpcq8SwgCBW6YME55kQqu0A/GfuUQBY8BSO2QKxnZf9mKwAWAIn+Oy9TQuqR4UrIEPEaby3rzs4e9n1ruvX8YvEQ5gYquMEhzFyplyxq1BP4niYR53gkcvSTbwn0kbfAd21wwX99F92CXeX3orqFMUawHnk6J6c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8686.eurprd04.prod.outlook.com (2603:10a6:102:21d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 20:48:59 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563%5]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 20:48:58 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Date: Mon, 10 Oct 2022 15:48:26 -0500
Message-Id: <20221010204827.153296-2-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010204827.153296-1-shenwei.wang@nxp.com>
References: <20221010204827.153296-1-shenwei.wang@nxp.com>
X-ClientProxiedBy: BY5PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:a03:167::23) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PAXPR04MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: fc4e12ba-dca9-4371-ccd4-08daab00dae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0bdkiT9APHqdTfq701pizcwJvIh82wFS/XeUKVX4dAmSfSEQIf43JRRiLgo1j8GWGvRLZ9hW/eXXJjgtEi8xatMBKKRSjSEHNu7MwR1FS9ug+QC3MhA90VAys0220amteGmvkzqnU9mwVN5WwGyzHqDPZDSI3NmXdSgmTlBeFRHKFYNCDyKUNM42F8P+Y6qkG5qyjuynAqE+QXKVIajnwfF2ItWyc7fwvUy4PSvT0S5xxfaa/p8GWG1s1pSor038tnSiFrJvKv0zu64YEA6h3oKzX4b0r0l58Y9eueeRIOw6S6eNibCEPAgMUxr8BaYL5cwn9DXGQkQ2hgaj3uypqCLeIE0d4VAD6K4R0EJllIev/D1WmCjLkalLYZ1q+jMZQbHgTA6O30hjzkD/kKBhNwaRDUd/CZywfmjrLjpfZt6rD4qhgmXYZpNvVdjMGkdvp0lM/RuYtj0xc7dgfU1s4NuU77IRORwYkbBMKlb2he54Yj3ZTFc4n5BZV/0k6D/mHUn79k1ZEB8OLvo/9Tz32n9gxrQgzRzz7M8D4epDEkqTj/azz2rHtWGzDexg6GpVBQw3E+hrpHZFTZ0h+aB1hdvXulTpM2qXaTdPqGQQApDIRiv5a9x76EawrapjsmU20QmOSMB428uCPshoblycWhj0s35eFU8FOUDT9uZ2FmXhuLTN4z9vD/Nb3L2mdfGzjCePtsG61sfR/vNg1nigpM1s5TEuLz0jxo/d2D+aCqDY5fdjr8+pXOx1uDw4hLRhgRrWd9XrrqheDAVo80ZZlg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199015)(66476007)(36756003)(38100700002)(66556008)(38350700002)(4326008)(66946007)(316002)(86362001)(8676002)(54906003)(2906002)(7416002)(6512007)(41300700001)(44832011)(5660300002)(8936002)(110136005)(186003)(83380400001)(1076003)(6486002)(2616005)(6666004)(478600001)(55236004)(26005)(52116002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bG/rXRBNuYMsOBH1JgCky1U0HH62/aBNW/r85hebB9yn0JAz2kABAmCoWSE7?=
 =?us-ascii?Q?fDDZeeJt9qKqQq8RgTTcKNQAHVvoJH1yPT3gRidbvE6LLdSthur8qB9ZRRFm?=
 =?us-ascii?Q?GTaiHKgUmqG942Y4ezc2QFbnXXDRMeu4PRds0db61COc+KtxNgVOxpoLarBd?=
 =?us-ascii?Q?bebOtIjVkSfblQ8ZIRCfDbITO/MYsWPb30dNU0tKpfGZju3myMS1PWJwggv8?=
 =?us-ascii?Q?IFws5PIBYNuusnqdGzjY0UGtbAINwwHmuYBS1051+lZMIv81JXDDpTzLxehl?=
 =?us-ascii?Q?Gln2UQSD0gOonn1SMBblpCK5SAs+IsxrdG3fXZe4aOrJE3tfolsNHuVWUQ4a?=
 =?us-ascii?Q?Ex3tDl8snVyYpXNB62qoq3oTJpvLDDaZlfzwRSrSn1YcUCXkSIo1cEEUuBh6?=
 =?us-ascii?Q?+mtIT0POUQrhF4g3FVrBM0LafoB0PRKi94erDAgr69WZKJ6ugJtp8Rr1eoVQ?=
 =?us-ascii?Q?avfpc6M4G987UGGB80hTwt5Q+nGvjDMkaiz/2Dzu4cpwjI1XFZd9WvLAK9ey?=
 =?us-ascii?Q?yWBRJ15kEa2vfCGFskJVTKNJZbDrlEk04NYAO8en4TzK+hC62SaZydkejVvq?=
 =?us-ascii?Q?fzdFJdYIHRjLAEvsspTZNh3l5nahjb4ENqXabwTJ0r6XWqVDRTd+PTDw2C2y?=
 =?us-ascii?Q?fEkq369WLe0r6Wg/JUQUzZ29ZZLvW8vXAW86B5sCmnEkuCjgRJapfZJmDYHn?=
 =?us-ascii?Q?NCq2lvSTTCBve3Y8SuAIXsCKXHjYfmIPpsjEeXFkc5FUrwSbwcBtl5tdPO0w?=
 =?us-ascii?Q?5h8IhyBPdjB01vkQsnQlxHN3Zhli2Mjq8U7esYeNlbtsU11+Wa0NodtIerDA?=
 =?us-ascii?Q?RtVcv22Q4QB4EUVAZUnwGWsx+0JWZsD+JNjzKpp353rG+QVHbd+tyKYK40vW?=
 =?us-ascii?Q?hNfOE0uJ7RobVA+vYLbtBdDyWGoTZ3eMVx51I82DIyATf3kihJKgO+MR353y?=
 =?us-ascii?Q?UcqjFFBnPKW/89g5XE72M8pI/vJ5HqpNI3k0aF+zjpzuA1jAwudPLHSC7+Zk?=
 =?us-ascii?Q?3ePvEiumANDRDzzcQuaPfVj/uPpXTn/BaB6TiKHzAMMpYF3QYLPBkoCR9VsD?=
 =?us-ascii?Q?WIW8PCySyMjHIxjrCj84gE1Rh+RFwhwrfh6tlHCKNs4UjYwt/91e8w5lk1Vc?=
 =?us-ascii?Q?9PMVbvqg/64uB7CJ4qwy7Qwo+ufssgpyrh6YH5VwgY+uRfeQsjB+GPTPWmhI?=
 =?us-ascii?Q?6vuG04jV4oTuV8ewE4ax9TNYC9mdG6BWjp4Sxoa9LbrrF+wpusUkP9KhAW37?=
 =?us-ascii?Q?s8SatVmfQFilVwx8eh6hpEQQBc6Nl2hU/2q7w/OqteY9Q0QQcTbJa+w2Dxe3?=
 =?us-ascii?Q?GafPUMV47XHcB0ERaajOwJgUvYSJaDq6yG4gcW6T3h/jK5e8aRua4E/ZwB+h?=
 =?us-ascii?Q?wAEwAl9FfcjDniYjMQggNK+74IyffoY1hGhD+lrySUZawW3nbcpYvAagDbek?=
 =?us-ascii?Q?ct3WVKsyFbZQz8mchFi7pj5wMyCuA07VBnm0S+V8+lF9uvZpMjwoRgRUMBBn?=
 =?us-ascii?Q?DIOmyELtqnFAolTTRTsYLHs8fthVJ3wsxqtB9E34tcThauF+wNeGC42uteL1?=
 =?us-ascii?Q?PWQVJEaHDnBmzj6dUmNXBlpX31SiUcMjeUE4aGSn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc4e12ba-dca9-4371-ccd4-08daab00dae1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 20:48:58.8332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+LTVLEB5jCYuR23/kXHboGVwDFm3ZlX3Pm6tsAFFHG/HnPvO7akIJ6rFRdErAqkGn2xVEMQ+io+EUvZ0/EE7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8686
X-Mailman-Approved-At: Tue, 11 Oct 2022 06:12:03 +0000
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 1/2] net: phylink: add mac_managed_pm in
	phylink_config structure
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

The recent commit

'commit 47ac7b2f6a1f ("net: phy: Warn about incorrect
mdio_bus_phy_resume() state")'

requires the MAC driver explicitly tell the phy driver who is
managing the PM, otherwise you will see warning during resume
stage.

Add a boolean property in the phylink_config structure so that
the MAC driver can use it to tell the PHY driver if it wants to
manage the PM.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/net/phy/phylink.c | 3 +++
 include/linux/phylink.h   | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e9d62f9598f9..8d54bbe14b6a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1439,6 +1439,9 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 	if (phy_interrupt_is_valid(phy))
 		phy_request_interrupt(phy);
 
+	if (pl->config->mac_managed_pm)
+		phy->mac_managed_pm = true;
+
 	return 0;
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 6d06896fc20d..a3adf7fe7eaf 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -88,6 +88,7 @@ enum phylink_op_type {
  *	(See commit 7cceb599d15d ("net: phylink: avoid mac_config calls")
  * @poll_fixed_state: if true, starts link_poll,
  *		      if MAC link is at %MLO_AN_FIXED mode.
+ * @mac_managed_pm: if true, indicate the MAC driver is responsible for PHY PM.
  * @ovr_an_inband: if true, override PCS to MLO_AN_INBAND
  * @get_fixed_state: callback to execute to determine the fixed link state,
  *		     if MAC link is at %MLO_AN_FIXED mode.
@@ -100,6 +101,7 @@ struct phylink_config {
 	enum phylink_op_type type;
 	bool legacy_pre_march2020;
 	bool poll_fixed_state;
+	bool mac_managed_pm;
 	bool ovr_an_inband;
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
