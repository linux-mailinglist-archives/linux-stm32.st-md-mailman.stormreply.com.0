Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D174A6B8D0A
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Mar 2023 09:21:02 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 764F2C65E60;
	Tue, 14 Mar 2023 08:21:02 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 734A5C035BB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Mar 2023 08:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678782060; x=1710318060;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kX31h7EHbiLIDJtzvHxpAirdAJ/Ju37hr9saytdnvBU=;
 b=dYAdqJMuuHFn2vANCq2a0JGxUjcj7/4F1jypBXz4DKDWfhkPcKyLYXzE
 rMXAt1t0WcvQdVmW5UGRvFVivLCpCfX+vwr56sO35r0UA4QqiIc1gWyEy
 Dx5+zn12P+UAERNfU8kWcCRVzGm6DKGC21GErUbrbqUo+8YIam2s82Br/
 qnApVcSzDE0t/iBaK1iPds0JZ4xCrNu1qyhs7opHK31svPMlozCOQO87Y
 wD32kfwt8W+QLyH1upV91PUc6IIkaf5nCQqYLtz5jOoDUn98k9zHKWLao
 GD5p32Yw+wG2gSoLxQbaQDzVfhZKDbP6P9elJMTCG4JKF65XbjrxQO2SO A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="338904954"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="338904954"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 01:20:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="768005002"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="768005002"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Mar 2023 01:20:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 01:20:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 01:20:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 01:20:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 01:20:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=INr900SwvhNDxMxVouSK7YQ4nlsPHiFSNePAhjDud2LgGMYWClUZSnCBY8rGuHpTZR/S9pRnLl9dtkP68S/Vuf5eckYfw1ro4YVtjiinQ8eSekUem0S1psxcpsg5LoqXyio98Mv+aZcU5DwwjS/soipwb3x69ZecCwuc/fZ4puE5XSinUywagdE5BM4CDROXppxrNWQGyCBNMsah1hGz/gVpC5yS4m6YjliVcxc9zAoMu/UW0IWiJXXaZjssY9Z0wDGxIlMLXLe06sxq2z2lDHTURxicBB+nlxJy2ON1cvEnMLhm08veIgIF82m5jdCoUrdFgfTIWwkAiN+ZJVUoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=362/n6/aC1/ZpigwqkP5lGSQo6iVCOhAOJZyZfIeXyI=;
 b=ERKSxJ3Ghyw1+Rny8Krv+2L6Ev0bmKGD0mbPm+IhVLEsC3Ly9YaY9A+aYGQQFwHRe5yv0evaHmbOEdHqhixgALYCSGh9RjbiX/4FHQ8WvSX5PMXia8WIXM87597D2IBMojt/t5bB+pKVdoe/ohgU0yi6POunHtR+3BFEHb3+8aAa/RNU5mTYiCKNb4MOKvTzS9J8+TXXDoTTgw5+j3EOVHje0hyfga7tctDecFA6aiTna0TQGzrrROA5LdWDD2FR0lMDqzlI+N+eqo5JIKq/6SD1DywDgJ7LAnq+jtTjonhFALx/Hl44Vk7erU2+gL98fDp7WNusA9X1TDNI6y1IkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13)
 by CH0PR11MB5345.namprd11.prod.outlook.com (2603:10b6:610:b8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 08:20:54 +0000
Received: from PH0PR11MB7471.namprd11.prod.outlook.com
 ([fe80::37bf:fa82:8a21:a056]) by PH0PR11MB7471.namprd11.prod.outlook.com
 ([fe80::37bf:fa82:8a21:a056%2]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 08:20:54 +0000
Date: Tue, 14 Mar 2023 09:20:42 +0100
From: Piotr Raczynski <piotr.raczynski@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Message-ID: <ZBAuWk9lnGjeuvKC@nimitz>
References: <20230313224237.28757-1-Sergey.Semin@baikalelectronics.ru>
 <20230313224237.28757-14-Sergey.Semin@baikalelectronics.ru>
Content-Disposition: inline
In-Reply-To: <20230313224237.28757-14-Sergey.Semin@baikalelectronics.ru>
X-ClientProxiedBy: LO4P123CA0645.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::16) To PH0PR11MB7471.namprd11.prod.outlook.com
 (2603:10b6:510:28a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7471:EE_|CH0PR11MB5345:EE_
X-MS-Office365-Filtering-Correlation-Id: 3926236a-d598-4351-73d1-08db246507c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZrWt7NMDYJa8Q2Qd2jRz8fB4eW+sznnEl7DvU95BnIc7hjhr9F126hBkO3cTEHJeLN+rbzX1hOlf9jVbqIP54oamYUehD/Wy7kEjcRuNQ5Ol1PxuNn8jk7TEXour+ier2RqNGzTORra07+BbyXsmgtev2/CkZCZll/vc/UvFlMKy7iuiW1gVqKqPROfSQOIpK/d8gXiHBhz29OXc28LSADtE2RbM7bTLf1BvROF/0ZjDXmDzEGIk9G8LuFEHQTEwV5teu7euATFYRRPMa3QrUQDCpm2SeuQOCKZpoZwEL+/dWErTN4tnHwElSPNkjFK2zq8xUq87RwF3NrTTWnRQ1NpGEmGPwTeFT6bg5fjCVm1hCSfKUhyEltes9dEhAiRmiGA806l9s5rSKR+b6/gg0gLRQr6gWuUpstaim/x4hlfRs5JLk/zDbnhSTxxnNev6foXyIfoUA2ySqBsjoKyG3UrLJdcRgkZX1RvGup1tDrw66cznSoP2zXqJfB9s6f+aqgvL1ejt9Y3chJaZiE8++JlEddKcD9SzwpH9kTkaiEEhbR0bx894iYoery5MK214e2aK2iQNvR4NwbDelKfQHox8wfRsGtYTSUn7KAR/A2o5ceCCZ/ERJhdiBoK0Wv+RW2FA6TVqNFx5qdr3iwbRJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7471.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199018)(316002)(54906003)(478600001)(6486002)(7416002)(5660300002)(2906002)(8936002)(44832011)(66556008)(66476007)(66946007)(6916009)(4326008)(8676002)(41300700001)(6666004)(82960400001)(86362001)(38100700002)(186003)(33716001)(9686003)(26005)(6512007)(6506007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fcEPFjxYvPiUrW7UnE7Q0suGhI5X1FbV7iALsjlxUk5reAoKBgZCCCnDQtwK?=
 =?us-ascii?Q?wSiei0BDnpVQ/X+KNd6cbXzDhjKdrTgC6nWmJ0/iAD5DWaViVdOPY+jJPaYw?=
 =?us-ascii?Q?BtZCJIBWgx6hMUMSPPp2wofsrLzlyZIuUzmBqsSNdigIGWwA32lrxNNEiIC8?=
 =?us-ascii?Q?xaetEiTWjzWMIC0z0hE8aeQ6W5E3oKn5vdmGjT/gE7k4GtzGGSxzxIJ/SCz+?=
 =?us-ascii?Q?nKfzuAVEeDQVphQWnD6KWvcqoTAFQ5X8IybvdwLQruJxPjEWTPABigizWnBi?=
 =?us-ascii?Q?OpsC9bpuo1bjWJkmVc5LDC66V95c7ehIyy+LVrVsnmpuDlHX+hHjSVZzv9HC?=
 =?us-ascii?Q?kLEzJCr8P9ImB7Izl10q7nTkDZLiaTKqBsoY2ulq5yrJdY1oe8jqwtU69zA6?=
 =?us-ascii?Q?XgM4PZPkpz+4vTcvU2/6uoV1HU8ion+k+FvfAE/RUnNuJPYgx+gmfB88NVbm?=
 =?us-ascii?Q?4K0nuoSgZ8Prz6paJmoL+k2c569UUEwqMBpib8K5YI1f9ZZK2uDSkQUJZUMD?=
 =?us-ascii?Q?ibXnwPsC6HcZG4Rz3FQBtNnzOj13Nqn+sy7QhDeV9ez2jQJoh97SGXWfQre/?=
 =?us-ascii?Q?G7RbrUo+LLcD/rfmLe1fyxqIbGNvzYZ1StrHQ/D0a1wAHlKXwyAqSYVkB9pX?=
 =?us-ascii?Q?5RLC7loQPd9275OEibYZ5mORyWLl6YoXQ8I9m1VNgm1by6Yt+jkP2vSfgkUZ?=
 =?us-ascii?Q?MRpXLW2A2JPctHSDS1ojvhTvInI7j9ps6++fWEtS+t6BQ4DeEYEfQefbvRei?=
 =?us-ascii?Q?hD+wcKoSSxja97184a/TEMQTghfSkueknGNhjAaRSu/ZNDpAvG8ZbKXFcXbI?=
 =?us-ascii?Q?nfcyAe/y3xevu5dD6lc3YP/kv7yBuOc8Sn1QPOvQuIzNI3FbKgQY4fIA0ynA?=
 =?us-ascii?Q?4Jh+v8XkfnPqd7BihAo3uItuzrlHgvxu7KQ6gmFVDihJHWeLYHL4oF8zYjKZ?=
 =?us-ascii?Q?egquvNBnLohiAQGpXMnWgTkPc7YHtTB129448t+wkRRubpwzFxJAYcOUdfjG?=
 =?us-ascii?Q?m7L9fY25bUYx1wxkER9Ilt/8w4CKudordU2eCJFqnNRoS1Cq2KEmSG2s8YFH?=
 =?us-ascii?Q?cTiemQJUfCrE+Vrkn6AiuURFX8t3ffyXTXTMbMCk45N9bHkS04p75YsG4U7T?=
 =?us-ascii?Q?3+6dTcDwKra22aNpYIlJITX3rHNIwoOjKPhVAy6vSnhxaAHQZE+hTNmB/Hpn?=
 =?us-ascii?Q?/NMkvTixnUhTLKNjHyeqbwe73N5xk9U7Ryn5QZFb35dKcvRYTOy+Zpq98v7Q?=
 =?us-ascii?Q?r2x4Hl/xwxWOWVzmx8eVQi30ygVeFDiIrtVFsy+CPvB++dikfwAoTzztky+K?=
 =?us-ascii?Q?OnwCZwvafB5iOr1pzxhXoueqjwySUOlocYLI6AKJGvmrZ2Z1+EBxu2y8SFcK?=
 =?us-ascii?Q?w74CDISTzdQMDT3V9Tfmcc2Gl+k/F/EhXEWs99IS/kOUSC+hhPqPK/AaEbxy?=
 =?us-ascii?Q?u8qoyUlcMkUeLCG6jQ4AtVcJDGa9jWNmJlfJn/b6oYD0UgcL3ejU1MTuBks5?=
 =?us-ascii?Q?LSMv3+ppT6qO4t9yjAVgMR3Zt+cbrKoeAWMDXXfDI0DnE9GY6uaW+JTcyg+H?=
 =?us-ascii?Q?1U7m+LsnaeWke3oUZKcrbnQC7hKf4Sc5tWuyt1DSFw/JKNefqKZWHqyDlQ45?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3926236a-d598-4351-73d1-08db246507c3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7471.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 08:20:54.5478 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0efHE1Co6iblDjDPAYs1dIJJ+GdDt1bxbkIz+LzjpeJSTpyblRv1oqDJv2rU9dgB+r2O/9fYmrCAfy+qutRvKT+u8hn3EXhx5PmSFEG+05Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5345
X-OriginatorOrg: intel.com
Cc: Andrew Lunn <andrew@lunn.ch>, Qing Zhang <zhangqing@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Eric Dumazet <edumazet@google.com>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com, Russell King <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, Yang Yingliang <yangyingliang@huawei.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Christian Marangi <ansuelsmth@gmail.com>, Biao Huang <biao.huang@mediatek.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net 13/13] net: dwmac-loongson: Perceive
 zero IRQ as invalid
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

On Tue, Mar 14, 2023 at 01:42:37AM +0300, Serge Semin wrote:
> Linux kernel defines zero IRQ number as invalid in case if IRQ couldn't be
> mapped. Fix that for Loongson PCI MAC specific IRQs request procedure.
> 

Looks a little odd but as I also checked and kernel does seem to treat
zero as mapping failure instead of -WHATEVER.

Fix looks fine.

Reviewed-by: Piotr Raczynski <piotr.raczynski@intel.com>

> Fixes: 30bba69d7db4 ("stmmac: pci: Add dwmac support for Loongson")
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> index a25c187d3185..907bdfcc07e9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
> @@ -127,20 +127,20 @@ static int loongson_dwmac_probe(struct pci_dev *pdev, const struct pci_device_id
>  	res.addr = pcim_iomap_table(pdev)[0];
>  
>  	res.irq = of_irq_get_byname(np, "macirq");
> -	if (res.irq < 0) {
> +	if (res.irq <= 0) {
>  		dev_err(&pdev->dev, "IRQ macirq not found\n");
>  		ret = -ENODEV;
>  		goto err_disable_msi;
>  	}
>  
>  	res.wol_irq = of_irq_get_byname(np, "eth_wake_irq");
> -	if (res.wol_irq < 0) {
> +	if (res.wol_irq <= 0) {
>  		dev_info(&pdev->dev, "IRQ eth_wake_irq not found, using macirq\n");
>  		res.wol_irq = res.irq;
>  	}
>  
>  	res.lpi_irq = of_irq_get_byname(np, "eth_lpi");
> -	if (res.lpi_irq < 0) {
> +	if (res.lpi_irq <= 0) {
>  		dev_err(&pdev->dev, "IRQ eth_lpi not found\n");
>  		ret = -ENODEV;
>  		goto err_disable_msi;
> -- 
> 2.39.2
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
