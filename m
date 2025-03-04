Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D9A4F010
	for <lists+linux-stm32@lfdr.de>; Tue,  4 Mar 2025 23:21:42 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5BAAFC78F6B;
	Tue,  4 Mar 2025 22:21:42 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6E1AC78F68
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Mar 2025 22:21:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlv8phTpSndoCVhWC+iP3CtC9e+MeUBv/FYtoaL3cY8qymhYNWUIbjrKQjVjtoZm3eJZGaUAO2Ru/PAFloOXIxwetk+MW7/NHruxXxGCIOqT/s+WRcQZI4VLeNEikP/jR6dp3ryb52LYAGO+KkEegsKs1snMpGbYebu8w1XhTY5g6WRIPJJkKQkKpoIfER803Up/ttgoIJPz3a9538JQDJ2eVGAAE5ERAXfo85qpi1YL2ekq/F1IkxRF+0iXDVRvvRF9yuxBryKXoJylH80vH3O8xeWlspEBeuilYckncGGOEVVWXxuoTvI5mDWfQFrP4OoBfm+9EyvBVLoUlwbEPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3xBByBRQj/ZIftPN0FMSdUzrOisbK7+nb9lekmNlXs=;
 b=Y3nGwoTZAt4vP1zb7WHvNvMxusHywxZKWfmTeh7XsZBIxrU7hoaHK7rBaDwLJF/OwZU9CJV1Wu3TyBgyajJQvK1lcaiA6n51SGp3taTZxiWa9BsEhAuu8rxf2OSmn9Gp3wrACB+WrMce3alGpFwMJ5yISgWKsPsYqXKlIdZ4gSeS+g4zNFPVCi8l6VLTTXOGMbDvEFVMxbrwyRT7tHBx8ItXDKjlEQb5VDqkIXvh3NSGNdTva3k6K/p50b6up469FRQNdZt8+7omszpDSr0ko3NJrlLOA3F6jCi2Rusop/fg+VXWdcCfT8cRb4D4jQCsft2uCD38blRoAJbhDKdF6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3xBByBRQj/ZIftPN0FMSdUzrOisbK7+nb9lekmNlXs=;
 b=nz2OKGDzH3qdO15yqPLktPETbrl7EnJoGglho60q1VRmdB0pB+AdLg5FnZZoLjmR9/y/RhqTZVegqYpdecfyMQaZk8Imy3Ph8eU6GXYWm7t6hco62z1BQAegdhDsfTLt2jM4or9HTa4EMXJEbHwK+hRfxEGCe585SPFz8zVhfPj0b12Igk72fyR3V0X4Z3QFpvSKPW4XgogrA7Jyw+FSmQBohrti2Zy5eVeKz9/Ca4PvYIki0jqQ7ZkFbPiZgjUZHM3cykCDP5JtIxLqo1QDLd+hHPo6LKFWnHJYluBZxWcjlJ4AKwsjUms42PzsEtcK7QlYoBuzQkIvKrBpriKwCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by GVXPR04MB9927.eurprd04.prod.outlook.com (2603:10a6:150:118::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 22:21:27 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 22:21:27 +0000
Date: Wed, 5 Mar 2025 00:21:22 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Message-ID: <20250304222122.67bjes6jzbiveqfk@skbuf>
References: <20250303102658.3580232-1-faizal.abdul.rahim@linux.intel.com>
 <20250303102658.3580232-2-faizal.abdul.rahim@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250303102658.3580232-2-faizal.abdul.rahim@linux.intel.com>
X-ClientProxiedBy: VI1PR06CA0101.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::30) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|GVXPR04MB9927:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f48dd7-1890-400a-2b27-08dd5b6ae7c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xYVSqn6YC3ZhCVcGTnG8jgw2PIqGBm1grr2/dOvtSJvXJPmKfQ4V+MeQS26s?=
 =?us-ascii?Q?BDoDKG9mndqrHWNqhWURO8utgR+ukXqwLjRJke6y1BEuWxbvAeAyjta3MqeB?=
 =?us-ascii?Q?VfPpR4sJYObmM0SBZQ4lvLJCNjAfGq3vCgjaqZNTAlnB9kAFOK1bSRtxK2Yl?=
 =?us-ascii?Q?y3bU8VxyxDU9KPmYcUQV+pkXYrcjiVFHat51/3jGx4D3elBIyfaJckPbbYr7?=
 =?us-ascii?Q?n7gpUCObzsUXmkDBXgrixtPyvreFgAfrf3zo082yvYXGCc5oIcSokPeuewgF?=
 =?us-ascii?Q?161DOyOaw1sdpvQkg8TncOCCyjOT4qL4z55jDjdvDaH6PN6zzZgc7GHmPgl7?=
 =?us-ascii?Q?ZMsevLqumS7Qybo9e6SGeUo7jyk4al2aT5prtLmejxZ6jUBg4ic8pvpx70Z2?=
 =?us-ascii?Q?cRWE26z2RJgFU18B7m5qnZsWuzx1lrchWyY74bsvvR8Yv2eGMe7edp05HQ9A?=
 =?us-ascii?Q?W2IuA2kQBXfnwOcRcMkt4Z2E3Ly04PLaAGZoJKv24nXVc6v+TA7eb0W7gUjT?=
 =?us-ascii?Q?IBcmQDLWke3mwy2711L4QjUo5Oqf4ihGWZ+xYiti6R46YFWDXZA2uUO927tx?=
 =?us-ascii?Q?qyyFYjJFXfYHPHe46xIbZODTIETKHsKYDfSYcrHacSCh6H9ywKJO+B970Asy?=
 =?us-ascii?Q?WSd1NJJPYeQO8Gs0jc53e7jKD7AgmyX6mPYz+9rqH2a1rcygTNnaLA4KoeC+?=
 =?us-ascii?Q?ATf9arSNGNYbz+enBhLynWSIlh94i4k4YsYmfC9QAn2YBoqevLTIEdMdjXEM?=
 =?us-ascii?Q?V4HZkc1cUbBgq7/tBvpIGpJUk2+YdXzs5CjgkxqlSlhmHVALN31RcCdMtcXH?=
 =?us-ascii?Q?4TBiqDGRP02pWUktQwzPgwGRN4qrRXShK0eDmJPu7trINYEF70HoUcbvr9ne?=
 =?us-ascii?Q?xQD8kfPA627X77RrO8+Z8nPuIQm8X+DkSrlor2GXxDyLLkmDoTCe7jHJiqXx?=
 =?us-ascii?Q?W2Zghqa9sGm4To0w2Lf4VNCdgKEcqXT0UXsJOSDy2RBA2R1BH7wxUYcTqErp?=
 =?us-ascii?Q?isHlBEJjZuJFAfhAFEqQecExFJDZ4ZFynZxbTm4Y8n1IjDEh93CagvTRsw2V?=
 =?us-ascii?Q?mqVNE9JSuXRYIj9tzqwPJE+KKSJtAMedsdCmd6K1T5rDfvnnq5pvW07vhwfN?=
 =?us-ascii?Q?kZhdqQoAnIHRafHWEpEWlL3tOFC/agMeC+KtjLQJMcNqwlYJztGE1lcT0gtZ?=
 =?us-ascii?Q?055HKCACBsFgGlfnKm+pZxgnLS5qNsO0Bu77J6w+icFO7EPXViOkJlLXA22E?=
 =?us-ascii?Q?SxrHA9ywoyPHAYaQhW7P3qpPv9R0LIsonz8I5qQhwaCabwDnoIu+agtdRSck?=
 =?us-ascii?Q?pu4xbe/M2oNuTC1SiDKNIdSDT2xQYzn4TIlYJgk+hQHXjdscm1IVP2SysvjD?=
 =?us-ascii?Q?KX43lrmay7zWfPuhVpYtyuexTRdi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7779.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sGnHZ05owoly0t+Gtud7nzh0V+Bs1jimrc8F4iHbH2Qs3dpyGuqbbdDlUQb2?=
 =?us-ascii?Q?hHibm3TOA9U57wOkOFHtT5hHmGAxmKxnqdrP3VUKWzN7EYlDKLH4jeZNKOUr?=
 =?us-ascii?Q?lsVZ/+gH0YGo1OMab4JQ3cJ9gY7jbsohIk3457sSwS+Ne+7U9jZe01K7cYHJ?=
 =?us-ascii?Q?quOvNw+c5AbS4pZIMhnHQuFrI6UZ08Q4vm6heyCRHtQh+Pmtxsn0JVNW2cEH?=
 =?us-ascii?Q?bjBdZ6BF7ox0GXCzS3z2Kl+FKbNC7GEq0UyaS0aWweKHDLdq2nGru6j3VcbS?=
 =?us-ascii?Q?JGe93glwPBHtnp1SNOn+gWsx9uRIsmxTCOBYR4omF8nrt2FsE7NjkHXQDnX4?=
 =?us-ascii?Q?NqPCCK/wr4csSeUEI33cht6sDeHWqlCdMPQ8WVMtY6gUiVgapFHCW27EUzE0?=
 =?us-ascii?Q?JC9Jvh128G+N0CM5zkU7NhcKaxbCzlQ+l/CB8PHjTtWcUXiCH4ACobLb0jx/?=
 =?us-ascii?Q?ucN9bHG+jY2/9AiSDRpM79jsTfloVBeYUsjBw/ux9HUJujes2GwwMVGb93IH?=
 =?us-ascii?Q?thviJXNO7q70p48TkxbeimgvPa97YiZPLFgcHHQdupL5P+ipSesAhiejdhSA?=
 =?us-ascii?Q?qq9SLyOcz+l3NrUlAH8J0CjWaCIg8qsamnocS10QmjQr6KAGmWNTNDef7aVF?=
 =?us-ascii?Q?JPtNG98fGwYM5WcI0/8B0dudwr5tnTosfQ53nuLuXC18spg03JwnPEr8d9Sn?=
 =?us-ascii?Q?AIXFnV+oOpzdZIf4BrQPS9wZ9ROihfcxbcMc1iXAuHFQiaOr6uhva8ddWXvG?=
 =?us-ascii?Q?Cb5NwfKfiA8fZLEg7HTbFx3OUn2tAPOJq7nYPOOsJxPdNOa6Ld1zB2SFsHUJ?=
 =?us-ascii?Q?BPRkvO4hOapqQPpQK2X06E873NCwB5r3pGi1ZhnTVSJfJ7jnPnOcAAh+t+2q?=
 =?us-ascii?Q?f9VT7zLfgGFazJr7e0o3peBnZw0e5ti+ObdS1poAgmeAoRs8U7Hop8qJ1HIA?=
 =?us-ascii?Q?4ZCIM5sdXCgOg0VjVeByawXnH18gT6yGBcNHg+tIRTT/rCYX6oCk7bDaYMS7?=
 =?us-ascii?Q?Q+JwZrL4FpefioVx4TMMOde3xuNG/ca8+ePvy8CynvFqIMZJ+AfeEFteBAG0?=
 =?us-ascii?Q?byZ8VxwZ6CU13TScPG7Ld8BZlQHZUbjjEBECfaJWZN8NeRXe0qnIxtXJ8EW2?=
 =?us-ascii?Q?+uJy6vz90TwLyKMIpece2bfYl7KTwCig94Ns6fHco/T0BttbF/ThCVPurhob?=
 =?us-ascii?Q?IhAo21TgkLj+Yh4koSWYX3miiWZJqIQspCTpvCqBzPtMh47QlDK3x91/f6IF?=
 =?us-ascii?Q?ODVAZyIPlHImNtNeTnMI/RnXsOZp0a9bltNcJUWU+ZA5Otxka4w/zliyH1TZ?=
 =?us-ascii?Q?/IULpdP+eGoFw3UT4fCdDqPvMfwI9VLR9gv6p45ah5IbxVtnYKXs3EBcJM3F?=
 =?us-ascii?Q?PWcTjIaYOxyB4UtoP9suoH2/Np86nExu7MBAa2ydW+fCRwzfyrfYWdW6XujP?=
 =?us-ascii?Q?k0IarELcnHbY+sxZRNRkDP6z3z8BC0TKT8eyzl1VYxRoaPAE4QNwnaE4MTU0?=
 =?us-ascii?Q?be3sLOB6Z3KBi8ZNuJchy8kOafO2IJOC+hyHQU+N/pi4sPuIAStTBoX3Ft2j?=
 =?us-ascii?Q?fjBBP1ReLdUgHNlTxmRPerYNYpETxd5rxwAfBRf0hgKgl3XtgUIvpxec+UiQ?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f48dd7-1890-400a-2b27-08dd5b6ae7c8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 22:21:27.1745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uIDN80nZm015n7UyXEgqJ29349z/snF7/XiepI2jyo/QfZ3Rufa+Q7tK6uo30x5euQiyWZyN96ND+oSZjJjpLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9927
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Alexei Starovoitov <ast@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, Gal Pressman <gal@nvidia.com>,
 John Fastabend <john.fastabend@gmail.com>, Furong Xu <0x1207@gmail.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Kory Maincent <kory.maincent@bootlin.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 bpf@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH iwl-next v7 1/9] net: ethtool: mm: extract
 stmmac verification logic into common library
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

On Mon, Mar 03, 2025 at 05:26:50AM -0500, Faizal Rahim wrote:
> +/**
> + * ethtool_mmsv_link_state_handle() - Inform MAC Merge Software Verification
> + *				      of link state changes
> + * @mmsv: MAC Merge Software Verification state
> + * @up: True if device carrier is up and able to pass verification packets
> + *
> + * Calling context is expected to be from a task, interrupts enabled.
> + */
> +void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up)
> +{
> +	unsigned long flags;
> +
> +	ethtool_mmsv_stop(mmsv);
> +
> +	spin_lock_irqsave(&mmsv->lock, flags);
> +
> +	if (up && mmsv->pmac_enabled) {
> +		/* VERIFY process requires pMAC enabled when NIC comes up */
> +		ethtool_mmsv_configure_pmac(mmsv, true);
> +
> +		/* New link => maybe new partner => new verification process */
> +		ethtool_mmsv_apply(mmsv);
> +	} else {
> +		/* Reset the reported verification state while the link is down */
> +		if (mmsv->verify_enabled)
> +			mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;

As requested in v5, please make this a separate patch. It represents a
functional change for stmmac, and I don't want somebody who bisects it
to find a code movement commit and search for a needle through a haystack.

> +
> +		/* No link or pMAC not enabled */
> +		ethtool_mmsv_configure_pmac(mmsv, false);
> +		ethtool_mmsv_configure_tx(mmsv, false);
> +	}
> +
> +	spin_unlock_irqrestore(&mmsv->lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(ethtool_mmsv_link_state_handle);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 918a32f8fda8..25533d6a3175 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -1210,37 +1210,17 @@ static int stmmac_get_mm(struct net_device *ndev,
>  			 struct ethtool_mm_state *state)
>  {
>  	struct stmmac_priv *priv = netdev_priv(ndev);
> -	unsigned long flags;
>  	u32 frag_size;
>  
>  	if (!stmmac_fpe_supported(priv))
>  		return -EOPNOTSUPP;
>  
> -	spin_lock_irqsave(&priv->fpe_cfg.lock, flags);
> +	ethtool_mmsv_get_mm(&priv->fpe_cfg.mmsv, state);
>  
> -	state->max_verify_time = STMMAC_FPE_MM_MAX_VERIFY_TIME_MS;
> -	state->verify_enabled = priv->fpe_cfg.verify_enabled;
> -	state->pmac_enabled = priv->fpe_cfg.pmac_enabled;
> -	state->verify_time = priv->fpe_cfg.verify_time;
> -	state->tx_enabled = priv->fpe_cfg.tx_enabled;
> -	state->verify_status = priv->fpe_cfg.status;
>  	state->rx_min_frag_size = ETH_ZLEN;
> -
> -	/* FPE active if common tx_enabled and
> -	 * (verification success or disabled(forced))
> -	 */
> -	if (state->tx_enabled &&
> -	    (state->verify_status == ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED ||
> -	     state->verify_status == ETHTOOL_MM_VERIFY_STATUS_DISABLED))
> -		state->tx_active = true;
> -	else
> -		state->tx_active = false;
> -
>  	frag_size = stmmac_fpe_get_add_frag_size(priv);
>  	state->tx_min_frag_size = ethtool_mm_frag_size_add_to_min(frag_size);
>  
> -	spin_unlock_irqrestore(&priv->fpe_cfg.lock, flags);
> -
>  	return 0;
>  }
>  
> @@ -1248,8 +1228,6 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
>  			 struct netlink_ext_ack *extack)
>  {
>  	struct stmmac_priv *priv = netdev_priv(ndev);
> -	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> -	unsigned long flags;
>  	u32 frag_size;
>  	int err;
>  
> @@ -1258,23 +1236,8 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
>  	if (err)
>  		return err;
>  
> -	/* Wait for the verification that's currently in progress to finish */
> -	timer_shutdown_sync(&fpe_cfg->verify_timer);
> -
> -	spin_lock_irqsave(&fpe_cfg->lock, flags);
> -
> -	fpe_cfg->verify_enabled = cfg->verify_enabled;
> -	fpe_cfg->pmac_enabled = cfg->pmac_enabled;
> -	fpe_cfg->verify_time = cfg->verify_time;
> -	fpe_cfg->tx_enabled = cfg->tx_enabled;
> -
> -	if (!cfg->verify_enabled)
> -		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
> -
>  	stmmac_fpe_set_add_frag_size(priv, frag_size);

This is another change in behavior which unfortunately I am noticing
only now: stmmac_fpe_set_add_frag_size() and stmmac_fpe_get_add_frag_size()
used to execute under &fpe_cfg->lock, and now run outside of what
eventually became the mmsv->lock (but still under rtnl_lock() protection).

I am not seeing a need for the additional fragment size to be covered
by the mmsv->lock (the mmsv has no business with this parameter), and
rtnl_lock() should be sufficient to serialize stmmac_get_mm() with
stmmac_set_mm(). So I guess I am ok with the code structure, but again,
please move stmmac_fpe_set_add_frag_size() and stmmac_fpe_get_add_frag_size()
outside of the spin_lock_irqsave(&fpe_cfg->lock) context (essentially to
their current positions) as a preliminary separate patch. Again, it is
best for a "git blame" caused by a behavior change here to not point to
a commit that moves code from one file to another.

> -	stmmac_fpe_apply(priv);
> -
> -	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
> +	ethtool_mmsv_set_mm(&priv->fpe_cfg.mmsv, cfg);
>  
>  	return 0;
>  }
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
