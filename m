Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 640C539B9BA
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Jun 2021 15:21:23 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24EF2C58D5F;
	Fri,  4 Jun 2021 13:21:23 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2049.outbound.protection.outlook.com [40.107.20.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D800CC57B55
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Jun 2021 13:08:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ibPwQxn8SzwwT9pRd3oVLX5m/Yozd6LN4wDmc1CKkGc5VUhymTLEl3CUXNSp2LrjjP5I4H4VkQGVazQjNrZiCsHHtnmeBhchmIiqfc0ukyAIONwk5ZLMPaa85a37pw8TmOZ2eeArfPsSCz7wLmnrAb0jp6+8TnmxwXURwJu8+wYmnGp30W9XAfozLI37CBTP+yXifyWA5Gu85a3MWA1RmUbe9gUv/yy/Q61K7ff+kICpHMP/vUHegnX81iaOJMl9/KbocGfaL940lu32F8UFQm6y5Nfat012OhOY5f2oByx8aUqj4snDr8NWTdCejm7znUcsE5xy8kTla+Mfzkd/eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjccUIjr1dYN9PpJ8KLJw/ugZxYFw6zdxEahKzPqw/o=;
 b=SNqmYhmX2W+InFmMlNP7K+imHrUMiDHCBm/uylidwsXbcT9k/0nPTnvbqBn3elhYBivnqetuYQpvn9cRGkmy4Am3vrHKFOeouoqfAE/OqVe9UTytJNiMUVzQ48Crv3vs0pBdj0zWtwsNkJ6xsa5/qvxTFhV1/ybSNSiWINsIAUUZty9CixDZkZ7L6Tm5wYfjUrStQ63zh9ndqIkskZqmoqx9D2YnFdTf1nZLb6khRwR2XUO0kvslT+uPlkeJ4wsAeDIv7TFALyXDx3+HcZJwNru1F4ZMC7dJ271K2i31sV94Eh6stqzJ1HaDFDH5QYBIa9R3TrwwqcwI4NP8ktDOoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjccUIjr1dYN9PpJ8KLJw/ugZxYFw6zdxEahKzPqw/o=;
 b=kecJz3BKG6eugcKlf3r0X26KujvsC33dZVJ9GPki+IQVdD2PBgLMGQpfdw6o0BgePtBKlZp0VVl4Zwq6g3HsE+vanGl94mjsF4koJ70uCCWzuCEz3m1QAY53NxFdt6OVzruqmmg3NsLff8nXx2Q2ZfLLweThC2mndhW0Ur6MCjA=
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com (2603:10a6:803:55::19)
 by VI1PR04MB3966.eurprd04.prod.outlook.com (2603:10a6:803:4e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Fri, 4 Jun
 2021 13:08:10 +0000
Received: from VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::b1a0:d654:a578:53ab]) by VI1PR04MB5136.eurprd04.prod.outlook.com
 ([fe80::b1a0:d654:a578:53ab%7]) with mapi id 15.20.4195.024; Fri, 4 Jun 2021
 13:08:10 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Thread-Topic: [RESEND PATCH net-next v5 1/3] net: stmmac: split xPCS setup
 from mdio register
Thread-Index: AQHXWTENJC5Z8so33US6hBvpd1LPX6sDvaOAgAAVT4A=
Date: Fri, 4 Jun 2021 13:08:10 +0000
Message-ID: <20210604130809.lbyf2m7hvwi7xugu@skbuf>
References: <20210604105733.31092-1-michael.wei.hong.sit@intel.com>
 <20210604105733.31092-2-michael.wei.hong.sit@intel.com>
 <20210604115153.pux7qbrybs4ckg4j@skbuf>
In-Reply-To: <20210604115153.pux7qbrybs4ckg4j@skbuf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [188.26.52.84]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e90cb992-22fc-4229-6873-08d92759cd77
x-ms-traffictypediagnostic: VI1PR04MB3966:
x-microsoft-antispam-prvs: <VI1PR04MB396663770AE05EAD4D587698E03B9@VI1PR04MB3966.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DdLYztjZVBxSiSRbuAMl9mjghv7+Cp53qlGSTgGWGBmLrYQy4e3S3m+5Hq7EniepLMG2s9XvPhs8Bn9eQ3VRtSNAfJKwuSWYFR85YIsIERe/n1NraGDKLZBQOA0OASnRjFJrvYfJa0TnmoSCrkIlMfPg24A8BHhkIxAJ3CN9txpIju9nkmrO5WoVUYp5JfETdf1QMHx6eCsZVgIbIFtO3arZP1tt78tRwUJ9ajKFBbhbEqhgrI9i3GbRdUO9Nfv+xOuqJMhiz+H/up3nsuRfLwnTXoN7XuJktkfKlEEO6INakil0Dt8+wAhDaH+fsVaqe1oKvMLCQZmI72KR0JivB9K52FX9w8ulDENEm/sVTtyM+DuMJpglfpdexfpoksA1trvy6bVjpTiDlk0KCAo/7rVY2dnqpcpbnhRmIcU/9+x4Z1z7HcUSWqwLCJjbO71q9EqymC+AmYl2638qOjzbtrFVwPWkw3nEkyi46qMqeBf1AOqWZGtwtCJkfWnzxSZt3+IoPeOhnmpZ7UksbceRcd5LEMK+sQlE/wAqJxqZhjU1NDnOZlkxcZqF8ZyWIKqIBoYKxVlGE1znD55qum9wnwE/5egcIuASXx8l4TnRAoceTPlS9NCYeQKCnxQC7Hu7i1nRL9V9vvpZ07jMtHKawrQtw/rrpaITXL9+TBXLX0ugI4lGDEt8I5jbFA3LOvbM/8UnaQpLjy3i97FXRhwSKCj9kN6qXf5TJCUKSr+gEWA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5136.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(39860400002)(346002)(136003)(396003)(376002)(366004)(38100700002)(122000001)(6916009)(6486002)(316002)(7416002)(66946007)(91956017)(83380400001)(44832011)(8936002)(478600001)(8676002)(6512007)(5660300002)(966005)(4326008)(71200400001)(33716001)(26005)(66556008)(6506007)(1076003)(2906002)(66476007)(86362001)(66446008)(186003)(9686003)(54906003)(76116006)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?J1A7anD/coemw+DjoNEia8Bqmm/szvrsGEVKMUbipPIRsXH9arlZ8VrHfn/r?=
 =?us-ascii?Q?Wj0TmpasMtcQIqiSrC39GabycdLwtOH2DkRw2gqrQ5bn83yXEdtd4y+gOAeJ?=
 =?us-ascii?Q?S5/LApVo7FRJ0bQN8mrqeNsW4eDVnd1pPYJ2QFzwwf42htMPD+bXof4ZKADx?=
 =?us-ascii?Q?n8Q9Cu7qSKdM2z3WcYYZirZxrBc8WlvPbuotVkpOFejfdSyn1brlH+zd14ti?=
 =?us-ascii?Q?8C0CeLwDWAAYCTP+Hbl68xk2u3ushlDHWDUGbQZNPYacjjWb9UTB325erp9X?=
 =?us-ascii?Q?OjhwJIIEjXxtO/uKXWX9Gs5PsCdMMvGhOmzv1yzk2W3goEoOj+ffYHoKqV77?=
 =?us-ascii?Q?74md+uY5ap1o6r6mW+usU6c88fwaHtYySTSWdX9cMrWwcTag9r4rpaftCy+0?=
 =?us-ascii?Q?Af+ia63AnUU2pdTXBa9Qf1loGBkdI6hbDRhmPz+ift9hW9EvLvjG4ZDyipyO?=
 =?us-ascii?Q?mytW10zYQQ2B8i5LUhUNdBu1lo54eh+iIwmmIJ+6cNr8lxoLlCqsHf+f+sxG?=
 =?us-ascii?Q?LwgUQwDjvk9QEbxHEN4H7IXOOhQ97Jfz5bglsgaSBvwo/gjK1lZp24TJ9EP2?=
 =?us-ascii?Q?HJEzrWgtDMSSS6za3zKY4CI7vp+BhVhtNFkEUIwT9X8ZU2UwgPXyflU10o6H?=
 =?us-ascii?Q?Pw7Yu8bFwGf9vFPv/04LGEqRct5f3S8iOVaUPtA8eZIIQz/dpeb8JSvRnege?=
 =?us-ascii?Q?qb0h0arkPwgXfZrHpieJ7VvcoiuyjbhmPPfLcveiY5/MFPmNZj0vLAKA8TOy?=
 =?us-ascii?Q?St0KGIc45V8azLti8E9Jc/pC4jOEEvHSiechE5KIgOkmQokm2nEgQr/uHzBz?=
 =?us-ascii?Q?4oEbP4efugQjW7/Y17DCcRHNaxmWJHP1g+PD91c5oLPXJPzKZmDS/owShoWW?=
 =?us-ascii?Q?5AXaiOVzayyvHpO5g07J/GNReMLD6W3iNxgM6sXIAuUvY5CbEjQPMQJ6uNp1?=
 =?us-ascii?Q?bcqfee1TyhUqjLpRtFDa5CtPYCDsgUt6gdh6nHBZQCBzJK8/PuzhO/Eq8oEH?=
 =?us-ascii?Q?+M9PnruMIIPZWIhytNSbIbqWldF+qwtNPjogmIhTdX+lBh1I3XHUkZBjTaz0?=
 =?us-ascii?Q?XgZ7OxfsuJ8tVUORbaLtwPkJId8oijcTJEL3O/LU6EQHia9/LKJ0IiUnglNe?=
 =?us-ascii?Q?NJdUS0clR5DyVdF/dN7SxTgcRW44H1j51UCZCUteox25JzzYfMhBoHy+Fgju?=
 =?us-ascii?Q?VwTLD+Y9VCBxNmmpqlBYeqefllqeqg+GHUPKVfDo90j8DpXMEMD0yn9gvAvR?=
 =?us-ascii?Q?7yryu0M12AB4QCP2raCQ+BFsUQu9mfPLV+cTQWqt3hRR6fD/zn6K27ySylCx?=
 =?us-ascii?Q?mCxyr5KU+qevaah6JkV8RFJ6?=
x-ms-exchange-transport-forked: True
Content-ID: <15C0343D73FB754FA564ECC956DDAB8B@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5136.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e90cb992-22fc-4229-6873-08d92759cd77
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 13:08:10.1483 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WeLmt+2UdZ7/dlvn9ct01GEm4HdzPwp8h4Iwxc5734H5cnPlNF9B0MygMHk6Fe/D+uP3zplp0wxzY6p0VSZ9Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3966
X-Mailman-Approved-At: Fri, 04 Jun 2021 13:21:20 +0000
Cc: "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "vee.khee.wong@linux.intel.com" <vee.khee.wong@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "weifeng.voon@intel.com" <weifeng.voon@intel.com>,
 "vee.khee.wong@intel.com" <vee.khee.wong@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "tee.min.tan@intel.com" <tee.min.tan@intel.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "peppe.cavallaro@st.com" <peppe.cavallaro@st.com>,
 "boon.leong.ong@intel.com" <boon.leong.ong@intel.com>,
 "kuba@kernel.org" <kuba@kernel.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "hkallweit1@gmail.com" <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [RESEND PATCH net-next v5 1/3] net: stmmac: split
 xPCS setup from mdio register
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

On Fri, Jun 04, 2021 at 02:51:53PM +0300, Vladimir Oltean wrote:
> On Fri, Jun 04, 2021 at 06:57:31PM +0800, Michael Sit Wei Hong wrote:
> > From: Voon Weifeng <weifeng.voon@intel.com>
> > 
> > This patch is a preparation patch for the enabling of Intel mGbE 2.5Gbps
> > link speed. The Intel mGbR link speed configuration (1G/2.5G) is depends on
> > a mdio ADHOC register which can be configured in the bios menu.
> > As PHY interface might be different for 1G and 2.5G, the mdio bus need be
> > ready to check the link speed and select the PHY interface before probing
> > the xPCS.
> > 
> > Signed-off-by: Voon Weifeng <weifeng.voon@intel.com>
> > Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
> >  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  7 ++
> >  .../net/ethernet/stmicro/stmmac/stmmac_mdio.c | 64 ++++++++++---------
> >  3 files changed, 43 insertions(+), 29 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > index b6cd43eda7ac..fd7212afc543 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > @@ -311,6 +311,7 @@ enum stmmac_state {
> >  int stmmac_mdio_unregister(struct net_device *ndev);
> >  int stmmac_mdio_register(struct net_device *ndev);
> >  int stmmac_mdio_reset(struct mii_bus *mii);
> > +int stmmac_xpcs_setup(struct mii_bus *mii);
> >  void stmmac_set_ethtool_ops(struct net_device *netdev);
> >  
> >  void stmmac_ptp_register(struct stmmac_priv *priv);
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 6d41dd6f9f7a..c1331c07623d 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -6991,6 +6991,12 @@ int stmmac_dvr_probe(struct device *device,
> >  		}
> >  	}
> >  
> > +	if (priv->plat->mdio_bus_data->has_xpcs) {
> 
> stmmac_mdio_register has:
> 
> 	if (!mdio_bus_data)
> 		return 0;
> 
> which suggests that some platforms might not populate priv->plat->mdio_bus_data.
> 
> Are you sure it is safe to go straight to dereferencing mdio_bus_data->has_xpcs
> in the common driver probe function?

This patch seems to agree with me:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=593f555fbc6091bbaec8dd2a38b47ee643412e61
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
