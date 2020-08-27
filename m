Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF64255607
	for <lists+linux-stm32@lfdr.de>; Fri, 28 Aug 2020 10:11:19 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 223A8C3FAD9;
	Fri, 28 Aug 2020 08:11:19 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130124.outbound.protection.outlook.com [40.107.13.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 07EE0C36B26
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Aug 2020 21:46:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcUHY+5BYwV2qUOhUTsPuQopCCJzmxI71sgneasKvifWZmpnDfBJpSENM6HeSC0n5QLQNuMfuCLRYsfW6LOOrq3U+0cO+rCQyCH6eCtd7syEHmnqXhx/dWHhOtgISs6JDzfm+P9to7HNFX9vLSVeC5PC9IxYgxlFDbEmcYLFRAABYm3z+8TsuJUhl/OOny+7wUYNZh74khYQOJ+hizHgRQXhCOS0AJa2HICtLOrHRVi29hbe8qaH27yn+IlB925r52T7fiYje5dT6qVUSnQbCJ4tb6HbWPHDTORtYBJ241nIoOmwWk5YfeknWq+CLIAIEpAQoXpO+/B4yIIQV3v6lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLL0g+LKSmRw27hs5C3fWN5Scep5juQsSUtJpPMHcqY=;
 b=kWI/DaCWPx1GTO9AUDWclrWgzF1B6tJqrYp6oUla8ESo92B88rwtwiJF+yScpjmQB4MV7339/jC3EXZXBCOg8yihUhbP0sMB+vjRhAyq0EqFse4ucHJD5wn0w2SuH7E+fbUkjD43S4OyBz+FKP2iwvX/1hCxhHvIDOVvRg7751A4ocJ1CD6s+E73efyZIoIhL9mKMZ7GN7ijncOPMyvLMyFd/D2hv5FjAM4JLQq0pr4sbywwtkkPR9PoremiKMT7y1mX0czfdFyzKe7KMCopysNwgqIwctUWE8kvwGnLOi2BCU/eMolzgnkH7Wf73BhFDeXrL81ZBYbImi8/WEXkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YLL0g+LKSmRw27hs5C3fWN5Scep5juQsSUtJpPMHcqY=;
 b=HbVfK0IOoGP+dCzEFDdLCUVbZxExzENAl67D1SJav2E2xGu0Dhj04x6a705PM9J+6tlqWpA+8YnwzUIWDiPvinkBKJ6RYxEMtiuii0ScHeiJDh7UOtFyUOEJcZM/jdQ8QQ8FDmEaKDPcBuOtXkIhiX3AXzGVsFnQJHW8qhWgrf4=
Authentication-Results: st-md-mailman.stormreply.com; dkim=none (message not
 signed) header.d=none;st-md-mailman.stormreply.com; dmarc=none action=none
 header.from=axentia.se;
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com (2603:10a6:10:eb::29)
 by DB8PR02MB5962.eurprd02.prod.outlook.com (2603:10a6:10:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Thu, 27 Aug
 2020 21:46:46 +0000
Received: from DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47]) by DB8PR02MB5482.eurprd02.prod.outlook.com
 ([fe80::3890:7b1:97a6:1e47%7]) with mapi id 15.20.3326.021; Thu, 27 Aug 2020
 21:46:46 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Cameron
 <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Kukjin Kim <kgene@kernel.org>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Beniamin Bia <beniamin.bia@analog.com>,
 Tomasz Duszynski <tomasz.duszynski@octakon.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20200827192642.1725-1-krzk@kernel.org>
 <20200827192642.1725-9-krzk@kernel.org>
From: Peter Rosin <peda@axentia.se>
Organization: Axentia Technologies AB
Message-ID: <f4a5777e-fe85-9f3f-4818-f7539f223adc@axentia.se>
Date: Thu, 27 Aug 2020 23:46:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200827192642.1725-9-krzk@kernel.org>
Content-Language: en-US
X-ClientProxiedBy: HE1P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::14)
 To DB8PR02MB5482.eurprd02.prod.outlook.com
 (2603:10a6:10:eb::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.13.3] (85.226.217.78) by
 HE1P192CA0004.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.19 via Frontend Transport; Thu, 27 Aug 2020 21:46:44 +0000
X-Originating-IP: [85.226.217.78]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0d4bfae-0706-4539-708d-08d84ad2b1ce
X-MS-TrafficTypeDiagnostic: DB8PR02MB5962:
X-Microsoft-Antispam-PRVS: <DB8PR02MB59628362E2AA2F8ED772AA22BC550@DB8PR02MB5962.eurprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tR4XeSsmbvq0R2m2TUu636PShIyT/3DwdsmOBVTNOX7ix7pxW28I+yvuhZtIq/ApT2Ds4mEPVXPqvYyVW8fFzaf1hTg+duNyPeO9cYMdQtcP8mlWnHPveAB7/IGLVNlqzKB9W9HpuMhjzCKlsbiieB5jIKFnUsXEEJde5fXVn8Ff/UzuptUhcs8WDR9tpFTBUzuy5/5qUegQZ8FYJJIoDe172glYc7aghUWUBzoTZWx2wKrAPIeKrr6VcehkyQnblVVCZbb8qi2ILTLsvaSpxTUi9qv/Rpa2FXfdqeGwi0BNXGDSyPDb+aOFQjmeOjLXyPLN8qFD7DzROKdYuO8x3Whmvxw/pih+MldBFpr3f3bO3s3oMC5oXWzTKN4i2b9MyFgB5ovESku9y2vP2fpxjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR02MB5482.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(366004)(376002)(136003)(396003)(346002)(8936002)(8676002)(956004)(2616005)(6486002)(36756003)(26005)(31696002)(66476007)(7416002)(6666004)(478600001)(5660300002)(86362001)(66556008)(66946007)(2906002)(316002)(83380400001)(53546011)(16526019)(110136005)(31686004)(52116002)(36916002)(186003)(16576012)(921003)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: B72S+Ct1Nwk85TCX2Ck3euVygkPxRZrLCWqlTVsaFpCkGyYI96+SyZYBTu6YJAbefTgA+JnEPxtwC0LnyhQTSCjwWICjJki3PMs/57XrfzouMMBqpDAlx8gRH73n406acO+kHLDLsIVJrQpNmTJTecAbFF1FygD0w17HamxwXsyQQ4fzXgHw3aexOn9FIceGmS5ZU7F6rOQITbX562yavNXIxxssMLbNo5K8V6UfhhKRSU7I9YiY3WkJfdxRgBPyWM9i1sLwR9XJ3drAxSANXOhWqLA2UIZ4H3PC7yIYfBiazeSVjXgwhwJmyWyB13SMgzcI8PdV2NImzvXEBmuDZMXiV4JxXbaJNjl+PCraZy5q6w4djXDiH1PK90SYCO1wkNlm5px3nHrcz2e/srESuv6OjmMy2DCZZNcNdBOo7qbosj3UGWpB+iMjwneQVKAh7Z4dwJPUZzXyUMHecqv14UDwgkGPOUW1/nY1yHouvBRT/+Gbq221GwZTUxAhut737KfinyjC2XIINUksRNsgn/ysgjovx0qk9DdIq47UYP/1gcZ0rpw9t+y9M09yIcR7DVutVI0Gp7NuCH8brDqPKrBqfOcEa8Bf8nq7kftw1Pc1SfQUYapC/lxRqt4HMZSrOMLyuQjGKfiDWEOPUsuThQ==
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d4bfae-0706-4539-708d-08d84ad2b1ce
X-MS-Exchange-CrossTenant-AuthSource: DB8PR02MB5482.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2020 21:46:46.3307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7pGlbZCqhZH9dLv7qJlmbA6DutWB4JMmWvkyXL7jCpNygxsI9A+zRRDWAio4XdZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR02MB5962
X-Mailman-Approved-At: Fri, 28 Aug 2020 08:11:17 +0000
Subject: Re: [Linux-stm32] [PATCH v2 09/18] iio: afe: iio-rescale: Simplify
 with dev_err_probe()
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

On 2020-08-27 21:26, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Wrap dev_err_probe() lines at 100 character
> ---
>  drivers/iio/afe/iio-rescale.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iio/afe/iio-rescale.c b/drivers/iio/afe/iio-rescale.c
> index 69c0f277ada0..8cd9645c50e8 100644
> --- a/drivers/iio/afe/iio-rescale.c
> +++ b/drivers/iio/afe/iio-rescale.c
> @@ -276,11 +276,8 @@ static int rescale_probe(struct platform_device *pdev)
>  	int ret;
>  
>  	source = devm_iio_channel_get(dev, NULL);
> -	if (IS_ERR(source)) {
> -		if (PTR_ERR(source) != -EPROBE_DEFER)
> -			dev_err(dev, "failed to get source channel\n");
> -		return PTR_ERR(source);
> -	}
> +	if (IS_ERR(source))
> +		return dev_err_probe(dev, PTR_ERR(source), "failed to get source channel\n");

Hi!

Sorry to be a pain...but...

I'm not a huge fan of adding *one* odd line breaking the 80 column
recommendation to any file. I like to be able to fit multiple
windows side by side in a meaningful way. Also, I don't like having
a shitload of emptiness on my screen, which is what happens when some
lines are longer and you want to see it all. I strongly believe that
the 80 column rule/recommendation is still as valid as it ever was.
It's just hard to read longish lines; there's a reason newspapers
columns are quite narrow...

Same comment for the envelope-detector (3/18).

You will probably never look at these files again, but *I* might have
to revisit them for one reason or another, and these long lines will
annoy me when that happens.

You did wrap the lines for dpot-dac (12/18) - which is excellent - but
that makes me curious as to what the difference is?

Cheers,
Peter

>  
>  	sizeof_ext_info = iio_get_channel_ext_info_count(source);
>  	if (sizeof_ext_info) {
> 
 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
