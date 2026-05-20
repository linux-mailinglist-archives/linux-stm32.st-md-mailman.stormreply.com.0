Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHYgLOdfDWquwgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 20 May 2026 09:16:55 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C1953588C93
	for <lists+linux-stm32@lfdr.de>; Wed, 20 May 2026 09:16:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DEEA1C87ED1;
	Wed, 20 May 2026 07:16:53 +0000 (UTC)
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn
 (mail-sh0chn02on2110.outbound.protection.partner.outlook.cn
 [139.219.146.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EED9FC36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 20 May 2026 07:16:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5j0t0vQ3mYlyL01kRc8Lu61UjRcvx77AZJMMzUF/isVzMzZBM+FJPpPmk5pQEUbfiMRGijOBvRsjBNi/gkKTixvMkQeVhGFERLar7yFmNue/xNnHdVCB6Mgx95ce94ap9j9l5EvZyozBAxTnPaJWinv1BrVSJHBCxME6LaFZAuAi86mssEcx7cAnLao7fr8stmkgs68ZNXb3pbiw8lxaCqzeILqZ7KZPEOYXrCAk/+47+jcO9OhhoCMxC4Mehs3mvqaIrBl/dDbn6udgyw/KxCEdG2EQGrPSpDf+6W4Uwv8PtkEGgbanaik06QN9ITw7Ny7u11yiFSVimp9yu6QLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUvkoKV6OPo3U49ZxrwKYkS+mzW7t1Us0+gldRfvbSg=;
 b=I/Z3R+8V4TU13Jx4uuJ3MDesHZbWq3pWSwZaUosAcpEv0WyGrdIo3ZN5mI5i4sxa92GKLc6KAL+REVP292/V/l2k7UdqFg5PhS9SvvM9IF2OstyL8GzH2opw2mQGq2+RFsGnjQN4koQQw0RVATi72Ucq36jH2p7dfkUqgNaUAtEjGEN6AKW8LpyMooCQX6p5RTftT2FdUWC+AcvvuYSjVD8sjcnJRHzwWbGNxswfAkyNyYlyEoeAaphjLKWsB/ELRv2DNE7nfmkpHeZEib3zZ8crStF2/H7Hxu8YovQ/hVcws+Xz5bhliJEWVlhxPSGOesDX8lThp7NoUa/b+GsegA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0893.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.15; Wed, 20 May
 2026 07:16:47 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%3])
 with mapi id 15.20.9891.021; Wed, 20 May 2026 07:16:47 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Andrew Lunn <andrew@lunn.ch>
Thread-Topic: [net-next v4 4/5] net: stmmac: starfive: Add jhb100 SGMII
 interface
Thread-Index: AQHc53hU+JPeVlYe+EWGQV8dabD2M7YVZY0AgAEcvhA=
Date: Wed, 20 May 2026 07:16:47 +0000
Message-ID: <SHXPR01MB0863206A6ED966AABE7B3407E6012@SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn>
References: <20260519101436.111476-1-minda.chen@starfivetech.com>
 <20260519101436.111476-5-minda.chen@starfivetech.com>
 <6eff2d70-a0ac-4d9c-8261-eb5249b7c877@lunn.ch>
In-Reply-To: <6eff2d70-a0ac-4d9c-8261-eb5249b7c877@lunn.ch>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SHXPR01MB0863:EE_|SHXPR01MB0893:EE_
x-ms-office365-filtering-correlation-id: 15a16b51-a1cb-42a9-dc18-08deb63fc137
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021|22082099003|56012099003|18002099003|4143699003;
x-microsoft-antispam-message-info: WH0rLBO9RVD2hXBkiWzoX/8UpCUP3iEPMVNXGOroz6IAcgdVXAaqSq5G2BZ+xP0tjvunzH4+/1qViL3Eq8wGbiEU3FYFr4qkPOcRiR8jVU2ohMbsdXUcfXm3ccq653CTEHqKTo14J/36fCRvwcsPQxh9oLeuIXen6hdMJOb1K7TzaguCXcx6krFP9aP3PHYXbCiD36LSL23DLlrCA9Dtsz9azojtAC6go/Y+6X3GENAUDrcNeLZifQilee4RwYIP4LB3+QxeAu4nWWgg+4/GGF6NywrT4bNK3HsnsQxCbd8S1LlsimpVmIgzHpARbNAxYcm3HdaLQj/r/NxPOJqrqH7IQhOuaq5KMrD1YtHvAn9LRqCQWid9iOttXHvpjuyQeQJfEgc5MA8N2jm842Gkc6pkhMPV+51EpsvM2koX2imrbF2UlQT8qRIoAsW0k7LasZRLAh+gYjdypno0YSqVHI0Aphk0kyD1YKEi3R/vYnJlaaPemp8zN9aGf0w8r2kHxtmsoUNfGYpHQ1vi0NekC4ll0m0UAew4ggX5bAT+o4QUdKSctFMeQjg51N5Ff+Xy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(22082099003)(56012099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rtR3bmjr/mh8tQv/wvw67vrkiVP6X6B/a+zv5W4dTsQml0o2TU8vHtZxZ4tK?=
 =?us-ascii?Q?8E1PWPaSq5U9gpBzrH2HWU3Qbx77INiLWrVvPR9Z5n8TjvAKRCgI7dlQGmNg?=
 =?us-ascii?Q?Z/6o/c8dP33RBurPURohQyzjZECMgytKwR0BxDXSDpLGaqIF69Lmw3J3gdG+?=
 =?us-ascii?Q?I3F9H0b1aJ/KFPrpVBCOPN++DXziLk7MUOXpf4+HwqybZW00ctc3cIXY7xK7?=
 =?us-ascii?Q?D0JJEMzBALMbp3WwYLw/Ypd5j5lf7GS4hh2vwe/k63ePRs/M9CLLfrhxUu7O?=
 =?us-ascii?Q?aS0ETZayXthCXNEz5w2wInUx3SJbBbHYN8HZgqkQJShyRLKwFVyjwqkMD+Sb?=
 =?us-ascii?Q?puhohaSU8YupsQoTiOTREftC5YT8TO4m8Db73WeK8igWQX40F4+IEQrKa1cv?=
 =?us-ascii?Q?Q/ymd63fPQ3QP1waWYF5arxLJunGkW2sACgIdyw5V0VtuHsRhfeDOHMg/VfC?=
 =?us-ascii?Q?C9KPhx4OPXy7o4yzhhUlzqfYRUREtOiwOIy043C5zHIiHgtG0DasHDI53GDW?=
 =?us-ascii?Q?xdIdqlPn4ttudm/vdkx+8ihyPK22AgQ4nXtr0OfVgfYdM+eUiJJTkkDLcaG8?=
 =?us-ascii?Q?QAWj94jXPv1SkQHtLE/SIPJqEoMvvnSPLsWen1nkQXJn0tq4Ru8d351LF1TW?=
 =?us-ascii?Q?0thN6GKfmwrFZinYCP17pvVdrPgI0m9sA6TPfHjnQZXT9SPtagXN9AkLEbg1?=
 =?us-ascii?Q?UBDGpluWKhhBrfjS9jbu80E5MckvTYRdrG31z/H/6tbYkPj2OQV8Nz0mds9V?=
 =?us-ascii?Q?xyJm2e7a70zkFqRu/QazNXANf+/xggINiofrYugtZmaDdEuHO/YFCju+j9PM?=
 =?us-ascii?Q?VB2YKFjdrmn/E0kD78t84GuRh1CHpfGc2xXH/QMILWEhb+sXQbh3BBmeji2u?=
 =?us-ascii?Q?EerpbqnjcKQByGtxBPEGp6udKWUY8JbOYm1+h+I4GZqSrBUaA9fQG/8o7Ikb?=
 =?us-ascii?Q?hp5msLTRXZV77FtnN80c7tHpIGgCL+TicRSA0Npziyaaoe9dsHYS93XptZfW?=
 =?us-ascii?Q?fkX8bUHGJfiEEZ13m/2Y0mij5YxfiNHZQW7enNHVK/85IKExsXNuR+u6JOKR?=
 =?us-ascii?Q?ikJLnohiLNGPxdDrYTaAlJyEWiRioRqWd0GTLHIDNM9lPFXewk/7Qs7Zqyhy?=
 =?us-ascii?Q?73KtTVqtLpb0AUG8voawiUtt71bOLn3Uh+lUrm5mXkk7hKvhyLMNUGZ5lUaX?=
 =?us-ascii?Q?APVWjkLRFyTqmiA33C0jjDNCvQjhyhhCKqm7U6MGO5SlXdGcZWLrb3kxPDMg?=
 =?us-ascii?Q?CSacqRG5zi5uYNwpYJnXdXOpgU2zHVBhCq8M88nUxniPC+HbgTocMpId4/6Y?=
 =?us-ascii?Q?of6ANhAXcmAbSu002+LkYjHvqh7ydPj2S1tKc4vC/C5bnigZs+/tAB7Tzfqx?=
 =?us-ascii?Q?6oDDgoNFn401GCn7x+0WCFa4R64HQvRQ8l3M/pOhsJP7ctzqAXrPZT93mWMG?=
 =?us-ascii?Q?xC1ZN+sx+2O3/Df4lshYwheN4hwYnLC01T9Ks9cpcExmUh5bVmG77bXAQKPi?=
 =?us-ascii?Q?QO/ttJFH4VQOerxkEJrSB3Ud+ZwwMjtU5E8vIidmnrQ7xNcTNECkIQGLlR+T?=
 =?us-ascii?Q?2grHDTtPNkcASo0TeyNtCdRYDgVn4IyTTLReS6cGa6f7frdXyh2jr7DGD9Ip?=
 =?us-ascii?Q?52Serg6gvbIHtk5WsnguvLYjxqHzPCeWadR70CfAh+uP+X5MIsMCzJfqSlJj?=
 =?us-ascii?Q?tube9BtXnia/JRaJxpr6a5XNP3ggoqkbpJutkmBaomh4wvYeEpxj02Y3XBIx?=
 =?us-ascii?Q?b5QuYftRvg=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a16b51-a1cb-42a9-dc18-08deb63fc137
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 07:16:47.3411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qshQ8i/lLkaIQh0gZR29BH++5/HXQKnUTLF7qL6WX40ExMSEqyys7f3dudEcCWt4mK/j/48IJktTcfb6N11roaj/6276smvim2xi+FcJiKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0893
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Conor Dooley <conor@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [net-next v4 4/5] net: stmmac: starfive: Add
 jhb100 SGMII interface
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[starfivetech.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:devicetree@vger.kernel.org,m:emil.renner.berthing@canonical.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:conor@kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:robh+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:robh@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,canonical.com,st-md-mailman.stormreply.com,kernel.org,lunn.ch,google.com,gmail.com,redhat.com,davemloft.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[minda.chen@starfivetech.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn:mid]
X-Rspamd-Queue-Id: C1953588C93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> 
> > +static int stmmac_starfive_sgmii_set_clk_rate(void *bsp_priv, struct clk
> *clk_tx_i,
> > +					      phy_interface_t __maybe_unused interface,
> > +					      int speed)
> > +{
> > +	struct starfive_dwmac *dwmac = bsp_priv;
> > +	long rate = rgmii_clock(speed);
> > +	int ret;
> > +
> > +	/* MAC clock rate the same as RGMII */
> > +	if (rate < 0)
> > +		return 0;
> 
> You probably should return the error code, because something has gone wrong,
> you have been asked to do a rate you don't support.
> 
Okay. I think return -EINVAL is correct.

> > +	ret = clk_set_rate(clk_tx_i, rate);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return clk_set_rate(dwmac->sgmii_rx, rate); }
> > +
> >  static int starfive_dwmac_probe(struct platform_device *pdev)  {
> >  	struct plat_stmmacenet_data *plat_dat; @@ -102,23 +122,33 @@ static
> > int starfive_dwmac_probe(struct platform_device *pdev)
> >  		return dev_err_probe(&pdev->dev, PTR_ERR(clk_gtx),
> >  				     "error getting gtx clock\n");
> >
> > -	/* Generally, the rgmii_tx clock is provided by the internal clock,
> > -	 * which needs to match the corresponding clock frequency according
> > -	 * to different speeds. If the rgmii_tx clock is provided by the
> > -	 * external rgmii_rxin, there is no need to configure the clock
> > -	 * internally, because rgmii_rxin will be adaptively adjusted.
> > -	 */
> > -	if (!device_property_read_bool(&pdev->dev, "starfive,tx-use-rgmii-clk"))
> > -		plat_dat->set_clk_tx_rate = stmmac_set_clk_tx_rate;
> > -
> >  	dwmac->dev = &pdev->dev;
> > -	plat_dat->flags |= STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP;
> >  	plat_dat->bsp_priv = dwmac;
> > -	plat_dat->dma_cfg->dche = true;
> > +	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_SGMII) {
> 
> Does the PCS support 1000BaseX? It is not needed now, but it is something to
> keep in mind, try to avoid making to code too SGMII specific when it might need
> to be more generic to support 1000BaseX as well.
> 
> 	Andrew

No. do NOT support 1000BaseX in jhb100 soc. I think 1000BaseX need new serdes PHY
be Intergrated it and maybe new setting.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
