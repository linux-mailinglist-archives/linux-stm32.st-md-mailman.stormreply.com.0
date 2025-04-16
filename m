Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 043E9A8AE61
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 05:15:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AEA63C78F68;
	Wed, 16 Apr 2025 03:15:17 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2093.outbound.protection.partner.outlook.cn [139.219.146.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56129C78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 03:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYbVyB4O9UMJplbntfzRmIkZ7e2uIMjtT+NwkqLIx5OoBEjImkkfspCGjAkfj/7bUEs8fdto5ojp1b3si5Antzyf449STVO6vX5/qLtau1gf4tF7bNptFo0dN9Z5l3D1ieFwa8FjuAF84raDOnyKm4eTrfeiiJhOl6wA1xURKvsaKUDiO+bNxrYyPqJhj+JhPTpFLCWIAzT+GQXiWif5zpcrxX6A0qpqG1OBOtc0KSINLShDMUtp5ojvs0mKUkatI84kYM6z5Q2u45R6QKJGx6GSVPlXt8Nsd9ahnAaHWq2E3TVRg4N+Zg+NKsk9EK/46EfAwnZf+cBxrp7pSjoVug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEQpyQ8vTr5hrp/ekoT9M9HCYjgSJUvwlK1e/MkH/9s=;
 b=g54Vdm/LiKTmdr9DPBhxeYHiAxQvpEKcLXsfeGuzX70RWvvpIMxFIhNuShiCLxnOr4xBAkG/vvJ2wLh0f9ONz9n9Zn5kz45fkKsdw2r4EVZ7wam4XSoeyMrUzZjlW7gXkSMYuyq4J2olAlt6rHrIW4+c/+7PgnV7PyuTg+oslhEL97IcKEWgMFkaW0GPsPFCzafSyDCOLqm02fIr89WfajJMjknN2BC1zVgRdenDrugosXeAvpAappv2Cpa1N3YN5D1flKbSoi7XJQXqaiqwAjvxAS4M4I3FvQICHm1bI7HtZH246Yz6WiCbsZYYgrprO7vkVyA+2JY8G8y1OTrlGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0696.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Wed, 16 Apr
 2025 03:14:45 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::f06:366f:7b4b:4c9]) by BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::f06:366f:7b4b:4c9%4]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 03:14:45 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [net-next v1] net: stmmac: starfive: Add serdes PHY init/deinit
 function
Thread-Index: AQHbqebhNuVSIJMgAUGsPuly4THmMLOkqoOAgAD9FmA=
Date: Wed, 16 Apr 2025 03:14:45 +0000
Message-ID: <BJXPR01MB085530E2951C3A18D79C75BFE6BD2@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
References: <20250410070453.61178-1-minda.chen@starfivetech.com>
 <840346cf-52a3-4e40-bf38-9d66231366d7@lunn.ch>
In-Reply-To: <840346cf-52a3-4e40-bf38-9d66231366d7@lunn.ch>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0855:EE_|BJXPR01MB0696:EE_
x-ms-office365-filtering-correlation-id: eabdc0ed-8479-4528-4baa-08dd7c94d6ec
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|7416014|41320700013|366016|38070700018; 
x-microsoft-antispam-message-info: nu4fcvMZIhU3jX7dHWhPAeZQ0LYYfegmxd28FHcCIfkd6VAn0q14hJsFvcoUzUM6SEYoufI2tSAijg75svifWoPk1XsycFuCj/QcGHq8ZKKr00rQLdAVctH4MMJCTcXvO40RMFjaI9XuHyCAKyru8zTq+32jf189oll7rJ7Zq4jlY6/f2jhbV+f+K1c6R3c+j+CUDAhUMrSIInY1akllJ+9cupGJAatxFonJFCn93n/3kBwXEEHKXF5dPTi1XBsOCoUuCak1yRE/4xax9kR5Qoqg58ifgbG2xSW+i+l+lIoDe6U9TlzeDlfyO8XVN+dRKladpwxJZjPyjAOjJaacAPrdxuWrJwjU/gmp9J0fNXv6ptKoQI/9p2SsOugF5Mx6f+Uif3laOssQK/p4Ydep/nYSSEiELpk3GsKmPJFxF8a0TaVg9S4ESCHiM0jsnyhpAcat/TDnVeiZLwklyVFFzRIRgWf4C6ZIhaMciIDanPPlNmAG3TS1j3RlIfFsCZBTmfophqzf0TQD4eVOuyLBTtlXqgKCacjbcEY1TwY7sX41GKf4z9dUKPUqN5LtZBBwd4Yu9fGwMo8QsgjGSXMq/MHXGydjYoD4Y5mogoP3rSM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(41320700013)(366016)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MeSuECLRQiny3+VtaMXelFONWy3HwG7/iVcxxFwujrI7nDn6j3qZYVB7BBRa?=
 =?us-ascii?Q?Eq07ZOGmQs60dFiBP1xz8ALMwOMt6eOAlLQ1FtBzvp6t3LNJRj8t/nhCAhQi?=
 =?us-ascii?Q?1Y5VIoYksGYzERtgkS6mEyf/BYd36PSAGoq+oJ3s9hwEV5z+ka078p88hxJK?=
 =?us-ascii?Q?INAIJYHQTAu+TSi3UX4HnDkk0aIYoFJ8bmz2fil4NoFLh9E+cYcmOpaBUslE?=
 =?us-ascii?Q?xrSJylYVNrgG4O+0O+NOb2c5Xhbs9uCH/yCwKh9CzhBj5uDFH7b8ejJR+hLj?=
 =?us-ascii?Q?McpHMeMfSYmlp+149EUyLTCvB08hX42X78EacqMbCY5rdPwcCTJO8KEidsgJ?=
 =?us-ascii?Q?XqauTx8kBoZBXr93t36+fhFscjOd7lP4j1kZsgUw/+t6xeKPN5KN2kGCccL2?=
 =?us-ascii?Q?aDbkBz1k9fdjK7FcIdcjQJkAiqy2olpY3mhzoBVtl8rwItoNv54vVUhWxCWY?=
 =?us-ascii?Q?om3kDLaZBLTJsxp38kgiPoxUxWm+gBX/Lv/6+RsKc04odimgPNEf0zexJ/lh?=
 =?us-ascii?Q?LhabDLgh8dYqxjW6G1D9Au17fwSLgf1BYayOAtgZBBNUhoBM7olwg365QhU2?=
 =?us-ascii?Q?u5t3OmAl51Lbc6zse3ZF/VKPqa8r2xAu21xMoxDPA5x5PsGPsPOiRXUDmiSw?=
 =?us-ascii?Q?eo4xcjTDxOA9FUQ/6oqWkiSUVpBfKhDeGmsIMoKwn1fANw/JCkpQ7WfAht39?=
 =?us-ascii?Q?YqBg4I9K4wnWtoY+Lp8Cdly9xOzDwUj9X8Nv/598N8HRsdFIrdeFY9qbNJeB?=
 =?us-ascii?Q?S1fwBFZsh+7NAARbKye40u+d51S6D2kqPIzFip1n6YyRL8LU79M0BJaU6Q4b?=
 =?us-ascii?Q?87H0KRaPg3svV8YGg5u9Dhlw9EXRpIoYQWP2aKQP41LrZRG+3yRIfGJxXyWz?=
 =?us-ascii?Q?vBd3yg2V2SoNsXl9/cuMGh3hJB5B64e9gCS+t/y2e2VNXEAw/9XTX+PJdhDA?=
 =?us-ascii?Q?Gw7/AsMsLtRPcv86JjwX0+fK9VXHINCZ7A2yNwglZC8+6W6vuevKABVfRPOJ?=
 =?us-ascii?Q?Lm9cevEMkr+0rvmYa6VqzUyVl65uevk/J8UQK1ZKFnyvpYgYDVqO2Z0O6xRt?=
 =?us-ascii?Q?DeW5bWSR7sfyDezZzgt1JNgcPn0fkDikf8al4PMZIUeLW2dV4skhdGp8VKuF?=
 =?us-ascii?Q?IeuLVWb0tQ1sw2gd1+lBMD19VfrSf8BwAMPPORJAiZ88IMk/z73t0hdeyhig?=
 =?us-ascii?Q?ICq44p9aBmP5PaUqSBAvzzp8IQrcT/RUcyykhUkQbWckcLDiWFGOkBf3e3hy?=
 =?us-ascii?Q?WgyX4llaCAsZt2ybKdd3tP+/tJxTiliryUJaFJbyAEzqYcYpa+4tccY2InfH?=
 =?us-ascii?Q?u2CXvhRTUSU1JllT1Jg7WrwmTkB/gmbybKq/u13sIEh/YXD8Li1WbMMMBjxI?=
 =?us-ascii?Q?FTiNC+mbnyrAluwjy3WD8z+jcwc3atQz9anRkITUuYdiPCAFSjrhGh9lZ6Ii?=
 =?us-ascii?Q?I31NYb7fAH6ue8JUSRF/pKRxIWAU2I/uDwAL4kksJItPAva7erxHtK7X4+vc?=
 =?us-ascii?Q?eABepRYR72dlMkH2Q3+cRiyc+b0ofks+2MGfExdz8HI/jv6ylp4FY0sJj324?=
 =?us-ascii?Q?Al7JXHY0VO+dbSVefA5tJNkmGbnnEEPZI0I9yvE5j8iGpj3/OMHLdvR3hIm8?=
 =?us-ascii?Q?Ew=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: eabdc0ed-8479-4528-4baa-08dd7c94d6ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 03:14:45.8765 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HYI0XgArPuN2nADRn4YkR3iEE3JQuaDyL0yGbU49AEX/GdvwNlxXpqKE5WLOsoMwts9QnzeywsxDFnKic2L3WYhvHnQtbbJLZycWtdo3lLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0696
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <rmk+kernel@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next v1] net: stmmac: starfive: Add serdes
 PHY init/deinit function
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



> 
> > +static int starfive_dwmac_serdes_powerup(struct net_device *ndev,
> > +void *priv) {
> > +	struct starfive_dwmac *dwmac = priv;
> > +	int ret;
> > +
> > +	ret = phy_init(dwmac->serdes_phy);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return phy_power_on(dwmac->serdes_phy); }
> 
> static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv) {
>         struct qcom_ethqos *ethqos = priv;
>         int ret;
> 
>         ret = phy_init(ethqos->serdes_phy);
>         if (ret)
>                 return ret;
> 
>         ret = phy_power_on(ethqos->serdes_phy);
>         if (ret)
>                 return ret;
> 
>         return phy_set_speed(ethqos->serdes_phy, ethqos->speed); }
> 
> Similar?
> 
> > +static void starfive_dwmac_serdes_powerdown(struct net_device *ndev,
> > +void *priv) {
> > +	struct starfive_dwmac *dwmac = priv;
> > +
> > +	phy_power_off(dwmac->serdes_phy);
> > +	phy_exit(dwmac->serdes_phy);
> > +}
> 
> static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void
> *priv) {
>         struct qcom_ethqos *ethqos = priv;
> 
>         phy_power_off(ethqos->serdes_phy);
>         phy_exit(ethqos->serdes_phy);
> }
> 
> Pretty much cut & paste.
> 
> >  static int starfive_dwmac_probe(struct platform_device *pdev)  {
> >  	struct plat_stmmacenet_data *plat_dat; @@ -102,6 +125,11 @@ static
> > int starfive_dwmac_probe(struct platform_device *pdev)
> >  	if (!dwmac)
> >  		return -ENOMEM;
> >
> > +	dwmac->serdes_phy = devm_phy_optional_get(&pdev->dev, NULL);
> > +	if (IS_ERR(dwmac->serdes_phy))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->serdes_phy),
> > +				     "Failed to get serdes phy\n");
> > +
> 
>         ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
>         if (IS_ERR(ethqos->serdes_phy))
>                 return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
>                                      "Failed to get serdes phy\n");
> 
> 
> >  	dwmac->data = device_get_match_data(&pdev->dev);
> >
> >  	plat_dat->clk_tx_i = devm_clk_get_enabled(&pdev->dev, "tx"); @@
> > -132,6 +160,11 @@ static int starfive_dwmac_probe(struct platform_device
> *pdev)
> >  	if (err)
> >  		return err;
> >
> > +	if (dwmac->serdes_phy) {
> > +		plat_dat->serdes_powerup = starfive_dwmac_serdes_powerup;
> > +		plat_dat->serdes_powerdown  =
> starfive_dwmac_serdes_powerdown;
> > +	}
> > +
> 
>         if (ethqos->serdes_phy) {
>                 plat_dat->serdes_powerup =
> qcom_ethqos_serdes_powerup;
>                 plat_dat->serdes_powerdown  =
> qcom_ethqos_serdes_powerdown;
>         }
> 
> 
> I assume you have seen all the work Russell King has been doing recently
> cleaning up all the copy/paste code between various glue drivers. Please don't
> add to that mess. Please consider how you can refactor the ethqos code to
> make is generic for any stmmac driver which has a generic phy.
> 
>     Andrew
> 
> ---
> pw-bot: cr
OK. I will move it to generic. And I will send the serdes PHY code in next version.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
