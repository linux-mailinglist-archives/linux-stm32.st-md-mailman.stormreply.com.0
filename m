Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2253CB52686
	for <lists+linux-stm32@lfdr.de>; Thu, 11 Sep 2025 04:36:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D816EC32EBF;
	Thu, 11 Sep 2025 02:36:26 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011038.outbound.protection.outlook.com
 [40.107.130.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 09914C35E3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 11 Sep 2025 02:36:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cULmPx72FD/Sh8wJQp/lDEnip7eqzbSBfOHCwBiJAAvj3sOkh6ZdkuLK7lqQOf8LtnL0h9iZf4Rn0uLlyayEYajlqPixQx+tiTiSGs5zFFLJDz3zQB1fNKOvVgRYUseh9ezWxfIQ02VFUkAPuD4phgsG5Isg1s2rDHFXEYEd5SxJNNKhV3s0Mst9yTPc3Rh51tbHjJcx+jk634FK+9d87E8mxzSg/xT1Z5M99uxXucNH88mV0IdgsxkRV3AethDYnbNLlylHqtt8ZHONTxKQkXCoRiypu9ipjg+EAZuQbL4dPRkTbRvt7PkLpGFG/09gWKeY0oii/f2YDSlYaJD+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGXD4AXV8Z4rfMPY5k6CMikOdH7KNxahRPt7lhRkhHM=;
 b=he8Vj5mu+6UiBJ2Bl4zUp/KApH3Rf9ClgIVbd1PtaaR5qVw0Qt9toszfb5ocmxLxgYPYAHjPKYRbKREFsh8kkS5EaR9/YIosjQBeV4vSKyhfzLYTmt4WBujvNlIQT7ODnCGGHUWSEOX3YNZw/xbTMTMIPdfyEzFAcc4GD4s8NIyH1ox0ldZtw8Vba8TAB/v9N67pcA7FatWA6EO7Q4ekGn0C86uLtuGQoXRDEdLyBPfFabUhvsyU0S+zBeFhYqQJjnVROLai2NBRKMQcdmoz7TXSixNAL7+lXo/GroREw4mfxENYJxhNsFHGvNItdFipBRFA26NpmUJ1IehFwtNa7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGXD4AXV8Z4rfMPY5k6CMikOdH7KNxahRPt7lhRkhHM=;
 b=bTodsYH7WYLhKGiyRu7/W0bnDPSeXTli2YPdYyA65hSUg9tsKf9ZepKo1QoPgAbgQlDEqA9S02RFow3MFIp44InKvAGaYL6T6WMAvOd2nsh5phxkFxPTAH87RMnEHiUVpXH41b6H5NWm8FMHmZDTMIutI++QazHlfujyFTd94Fy5kJeMwKTGZamUi1XXV1Nnb2W3G8pxh8uaW5ISKUrOSTX3U7MtmTqe6Z87hKZnvtfzyqXEP+R9lwsYVIQFWQFpeL3Eja/CrKmynY+hlUEO3wG4S0sZ8Ma42TR3clIFrub8nvGulj85x3otEIOsZyYKae/Rqm008wGA4tlPTf4YDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by AS8PR04MB8740.eurprd04.prod.outlook.com (2603:10a6:20b:42d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.17; Thu, 11 Sep
 2025 02:36:19 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 02:36:19 +0000
Date: Wed, 10 Sep 2025 22:36:06 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Message-ID: <aMI1ljdUkC3qxGU9@lizhi-Precision-Tower-5810>
References: <20250901103632.3409896-1-joy.zou@nxp.com>
 <175694281723.1237656.10367505965534451710.git-patchwork-notify@kernel.org>
 <aMI0PJtHJyPom68X@dragon>
Content-Disposition: inline
In-Reply-To: <aMI0PJtHJyPom68X@dragon>
X-ClientProxiedBy: BYAPR04CA0008.namprd04.prod.outlook.com
 (2603:10b6:a03:40::21) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|AS8PR04MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: aa87321b-9750-497a-e6d8-08ddf0dbfce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Acg70j2FAj8mzCu3nDta60X0VEV2sNsmk5owzOppLqsrxBB6HjuV8zbutZAx?=
 =?us-ascii?Q?lWEWT2j37yyz9XUTYKZu5EliwvZ8ZXL0htRBYY+4lqOqTTfCzjWQIjqKylFA?=
 =?us-ascii?Q?4Ys7M5vON4Yj+tF02kzuiFEuz972dTNHYgye4LTOvKLGm9B/sPJBW6BwH/KT?=
 =?us-ascii?Q?JD9oOeqUGs3gLlMTaD3TrSyo7sIvLz7d2OuBRsYGWVn9YaUTHyR17ljVGJEL?=
 =?us-ascii?Q?lzFB9dhtF5DpWkYYt51QlydiRk+jjtAl0RP3wSSQi2gro0rWe7q0NxzW8mma?=
 =?us-ascii?Q?BEku1tV/cWnjRe8Qj8/AYeIQWLlnu2aL5g6ZVTD1AvQzRpWJF8chbQCqYU24?=
 =?us-ascii?Q?Wu9B8IWtpL5S+80mOwxhHozGTUHGdLdysKqHZj8AC9oaN5e1E95czqUBuVng?=
 =?us-ascii?Q?q85yia1YmroLF96aukChwP92sL7g1QYnt3nN8e60xUKDyYEMxLmLuk8FM+P+?=
 =?us-ascii?Q?7n0XkvArDXeiX2asIPIuQKtHIrJLynTiPSFSC+rHOaJpESgXH914F6RDZ69A?=
 =?us-ascii?Q?ZDxapPdBiAwGW1v411qxPndN1cIeX9Hj5W1nM4MM7QKrKZoh6QjdLDyDU18s?=
 =?us-ascii?Q?MulO4gwrt1GZPcOz/NuOlkBP2Zgb1G7KjalCc5kRhJhTH8MPLj42RG2LD2lQ?=
 =?us-ascii?Q?c4S2Go6evlXhcyTQg8CDS70sbdqBZ1QyjyaES/oprkZSmCSivMGibQjxRa78?=
 =?us-ascii?Q?cpxVZ9N1Xz5asi7HyprU4+iGTFjyH2ZSfaPMnEHbjy7Yur+CtqFpcrdp+MS+?=
 =?us-ascii?Q?l2C1ybaj+LOSzPhcrnJ18YTU/VJjTP/fkEWvC3CLqf4QBiyoCkHhOIAaCfxg?=
 =?us-ascii?Q?wKVmQdbAUCtjFpYkiwf2NbXEEfDbNTC1IdQGn1KvnG58XSjkEbF0jDDAEtbP?=
 =?us-ascii?Q?0XzRnmFRvy3i0jzhc126NSuwpMTe9ylnF4MvrtJ95XHbYnA9DtGwIbJ0NWAl?=
 =?us-ascii?Q?RO1eAt+JCWIfjZVG1MXk3BQuBRX2av53dQbrnD9r4M5KgETTsL5+h0s2O/M7?=
 =?us-ascii?Q?9i7a4dUIQOWotxU0CO3Tdz5kYJ/7uerTXtkfhcUmkmCReWwtEFP0KrkUiOmd?=
 =?us-ascii?Q?X5qpWwnq2eH1IsjxxOAWRaEByaWYJwK+1ifx3EVV8iilQ8tmvNKfpo4Z3AmD?=
 =?us-ascii?Q?WgN+JLZCCG4MD0cy4BRxcoRXwRBl9EyMoTtyJV7otNKMNAJknoVyT853N2uN?=
 =?us-ascii?Q?HCwA5F2BOECSGj1c5I6OlAHo2AtXN9FDm12Swz1v8sqsj423YNHEwvJcjwH8?=
 =?us-ascii?Q?x4Byp+m91ZD1ypG3P0/GqNJcH8tCrs1PV4YAaSizT256/VxuOvaF3MhYNgew?=
 =?us-ascii?Q?Wi75gmKtSsHMkjlupvowYyZjVdc/gioRzulfiCvuioPbYsImz29M8XWa3uAt?=
 =?us-ascii?Q?kfEx592NyHEOWjRvRds25JVG5SjGUl9+TTPqphoqhyX+sJnKs5knpwZdWzWW?=
 =?us-ascii?Q?tYzd3p4LmIo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(13003099007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8UqgI+J9wQz6JmDV72OzKvikN/DdbIQoVxsPr2jn4dRXW7iU36USX2tb2qn0?=
 =?us-ascii?Q?SUSjWKv0n5mThjXkyRJFmEbmikwd/piijwN6r0z29BfWaAAz1iJpm1kHX40h?=
 =?us-ascii?Q?yPZl1Bqr8oP+ofXrc9Ycra4awKjmGFOumSjI0MVR+JQBaPsYjsG0+KZ4plzC?=
 =?us-ascii?Q?PEfz4887q/VawzEEBMQvPPLbqPTeyPW6MACvtaS+PYPrONIuqvLG/zseaHNK?=
 =?us-ascii?Q?nR7ibD/GGLb7tuLGsA3JKUTcrQrNh3UpT6sMW1NWVezz1LNvGT350vXlnGHf?=
 =?us-ascii?Q?VvKNH85mzPKd82mT0khx8dOgj32I9I2EHwW52pfmIJPHbOp2KxKCf9Cs7Bii?=
 =?us-ascii?Q?N80Zzs8YIOnrbhPk8UbzOjft6Gd08db4rCiTtze6fz05F5MsnSYryIClcmaH?=
 =?us-ascii?Q?etz6Repy+H3ehyNqWvInRdBKkDO7sESV7QF+YtbXOep7Y25fc4L/+2NuYKYl?=
 =?us-ascii?Q?YhpfNC+LO7D67pq3CsAPb7QyaR4Z4D1yP/5AGAmA+l1FlOlR7yHUSxBm5uzW?=
 =?us-ascii?Q?o3BkpvZIvq54sjlkM6H8xJ1k2bxb1qGqtPYra0rsQnnUmnX0xF+TkS/DY6Rl?=
 =?us-ascii?Q?ixGfg654/up8RR2zMjQo3qA5sPMq4W1JRiADlafKzvQrR2/V14U2lSQtPsKk?=
 =?us-ascii?Q?ZsSPYA5p5hETVL0EmjKfpz7dzok6WLoGcvEwCaU/8kNV29AEneozq8xr7e7j?=
 =?us-ascii?Q?GDHkn302NdKbxRtllCr8XkhudpIv0AAiAc9fxvjYHE1OssmHoQZXG26q395z?=
 =?us-ascii?Q?p/fJseiPQpAuBv/XBSoO67c7RhflzaaKZQmkDxtk9Af+NrEEc2Tr81OhECNy?=
 =?us-ascii?Q?U5APBLsgb3Gush/hg7XO0I1DDDeONhNGpfDhsewrmmS5PtLYOKPPokkHmDBq?=
 =?us-ascii?Q?Pm6SKJ6o7IEMtO+V9VfDKW/YOavHfBj8SB8tr8/hYw+/il6cb6OazD9l6Xm3?=
 =?us-ascii?Q?Wh9n7ZhNgXOfq9PtlP2aG6pmgl1TuGiE5fmmYK3o+a3J3sm237BpFNM18glP?=
 =?us-ascii?Q?d4lg2ofzEFdtRTUCs/SjPStgSyjx32oND97Hsn/BqQylcDOA2cw7GDcudPYf?=
 =?us-ascii?Q?iThPln2wuq3BtOC7xVtzyYluxedb2YEQc1677MQCdhXrIzCbr+oURSR37BBm?=
 =?us-ascii?Q?GVS/swbdCGCWr+WmU/vLZX878U41fb9IKATdwuDowfuk+AwValgR0J5DJ8Ya?=
 =?us-ascii?Q?J0oEuxeq0PMwtX8R6rbi0wtGbMzPjMRvFcjvJLtFdMbq+o7JqIApkzSjx/dT?=
 =?us-ascii?Q?WkyGJKr8T46hg1I9TSCsUqf+k5exRpjQ+IkBzhVfAjraEVaaN0wrg5HTCEan?=
 =?us-ascii?Q?zbG5KolyyMhZ+YYuZWX2DtXsOdIADMluPRioheWymZdqGNYGOxGd1qtdb8MX?=
 =?us-ascii?Q?fFjPCOVOmla756UEqEgl40VHNuTN5++Yt0JLrJeUk2m7GnjJDhFf5q9Jz9Hr?=
 =?us-ascii?Q?QooHoLYx5r8Al1Epbahg9sWfJ4JjGeeIFFe4PHlmFQmzLGsr7Vp0GwPBGFHq?=
 =?us-ascii?Q?Ecqad83wUrvI3lzExbheANaXja7Mt0IAk+kpxW5IXW1yhHkh4zdaGGB+Lqzz?=
 =?us-ascii?Q?+2rkU8xyfPCN7Nm160SHou5LUt4UgTJ6cdVG/YiZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa87321b-9750-497a-e6d8-08ddf0dbfce4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 02:36:19.0455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUM0W7diA0mnn1NKUjrigrsWJrRLoRnoR3xJ8f7XmxUraIp0cYwkDjktq1a4pna6wksgWeoyumnOPcCFyelMmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8740
Cc: imx@lists.linux.dev, alexander.stein@ew.tq-group.com, edumazet@google.com,
 festevam@gmail.com, linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 Markus.Niebel@ew.tq-group.com, frieder.schrempf@kontron.de,
 primoz.fiser@norik.com, Jakub Kicinski <kuba@kernel.org>, pabeni@redhat.com,
 richardcochran@gmail.com, Joy Zou <joy.zou@nxp.com>,
 devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
 linux-pm@vger.kernel.org, othacehe@gnu.org, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, shawnguo@kernel.org, davem@davemloft.net,
 linux@ew.tq-group.com
Subject: Re: [Linux-stm32] [PATCH v10 0/6] Add i.MX91 platform support
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

On Thu, Sep 11, 2025 at 10:30:20AM +0800, Shawn Guo wrote:
> On Wed, Sep 03, 2025 at 11:40:17PM +0000, patchwork-bot+netdevbpf@kernel.org wrote:
> > Hello:
> >
> > This series was applied to netdev/net-next.git (main)
> > by Jakub Kicinski <kuba@kernel.org>:
>
> Jakub,
>
> Can you stop applying DTS changes via net tree?

shawn:
	Suppose Jaku only pick patch 6.

        - [v10,6/6] net: stmmac: imx: add i.MX91 support
          https://git.kernel.org/netdev/net-next/c/59aec9138f30

other patches is "(no matching commit)"

Frank

>
> Shawn
>
> > On Mon,  1 Sep 2025 18:36:26 +0800 you wrote:
> > > The design of i.MX91 platform is very similar to i.MX93.
> > > Extracts the common parts in order to reuse code.
> > >
> > > The mainly difference between i.MX91 and i.MX93 is as follows:
> > > - i.MX91 removed some clocks and modified the names of some clocks.
> > > - i.MX91 only has one A core.
> > > - i.MX91 has different pinmux.
> > >
> > > [...]
> >
> > Here is the summary with links:
> >   - [v10,1/6] arm64: dts: freescale: move aliases from imx93.dtsi to board dts
> >     (no matching commit)
> >   - [v10,2/6] arm64: dts: freescale: rename imx93.dtsi to imx91_93_common.dtsi and modify them
> >     (no matching commit)
> >   - [v10,3/6] arm64: dts: imx91: add i.MX91 dtsi support
> >     (no matching commit)
> >   - [v10,4/6] arm64: dts: freescale: add i.MX91 11x11 EVK basic support
> >     (no matching commit)
> >   - [v10,5/6] arm64: dts: imx93-11x11-evk: remove fec property eee-broken-1000t
> >     (no matching commit)
> >   - [v10,6/6] net: stmmac: imx: add i.MX91 support
> >     https://git.kernel.org/netdev/net-next/c/59aec9138f30
> >
> > You are awesome, thank you!
> > --
> > Deet-doot-dot, I am a bot.
> > https://korg.docs.kernel.org/patchwork/pwbot.html
> >
> >
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
