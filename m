Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE34652D92
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Dec 2022 09:02:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9CF76C6904C;
	Wed, 21 Dec 2022 08:02:35 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D3F52C035BC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Dec 2022 08:02:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V0zVeY7+iVptLWRu11bYwzNRjA3TCxOuhIcYzVr7MC4V4HqE94wubNNd3r5lBXwXZ6baQqgiQUryxGl+dgpJ+rElYBkPz4/TAhXOHEOANUM6a/wX5qr3SfIwXPTYWa9Z/KdYS336M2OPBn6AGztYXrYpK43K5xhsCjtbPfzbEVsYQ5aM9noxKjwHNROtleN3SNf9lksdWDHp16cdclheE9LxBtRb6BwLX0UOy2xdi8Cc+dTxvHNuwofiLcIqo1q6qJE7KuB/qmK7w8x4M8K12dQ6DpWAs6on/DHKUIToLcQAqaFjAPFKdUk4RAD5f25oPuE5iB2jGDPfj08GeOuoNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5po+u9iUjtIeAUdElaNVNZI1j989hzTNa9KUovfEd4=;
 b=JASwLgRa7ePadFyq2RFS4+R0d5OLf2q2loBZOfrD6DF3N2QioqKQCHtiq3Hbg8bmlpGJ+wLgMf/0GxY8QJGrca0TcpognJJHsZV1pqGD46INe4o7LxyGAacqn3hrriBjTV6oCamPfLBqFso72fSyRBTICa6/EPra//SvxnEByvgfex2XJ9eChv/QHbrzbtJOS9BTVW2fvxLOyLk3Be7ymWQIEK+HFKpLmtFLrY+Fdj4DW8pIpUoVsMoXhLUCsmI3nLcbOmyXrYCUMLVw9DF7fXt13NKdK7NlDFr0RlfJ0te2gK2bZSBWHhR9LvtPenr+Z3TtL5tvISDV1k7gGQrW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5po+u9iUjtIeAUdElaNVNZI1j989hzTNa9KUovfEd4=;
 b=DzrWiy0/hBMsqlrvca9TOTpIIIpmK47WQGeVV1jvQa1GjtEC9mgp3Bwdu2q8oSVY0Ze67b/wYiUQzmDSFhLBeT0naCF/bOvA7y/KCr9SdBKdmL5ZAH1634MLdhS1sd3IkX4E4B9juiU0xkbj0euLKZ1FkLrGaAmyFBsR/xL2cmg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com (2603:10a6:3:db::18)
 by PAXPR04MB8426.eurprd04.prod.outlook.com (2603:10a6:102:1ca::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 08:02:33 +0000
Received: from HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::76a3:36aa:1144:616c]) by HE1PR0402MB2939.eurprd04.prod.outlook.com
 ([fe80::76a3:36aa:1144:616c%11]) with mapi id 15.20.5924.016; Wed, 21 Dec
 2022 08:02:32 +0000
From: Clark Wang <xiaoning.wang@nxp.com>
To: linux@armlinux.org.uk, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, andrew@lunn.ch, hkallweit1@gmail.com
Date: Wed, 21 Dec 2022 16:01:42 +0800
Message-Id: <20221221080144.2549125-1-xiaoning.wang@nxp.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI2PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:196::10) To HE1PR0402MB2939.eurprd04.prod.outlook.com
 (2603:10a6:3:db::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0402MB2939:EE_|PAXPR04MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3b9a74-b8cc-4e8a-b90d-08dae329b6b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JLEFY8LlQVjSDCXFvVMwvDAs7DWzmTEQ8VQI8QdeRa0Rdar1zdEGtE2i3BqadainCrca2LOhVXCR3YcGpExt3g4Pu9bBbL14DjXo5SCi9bAsMSUqdx5T3hn0BXG8xT51PDFz1g7i1AnCA/KEWg7s7dAHa4u8Shlvyrpovih73+JSWujBad46yAglTfPOiDK9/ghGHTTVxsfRlPMGoInDz49MRwA2V2ASBn1xC0mgCaMZ1A2LK0Ce6fSyspaqoJWHEOYsg7H2FvAHDJu0wJeFY69JDxnrTXAlZmd5u/H/xvKXx844z2o7fTKQ9Ij1ay6lFxaUgRJ06ItkT3uwhcMVU0kwPRjPSIgBvH5hXbHcjEEoC0IX/3+d6b+T70IosTCMgj5nHppvtnST7VIyPqJKgujYIL0ZXOAdZYYfuQ16QFNYE8a2C99/zSmJeh7SFeEzQJHHaiwLEFnXUcf2uGUKc4LYqF/Lk/3dPVDEcqiwCMvNomH6YCCwWdNV590bzFtqezSOZMvOQ7DQKNvnb9CsYFVNUbLlM03h66BowwnFNWXfIs2Vt0ps6Dd7gGt1D/I8DZKllYKG6tsJV3jIuofpFUJ49nZdFvCjrDe4pqSworvZ+BU1JCKwfYkEJt8P+YGoa6MkAF7w4yEW8CnSF9qKbvYKJav8gtnVzyOd9H4zZS2Q/f2ClF98Lx02uElj6o2UgQouZM1XFp8LXDx2vu+P0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB2939.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(451199015)(478600001)(6486002)(6506007)(186003)(6512007)(2906002)(26005)(36756003)(52116002)(41300700001)(66476007)(66556008)(66946007)(8676002)(4326008)(4744005)(5660300002)(7416002)(83380400001)(921005)(1076003)(316002)(8936002)(38350700002)(38100700002)(2616005)(86362001)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2jXPvxcniP2grZZKDuMO5CTmb5BZEvsOlxWDx/watG8Vhf7VPPX2X3UCdSCt?=
 =?us-ascii?Q?yQ/NPTsU8YZiHemyNlgVhDM4XEr6MA49DnXsOf4nb87aydO2zNKw9KLDNTiv?=
 =?us-ascii?Q?NNAhDmmoJKqTyn0ZAYlaiGlr4k1h5FgmewoAeICpE8iACr4XcYx6EPlLveCl?=
 =?us-ascii?Q?vk4msoPcwoircQSGVPnMNXN5ppaOnzqbUUbo5ZQzwOPX4rxA1GHFQmdW5h+U?=
 =?us-ascii?Q?paqYv+rl+JwN9CpB9gDW8N1BGd7CNNCg7lRBtNcnnMON28dQ5HR5aFOPYiPk?=
 =?us-ascii?Q?SfxprUddp41jZm+Om7QnaONPOLUPP/OzrXsZWSig/3xOhe7u7ccsSlHhSEXn?=
 =?us-ascii?Q?qTevGwNvOAcFABzaN+TeXTjuxYQWlmryyUpTgthwl3j50yO+//O2I/65G4/V?=
 =?us-ascii?Q?WNnSFa6/9WD8xwFWCfjgHhcyJGf0mwRh73KMBYQImigpiuoI8KDm+rK+gNjo?=
 =?us-ascii?Q?YfBifnDstu8wxisHuX5pnF+5J4Dt0jM8IcSxjbsxrik7ojKnJ4sk96o2DyzL?=
 =?us-ascii?Q?NVdHWNP+R0rfw4UlhnAEiCm/coeSu602ds5kfKNYfxHXNQxk8f/PHEa+P22l?=
 =?us-ascii?Q?uuGDlVfvwFYuLVAKuLxQUwEx1vigk/hIOoPL6RiPhlFdeASJLp4m+MYof5bU?=
 =?us-ascii?Q?slsbK7C3US8fGTF2P8hHLnNVB58meELPhvgrNT+YhhKorSy38vSHGtg0l2e2?=
 =?us-ascii?Q?SRvPdDLQnphBLr2oPtddW8t/RIccPOPx6R5CAQLW0FWiSxzjSmBFIR6LWXab?=
 =?us-ascii?Q?N+JEPoBzi6Q3s1htoCNKgmXwM6cWii48kvaGvQBIl3HASS+dQ48nZcB8Qh0U?=
 =?us-ascii?Q?iFYE8D4+C3BZtU2bm+miTIb0F/L5KXK3E04fFLW03zk5etKXAeBQsugF9q9R?=
 =?us-ascii?Q?DCs3CxBJUFXbhpl8HnBUC8dq1oWU/oblIcmyHEtYjMjhybxuKosKVuafYmsk?=
 =?us-ascii?Q?wJVMH5qM2r/dE0+Q/3c+l/UEaUwePERhfJzwg2/DaKjLGby6NrAFiUIHQL1k?=
 =?us-ascii?Q?qrdFhcrWqvkPzFQ33eEs3opGu8ilYTLe21/tmdGwdXn1ZFaaWl1i/4wvyf+d?=
 =?us-ascii?Q?rz6SyhmUlG9fifO7hCt4hIY+7r910MjPLg79+9Bj07LtHvLyXHKnuAKWc9TK?=
 =?us-ascii?Q?CiY/C16fo+ftYMumwDURlu7lAoxi+c+aixIS32Jc4WgzR+Ht6Fnne38aRsaP?=
 =?us-ascii?Q?ivvtDZ1SQDydsRzblFfIewD/7w/TNALtaFNwXBMSlkYL0Sv3znsb92R4b6fk?=
 =?us-ascii?Q?BJeQI4PriGhsld4bonSZwISjySnDHBdbvOGyH0MZnk5K7OfPSPleuNk9Wct2?=
 =?us-ascii?Q?MZxeMSrQw3fmDCIvGk/3UhWCkq5FKK4fhhK7h99/pIIhC5Y4Dpf9QT4QlCHd?=
 =?us-ascii?Q?RMr+AV2B+X1Oq1UcOki8/5p4wsy/ESPTOoTZrGaR1KEg3yj5QeTz8ol34ce+?=
 =?us-ascii?Q?eQ1rhnjMlSPSArnm10l7rjcqypKsfviHxrXKaqjdydBnxSdsPV4OpxCeaNke?=
 =?us-ascii?Q?sUDGThE9jMJEJ6e0rJ47xe15tMQNd/HOuxNBC+14Dzp2Ov87fcyjVf8P4oj4?=
 =?us-ascii?Q?rhqGsVsnYjUjyYDTC8z5YuzgfoJTQSylG0h5hYFhwTH935WvKlE8WKuxnKEw?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3b9a74-b8cc-4e8a-b90d-08dae329b6b8
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB2939.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 08:02:32.8663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /h+sO58krgoNG/I9Py7qR9hwEaZKnzaZo8Y3NxjnIVBYxoabsXoLKjSfbVi0YddJVhExW1aJZuJdf/wSADU3lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8426
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [Linux-stm32] [PATCH V2 0/2] fix mac not working after system
	resumed with WoL enabled
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

Hi,
The issue description is in the commit message.

This patchset is the second version following discussions with Russell.
But the name of each patch has changed, so V2 is not marked in each patch.

Thanks.

Clark Wang (2):
  net: phylink: add a function to resume phy alone to fix resume issue
    with WoL enabled
  net: stmmac: resume phy separately before calling stmmac_hw_setup()

 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 16 +++++++-------
 drivers/net/phy/phylink.c                     | 21 ++++++++++++++++++-
 include/linux/phylink.h                       |  1 +
 3 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.34.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
