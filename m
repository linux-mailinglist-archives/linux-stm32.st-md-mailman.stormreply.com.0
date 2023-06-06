Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA70724A21
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Jun 2023 19:23:49 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C72A1C65E70;
	Tue,  6 Jun 2023 17:23:48 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 96954C06F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Jun 2023 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686072226; x=1717608226;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0i7JN5nJ2byqV+SV8FNdN37JclVACaPSssFZl85yeLQ=;
 b=Nq74TPXYpl7hGQM/QocknqUFU/SbOHp7m83wAm0e0wc9HLj1A/d9L7EQ
 NmeRuOjwmGb1RrX1NBl5KGMvly2uRKjPpyrEkgV89wqt6/LCFPp9fMexL
 GhzxuAr3vwe3+79QiVdt17XMwLBmG1ujid5F71RYa8dUTCzTEk4pZRV31
 K/9AzgC1IktGn4/va6wHIWQ2+WFaj0d9FzxJwGIxSxUMXba68dhyttwgx
 RTnkt4CpG2vdddlc3Wr4r+u7XBSsELPFfxtgZooQxtZsZJhqeR0xwUh2x
 0dLLKpcxmyEW06z88N1Rja5bHASFk2S3dhuG8McalE1QkPIJxh3qvuY0F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="359202237"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="359202237"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 10:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="853526457"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="853526457"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 06 Jun 2023 10:20:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 10:20:29 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 10:20:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 10:20:29 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 10:20:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqTn0BF5tQRFHn3zrUGntq8P7UXFpbwbRYklpxNyjfmnCmsv8OHjo9O+VKaSIkWQUlFamlUTSDgKmRaVKW2KRfzk6oGIWu6syOYIXaahH5uSrObG5S0iuoDLaS8jm6D886cRiahwslxBWzzuKvqV3kCk3OLQFyuP2FdmFF7/iQvQMowuegyEuVUXXMC/X+nhMhz55TKHNcB8b32QrCpI9EWowvdVkAiOvr0aZMBaVB1Zn8wEzqThltqaXrsXSyDZNDjYRDhVFAvOm0EYidiV3SQ2+m8+cyNeXCOHZRyojVjEWgrXnuLp9FmA59TERLFUcHJZYHR8PvZfHbp1BUqF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjKjnFT6Sj0OtOy0S4XDTM4tybDAM6TUQMN0fxNdBjg=;
 b=JJUWRc0zVOPSemlLyNVPWNdS1nBFB6Wg4NVcZJcu6xDxGOCC9wfECbyHRjqNMxC0J6f4MakGeTga0NvyAkHuXQZ2sHb/tyTHL4NUQpXqgKRqwtZtlC2DwSgkEeGlSQHYxnl+9IaTc59+QMoBf+1zm2AhTEqqjBRJZnz+eXGu0iN63vFp6c9BHxyuQETfyYiMW5QutDyPkqDeKjwzqDer54pF4YwQ3j+yVrsZhNPCFAoUppP06DZH27NKv2SnXkXMTHbR+/4sawoZ5atK+kCgpNubl7niKu94jJUWH/WjvB28fH63H+8zY59JTH6CFo9cNwXxJcTGiT16BimWkxdDRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) by
 DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.33; Tue, 6 Jun 2023 17:20:27 +0000
Received: from DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::9e4f:80cc:e0aa:6809]) by DM4PR11MB6117.namprd11.prod.outlook.com
 ([fe80::9e4f:80cc:e0aa:6809%2]) with mapi id 15.20.6477.016; Tue, 6 Jun 2023
 17:20:27 +0000
Date: Tue, 6 Jun 2023 19:20:18 +0200
From: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Message-ID: <ZH9q0t7u2rJT48LT@boxer>
References: <20230606152501.328789-1-maxime.chevallier@bootlin.com>
 <20230606152501.328789-5-maxime.chevallier@bootlin.com>
Content-Disposition: inline
In-Reply-To: <20230606152501.328789-5-maxime.chevallier@bootlin.com>
X-ClientProxiedBy: FR0P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::13) To DM4PR11MB6117.namprd11.prod.outlook.com
 (2603:10b6:8:b3::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6117:EE_|DS0PR11MB6519:EE_
X-MS-Office365-Filtering-Correlation-Id: c1f5f7b5-fdf7-49db-537d-08db66b2522b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: irD7jE2UtsKShKPKUZtvHkU7Bzz4+zW9dE9/A51OW0AcZ/SH272hTqoDkA1oYpNlep0IMtxu2EvjKukWu2LJ5HhnMk6D4padR7a5H+caEeQ7NIdWcEVxhVDcHkyrCTTQhJM0ifQkwfX1hcPF2qaWuX1KqJa8oNCWFKUSx06y48iz5WAw/OJDIgjFkdgAPdNNmfue4glrLl3Hg5ZXYn+Ae2QBwgeKoqFFsFq9JcZPy3S5A36ZXRYkPm74lJgIkhj2ulhQpDCJcm+Fz+xk0u3pJ2Wxw8ghqmluL4ayAJSkSNWO1CMArrjO1vZHiW4Fo9UOdC37E8XJK/FUFvuEWGTJvZ2tkOZ7GwAn0EU02HzW8+1VXFUCAWvBhT+dRXyC1qXAAOrdYibsvRI1eeP0w4typPyzq4dKVEHp3+H9rMqRx4q50/7TP3SenvEVbtIEH4w1Ju6lXnVSlMC/jUw71wzQEOv24xCarkKt9FTwOp77j5JrFKlBLYx5fUmJOwxm1Uzqg1JZOPix2tAkcFYwED1UZV/MAPMLqam7trvE55RtlPF7aeizkHKP82zqjpUWImSd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6117.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199021)(44832011)(8676002)(8936002)(7416002)(66946007)(316002)(2906002)(5660300002)(4326008)(66556008)(6916009)(54906003)(41300700001)(6486002)(66476007)(6666004)(6506007)(9686003)(6512007)(26005)(186003)(33716001)(478600001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5B1QcoyM4W1dC3yLmC/ptSUMjq0JcslZdOC48pr4dOYyf7dVP2r3DJb8CHfE?=
 =?us-ascii?Q?JJ/E7YipvatGO8kVd6TwG1j3hmGVIv5mH3GtzK5SEPcMHhbzi3KU6VEDq0PM?=
 =?us-ascii?Q?pMOoKT/Qj/fdJNj9bkjqmN+HMtGQeDA0iooOgIzlyURz7wEguaag3NfcvALY?=
 =?us-ascii?Q?qRUkTu21q1tolhe84tu4Gs+hdUAnEJUv+ZhpHPMtp0GBgJMmJ9GORVWg01lD?=
 =?us-ascii?Q?YGbQSEPPNEqG1SOF8qYVsSS7J8w8U9CcIRonsU26Q/w9RjczdHE+GldQa60n?=
 =?us-ascii?Q?2/Tf0GjQ/6NWnf+Xe36xwJdNTdNXfCC4b+hNh23cg5QAwV+ImT9oV1s7LnQk?=
 =?us-ascii?Q?VE/lvxptkZhLmhKO7KroeUzBU7vEFGzmG0AFv/tg+zdaNBSCGJGcavOu7Lvk?=
 =?us-ascii?Q?EdvEvTHxHnHBC4APViMHUcKwyA2wGUUy1Fgy7SOlJIS3CVynLhBzgscPdjAW?=
 =?us-ascii?Q?2eT/dXJ1xdDHPMuSo+bhFMEFSSU6hw5j2dN6Ero5BIgf0wl6GQrzk2VoVOUW?=
 =?us-ascii?Q?NtUQXCyCxUhyJ3py+W/hV46tinAlNLlYOUlywB+ZXRHTBwQjC36JbYwz+lg2?=
 =?us-ascii?Q?2gsc+xq+/A6o8MqpGLAGepaMux5djh3GCTp+SU9a3UdwtenFEiY5932q9Ys2?=
 =?us-ascii?Q?+YiyzADQ2mv2J0/inXhs9qJ2yRUI3j3amU/ClThh1EmT9bX9NppNGT1Jxhmc?=
 =?us-ascii?Q?751Xqw6JBu7U2K7edPbiAp7QfbLzgCgBTy47qX7+Whikcom1AhaYBCSsgzvw?=
 =?us-ascii?Q?S+Dk4Iq+u0qCq81r2C2cnNY/Yp7WAWGdjvJiZMJT/pVcL74HQGuGWU+Mhm6j?=
 =?us-ascii?Q?fbcZLp3iDqu/pYGG4l7BaQEvUrNcsQEIwv34zzLNXDYKU+8H9dedNLmsWrXs?=
 =?us-ascii?Q?nilZMbwRJXnltnAaY1SuiwuZ427na2YJScH7Mo6etwTrUDes8+YRX4TLMmTy?=
 =?us-ascii?Q?Yrzf8qk/2MhMSZJ5peuBuWEcqQCZlw/1+YXGJEGj9LnIgzbAnX+Oyg8m4rnT?=
 =?us-ascii?Q?UGuh/fDtg5vhM5qmCEEnW2JHtk8EL9StyNInnoPAdxSjtEVutTXbtq1CHxsi?=
 =?us-ascii?Q?hJCrSkitBUsdB2hIBEvcuN74WunTjJi1p5yC2a19WsyH4CaOsZHxy4VmvwyJ?=
 =?us-ascii?Q?C2gilXuhvdk3eqFozXgLkRCnnx6lBF6MnyslfXAV5C1YzylW69/xNYShOMEx?=
 =?us-ascii?Q?pWd1wSvCAeWmM6+LFksCSaJqbkC66z8oRWmB0fZQJjZuOlCNGpFjN4omY4vl?=
 =?us-ascii?Q?cez28kZ/giTlO3r1IZcHL/xCKqf4cyLx/e3ILLkIiglEmd3efObOJ0hQV/EM?=
 =?us-ascii?Q?WOrsNGMWerCwg0lha3iwK1pcPaahdoYH7wIfNiBiZIL69VgZECL4jS3seMny?=
 =?us-ascii?Q?MNqVQrtErIN4vpRXPJBbrzYojZUcc70FjH+OMlWbFfuXUWgpA1qDixcbl02N?=
 =?us-ascii?Q?g4K9s2lygA1uTsf5EnmxXEmVYG7JISEZL3NwGw4a3XpBlnKeYylVzanAlc+6?=
 =?us-ascii?Q?4643n1AhE16+HRQjhlFyt5CoQOJsx6VPfuel3lN+03mQwesUhNizU6EDGE74?=
 =?us-ascii?Q?siSlVv2jngTMpEySrsch2/x+5ISpoM9iDttqqedQ7D6N5j24RRE2kHdJ7t2o?=
 =?us-ascii?Q?H/Mnb+kC3gpisAsfRqw7YYE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f5f7b5-fdf7-49db-537d-08db66b2522b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6117.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 17:20:27.3682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+dpSIhcMPKurD5fXHrNeQjAkwFzW+i+iESXUhqZkLctOQPt42EYu1QI1mTbZLocF8U8O8nJljOid9lddrMDZZVLAesMoFBMZvuxzU+IxBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6519
X-OriginatorOrg: intel.com
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Eric Dumazet <edumazet@google.com>, thomas.petazzoni@bootlin.com,
 Ioana Ciornei <ioana.ciornei@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Simon Horman <simon.horman@corigine.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Russell
 King <rmk+kernel@armlinux.org.uk>, alexis.lothore@bootlin.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 davem@davemloft.net, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v3 4/5] net: altera_tse:
 explicitly disable autoscan on the regmap-mdio bus
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

On Tue, Jun 06, 2023 at 05:25:00PM +0200, Maxime Chevallier wrote:
> Set the .autoscan flag to false on the regmap-mdio bus, to avoid using a
> random uninitialized value. We don't want autoscan in this case as the
> mdio device is a PCS and not a PHY.
> 
> Fixes: db48abbaa18e ("net: ethernet: altera-tse: Convert to mdio-regmap and use PCS Lynx")
> Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V2->V3 : New patch
> 
>  drivers/net/ethernet/altera/altera_tse_main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
> index df509abcd378..b0cb94fe6247 100644
> --- a/drivers/net/ethernet/altera/altera_tse_main.c
> +++ b/drivers/net/ethernet/altera/altera_tse_main.c
> @@ -1287,6 +1287,7 @@ static int altera_tse_probe(struct platform_device *pdev)
>  	mrc.regmap = pcs_regmap;
>  	mrc.parent = &pdev->dev;
>  	mrc.valid_addr = 0x0;
> +	mrc.autoscan = false;

ah so there was uninited value on mrc :) can you please zero this out in
one of the patches?

>  
>  	/* Rx IRQ */
>  	priv->rx_irq = platform_get_irq_byname(pdev, "rx_irq");
> -- 
> 2.40.1
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
