Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D025FAC45
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 08:12:05 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 987DDC65044;
	Tue, 11 Oct 2022 06:12:05 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130058.outbound.protection.outlook.com [40.107.13.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4DDA9C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Oct 2022 20:34:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgWFPWNorM0SNf9wX4WiqQRSGdeonI8U87NGSjyvlDW5DYQfrbWnxn/U9wQAUGXe3l5tIJ08iBBp77BPvCwM9uRA9rbHOuk6c6+zENkw56/Y1R8xu/PSaLF/uXP1Aa51TTy2F0he0jODUtGaGawt7rSTCu6p9u78uEo6Hgp9TV1+zx00Q+nHMKUxtbTsWDBy63+9igN8Sar36biKhYGVKbMwnt+l/3tqwyAyUpBNv7rGSQ17odhAS/UsLWTgneWUOAu4XwR9+s/Y0Q6GBOA6UDst6/S8IoMsnYXftZInc9XG+IPhu75czjqq09xfe7by4iZPqyoLTGTheu9qbSniwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXbZEbsRu4n8mowJtawgrefzAQObySrKiO3WI8WyQT4=;
 b=OPaP3QCUGX91Rbn6rtZ+mu5N8mYnu4Cq80uqVaoO10M4aoC1WGWzJ0MxnuxerhpXo0+O9j0RVRuIYuJkMngXJtEOdXVoCYKuV9+pkXEHdT/f8plLRtPXiFJM44TJQpBHhYlaRaCuFm/Ade700VrDgzhnBZOogTKu0eMaRpeS/LDSclwm56aoInAH83ywAb6HOqnPIhn1tUPdXY3ijSBDwUDFqcQhgC9yNAdtpPMJveGZU+sR/xSWjcF7tyRLytkHRXURazViib6ATY5uPQyE0izS00fOT1muJ56bBDwQrXDfUepCHnB4Fduga3davQq8f7lw2SunXu7u/MEhD1xiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXbZEbsRu4n8mowJtawgrefzAQObySrKiO3WI8WyQT4=;
 b=FxZLUKSb3uZffrGyW6XKewtyoBLJLAkufg49S4rHjtnjhhxlamAAP8431zSHmuD9UpT+bQG1KEy3LKooQWYEkNGFswDtVdbMTej9zFClFSLdGAMKkc9x9oUnknNQv626NL4sHKzIxxOX7Lu2AguJYbVZDpvxjwRZXSPhmkJqUWM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB9567.eurprd04.prod.outlook.com (2603:10a6:102:26d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.40; Mon, 10 Oct
 2022 20:34:04 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563%5]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 20:34:04 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Date: Mon, 10 Oct 2022 15:33:01 -0500
Message-Id: <20221010203301.132622-3-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010203301.132622-1-shenwei.wang@nxp.com>
References: <20221010203301.132622-1-shenwei.wang@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PA4PR04MB9567:EE_
X-MS-Office365-Filtering-Correlation-Id: e5bcec43-f803-48cf-8d30-08daaafec3fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WBG5IW9R9GZdvPzSlHToaBFNsm41l7rGntNo7XXfhPcd0wQJ1FIkLOEWray1NPWCiT+vyfGpQ7nbJjL8SIQBxfRz9ktPVnjg+8pyBAWsV2fHy8AAKzDBIZFYJJj/tQOutNPHMUyxQ7ErJd0noSTnPiTwKY/e0PLQfOl+OiDuUeEmzEbK2VmOrPYAgCtRCCXYRqmoTzXHWC6avK+LRP1rjXX27lq9nQjaDGR+XbjFmU9cClgBAimre+6EfYqwg0LkKxgmfbDMyM+B5nhClx8VmmsewbD72j5thBlIeIzO5yLCJmXjVB6PkHBAuFaMHk6v01TGUo234L9fCotWbZEliKTgZSvHv3PgviNaJVmV3RUquoaBQ/PWkm/dGvYpT1FTzNt8H9eOqUzQmakNjE91vannReCEzrEGYnrySwJVmJI4XbjUl4TcxkkrHW3/IOCD8CCisFbiqpimNq/9PtY3SjyQMEjogeNIN3qE8gNS12sqEDJPE8F3oRQ3TJlZqzKrD/g5GEZeXmXi7vU0koK6oWZ4A9nsIrsMaHDKjqL/P5/wrz9CVhvg9fgNg1PtreGGf++TTz3EFKI2003hq/OX1w0DEmX4mWnHrA2rlT7lmoPIFZ6cndWF6tT+SuqKjqV21ZN7ZshcCFUbSuditQiOKfHbEjU3K5sPTo+HtElglUsr0Wn34GrJ/p+d9eDTAVnDZBOmDeMxz7nTU1cetGSVxGWI2apwIpdX+lqM9WHRHLriwoaIqUc2xy/Y9wvtocI/NGcNRham/KPKaEMQBa0DtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199015)(66476007)(83380400001)(4326008)(44832011)(38100700002)(38350700002)(2616005)(1076003)(7416002)(4744005)(2906002)(5660300002)(86362001)(8936002)(6486002)(55236004)(52116002)(8676002)(316002)(26005)(6512007)(478600001)(6506007)(110136005)(54906003)(186003)(41300700001)(66946007)(6666004)(66556008)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xoz8sC5FIKOVGKP0D529niPsjLcJYOxZxcRkjruWxyAOOl4AjxTgKfGjp/n4?=
 =?us-ascii?Q?GWsISt5KyioCmB0o9ip1ffBrK0lYuAM1+jaUGOawt4lS717d8sH7i+r486CF?=
 =?us-ascii?Q?2auG03qAG5vHIJZ1o5Mj0UUEMq6Vs8d175Pmm5NuiMIJj/OSqef7y1QOFsH7?=
 =?us-ascii?Q?m+HnC9lVz6QoMciuQyz0/ol3AI4Ei62v+g6bsSvf2gexrXx8HdP7Z1itr4iS?=
 =?us-ascii?Q?faxBLWj8feyLDTYi0B4OPc8isTW0xR1QRijOCU7s5VQwRK9ImouT1VN5bLUh?=
 =?us-ascii?Q?jgjzLTOj+BZGH7xwKR10VQ6kguhO5qso0rw4XqwfHLNfrN3Ee8LOISEH/5dY?=
 =?us-ascii?Q?AKCwO00L+JOgTXqPi/CuWu/csZ8pzWk9d9RQQgcnkLCSS5r0Zwg3W7ZU7rcg?=
 =?us-ascii?Q?el7nYMR7XaQp7LbOTrqcisaaXL1N2IqjqPc1sEm2/hI5+VUitGZLr37pqR68?=
 =?us-ascii?Q?TEmcRbRjNc82CMbo45Se/jxUhTGcequAlDtNQLA7HEB0JzO2DcUQG2hK9a/I?=
 =?us-ascii?Q?PH5ys9xLn4g2ztz0YKS4J7sLGJa+zkodm5tK0MQf5mTzAiY1ZxrVQGG9xdtb?=
 =?us-ascii?Q?N0f5mesWUu6D0XRTRlvFk/FpFFYHSowW+5gi6wU53gQ4EZca/6LJwm99cENB?=
 =?us-ascii?Q?sEQFjjxNp8xr80iRXgWYSZgEyxDpIzRsUcUpZW+PVVdWUCPwEKOvw8o6rdVg?=
 =?us-ascii?Q?jFWt7sfd29Qi8DW6Z0JQu+5fk45E1nB7lvQ5sxc/BWooLcBqJedbTwMxeKa9?=
 =?us-ascii?Q?OnO/ZQznv4OWbmXNIRrB/pFDTvzVK9m0mC8Tzv0Jcwyjpko743rydz2mN+/2?=
 =?us-ascii?Q?qgHUb2NaVDlovH7kY7i1cpNfGpS1K8n83e4Ok6F8eIJ69szrdpH0hC47lkpA?=
 =?us-ascii?Q?6No9cQjRoDtC7aee49LNJcDn5FWLmtqiUqieKolG5Ln5Z2EONvAyUmtdyTAe?=
 =?us-ascii?Q?TgTWwbCekcWK8ps7cuwziwluseTmTYRSRFEr9wDYW1lraw79Gt1Drm91gi40?=
 =?us-ascii?Q?TmbT7bAAlU0n25Y25BW+eqzgMl06xQZXeeYB/ICE81NhWV5AauYYtm/zUf5W?=
 =?us-ascii?Q?BG6ugkWS9aTaVdPFUrEWpvg4RVgVk0K55LNPcEcc3bV77HQ48pzVDKtSBPHd?=
 =?us-ascii?Q?SiCHBnB2DNSoHi/NU5FGBQODueMU02PTMss32h8OphWrg1HC+qJPT2DN8QEV?=
 =?us-ascii?Q?aylwoXQ6ARPpRrrW3FW1dai2O+42N3YQ12GQYq/jsfsY7nSTfy2i1sOJmt8O?=
 =?us-ascii?Q?o1TnNVoW15xlM7xizjzuHHT3GeW0oJqZ1FjumaiRXWrIJPPa4XSHSW9orP91?=
 =?us-ascii?Q?HyPaOs0tNMcdeoNTFeeJgggmmJAbD2tsYMpV4mVDMtGwKBdVTOaXruc7NtO/?=
 =?us-ascii?Q?0ZvInfvTvVkdiB/Q4znvGpvpqU6gIo9iHrfyXxWgrMQIPP52beapZrdv2kMF?=
 =?us-ascii?Q?+5wEvklvrbzBcLPiNnOZzXB1GJ5fh0Zg9ZF4l76oOZ7L/nfS+K0h/dx1ApNi?=
 =?us-ascii?Q?eBcfB7xUWajyge9vjGCQZVLxVUF7fS3F9BkIVJ6jpxWicDyAmEui0Efu4fod?=
 =?us-ascii?Q?pPdM+/paNciEYoCwrwi5jE+kb2fDelFpMQcoKVhr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5bcec43-f803-48cf-8d30-08daaafec3fe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 20:34:04.0666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BOkDD+WQWfjacsUCxS8RGNeHT7BzpoRK2R1skg25JE5VcJU57qm4NL/VvjWVX5IxbiKreWWIVoDXZsCq8d23wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9567
X-Mailman-Approved-At: Tue, 11 Oct 2022 06:12:03 +0000
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 2/2] net: stmmac: Enable mac_managed_pm
	phylink config
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

Enable the mac_managed_pm configuration in the phylink_config
structure to avoid the kernel warning during system resume.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8418e795cc21..537e8e61bb97 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1214,6 +1214,7 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	if (priv->plat->tx_queues_to_use > 1)
 		priv->phylink_config.mac_capabilities &=
 			~(MAC_10HD | MAC_100HD | MAC_1000HD);
+	priv->phylink_config.mac_managed_pm = true;
 
 	phylink = phylink_create(&priv->phylink_config, fwnode,
 				 mode, &stmmac_phylink_mac_ops);
-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
