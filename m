Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A05FAC46
	for <lists+linux-stm32@lfdr.de>; Tue, 11 Oct 2022 08:12:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B073FC65047;
	Tue, 11 Oct 2022 06:12:05 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2075.outbound.protection.outlook.com [40.107.105.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15853C5F1D3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Oct 2022 20:48:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbeT/t+QXxDpjUCJ0hzPd/76URGRh/w66NyumK3GBYYBMrthaeO2RU6dQlo14eiw3fiI9k7ekuN3jXfyN9rtIOas7Hb3hIMDGJyrOWaS4+0vAM5oBueh8sjK7nmMZNwdofwhM2hTDmXT5gEL1HdvZESZKbjw77YvHe7JJl98JmPLDNG4NtkMPPyM08OTyoGYANd9i2PUc65aIJSyxrYd/1emhKITQxbDK4ys19sOPpjpqcsiy0JvXU7yjrfFb2vg6FbF1MELz4H+biZhdCD/BjH4NRb/EddYCtSZg1PGYdL4HXB4af1oIwFOZV8ykox3xoTmjSO62KMTZeUxGswQKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptyGMV9gTHnexXB/rS6dCRxrokDofAjqpnegzJ95k5A=;
 b=NhDlWHBXzXnSmmdrXv5tDQWXk2wrVEY6+6IBYryczK5e5tdSLtDL4o3cbjyG9BnHJPoLKBVsorCOGkrUbh2q3vDHXRHYlxAHqMVI3S5bMhtBaTIoYXV/i5d7+hXBPIwTV/V6kcCnr/KX0KLnBWmdaiJchoFfTOdikzp9g2LOjyemfbtKQ+HurPMCGRuBS15sfmSMMxQnKBMI+XDMj2RZMkoXodAQGjXKtQC+qyTk+P5bDT2uqwwszGTCl7gleZY7yZq4rwzO+jPNIUvLbAGXQA9T4RmmCNirFPCBuLIuC0xmeZzabuDdr4FzJniq/b5kaRP6zuXJy89RfEMqzmWUKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptyGMV9gTHnexXB/rS6dCRxrokDofAjqpnegzJ95k5A=;
 b=HmRP135HgF3teTuHCeDB3zjawnf26qGjlgODe00LSei2tUEdndaM1T/Jy3R2DkdNyx9PDnLLZScb497GKKTaejpZoF6WvMBRm1sCpfE1mJy09OouN7qdVmg07BXIsyjlJAQh5SqW8elVtQFkdFKCR28eovaV4IGooxGWAB+emXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PAXPR04MB8686.eurprd04.prod.outlook.com (2603:10a6:102:21d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 20:48:50 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::4d83:404:c74a:7563%5]) with mapi id 15.20.5709.015; Mon, 10 Oct 2022
 20:48:47 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>
Date: Mon, 10 Oct 2022 15:48:25 -0500
Message-Id: <20221010204827.153296-1-shenwei.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SJ0PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::15) To PAXPR04MB9185.eurprd04.prod.outlook.com
 (2603:10a6:102:231::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9185:EE_|PAXPR04MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d43c7e-0bbf-45fd-9ea3-08daab00d403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IprSNtB+4FLaAdvs9+gruRb3QPRSx8fykIE28Or4BVHMnRpK/lqjGO/ZgQyaIJvFKiOs/s6XY142Lx4PpU5C0KSxUy0hOhMlTdQVqAspOL8xnjmjlV+G+KmPD9JJ767YUri+qPfCZJ47gcLMOgJkGIYFF9+Z6Lyi50GrJIcgZHgUL9XzgS0zGLSDHvvys+kXY0q8k4NumFq4EFvrLGdiy5A082rIwNu1Q7wfQe9B8uBYFt+yj35EA0RfmQirGFXawwccm1bEYlMFU+902flmej/VBWnd6NT3I+CDazcUGrbAPX7q52XP74eVW4dLJ4/bEUV+533K9SfnmAtaEnk7uiDG11Ot3nS3JtA9xTFdXGwryUq1Wgk0NiwV3NOo0WjmhcJYEY6J7eYmRlbDUFzsNBRoRBKCGvNy2zDGnEtxMVL4IYz457pKCumwJguONmOC7lnCRqLcUkXPRB51d7/tnTdjyxFN/n1ZZHfTyKlGl38bNljb9C8aeUiCC0K1fPpLgbWI24YfXSgYzysxw2y+jMSNEKPtIHcbcvaqxo9IiVA1m3TPCt0GQ65bBj7pV7+/D2Mjb8HSXx4cNAXxq7ekIXu2D/QUH1ru7sB6yWhz4wKs0MNG6WyOVCorqzm8IJ8MusYqtVpu410dQwO2d6MdXGkVXXeb9GmBdLmdwsQFP22Hh7b/Eu3rtE2n49XQKDC6H94Ldg/oZjZJyrB9Buq7meBpHWdlf5EEYAWIsEa9AwtGlUtO6mg7mUfXdUoU4gsVOaJUX7yioQOEZycg2LdC5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(451199015)(66476007)(36756003)(38100700002)(66556008)(38350700002)(4326008)(66946007)(316002)(86362001)(8676002)(54906003)(2906002)(7416002)(6512007)(41300700001)(44832011)(4744005)(5660300002)(8936002)(110136005)(186003)(1076003)(6486002)(2616005)(6666004)(478600001)(55236004)(26005)(52116002)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TWOvrJE33twAL6Yt90u5Zy3BGwsqIztRMdCkbD8C/m75U7AZ531bjAjqj4rn?=
 =?us-ascii?Q?4cRBDGXvwBIOetBMmHjf5G+catrcLT/iegCHUempfhJ23N0tDOh+ARtmDKL0?=
 =?us-ascii?Q?3pMTEncP24ry9U7ZNbOnisNioYS/cmB0Vndf/Aai2fYR7c8fgvVsxy74xRND?=
 =?us-ascii?Q?BBGtB2B6kfCzFaoy5FRaCRpGA4TmcvuCcDa2vjiFInztlKUq6geTWCHg0Cq2?=
 =?us-ascii?Q?ZnbjYsljrAhl4PIjKlcsGDs128o2RldkMfdNczVozMpZAjhmG//pbhKray/o?=
 =?us-ascii?Q?gE/0I5llFluWS1b3U4bKGsYbvUYSLG0s2yJ5NTuDumBlmJ+fKqkeEE14Up/C?=
 =?us-ascii?Q?KFde/LoCKE65KgZGpOUcISTBBIaau334R6nc6buXuCqwid7gbGh98ESW0fja?=
 =?us-ascii?Q?R7AQ/yPXUZcwS4rQtlr/+0EePnIwkBEu8+xodtpAfoTMHjKOVBfuOegwYvJf?=
 =?us-ascii?Q?D7/2HE3Ewz9D4MpSt8aTbarS56kHTwnWtFZJKpFtuGzXm99350H0Si22p6dT?=
 =?us-ascii?Q?9KwMP1B8Jdy1focGyh5ndLEyp3dPo+U78Np9LjRBS/v/qp+H6L0BlVoda0hA?=
 =?us-ascii?Q?iuU6O+rS66UamFGzCKKdGCaXhVK/fnIyOdDU3W6Z38G/TRN2dNxa2P33nN/1?=
 =?us-ascii?Q?oXk4Lpt+ngnJtm3nV6Gl5oYPiB+S8sRJbVFWLdhw4ixSwOwtyTMi85FaPXfC?=
 =?us-ascii?Q?ENYKO0hKG5yA/52ukXjAe707HrEWZ9ktIeX1piST0F1QOoDLvGiv8NEygCoM?=
 =?us-ascii?Q?eRPmfHwtJP4XNJZcH3eDUEi+W0nhxdtEQxtJFf02CcN+oDF7mAHKIlYDZnCH?=
 =?us-ascii?Q?LQoRBFYNVKMAWX65IhlwFNNuTaXwv45VeY8Si96/IZD3i50BQOC57Q0p04VW?=
 =?us-ascii?Q?VroauWow/axxrmcOfHnvEaGJRLm22rkD68iqq0XZb+MrcxELhrKEjRhsnzKQ?=
 =?us-ascii?Q?dj4Xu/pP4Kxpj74BrzjpV4ecFfzVDXVi0PUyMJMkrGab0e8MuCzuB3ln1HcI?=
 =?us-ascii?Q?AYTs2Z5zVoFPg2eJ7OG0/N7GGO28spUpgKeaTck8hjtQ0hUOABnuMzb1rV0f?=
 =?us-ascii?Q?a+5gACRKEaCipqYQpaJOxGJAxsLV9Y/h+xr49Npe/G4HsA9DR+LXv0RHWri3?=
 =?us-ascii?Q?y5bhgOSK93TrEC1Ecg7DIu+7N+UbFSlaVHEffsa1S8RcmxX/UVK9+XCYBRjU?=
 =?us-ascii?Q?fJ01Puk6aPjtgwLblmfz5YFKVQ4VabbC/orVYMheI/0nFxG1lSmqveTzX36t?=
 =?us-ascii?Q?xMiOKnZPlPqcFIHVKenxvWvctMTHPPKaTlSGiUygIERBiLceZu6PJIg0MBul?=
 =?us-ascii?Q?gKuppy025jJwXqpl9EPgb6jjpo2Hrwq92IccrIPD1x78txQ5PIxGk9avw0BR?=
 =?us-ascii?Q?gukOBrO69OK8XEnbsmuTO5SC04fOVo6Lscc3s199a3eBVyp57Znt2Yh7n2R4?=
 =?us-ascii?Q?f8bArWVTJzI/WuaN7AI5FctDc5o2HOD2eRpUri30tFcylqW5ji52NFMqSAJo?=
 =?us-ascii?Q?5N5KtQJCeyEh6e4HHEi2zmar1kgP23zJjHsJSnJB8drfM5gXi/+lzpGxRIJX?=
 =?us-ascii?Q?ccMmlyk3hAhnl3hErtXq3ZLJI2haWXS9T7qnFGmeP4DqjfD6ZSOdzzWi6umH?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d43c7e-0bbf-45fd-9ea3-08daab00d403
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 20:48:47.8126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1DL607p8FXpngNgDwNn8rfV9sYh5UyfbxAhxBr03+KjY7JV6ZdNm0e0aHK/aKUjsW0DBRVDKo/rXDEFjxNGpcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8686
X-Mailman-Approved-At: Tue, 11 Oct 2022 06:12:03 +0000
Cc: imx@lists.linux.dev, netdev@vger.kernel.org,
 Jose Abreu <joabreu@synopsys.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 0/2] net: phylink: add phylink_set_mac_pm()
	helper
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

Per Russell's suggestion, the implementation is changed from the helper
function to add an extra property in phylink_config structure because this
change can easily cover SFP usecase too.

Changes in v4:
 - Clean up the codes in phylink.c
 - Continue the version number

Shenwei Wang (2):
  net: phylink: add mac_managed_pm in phylink_config structure
  net: stmmac: Enable mac_managed_pm phylink config

 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
 drivers/net/phy/phylink.c                         | 3 +++
 include/linux/phylink.h                           | 2 ++
 3 files changed, 6 insertions(+)

--
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
