Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCA775F581
	for <lists+linux-stm32@lfdr.de>; Mon, 24 Jul 2023 13:56:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 541CAC6B459;
	Mon, 24 Jul 2023 11:56:29 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2090.outbound.protection.outlook.com [40.107.243.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 361FEC65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Jul 2023 11:56:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PxsdpCWV7hEMyjGg+/bDn5JkzGsgTyT1sUz8CjCW5HmVU83q2JyXSr3bTo0IKhPAmouuJD9toy+ks/uXhfSQAzHwtKm22Ioli8EMh4/brNOifLdhpOLLVA1rYA/3ogiTFdC1ERcLAtNZLY4FVnt3S+IOAF14FVUt8cczdcBmWWOJ9uGkTvt8rPsu9Vj8kormvaPSfpN9z5rFKk51BwzAQSoLLqpbeCwPnOSCl3x6LwaMyKzpzDaulPk2/1Lqm1lVkFtkAaSJNiQGPfAGx0n6scTyz3xmmS4FJhkOwPZC/GpO2Uby9EREIlE16EAtqnSeCT2FimbQxNFu6TvGfabx8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J3+wOufDe5H/I19ScnS+/hXwQ6Zb/ocokL+OovOxQGg=;
 b=Abhct9t0xlBOErxpwGeYvQ9WKyai/9urD19kX7SRsIACumOz5TTXNVuU7AyHbWPxM+xKSL1p4UqHM40AaSR9fNkTILelh/29vSFeM/+ty/voyIn8pXlofMHTSp+iPisLUqF5enHqB/8bVtwh7Vu9VFxepRW1m/73/MeRmXS+shYyLfKYSVg4NG2+fJkhvuIj83HcLoOfJypY8SY++qEFdYXRg40Nx8jcOKsJRGr306sb5snL1vGLQ8KB09rz945keYp8KZ+dr+BL6AdoF6QXeIDVN0UkoHJduZWB+F4ASOp1GLclxpeYJOqf8K9neKgGsxHhSRFbL9wm0jgF0jUL3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J3+wOufDe5H/I19ScnS+/hXwQ6Zb/ocokL+OovOxQGg=;
 b=WhnggHGoX50GSOBo0ut6p5v0LrUq15XmAEKdJHdtZT/aZ8I1KEU2anHhP+t3M5o5QzkRUDJ/4P26oZb55fppowWrmvYw69opQit5we5w6TeeFzXYK0yQrCFbzEorT8vXdVjll9Q6LnDoNuk5aTxZWEdLuZydzKAvni8lkVY0fHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by PH0PR13MB4954.namprd13.prod.outlook.com (2603:10b6:510:74::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 11:56:23 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 11:56:23 +0000
Date: Mon, 24 Jul 2023 13:56:15 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Message-ID: <ZL5m35qSRyjM8Zbk@corigine.com>
References: <20230721-stmmac-tx-workaround-v1-1-9411cbd5ee07@axis.com>
Content-Disposition: inline
In-Reply-To: <20230721-stmmac-tx-workaround-v1-1-9411cbd5ee07@axis.com>
X-ClientProxiedBy: AM0PR04CA0130.eurprd04.prod.outlook.com
 (2603:10a6:208:55::35) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|PH0PR13MB4954:EE_
X-MS-Office365-Filtering-Correlation-Id: 03b59413-333c-4156-c073-08db8c3d0021
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t570FtQxhPO1rEg16Fukk31JK7TiLh9y1sesF9zWtVzpN/tmn+BivBVYVZLUzJEk/3xxqs8xmODwbWbjtd4pOgDllHmbnwn2/m93bv8o8m7n5fmvbRnSpb3SIyDo7uqyUdSx+0vQb5SEhgt+zAuC+bMXUu7tlqAjy5meeytA5mfn5taGpsgrH3AJ4QVBILk3BeBzLaBgkZryJ1QTwU/bcoTar1FyzHIaRkEq0YERqVQegj149YuC613G5ZBO+otNXpaacIsb1Ted8l2kqxZgn/o087pRHrm4oq5rLo1CicvSQrKo6MoKkGy1UTwfOONtHbgz/n36b4k4bnM2BI9qOjo6N1ckyvsNbMdt+qWfwEqfrYqWv/uIe8r7dz/WARrxOlZX8fVupI8U8ItiVYW7AXauEEVqd11/0ymffPA5awhhbAsuMDJMdhynCm9z8WIwskVklbbgnclmzsvq5/0J0lf9qXGL0hSXW3vJEDfVKkVCnY+h+lL6pKWBloFMYYL08hYtiYJnOSUak1+yqaRouYA4wYOvw+R8ov1Z5Czq26J1iIS8Wpl5MyIAPRZE3ot4wuXXDRTG0VVcQEbpoeldAYNcPHaMSbJkuMNP6Ceysmk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39830400003)(376002)(396003)(136003)(366004)(451199021)(6486002)(6512007)(54906003)(478600001)(6666004)(2616005)(186003)(6506007)(4744005)(44832011)(2906002)(41300700001)(66946007)(6916009)(4326008)(66476007)(7416002)(5660300002)(8936002)(8676002)(66556008)(316002)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3BtQKC5s9Ajn9mAQSbskbiZH+gLNWzuGYkgnkBZ1mPONQZOgZD1WLSPQbRqb?=
 =?us-ascii?Q?9DqOML36Y1Gg59ZpQQUD1T/jU7+YVmwRYej4CC5PnB896ZSaRAXhXxwb/5W8?=
 =?us-ascii?Q?sYJl6fJJSbMR7ecTG777K/XOLzqZwFBrOuKsaE3qPo/r0/lS8TlgCdb5pj9N?=
 =?us-ascii?Q?eCaHmHhRCtaMBSK049s7zcu/7q7noBT88lcRx78UmXiTMiXOIwdh1Mq8a/im?=
 =?us-ascii?Q?UVDha2INjTb0DgnlXahcssXe+2IMrbU+HT0CmcMqUL40f/reCLmdpQ6thsCw?=
 =?us-ascii?Q?CJ7HE7ip4P5J4BEa+8O9XlK4oyIiKiNs9eLKHd9qID26yMVZSGUO9E9HDtnZ?=
 =?us-ascii?Q?4SYZ2ejnOOXyeyX8pXhVwjE9Wk93PgyKDQ1w36wG0y21HvRRn/irAUbhdZTV?=
 =?us-ascii?Q?oL6HX5QGy5nFyiA8m/O2+piGMRIc8zXv75ICWgWQ1FKjlVOHs5ptRC2hMF3M?=
 =?us-ascii?Q?a1EwY+M3PFMK/3R2CHdvuzgjSv7fhVr5auqmJOyKC+4pxKUWbeSGMq27Co3h?=
 =?us-ascii?Q?l/PaqxTmKw7fCq+LGqX52Wmnqwph93edZzX9y997mirKf0cS90reIc6CLZ0B?=
 =?us-ascii?Q?VhPk3/kDg2SE4b/nB9hCmC1KFY62LoS8aV4SP1SdF6Lrc+K79UnmrZxVSBT7?=
 =?us-ascii?Q?sxtJbjuS46p5rxtyoitsBiaA/YXtmzSZYiYThxmQrzB4JFV3i12hI1wb66VN?=
 =?us-ascii?Q?b7OtzST2vnamDJnmido5ww9JORbTr0F9yu8xO84cEfk8e7WZlzLIS5/2RzBu?=
 =?us-ascii?Q?Zkptxgz2x0jAL6t7+KtkF8Go0gOnZdSoJDEfjYG0DJWDo37prsGeyBhdvgpp?=
 =?us-ascii?Q?2c9U8CVHL0qAzOReRoh3MYdv6sJtnXOZG9gTJy9CCD4uzLMmFXiWtBFEFkp5?=
 =?us-ascii?Q?thaCqCogTYfzlbtWITa2b//EVVKVUNF3B2MCQXFgGnKkCEGrsXpj6k3ia05S?=
 =?us-ascii?Q?DKliDWWV5V1tDWIoMgCloPjPsPrMqpoUYAcP0mdUVzIZAomMwyP19/z+5+IH?=
 =?us-ascii?Q?1AtiEaOLPkFhUaov7YKdJ5fVcD4TSeJPZaLlaRClxG/szYbQlkHOy8agyuUn?=
 =?us-ascii?Q?VXRaTuaQHASZ4Y1hu2zmFfhUlmOvIICDfiB8TZ9i3cZJdjbsMUjJioQ+44j8?=
 =?us-ascii?Q?f1ZmblPWynYF4zjIR9Q5oLrJgLU0wBsJ7VIepJEM5ANAA32TmwqiwEYQTlkb?=
 =?us-ascii?Q?o6sBi6Qq+K3e6H93+PFZ+dxCCLXiJZ1EYh4GvMrRvH2Lg253N/qNNAMAvd4Y?=
 =?us-ascii?Q?GAeHmOuzi0iUqEQKpul34moTzvSu4DeRG+bv+5qqzpEWhhosGzMmK/5yfaGd?=
 =?us-ascii?Q?BxFVD5nssrBKpUj4bEdUgpJJPxe30/goAkUMZzMCma530FTp8fqeGTKuLyIs?=
 =?us-ascii?Q?COJIEC4vZgoChdaQ+4xZmbpf0etOkHWvnbiaJpec8ZWTQ5xmjGM9jeBX7lWc?=
 =?us-ascii?Q?Qe/2bQeSM7AiPuOtRO5fHOyniR+soFLFPyJSVU2Y4iZopViF25bf+zD/9sWE?=
 =?us-ascii?Q?+gc5SWJ+A1h0yvieyhO3uHR5HtPA3c20sYUuRjby8+qluBEzLnhAmqW7G/bv?=
 =?us-ascii?Q?oTfvRSU6IPSfg8uxLQsO8I4AeYPL4XTT+4dneCmjc4zRHmUYQRrQVXHWH2Ri?=
 =?us-ascii?Q?lLn34tF0zFcwTUFPZlqJ2vIyJY+nfhQs5pCP9kWMPZOyxA16c6eYeCXxGSjI?=
 =?us-ascii?Q?S0QMzg=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03b59413-333c-4156-c073-08db8c3d0021
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 11:56:22.9727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzlosflHYfv0MExb+hp+7Pn0tOsKCcSz3HF9OQVOAs80Em8JG9Z0Kpaan3vqWW0+u60Yon9itSqfH4YKviksIRXVqcXSkrz8d54Q0wo1OlE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR13MB4954
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, kernel@axis.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Apply redundant write
 work around on 4.xx too
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

On Fri, Jul 21, 2023 at 03:39:20PM +0200, Vincent Whitchurch wrote:
> commit a3a57bf07de23fe1ff779e0fdf710aa581c3ff73 ("net: stmmac: work
> around sporadic tx issue on link-up") worked around a problem with TX
> sometimes not working after a link-up by avoiding a redundant write to
> MAC_CTRL_REG (aka GMAC_CONFIG), since the IP appeared to have problems
> with handling multiple writes to that register in some cases.
> 
> That commit however only added the work around to dwmac_lib.c (apart
> from the common code in stmmac_main.c), but my systems with version
> 4.21a of the IP exhibit the same problem, so add the work around to
> dwmac4_lib.c too.
> 
> Fixes: a3a57bf07de2 ("net: stmmac: work around sporadic tx issue on link-up")
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>

Reviewed-by: Simon Horman <simon.horman@corigine.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
