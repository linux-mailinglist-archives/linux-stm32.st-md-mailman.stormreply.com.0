Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0189A6D4643
	for <lists+linux-stm32@lfdr.de>; Mon,  3 Apr 2023 15:53:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A4677C6A610;
	Mon,  3 Apr 2023 13:53:37 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 142C6C6A5FD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Apr 2023 13:53:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJUj72PlQwKfo2j/uWPK4GcJ5tOOcpI/wfcOi34PFXkwDbkwoIwM+RAahUce62BJecrVTMrZA16ghMsl5bSFxde6y5XMhn6Cpy54PNiuQv1jy86mf9tigbyksP9dCBy9qSRj9jOaUjk9PPlAtHmPDViIvxSbeZWv/4OB6/MV3oq8+nd7gbd1n9PfREP8T9/XLcbDpoKYi8wKIK5has2UnR39suJQ7RVulTNKKr5k0HaAyU/pc7Py1cYHla3tkgFeMTF/BODgl9aX6HgHhcWwvrrfDc2uT3E88EaZqW/s3X0/usg+nhg9xKDb6FX8ANaMqFQEc7f3CXMmkVSPljXbcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Phogb4otx13s2lTHAShWz0Vd/RL+cEgNlYF45g1zObs=;
 b=a8JFlj4GWd2JOIZ8gJgEHdd7AgbvR2NNDh0Leq0j+Y5EjCi36pRzkbe1uKXMv92sWH5iHndXfusOS9/fZtyHyy5F8bmyS8ewv3xy1mB/99EQdpPziTx88qi3P3G0JjjNKmyH8vY5ADEgSxKGpPmm4WN/kuEcJMie/hkHjfCSGsz3m+0G17HZwEXG5rKUc0dvaXyWbmdUYBDDOpLSccgBj1fiRe6spg0W7JrvjM59nLUW1CV2R2O/6j1fKs9d/CyljCQha7YnobSRBh/MqXM+YHFAA1nC6NdNswXt9lClcHfJmJS4DPj3ey+JP2dcOC4+cWjnkOVa+7yhaPZAc5VbIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Phogb4otx13s2lTHAShWz0Vd/RL+cEgNlYF45g1zObs=;
 b=DaxT8SL+lL03p8EGTJZRN0WxGB+Zj1JdiBrZlpNqM8Vg+BOo9lAZ/atAlMP74wRLuASzTBSi2/KXZejNvcl1hOgbFC7fIPtdJvCcSPU0DfrEd5/wI+3Lagdp4M3e7+wfEM8DQmpI9gMydY1k2E+ZozshQbvbULyyKcXcZTj74Po=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM9PR04MB8955.eurprd04.prod.outlook.com (2603:10a6:20b:40a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 13:53:34 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::28fb:82ec:7a6:62f3%4]) with mapi id 15.20.6254.029; Mon, 3 Apr 2023
 13:53:34 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Jakub Kicinski <kuba@kernel.org>
Thread-Topic: [EXT] Re: [PATCH v4 1/2] net: stmmac: add support for platform
 specific reset
Thread-Index: AQHZZBb4TGQjvgUNqEW50CFai25e2a8V5PUAgAO5o9A=
Date: Mon, 3 Apr 2023 13:53:34 +0000
Message-ID: <PAXPR04MB9185855577B999D41B3C9DC789929@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20230331212250.103017-1-shenwei.wang@nxp.com>
 <20230331215816.32d5aa35@kernel.org>
In-Reply-To: <20230331215816.32d5aa35@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM9PR04MB8955:EE_
x-ms-office365-filtering-correlation-id: f126cf04-adaa-4c41-69aa-08db344ad11e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VvJr837mVZWhqbtcSGfmjdYmT6jCnZHw8Jfag84UcSX4/O+QJ00t9ZZatRarZ4Zee4KSykBoUYEEARGR+mTf/6+npBqtKYRf+9h6+K2DhuPUuAjFeTnvRbkQfVJp/gfowZau5ULQqLUR/fJxeptfoZfMH2WGFY0Qsmi57KkmJAVcFiCp2Yece7R7nM7don/yxVhKMXek3jPjxaPCl67F9JCY63iX6XibsjAxckC7DxLLBCBd+QmGNe7RkJK4dD3PFowX8Om2RMU1KLo54jEil4bqYatKKApb8IFzUPqlp/0hV5iSWhOVR1NkXUNGe3QQcBMQEne1AsSLJdlx6jHj80s4lBMBF6Sn0kTwFU88E6EXoJTicdAkX75jOjkhXR8ATadHB5Pj9DHBYqbm6eJL1K2tnp4NJXojMHJ01Z2kMAgU6b2wDQXksZGFr8lwoTuG6JoEo2SIB6f+njLPAatzdDselmknlw4EyZjEDKKSyXuBiTJLvO/GgjDL1ZeTRn+SZg54C0fIMyT6s5TlvyeNkKkS4CogiED/K3lQPfwVgGP4VSdNta/YtSwIOBis5ILPLJlTu8rpjs2I/M5JjAgp7/AxsiCePiixSNvEE3rUo/4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(55016003)(8676002)(66476007)(4326008)(66556008)(64756008)(66946007)(66446008)(76116006)(478600001)(6916009)(316002)(54906003)(8936002)(52536014)(41300700001)(7416002)(38100700002)(122000001)(5660300002)(44832011)(53546011)(186003)(83380400001)(55236004)(966005)(71200400001)(45080400002)(26005)(6506007)(9686003)(86362001)(33656002)(2906002)(38070700005)(7696005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c2sl9hXOjpPfIv3R+EYZxsjYiLIzSDobVMbldIOXCjNqXOM0lsUvzKU4ghnR?=
 =?us-ascii?Q?HUAIZ9wv+B2DBFojEENzzlGJ+QPsOx2MqqnOEhTk2fimeiioJj3zL7b2GR9T?=
 =?us-ascii?Q?5LJVcKeBych3++pUflF/KrjzdPi/s4L6FzAbrDebeyGptim6aMPMc58ExaSL?=
 =?us-ascii?Q?yj1Yd53mFlctrZHWqdn2SmEBUBingO9kAtyT27GuchsD8SKtaIshFF0aWaKY?=
 =?us-ascii?Q?ygqkH3BCd/NEhlTEb+u9FPuzEJA89f2EqDas5iqaQjuUtAnkdvXc7e+HwHLX?=
 =?us-ascii?Q?NMCHxE/x9CdCVE+RT9cn21oLNL8uoQAhtj/hKuVLZnv8jvWQE3KZhy8kYy/u?=
 =?us-ascii?Q?vILHlWPvaXDAaHrWKQgz7L39Vy1bGt0TsPX3kD03wGKRyuKf7fiktbnI5dD2?=
 =?us-ascii?Q?mCf5LuKVJ3LWkQqiUDmvUfR9xU1Ab5c49NnYQq92aMPRwAQxq81evS6EsYj3?=
 =?us-ascii?Q?eQ45X4vitGZs1C+3PXuhpVBU+VI2b10y7/THNslshH+tqJcwoStNAwsRRnd8?=
 =?us-ascii?Q?Dux1OWjMi0C+R5JNK9onITAAJ6egm4DbyDEKuDXPCz3c1IYr0EAhX2o4ix41?=
 =?us-ascii?Q?jJWPjyhW1NJKN0WCEL2X8FYwhbLQK/23rmb0yXES4rWVxXOeiIKt1VTl3ZIE?=
 =?us-ascii?Q?iGkdcvZ2Ebp303sgC0V2XkEbcKiEFS4/l7m6JcmH8Ow41QuuokO3CQ77Ager?=
 =?us-ascii?Q?p01vf5WTSYb1Lf16eMmBLYlDoPKIlD3IwPusXvzoftlq1Qr+Y4nd0O8lWQZF?=
 =?us-ascii?Q?cqG73tgP3Ftu/iasAhGDXjidObYNGQs9tE04JAQ0Vth83bYFgUKro0yNZ54G?=
 =?us-ascii?Q?PijSsedKlH/lFdlOnBn5bD79lMMf/ZQJuas7qDOcnq2IhXPBIHZEczDRqFPf?=
 =?us-ascii?Q?ZeyQvBjpl4moeIsiit9fWVWB0bIgmB3+2lj8AFMDTZ74yBOzvILgLhVT2wUP?=
 =?us-ascii?Q?tzYybC3Mpk2NTTJ0P7WDodaGshLdqA48Q7aCSIirIHmBIlNtnzP8Zus0+dYb?=
 =?us-ascii?Q?flbl8FUcqGeNj/EQGlUYuB3CTbD2AJXz2IN/6BJEcMewu8ed8vNrGmYFqSrA?=
 =?us-ascii?Q?vQBD5VakBEU2KL05XRE84tmAxev5z1TwPp1ZpN+++8GbLRGM58cSGJwA50I8?=
 =?us-ascii?Q?LsIQyv9oPsqJhcOc2wqTzl4GTs+AKGhNQDaY1w7rrEXUGdB/Vuy8dQDqa+Jx?=
 =?us-ascii?Q?bF62/7F3oRmDCk6TqUuRkeVD5YKnReQ7MQGe0m5D5MR4T2yDY4cZDuJwcgS8?=
 =?us-ascii?Q?X+7W5rzrNgFhh0x8tvfGJ6kG4zLPyeVd6T39lDXekWV0EqDaPsanLRrBqiIc?=
 =?us-ascii?Q?lZsXwHz1ke8RXPUOdu4Mkl04ZhPm/de+5ieNx7Eh1ajQIvoedG1SF1ezPUKv?=
 =?us-ascii?Q?LKaUz5Jqd4h/Sct4/PaQvfX/KMPaCWBGwBJB+OoOJayfmihFSH073Q/PIv6z?=
 =?us-ascii?Q?Qe1pUN3S83MebNkR4xdpsA2M3Y3HCwGpPdJ6KPC5PMMJViH2NiV0puvnlzHJ?=
 =?us-ascii?Q?vyqOGcxO7C02mTlITPgA6tyX6wroUrIT3HfQINdr7VAx/K7Z7hdXCwPi7lzu?=
 =?us-ascii?Q?p8VXD8ASIFp3n6g40M33ojSWlzCHTIPwvfpjaq87?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f126cf04-adaa-4c41-69aa-08db344ad11e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2023 13:53:34.3227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eCj21rfK1/vraXVwsdAfWIiERMQkEp84gTrxo9rD8SR1ZVittxmT32b1gPmTRebmwmFCG0gKvgbb8Cc7Pgp5TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8955
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Wong Vee Khee <veekhee@apple.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, dl-linux-imx <linux-imx@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Revanth Kumar Uppala <ruppala@nvidia.com>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH v4 1/2] net: stmmac: add support
 for platform specific reset
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
> From: Jakub Kicinski <kuba@kernel.org>
> Sent: Friday, March 31, 2023 11:58 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: David S. Miller <davem@davemloft.net>; Eric Dumazet
> <edumazet@google.com>; Paolo Abeni <pabeni@redhat.com>; Shawn Guo
> <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Maxime
> Coquelin <mcoquelin.stm32@gmail.com>; Giuseppe Cavallaro
> <peppe.cavallaro@st.com>; Alexandre Torgue <alexandre.torgue@foss.st.com>;
> Jose Abreu <joabreu@synopsys.com>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; dl-linux-imx
> <linux-imx@nxp.com>; Wong Vee Khee <veekhee@apple.com>; Kurt
> Kanzenbach <kurt@linutronix.de>; Revanth Kumar Uppala
> <ruppala@nvidia.com>; Andrey Konovalov <andrey.konovalov@linaro.org>; Tan
> Tee Min <tee.min.tan@linux.intel.com>; netdev@vger.kernel.org; linux-arm-
> kernel@lists.infradead.org; linux-stm32@st-md-mailman.stormreply.com;
> imx@lists.linux.dev
> Subject: [EXT] Re: [PATCH v4 1/2] net: stmmac: add support for platform specific
> reset
> 
> Caution: EXT Email
> 
> On Fri, 31 Mar 2023 16:22:49 -0500 Shenwei Wang wrote:
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > index 16a7421715cb..47a68f506c10 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > @@ -214,8 +214,6 @@ struct stmmac_dma_ops {
> >       int (*enable_tbs)(void __iomem *ioaddr, bool en, u32 chan);  };
> >
> > -#define stmmac_reset(__priv, __args...) \
> > -     stmmac_do_callback(__priv, dma, reset, __args)
> >  #define stmmac_dma_init(__priv, __args...) \
> >       stmmac_do_void_callback(__priv, dma, init, __args)  #define
> > stmmac_init_chan(__priv, __args...) \ @@ -640,6 +638,7 @@ extern const
> > struct stmmac_mmc_ops dwxgmac_mmc_ops;
> >  #define GMAC_VERSION         0x00000020      /* GMAC CORE Version */
> >  #define GMAC4_VERSION                0x00000110      /* GMAC4+ CORE Version
> */
> >
> > +int stmmac_reset(struct stmmac_priv *priv, void *ioaddr);
> 
> sparse reports missing annotation, I think it's this line.
> It should have a __iomem tag. Try building with C=1 Also please take a look at:

Tried to rebuild with C=1 but didn't reproduce the missing annotation issue. However, the __iomem
should be added here.

Thanks,
Shenwei

> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.ker
> nel.org%2Fdoc%2Fhtml%2Fnext%2Fprocess%2Fmaintainer-
> netdev.html&data=05%7C01%7Cshenwei.wang%40nxp.com%7Cb0c66303819f4
> c5c2eec08db326db89d%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> C638159219052564995%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C
> &sdata=0j58wSNzzTirX%2FqaJKPxYEDZn6ezs7qC39trHa72YRA%3D&reserved=0
> 
> >  int stmmac_hwif_init(struct stmmac_priv *priv);
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
