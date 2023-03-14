Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D78DF6B91E6
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 12:42:57 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9B11FC65E60;
	Tue, 14 Mar 2023 11:42:57 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C50A0C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 11:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678794176; x=1710330176;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mb49g31XP4uyS/PH2LJ8nFMSdpmzZQQixvaibeTuf/o=;
 b=TEN0Nw1bJwNAWQGEf8NRSBQwl4/FDivOshpXhxoZkH1xUoTMZOmgdVni
 wSIgRVXp4HkQy9phlfxXlNCsXMPqNPuPIliSLBDbyUVPunLGDjjG4EMjl
 OqZXounsuQPBBI0xslQCslt1ul4XStTu9b6H6Nf5SElN2BN1wfWy4tE17
 uuk4QnrKUEGbo0ZhB6QepzFXJilEZUtIAifpyRplz9DGv62XXGXJY+0iZ
 LYvCzfcj4eNBFnF6A3taf07dMWo4JV4Zp85EQKLRsBcFoRevfYrwIuT6x
 lTskp+ewUDGII/iqR+7BwBcLY81JLyN1AnmjDk/ZeDMgYXwrbuA0Yj0MF w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="325763707"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="325763707"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 04:42:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="679060543"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="679060543"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 14 Mar 2023 04:42:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 04:42:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 04:42:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 04:42:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0GEpIbgdI4ZZF8+Pc4S/6wAOsHkvaLAYud3AA0ih/rXvJAiL2G/3mJ6Gsrlpf4vzsJHPINfjgqNyToU+7wvYctd7afb2QSPitFlUlU967qe4Xmi7LpN2bdmE/1iZMIc+SO5EQmKl11dKHTKKuJxHH4iUYJqnNcSPyHDinu6Te8RcRzPf6N6t46PU+uroRTeKGaNkDEJBmcuiDoc/z8dszTbz9sUs4W76YBKpEREAh70B/IS6uogKvR61kvPCkGl39JgouMfRJNwF1uujFQNT2tUFj8ac64FUJzIkfcn40VAJiJGbGoqtK++QVmY+6g7rsh/L0HDYANHaaky7T0j7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xy6DipbnVO4ehdDChRVwh+LF7ITi36ynPyDDnzQcGlk=;
 b=Me21DKxiQ6DPraQ92X76j4kKzaueXmytP0d/NtjsOXOZNMA1JjHTqa7zap7o3Wmx8pOA/a/llMk6RyiUE+TnQjMgMI9EQVXgzaAZxMN86aFDw2+nxkPvAwe8OGk6INjUSMVcZCgMKfKwBDPYvJC9n4Ke+9TAlp0lL+4xaBg/XNB2C1dsTpcQkFBH4HrXQyKQjez3fwg87z0yw9ntW6CTzNHnhUpk0hSV/EbCXfia+dX6DM/pLUCkRux1bUWpwc5RMRyhbWPk+Gn4i2whdgddblGQC3Fw+R+IXrZ6nJXWs5CCSSHE7G+171jTaBh38UQFCAz00Csp+2SCMHOuxjHIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13)
 by SJ0PR11MB5646.namprd11.prod.outlook.com (2603:10b6:a03:303::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 11:42:31 +0000
Received: from PH0PR11MB7471.namprd11.prod.outlook.com
 ([fe80::37bf:fa82:8a21:a056]) by PH0PR11MB7471.namprd11.prod.outlook.com
 ([fe80::37bf:fa82:8a21:a056%2]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 11:42:31 +0000
Date: Tue, 14 Mar 2023 12:42:22 +0100
From: Piotr Raczynski <piotr.raczynski@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <ZBBdnu2OkCRFRinT@nimitz>
References: <20230313224237.28757-1-Sergey.Semin@baikalelectronics.ru>
 <20230313224237.28757-6-Sergey.Semin@baikalelectronics.ru>
Content-Disposition: inline
In-Reply-To: <20230313224237.28757-6-Sergey.Semin@baikalelectronics.ru>
X-ClientProxiedBy: DB6PR07CA0120.eurprd07.prod.outlook.com
 (2603:10a6:6:2c::34) To PH0PR11MB7471.namprd11.prod.outlook.com
 (2603:10b6:510:28a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7471:EE_|SJ0PR11MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0a9da1-f780-4e60-e2b1-08db248131c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J1rBCQKD8TtkaWQgb5TOtOUcn8dww5cz75ENd1ygWPhuByMdf3j51qushwOAPfogmrLhPxE655ho6/3na9hs6jNnzPNLD1bwALKwFkh/AfA2Zp2TcEfJEtAOeN2hWJpTvpCxOUr7ffIAbWwiJKcNHxS1ZHvtqn4hZJ0T+HKOeoZes86YDXVi+CQIs/2zDVDRDSH+t27i72WV04L9cnwbsCG/4tewddUob/w+N8hPE2FF7aWfM/R/dWAXkewHutJvYLxKGdKEEV2h07fe+CbDn57BeuSqMcxkT9scrpnp89Zxs4T96XVaXIHuVrPTkYXxk7Svu201gonIw3k79PKc33l21Y+0ONRA8Q07YqQ+dxC5obynTEP/NKJ6qWBjujsOoAtzLWLFqOTln1bjFFbr4fqKl5IejJwUA1Y8sB5brl/7MwIqVzlRejbt2uGGbKtMtIUsuS3KiCAmGsXRIuU0fyTGxSsT6KY7Nrf1dJKoBXAHGnhl8W7HNO5fB4QfVTb3beysFhVDL4ZlpMIAzJrShUA59weUNMjl0bLUr5LwNOtM+dRrLGXMuHO530daqhlbkmY86lrOt5tmMLrWPYS/XRcq/sxNoUr9K384Cq1k099ciUgazF8SCYlDZJGE8ItEs582aEZG43mcC9DPLHJlaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7471.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199018)(316002)(54906003)(6486002)(478600001)(5660300002)(7416002)(2906002)(8936002)(4326008)(44832011)(66946007)(8676002)(6916009)(66556008)(66476007)(41300700001)(82960400001)(86362001)(38100700002)(186003)(33716001)(6666004)(6506007)(9686003)(6512007)(26005)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zF3X7iuDdnNcL/Mimz68Dps5HZSA32jAKSeDg4Z2OxhgQBsEDsjPEwQhpvbL?=
 =?us-ascii?Q?+b76kIqOIHv+WMB5zVZz3qvpM6vsGzlQ/tcYFWcrwQIOPyK6V5DZlYEcANp1?=
 =?us-ascii?Q?soskwkcv/PWTMCt7tlTkt84f9dgZWmGovvOENZnFCoeGrjMJm8/Ew5exR+Ab?=
 =?us-ascii?Q?dIMvq+Kjk206miVx9GtLjxnaOwrQsZI1u0TAANuG9rCUJi3w6tcgZG3E7m1Y?=
 =?us-ascii?Q?J4rUGiMrm08/M5kqeS6NgpGIXj6xwkWGEjSh+F75zDWbVYfa17nVHWfsTalC?=
 =?us-ascii?Q?SAXcaf3+39rwP4Y8JqkNd46ZBgpewN01l0BEA7pE8/506mvtFxhilW+a9fN6?=
 =?us-ascii?Q?gVmwdBb4bhsNlpBxYbgBDzM3+mMlFDGeza81aVxTttX3QSLZIZ8VbDanLp/m?=
 =?us-ascii?Q?HesfH5b9c1LxqtXA7SUa3UDAmD7tFoIacSzyTvnBN8ktoHXayO/6aijg4vAd?=
 =?us-ascii?Q?/PLowJ7NDBzmyyTZWMMxFlmEI8a3hXygSEGJNh+LrWuTOGJ87nRWqMgmrTbq?=
 =?us-ascii?Q?oYtASo4GL6skYzJsevYDtCyGjj5sIR+zvn/Cmgaur3oSNi6ytIN+RxGCR+a9?=
 =?us-ascii?Q?WFZan3xncBqZKe79hJAmZrfsor2Ub8UlILiMtu2pjYjsUyx856RVfjjzR0BJ?=
 =?us-ascii?Q?ZaNQXzMVoaajoEZVf6aSldGRVv8JOt/v29mDjCwP8v194Vgv+x98lzh/3DnM?=
 =?us-ascii?Q?7nO2m75KSyv46PzTjIGdyX8uHgXmyQnzjV2QMl6XoAGDLYuJmo6RDLpAEur3?=
 =?us-ascii?Q?KDkfSk0Zj2O5Ss3Nb2Gcl2CQ64CN17nBYFykpjF+CjYHGtL4UNI0dRhwM3AT?=
 =?us-ascii?Q?/gHYvKHkTPyhr/5jM9A3Nc1QZnVvvjxh4mtydXRxwKAnJ0+8rMV0dgmiTK/C?=
 =?us-ascii?Q?cXYgJfmcrdNnqP3iZCCojE1Imy9GtEz6mMe6TAXW+P3OYzHk/Jds1bQPddY3?=
 =?us-ascii?Q?+aOmbZ057ldOTt5V2mmivAqJjfPVQdowJkRdqwSHbbOIFFXfbxv6TjDn0UPZ?=
 =?us-ascii?Q?/nOhuOHLC51UeqmDf/V7V+d9EuBQjRl16hBotaN7w9Paq/H60v12gw7TH0ll?=
 =?us-ascii?Q?t+obh8VvgiCvz+LRNa2PPiS9u4CsuttPDQYI5aLrEQYX42aCrqAt9VsWYBZ8?=
 =?us-ascii?Q?Sz3vCkM8aD9TeZmWOEUXYaVF0tOU7mvJZ+N+bTAAySCuMkLPK41KiDKossoy?=
 =?us-ascii?Q?gABRf5P79ZkyYt5xp6m95P53hJ9zCgHhEWzr8QNEa6F//UbTjVS7UWWMPM+P?=
 =?us-ascii?Q?I2KPo9oMgy4CWjBuvNYV3H+QMMlcRmPI1DPB9jkxAUEl97z+vENxyV7NE1ZE?=
 =?us-ascii?Q?SGYYDPy4qI1WT4pEMIqZQ3vLW1scdlCWyDVyf4g2vUrl9phaiLlmEmePXICF?=
 =?us-ascii?Q?tSUObSOoILMXe9v74hRMxf1ecqmrVR8H2OnCJzZcoEXQeC01sxYooLx9WOFg?=
 =?us-ascii?Q?hv+fKXCjImGk3KvBYY9MD23cFmoco13PCpbz+SE/0iEXiUDgUSn3TvpH0SPK?=
 =?us-ascii?Q?7oxqQTsL5bcjoO/GRqxZAHIgK8Rke/kwipbS3e9oEZGFXTGmCM5N53vxcEo2?=
 =?us-ascii?Q?oGPTeEqRJF4VDIey2NEwUg8E61bti8FhlVhCt04bcGz23dWsgLjEe7nq//4v?=
 =?us-ascii?Q?og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0a9da1-f780-4e60-e2b1-08db248131c6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7471.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:42:30.9599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: feDt62s/UthHqYMzUxDDa5V1m2TJlKBrevOaMUP/tK/F4D0wI8DedeL5zgXlq9P/13Cs4fI+jvbQcr0d2IekVekmCTk3xyR0pqIpb+MjE3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5646
X-OriginatorOrg: intel.com
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
 Christian Marangi <ansuelsmth@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 netdev@vger.kernel.org, Yang Yingliang <yangyingliang@huawei.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Serge Semin <fancer.lancer@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub
 Kicinski <kuba@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net 05/13] net: stmmac: Enable ATDS for
	chain-mode
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

On Tue, Mar 14, 2023 at 01:42:29AM +0300, Serge Semin wrote:
> It wasn't stated why the Alternate Descriptor Size shouldn't have been
> changed for the chained DMA descriptors, while the original commit did
> introduce some chain_mode.c modifications. So the ATDS-related change in
> commit c24602ef8664 ("stmmac: support extend descriptors") seems
> contradicting. Anyway from the DW MAC/GMAC hardware point of view there is
> no such limitation - whether the chained descriptors can't be used
> together with the extended alternate descriptors. Moreover not setting the
> BUS_MODE.ATDS flag will cause the driver malfunction in the framework of
> the IPC Full Checksum and Advanced Timestamp feature, since the later
> features require the additional 4-7 dwords of the DMA descriptor to set
> some flags and a timestamp. So to speak in order to have all these
> features working correctly in the chained mode too let's make sure the
> ATDS flag is set irrespectively from the DMA descriptors mode.
> 
> Fixes: c24602ef8664 ("stmmac: support extend descriptors")
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 2ed63acaee5b..ee4297a25521 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2907,7 +2907,6 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
>  	struct stmmac_rx_queue *rx_q;
>  	struct stmmac_tx_queue *tx_q;
>  	u32 chan = 0;
> -	int atds = 0;
>  	int ret = 0;
>  
>  	if (!priv->plat->dma_cfg || !priv->plat->dma_cfg->pbl) {
> @@ -2915,9 +2914,6 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
>  		return -EINVAL;
>  	}
>  
> -	if (priv->extend_desc && (priv->mode == STMMAC_RING_MODE))
> -		atds = 1;
> -
>  	ret = stmmac_reset(priv, priv->ioaddr);
>  	if (ret) {
>  		dev_err(priv->device, "Failed to reset the dma\n");
> @@ -2925,7 +2921,8 @@ static int stmmac_init_dma_engine(struct stmmac_priv *priv)
>  	}
>  
>  	/* DMA Configuration */
> -	stmmac_dma_init(priv, priv->ioaddr, priv->plat->dma_cfg, atds);
> +	stmmac_dma_init(priv, priv->ioaddr, priv->plat->dma_cfg,
> +			priv->extend_desc);
>  
>  	if (priv->plat->axi)
>  		stmmac_axi(priv, priv->ioaddr, priv->plat->axi);
> -- 
> 2.39.2
> 
> 
Looks fine, thanks.
Reviewed-by: Piotr Raczynski <piotr.raczynski@intel.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
