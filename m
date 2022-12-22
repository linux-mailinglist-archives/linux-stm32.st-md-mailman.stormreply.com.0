Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6BF65BC90
	for <lists+linux-stm32@lfdr.de>; Tue,  3 Jan 2023 09:57:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B78EC69062;
	Tue,  3 Jan 2023 08:57:51 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 717D7C6334A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Dec 2022 20:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671739479; x=1703275479;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2q6FBTjWkLO39oTeagsXJdhWGEtB4Lz7zPluFifDe+M=;
 b=CRxPOoALUegdR4/+m403QfTTM3OWaP2C3WVH00PevHyGIAYykZwhWJms
 QcVlZglFlWZHnBvUhmHlP7+UwaO4qiPYdU36U6tTRF/7Lh7XOS+QclBDo
 9XLlPP971/Elo3CWJT1/H7I9rvtRL3/Wy7VGYwW6HrIFWAhsjyotIxNeB
 xbEnDaeSYrNfI+eT3sTQaJh9IKa0F8SccP1+DOfgKxeJPEIEV6k0idWao
 258/hfxjeiBCeaXifRVUfgzfDG6odokV0HeRc4ThtDGMkxdFVnneouC2Z
 YCPgtAKN/PZXTUXlyOVCevnigJ4+dxc7wUlLIAPF93cbnd7R4tK+HANWQ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="303674249"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="303674249"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2022 12:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="720432649"
X-IronPort-AV: E=Sophos;i="5.96,266,1665471600"; d="scan'208";a="720432649"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP; 22 Dec 2022 12:04:13 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 22 Dec 2022 12:04:12 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 22 Dec 2022 12:04:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 22 Dec 2022 12:04:12 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 22 Dec 2022 12:04:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3WSxswFDNz4unPwJSyC14oNisKtEOkmEvTrmEmgBbNUrR4d0kHJx7L+QzQ4fOyxjyrhiRos1+t9T7mrAHy5yaxxfUX/BLy0gRZneYKT+/87XEU5yUNPb2CaafJKhuxKPEIfrX/1cYzjYNMGSHhOr9nzKfAdSp6I+KDJkPXhdMTMOgVPrF7F+U1FMkOTgoZmGUWSnklTm70B8LWAH2w1c86fFE6OWXwRILqz8zmzD2te8V/PenhrAgRWjR1rQftz9g8pR0zSDvztxQcKRpr0BIBTzpQAECbuJHeVl5rJ3M2UPGz/GDKaAS82sj2nohwyuFCT6xyXQO5d2wKjgEHNag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSAXeNJR/kQ1nq6WhLOqvBSythGpoIlpQubitdJFuaM=;
 b=imoe4Yw0JLC2bQ/tg/FEaAY3zeHFdqOHqsxKOaHhisRnCIDp8j4c2cLdsnhePVsZKqPVJIddkvVREmMxSawmCs5c01kIvfALDIDLeMvdBPsP3XhBnxpc5a2CYmdxNgcRI40FcS5EEH969UjY9DIEummxdMwR4sbVjesF1Vb1WHKaIw/dJoS781R0ddoQK6qFfN7fpbKkulqrurcyjqeB95iNW3QpFJ045DlW3PWGdVvAXfMlFoFICMp/922cfHA+M9i/3F7zr6mHHcFoVDKm/568WOSSw7MsjFpAVGyOZDYPw4UPn1bto1el6ac4ziIXdEqaUmHOVyQMqojrdkaMmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR1101MB2227.namprd11.prod.outlook.com
 (2603:10b6:405:51::14) by CH0PR11MB5218.namprd11.prod.outlook.com
 (2603:10b6:610:e1::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 20:04:10 +0000
Received: from BN6PR1101MB2227.namprd11.prod.outlook.com
 ([fe80::5d3a:5bc9:4e57:622e]) by BN6PR1101MB2227.namprd11.prod.outlook.com
 ([fe80::5d3a:5bc9:4e57:622e%7]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 20:04:10 +0000
Date: Thu, 22 Dec 2022 21:04:11 +0100
From: Piotr Raczynski <piotr.raczynski@intel.com>
To: Clark Wang <xiaoning.wang@nxp.com>
Message-ID: <Y6S4O2tgf6ntc/vG@nimitz>
References: <20221221080144.2549125-1-xiaoning.wang@nxp.com>
 <20221221080144.2549125-3-xiaoning.wang@nxp.com>
Content-Disposition: inline
In-Reply-To: <20221221080144.2549125-3-xiaoning.wang@nxp.com>
X-ClientProxiedBy: CH2PR11CA0023.namprd11.prod.outlook.com
 (2603:10b6:610:54::33) To BN6PR1101MB2227.namprd11.prod.outlook.com
 (2603:10b6:405:51::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR1101MB2227:EE_|CH0PR11MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 93780171-d9e7-4d3b-8907-08dae457b0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4gmxC5Mb+rY0/Rulq2HF3E5TdAtORxFcvw2uRV6JP9J+RZbCyvkNzuU2HydS8fA+DXsPQAkgLTeiRKlNYVWTch0BBzDbTl7jROFEVUJxg61Zs+jU1byxaj1VJ5SX3Rh4TxjKxCTjXlHK0YvGdIVSksoTmIcMkmnYE/Hj5CfDiQ/r73ILNr374o67cdT0/q4n1muijOz5vnEq82cuCUNW8tlMUkxqh86MZeeioztafxrVmsm0oA0KLKNoTKNxT7Lmxfyn5REGSV8hT8dX67zQ+AxD01XwAlMzfxIPwf6s/KcXwtM8YpibG04E8X7JyLxbXVXSECvFdbCnr6L5DOb4xjfsZ7dzVl5xHrPmJd2j4Ysm62EwHw+ZS0B02P4U3or7dan+HsrWiLqOE7V8roEzQRFZMxGdWyqE/ypAzhiEG2oWD5h0sVbMXsx49sFytkCzMnG/VfESYgSG8IcwwNwzKYqHMIq5Dtbu2t/yTZL+YND+NTsjsjiilsDujlHFhn3Wrkpobf1aMavHDhruC2Fvn6QyPvFtEPVTF0eAyOVbYVIgqHeMK/hCSBiBfVQCs8ged0o3EZgFDPeKHyUQF1EsR4Rq8FYKy88II3qU0qxKUQML68Da6ZzYppMZKv2e4Ya8o6Gj51eQt9TBYCEsZov3iQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR1101MB2227.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(346002)(39860400002)(376002)(396003)(136003)(451199015)(2906002)(44832011)(5660300002)(7416002)(6916009)(316002)(8936002)(8676002)(4326008)(41300700001)(66946007)(66556008)(66476007)(6506007)(33716001)(478600001)(6486002)(86362001)(9686003)(6512007)(186003)(26005)(82960400001)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NKv0a07p5uuZz6cFpUaSGcpu6u17m5Sve7XEM5ybVHXsgU4BQ2O4AnM4Y9qH?=
 =?us-ascii?Q?UMKu23eR4W/abjtv7urSQeViLdQHT8+txDSwdD1dGS0LAjVBchT0qJK//h01?=
 =?us-ascii?Q?37KHLIqYimhLRQ+xH1puxP1hbhsJLRftQyc0rgZ5zJfDMiSm/PbB7FpPHFn6?=
 =?us-ascii?Q?PyRP34PczLfK0aWtOCCbY9pWsu/0wKkxDnvPym9VT2p2sBWq2RzrkB0/t5Ou?=
 =?us-ascii?Q?ijOTTQp1lUBVmwmDk2W9Fj1yPxi6u2JeSpJJL/zTb5Ii3VoJzzzCvJyRK2+4?=
 =?us-ascii?Q?BclO2/iqvEW7LmzPE/F8AiCoNjozhmB/6/u2AiEhJyO5DHAJMa/1Gi8JR3FV?=
 =?us-ascii?Q?8mYDLLJzVsJ7X87NpZ8dDrxravAUkD8os93r3urSoS9oWhqSl68p9ak0bcvi?=
 =?us-ascii?Q?gBdFX4aaACPBzWhg4i5WQxqC+oi20i1xxoZgaSX+zLP91Ruvt0isAslSG8r0?=
 =?us-ascii?Q?KZZZS+SWzPOoyZ6l7hk64i0mE5D0VGnugmC38Bhjltl2Yj0W4zNOMu0F5b0L?=
 =?us-ascii?Q?FL0ZsujBff0Vr2nVod5GKag1i/KTKfuj0H81vvihIb/2c6oHtyLrXuEtCWbs?=
 =?us-ascii?Q?1IaGU427iITDHrX2Bgjd7qQN0EmUw5PQGupHa0SUYytq7SjMJIsIZE+Iw7N0?=
 =?us-ascii?Q?DeV9ySZ8nZjRQkZNOLz/z/AsdVfn8C383OiLXNDyocDgW/1YLv/XsRcffUUS?=
 =?us-ascii?Q?/+ZJOlQDCE4pwFL7zU10umQLvl7+tOJK3AvsobMnOfmvDHdTzObdSe2f0rQi?=
 =?us-ascii?Q?RqxHErBtILXJhASb/0EsGtG5DzF9LFiTc9GL5GN/WrdXCAFsBZ8oMd1pytxg?=
 =?us-ascii?Q?1ZFazQchLr63GLaPoSae7zpSWAyVSjKBtI2p/JhEyQXkW0sGXoQKCmfhF6uX?=
 =?us-ascii?Q?g2I3CVSGi6/7itakFGe6iSUdo2X8yOyB1czx+ie81+q2a4UzbzsqT1bWJCXa?=
 =?us-ascii?Q?0I6nTN0a5NhDEV//35n9xMp9RMRIP/NCv3fEkjr/nT/hYkHu6Wy743SXoPle?=
 =?us-ascii?Q?PlN+GpUeJufi+YdpEU9BC2dwldiUjrp0L7jhueMXIjUqjCAm41bTxq+ZZR1i?=
 =?us-ascii?Q?WkGg/7Ph9PZvhTIBdRf6JQE1BoUnNAu+GQT83L2v2E/0fdL4hU+wZZMzzsMn?=
 =?us-ascii?Q?JRbSxp5NBidEhd6VZd4+Jz4jiZODPjPV0LjzwJSkORewcZ/oFSK5QdekHI0m?=
 =?us-ascii?Q?mQ+MCP2zvcPKDh/pRhuq82njC0ChDUTNPlgUdJSXv4banoJqyCF82UenQldS?=
 =?us-ascii?Q?5VktoSLcR3n7YXbcQqkPkS/A9heYbYePvrnLooyYay04fAVUMxOg0uNFuJLt?=
 =?us-ascii?Q?YorT6x30tBs0hyN6eXw2K1jFgv8+uh6EdJctU4O4Odr7n+cvCGP755SH2X3q?=
 =?us-ascii?Q?eAcgyrXRWZeuowemdIHEDVqbooVIndvA8QnoOpi3Qe0WaSLOSOUfXFSb8aUa?=
 =?us-ascii?Q?OfEBni+gkPEblHyDZQxsrE8auss70EJuDyQOiUNv5XMOJp067AoEYrJDlXBm?=
 =?us-ascii?Q?woDnbh9etzlgZVR5Lqz2vYbZLLkURdZTnbmxLLKe51j0hF5vWKZR+RO+Kqcn?=
 =?us-ascii?Q?U+jVHB+QEgkPCgzejoATccQl+51PSoOsFkZYSp4jXGMsPdnREyvPjbutazZz?=
 =?us-ascii?Q?cQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93780171-d9e7-4d3b-8907-08dae457b0bc
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1101MB2227.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 20:04:10.6811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXXi3vWlHUteII2Ua11y1EYv8djVqVQHgwT3dc56p/tHG0NF9a0vuXZH5i07V7au9hGEpOFUAQert7UIUpBj3IC98oUbFphESnAQlE8qAwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 03 Jan 2023 08:57:47 +0000
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 edumazet@google.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, peppe.cavallaro@st.com, pabeni@redhat.com,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH 2/2] net: stmmac: resume phy separately
 before calling stmmac_hw_setup()
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

On Wed, Dec 21, 2022 at 04:01:44PM +0800, Clark Wang wrote:
> On some platforms, mac cannot work after resumed from the suspend with WoL
> enabled.
> 
> We found the stmmac_hw_setup() when system resumes will called after the
> stmmac_mac_link_up(). So the correct values set in stmmac_mac_link_up()
> are overwritten by stmmac_core_init() in phylink_resume().
> 
> So call the new added function in phylink to resume phy fristly.
							  first.
> Then can call the stmmac_hw_setup() before calling phy_resume().

It'd be nice to add Fixes tag with appropriate commit id.
Other than that looks fine.

Reviewed-by: Piotr Raczynski <piotr.raczynski@intel.com>

> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c    | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index c6951c976f5d..d0bdc9b6dbe8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7532,16 +7532,9 @@ int stmmac_resume(struct device *dev)
>  	}
>  
>  	rtnl_lock();
> -	if (device_may_wakeup(priv->device) && priv->plat->pmt) {
> -		phylink_resume(priv->phylink);
> -	} else {
> -		phylink_resume(priv->phylink);
> -		if (device_may_wakeup(priv->device))
> -			phylink_speed_up(priv->phylink);
> -	}
> -	rtnl_unlock();
>  
> -	rtnl_lock();
> +	phylink_phy_resume(priv->phylink);
> +
>  	mutex_lock(&priv->lock);
>  
>  	stmmac_reset_queues_param(priv);
> @@ -7559,6 +7552,11 @@ int stmmac_resume(struct device *dev)
>  	stmmac_enable_all_dma_irq(priv);
>  
>  	mutex_unlock(&priv->lock);
> +
> +	phylink_resume(priv->phylink);
> +	if (device_may_wakeup(priv->device) && !priv->plat->pmt)
> +		phylink_speed_up(priv->phylink);
> +
>  	rtnl_unlock();
>  
>  	netif_device_attach(ndev);
> -- 
> 2.34.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
