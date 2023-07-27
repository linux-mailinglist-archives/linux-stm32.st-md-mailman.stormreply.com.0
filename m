Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A88B7652E2
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jul 2023 13:49:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 102F7C6B463;
	Thu, 27 Jul 2023 11:49:46 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2092.outbound.protection.outlook.com [40.107.243.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 221E9C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Jul 2023 11:49:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CIkbN6S4seBKnxmu4W0DJMeizpqF2/ORpyAdmYV6zvvV05p0NqeJmqgKwigjG5IxLgd6vXygkMfOIyccYZZG9Ms+z+RN4vXH+LcpZUxVM6q9JLkyYODbm9eSNdPbgz6VoGzPXA0K2iUVSXnizjgll7eqXCpXlWLOp00ExJZCofo+GQ8YoTiedccxuuNISMZByc4WwO2h29Sr2zwF5k1rXoS+uMZbCnM91WpNsi4Yec6i2vTTDXSW1wwhHtEtJSlr5LfbdiyNu3RIl5BEAzodJy4YOqHyPGwnzN50NNxf6kmRhYdfDdMbzSSg/0Zooxcde09rMu9otrHo1se3G6rGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qWO5Jr/SyXxiG4dPlPyQfhtqVTqhsPoHN1yxilfEt0=;
 b=eWpwAuuO8BmN2NMMy+C6Ecvlb6RAB67S2j1OTrP7YtLPANTTKBpYoVTrT1ylvmLAgW0KiXREi/foo/U554xu2/wJalq1MqY6HgT5pjj0eU6FulErox6btDwWQdQmfV8rsN/Tl+cYX2+Am1N43nq7gy5Et0NG+qwdevbp/0zAAzSSuojLcWGj+6O51g6kxXUC0iPXo29okLcBaUcNzIns5FFOwjmbtt8Q2TAiRJRc+h7544HwDtrdJJrVn9jWTlEgw/xhACQ9YhclSLLCpHdW6I/vJNFlh64IZwUEwicG/wRctmfzvns3iH8l91ilMjPzMRnYyRAghIKqQDPp1nzUhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qWO5Jr/SyXxiG4dPlPyQfhtqVTqhsPoHN1yxilfEt0=;
 b=XxFpIJHZsVaO4JPornyaAKBOxBD6hDUkrbFRHLyUDNR5/BCHz+Nzl5WfpIb/tNmm0UBYhXSQ6kkh1J3sd6ESgs4mPM/gZnGlzKRy2lnE8/R1QyRS3tMwDMRki18nPFcLOPBU6Qm8QPd/oiXR6pIgGt2J/yxQXU7q356dxT0w+cc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SA1PR13MB4959.namprd13.prod.outlook.com (2603:10b6:806:18b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 11:49:40 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 11:49:40 +0000
Date: Thu, 27 Jul 2023 13:49:33 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <ZMJZzfqBxRNSeLxc@corigine.com>
References: <20230726163200.2138394-1-thierry.reding@gmail.com>
Content-Disposition: inline
In-Reply-To: <20230726163200.2138394-1-thierry.reding@gmail.com>
X-ClientProxiedBy: AM0PR03CA0068.eurprd03.prod.outlook.com (2603:10a6:208::45)
 To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SA1PR13MB4959:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb4f60e-185c-4305-6a32-08db8e978f73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGYZXKrSXyXZqOw4mV9E60F3ljs9E94DBFiAMxkD2LU9dVwYOxsH3HaJoWwAxkIeTjU8wtRKmrdoGJW4OfiatNDMC8GY+LAHv+cQOCblhvLyfgS7faKEd38uosgmofW4QRrDBgZ4iUgNR0MwX2Ly44q3W9Mso5+Prpe64Vyzmt0Cl4Yr6L3vzq9RaoXd0WIbdSaJXQk1bJaHZEXIqpMSM6IcJTv0G3zHdwX4UQCF6Q0pzT9lt/JjnNMPd/RI7bY0CJlA+zTl0exl3ldUBHIBdbfdMz+ZwCuGQe4NIUBSsSaLqoCs4iRb0+84P5F3yR58q9DGQ5wrdN/6BSXc76ol6tLPWiyWAT9CS3epYRQX2gUKm2PYzaw0hvkyXGGAdYwMJZmTXlRRqYq4YW2y9hHxWxhv4pSAkdMObGJERF4rKGBL/FOsiOmLmnCovufbHP7DfIREGH4MSImM5hef92fUvhfYRJLCCfuhNvpGe/z8Bg5BVAtjkHd5rjtVJQfweLcxKfYd56zUJ/FUBbFjseuFYXmiIcOkAdnTzWxxXPQXOugVCa+l5MLABao0QFY+dzWx1ycSTWyJADYN5VYRO5HcwDyDqauD/hkE8HD0dY7loAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39840400004)(346002)(396003)(136003)(376002)(451199021)(2906002)(41300700001)(44832011)(316002)(8676002)(7416002)(8936002)(5660300002)(36756003)(86362001)(6512007)(6506007)(6486002)(478600001)(6666004)(83380400001)(186003)(2616005)(38100700002)(66476007)(66556008)(66946007)(4326008)(6916009)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kGnCOoZsbbNnhi1RPRQOXoxaDMnZLj6ufmV55bRzlAZfZ3Yqpy1F5pYSq/kM?=
 =?us-ascii?Q?iwQNyBaW2uBXMVK0ejNGXf8535JUPbIGNxJg3RH/1Bc2/ZEViKWit/gvCF1y?=
 =?us-ascii?Q?fW4OeNq6+NxEse9YW/ysCHCRkPka3FLGpw4M1qWHpScLOlDZbGE1epNL479x?=
 =?us-ascii?Q?QVmH40lMUBD/alfIodiXIqyG22Ye1CY/BjQ8IyT0eBEYv55ZBOdtbX20eVpD?=
 =?us-ascii?Q?k+4MD4fLJz3bFyR8aPlBKFUzjLG9j2pwKudCFRym4dwRyM/jDtY7e1z9ZMxJ?=
 =?us-ascii?Q?XcbowzxD0zVST66C7Rr/4KlaW26oxz3405bZe6Ui2CXmOU0ILwmQvaQ5lObQ?=
 =?us-ascii?Q?Fhe+uI3eI4Qn0pB9BSwDx6yIM32b2wTaj1rxVQBNPzco8mxH+RDRqVEziRUx?=
 =?us-ascii?Q?6kZ8l6oocHKgOF8dxcUx5XteWT/5EVqu1bk5/cMtzxL3LbNe8kpuBsgcphMw?=
 =?us-ascii?Q?QMAG/nIEmlvk/8N/k44n6FpJHYtBNCDwptWK0JBhjsjpyDPFfMs6c6v2rrP/?=
 =?us-ascii?Q?vXbDsVSsp2miUkKjBCpsHy2YnmGoHYv9skLbXfhVUopLqFy06rxxmTtlC+e+?=
 =?us-ascii?Q?IeNhhq7AsWM1qcJd0RuUR6zfEgsoGSA/kGNSygcoMEMo6mbaA+IxI15bYC6U?=
 =?us-ascii?Q?7Ktx3ySXvLohwXzFUXgSJpfgMw29SnJ3sLERPBsoKeiM3xrJ9G6CBogEBNbU?=
 =?us-ascii?Q?Ye9s6LRhTnB5bQ0T6tY61kB1mimpLTfagloQarAbvrTatqzHhNt4EgmpRlL+?=
 =?us-ascii?Q?R64lO6dLyVlc8EapT/6F+KROQ+h+ift7fKycK+lM1XwXzfgkSZWl4pVun6Nm?=
 =?us-ascii?Q?9JMseZE3c5q2829rmgLXU3P+FWgSz9hrb5p3/LoNmS9uGHBUKz2r2JA8yPwE?=
 =?us-ascii?Q?oyXRWEQ1RJ1nE8ukTY4R7xspUP17ZQrZIG23a1wbeMALieNQe0REQQeLtjXV?=
 =?us-ascii?Q?zbXk7+eOJ6bZUIcQXcwkIQ9D8pkAsWVvFnC/TIRrW94QYd0AZBRnHSUsNcOW?=
 =?us-ascii?Q?dswiFJ+H0r49YZJ+u0yzI6XosywkTVXqq+32tODys13+14EcetwYyfuAxVf4?=
 =?us-ascii?Q?m8MucK6fJWozbyuBxJx2RpDmeuL9+wn+M07B/fUYFJcXUgSX9qT7ZBeDMD9f?=
 =?us-ascii?Q?vFfKx+TiDWI9vLkUdcuucq+TsR0wqaJykyK1H08i6fKOC+YBWdyVZ0S83pTQ?=
 =?us-ascii?Q?Zs6azSGboA5Bg2Jfo/aiD7cih5soJCIdoZBa6Fgnrmiryc/CMOmJtRzWnuFG?=
 =?us-ascii?Q?+3S5WZGwJcp07b6YXnLIwRk0ONFujgKZ4ZArZ3FPOLyOkgtMKNBGHbUedu5b?=
 =?us-ascii?Q?XEbl+u9x0xvqrRqGdcxKzaG7wJfaS6qD47KdIfOHSLA4J77A3j/JMsbSzrJT?=
 =?us-ascii?Q?A9Hp3oNZZiUiNkqGmwUUXRoRjYKKp2CCUShbLQJq7XKDoWOjTkWY4nEj4S57?=
 =?us-ascii?Q?sY2twKXQHt/PBenkNCsqrZbBGRSq0B8e8vX9WX9Qw0sRIa//1dGhQ/4lvDXs?=
 =?us-ascii?Q?Gdxm/HJB/mxrTOzK5iOcZIOaUGSxdiO/xTPfEUN48BRD+Ysjdc+yX7EClRVs?=
 =?us-ascii?Q?8KTvdZqwFpkDlHhYktcjgDktbZZft+NS7xtNNlC62t98vPeXo2+5DHla8EDd?=
 =?us-ascii?Q?e1PZtC+tddHbbxrtxkeQjLUmCxFdpJojItakR+ys4ojK8LHhw7aYkZi0Eb/V?=
 =?us-ascii?Q?pr1U9Q=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb4f60e-185c-4305-6a32-08db8e978f73
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 11:49:40.2169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6qb+yL+9sA3Ci6n0QWID8apROEKKusTSs/vV0I7asiwVpoPyt6MNJq4k/2gQfp2+blBRJrgpUlDIvvJu+uN2+TRtHUnVCP1Sn+OWotgydC4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB4959
Cc: Bhadram Varka <vbhadram@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jon Hunter <jonathanh@nvidia.com>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Revanth Kumar Uppala <ruppala@nvidia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-tegra@vger.kernel.org, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: tegra: Properly allocate
	clock bulk data
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

On Wed, Jul 26, 2023 at 06:32:00PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>

+  Revanth Kumar Uppala <ruppala@nvidia.com>,
   Bhadram Varka <vbhadram@nvidia.com>,
   Maxime Coquelin <mcoquelin.stm32@gmail.com>,
   linux-arm-kernel@lists.infradead.org,
   linux-stm32@st-md-mailman.stormreply.com

   As per the output of
   ./scripts/get_maintainer.pl --git-min-percent 25 this.patch
   which is the preferred method to determine the CC list for
   Networking patches.

> The clock data is an array of struct clk_bulk_data, so make sure to
> allocate enough memory.
> 
> Fixes: d8ca113724e7 ("net: stmmac: tegra: Add MGBE support")
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Reviewed-by: Simon Horman <simon.horman@corigine.com>

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> index 99e2e5a5cd60..78a492b91bc6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
> @@ -234,7 +234,8 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
>  	res.addr = mgbe->regs;
>  	res.irq = irq;
>  
> -	mgbe->clks = devm_kzalloc(&pdev->dev, sizeof(*mgbe->clks), GFP_KERNEL);
> +	mgbe->clks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(mgbe_clks),
> +				  sizeof(*mgbe->clks), GFP_KERNEL);
>  	if (!mgbe->clks)
>  		return -ENOMEM;
>  
> -- 
> 2.41.0
> 
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
