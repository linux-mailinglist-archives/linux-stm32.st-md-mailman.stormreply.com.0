Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88919763ED5
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 20:47:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 39C83C6B45C;
	Wed, 26 Jul 2023 18:47:20 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2054.outbound.protection.outlook.com [40.107.13.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A8B84C6B45A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 18:47:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNhA+YWrBkJUGsuoFhFZgxE8X2zZrNyja6409cCq0xeQDzr+0xyI3Ni17dLHJuy3dbnY4OGCEYGyCH2bPs9gSxD3YH4PY+CvaTq3UT7Tpw5/KAbuNMEdyt3gD/24JzV1rXGz3BG1RxapgIA2O9CV+9IRBR/EwIEe2H7ePrw8h3n1JPWydPwOtBFYQZmqOeM1bxKBA3+DriCbAvJJFKvqSMUnBDLrJ0/IqpV2N1UItrLcIcOpwD9+cX00WTbMDHWNENo8yDf+Au4HdLlq+iKnl8xDXKCCm9vYC5M+kF+4Ty4/I1RdYEjMJm2fakJ47oV0DxQ7IIQnVQB8qS8IRLLh1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1M3Nt0oKRMZHLPhdX+zqH2cS3081gVBhypguvxIBZY=;
 b=CZyukQ8aJBYou9DUbaXQ059Qy8Sd8FH+sMax48odMqoWsum/mO+iJt8YPluixzgbLE9R4kpFeACb26QW0eXgajODKWx1+bJTIyX+aJ47Dr58WuyTD3D8EwYzSLnw77ohtbwrndOtJ7p2k94ZN5xN6g98WZrZ60Sa7ZSo9GPkFs3TrGHDCX94sEfV9EBTMcebKU6hNdY3cF+wp0NS8OS/ul2L+UPXgB0eKqTnaYm3AsahevwJeXsSjHd71PMYP6Jfe54Sx+QsJPSjCS6LuAPluYcaHTTNtP14rMSh1jEg3tKVt9grkkkEjdhRvR1VtTJIhfIjcPEBEDGnqasd6DILUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1M3Nt0oKRMZHLPhdX+zqH2cS3081gVBhypguvxIBZY=;
 b=eFQlKMQsKMrC4htUM5+agX0voYf4WQrPLe4/hi4+6gunDEGWl6OWI1qup+INadhbHW6A8Pq9VwY3wqL2rvl4iQ9G8jb4Z66vq/yz1cktZvyfBV1uUT43+Av6ZlAwnAYIKGVAkgovjA615vYvT2f15A9rSJaC4XDzEv1fUaq1HLs=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB9415.eurprd04.prod.outlook.com (2603:10a6:102:2aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Wed, 26 Jul
 2023 18:47:15 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::d4ee:8daa:92f4:9671%3]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 18:47:15 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Russell King <linux@armlinux.org.uk>
Thread-Topic: [EXT] Re: [PATCH] net: stmmac: dwmac-imx: pause the TXC clock in
 fixed-link
Thread-Index: AQHZvzEtwr0cB5x9EUCXrQC85+we9K/LNgwAgADv2GCAAAekgIAABiMwgAATfwCAABs2cA==
Date: Wed, 26 Jul 2023 18:47:15 +0000
Message-ID: <PAXPR04MB9185108CB4A04C4CD5AE29FC8900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20230725194931.1989102-1-shenwei.wang@nxp.com>
 <20230726004338.6i354ue576hb35of@skbuf>
 <PAXPR04MB9185C1A95E101AC2E08639B78900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ZME71epmSHYIB4DZ@shell.armlinux.org.uk>
 <PAXPR04MB91856018959FE0752F1A27888900A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <ZMFRVtg5WQyGlBJ1@shell.armlinux.org.uk>
In-Reply-To: <ZMFRVtg5WQyGlBJ1@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA4PR04MB9415:EE_
x-ms-office365-filtering-correlation-id: 6ffee229-2251-4255-a021-08db8e08bb44
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IyHhnHDqMAUp7LR6WlU3+C8l5lKNkKCrmoldDI1X1+8LcUk8A6Uz6wDsH+cSj7VzQPuxMuRMipmf15ffYIBy16AxTOsG1lbU48vCmJdwT7WqdyUNDSeURzzKiaXxzVOT1MoJhoap+Uz3/XZZCm+Ura/Q+BBBPR3NXcs3QsyMgBPWuDMrehRpS69MUevR3RoKqsSvVnGvk9ipGWhjrnnUOUY+HKNY7UMi9dEwRyRr20QNvNCf8VKO1ys6bx6pjeG/jMm5xEn1IcyJbmnJKkcEADTxIteS4Rcs0jUMvMX8/Y6yREb7vTnO7aX0bmuU2pG07ZgEMSNMN845EwwXLF9Xyh7D10wDH9MnYQ84+GmZpzPjq2F4TQFSCHjLOQ8ak12AS81ViHJahhKgqKZQ95gEcgQSHLiUuRAmRpmIIhaMc/81lDhBirvULt7qkSr924KPvf0bYHN8WfnE6fi15fehlAdgD3XPuqE8SruPvZh8ySBeorG+BpilvZnMHP2kqyFemlqYf/BCxeeyIGRmAc8uE0MubXknVGCtYINuoCoi9qytK+475oNnICRhOL22JUo2xbzALzlX/HpryCe9/99FW9R5GZJvBExBicYgxEj7u0Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199021)(86362001)(122000001)(33656002)(38070700005)(55016003)(38100700002)(2906002)(54906003)(478600001)(83380400001)(186003)(6506007)(26005)(53546011)(71200400001)(55236004)(52536014)(41300700001)(44832011)(8676002)(7696005)(316002)(9686003)(5660300002)(966005)(64756008)(7416002)(76116006)(66556008)(4326008)(66476007)(8936002)(66946007)(6916009)(66446008)(45080400002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OktI2kUEPgrU8yNJpf51rnvoLgZhS6dC5G6r7UGTVomUu+Q3FxgWG9ANL9wC?=
 =?us-ascii?Q?30DCfDsULwHkh7jJPfs5JVMZ2JR2EyruhUN8pPMokRIWzha+jpAhEnyEeZki?=
 =?us-ascii?Q?QZ0vt6AslZNGEV9cHnldPUWOEfTZfriD1OY3CqdPTC7RQbPx2RJwcKuKTfWv?=
 =?us-ascii?Q?BW5+J9sDl+OiEX8Hjphgf3Z2zm03fKHg6qB7Iq0htAeawjIJxUcalbm00kra?=
 =?us-ascii?Q?TBqOE+sDnhp46lz25nOdrf5G/liSkTbsJ/LEqIkmzTHI6JEB/D3RQuAs5H8i?=
 =?us-ascii?Q?hMMLANslWR7KVcfVZ2VhS/Uy7HA5JEG25YzQKUDYoSav9JkOt4/Ws5kWZ14e?=
 =?us-ascii?Q?xwylUV2QI/n/eRD844C21I6FiJ+mjSd1AcCNWhNOeW2SYXSmDicMqPlp8XDn?=
 =?us-ascii?Q?uqLWxVvnl1fIquhSAK4jKlEuOqvHch69swxcNj4nHa/MCqEsGByTtrDTDVn7?=
 =?us-ascii?Q?F2cyZ9auoLHnhBbwgsc6ruq3o08u6G89egTxIrhahjEMRZG4piuXvISF8Hnk?=
 =?us-ascii?Q?djdSpxlH50Z3MkJLei3ZWMjZ6X88pHuoVJVSMcN1daRgWhDhza1ZoIlGH2Hy?=
 =?us-ascii?Q?EdwUEmS07CPk37wcTjIyEYBnL8uMT1qTsCLc+SexmffR3Y9kSXcO3hEGYwe7?=
 =?us-ascii?Q?ldPcN5bKEq5gSpDqI0ozY6XDmzytRZd0ndO2vWEdDuYZ9CwToJUD0El7/Z+j?=
 =?us-ascii?Q?PFif/bH47TB863D6R4jxW135zMfZtzTgj9OqUuOlm29B4JhK61Ari+YVMHQu?=
 =?us-ascii?Q?PO1LRJYA1I3h7790/ciWebn1P9bqTXGw28ajMStbvbVxp5W1i3gmVoYYnGlV?=
 =?us-ascii?Q?I+Xlb8SVAArBI/zZqUk9zvywEylDzOEAwd9KzyKxaYcOfQxaSSMLnbjkgtfJ?=
 =?us-ascii?Q?YGIJhUNYfLqLqC7p8Zjf9Y7YmjFZOaSszZ5Xoi+SAbcopuElQG2au+4TrPgW?=
 =?us-ascii?Q?KG6tHjnD5B4iq/NUDHNLhem8ygZ9stQAJZ5B8eqHohyvtmPL8HgNLVCMO9hx?=
 =?us-ascii?Q?YU5XSMvRjXp7y0qARjozctRkooh2e4F8LEaK/3ykf+c2KuEJbYQ+Y7nGmOPS?=
 =?us-ascii?Q?dYeOTDFZ1lu9ZpM769zKgM7cPY8gKy627ZnfsLiGuAjcw3kWuhbuIQEcHZwP?=
 =?us-ascii?Q?esWPZ9xpv11LR/EKed/V/A4Rdjq0ZHmOyXESyfGmOhJJOLsyQR1HiKPw53oi?=
 =?us-ascii?Q?WxFan3+j/8+yuBRsJt7pyeRKSrvQhIlsdYX9itCam+YK/qAS2NR3P45A43Fi?=
 =?us-ascii?Q?Otn5gPSH6DxVJ5dK71JPC9SJmYIilhLGCk+q4SoO3Vg1RQyxaejLvdaragvh?=
 =?us-ascii?Q?OFu6wSw+pxk/zvoJq7jtg95HA17kK+QAlWPIfwmGixGuFq48VfdgJKhWumy8?=
 =?us-ascii?Q?YYjh/DgYaxg2y4vS131BPRMMyGsTJ+NMfzIKG7Ro5RtrTwSAsf0no1dXFr39?=
 =?us-ascii?Q?tS+72DeXZWR7Bwu8a2Ug68QU6YeK4PsEQQwjafkPA6sjM8OJ2KcQ+kieHD2t?=
 =?us-ascii?Q?TTk9+yi34qnwBKVFj8xqDlWvOg+i2rUbR7O79/8S8WiWhapN8bUKlvL4xb4K?=
 =?us-ascii?Q?WivytAczkQtGz9EHyxVujEEqAfPiQ4h1jkfj4e/I?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffee229-2251-4255-a021-08db8e08bb44
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 18:47:15.5620 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j514LYUFzhymBQPbhyVDZdXPdmRu7UEeePmbzPtZvZk8HFxpEubCsox6cqXXBmH9TB6re/EdqQcQe/MGZIB9ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9415
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Vladimir Oltean <olteanv@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Frank Li <frank.li@nxp.com>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, dl-linux-imx <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jakub Kicinski <kuba@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shawn Guo <shawnguo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH] net: stmmac: dwmac-imx: pause
 the TXC clock in fixed-link
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



> -----Original Message-----
> From: Russell King <linux@armlinux.org.uk>
> Sent: Wednesday, July 26, 2023 12:01 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Vladimir Oltean <olteanv@gmail.com>; David S. Miller
> <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime
> Coquelin <mcoquelin.stm32@gmail.com>; Shawn Guo <shawnguo@kernel.org>;
> dl-linux-imx <linux-imx@nxp.com>; Giuseppe Cavallaro
> <peppe.cavallaro@st.com>; Alexandre Torgue <alexandre.torgue@foss.st.com>;
> Jose Abreu <joabreu@synopsys.com>; Sascha Hauer <s.hauer@pengutronix.de>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Fabio Estevam
> <festevam@gmail.com>; netdev@vger.kernel.org; linux-stm32@st-md-
> mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> imx@lists.linux.dev; Frank Li <frank.li@nxp.com>
> Subject: Re: [EXT] Re: [PATCH] net: stmmac: dwmac-imx: pause the TXC clock in
> fixed-link
>
> Caution: This is an external email. Please take care when clicking links or
> opening attachments. When in doubt, report the message using the 'Report this
> email' button
>
>
> On Wed, Jul 26, 2023 at 03:59:38PM +0000, Shenwei Wang wrote:
> > > -----Original Message-----
> > > From: Russell King <linux@armlinux.org.uk>
> > > Sent: Wednesday, July 26, 2023 10:29 AM
> > > To: Shenwei Wang <shenwei.wang@nxp.com>
> > > Cc: Vladimir Oltean <olteanv@gmail.com>; David S. Miller
> > > <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub
> > > Kicinski <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; Maxime
> > > Coquelin <mcoquelin.stm32@gmail.com>; Shawn Guo
> > > <shawnguo@kernel.org>; dl-linux-imx <linux-imx@nxp.com>; Giuseppe
> > > Cavallaro <peppe.cavallaro@st.com>; Alexandre Torgue
> > > <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>;
> > > Sascha Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> > > <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>;
> > > netdev@vger.kernel.org; linux-stm32@st-md- mailman.stormreply.com;
> > > linux-arm-kernel@lists.infradead.org;
> > > imx@lists.linux.dev; Frank Li <frank.li@nxp.com>
> > > Subject: Re: [EXT] Re: [PATCH] net: stmmac: dwmac-imx: pause the TXC
> > > clock in fixed-link
> > >
> > > Caution: This is an external email. Please take care when clicking
> > > links or opening attachments. When in doubt, report the message
> > > using the 'Report this email' button
> > >
> > >
> > > On Wed, Jul 26, 2023 at 03:10:19PM +0000, Shenwei Wang wrote:
> > > > > if (of_phy_is_fixed_link(dwmac->dev->of_node)) {
> > > > >
> > > >
> > > > This does not help in this case. What I need to determine is if
> > > > the PHY currently
> > > in use is a fixed-link.
> > > > The dwmac DTS node may have multiple PHY nodes defined, including
> > > > both
> > > fixed-link and real PHYs.
> > >
> > > ... and this makes me wonder what DT node structure you think would
> > > describe a fixed-link.
> > >
> > > A valid ethernet device node would be:
> > >
> > >         dwmac-node {
> > >                 phy-handle = <&phy1>;
> > >         };
> > >
> > > In this case:
> > >         dwmac->dev->of_node points at "dwmac-node"
> > >         plat->phylink_node points at "dwmac-node"
> > >         plat->phy_node points at "phy1"
> > >         Your "dn" is NULL.
> > >         Therefore, your imx_dwmac_is_fixed_link() returns false.
> > >
> > >         dwmac-node {
> > >                 fixed-link {
> > >                         speed = <...>;
> > >                         full-duplex;
> > >                 };
> > >         };
> > >
> > > In this case:
> > >         dwmac->dev->of_node points at "dwmac-node"
> > >         plat->phylink_node points at "dwmac-node"
> > >         plat->phy_node is NULL
> > >         Your "dn" points at the "fixed-link" node.
> > >         Therefore, your imx_dwmac_is_fixed_link() also returns false.
> > >
> > > Now, as far as your comment "What I need to determine is if the PHY
> > > currently in use is a fixed-link." I'm just going "Eh? What?" at
> > > that, because it makes zero sense to me.
> > >
> > > stmmac uses phylink. phylink doesn't use a PHY for fixed-links,
> > > unlike the old phylib-based fixed-link implementation that software-
> emulated a clause-22 PHY.
> > > With phylink, when fixed-link is specified, there is _no_ PHY.
> >
> > So you mean the fixed-link node will always be the highest priority to
> > be used in the phylink use case?
>
> Yes, because that is how all network drivers have behaved. If you look at the
> function that Vladimir pointed out, then you will notice that the mere presence
> of a fixed-link node makes it a "fixed link".
>

Then, the way this phylink driver behaves makes the rest of the discussion kind of pointless
for now, because I don't actually need fix_mac_speed to give me any interface info now.
The basic of_phy_is_fixed_link check does the job for me.

Not sure why you think it's inefficient - could you explain that part?

Thanks,
Shenwei

> > If so, I just need to check if there is a fixed-link node as Vladimir pointed out,
> right?
>
> You could, but that is grossly inefficient, and I will NAK it because by doing so, it
> makes this messy driver even worse.
>
> > > There is no need to do any of this poking about to determine if the
> > > link that is being brought up is a fixed-link or not, because
> > > phylink's callbacks into the MAC driver already contain this
> > > information in the "mode" argument. However, that is not passed to
> > > the driver's internal
> > > priv->plat->fix_mac_speed() method - but this is the information you
> > > need.
> > >
> >
> > Yes, you are right. The best way is to change the fix_mac_speed
> > prototype but it will change several other platforms. That's why I didn't go that
> way.
>
> Why is that a problem?
>
> I really don't get this "I can't get at information I need without changing a driver
> internal interface, so I'll write some really inefficient code to work around the
> problem and make the driver even more messy" attitude.
>
> It's not like you're changing a publicly visible API - it's a driver private API and all
> the users of it are in the kernel tree.
>
> A standard part of open source development is not to bodge around existing
> code, but to implement efficient solutions to problems.
>
> As phylink *already* tells stmmac_mac_link_up() whether it is operating with a
> PHY, fixed-link, or in-band mode, the stmmac layer has the information you
> need, but doesn't pass this into the fix_mac_speed() function.
>
> The best solution to this is *not* to bodge around it by trying to second-guess
> what's going on and thus creating messy code.
>
> Given that we have the full source available which we can modify, then changing
> things like this function pointer prototype is absolutely acceptable, and in this
> case is the correct way to address the issue you have.
>
> --
> RMK's Patch system:
> https://www.ar/
> mlinux.org.uk%2Fdeveloper%2Fpatches%2F&data=05%7C01%7Cshenwei.wang
> %40nxp.com%7C4a805e10cd20434538f608db8df9edf5%7C686ea1d3bc2b4c6fa
> 92cd99c5c301635%7C0%7C0%7C638259876795921310%7CUnknown%7CTWFp
> bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6
> Mn0%3D%7C3000%7C%7C%7C&sdata=9A30fzTXCfc6fYU4Ttijm0c7Piy18tFUWW
> yxtyQoJLo%3D&reserved=0
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
