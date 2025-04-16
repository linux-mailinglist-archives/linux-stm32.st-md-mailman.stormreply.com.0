Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD66A8AE5F
	for <lists+linux-stm32@lfdr.de>; Wed, 16 Apr 2025 05:13:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 82BBBC78F68;
	Wed, 16 Apr 2025 03:13:26 +0000 (UTC)
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2130.outbound.protection.partner.outlook.cn [139.219.17.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9A56BC78F62
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 16 Apr 2025 03:13:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JX3yNq9gySqLiQfruYXoZSz46NpM5DI72xnkTeAkvJ2ApSDihV1w7Cbu3jH3RKqdYUZ35H1yxm4q6scMVAn6xbTrqxag3r/pzq+5AiKUsGKMI4SdemjFyWHRv7HUXdnzZIxiuZh8M816DedRU8MNJJMTIPzrHbB97o/cPm0oX8UKXZKuYai24z0SopU9gAKsck/qDpYCusM//7hfhZhIjnrAO8yOSMzda9D9LyPaaEEroABwMjayXzMtcR1T5g/Afr/SlJ7ESfCEcYVxAyfWnwJ07T22h0e3JexfYYmbzMVpZQJP5Ort189zHB7vwv56ZBImqgRzwln/l4lQS4+S+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5EJXj5KN6TCXQ6ttTAlBxui7/4xZiYsqc/swLU5ViM=;
 b=Wa9JYHOC2M2o1LtnkQmSLV4vkv7arbdHZuG3pEmWN9dIccn+2kR1Xx/tM05szWLEn5mK0nwbfcJjoRER9dT54OuL4qNDe0FYABZ52pl8IhA4E8Ys4OAEJah7QWtTcT0v9KfR2n9tfCeK5ML1KHDwy5HFBZ3JiGvcagXmQZlgdjmsF55pjKjNv/ywrsBeu8u/idtPNp0rVe7V6h8tn/mZxUQi4ftloMuBhEasoDvZaGKuvgpk9wb2C5hJp5jsiU+PPhjVj73zW9BoivULeIO/ER79xeOIePzyanXqY+gUvUh3i5LNeRNFATJf2HhxkloQ52SeiegHeLUWQbZGZs4+Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:18::12) by BJXPR01MB0536.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:15::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Wed, 16 Apr
 2025 03:13:08 +0000
Received: from BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::f06:366f:7b4b:4c9]) by BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
 ([fe80::f06:366f:7b4b:4c9%4]) with mapi id 15.20.8632.036; Wed, 16 Apr 2025
 03:13:08 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Paolo Abeni <pabeni@redhat.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Thread-Topic: [net-next v1] net: stmmac: starfive: Add serdes PHY init/deinit
 function
Thread-Index: AQHbqebhNuVSIJMgAUGsPuly4THmMLOkedsAgAEtSrA=
Date: Wed, 16 Apr 2025 03:13:08 +0000
Message-ID: <BJXPR01MB08551DB3FEDE0899B67B8DB7E6BD2@BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn>
References: <20250410070453.61178-1-minda.chen@starfivetech.com>
 <6851d6b8-109c-4de0-89a8-a56659c87cf4@redhat.com>
In-Reply-To: <6851d6b8-109c-4de0-89a8-a56659c87cf4@redhat.com>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BJXPR01MB0855:EE_|BJXPR01MB0536:EE_
x-ms-office365-filtering-correlation-id: 84e0ad0a-9183-4d14-07a6-08dd7c949cee
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|41320700013|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: BnLul9cUcAj7GeF7VR9CruS6cWd1dnnVEz4oXq+zCJA7rnN6q3cMU05Dfy3D4dCnJf+GAMr3Q4wHEYH8wEARGVJPb8rVQWuLarGqQYHGOelDKO5AKoDq9wL5AkfhQhxalQ3AVEVMlAk3Y9AMGMBXOcHVqbWzcBN0jMcza4Y4S23aBSdQMcz7yCSlbi59cjC3SEIh2IsY8k3JwMsHlTK0+2qZ0B/LCGtmP7Ace3mfsYm4Qy4k7NutXEHqBBzVEXSm57noTXLyhEFE6J9XBoi+HQCujSa7AS3Eg5KyZfsMzS2QQECWyJ+NGwgv4lELmZ4sgrZkntWZCfcSn7WWZkMwpOEn1zkIWq5bqwBRQwgB+EGme9ykDB+GXlRrNlp6iHI54NhMCg1hVs9/FLgvyoNYI2Qe1AouwfNBTNgtyJi2PtL+vkaVxkHT2Z8OQ6ahzPRs806MjAuMMSBnKMoVsUM/dmAE9ak1P/71XoR+3O34mfKDUBwK8ml+fRpLvH1WlwzdFbfsAOPDCc6LeJDU/ZNIBX+x4msLFewF71rEOKT9WVtxAaZAqizjBfOzpEhDRghn/U+uhfwVgfZsH97gTIuu8bVUiQwiRtc/AQ6drFkz6C4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(7416014)(41320700013)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RkZTUmxHY2tsc0M0M3UrR1pBckZDTTIwZS9KdXRVTkF3WXdCd0hNLzZDUEJr?=
 =?utf-8?B?VjhQOVNQVXc3V2QyM0xKcnFPWlJrRnlSN0xZN0JvZ0s3TGJlWWVGL0JiVVVo?=
 =?utf-8?B?cmZvcVA1TWJaNkN3RjQ2c0JweXMybGFVTVZQcmNNazVsWHpLdUtRdTJHY2Vq?=
 =?utf-8?B?bEMwT0dUUUhNbitkUjd0a2p3Zml2aGgrRFRoeENWZEJuOUE1aG9WdlVrd2Uv?=
 =?utf-8?B?QjI1RTRBS282NFJYZG1aMGV6c2M4dGUrV3dHUnZpZVdhZDdxZ1ltbVFySi8z?=
 =?utf-8?B?N05MWXQ2T0I3bU5IRms4QS9sSnhsaHNoNTRId09Qc3Z4OG11VkhTQW9LdWdu?=
 =?utf-8?B?dFBrSkNZRm9DOXEwYVkwWFZuUGtqSXJ2amJDTm9MdnRrL1VaQlRPcXVUeTgv?=
 =?utf-8?B?VVE4NEN6UHlpS1hYWWh6YktpbVBsVHdnbWl3S25jUTJ6b0dBRjdoUUlSWnJh?=
 =?utf-8?B?dGxWV0pkN2VoVmZ4bFJOSjhPQjdNaEJCQmRnREZTckNMTTA5MTZTeVowa05C?=
 =?utf-8?B?Mkd4TWFNck5reisycUQyZFk4WEo5azVhaGFyQ2pVYytlcGJqLzJRY1c3Unhj?=
 =?utf-8?B?SmhpMjNtNG0yOEsveXNVdGdSaW1DY0lvNGxuWnAvTUxSMU5Sa3BpZUJPTk5a?=
 =?utf-8?B?TVJaeWhONko3ak4vRm1MNXYwSjJCcGczY0ZPRUVGTmtFVUsrYjN2U2FVbDAy?=
 =?utf-8?B?bDZtaytTYmxOWUl6V21YLzJKNE1PWkJ2aEVja1psTHRxbTlFSnVYZDJpS2lY?=
 =?utf-8?B?MnIrQXVLSEZkeDJZd0p3cGM1a1FVWkYwclRMY2pFK0M2eTQ1M0hwRHVoN3B4?=
 =?utf-8?B?Z3ZTb1NaWlpMR2kzYjlHc29SUTlJRFE2R1RmWDVvT3R4K3M3R1RjTWpwdXZt?=
 =?utf-8?B?VVlNcSt0cHhwamNYMytSNlVyQTFiZWw2R01IL0N4ZTVXTTFrSFV3ZHRXSzJS?=
 =?utf-8?B?NFhWSWF3RDA3MmJOdWVDZEIrajdKOXlPRDJyRzJjVFNGUUwwMkFGVG04SWVV?=
 =?utf-8?B?Y0hOYzZMbjdyUnBQdG9SMGJhWkRVSzkyQTJScTBDK2pHOWN2aDNvYWZnOVFi?=
 =?utf-8?B?ZWxKL0RCYk5JZnRVT2xNRWlFZXV0UFV4TnJ1c3BoSG9ReHdZV3kzcWo3bWs5?=
 =?utf-8?B?WUdjK0hnQzFzdCt0WEl5V0ZWVU9QaXBYSVFlMmJrcVFYdmZUaGEyNkdvcHUw?=
 =?utf-8?B?WmxGZEtDNGRxUEQrVFBXL2o3cFpWalZBOXRFUThNcVhMNkRoODIvdkI5TVFJ?=
 =?utf-8?B?NmpjS0taMDFvZURxS21oQjhMNE1zQmdoUEhURXQrUTlYR1BVajQrYnRRYWdQ?=
 =?utf-8?B?ekUrdklNV2x2VkhoK1c1N0hlMkJjVmpFTkRVc1hDcUV6bS9HWmFIaXJUeTVE?=
 =?utf-8?B?OXV4YjUzYi9zd1JuaEs3aXJXUHgrb1psY0VhVXh6M2FWOGhjTlRuODdzUVov?=
 =?utf-8?B?MjhhVTNlK0JkVVBqQXdvRWRROVZzTVhqY2dseWdWSkloZk5ROXcxVm1TZ3ZS?=
 =?utf-8?B?L3Fpd2l5cFZxS1ZDcEJCekY5dW9haHNHd3pudGJ5L2EwaTVubnE4bEJtQ1Bw?=
 =?utf-8?B?T0FybGpVV3diMGhlWFRwNktNS0gxNVpVVXNaNzJhQmhPN1dOaVVCZEpuNElS?=
 =?utf-8?B?VEJGNHFIcnJUeEpWZ3NOK0c4SjB2REVOM3hMQWZGZHFzMU1UNWVVb3BFcE40?=
 =?utf-8?B?ZWh2aXlGNnNybGtkOWNDTHZCL1NxYW1MRGtiTFFqTXFic1U5VVMzZGlja0Vy?=
 =?utf-8?B?NkYrLzByS1FFNkl2K3BwR2VXeCtUdzRqVithbjhyUlY0ZkVzY0JuY3d0MldI?=
 =?utf-8?B?L1ZTSEM4QndYdWNRU28xRDcvMW1WQ1VaVlpRazJFOEorekdxOFUyTDYreXo3?=
 =?utf-8?B?c21saERKdktTTFZHNGU2NzBhRS9RV1BWWk1iODRaK2xxWGcrUW8zL1lIY0hU?=
 =?utf-8?B?YkxQVnlRcFZ1TlpwQ2p1Q2trVFU5Q1g3SitqbVFsZ2JmRXg3d3FjcThJalRO?=
 =?utf-8?B?dG84eTlKb0JPZHFPeEtvSVJNemtpTWcyVktEaXR3TGlPKytiWDRDWDBDcGpO?=
 =?utf-8?B?K205V2pNclpwT0dJejlWdmdiWWdJN0hDSmdhOWhrRXpvYjc1RFN2UWs1dWJB?=
 =?utf-8?B?bHp4Nkp3dFNwb29QZWZiVGJYMDVoZ1EwS0RBbGtkVi9NZkVCVStLSTk0N3pa?=
 =?utf-8?B?RXc9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BJXPR01MB0855.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e0ad0a-9183-4d14-07a6-08dd7c949cee
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2025 03:13:08.5719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JChSW1DbqvNDZeKOgzWqlS2pltfZ8/PFtfQIFxLntbYPSNScX3NEopnzrG7Ajh9X6jpgzZ9cZOYWyp+YBKfzNenWZQQGyAm0itpe2GyVtRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BJXPR01MB0536
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
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
> On 4/10/25 9:04 AM, Minda Chen wrote:
> > To support SGMII interface, add internal serdes PHY powerup/ powerdown
> > function.
> >
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 33
> > +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > index 2013d7477eb7..f5923f847100 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > @@ -9,6 +9,8 @@
> >
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/phy.h>
> > +#include <linux/phy/phy.h>
> >  #include <linux/property.h>
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/regmap.h>
> > @@ -28,6 +30,7 @@ struct starfive_dwmac_data {  struct starfive_dwmac
> > {
> >  	struct device *dev;
> >  	const struct starfive_dwmac_data *data;
> > +	struct phy *serdes_phy;
> >  };
> >
> >  static int starfive_dwmac_set_mode(struct plat_stmmacenet_data
> > *plat_dat) @@ -80,6 +83,26 @@ static int starfive_dwmac_set_mode(struct
> plat_stmmacenet_data *plat_dat)
> >  	return 0;
> >  }
> >
> > +static int starfive_dwmac_serdes_powerup(struct net_device *ndev,
> > +void *priv) {
> > +	struct starfive_dwmac *dwmac = priv;
> > +	int ret;
> > +
> > +	ret = phy_init(dwmac->serdes_phy);
> > +	if (ret)
> > +		return ret;
> 
> This is called also in case of PM suspend/resume. Do you need to keep the init
> here, or should that moved at probe time only? Similar question for phy_exit()
> below.
> 
> Thanks!
> 
> Paolo
Yes ,The serdes PHY code is simple.  But I am not test with PHY code
I will send next version with PHY code.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
