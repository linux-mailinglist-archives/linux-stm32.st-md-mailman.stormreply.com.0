Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4366FBFB7
	for <lists+linux-stm32@lfdr.de>; Tue,  9 May 2023 08:56:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2E736C6B44A;
	Tue,  9 May 2023 06:56:22 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B1E02C6A5F7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 20:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683577832; x=1715113832;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=YOZ5LYTgLg60jaWbABGzS8hnGyvhDqhb6myZIWYRa80=;
 b=QC5hvA83tLylQxoxkFUjpwFyVOQGt1ZrRvryXwe2CrKE586MpRzsLQS3
 I+/EZec/IQ8m0R9Y8B/PBOzXUZMIHBw4lejaUieqQKvzUgVyUz6sS4aNX
 qpQWYdNhy6xEW8BlXYW15DQvU24fUcQ3xF6vaN44n7qTToS2wSkms5EBi
 d9Yn0v2QO6zR23dW7bD7W0mdu7Gat3H5DtjkgBQaVpSyfSC/egWBB5bX6
 /QA2FT2fMTuzFR8ASDoDgJebxFhY90KITwBgsGC7SB7HNhtWMAt7aEVcw
 xVl5OHu3I/P1WV44ZCv6aeN26UQ3NrRCkFVdoJ5Qrt5L+PKr3eL9/23fz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330110826"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="330110826"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 13:30:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="701556039"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="701556039"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP; 08 May 2023 13:30:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 13:30:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 13:30:29 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 13:30:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVKvpl2W/oDUDJQhGIwBKR6zokiSmyvXce8TQRp1HXgjuk+USjbbKJfpLz+7w/iHTgJ9qQYSD5g46POUDg/oq6EovXx+EyVFpX7ze8j1237j3nh4KYrFYVyFwQ6BaryNvGbjiGodY8bLbkne9rCxutHcTZTuhbnMi57xqnyk9AbCtbTZzjHmP21tNlQsBh1+nlH5r5OkXQdp2QPWPdFr5l/SzNs6+9MwIZ5Fxbfxt7S9L1tx+aOQYZMrhq7IR8UWaEKlnQps4txm7F03uDEIbAy/G3U5aM3kx961y+TihNrsl8l69xQUby3piFNl+2or5Pi8W/NFIgCqnwU0dQ2uiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAi88FZ9tnR29drvssyhG/EwCeBYiOB/z2DYx32U0/U=;
 b=nxcu87oeFi/ugU24gs+QbVjy5BOzmHfp6r2fLuEtVYs62v/j2ceJRgXh6RxP3kkPVrV4xuLkjvnEPnGq0ZJS4mrLNMRW4aF8Qy5XwzQJJW8nFOrjUuOWk8quq6ULO3Wusy1k/bmwggMpMr56dJYBbD1kQYiGDaWkKTO2rcf2zDk8Bh4xlo7bfpTS1vFdE0BYN5iGVNOuMbdEIaBri8Gv6TI7WtMC9ZaeZqK3i6tRlzFbIDYrpF+o3KW1e/dCBKxBRb+JTEoDLfdRiDpb/A+lKN9ZsTeyyFas/Q4jKv9pmpDbM8mHEzuQMSuYGPgyXHKwSBzI7C8dtq1Gv95HwBenuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2937.namprd11.prod.outlook.com (2603:10b6:5:62::13) by
 DM4PR11MB6238.namprd11.prod.outlook.com (2603:10b6:8:a8::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.32; Mon, 8 May 2023 20:30:22 +0000
Received: from DM6PR11MB2937.namprd11.prod.outlook.com
 ([fe80::66f6:544e:665a:9bec]) by DM6PR11MB2937.namprd11.prod.outlook.com
 ([fe80::66f6:544e:665a:9bec%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 20:30:22 +0000
Date: Mon, 8 May 2023 22:30:12 +0200
From: Michal Kubiak <michal.kubiak@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZFlb1PtnmvAEfwc5@localhost.localdomain>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To DM6PR11MB2937.namprd11.prod.outlook.com
 (2603:10b6:5:62::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2937:EE_|DM4PR11MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: 01bb0c0e-a57f-49b3-7017-08db50030c1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0f111XwAUdfmKJ+G4rVAjagSwmuIwoUpPUT2KHWiYSPbp/LwiKsszRDUHE0zvVyU35J8LR+p4H1stDinqO+Ue2Z4Dm3Wnz+aqIcIrSndnlq/0QydHi9eeaT5cnC4r8FVZs8Pr+i2iP2CGr36Y5AUsXIWBBbnNXWc2Ni/baKSN5rguSp+qf3TgRUZhYaRo9aY3rT48L6kuesDUhOahuA3NesIrGXVXWWwLsTFSFwwopNM8rSeNCY5hzBE/9JnoLbjNXvE6fQyLI4zBZzPHZFekP3avEyriFuKZDThWpPBtYVl3lXpVoKfVXS5A1PqIQ/Y0zfehOhfnerqAzpNOWG6ayzuf/h3I4ktYTc2jpZk2P67lPZYDuY6S7cDHCxjRP23j3kLOqbstZPRWoR9mvbM2CjAUlaLQmpPw7EGkJgkj0QCwP+cPFKVQqgIBbkVTPqmqJGL6Q2JJgfuxjAV3zANIxFUgpilb3lTgrBCWStBQw/P6xzDfYI3SnmfkrLs9yQSEUAOb7kdc/uGdn/csSSETsQM8lFkOKKhwSNsrWqCHzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2937.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(366004)(346002)(396003)(39860400002)(451199021)(7416002)(966005)(8936002)(8676002)(26005)(9686003)(6512007)(6506007)(44832011)(7406005)(5660300002)(186003)(316002)(6916009)(54906003)(66476007)(66556008)(66946007)(4326008)(478600001)(6486002)(6666004)(38100700002)(82960400001)(86362001)(41300700001)(83380400001)(2906002)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?BJhpx44iT2XLeiY44tFBRb+QuH1hybzpaldxOr2DAj7Gz4S/1Tq5lIWAS9?=
 =?iso-8859-1?Q?Y/UkBdjUfiWrf+8ukDjUM+iBqyJJK8gxEiwNmbqaM/tydn+YLJATMsy5Di?=
 =?iso-8859-1?Q?YDsowhsM0ZZ4Fgy6J+MBcbmTQutX+uzOtt2F0bUM+HEm3d6lF1hfJBE2RV?=
 =?iso-8859-1?Q?yrx9zR0GuK0GW1WRJrUH0ce+maaeBAcl+NOaofX7wy3p8YzZLJ/vzDAJuZ?=
 =?iso-8859-1?Q?848TogZiRAF/IUqD2dn6jGmoUj7BG5+S45rsc8FP3G5RAT7lsleXvZfBoE?=
 =?iso-8859-1?Q?oRb/kwN1Xrzr1QaKPMRM3dsZHaHQGbT8uwx8Gif05J51uT8orj/yiftH5S?=
 =?iso-8859-1?Q?Es3pobuXmGnOYSHBZQCM0kOqIbTWUBuV8Hc2ibkEhPsrnVmYO54xJqkY5z?=
 =?iso-8859-1?Q?k+FaS0qlIK/NVgZGdGHCRlfHhPPcGkqNHCpJb2w36kXnU4vAuPF/qwzCHQ?=
 =?iso-8859-1?Q?bkOgZyFmbEdhpxbuNJMUUQ8wSk2tHkbbKkY3v1L+h4eBH5NvlxQm0HNPIb?=
 =?iso-8859-1?Q?e5fSi0ZToF0igdM06hC+zTTLL5SGP0Gr9m6iHBkIkdFPJx4wXrjSVpXShr?=
 =?iso-8859-1?Q?IIIkNq7kQyBONV2GFATwSa8Qv7BTbRBgkYFv7v0t38wL+hwM2Ru1x870Vz?=
 =?iso-8859-1?Q?Fn/O5nHe5L0+XQCfjPrjHSkYRSNj6Z7zyg37YHwDhQ4gzSikMtnZXd8/EH?=
 =?iso-8859-1?Q?VdFheCCq2nSTc8kzAfeKhNCENM39L8h9pnGk2hGj+yFfjCa0pXKEIa+hDX?=
 =?iso-8859-1?Q?TE2aAJYIdq0tyqgoTvv4+g+qoy3YwuGYczku+MMXbsLVg4Pd9f/Zz0lyIb?=
 =?iso-8859-1?Q?WY/qdPQ9EtbsCzTGnxP8qseK/2tSLqPMdOmmIoqt/hHlvYKSODnSlyLN9U?=
 =?iso-8859-1?Q?3Sue3sK5HKETzZukbKDr8F4XN0kpY05Nvm8bIfdWn8YUt3B9h+rvLwI6ya?=
 =?iso-8859-1?Q?3psgfCpLRxXMUOe1F639kND10SX+y3aupJNdus6dbD1kyqBWusglUoFW50?=
 =?iso-8859-1?Q?qXI2gMxmf2qDaAWOMQ3vjv6F/4wh/EYPqDs+YCKtj1sDbUa/xEqJEDL7Aa?=
 =?iso-8859-1?Q?6T98+CoguAXBax5KzrvBi+ciVPHJd0Ph6WeOt2TzWpRnZMLvlZ9lPsfh/n?=
 =?iso-8859-1?Q?gkxTdz2mF0a3BmLDnnbzLnzyCPY0vQSsk0D6BNPzWovWGBYttepQNYXJSA?=
 =?iso-8859-1?Q?biX94gluBYbMxy0RQvDDlNtAxN8SI2e1lwBcooS5GT+dGl/Fwr0yFEMHYp?=
 =?iso-8859-1?Q?9lYrhgMDX3GHLg9v0lLww322+DzQz94eYQEfrtLW/YvgjUkwByD/SUIFPE?=
 =?iso-8859-1?Q?/n6j0X7vUiJsi0BKbxbCt3ZV4VsMdmqLLmD69pnqNToWpVSXR6oa7TEp92?=
 =?iso-8859-1?Q?/s+YhLo/3p1/M96qwLB5LfHzh7OHmPZXiAYGwx1voHkp4jKAmF/64oavR5?=
 =?iso-8859-1?Q?+cH6rYRr19mUQufUKamBEn3wOpvZdvS/KCEeO+WFVULGuZq5/z0khvnOUi?=
 =?iso-8859-1?Q?r96BF2uUsOcOKA2HtLFZb1MbuNDDDAjVna8+kDOjMOKjhDqQL7Y9QvzNib?=
 =?iso-8859-1?Q?OgRopHIya86Fcho8ACHOgMjmQZ4AyhJ8Ids9IWG+KwZpfJouMat5tqORC5?=
 =?iso-8859-1?Q?DXr+tYDwqGPt5glWc3DEEzjMrYcrSRzpfo/QKivN/bTXMWXeVPZfbpsA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01bb0c0e-a57f-49b3-7017-08db50030c1a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2937.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 20:30:22.4456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3qczG7rgyzbKfUj39NVH1fcs0MrFt6gQv8P0JZpfaS/X4IQE7G/fvUucGe7N3LKzI8F6S8e39IDjW6WWLHcX1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6238
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 09 May 2023 06:56:20 +0000
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-tegra@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-amlogic@lists.infradead.org, Nobuhiro
 Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
 Jose Abreu <joabreu@synopsys.com>, Samin Guo <samin.guo@starfivetech.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-sunxi@lists.linux.dev, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-oxnas@groups.io, Shawn Guo <shawnguo@kernel.org>, "David S.
 Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v2 00/11] net: stmmac: Convert to
 platform remove callback returning void
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, May 08, 2023 at 04:26:26PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> (implicit) v1 of this series is available at
> https://lore.kernel.org/netdev/20230402143025.2524443-1-u.kleine-koenig@p=
engutronix.de
> .
> =

> Changes since then:
> =

>  - Added various Reviewed-by: and Acked-by: tags received for v1
>  - Removed a variable in an earlier patch to make all intermediate steps
>    compilable, spotted by Simon Horman
>  - Rebased to v6.4-rc1 (which needed a slight adaption to cope for
>    4bd3bb7b4526 ("net: stmmac: Add glue layer for StarFive JH7110 SoC"))
> =

> Best regards
> Uwe
> =


For the series:
Reviewed-by: Michal Kubiak <michal.kubiak@intel.com>

(Just a very minor nitpick in the commit message of patch 3).

> -- =

> 2.39.2
> =

> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
