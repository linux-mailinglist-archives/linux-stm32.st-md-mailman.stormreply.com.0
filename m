Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF416FBFB6
	for <lists+linux-stm32@lfdr.de>; Tue,  9 May 2023 08:56:22 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0D059C6B447;
	Tue,  9 May 2023 06:56:22 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95225C65E60
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  8 May 2023 20:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683577617; x=1715113617;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ulHxU7FxH5o/h9aTKOO4hnirfGz3yyVWqvMyeU/ejs4=;
 b=N/+rRx69/lDtbSYZ25gVuVYSczRaqew5bgNZmkS5PrzzNRpcrsZH6rVI
 BDHXZJbHqnPLFxqc2+euZ7Jx8aFuHeOVa3unoZEXt1bNW1GDfwOk/VTCE
 8IfS+h+8fjvx9/uYQ3hikaE5/tXTbIgY7vZjl2lwsu/NC4DF6lFVvBEis
 GNRIWChPwiZyYg04dpLpgKDzPP8KhGNcCLipLNi+zWxp0hBhl6reT3ZJ4
 s3PcZPQkE0jon1+1p7vkEb33z1H6SN4ACB9a952yjRCzH6xwR2QeKi9xF
 S6udA2hddWR/pm9oN+4OW98BC8bbyihM2PtwTCQWU6+0uk+H8sN+RoQ5p Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="377844746"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="377844746"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 13:26:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649021413"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="649021413"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 08 May 2023 13:26:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 13:26:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 13:26:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 13:26:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWeIxOTZM3DCy6cl6e88f0NWIjlTyNQda9X61hNe5S+PutsjwuNHwSBnuwaV5JL8xn/lndiGm7ohKo86Kc2uYivutbIgcujzqVDRL4NpGIy4H6O3J00t2gbshtb/w2VNhfQNr43KgS4jOiKPsyITXfmBmdRWgRbFMpAsIVonD0vAkHaAdYtpVWd/O9738oCFN+1zoC/fJFi6vQW/qemVIiyXECOVekexQe3tO3wlI2Q0OHssF8jqSAnDwZBlHoIZhITntrFX0cxhAO+1WS/pBy+odEiYM+mxs8w8/GZ2T/66zP7TQ+eue5CCST0D9+UmaqWt6PyQbdEO7c2jpKRnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9H/zZt5iwVK0UKPyQb1+CyCiJXz71cUJv2bb+SYMyxo=;
 b=g+7rfM/48ecx2S3fuurNzB3Ahdg02o3It5qmWA1bdJQNvrowq7E49bfi/xCU9v5urALkPVnVJtFTPIAWD9HzWqrYK9yQY2hcQ/h6OzTGKSrB5nkQIwu/k1wgMSNtBooQ3DsSDUTtlFCLOyuDDyH3N6J3VBK8Qz4JfbHyaO+/00NDvDkf9hHh7TZ2CUVzLZDVNLJRwAZy563bJSquQSvf1eBapAqrPtu2SlgB6333l3oXHNH//rbkfsPNc7vG3HPmC8a55VDU0altMNC7r8T5G1xav2WoXPVZO+9ti/X3ZmkyI3B0bzHCKy2G44QYEQWBWx62mtfCwUlVagC7rLJ0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2937.namprd11.prod.outlook.com (2603:10b6:5:62::13) by
 CH3PR11MB8433.namprd11.prod.outlook.com (2603:10b6:610:168::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 20:26:53 +0000
Received: from DM6PR11MB2937.namprd11.prod.outlook.com
 ([fe80::66f6:544e:665a:9bec]) by DM6PR11MB2937.namprd11.prod.outlook.com
 ([fe80::66f6:544e:665a:9bec%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 20:26:53 +0000
Date: Mon, 8 May 2023 22:26:46 +0200
From: Michal Kubiak <michal.kubiak@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <ZFlbBsKLGjFPEtFp@localhost.localdomain>
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
 <20230508142637.1449363-4-u.kleine-koenig@pengutronix.de>
Content-Disposition: inline
In-Reply-To: <20230508142637.1449363-4-u.kleine-koenig@pengutronix.de>
X-ClientProxiedBy: LO2P123CA0028.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::16)
 To DM6PR11MB2937.namprd11.prod.outlook.com
 (2603:10b6:5:62::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2937:EE_|CH3PR11MB8433:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a2ebf5-ab21-4af7-ede3-08db50028f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hBG5mQ61p84K3g5KTctRXGTkZzNfFiXL5QVsKOJe7iNNLssrVv06hxITsgxeYOXHltblzF5aFdQxP34w3dJAdrWfrZOEhkiyVeu7ifyQUTNjLB+PrVRQGE4zH0/XcMgUdGvC+0lBD8sQnP5OzCC/EmjR1CAUZ67GA9dSNRYVcA/PH9h4coi5xaFVMIkfxNHU4JJCNOIulGE/KgMI+BwAmap40GgnUR81vxfTuw4mxreKJF1tSAiJptJ0GAq63Yaz/ilgMxhfiJIyTJ235koquAEaDzUyYN7pX0j4pDZp9o3cCOKXZhVIFL0At2bcScwq/tfrmXFrJDOmI9sPmLlS+TDI02MKTqC6VzrR5hq8PO2W8+SM6OHLxLDEZB8goss4WzA5MsoDv2z0DaRBQORjbIuJboAVdwi7QnTdQTxqRtSIaPA33p0qy8dMoGfAvBMlJn/Cu+8C22UW5IEWIE8uI+g6I9d/LQVRAopNiXLWok5UDzEnfv0XRP1j9DSl5A99ksPI/4cCcJVQm86akz+UMYbDvNGeCwhdD2RbJY9NKinlBY/ugSDEgq7LAqbOSgTq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2937.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(136003)(346002)(39860400002)(376002)(451199021)(83380400001)(478600001)(6666004)(54906003)(6486002)(6506007)(26005)(186003)(6512007)(9686003)(2906002)(4744005)(7416002)(44832011)(38100700002)(66476007)(6916009)(82960400001)(66946007)(41300700001)(66556008)(4326008)(8676002)(8936002)(86362001)(5660300002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?fkjbFekA2J5wH0uyG1L6DrkXg9IISTVo+w4OJLxz+6BsuoUodKmZLzv7T1?=
 =?iso-8859-1?Q?42f9xb+FiGRWu4XVMmErt5lIOAjVYgw8dDhVRxMwOuqLM3Qbt+A0Fw3bkn?=
 =?iso-8859-1?Q?qg+8GAlgJw9jXZ1x9IqD+IU37I8khAX2vh0rhTAHIG5NBmVT/Fj8Ck9r8z?=
 =?iso-8859-1?Q?p9PK/kGDx3aOuXcBVKx8x9Niq+KJti6VJLiHPXn7u6/tqXfMPG01xf1qbn?=
 =?iso-8859-1?Q?MVuhwtOTXFyGOTq42jYcpt35Q4oVUK0UtIigErNNmMik+FfiM29ac+RNzY?=
 =?iso-8859-1?Q?Xf1l+8MpzeJP9+r4pLdbKQufzOrCtueu/ZLusQ9BRLkYF8mv+efA8LJ3Op?=
 =?iso-8859-1?Q?PyKJowaROAZXD3K+dvvHK3n98VOmCIASXQdLWFSv8hd8PoN12MD+ww8fQg?=
 =?iso-8859-1?Q?SKHrZMo6FArpyU2aQi+HVXS7+xfLJV2EdBTazvgSHxq824o7zlXGlzAYuk?=
 =?iso-8859-1?Q?MoB4LdQXWTyyco+oHHOL2poTIw6rVOOoaHXgsObRNgkaS6bkuT9UUS1Er0?=
 =?iso-8859-1?Q?3JE6lZNKlvfHfPEMCqL4TSyedcvOGr9IHbBR49FIB2wVzNWslKoSMaSBzs?=
 =?iso-8859-1?Q?FhjR5gqwlGe5pZ1jE4Y+G3fTddWGbB24KU71oHmdEbOnB8p6W0Q0T+2xQ2?=
 =?iso-8859-1?Q?naD+qMmGmYsDJDKJUnv9Sysle0EcGqU+KgfWSFvNEeSQTUdyVtlhLboyPM?=
 =?iso-8859-1?Q?iuy1TaEoD/5yz/rz+2276QfRKxtMi8+4OSuuEOsrv10mfarrX8w74Ls0Dr?=
 =?iso-8859-1?Q?Yb61Q55F+66z2RXjmsE9sOkzRK0SdIgHNfo1wkontoiAtgYj/NrMZtRsoN?=
 =?iso-8859-1?Q?sar/1wdy0ld5BYVt/k6cZJK0CgBh6kgNsN+P7LpOaR5k/vEHfcB9iIx1t1?=
 =?iso-8859-1?Q?TOa9yIpXK+kCCfk6tDQShf/6rOls9MmWHZQLV2V9DdEOte91j/JVCwA5DT?=
 =?iso-8859-1?Q?iDZgls47Zi/lGRqHD1eLZ2xLo7hm3uPWH/HyAcUil+jB4nQOFpBjFgnly2?=
 =?iso-8859-1?Q?RhBlnIqZQrbFknORLcym4Sv6Gme9JmyxDdEKau6E/N9GIo3pirUCBwcZyT?=
 =?iso-8859-1?Q?kNrCOt0pYkqRYLCQ452EG9FjaA4IuTYVlaXU+xIwWztnQaC/nnpTF2eNnD?=
 =?iso-8859-1?Q?0ttrSRI2Q+b0H9rLAMn+jE/te0ephVNHK029N2mYPTeHb4EruSfHstGpEo?=
 =?iso-8859-1?Q?FpYA0HQq1w9ZRaQXVxOyeC65BSgJXQ+U8pKQIDiC7s/AksILOSnMtgLB4Y?=
 =?iso-8859-1?Q?2wJnj1f+p+LCiyq+G5DFqJY/ThD3HP/3rEoE2Oz1KO1WGSDFq8IPXXJCrP?=
 =?iso-8859-1?Q?QkeymmbJVechSSM0+noRxavxbLaP75hATmT5kdCxT1VPr8XxPWy9y3klWy?=
 =?iso-8859-1?Q?tAfDxxFpca9qe8j31iQDb3S+BZeuAh61zlIK1mh8EpjKY/3kLR5B9ugR1f?=
 =?iso-8859-1?Q?NhnLsHlsmlJ1WBgKg7nOJFMomdXJ+eOMfqcJZJbKsnRlLjNAVumM59rhec?=
 =?iso-8859-1?Q?Hbzuyfd8ZsZ9ihPuY5huJ8NO296vh/ov+BaDfFVOQ0A+Udu7R+dfTg+ERS?=
 =?iso-8859-1?Q?QKtOK+uWAxDAES3Ug/iGkGCB13q+JDP7ZSD6GrZ0GZauyawaYvu5o8cbZ+?=
 =?iso-8859-1?Q?l4WxFu5deSPl1EYuaBuySgEAa7pVL+kaDQpbz3WXKq50CEipIafnnGHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a2ebf5-ab21-4af7-ede3-08db50028f46
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2937.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 20:26:52.8616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdDKVaEAjwUztmXrVxUopU9kdP5PvptswMqI57mwqOMQRpwasq5SM4q4dosEEIRPEMOCbcrqIM9FEp5StQvsag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8433
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Tue, 09 May 2023 06:56:20 +0000
Cc: kernel@pengutronix.de, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <simon.horman@corigine.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo
 Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v2 03/11] net: stmmac:
 dwmac-qcom-ethqos: Drop an if with an always false condition
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

On Mon, May 08, 2023 at 04:26:29PM +0200, Uwe Kleine-K=F6nig wrote:
> The remove callback is only ever called after .probe() returned
> successfully. After that get_stmmac_bsp_priv() always return non-NULL.

Nitpick: "always returns" or "will always return".

> =

> Side note: The early exit would also be a bug because the return value
> of qcom_ethqos_remove() is ignored by the device core and the device is
> unbound unconditionally. So exiting early resulted in a dangerous
> resource leak as all devm allocated resources (some memory and the
> register mappings) are freed but the network device stays around.  Using
> the network device afterwards probably oopses.
> =

> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>

Thanks,
Michal
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
