Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4940097EF0B
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Sep 2024 18:18:12 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F3D06C78006;
	Mon, 23 Sep 2024 16:18:11 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013009.outbound.protection.outlook.com [52.101.67.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2D35C78002
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Sep 2024 16:18:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y28yEc7aU0aFuw+aWkAxb89XumQLQWMDJD62WmAPuOnMOti6jRG+Xb+ontetvc1VIZLuu3UhL0bzXOJSwWtNsb491TZWjEN7hMdwVtuR1INwpnRUK5fQy0QqFH8AFlbzNn2h2XG6HvW5+05n/Wc802HueTlErs+/C24gCdCN4FxhBtkXNcOM2Ohy0u+u0nPhxdW8EcZg2yUtnGyJDbJaoXoolPzpSB2s+jR4yEqZtuCo3rUfETWJzi+2FDm4f1EeBKVV70YVNb4BOZuahfAlF/IKU58V39CAIl23u3GKu3ivWptRAXi5ROAjCu6l87IdCiBWcCnmtyg19wHmwWhhpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fgl+0REJK9LKYUUW7XF/IhhsdnvMlo7OBXGkMWtgv6A=;
 b=sG1dPSiosGBn1XhEM2yLCErI3m6FgUNN8lBgbtpoZ59OyntPZNbuYf40Ur6BfvbdFCw/FTPZNdr62uZM00QrOfkOZuVBjRi0pZeigzK3dZ4EJkkhJvXs+X2teE69uYKPx5FEeF2poJutXPn2Qbq1Mf+dRlESZTIGQTk/AElsB5wE/LNrc+BBEEIC3tcjUQ1OD+FbnK3TdaAjJcTd+Ou4paLslXk8qg9q2Lgti5Xnr0fk9b/nBNDy/FnXhbg1CPpUdHlzFHwfItrT3yLAzt9Ve/t2I8S6fW5AOErXx+b9hF34D50RxgZV8CTCWw6DHJ1MWJwG1CKocOGf9hyvDQ20Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fgl+0REJK9LKYUUW7XF/IhhsdnvMlo7OBXGkMWtgv6A=;
 b=AEnngIGOfQxt/n58J41QO/+56KfSEL8XL7Ol8CvmgqwaCTZSOKsrK9XAPX9w9d3jkdt4IiQ30cPPv76Xj/6GfzWOi6i8NJFBuOeSE3CviXiBBtfVHfz1Gw8O3PDDqP7Q+IHWA6g/287Y0M7AVvNsi30oZ/VuHI8ZIm4EXjxTkcNowF4f3r6P9SPJz/V4drP4fyml6LOgK7xQJlN7oXExISgDPlU2oIZJfuLCf2qOstm+AURrlHjKPrercupO1HoSJPCFm4zkEUgICNYIWPwkuHoEeeLi/iIFeS35bAdGGnTaUeTKC2O8jxNGyyxuGqTi1Zd+hEVMm6MKFrJV1aYWEQ==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB8164.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 16:18:00 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::21bf:975e:f24d:1612%3]) with mapi id 15.20.7939.022; Mon, 23 Sep 2024
 16:18:00 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Serge Semin <fancer.lancer@gmail.com>
Thread-Topic: [PATCH v2 net] net: stmmac: dwmac4: extend timeout for VLAN Tag
 register busy bit check
Thread-Index: AQHbDdQoAZF5k58yDUKsLlpRXAXGgA==
Date: Mon, 23 Sep 2024 16:18:00 +0000
Message-ID: <PAXPR04MB9185737222043AD4AE672D6B896F2@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20240918193452.417115-1-shenwei.wang@nxp.com>
 <yzyezokrtcj5pnby4ak5lzrrnqu3y3k45kaibtklwrjn4ivzel@hwf6bgssykna>
In-Reply-To: <yzyezokrtcj5pnby4ak5lzrrnqu3y3k45kaibtklwrjn4ivzel@hwf6bgssykna>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM9PR04MB8164:EE_
x-ms-office365-filtering-correlation-id: c44c6349-c050-400d-86ea-08dcdbeb4b29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PE84XxEt9Ms0ZC9wIhWo6vtcj8qyko6T6i26CKz8czaLV7lHZt3uYquMr8kz?=
 =?us-ascii?Q?91PqAsBjJ+CE/Wieqk4rPcrSflmTtCvAa7S4Er1n+r62RvBE1Aj1163P3uDS?=
 =?us-ascii?Q?Gibhg8pWn6VekqhbylkYSX8TWvBidAwvnByZyXkERj3fEkbhOypKn19rIo9w?=
 =?us-ascii?Q?adYJgytBHvFkO7qf2L40KFxjvgxjifcex3z+3XpJnUefNOfqictQ0TZC1Zd5?=
 =?us-ascii?Q?nG4bKF2cKmoXZ6LylB+28gJ2XG3Rmn9IYZvdAhPhG23YMU2wK0ANmeMUFSot?=
 =?us-ascii?Q?d6M0fbAcgRTQX69nSwuy7ywCcUgggyAVlqG83ehLO3tkFOOQv53Dh+05+9xY?=
 =?us-ascii?Q?kHjBD8y/KPjvc5SfrXxmuCfvVT7Kv/FR1gcEmZKobu89Kh+TN+b3i7EvwDgw?=
 =?us-ascii?Q?AxhxCXYFpvDbTgRWUXBl4JJwZ6B3BUgOYvwwwq8+HFgawUYHv0snUpJ1I3/9?=
 =?us-ascii?Q?VXVYAFdKSYX2sGA2Hb3yj7SDfeBuY1PXasAVLl5G6Ltdiurf2y5J/cYOWxdP?=
 =?us-ascii?Q?Y82i9RIwCl+K3TdKIM4wN4yiBmJzwIWUDSsvsRrFM17X2XzTwRq+mt2qPgfo?=
 =?us-ascii?Q?FyauHU/in+1G0f87eVzDgEzP6HOP9nEG0EjM98x1f1a4yWpuxM8K6sfg4ESP?=
 =?us-ascii?Q?tBgSAvYv+hq1Gogezl6WkKLnhwNJBw9jkTlhdoZgKmD3WDSpInHqV7fuCFVx?=
 =?us-ascii?Q?HQXRpodMdpiQbqzHfVVC63aXVuCJ2e/dCDhbrp4qSRVITjFgPay41biZlmH3?=
 =?us-ascii?Q?MVWB6KLGwNqfcboV4OELlL7t8ITulPa4p3EOVGW5b4q/VsDhIuKy80LbqgyY?=
 =?us-ascii?Q?h81Gh6SBX1SNPuxaKdoJNXFiriTFiEDWQHgnqmpTpZVh8vbnMRmAoN2C0yCH?=
 =?us-ascii?Q?Xl4IKky9NStnLvmI/Il7pgNORxBQzpDLpdBrytY4w8XQRvbibf+0i5p1IFLo?=
 =?us-ascii?Q?XhsiNhmAA1j3zNr0OckdBvk9OjxVASC0nqNX7T6w24wkRVu3TL5q+I0+tgEv?=
 =?us-ascii?Q?oJfUER6DDruDhyUNpDL36cHnVyAuGmawoCMhecuL11E0dSz1a8RFnb5B2dq5?=
 =?us-ascii?Q?ylt9ZtMfY6TBC0lC9SSuE9Tp73fsDjWguPSS+si6ypvbcUT3Cn0hBXeC4H1w?=
 =?us-ascii?Q?n/V+RwGOcG+Atl60+fioNgwYuotZ6SyM6yUktocSy/jOd9eBkcW0A/4QaHkA?=
 =?us-ascii?Q?mKw2jsvFfTG/lvm46ZQE3wyi0WkxCy58e0/abL0JTND+j8dF+mz9d5QfSfd8?=
 =?us-ascii?Q?JGfF7hWwjPJUjMc6xd0xMiA6oVVx659rzMsCUQ+/I1kgEWXI4z3+2/cxqr4Y?=
 =?us-ascii?Q?85xXPzerSlEzU47T3KR52808/1W21cd4gugDY43VGMyZMQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nJNJPE1ZSyrAO7R7E/x/UGBbFEjKjcaR+tmblDJgTZ0goe1PYdHGnDAGYwy+?=
 =?us-ascii?Q?MrucNna4Vi+/GNyxkVRIimnIjYcTAMFq+c7eEpXLJAdwTdNQGeWV70dcX9kb?=
 =?us-ascii?Q?YHHfEhx1c9jFbmsdBlxFEHWfFNog7pDYBbOxhj+twItKqmSQiPGwkwFF5zq/?=
 =?us-ascii?Q?5exzqyMJRyaQcC2qazbdr4rRyZJrCu6cpwn682lUHJvLIKijEPOU5a70XlAl?=
 =?us-ascii?Q?Fz9698R0qYy3mHkyPA/hMQofOV2lobYSWNbFYkNbQaPszjpQtI/V0kbCulJd?=
 =?us-ascii?Q?v+l5LM9wXH2qeqqdWq1IHCkdzh9iwJv5zLVfuK+boUxP8XWQOZpWMGbfE8Iw?=
 =?us-ascii?Q?TlBiDqo3WTDexy6n+hr37JvyDj1Zy8gaRiSFMek+oI8Jvgs+v9Ko8LCvoc4W?=
 =?us-ascii?Q?1AdrL43Lqhf9Y5nkYmQRFI+jaHcCnrNpv7rZeGz4jSCTrVPWqek+wOfXZOip?=
 =?us-ascii?Q?MhhWcRoxwoMoUAFVRZZxmfPlsQOXDb7xL27ZqTXxktdReY3GuBlOWdhfFWt6?=
 =?us-ascii?Q?YjHLdRz7GPtKGePCXLU1i5RtLxj1MKkEstVw/3BM6BFH0BlK1Urrki07Mfhn?=
 =?us-ascii?Q?2SWlvMz0CAY8bLNSTnMLcML5Ix2Ad6BQmspretBVicSkkhotcSMM1kk8Da8D?=
 =?us-ascii?Q?CPouxzND9LIkgbC7eRXHwGGQ5YqwbcgRBl3x3xVknmrDRAd3uEsyKRjrr9FW?=
 =?us-ascii?Q?o5l7Ym3cDp0gP6s8KfH57j115Zrq+1kYC39dNPcWK1ckuSgALcQsl+h5Nefj?=
 =?us-ascii?Q?EZpx78rUEv53pyF6E8XvyfOF69wLv0r1m+QtDM7RZb6xhBtOSibLBm40FzGH?=
 =?us-ascii?Q?nRKPVSvvQvNCa0PYL77e5SO4s0Xbk7xPN6yIgfyCQHEoiolLL7tIpui3Jqwd?=
 =?us-ascii?Q?/jzNcY2vdKSqd65WK56/WeCR2D+0tKZgYIvS134j9uKVQRPTIGYRv/OfOpq/?=
 =?us-ascii?Q?r+DOjtHVb5p4unWttHEjU35AhKkGRm8j0HhBVY811l0P131O64X5Kfr82x4q?=
 =?us-ascii?Q?Ev/PJyN9Xkw5c4k+MB/MSpkcu3hMz5Qhhu0by8UPjDM+N1SbDacZSPRaSTj8?=
 =?us-ascii?Q?m7MPXhGbBVaDjJlRSbhpY4ybl0ZI+j554xR50WtDYmi9HlkQiwjrigFBFKFX?=
 =?us-ascii?Q?KEzlZZzt+/BDY8BxehDHV6f2bSgIqcc/jFYiYG8KopZD7IWI5ODGWCYSe7QK?=
 =?us-ascii?Q?QZY/ME0cSKHz7wuHHI5RUVtPJoY7olmEDzQjsWyJDzINbRMio6kkPqqf+LVl?=
 =?us-ascii?Q?UsaaNIeuOrmgJTlbSp93zlcy6Ie7ZSNxvbGasFXunLuJOD46Mx9/G19BVSh1?=
 =?us-ascii?Q?PhYcd/7zk+eQF85HiKOBD5+6Yb1DKGm9G0/acBEvJMc9ITWkzMw+JKSKhonQ?=
 =?us-ascii?Q?ffT8EVqnPpIBQvv87lchLXr8wIg/K1uAxDxm2fm8z6gVbuDJuenhRO0ba1QN?=
 =?us-ascii?Q?pwpiI/DjiErRXLuURW9tqDk8iTHDqSCHwR8Tl2FbyyDUpheHqTlSUnF00pzi?=
 =?us-ascii?Q?ui36Sf1VNAyb92TC7rdoiriYQ0m8YtiXUot2REy6LN7qftipEbBHhB6Y9MW7?=
 =?us-ascii?Q?PEykq/AEKW5wb62XESRSocakl01Bw0tHctB58lak?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44c6349-c050-400d-86ea-08dcdbeb4b29
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2024 16:18:00.4238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6U1OmjAPnHyL/UqCaUE8B6eTdMqiFumsYgHq9CAO396+Ss5SU7Yn5+xfLKY/WepUJBhR/yT/qx0mEN6PY5F+Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8164
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Chuah Kim Tatt <kim.tatt.chuah@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Wong Vee Khee <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, dl-linux-imx <linux-imx@nxp.com>,
 "horms@kernel.org" <horms@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH v2 net] net: stmmac: dwmac4: extend
 timeout for VLAN Tag register busy bit check
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
> From: Serge Semin <fancer.lancer@gmail.com>
> Sent: Sunday, September 22, 2024 5:18 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: David S. Miller <davem@davemloft.net>; Eric Dumazet
> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> <pabeni@redhat.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>;
> horms@kernel.org; Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose
> Abreu <joabreu@synopsys.com>; Ong Boon Leong <boon.leong.ong@intel.com>;
> Wong Vee Khee <vee.khee.wong@intel.com>; Chuah Kim Tatt
> <kim.tatt.chuah@intel.com>; netdev@vger.kernel.org; linux-stm32@st-md-
> mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> imx@lists.linux.dev; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH v2 net] net: stmmac: dwmac4: extend timeout for
> VLAN Tag register busy bit check
> >
> > -     for (i = 0; i < timeout; i++) {
> > -             val = readl(ioaddr + GMAC_VLAN_TAG);
> > -             if (!(val & GMAC_VLAN_TAG_CTRL_OB))
> > -                     return 0;
> > -             udelay(1);
> > -     }
> 
> > +     ret = readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> > +                              !(val & GMAC_VLAN_TAG_CTRL_OB),
> > +                              1000, timeout);
> > +     if (!ret)
> > +             return 0;
> >
> >       netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> 
> 1. Just drop the timeout local variable and use the 500000 literal directly. There is
> no point in such parametrization especially you have already added the delay as
> is.
> 
> 2. A more traditional, readable and maintainable pattern is the error-check
> statement after the call. So seeing you are changing this part of the method
> anyway, let's convert it to:
> 
> +       ret = readl_poll_timeout(ioaddr + GMAC_VLAN_TAG, val,
> +                                !(val & GMAC_VLAN_TAG_CTRL_OB),
> +                                1000, timeout);
> +       if (ret) {
> +               netdev_err(dev, "Timeout accessing MAC_VLAN_Tag_Filter\n");
> +               return ret;
> +       }
> +
> +       return 0;
> 

Hi Serge,

Good suggestions! Will send out a new version.

Thanks,
Shenwei

> -Serge(y)
> 
> >
> > --
> > 2.34.1
> >
> >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
