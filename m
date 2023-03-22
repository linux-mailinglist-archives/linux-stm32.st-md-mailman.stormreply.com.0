Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E72A6C5925
	for <lists+linux-stm32@lfdr.de>; Wed, 22 Mar 2023 22:56:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DD07C6A602;
	Wed, 22 Mar 2023 21:56:16 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2067.outbound.protection.outlook.com [40.107.249.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 34063C6A5E7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 22 Mar 2023 21:56:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HhQt2xF0zh/k/fRKUCKIenw1RdsXnZqCb1DWlUbC+oAztO5jUTS67hFCZ32czKxqVjbhXhdLglXlx9oQ+Reo2DcQBqieMMaHdgpmsdkpWRQu7dB1wRLL2mjGMdqden2a0xPmXtXaop/MXp1VMI1HWcp1XQgyGJSDufnf4t6FXv3Gv9pvenDhm2Y0RqnMQNiHgzutdzAKnMJRNJix+aTJHu8SlxoWreVSCsRv9v/AnuzNzIOuiVElhePJvLPIh9aBYniFz296wxE6MwCG1D/GHuN5/q1Iu2faXshhUxJWYER9bTy7Abz+u7l+3s7ReeKxNcR2+qy/4rIzxAm4JLPzGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZUVesjmtdj3xDXQWBRv4RLtciwzK9UMPoaWyvE91vw=;
 b=TZRGGLPuVJmCsev/pooNrrOU7dBn1AfNb5AMAzee+Fk57KK3pDXTiJgYtvzCXfOCvxYTeIxl4/AwsUhl6k6oIqc+UtN4wSAFdJ3Tbl39Uzo5BFrXQ36w7+KlXxi/OGScuZpKSoqmcmjoIA8b/JGKrGE1Ksy7oTvUj7GbrgvnSt0KtukOxaGmsEr4FsCW1QYsb/5kgd6aZyCFiJHW41Vfq7QrOfbB4M0f49Ue5GRAmpqZWOJgICd0CRE+CFYN5+Htv6H02YZCATgmrDVRqSqadD4aZHOiGfnCFY2MErP3JJAv1IVildpfEYe4P7vk/VZDVrIN1jvdZrB6SvOsojcfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZUVesjmtdj3xDXQWBRv4RLtciwzK9UMPoaWyvE91vw=;
 b=bfXvwfPhsHgV57N5PRyqHgRcZ0hH+aZXi874RmX3wVx35gA2yuOLjEBaf0Ds1wl1jn9DZKGSrxIXU7FWjp1CO4AR6RZuWOUmf5wxC9sxa6NnaA+sMF5d3ecc81EErHhoR51uJ0sB/r3lep5VI5dadLcZE4int64rFAuQgBZKxtU=
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by AM8PR04MB8019.eurprd04.prod.outlook.com (2603:10a6:20b:24b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 21:56:12 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::31d:b51c:db92:cb15]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::31d:b51c:db92:cb15%8]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 21:56:12 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Simon Horman <simon.horman@corigine.com>
Thread-Topic: [EXT] Re: [PATCH 1/1] net: stmmac: add support for platform
 specific reset
Thread-Index: AQHZXCi2zg+P+kQ+XUOXyeY0vvUeuK8G/7qAgABX/VA=
Date: Wed, 22 Mar 2023 21:56:12 +0000
Message-ID: <PAXPR04MB9185B268A25E72930112E7AB89869@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20230321190921.3113971-1-shenwei.wang@nxp.com>
 <ZBst1SzcIS4j+t46@corigine.com>
In-Reply-To: <ZBst1SzcIS4j+t46@corigine.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|AM8PR04MB8019:EE_
x-ms-office365-filtering-correlation-id: 7cd0cdd1-894a-4f01-44c0-08db2b20409a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g2aFYoWt9MzBE13qobeBAIilMjnHFsv3rl/RNvaKj/Wa+JOUqSbtZFGlQXWdykquz2M/BCvnH28NQSte0u3XnH5wRxmyEq+vcke1Bt6UlG7cTCsb2P9pMNC2G9W6jHTPUKGy6CIg4jD9I+K0YdQKR6biHQUBFZUnZrihylcCmg7ubc0lr5xODP7/4nIGQxspFY5Lqitja8knsc9IbZ8q8zAIHqpejkiGJdA+n9PLTpdnpvSgA579jLdGTu6GnSzLIZiR9L+CRik7e+I+wcveIjOtUzry9GMsgKVrGHb91EvcKcrFilH7QOucDvLsmccyHolcGLJU6kUOFa4K4h56yWLvMJ1fDrHrMp/L5e6EKSQpyAewW2JpT1gC1opp4CgFAFwapzwBNwpHxNsdaFKObM/LE9m4KCER9IffQJbhiVS3edSDRag2QCvQruH4i+WxvMySuhoKhl9vIC4toexGOJNgLpPzbRwP+sdmbbolwc+JZj2l88V3iPP4J9uN0rTGiECZK7cG5WLBpEJvcjBFFTnOPkFvYyHOlr/iN8kYs4pxWaRgGyDl9vMRkPO7T0ETytT76oyxV3tvs3R7d5SOV1yf2Z8vT14V+ljyxc3GMAnCf9rsgnvJq9j2pRabLzVgkXsUzkCqyratsBF4L56QRBLL35E0wvbloCzKNHP4Z2HVFK0yFlcRaU33rGsheXlcYq+Inw11X/7oKbQXAQuQJA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9185.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199018)(53546011)(122000001)(38070700005)(186003)(6506007)(26005)(9686003)(71200400001)(83380400001)(7696005)(38100700002)(86362001)(478600001)(2906002)(8936002)(33656002)(76116006)(55016003)(44832011)(4326008)(66446008)(54906003)(316002)(7416002)(64756008)(41300700001)(52536014)(66946007)(66476007)(66556008)(8676002)(5660300002)(6916009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EhZrm617oI+CHWQ9CJSWMgBLarZtFQ4nJ5RtZdoZyQpamTfBKB9h6AszGKU/?=
 =?us-ascii?Q?MVvXo7v8xcBOWxkdKhc+VGlGtqtB7qMyjT74+ucbINAbaM5XR+cHShgTan6h?=
 =?us-ascii?Q?W51nN7U4bXZwxSVUB2DGyr/99T9lWvvYNe0CFIgGQTAOuq9iiQFD0ncacDn6?=
 =?us-ascii?Q?Nn8Nr+f14kOAe64WGhsW8NiEzS81TGHZGiIHHpcCS0XmSgYb7DLSBrCRY3Ln?=
 =?us-ascii?Q?/pThVsAiIL6oqm4veWCso2OzvO+jgv7oJhOJpFB9y9MwgmQDrv/GADNksLeX?=
 =?us-ascii?Q?AeQ2qX3Pbwktdeb/PzVRvc6r7S6vV8kfpWuZ9RD0TQ/bQLU14ryLIRFHfEr0?=
 =?us-ascii?Q?Jb1M9Aw/0Ysnm1UVqArilZOeM7YMS6M0R1/12GUzLZMxtmzu5dz3lrbAWyyK?=
 =?us-ascii?Q?N6nQGl0HlVIUqnOyo9AJohhUegn3YLoXe4NwmjVJjEIoBYVcRQ/6iyQWSjd1?=
 =?us-ascii?Q?OD+NOL21zFFULyUv3x0RIT/hHYRehFD2wvHC/ebOQYtqjlbDMsWUC3xEgk6k?=
 =?us-ascii?Q?cTAALVh/YuEZd2ufTuyZOTnD0iNYSzYkYLTRS0Bd4b6vJ54T9gFh2lIe3z1l?=
 =?us-ascii?Q?n0EghbC5KtjP2y5JfL/12bkjjYBH9VGjJPq9CwNsDofaCRWgFd+4efTm8pJ5?=
 =?us-ascii?Q?K7MiFXBmVAcRl5yxumUVJ7swhxsK00R1BxIvsw/gYQa9bxII/pd4aMkl0ghA?=
 =?us-ascii?Q?z7vhs7O0xskrmggKjyavV1LEOuvn3VONeDLVqkvVi4YNm75uxMo1f1Q+FjRW?=
 =?us-ascii?Q?PxkVfug4GnxD2En/5+OKNXfL1SeIQcT3sw0o1ummo48MEKnnldAQHYkhID/I?=
 =?us-ascii?Q?rPGiEPE32yNSHhsJZ68Fh4Wr6KzQ5jGPAAv+iwSieig4mfAvl0Lvt9kvGGB+?=
 =?us-ascii?Q?1vS1W5zfgLlwpoN/AKSAs4Gd9QWY+rhgBmXnyIQB9uZBq6ZpkFIPAnbtFxvl?=
 =?us-ascii?Q?QfME5Tw8R5U8KzWosNsj7Jz5XC0f3vaV8xfw7lsR+84GnZYZCpwuNR0ZZIOa?=
 =?us-ascii?Q?GRnN9ByaObXOgD3YxOGUdoziXg0kRIU7+pLKIKyXqk6yIXWyh6LIOz5DqB+u?=
 =?us-ascii?Q?A3L4iKuqfnKGO6NSKNijoiN6rl7aZX94u8Bj3ubku/v4qfGbtxqQ4YqYfMw3?=
 =?us-ascii?Q?jS9PPYzgTdF8RuUO3FWp50b7UzNmRHYtvmrcN1nguAKHLZbTWLlrJDLcV7T3?=
 =?us-ascii?Q?opVhfnQLs4W6o/pgIE0qUqdFUZRLFRuRMU9GsIu3XHLvq19WXvKcOWXdZrmL?=
 =?us-ascii?Q?GifXuuDkiNqWNFxnaQoo950hooWEDq03VH8wzRykNTszHP9CeYgPZCL6dHx/?=
 =?us-ascii?Q?vFJ4jK8L8cbtmae79nzW9ooAbV6qT6SFtJoyeAxP6AJhnD2A003OE46/IXbO?=
 =?us-ascii?Q?3Wq44kApCf5iqobTToh3OBoeIZkMAiz4yrovfvwed2/wROGWzkn69FSmujYX?=
 =?us-ascii?Q?4df+3I90ufU+mGj6fAHStq+Qy5CidGdp13cfXJnsWnnQ/IUB0+90y0O4XGCq?=
 =?us-ascii?Q?8PO7Z1FKvABcqC6P7EPvrzgN/euMrSInr/z1VM+UtC5mHS3S/5ftjbKG55pV?=
 =?us-ascii?Q?GYyoWSjOcM14C97KFGI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd0cdd1-894a-4f01-44c0-08db2b20409a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 21:56:12.5544 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OA+Nmz20shDyiysX3HFiP8sJDIXHBCxR4d5jr9gLO6kEQVSh+tFpsf4OlvMnxLTC6n/yr4rybBkzvGkpIoLNmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8019
Cc: Jose Abreu <joabreu@synopsys.com>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Eric Dumazet <edumazet@google.com>, Wong Vee Khee <veekhee@apple.com>,
 Fabio Estevam <festevam@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Tan Tee Min <tee.min.tan@linux.intel.com>, Jon Hunter <jonathanh@nvidia.com>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>,
 dl-linux-imx <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 Andrey Konovalov <andrey.konovalov@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [EXT] Re: [PATCH 1/1] net: stmmac: add support
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
> From: Simon Horman <simon.horman@corigine.com>
> Sent: Wednesday, March 22, 2023 11:33 AM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: David S. Miller <davem@davemloft.net>; Eric Dumazet
> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> <pabeni@redhat.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>;
> Shawn Guo <shawnguo@kernel.org>; dl-linux-imx <linux-imx@nxp.com>;
> Giuseppe Cavallaro <peppe.cavallaro@st.com>; Alexandre Torgue
> <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>; Sascha
> Hauer <s.hauer@pengutronix.de>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Wong Vee
> Khee <veekhee@apple.com>; Jon Hunter <jonathanh@nvidia.com>;
> Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>; Andrey
> Konovalov <andrey.konovalov@linaro.org>; Revanth Kumar Uppala
> <ruppala@nvidia.com>; Tan Tee Min <tee.min.tan@linux.intel.com>;
> netdev@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; linux-
> arm-kernel@lists.infradead.org; imx@lists.linux.dev
> Subject: [EXT] Re: [PATCH 1/1] net: stmmac: add support for platform specific
> reset
> 
> Caution: EXT Email
> 
> On Tue, Mar 21, 2023 at 02:09:20PM -0500, Shenwei Wang wrote:
> > This patch adds support for platform-specific reset logic in the
> > stmmac driver. Some SoCs require a different reset mechanism than the
> > standard dwmac IP reset. To support these platforms, a new function
> > pointer 'fix_soc_reset' is added to the plat_stmmacenet_data structure.
> > The stmmac_reset macro in hwif.h is modified to call the 'fix_soc_reset'
> > function if it exists. This enables the driver to use the
> > platform-specific reset logic when necessary.
> >
> > Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/hwif.h | 10 +++++++++-
> >  include/linux/stmmac.h                     |  1 +
> >  2 files changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > index 16a7421715cb..e24ce870690e 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> > @@ -215,7 +215,15 @@ struct stmmac_dma_ops {  };
> >
> >  #define stmmac_reset(__priv, __args...) \
> > -     stmmac_do_callback(__priv, dma, reset, __args)
> > +({ \
> > +     int __result = -EINVAL; \
> > +     if ((__priv) && (__priv)->plat && (__priv)->plat->fix_soc_reset) { \
> > +             __result = (__priv)->plat->fix_soc_reset((__priv)->plat, ##__args); \
> > +     } else { \
> > +             __result = stmmac_do_callback(__priv, dma, reset, __args); \
> > +     } \
> > +     __result; \
> > +})
> 
> Hi Shenwei Wang,
> 
> I am wondering if any consideration was given to an approach that has a bit
> better type safety.
> 

The patch aims to add the missing feature to the original source file in a consistent coding style. 
I am also okay to use the function prototype if everyone agrees.

Thanks,
Shenwei

> Something like this (*compile tested only!*):
> 
> static inline int stmmac_reset(struct stmmac_priv *priv, void __iomem *ioaddr) {
>        struct plat_stmmacenet_data *plat = priv ? priv->plat : NULL;
> 
>        if (plat && plat->fix_soc_reset)
>                return plat->fix_soc_reset(plat, ioaddr);
> 
>        return stmmac_do_callback(priv, dma, reset, ioaddr); }
> 
> In which case the first parameter of the fix_soc_reset field of struct
> plat_stmmacenet_data can become struct plat_stmmacenet_data *.
> 
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h index
> 9044477fad61..b26ade7e4be8 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -223,6 +223,8 @@ struct plat_stmmacenet_data {
>         struct stmmac_rxq_cfg rx_queues_cfg[MTL_MAX_RX_QUEUES];
>         struct stmmac_txq_cfg tx_queues_cfg[MTL_MAX_TX_QUEUES];
>         void (*fix_mac_speed)(void *priv, unsigned int speed);
> +       int (*fix_soc_reset)(struct plat_stmmacenet_data *,
> +                            void __iomem *ioaddr);
>         int (*serdes_powerup)(struct net_device *ndev, void *priv);
>         void (*serdes_powerdown)(struct net_device *ndev, void *priv);
>         void (*speed_mode_2500)(struct net_device *ndev, void *priv);
> 
> I do see that the approach you have is
> in keeping with the existing structure of stmmac_do_callback().
> But I guess my question there is: why is that model used?
> And could there be a plan to move away from that model?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
