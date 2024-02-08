Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E17D684E105
	for <lists+linux-stm32@lfdr.de>; Thu,  8 Feb 2024 13:46:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96CDFC6C83F;
	Thu,  8 Feb 2024 12:46:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F1D0C65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 Feb 2024 12:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707396375; x=1738932375;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VJLc7wRZa1/Une24M6Q/hexFrjpjlr1QlpcykAaOQ0k=;
 b=J4V60fww1KI50ngNoHww/vTmdssmtreSIHoEwPdGjZbBgxgmYuSqw9k9
 UFudEWKqeCR4zbkQY/GSv04cEIx9GM5XB/ni+EEYmuMHdVEE8jeebt51e
 LRwmxVgs4OAl8qTdktvFyW/SVy3ssz63YhLh8Hm2oKAhmBMw5xx9dFVMH
 +LUnIbXNWuuhfs9o4Fd4krJe1WgF6ZV4szwSph7J4jOAGl3fcFFinqE7U
 gx8xpv/6PUXMomAzgDpQj0bwnsB+8d7NBodEE17TzUhBc/FTcn90s2zGn
 hcrz++N1DQDJAjwX5pYt/6n8Jt8iklKFvYBzrHoxIFfKKNYzjrKgk/Ltp w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="12287477"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="12287477"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 04:46:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1640257"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Feb 2024 04:46:12 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 8 Feb 2024 04:46:11 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 8 Feb 2024 04:46:11 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 8 Feb 2024 04:46:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWt/KaA9K+7j2azuSzLEPb7Z/XG9/2f5DBY+fGcfqopp1TxSRTaIWrCzFxechZVjBTFWTrkey0wLG4a+O27xR/xsHEkUD2r2jn6FqUUJIm6mnJhMM2iSP2PCqDbrJR153WrrdNX1CjnoRqiKUq3TubvagC198UiY2ym6JOaQGcGuojHKSfVlTQ6zytm4g8fXx5RIFzQVxRM5yD5FZeEVVH9pPjyJ35TaA/LKEkSYvLJnrt9NCd/qQmqQ5NFpzeovju5k18AEfMOoWQmygdYiwNOG9sQBWVj6OM7JKrqJaGsA0VUcH/5x2UmbbltZEcA1U1Sm0QDD+499TxS/n13t8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7EImcVonCjb1uTlPdFq43f/FZH69qR3QmeHmj+/Pdk=;
 b=UTYFgeLGR3wRYn0PjBOxt4GraG5tWFid/TWpPWolvDc89eAF/MY+wcOeOitKP9coTopEnKWHMwUVVPJRbgugXeEyQDXon/PnafTNmXOeyQt3tdy/uGl3uy/8OseoVynG4pi2Il28KN+SrNbxJVHR0tKkYPRe7z5Fhscd1mhFHqznKnrB+9rRDLIIzUpDOv1U+XkgcYqgxvQViZwLWH+cYU0qNiWiTYCIdTrJzmZ0vxJjv/9IKKSe4mJR1DKcxjNz787QGo4pPA0XXnNfEBRclbC8rKHlNkowd9mMYtGlqZpz1Wv8V1OiopJrC+R3sqaIthMliZRQ4d0KZcuEJyjnWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 DM4PR11MB5261.namprd11.prod.outlook.com (2603:10b6:5:388::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7270.24; Thu, 8 Feb 2024 12:46:09 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::ccab:b5f4:e200:ee47]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::ccab:b5f4:e200:ee47%6]) with mapi id 15.20.7249.035; Thu, 8 Feb 2024
 12:46:09 +0000
Date: Thu, 8 Feb 2024 13:46:03 +0100
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Kurt Kanzenbach <kurt@linutronix.de>
Message-ID: <ZcTNCxrWTAfj90Es@boxer>
References: <20240208-stmmac_irq-v1-1-8bab236026d4@linutronix.de>
Content-Disposition: inline
In-Reply-To: <20240208-stmmac_irq-v1-1-8bab236026d4@linutronix.de>
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|DM4PR11MB5261:EE_
X-MS-Office365-Filtering-Correlation-Id: bce5b6b4-d6c5-462b-f8d5-08dc28a3ec68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qNh/KTkx73BOpg/CHGTzzaVTwyosqboobvCDk1QFdEW0vl9JcNsPturYnqML8ApIF+DTMgoWpRBLGTlNeflPmxckqcHxz8wkfzxkuXt3Rsrwzv94+g7aom1aNIb4At/L51SEjlMlFLcYy/kRJj47HtPP5RRVynIWG7FixqzaO8lX0r3iue7ob0a3ozFWyKAdHChspke+eb51gyZ2MdXKPY2uX3/FzJHVOvRb/04DpoK9/2WnJRNJbCHWsOpzvNcOoUiCkkQMdSzaWL+2sRckoC5tQKJp/5Kwn7G/U+gu0mUnif8BR9S9M7lpHkMIlIcQymSxSrMaleQTWXTxrwgvNslQAhoPWRX6WIHz5yx00ouiBcdtoZNeBi/lSBBt06x0kYBnmdlc3emwOwK4FnhPDmsCncWpTdNKt2KR/leOEEWAw1pkGRxROUYhAatMBEaWxS5r63f6E+LahQwjmewuI73ilNCpW6J7yxZWzRc8rFCsIs37UcB1Bf6aLpIrHCB3ZZIGpTlZvRGPfN3NCP3S6X2mTeTBtuq/ycs/oZlt3HouFsagI9ggFqBanZ1w9GjC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6117.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(346002)(136003)(396003)(39860400002)(366004)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(33716001)(316002)(6666004)(54906003)(6512007)(4326008)(2906002)(66476007)(66556008)(66946007)(44832011)(6486002)(6506007)(9686003)(478600001)(5660300002)(7416002)(82960400001)(86362001)(38100700002)(6916009)(26005)(8936002)(8676002)(41300700001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8mBH5chPBN1eN8M0i+GcTzn3jh7tdfd6rkFsBWEld13oGZqtXXW0RpIfYvGw?=
 =?us-ascii?Q?wYoNvuJ7qUwem6ZisfIzedwylbOD1dTchpJkTnEd9gJmuZ49k25NNcW2xbUb?=
 =?us-ascii?Q?fh6dhwQ0jL3jQp+Y/BlrTlAptLPR88x4M6GSKd+uKbLqN5+MZMZftVLzGfXF?=
 =?us-ascii?Q?0D1VpxGjIQsRj0pmWZC4GqQB3YZExYrrWRGMbR1QAEMlgVq+xoBzD0BNPsOC?=
 =?us-ascii?Q?01kLghNFl5wNgDn+XUCykr42aY758OKga3MBJllM8hQ2QkgKtqQCQQpjiNXx?=
 =?us-ascii?Q?AqBlHtuzpZV+YftGM6LRd2fjqNvi2OMGwQ1mFI4+y6vPjKO4kOgOuaB3EeF8?=
 =?us-ascii?Q?bCwTJ7LBrpvfnmson8nmFTl7mLmZetLJd2QQTG4N24GWzZI3pspggAdHbMUV?=
 =?us-ascii?Q?tKtDlyc+dpljUilGVc6Hq57pD/faHzrApcj2MXtKcqmmYUh9o1WR6TXzCJMx?=
 =?us-ascii?Q?NauQSi1VEr1toOxd6nqS6RU4EbljYYOOhS9CoBgdTbyhWxDLlqovSmow2omu?=
 =?us-ascii?Q?aSyjEannUOlI6T7LCGtoD8ORRbQ3jfH/BQ+VYdwySsMY23ppW1ZT2oKumc3n?=
 =?us-ascii?Q?v3J1s69gTcrpi39KWJZcdBM4rJ2yx/1RZS2GUea6gKbBs6cEBp39CY18Cdzj?=
 =?us-ascii?Q?PbGYcpo9wvDCnU7sY2mI0tP/sQeufTDb2GLU9IDc40nNYbcvB+FEvW78Y+RX?=
 =?us-ascii?Q?2WFv0EoHwFkuqxbgW4DjPfHHlij4YmKMGUfZiRRZkwOAMiz2QGEgc+1ZT5DX?=
 =?us-ascii?Q?PaAlkNP/iLYwgTb4Q0+hgwJWMSVxE3PZSOQALrSMqEwwiqpTs7g3xEBIRjSp?=
 =?us-ascii?Q?xdeT43aUoOKHn0bxLLQ3O2SXQ5Qyt2k7ujRG7Ch9cebNr1OGrDtvnNv2YHFb?=
 =?us-ascii?Q?Ziv+YQ5ZRhRuqZ/hkkQUrmPHNj7bf2jlkeuUpBt8wl1bOYJLaBlZ1lQdNErE?=
 =?us-ascii?Q?ALfXb0SJvgIXvGwXApJfOuhFMEp3Sq6/VwymqbOk+susdKpHz3CBTqbvPOUl?=
 =?us-ascii?Q?j03OoGrJKmZsdkF6CClapU3LKuBfSBTGng0pk9etZ+zEYIVHjI+CLPCldeJQ?=
 =?us-ascii?Q?4fwRAOvuKbicK8kyt6bO3cjZ+7cjIyXIVNmRL5IAqQFpHIVxAjp1mzEHbmXy?=
 =?us-ascii?Q?ZcPx9W72ITZhDCVBGEyT+y0hQ1Mgb/X1MccY0sH0dhNq/rwZhwjjCe2Qk9T1?=
 =?us-ascii?Q?xQrI9hWBau+fPcr+Lzwwc/JMDKC+c9c8kwf8P9UmkBfporEVMKkNYhaEE1JB?=
 =?us-ascii?Q?1v0nx1MqAleu/B20fJWGEnlxOpc4iMsWqNjoquXhmrLYrIUU0b1BMzvBALYN?=
 =?us-ascii?Q?smKyctFCgqrt8rvKoSBYzA1dNdagfHBj68/VdZW/gv0QoDF2xPId9McNymku?=
 =?us-ascii?Q?BovF8F3YqPtO/IDx2wNdKT6B0iT2YBhxtChc7fNIXk+3VWvnQJEWWuHLHvsy?=
 =?us-ascii?Q?TE4OdX96iIYc3vS7cDnZ+6e2K/yquYDVWAPDnGqucwMGUVQxnvzCFKvUJGNt?=
 =?us-ascii?Q?zl2/LBQAnOPeyssJrST/abqYaa/Ae/bqPQ598EI6TGX7nOD7a8IK0M2PG+eX?=
 =?us-ascii?Q?UbNefx7LjgkzS3EI4x5wMLHN2+eyJRmmJsZBXFEAjAQ7u0/NZOWdx49rsINl?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bce5b6b4-d6c5-462b-f8d5-08dc28a3ec68
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 12:46:09.1839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yl7+6HZwWhxBt4RgYRVLpoa9jaRLwrC1Mj92F8JNj4sw7TzpUzu1t7gMaPqkfYmkwm5qF/p0BIqxlIbqjUZxAsbv15Gf6EOxdwkHMoF4PQc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5261
X-OriginatorOrg: intel.com
Cc: Yannick Vignon <yannick.vignon@nxp.com>, netdev@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: Simplify mtl IRQ
	status checking
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

On Thu, Feb 08, 2024 at 11:35:25AM +0100, Kurt Kanzenbach wrote:
> Commit 8a7cb245cf28 ("net: stmmac: Do not enable RX FIFO overflow
> interrupts") disabled the RX FIFO overflow interrupts. However, it left the
> status variable around, but never checks it.
> 
> As stmmac_host_mtl_irq_status() returns only 0 now, the code can be
> simplified.
> 
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 04d817dc5899..10ce2f272b62 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -6036,10 +6036,8 @@ static void stmmac_common_interrupt(struct stmmac_priv *priv)
>  				priv->tx_path_in_lpi_mode = false;
>  		}
>  
> -		for (queue = 0; queue < queues_count; queue++) {
> -			status = stmmac_host_mtl_irq_status(priv, priv->hw,
> -							    queue);
> -		}
> +		for (queue = 0; queue < queues_count; queue++)
> +			stmmac_host_mtl_irq_status(priv, priv->hw, queue);

Hey Kurt,

looks to me that all of the current callbacks just return 0 so why not
make them return void instead?

>  
>  		/* PCS link status */
>  		if (priv->hw->pcs &&
> 
> ---
> base-commit: 006e89649fa913e285b931f1b8dfd6485d153ca7
> change-id: 20240208-stmmac_irq-57682fa778c9
> 
> Best regards,
> -- 
> Kurt Kanzenbach <kurt@linutronix.de>
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
