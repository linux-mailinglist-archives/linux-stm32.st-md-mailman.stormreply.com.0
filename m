Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACED295C900
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Aug 2024 11:15:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F67CC71287;
	Fri, 23 Aug 2024 09:15:19 +0000 (UTC)
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3144CC6DD66
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Aug 2024 09:15:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loDih5CWHmpc9HaX/AmsuLJRZNQx0a5oExTV0ONKfbkyEgDHf5v3KYlZiqIE1/Uz/vYdseTf+tcwwKzrdsMlHtMF4JXEvA14CdvTDVPooo1hIV3kU9fZA7g/KKD5Q2N+j5tY455JotD/RxAVPchxBK5sFtuoM+5dMa5965GJLHop/zJYnLMHp7H5ZHQQXHqugsvnulKLutyVs1L6XvHGiw8J48piqq8unugKhVPXuFCgRb3YGQygR7ft/xARLV9tdg9FHzigPT/+gYGmnbgCXODEj1Um7+0aXQZAXfAK5TGBx6L7sZxnazcnjtZZn6xwBEOl/jqtb6EH+hDnWkgVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVJQl/4FQGrdQODqzEXWZ862/SOEHl4gRfKNxHzXZaI=;
 b=CLuwOKlTATJx4JBRQ01HUlahyyk+/4ZGioFYy2Id23Oql4Aq1SpjWNd90zN1ajPOAo1hlyVCgAkoifGD08L1fl5nwygHiOlKcPTx3t4kFnvELYr5EqZdgKR/JSAYuz3P+FRc7UKVG3261UPlvgw6OmGgEFWNnpOuQPy3SwfaWTwZa4gc9g9EAfIgCL+wibWWbhol1Ox1hs0c5XIoCy9+GmFiwnlysKBaxXZeRGCfFdewc3LEeZy9v9xgzNSBr/ZQJRmpfJSeFG1bLmOmjfFaz4m61XjPPfc6Oa4OaITETD4Se3WctvtWQJvnkq42+JfH/pmJn4Oj2jo8xJh38ivzOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVJQl/4FQGrdQODqzEXWZ862/SOEHl4gRfKNxHzXZaI=;
 b=MqXk+ZH/KHMxMaUkxZSleWQX1gwM/7Io/b6+gyBJNyBzAnhMMH7UNAXYbJBgNclxmxRwlMWdE3BXrnLMj09UQZVK1wjk8otFM9oohFB8PF9pHREYOe3j/vY4omHOakMJjch3svTrkjaAkRgwi6slG7OfLJf7ikQKvNSEh4EOrz4=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYVPR01MB11331.jpnprd01.prod.outlook.com (2603:1096:400:366::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 09:15:06 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 09:15:06 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Serge Semin <fancer.lancer@gmail.com>, Yangtao Li <frank.li@vivo.com>
Thread-Topic: [net-next v2 2/9] net: stmmac: platform: Convert to
 devm_clk_get_enabled() and devm_clk_get_optional_enabled()
Thread-Index: AQHa9Tx0ywHLxX1O1U+AWstZvr6hCrI0jxTg
Date: Fri, 23 Aug 2024 09:15:06 +0000
Message-ID: <TY3PR01MB11346C33198DE80DD9DD1CC3C86882@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20240823072122.2053401-1-frank.li@vivo.com>
 <20240823072122.2053401-3-frank.li@vivo.com>
 <qx4k2xehasda7zj6vt3bygdh3scehiiwniqvljj4b4rjde25a5@ys4oqsithhwi>
In-Reply-To: <qx4k2xehasda7zj6vt3bygdh3scehiiwniqvljj4b4rjde25a5@ys4oqsithhwi>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYVPR01MB11331:EE_
x-ms-office365-filtering-correlation-id: c608a8bc-ad44-4cf7-652b-08dcc3541451
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TxQUXAtfpMWQr2QFQlH2QYd+gy85tYjsBwbxgQkaxTyd2kPhS3mU8f95nVNU?=
 =?us-ascii?Q?5yiJlgJnOPH6REScxUZZczv1ybcpEoz1kYeGLesR0rBR3j0wiD4djlbQjJBa?=
 =?us-ascii?Q?gH/7Yzw+2auKpfNYqDv+w/cC5wiuyN0nVFY1hZnTBg3rvVPpaCdPbrYdTyat?=
 =?us-ascii?Q?K10iDq/BulRjKylerOMbXRXZ6eRExBHh8BCcLfxoI5gdXXxtMAH8Y2F55Fkq?=
 =?us-ascii?Q?JZVjlpa2fCWe/WeLjskfNXjwv23GMZUh068TMKaTWz1pRQXgV6oR1RcO1cah?=
 =?us-ascii?Q?qDm/B5IBMGscclE3RrfvE3NOxng2AAZJNFbHCxRe/1z4moSE1VUHK2J8bv0q?=
 =?us-ascii?Q?si5Cy3cWA+E4XfU4zbej26J6yOlvTvypRk4XkFd5TqynSq2QErAKCoWVemWG?=
 =?us-ascii?Q?8Edrw4VTXV/mSQ+FJkcKsUoqh6KFGxYWV1XfgfuNosNuZb3raQYvjKFBHjiM?=
 =?us-ascii?Q?A/3p77cJ3F7URD1cf3I7HxV46qja5oNa/EKO5yI967ZHMm56BT7lvlXebSDV?=
 =?us-ascii?Q?GgeNF/ZEHYVkoNH572Qybh9D5HJ1mqX7uGoTE+LR3SwWBtgeYr9EKxsdjxFS?=
 =?us-ascii?Q?eHjbR83gXfzt6ZQdzW/KAFfvMqejBU4cVsusFMZ8QJ1Q6SsUZgG3Db9BWCHr?=
 =?us-ascii?Q?VxhONvnbUyJ5eV4DFykxsL/LW4AwFCeC5pyp6wGsJcKYvwkL8eMR7Uy++Y3o?=
 =?us-ascii?Q?XgpxzBi8NWjDQzfAFcKnli7ghJpfEkJEw6DGOMgIKavc//chDy8vwODfuC5Z?=
 =?us-ascii?Q?rGuT6FSTsd8rdZy0M2bsfbVRFce4Yy/fjls6G6rv2HMt4CoFrVP3WHKijhHb?=
 =?us-ascii?Q?DMbU0Fp3z4rq/TTiLyrjJY8GFpasVepG2LcFr97+3Aj3QzYsXwkHulmvrds0?=
 =?us-ascii?Q?MxnUk1WBqEmPnGzAj8ykRnPpjyARk2ly0LrZKqWuwgqHBnu+gm6EoSkEjIRM?=
 =?us-ascii?Q?8MGGsBMNgU3WlLlJLlx1D7Hyd9pQ9YEpnUlJDXA0JJCSBup9it8skwB9halP?=
 =?us-ascii?Q?QrAIAyoj7Fts3FIHKq6LqMIyq9opVXlNLO3J5rQ8ezzez5i6Wa/trTV5U8JH?=
 =?us-ascii?Q?7IUrRbnvkySn90PwVsnzBIeZ5poymm5ayeOIqwDdKUVIDV1qI1E/YBNb9NGo?=
 =?us-ascii?Q?uAcfONXZsc7U1zzA6+2m/OxZAKYzLj09WEaRdm3ZBHvtWF742RnDAOy7tC3Y?=
 =?us-ascii?Q?rrUHy27CcC3+bJwUzbNUq+TLrqmBjIPcX+DnybW2SP6SeL2lSzl3qUgWpUAp?=
 =?us-ascii?Q?KGmgDUcceSZz3lOLE1UirEFpjEuLOBheEMuYiK6z8daDG6rT9rEGatHjjBLg?=
 =?us-ascii?Q?qNH2B6btN8gk7QX5ICqWy0WS6oK1L50AeQB12O/4d3q6dpgV2sVd/yyJEqSc?=
 =?us-ascii?Q?OAaEB5lyJ4yseH5Q3Y8/L296OyeOH3IqPYXkhNVSV112Lp5e1g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oKS0qAzpSsl26b464RFfYOrBZbAtG9N88uF8SyzUniQYQy7C6LpAAaVZqz1c?=
 =?us-ascii?Q?yPESTMaPYMNBHXou7Dh02tgj4roNkCUcokLGSzDi9cL7loU60CFPVWJGbAb+?=
 =?us-ascii?Q?uMgSjXxF7/SmPxQrUFERrnfKmrnCDoDuqmDg6DRN5oLs1UT7IKzwFXEExLUP?=
 =?us-ascii?Q?sKVbrKLkzyxvdd4q9n8aWGEyN2s0LMOVwZyY+2evoZ0Luf/b80kp59ksFqKw?=
 =?us-ascii?Q?wctBfmxWgut5yoSF311H3r5WCICX5OUffKnpwVXfRLj85GeiDr4IOYvRq2vf?=
 =?us-ascii?Q?sAqI8I3NvUwTs7tlQdOKBATWyAOLmHnJoBSeF4bHTK3FT/umys58LLXEmd5m?=
 =?us-ascii?Q?L3cscVumaONPpiMym/dRgbe0uHfw3u0sApKa1hiE/2XZwc1jgtC5gJ/KC0Ex?=
 =?us-ascii?Q?CIJOeuS4mK+I+ormCuQ4TrtMY2HEWGGiwHzwO5vLI1oSUyRp8BQQjj28W2jb?=
 =?us-ascii?Q?u7Ttfqy8YF9EbFmh/oUScqGqmHtW2fHnO9D6RnaS+NWqsporDiFthuXyVj3b?=
 =?us-ascii?Q?6Kj11v2Z6nwkZQyjJWrcwE60BLoL1mkn6E/SuDuwb6r9/HTjLGqOs6cWs4vR?=
 =?us-ascii?Q?o9XQmRtkVfExtwP0r6I/VHwEIXOJNLHrWQu+rY9/1FyXOdXjjg/YpHJgYw7z?=
 =?us-ascii?Q?v1xX7mXM1POkUZY9Kn9XI+CAc68m3lSsYvBxOyLEmcbFOSxdkhnqMrVBF9Mc?=
 =?us-ascii?Q?rttGmDCQVU5yj10Lg/IOHQnl26BL5xL+yAFK7Xft3MOzX0W/0J5Sh9ryi0zi?=
 =?us-ascii?Q?VSuBVKX8naZ86gbHgPHXBBUL/qTO6azRwl13zvVLQEIBUYsM9cMHgLEH7eZl?=
 =?us-ascii?Q?O8rwsiNoumRrNJv6w66lZ7D7TusKRZaWE2z4I6PQl/tnIIsLL40YxVHqFOu1?=
 =?us-ascii?Q?fgCJdgGhzuFKtr60xy0jVIpCf5q/8ul3KHsDetKVvyIYUFOc2Vfufek0G9OA?=
 =?us-ascii?Q?6vgU/pHpyFV/cDVS6P4WGyFnXwzctXqX8pdYkUPBs9/E+jeqSyvdzPicPxV9?=
 =?us-ascii?Q?uOW0rFn28NRpD5ioWtS8eiPJ6YLJVq/smvn4ozfu9Tcb7BlAhAfOa00yfOsj?=
 =?us-ascii?Q?gnBPPA/EixX9NXelGCsrU6GppY/5g8qLD/N/sBJektXgNb1mp65nqSs8eytU?=
 =?us-ascii?Q?+igze6fkOjcekUN5FquTcz+64Y/0Ei/N0GWPy6vL4I5PkSNvfZxVkE3SKIS4?=
 =?us-ascii?Q?JpEyqYBJUu1j5nXxc5wipWnCRWA67r8/9eZWX9S/zkmKlB1KYoOyqdX7lxML?=
 =?us-ascii?Q?X4qGTdq9yRqVqfnng1CPS5/xTBDAqy6yKDGTRoZhUfQQeHGdjm9qYKt1ioml?=
 =?us-ascii?Q?sUAtte1HjE40newRdM47Txvmk1aNAFTW6mojAw8+jhX9Afqkng04g9KY3IUg?=
 =?us-ascii?Q?9LaIvrW544ppWLlPRo/g4NcO4c1EIeacDi2+9EpWYRNSe2u2OgZhGjwZJ8S3?=
 =?us-ascii?Q?PorCijENAoxe0X5B+PAnt4vxMM5GvdSXbPGaxN1RRJHu86VmlWe2/Q6fPpTz?=
 =?us-ascii?Q?nawsEvJOFLleURsCr3qP1g2JZUY/tc4icvlMey7E/K5BCZPNpbiHA3JNrL/M?=
 =?us-ascii?Q?/ZUEAor7He7fDWY3pTJMkD58jO6QCH5Q6AZ00YrEMpT1kv+qF12YDwostKoO?=
 =?us-ascii?Q?KQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c608a8bc-ad44-4cf7-652b-08dcc3541451
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2024 09:15:06.5143 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Du0wXL900A3P5be8ppqzRsu0diJbkP+dyIdZ+bPHJRzxtJwf1lmxOFOLAvTWrGookzvxyEMwluzno4Rx8+UtKz0CDaMSU+XfQ5NARNzDhkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB11331
Cc: "andrew@lunn.ch" <andrew@lunn.ch>,
 "marcin.s.wojtas@gmail.com" <marcin.s.wojtas@gmail.com>,
 "kees@kernel.org" <kees@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "sd@queasysnail.net" <sd@queasysnail.net>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "joabreu@synopsys.com" <joabreu@synopsys.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>,
 "clement.leger@bootlin.com" <clement.leger@bootlin.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "ulli.kroll@googlemail.com" <ulli.kroll@googlemail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "horms@kernel.org" <horms@kernel.org>,
 "justinstitt@google.com" <justinstitt@google.com>,
 "olteanv@gmail.com" <olteanv@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [net-next v2 2/9] net: stmmac: platform: Convert
 to devm_clk_get_enabled() and devm_clk_get_optional_enabled()
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

Hi Serge Semin,

> -----Original Message-----
> From: Serge Semin <fancer.lancer@gmail.com>
> Sent: Friday, August 23, 2024 10:11 AM
> Subject: Re: [net-next v2 2/9] net: stmmac: platform: Convert to devm_clk_get_enabled() and
> devm_clk_get_optional_enabled()
> 
> Hi Yangtao
> 
> On Fri, Aug 23, 2024 at 01:21:14AM -0600, Yangtao Li wrote:
> > Use devm_clk_get_enabled() and devm_clk_get_optional_enabled() to
> > simplify code.
> >
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> > ---
> > v2:
> > -remove unused 'ret'
> > -fix incompatible-pointer-types
> >
> >  .../ethernet/stmicro/stmmac/stmmac_platform.c | 35
> > +++++--------------
> >  1 file changed, 8 insertions(+), 27 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index ad868e8d195d..1a66baaa4081 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -415,8 +415,6 @@ static int stmmac_of_get_mac_mode(struct
> > device_node *np)  static void stmmac_remove_config_dt(struct platform_device *pdev,
> >  				    struct plat_stmmacenet_data *plat)  {
> > -	clk_disable_unprepare(plat->stmmac_clk);
> > -	clk_disable_unprepare(plat->pclk);
> >  	of_node_put(plat->phy_node);
> >  	of_node_put(plat->mdio_node);
> >  }
> > @@ -436,7 +434,6 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> >  	struct plat_stmmacenet_data *plat;
> >  	struct stmmac_dma_cfg *dma_cfg;
> >  	int phy_mode;
> > -	void *ret;
> >  	int rc;
> >
> >  	plat = devm_kzalloc(&pdev->dev, sizeof(*plat), GFP_KERNEL); @@
> > -615,21 +612,16 @@ stmmac_probe_config_dt(struct platform_device
> > *pdev, u8 *mac)
> >
> >  	/* clock setup */
> >  	if (!of_device_is_compatible(np, "snps,dwc-qos-ethernet-4.10")) {
> > -		plat->stmmac_clk = devm_clk_get(&pdev->dev,
> > -						STMMAC_RESOURCE_NAME);
> > +		plat->stmmac_clk = devm_clk_get_enabled(&pdev->dev,
> > +STMMAC_RESOURCE_NAME);
> >  		if (IS_ERR(plat->stmmac_clk)) {
> >  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
> >  			plat->stmmac_clk = NULL;
> >  		}
> > -		clk_prepare_enable(plat->stmmac_clk);
> >  	}
> >
> > -	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> > -	if (IS_ERR(plat->pclk)) {
> > -		ret = plat->pclk;
> > -		goto error_pclk_get;
> > -	}
> > -	clk_prepare_enable(plat->pclk);
> > +	plat->pclk = devm_clk_get_optional_enabled(&pdev->dev, "pclk");
> > +	if (IS_ERR(plat->pclk))
> 
> > +		return (void *)plat->pclk;
> 
> Use the ERR_CAST() macro instead of the open coded void type cast.

Which is better ERR_PTR or ERR_CAST in this case?

Cheers,
Biju

> 
> >
> >  	/* Fall-back to main clock in case of no PTP ref is passed */
> >  	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref"); @@ -644,26
> > +636,15 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8
> > *mac)
> >
> >  	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
> >  							   STMMAC_RESOURCE_NAME);
> > -	if (IS_ERR(plat->stmmac_rst)) {
> > -		ret = plat->stmmac_rst;
> > -		goto error_hw_init;
> > -	}
> > +	if (IS_ERR(plat->stmmac_rst))
> 
> > +		return (void *)plat->stmmac_rst;
> 
> ditto
> 
> >
> >  	plat->stmmac_ahb_rst = devm_reset_control_get_optional_shared(
> >  							&pdev->dev, "ahb");
> > -	if (IS_ERR(plat->stmmac_ahb_rst)) {
> > -		ret = plat->stmmac_ahb_rst;
> > -		goto error_hw_init;
> > -	}
> > +	if (IS_ERR(plat->stmmac_ahb_rst))
> 
> > +		return (void *)plat->stmmac_ahb_rst;
> 
> ditto
> 
> -Serge(y)
> 
> >
> >  	return plat;
> > -
> > -error_hw_init:
> > -	clk_disable_unprepare(plat->pclk);
> > -error_pclk_get:
> > -	clk_disable_unprepare(plat->stmmac_clk);
> > -
> > -	return ret;
> >  }
> >
> >  static void devm_stmmac_remove_config_dt(void *data)
> > --
> > 2.39.0
> >
> >

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
