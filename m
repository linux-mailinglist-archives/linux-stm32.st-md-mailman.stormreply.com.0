Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C351525C0B7
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Sep 2020 14:04:39 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 72674C3FAD8;
	Thu,  3 Sep 2020 12:04:39 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60058.outbound.protection.outlook.com [40.107.6.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A0B61C36B21
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Sep 2020 12:04:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJ3IiwANLQm9uDKCAGP73gFlSmi1e+EwaqNUuaH8lbcUcdHRYzIua7wdhFlV3TkP+7LNwzPYr5DLbK4x1SWHX9orjHaCF12gSpOx9DTqLvL0+HMCtn8OKYwThGScIRg/+QZLl23Vn9FIDRQKj6Dmg17cUYL109RXWUYO0CTqMFYgEedlMc6K61k7N/d7TUk4P7P7JezjT4ZNOcQjOWtsDMJGst8tRr6sDBPH+HX9Mw2g1DssdR6sjG3CLUHkaASb2cYERvdrXqx+D85KMWWRR1PESZBdKRAJWUDaxH774rB0vjB78jtgMTlueR9n7ZO4p1wRU6nQYP8RiPH2b3bcQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44L3ATpe61KH26FqXwzmKscuEVgRB4K/DVeTP0WRvY8=;
 b=cEHTEOwkW9ElIxszeArES96Eq5axz0JpJ/+6TvH9gswggLE64eF/JlWi+R/b3FmLjOdSv6gd5GlzfJInPOxyG/lak52v2UlpEYuNKmdsDt2R4Tm7hwaXoKbn7frrrMuZgHEzlxi5Z12SXw70BrKeTye0/VQ+0srxt8e6mUSHCk9ORuZpQcxQtZY58jlgJLuF1ofI42W1dduEDfxJS6Lppw/3ZBag4hX64lvvONqxwvxsLHp9N/3jPC5iYq7Zn9lpQ7fKzCZigQ/Mu/+zYa6RYGqEVIvpVym8/Hx5PRaFDhDD4+vsf6b7xMSTDKDwQvA+1M/rI11lG+8WeXBopJoovw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=44L3ATpe61KH26FqXwzmKscuEVgRB4K/DVeTP0WRvY8=;
 b=L4YGoE2Aw0D9zLm68wwfZ2+lBzh3htSCFTbL68Mum5Xvyr76ynLKGUNywgOiVNubZMLp+uaYuJPWMfw1puENUe6Nci8wZJ86EPQjxUbj/uWlXV+gvPmHBEwn8HvgES7PYmMk8hGh7ZCgkGWjdvSACdZSFC/VnVlo4+fmmo+4Y9w=
Authentication-Results: st-md-mailman.stormreply.com; dkim=none (message not
 signed) header.d=none;st-md-mailman.stormreply.com; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR0402MB3712.eurprd04.prod.outlook.com
 (2603:10a6:803:1c::25) by VI1PR04MB5341.eurprd04.prod.outlook.com
 (2603:10a6:803:3d::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Thu, 3 Sep
 2020 12:04:32 +0000
Received: from VI1PR0402MB3712.eurprd04.prod.outlook.com
 ([fe80::2951:31f4:4e49:9895]) by VI1PR0402MB3712.eurprd04.prod.outlook.com
 ([fe80::2951:31f4:4e49:9895%5]) with mapi id 15.20.3326.025; Thu, 3 Sep 2020
 12:04:32 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Corentin Labbe <clabbe.montjoie@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, =?UTF-8?Q?Horia_Geant=c4=83?=
 <horia.geanta@nxp.com>, Aymen Sghaier <aymen.sghaier@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Chen Zhou
 <chenzhou10@huawei.com>, linux-crypto@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20200902150530.14640-1-krzk@kernel.org>
 <20200902150530.14640-2-krzk@kernel.org>
From: Iuliana Prodan <iuliana.prodan@nxp.com>
Message-ID: <6c56dcc0-e8f7-744f-5a0e-3834c4b14c8a@nxp.com>
Date: Thu, 3 Sep 2020 15:04:26 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <20200902150530.14640-2-krzk@kernel.org>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To VI1PR0402MB3712.eurprd04.prod.outlook.com
 (2603:10a6:803:1c::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.13] (86.127.128.228) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Thu, 3 Sep 2020 12:04:29 +0000
X-Originating-IP: [86.127.128.228]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3ec765f8-589e-4495-19a1-08d8500183a4
X-MS-TrafficTypeDiagnostic: VI1PR04MB5341:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5341C1940D501C3FA85F72AD8C2C0@VI1PR04MB5341.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cjNhAy6xJEbIS+3J/CapZcWZ4kK7GO1m0c0l/58AwmSvOoiLSzG44Q+c1xKODhYvmOADZY2AZLi0KSbEwoPqaJV8/H81qBxV0Lq4GEEg3rwqV8aQ4s642KLlsvddTwpacDvToTlTRk4w0TS23GAWEMXm5R6MmAgwJGyZFlQYFzrg+aSIBs2w0x0RqeAdETDD/opYwbCbcOSKaLMvK0mCDr3R+zUTZ84Xg9cNg7BnEw+EyDxtdzXBTpxN9dGYPm4TTw/FRzYZB9QAFf8u9qFW4hT3eXTpUNHmuT38w+tnbQ6KJT3N2expoB++05biOqqKSQfwIqSyBIVJJiM9RvHKH4/wMdZnD0whX+j74zRI4XbOxN79NwocpGx/J+aWRFnUez6A7saN3yAX+9OdobUq2g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3712.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(53546011)(36756003)(6666004)(2906002)(6486002)(86362001)(66556008)(5660300002)(26005)(66476007)(16576012)(66946007)(16526019)(4744005)(110136005)(31686004)(186003)(316002)(2616005)(478600001)(31696002)(956004)(44832011)(8936002)(7416002)(8676002)(83380400001)(52116002)(921003)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: IVJuOR2EhQESMIHbw/xx5ZvQcrbEIJr9yynO9pl5Yav6jjGR/OMNT30RGnYlTVmdwbQZy1AoMIIeW85n3mHeLh5FxckCUu15fXUQnga/wq7VeZR0BXFHQT0VIavNZKAOoiB9uDP/FCjJ+1lGxzhL0Rxh/BbZ9UazlPY8NkJUTnQxqkARfVuLIPRB5l8e/3QFE5JC/qO1uUC20Yi00lKoWTyGbz4xSt2tumjvwoS1Rfa+gMHn5oPb4nTB1p5yTo8ps8wEVXOUxZjFiRAq3SJNLnxrBNb/sdlSMnKjXkLWNISv/IzASrwxQP+y+U+TsPtJIdDjP9ThfESL+Nf0DF6Q5G8Q7MD39b9bRxiUdeS3StTIU4/SNfalfWDTYfAufJnGANVhZzQg6uhuULHDNHe9ENNh8l78Iw0TwjWLzPJ3elQd+npVO/B+jhS5jSpmHKoZgvYVRQmikvUYz9VjAUt90JjaJ3tzHVFlBHLGj2OLwGVyG11loJkpXyEJYly3dTVr/ElrRLp6phYGkaYmbbe9tY67CyBQ7ooUfKcJqb02aLnySuAt6yL7OzIAyIzrUnEtGptjupgx1wSuZlufrBBfnuvh66BRwM3LpU3BYdm9mqjJRqDtw/+QbJJXRkTMeTCJbJQk5ofP1nSwh7OqkxHmYg==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ec765f8-589e-4495-19a1-08d8500183a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3712.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2020 12:04:31.6988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHh5VJsCj3H7N3l0H3S+VUMSrJkkeJLRU0cj12wnF+e2pKb7WobeqSgpGCETiPfMBEDFU7V9dDwAYT7LytSyMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5341
Subject: Re: [Linux-stm32] [PATCH 2/4] crypto: caam - Simplify with
	dev_err_probe()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 9/2/2020 6:05 PM, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and the error value gets printed.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

> ---
>   drivers/crypto/caam/caamalg_qi2.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/crypto/caam/caamalg_qi2.c b/drivers/crypto/caam/caamalg_qi2.c
> index 0441e4ff2df2..076c6b04bea9 100644
> --- a/drivers/crypto/caam/caamalg_qi2.c
> +++ b/drivers/crypto/caam/caamalg_qi2.c
> @@ -5115,8 +5115,7 @@ static int dpaa2_caam_probe(struct fsl_mc_device *dpseci_dev)
>   	/* DPIO */
>   	err = dpaa2_dpseci_dpio_setup(priv);
>   	if (err) {
> -		if (err != -EPROBE_DEFER)
> -			dev_err(dev, "dpaa2_dpseci_dpio_setup() failed\n");
> +		dev_err_probe(dev, err, "dpaa2_dpseci_dpio_setup() failed\n");
>   		goto err_dpio_setup;
>   	}
>   
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
