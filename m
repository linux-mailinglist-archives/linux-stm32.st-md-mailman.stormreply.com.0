Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B66A59692
	for <lists+linux-stm32@lfdr.de>; Mon, 10 Mar 2025 14:43:26 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 20CDCC78F97;
	Mon, 10 Mar 2025 13:43:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7D6C2C7802E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 10 Mar 2025 13:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741614205; x=1773150205;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xFhhZi3d057iC3S7Vm8ag5NDJ9S7hMpaSK8HIW8jUcI=;
 b=g3/NrfWHngqeWbjlU1E9OdjYq2ZuVbxbQum6i2+/MBIWsUVLZPMLQfrr
 q752gzocvrTTQ/jQLDxA1/wLUPvYsIqtdIIEtsEsGtrvxldNIwk9svKNj
 hsZbWiRyZ/fU8rU+7gsfLBCtX2cRxySJuUL5skfK9A5BUmCwOL82hZn4+
 8Sg657ngRuSPRh9NBhYWHAVj0VmN+e14Rrqh2D8cT6g5G9zcib7CAtX3n
 Be8UB6crbABHcXFsAUtKsbkXyKOaLeq6qy2Hiyu9ZVhXXcnMBu+O1INfX
 ay6svyPFw10cjtSsuhig6n73Sv4hTizIOXjHkPJ3lINUnjyAUmREQIkQt g==;
X-CSE-ConnectionGUID: fXufqo20RnyCvBtjj8m0KA==
X-CSE-MsgGUID: 3HivwXedR0ez5MjqFFVqnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="60159006"
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="60159006"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 06:43:22 -0700
X-CSE-ConnectionGUID: eRJ/g0q5Q4aFXs/1A/Zk+w==
X-CSE-MsgGUID: KZA3uYnUQay7aVkxwpXdOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,236,1736841600"; d="scan'208";a="157199335"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 06:43:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 06:43:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 06:43:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 06:43:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BuKua69m759q6xUAufIVgQG5oPH1ZR5hPvkvs19rHmkDo714VGw8a1iRfVP2H8jtVNdZD1hVCOuRt4y7ZyTmEb0Tp8yJ3bzRG8KvIP0r0g3KGAXl9Z7j327T8k0VvcCOrz9WtAJLjYVhmpK4+yTQ2kKbBq0znk3eUNJ5jEAznBTbzJhVdQ1glwJEw+OzMitrIQfBiCY1c8Qsy86Y3s9kfQGw8mDv2p6hefdBB6LtGvuP8rrk1Xzzu+NcJyCBUaOY1d8IfbMh6QUYQTEopMemNIjld79gS1Gf1NxrzLxOQiaBngjSppDgTLUDQiFqU4zkyA2OrUnEL1NJiRUnedy2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7oU7o6+ucZQ/I1gmGdjpyYcBr+AEX2cGpBtjwRsVKqs=;
 b=YBznrVXDaLoyz+Ki3tb/XdGnZ3SifelgmEfIUQ7QBS205MSTf5CDyRaDV1ri3xzTVDm5J0ek8+j5PsYyRQtWuJ7K73eLVQMrntthQvaXGNczr/HdRqgJGj06G+jyWFzO9FOFYi7+B24poF/dZwKxReTxuMtYvf+edH2lZeBmxxPyQxaQMNJTisfGEciJPHi+TxIrv91uxJQ/NcG1m/WWeX6LWD4TnXxS1L2qUhXBy1uEsTovepitlW8IkICwJZ1puq2eTo/5IllrLrHoj9fdCQLS7yKrbGIoVTcV6OkU+jLXCLmohJypLHx+aOmOu+AEkBZF60vsdPqqMO/SXGH7Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8665.namprd11.prod.outlook.com (2603:10b6:8:1b8::6) by
 SN7PR11MB7018.namprd11.prod.outlook.com (2603:10b6:806:2ad::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 13:42:50 +0000
Received: from DS0PR11MB8665.namprd11.prod.outlook.com
 ([fe80::8e7e:4f8:f7e4:3955]) by DS0PR11MB8665.namprd11.prod.outlook.com
 ([fe80::8e7e:4f8:f7e4:3955%4]) with mapi id 15.20.8511.026; Mon, 10 Mar 2025
 13:42:50 +0000
Date: Mon, 10 Mar 2025 14:42:37 +0100
From: Michal Kubiak <michal.kubiak@intel.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <Z87sTf8ZzMIpjXEw@localhost.localdomain>
References: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
Content-Disposition: inline
In-Reply-To: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
X-ClientProxiedBy: MI2P293CA0014.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::13) To DS0PR11MB8665.namprd11.prod.outlook.com
 (2603:10b6:8:1b8::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8665:EE_|SN7PR11MB7018:EE_
X-MS-Office365-Filtering-Correlation-Id: 6999b34e-ae5d-401f-2d05-08dd5fd97345
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lq+mIsSC7D3lWy9aHuGbzMWDD/yIRJes8iRx9D/QFAuR2zEA8jKsAvvJYjj6?=
 =?us-ascii?Q?0dpXkhn5MS00bLSpR/+s2hryEpcrqeyIrcCY+EEH9lTwpcJJAJVvJtW3aXlS?=
 =?us-ascii?Q?pfuvruGnwrsBejJsEqh+YeMUKOOSFgfvgNJxy41bouOXmqq0WCpfQQftrrSa?=
 =?us-ascii?Q?MyOALA1FPktYUwSo7THBhlRMLHj+3ABlFsFwro8UaG6a7rkCt1XHGQziFzyr?=
 =?us-ascii?Q?NZgkBzVN7rmtaPzaJMcNXAPDwc6IeWGGL+IhRagelykFo2X1dNaf91/hZrfd?=
 =?us-ascii?Q?+0cjTk9VEb69L5scd8e4LMq5ucU0pK0CJuDrQOm5tk09kMjleWnkppRRhwcQ?=
 =?us-ascii?Q?kAOf7dsz3VPEcERHXotW88HnPBtANvl9pnoJ4+8tRLTXi09jS/sNqctGa9JK?=
 =?us-ascii?Q?O03U8UT5l1ywb6VvNcraZswhXgWHl3vZ6rl8rAvp9suE74l2U52ZoOUKaOnw?=
 =?us-ascii?Q?o2CSP/ePwUzB3nEyCZJTPJVZNr5E+9vNo/+n/E223TfVLwmDYAazQb5iy0yB?=
 =?us-ascii?Q?gHRPoaMfXDBlaTs6nBjKMT4T9RZmc6BuhhCsJBrhpoblfCxllLVeRnSQJ40r?=
 =?us-ascii?Q?HiYUdH764HZJXJrr+gYZV3KBEuXf64Pr32wFMxtpvfboMavLXaervrTcxYt0?=
 =?us-ascii?Q?wbdNahvChYD9jbnUl2P2pt/n3KLnipv2ZPkRBKANz7QlIQZIhn18NJTdX/PA?=
 =?us-ascii?Q?a9qxwpw9RcqV+kwLOBp21wrea9kWfXoYc/1IrUWQd6uqPM+GM3Q+6uc/ZIVM?=
 =?us-ascii?Q?mtrcXC3A7AQIFdRQ9GQIIPvZcDhC6SuiC3rLg0dndDNVi5dwF4QynOIRUfSl?=
 =?us-ascii?Q?Ve3MZOBfdrfrh5UvScBY9YJ8RY5448dYYDX9uPRiOB3Pqk2acei6chRajGTF?=
 =?us-ascii?Q?odo5YRv2iWFBEicfKWq8mwFlyNyDXU6FiekJ+awenKTrPbKOIPDn7XgG7iR1?=
 =?us-ascii?Q?aSXSiDCLdbQQpZafqqqMeUH8FVpxH92BcC1U6lEtpq3bUxcPtYErGnDPJZmY?=
 =?us-ascii?Q?nZnPeSEcJCqHfHN8HiluPyV0VtP4K7yAnjOSDOtVZ/e+4y/YKjV1z8YBXe7O?=
 =?us-ascii?Q?D2uAfwVx/owYW/1SCSWZyFArcsAWS5KkqT7LxKIDeHmB4SBNLgMjfMYVzKzW?=
 =?us-ascii?Q?mg02fdIMZ/5GLgzy5y3XV8yc8ZAm08DorToQ+o2jVkbElIeM7WYkpJJWwGOX?=
 =?us-ascii?Q?5LPFmneD4Wi9luwU0/IDpgYD8tcBUw/FEiLi2LDXKCrHkpPaBGwDtl7UMPtO?=
 =?us-ascii?Q?kWzbmvT3m7h38PYYczeUCHCT5PzbcMgpsiOvZS5TrZcHGjFA0eJWn0gwhz2Y?=
 =?us-ascii?Q?6cbsDnCOJk1WA4R+1Ue5RjKg/Lp2qyxtk9DbnV8CRAM3LrG0KmpTktH7f51f?=
 =?us-ascii?Q?xFPJxRS37tWMbMyb1S396z0QB521?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8665.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tm+GYb5W/Al/s3L1EXLkF6CFF+613siYRf3s8wwHp3hrYNbFA6euKCSGDuC4?=
 =?us-ascii?Q?uAm9Db9K8SKYVAEd+JHaip+Z4O7jcYpNMZBD+Z3Tk5UuWN/8lbc/rJMO+p1k?=
 =?us-ascii?Q?GhxRyT/Q/QH9jzC6lrwSEI3NzKVXKF7TOiXkIgDmWlkWdCv4UHuFDrGkM0OM?=
 =?us-ascii?Q?T2J1wQZGW42usCS033ir5Z2W2qw+WjnrRFN/9e316NhEbUWPN3PHRh9QAguz?=
 =?us-ascii?Q?EXeII7PDJ55gacfi0GUHP2lb27ZhE3abkRqQL83nRolBAMKIMsW9sRuA69B/?=
 =?us-ascii?Q?TI9IqakL4ejQ4fdqsAb41oAyG21mg9NpxkLTUfgE9kvMWCLP3i6/YEAS4Lqp?=
 =?us-ascii?Q?cG/Uy/aken/y1mW1fsaEFi3TWfBcflrCH0BEMVHY18JVqReNtDFPyXCPqRgB?=
 =?us-ascii?Q?rudL3KROAWhCQKBEqMUYdHGFy9E7p5CrzDAsU2YTt6jOJEbrDP3whpu51W4H?=
 =?us-ascii?Q?yCt8/gxWJr4PJAeD5LrZsMsqrjb5xt/UKqTpirz9VcBWfJMN2K1ZYQ5OcQnf?=
 =?us-ascii?Q?mpIUn/qsu9YnrHPQWfjQXAj3H1PBNVaoDVOukHsnepyRKQrIH60qBkOIe8Qp?=
 =?us-ascii?Q?/fnaMqKCR7GdfzFObrnpIG2aJ9d9AtKF15e33aovGN615CtA77SX5WQRa9bw?=
 =?us-ascii?Q?fhEDOPbIBuoVZeyHseN//wawITx+jmJekPpYyIBod1UCuRsgKrhgcJkqcIRO?=
 =?us-ascii?Q?K81gnq+yibKFdVxGogvaULaNvjUXjxOBDEJpFvpnG9HOHZ9mCmWajBQVj+oK?=
 =?us-ascii?Q?LYv54gGqWCEYidVjP0L1bsOEH8+jqdy+6uMdJR9jPg+RZ+UKkTVlQoUQaAj6?=
 =?us-ascii?Q?Y623nL1Wbr/lj8AKaQ5gwJ7bGUapx+SrvGwT20Jy4IMdlHqUdddJ4NCpPote?=
 =?us-ascii?Q?JqxsxLSi7dJ7ieMn8LbgA3lNnODhCdKWYQFBYKdyCRUeZv935w5eJbUbq8qN?=
 =?us-ascii?Q?gg0Jki244gpGelVCIOGO0yUhMLtAf2O88PYwm0PleBJ9euO+BPU6mt+CDG+k?=
 =?us-ascii?Q?/wH0vJLERQDUF18U5kiAVR2/J7GAP58XyW95gauSLvM8oZoU8NZ5kdyYvEUS?=
 =?us-ascii?Q?y4S/kIW2O9GWyUj5364wKqFq8fB62vzKwdB010GWCKoZcbyrSdjjC0eRZbqG?=
 =?us-ascii?Q?0CoWQywnZOxIgvnjLamFyjY/HnBC0RioJlz7kbH0hkyAiJiszfAzGPHr9zo0?=
 =?us-ascii?Q?oVK8riqrhH7s8MRnEKt7hQGy5MSGKQ3RV494D16EY4feXJkvQVv8B6Ju+ZIE?=
 =?us-ascii?Q?lxK4rdja5wBUQK4jkV8tUxOu6ChRsJcPSeiXnbYNCeXGIz17iySPh5REkl+u?=
 =?us-ascii?Q?4QAqoV38vwIhudoxNK1hJTvXwLTyQmHB1mIaSp6ThHwDf/cfV2XLaB7bGBuJ?=
 =?us-ascii?Q?76HrRmCvgX6iBTQjRXa+XtMdleuJdf786s5Fc29vCjhTqbqt6kTQlYl/EEz+?=
 =?us-ascii?Q?W8gCbYJ0ukPhKpIfsvAnLU902v2YhcS+MkcxAUpnmii8nlIx/g6QiFxKAT0X?=
 =?us-ascii?Q?oyJ+1/vy5+3788jb4c8tcQ6AkYCGVJtft3wbRwpkWOaOLxFkX0Q5HhHRApl/?=
 =?us-ascii?Q?e8b7N7kEqJB+uL2pypXqwVmpPtFRtpoOVSVNhsi+0QZS8CRNZX74ta5pdNNh?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6999b34e-ae5d-401f-2d05-08dd5fd97345
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8665.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 13:42:50.4561 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHwGYexLAKde3deIVsfhEiGM1MxnzFNwu/QMQZf41U3FQ2vOvU1/uoIRFvQ58+ZXmlzaT6Pgh6uWbpF9IrPrUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7018
X-OriginatorOrg: intel.com
Cc: Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/9] net: stmmac: remove
 unnecessary of_get_phy_mode() calls
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

On Mon, Mar 10, 2025 at 12:08:54PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This series removes unnecessary of_get_phy_mode() calls from the stmmac
> glue drivers. stmmac_probe_config_dt() / devm_stmmac_probe_config_dt()
> already gets the interface mode using device_get_phy_mode() and stores
> it in plat_dat->phy_interface.
> 
> Therefore, glue drivers using of_get_phy_mode() are just duplicating
> the work that has already been done.
> 
> This series adjusts the glue drivers to remove their usage of
> of_get_phy_mode().
> 

The series looks reasonable.

Thanks,
Michal

For the series:
Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
