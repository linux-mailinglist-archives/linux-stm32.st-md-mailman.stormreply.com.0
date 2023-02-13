Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 797F26977EF
	for <lists+linux-stm32@lfdr.de>; Wed, 15 Feb 2023 09:18:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3BB10C6B44C;
	Wed, 15 Feb 2023 08:18:44 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D859C69065
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Feb 2023 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676299171; x=1707835171;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TomyJCu1eTfLPEvMiUWU90fu+gfz6tSAMoNVchIJW2E=;
 b=RYI+aB4azlDTYN9K1qX9Tl68TovLgnrgs1epuB4gNgJ7nkUOaWB2OQCE
 kt0RNztWk8vYCUd1I5JwyA1eI9gMJ8THL9Qjnu0w/50eTze/4uz6fRvYV
 +KaoV+eB23bEqyfBrY49jFYaImx3DG9R1Bs06PV4gmR6dpzPJFnjjTtoW
 c445O3uemg3ZniMqtwL+lOFJKV8WbpyTu/E1PFrAsmd4gotv6Vdlsm5RA
 dJn9frrBnf6X2ju9noIr979N02rZ7bXjucrc71HrH43+wTT2Nc/nB0CbA
 zXsBdO6vmegeU0eUqFNfxiaComueeb69xLB9ltemSpbDjSmNYx2cL4K/Z Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393300151"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="393300151"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 06:39:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="618667646"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="618667646"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 13 Feb 2023 06:39:28 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 06:39:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 06:39:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 06:39:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 06:39:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4kTH3h7VjiSIByyipMnbRcnuFquCW9FrmHtL8Pjl+FfAyDNhppA8ntlqpYH4ECLFgzF29YGVobkicbkBl7f4aCzal0TxZVtCMUv27yL+fI4zpC2hNYH3K4McMDxIAQLXsgkw3rNRS7gnzk6KxNE7k7dHcjSffbgqObUHwzYosAtKz+0rvw3l8+BG+hlN5oIm1gzu1FdBwVokgpZcrCqsv3p/T1gKh9Tw6KCu4g4xHvQcvIuUdpq0ffSFkXdn+Epe1CsCBm9i99gFi2EKZSZnAi8lsrOe3w9VBd/spQN5Itdk1ZTSHcQUkToYZ9gII6gIZlZIE+S+dXk5DaRz6fVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R5A13++sM8kHwkzp1M+yTi412fHAUsd3uiTMpUoKJv0=;
 b=ltjqyzbQ9uPoIUq0ZSAr1Ur8slxNGzS0VJc2Tcr9+kuMUrhz3Okpn7cTethrHOfzRjZmAW5NxJyEQ6LBFPswivSHoPCa9HkUgiEqvH1aglARHY1Lz16b3yO1y6N2Jp3TI8BDM//ZKJgBz24F5naD2Gj1IqPBYjOzduJbXQk7KD8xcPXJ89rtwcDhtByga62I35qaeuVJ2RpKDyPFudNfSFQNVJLCUzacfluz7ZlAAKn++HvDbTNdUX7LGHuyLFNmuI/suun1ZLqFGE01PZG62ZQ0AwRSQU1eVcQAHN+k56lFAxD53RGUJ5XJ/EL1qdnSLDcbLPkhRp4zNQ3DCD/IQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5471.namprd11.prod.outlook.com (2603:10b6:5:39d::10)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 14:39:25 +0000
Received: from DM4PR11MB5471.namprd11.prod.outlook.com
 ([fe80::b7b7:8e90:2dcd:b8e9]) by DM4PR11MB5471.namprd11.prod.outlook.com
 ([fe80::b7b7:8e90:2dcd:b8e9%8]) with mapi id 15.20.6086.023; Mon, 13 Feb 2023
 14:39:24 +0000
Date: Mon, 13 Feb 2023 15:21:27 +0100
From: Larysa Zaremba <larysa.zaremba@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <Y+pHZ75Ynp5xkgQy@lincoln>
References: <20230211112431.214252-1-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20230211112431.214252-1-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: FR3P281CA0176.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::11) To DM4PR11MB5471.namprd11.prod.outlook.com
 (2603:10b6:5:39d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5471:EE_|CH0PR11MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: f8be2916-cb8a-498c-4159-08db0dd01a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pVysFzYHkS8aaRfMsqxFUHoMS20iG9h0Rn5fUkgOEdXPUcRpkVKanj/bam3XzKv7r/8RYGceuxOpqYL2eh40H8YDh7iYKrLEc64j4j0HrnTzj9gGuDNKXQnKJNMv9EsQthj/Cc7MBPaiWatkQp58FDR+tJ57BoFZ7oBgeqF5fKZn+6HXRxZSBUBRDzyut/zeUP3tYQ5J5WoHGt4/Ap06ekVteO94U++cgV/h+4Sz3r2PVHV08CCruOy9UeXzgf/75EFjIug8zDBJGYaBbY9LZ40yX91fEwHo1dbeNA6ORQC2G0gmouhVN4C8dC6l9CGF/DtXFLji0bLzG9e3xByVi9NPVIIjTJQRFTFGwNnVqQOzx6l8c6ppgHwL0dCqdphrimkv0JIwM58YRzpwDZxeYNHaF5VqZ67uecOlkQYdH1WBzg2Ypz38o4M+unxpNUWjd0rqo+65NF/w2K2ym2wzXRfQ7lDcpJtYoNy0f4bu9vQ+7l/NrMSDRlqrRWcP8EBWxYk0daPACIoZxcoCPi+FXuXD+NS45smJC439hWmc2oPfO3ZKTwvO2HOQz4iRsppQ/AUIPSGQYx4AszZus8NVD1IbgObW6JQV3NMI+zz4g7B9I8FL3+tV8DWqBFssDCC+Vs1Dd4SkU5Zv/N85MDf4m3hmdP2/phuJCUq3dUjNeePMIsjDhm/qKK4J97Oty7bK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5471.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(7916004)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199018)(33716001)(86362001)(66574015)(66476007)(8676002)(66946007)(66556008)(6916009)(4326008)(83380400001)(316002)(54906003)(6506007)(9686003)(26005)(186003)(6512007)(6486002)(478600001)(82960400001)(44832011)(38100700002)(8936002)(41300700001)(2906002)(5660300002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VkixoKQ1k54jF0HQ5+zqiIHa77NvEnR36s6mpxo42nphDWkVTWlf4RQEAF?=
 =?iso-8859-1?Q?GL475f8weo7c37CX8440N9WJD3ppxvb3ssltaMH6RKz/EiOX91DafxKBdq?=
 =?iso-8859-1?Q?rSf44Vjtz1+OkIbBreLw63g2QwfEKvtOUXF+u6IydM0Pq8Kk9tz6MFWhk0?=
 =?iso-8859-1?Q?vDQqiRzIFpl3hEIa16V9wukXl5FMyxgvRc+g5nHlKlOzlEKm0XJN2VF5Nq?=
 =?iso-8859-1?Q?OPx1FQpMlqkl6zOgGQe30EYfZ+Jb0eCDAuOkQ4Rzh5sE74P8/lgkQkPP3R?=
 =?iso-8859-1?Q?xyopqp+5ukjq96o3mTg3xNTfAfbX2Tei8MJsG7kVmmem9Be+/bXcjOJWQi?=
 =?iso-8859-1?Q?WhoUCUyOg8QXbfMNj8IDe9HVBDi+8zhBkyoSW7112AHvknjIYBKxfqNhSZ?=
 =?iso-8859-1?Q?v3Scz/Owk7QehI0PV7ei7jitVZrtupFb8+qbBQIKZF6PUXKjhZrK0VrRbk?=
 =?iso-8859-1?Q?3WXc0U0NyfxD3mhC8vUSkFuWRfjgJI3yave8ugXWsI3aHASwIcSuBnv8Oy?=
 =?iso-8859-1?Q?XI95j7zbDgBjZdi22umsMcFVAouiMHcePdUcktET7/HMCnEGjZrC4RJSk1?=
 =?iso-8859-1?Q?0Ir1Kl45+Pp1jFZogaLbK2XNxD13V6dg5f3djwEd886PTyzlbTDBvdjscT?=
 =?iso-8859-1?Q?5Oy6mqaZyR/Oka/1VBR14L8Fueye3C4gVtZptsVJOmMnRaYlmANdk2h/Je?=
 =?iso-8859-1?Q?IfDH77FeT95YyEhcGQOxufCEai1GVMzwQtlwbnEFWcMAB0hS94gOguxn6v?=
 =?iso-8859-1?Q?YWVflMCerhOySMynhnSa3vtNC15NYBqgpj2EgU2Mv1sl7ZqpsMKyTxwPYj?=
 =?iso-8859-1?Q?Zx3wMK2U+ug+hqc9rpqBf6CVytt0Mh579xCtYXCT9KPwfhTtGlu1q6BWQT?=
 =?iso-8859-1?Q?K0MEktfOfuoRNYJGrvDFdR70tBaap0ehUCIxbJGLaVoiH2aPPxv4ZXPlNZ?=
 =?iso-8859-1?Q?jbIB2nvw5OkUaM4bUmeuf02+i1FePwzU793hjVDQLgxPtBTiiFr+jJVCNA?=
 =?iso-8859-1?Q?HhKtk/6XudQ1vfhOREJ5LrvruEeo63FSPfwXSRrDuc2Kr0YMLWp9eE23+v?=
 =?iso-8859-1?Q?BhGndUk6OXwfNHl4T6EGCoW51CTNoOjrsCT3E1la/nvJg8k9S9MNsV+AYn?=
 =?iso-8859-1?Q?1vAEb9KUrsaxFXFLPcVK1kFaS5WBMMuvMmmt+HkKcjanIEQW21A0iy+joB?=
 =?iso-8859-1?Q?Os0OJweFQyYoFhapaHVqAI44HLdgAWv64cDqmKMT7h3g2HKYTlzwZKs6lz?=
 =?iso-8859-1?Q?chS9rYnfleKXLOr3La6DMWhHcUWrtASQ4Mh+OQz11oSjkwZzKXMJM7CKCk?=
 =?iso-8859-1?Q?ypST/5gDmEZlRkjepXBTsRbRkznHZzUH7tsKs5vmbHyjs0ZwsfNRKxegwA?=
 =?iso-8859-1?Q?XI6PiuAB/MJAWtZi5He+/C5wKWulG23bT0/JM8odXp2/d9M34YOpmHhAtC?=
 =?iso-8859-1?Q?ooIe+IjMDg3GRoW5d5F1Prs3qUBGjiNPbBuocJ0oXNU2TuBpIHtOy19FbH?=
 =?iso-8859-1?Q?5YPKsBcURT+ULH6Pn9BqrDdC7brraFETQD463e2KAwMqPvFzF+ZMIUBL6q?=
 =?iso-8859-1?Q?fAn5WoAqVrQtJpraIE3AJYQM4Z6eL3UoXMLUxAC8Iu1TtIyDVJdaHAY5Au?=
 =?iso-8859-1?Q?fq3bCV5FgIJQoVCMSyjWraySbc6O3wiQEwTLYp+Lbolt99YJwB9lcXZw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8be2916-cb8a-498c-4159-08db0dd01a2f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5471.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:39:24.8282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PCHEb3e2LRbWC6dJl1xN5NbBRFMi+2O+HD5sffC5ONvAhh8OLYkzNTnqe0lobJNtbe+AmWU6ou8L51T6egshfVthDHlJpBU++fFJyf+6eAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Wed, 15 Feb 2023 08:18:40 +0000
Cc: netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 kernel@pengutronix.de, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/2] net: stmmac: Make stmmac_dvr_remove()
	return void
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

On Sat, Feb 11, 2023 at 12:24:30PM +0100, Uwe Kleine-K=F6nig wrote:
> The function returns zero unconditionally. Change it to return void inste=
ad
> which simplifies some callers as error handing becomes unnecessary.
> =

> This also makes it more obvious that most platform remove callbacks always
> return zero.

Code in both patches looks OK.
Please, specify, which tree this patch should be in (net or net-next).
This is rather a code improvement than a fix, so net-next would be appropri=
ate.

Also, multiple patches usually require a cover letter. The code changes are =

trivial, so maybe the best solution would be to just to squash those patche=
s =

together.

> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 4 +---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c          | 5 +++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c         | 5 +++--
>  drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c       | 5 +++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h            | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c       | 4 +---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 5 +++--
>  7 files changed, 15 insertions(+), 15 deletions(-)
> =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/dr=
ivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> index 80efdeeb0b59..87a2c1a18638 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> @@ -477,9 +477,7 @@ static int dwc_eth_dwmac_remove(struct platform_devic=
e *pdev)
>  =

>  	data =3D device_get_match_data(&pdev->dev);
>  =

> -	err =3D stmmac_dvr_remove(&pdev->dev);
> -	if (err < 0)
> -		dev_err(&pdev->dev, "failed to remove platform: %d\n", err);
> +	stmmac_dvr_remove(&pdev->dev);
>  =

>  	err =3D data->remove(pdev);
>  	if (err < 0)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac-rk.c
> index 6656d76b6766..4b8fd11563e4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1915,11 +1915,12 @@ static int rk_gmac_probe(struct platform_device *=
pdev)
>  static int rk_gmac_remove(struct platform_device *pdev)
>  {
>  	struct rk_priv_data *bsp_priv =3D get_stmmac_bsp_priv(&pdev->dev);
> -	int ret =3D stmmac_dvr_remove(&pdev->dev);
> +
> +	stmmac_dvr_remove(&pdev->dev);
>  =

>  	rk_gmac_powerdown(bsp_priv);
>  =

> -	return ret;
> +	return 0;
>  }
>  =

>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/ne=
t/ethernet/stmicro/stmmac/dwmac-sti.c
> index 710d7435733e..be3b1ebc06ab 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
> @@ -371,11 +371,12 @@ static int sti_dwmac_probe(struct platform_device *=
pdev)
>  static int sti_dwmac_remove(struct platform_device *pdev)
>  {
>  	struct sti_dwmac *dwmac =3D get_stmmac_bsp_priv(&pdev->dev);
> -	int ret =3D stmmac_dvr_remove(&pdev->dev);
> +
> +	stmmac_dvr_remove(&pdev->dev);
>  =

>  	clk_disable_unprepare(dwmac->clk);
>  =

> -	return ret;
> +	return 0;
>  }
>  =

>  #ifdef CONFIG_PM_SLEEP
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index 2b38a499a404..0616b3a04ff3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> @@ -421,9 +421,10 @@ static int stm32_dwmac_remove(struct platform_device=
 *pdev)
>  {
>  	struct net_device *ndev =3D platform_get_drvdata(pdev);
>  	struct stmmac_priv *priv =3D netdev_priv(ndev);
> -	int ret =3D stmmac_dvr_remove(&pdev->dev);
>  	struct stm32_dwmac *dwmac =3D priv->plat->bsp_priv;
>  =

> +	stmmac_dvr_remove(&pdev->dev);
> +
>  	stm32_dwmac_clk_disable(priv->plat->bsp_priv);
>  =

>  	if (dwmac->irq_pwr_wakeup >=3D 0) {
> @@ -431,7 +432,7 @@ static int stm32_dwmac_remove(struct platform_device =
*pdev)
>  		device_init_wakeup(&pdev->dev, false);
>  	}
>  =

> -	return ret;
> +	return 0;
>  }
>  =

>  static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/e=
thernet/stmicro/stmmac/stmmac.h
> index bdbf86cb102a..3d15e1e92e18 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -345,7 +345,7 @@ int stmmac_xdp_open(struct net_device *dev);
>  void stmmac_xdp_release(struct net_device *dev);
>  int stmmac_resume(struct device *dev);
>  int stmmac_suspend(struct device *dev);
> -int stmmac_dvr_remove(struct device *dev);
> +void stmmac_dvr_remove(struct device *dev);
>  int stmmac_dvr_probe(struct device *device,
>  		     struct plat_stmmacenet_data *plat_dat,
>  		     struct stmmac_resources *res);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index c6951c976f5d..97bcfb628463 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7341,7 +7341,7 @@ EXPORT_SYMBOL_GPL(stmmac_dvr_probe);
>   * Description: this function resets the TX/RX processes, disables the M=
AC RX/TX
>   * changes the link status, releases the DMA descriptor rings.
>   */
> -int stmmac_dvr_remove(struct device *dev)
> +void stmmac_dvr_remove(struct device *dev)
>  {
>  	struct net_device *ndev =3D dev_get_drvdata(dev);
>  	struct stmmac_priv *priv =3D netdev_priv(ndev);
> @@ -7377,8 +7377,6 @@ int stmmac_dvr_remove(struct device *dev)
>  =

>  	pm_runtime_disable(dev);
>  	pm_runtime_put_noidle(dev);
> -
> -	return 0;
>  }
>  EXPORT_SYMBOL_GPL(stmmac_dvr_remove);
>  =

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/driv=
ers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index eb6d9cd8e93f..5429531ae7c7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -711,14 +711,15 @@ int stmmac_pltfr_remove(struct platform_device *pde=
v)
>  	struct net_device *ndev =3D platform_get_drvdata(pdev);
>  	struct stmmac_priv *priv =3D netdev_priv(ndev);
>  	struct plat_stmmacenet_data *plat =3D priv->plat;
> -	int ret =3D stmmac_dvr_remove(&pdev->dev);
> +
> +	stmmac_dvr_remove(&pdev->dev);
>  =

>  	if (plat->exit)
>  		plat->exit(pdev, plat->bsp_priv);
>  =

>  	stmmac_remove_config_dt(pdev, plat);
>  =

> -	return ret;
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(stmmac_pltfr_remove);
>  =

> =

> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> -- =

> 2.39.0
> =

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
