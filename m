Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7162416F8D1
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Feb 2020 08:55:28 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1CC7BC36B0B;
	Wed, 26 Feb 2020 07:55:28 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40082.outbound.protection.outlook.com [40.107.4.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 28731C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2020 16:36:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sr4gg6bMOVWEt+u7y5wiTiwrP9FMYc077kvfzGm5RjhozFDoe6mb9YhH3wun8DxjTbOZp99ZxImvvMFGMxuxfvRFgOCWN5kFPK6oRCVQxLazsm3akBpVfOOoDyvBwZprrS5VWKBzJ6MkYDMZ0x7NgO/5+bluX34S+TvPBdwMPntiDFoz+Z6k6lLs/wRZZ+/OauVEU2kQvvrpO3jJXXe8XyNMVasDv2K5DCxom3DS5LoQI1/9Ut4jNw1RnNsPYXCG9RdyPx3X7ectFs2fKn3HzMAi0F/DVmLJrvHmEY0y4RY81G0/XGiNa8W3nmYtNEbZIw0prhDQZ+qYImuRkYhx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMaVo8UjQAd6maA5jfw/7GDFwyPr4eLugPKPQSowyd0=;
 b=Tb+X/grsWepsuCuCG+JviDz3FE++/NgikGXWRyToy4hyL4I2UsZ1DT+OKfjdcIpS7TrV8Kcu3vBM41oazwc/ZSWGPrRd/0+lX0Qem8tWDsrjwWd9PZwgeEAiUJbXrXK2zWu540GNgealRk7rL6yIRfPekZbdzGr+YfRur2eulirCcwrOkY4uw6mgrQJ3S3b3TOT3k/or6aj0OrC4YMMQ7eeIsw2fRgroRshsUMIA9c4bONBAsJRA2ZFeq0NQ2GMVifogQnrZTB1prumwRiZRk55+q+H38JG7RaqANtZM9+LsJS1FpA+jPF1DXGxu4fbPv9HjutdPD7NH6PGKS1fTtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMaVo8UjQAd6maA5jfw/7GDFwyPr4eLugPKPQSowyd0=;
 b=ZmBxeNPGfvTXp3dxxnlBzWk0/bWESEeLDcMXarCzrdAvkBVlXLKPrHYAviOqBqpujEioidWvhgCwcuZmzm7ijIEDpvM5PCoJ1z/qJhOKF5VfkBkIh4pOTbL13NlXDiT4PM7aIcsSNbORpcrlwwrU+kz5ty0oxsh2Rp0NyNetxCU=
Received: from DB8PR04MB6828.eurprd04.prod.outlook.com (52.133.240.149) by
 DB8PR04MB6378.eurprd04.prod.outlook.com (10.255.170.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Tue, 25 Feb 2020 16:36:32 +0000
Received: from DB8PR04MB6828.eurprd04.prod.outlook.com
 ([fe80::9484:81c6:c73b:2697]) by DB8PR04MB6828.eurprd04.prod.outlook.com
 ([fe80::9484:81c6:c73b:2697%6]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 16:36:32 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>
Thread-Topic: [PATCH net-next 5/8] net: dpaa2-mac: use resolved link config in
 mac_link_up()
Thread-Index: AQHV67+le9Rplv4RF0eFqNNnaoBGEagsGLhg
Date: Tue, 25 Feb 2020 16:36:32 +0000
Message-ID: <DB8PR04MB68282F710FB598B977C36F99E0ED0@DB8PR04MB6828.eurprd04.prod.outlook.com>
References: <20200225093703.GS25745@shell.armlinux.org.uk>
 <E1j6WgG-0000TJ-CC@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1j6WgG-0000TJ-CC@rmk-PC.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ioana.ciornei@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b3e188bd-970a-4daf-34ea-08d7ba10df74
x-ms-traffictypediagnostic: DB8PR04MB6378:
x-microsoft-antispam-prvs: <DB8PR04MB6378696520D522AFB90DC04FE0ED0@DB8PR04MB6378.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-forefront-prvs: 0324C2C0E2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(189003)(199004)(8936002)(81166006)(81156014)(5660300002)(110136005)(316002)(44832011)(478600001)(9686003)(33656002)(2906002)(54906003)(52536014)(55016002)(71200400001)(7416002)(66446008)(66556008)(76116006)(86362001)(4326008)(26005)(7696005)(8676002)(6506007)(66476007)(64756008)(66946007)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6378;
 H:DB8PR04MB6828.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uOn5fBFNdBLP4MykGNwDl1ipSCY4PP0m/gcufXdxe2oWTnyyvFekANXdXq2EzKK5+mGec7Cs/08lq6/1ywr3PtbAzGkzEDn7xQ8kJ/JZZj/h5gLQgowdWSWb19yOD1rwf4jWIyKRTTQYGlha+wuUYojUjkRY+lzyme/inT7vA5VsuXJQZlnC3FghWfdZ81Ob9HzHtXIpzPpje7A1bMoxOmR/vJzkXwc9s00dAxozMs+3zlBDp8z8+t/cH07Ssr2rzERIS1vgbdFRQ9m5eR1OGTEbZ99WNHD4f0gQf1zKfEPYz8O0K0ZZ6mF8KXztonJaQARpZGKECbN8jZU5UBQ9MFr/vXstRRKPT707HT/LAWDX/uw53ON/3tZQlKWqtF1SgIpxGRoYFklg+Xon/5D+h+svad5k8md3wwY3Y4xq9wlQjOgqbZASUAfhsKREb8zj
x-ms-exchange-antispam-messagedata: E0oYTVgO9PNcXsRCumsiz9e7Ui5SBdEZpN+Amn+mXnMhCmx2ugcqQpHImetvi59uFzvxyBDRgSjiUZ5you142aNZbJNr7OfFfLsVpH2gdQyVs02KK6Wq4Wf1Y+LJ8hiORHGTtWoV0DzEFKJtHdjyXw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3e188bd-970a-4daf-34ea-08d7ba10df74
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2020 16:36:32.5550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B203kxPU35tv3vsAJhXoG0tbdg8D4QYsvlvFgrGOLMlsMPNCxV+S7nrw4zdBI2kEuuFnLO4EpdDPCLvYATenmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6378
X-Mailman-Approved-At: Wed, 26 Feb 2020 07:55:27 +0000
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Jonathan Corbet <corbet@lwn.net>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Felix Fietkau <nbd@nbd.name>
Subject: Re: [Linux-stm32] [PATCH net-next 5/8] net: dpaa2-mac: use resolved
 link config in mac_link_up()
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

> Subject: [PATCH net-next 5/8] net: dpaa2-mac: use resolved link config in
> mac_link_up()
> 
> Convert the DPAA2 ethernet driver to use the finalised link parameters in
> mac_link_up() rather than the parameters in mac_config(), which are more
> suited to the needs of the DPAA2 MC firmware than those available via
> mac_config().
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com>

> ---
>  .../net/ethernet/freescale/dpaa2/dpaa2-mac.c  | 54 +++++++++++--------
> .../net/ethernet/freescale/dpaa2/dpaa2-mac.h  |  1 +
>  2 files changed, 33 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
> b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
> index 3a75c5b58f95..3ee236c5fc37 100644
> --- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
> +++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.c
> @@ -123,35 +123,16 @@ static void dpaa2_mac_config(struct phylink_config
> *config, unsigned int mode,
>  	struct dpmac_link_state *dpmac_state = &mac->state;
>  	int err;
> 
> -	if (state->speed != SPEED_UNKNOWN)
> -		dpmac_state->rate = state->speed;
> -
> -	if (state->duplex != DUPLEX_UNKNOWN) {
> -		if (!state->duplex)
> -			dpmac_state->options |=
> DPMAC_LINK_OPT_HALF_DUPLEX;
> -		else
> -			dpmac_state->options &=
> ~DPMAC_LINK_OPT_HALF_DUPLEX;
> -	}
> -
>  	if (state->an_enabled)
>  		dpmac_state->options |= DPMAC_LINK_OPT_AUTONEG;
>  	else
>  		dpmac_state->options &= ~DPMAC_LINK_OPT_AUTONEG;
> 
> -	if (state->pause & MLO_PAUSE_RX)
> -		dpmac_state->options |= DPMAC_LINK_OPT_PAUSE;
> -	else
> -		dpmac_state->options &= ~DPMAC_LINK_OPT_PAUSE;
> -
> -	if (!!(state->pause & MLO_PAUSE_RX) ^ !!(state->pause &
> MLO_PAUSE_TX))
> -		dpmac_state->options |= DPMAC_LINK_OPT_ASYM_PAUSE;
> -	else
> -		dpmac_state->options &= ~DPMAC_LINK_OPT_ASYM_PAUSE;
> -
>  	err = dpmac_set_link_state(mac->mc_io, 0,
>  				   mac->mc_dev->mc_handle, dpmac_state);
>  	if (err)
> -		netdev_err(mac->net_dev, "dpmac_set_link_state() = %d\n",
> err);
> +		netdev_err(mac->net_dev, "%s: dpmac_set_link_state() =
> %d\n",
> +			   __func__, err);
>  }
> 
>  static void dpaa2_mac_link_up(struct phylink_config *config, @@ -165,10
> +146,37 @@ static void dpaa2_mac_link_up(struct phylink_config *config,
>  	int err;
> 
>  	dpmac_state->up = 1;
> +
> +	if (mac->if_link_type == DPMAC_LINK_TYPE_PHY) {
> +		/* If the DPMAC is configured for PHY mode, we need
> +		 * to pass the link parameters to the MC firmware.
> +		 */
> +		dpmac_state->rate = speed;
> +
> +		if (duplex == DUPLEX_HALF)
> +			dpmac_state->options |=
> DPMAC_LINK_OPT_HALF_DUPLEX;
> +		else if (duplex == DUPLEX_FULL)
> +			dpmac_state->options &=
> ~DPMAC_LINK_OPT_HALF_DUPLEX;
> +
> +		/* This is lossy; the firmware really should take the pause
> +		 * enablement status rather than pause/asym pause status.
> +		 */

In what sense it's lossy? I cannot see how information can be lost by translating the rx/tx pause state to pause/asym.
If it's just about the unnecessary double translation, then I agree.. this could have been done in an easier manner.


> +		if (rx_pause)
> +			dpmac_state->options |= DPMAC_LINK_OPT_PAUSE;
> +		else
> +			dpmac_state->options &= ~DPMAC_LINK_OPT_PAUSE;
> +
> +		if (rx_pause ^ tx_pause)
> +			dpmac_state->options |=
> DPMAC_LINK_OPT_ASYM_PAUSE;
> +		else
> +			dpmac_state->options &=
> ~DPMAC_LINK_OPT_ASYM_PAUSE;
> +	}
> +
>  	err = dpmac_set_link_state(mac->mc_io, 0,
>  				   mac->mc_dev->mc_handle, dpmac_state);
>  	if (err)
> -		netdev_err(mac->net_dev, "dpmac_set_link_state() = %d\n",
> err);
> +		netdev_err(mac->net_dev, "%s: dpmac_set_link_state() =
> %d\n",
> +			   __func__, err);
>  }
> 
>  static void dpaa2_mac_link_down(struct phylink_config *config, @@ -241,6
> +249,8 @@ int dpaa2_mac_connect(struct dpaa2_mac *mac)
>  		goto err_close_dpmac;
>  	}
> 
> +	mac->if_link_type = attr.link_type;
> +
>  	dpmac_node = dpaa2_mac_get_node(attr.id);
>  	if (!dpmac_node) {
>  		netdev_err(net_dev, "No dpmac@%d node found.\n", attr.id);
> diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h
> b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h
> index 4da8079b9155..2130d9c7d40e 100644
> --- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h
> +++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-mac.h
> @@ -20,6 +20,7 @@ struct dpaa2_mac {
>  	struct phylink_config phylink_config;
>  	struct phylink *phylink;
>  	phy_interface_t if_mode;
> +	enum dpmac_link_type if_link_type;
>  };
> 
>  bool dpaa2_mac_is_type_fixed(struct fsl_mc_device *dpmac_dev,
> --
> 2.20.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
