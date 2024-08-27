Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2959960777
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Aug 2024 12:31:00 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 652F6C6DD9A;
	Tue, 27 Aug 2024 10:31:00 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 51FD7C6DD6B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Aug 2024 10:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1724754659; x=1756290659;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=l9izztVExtAUrD6YpzmSThcoQLAFPh5B9SUAyjBtIXw=;
 b=KEtOUlTzEhtzwEf997BaAwAh83KT08n1ZAIlFPjRNGqvGtjFkC1nj8C+
 3rgGB1GHUNS8jh2fwiQwSiLt8DrzLTAic9fbCf4suPVBbpFrg0MXSGJV3
 1PHHhc4Ci8h+OTpiUP3niT+1KxeA+gQ3U3sLV7kyAebD95GGtw0YrnW/c
 NPnVVwAj+n2vlsaJwCzyeprSuy3NLilahhucTv21xIPNJeC4l8RCw0+kv
 hiaM1ia4GYcq4UF9y2Mre4ioUfs/I/Mn9vrgSL5lWj9KWMBhJWUK0vmyp
 /O9g6OBVkiR/u+lkHp2gvJM4v0wf8ZLGpZduZOauxYXh19YtTPNViq9PE w==;
X-CSE-ConnectionGUID: nmYP+ln5QmKnTOldkUy+bQ==
X-CSE-MsgGUID: t266nJc+TxiW+F+ZHE4JWg==
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="30945822"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Aug 2024 03:30:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Aug 2024 03:30:14 -0700
Received: from [10.159.224.217] (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 27 Aug 2024 03:30:11 -0700
Message-ID: <18f714f9-1369-4029-b036-3c176377374e@microchip.com>
Date: Tue, 27 Aug 2024 12:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr-FR
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Lukasz Luba <lukasz.luba@arm.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Santosh Shilimkar <ssantosh@kernel.org>
References: <20240816-cleanup-h-of-node-put-memory-v2-0-9eed0ee16b78@linaro.org>
 <20240816-cleanup-h-of-node-put-memory-v2-2-9eed0ee16b78@linaro.org>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Organization: microchip
In-Reply-To: <20240816-cleanup-h-of-node-put-memory-v2-2-9eed0ee16b78@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 02/13] memory: atmel-ebi: simplify with
 scoped for each OF child loop
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

On 16/08/2024 at 12:54, Krzysztof Kozlowski wrote:
> Use scoped for_each_available_child_of_node_scoped() when iterating over
> device nodes to make code a bit simpler.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Thanks!
Regards,
   Nicolas

> ---
>   drivers/memory/atmel-ebi.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/memory/atmel-ebi.c b/drivers/memory/atmel-ebi.c
> index 8f5b3302ee30..8db970da9af9 100644
> --- a/drivers/memory/atmel-ebi.c
> +++ b/drivers/memory/atmel-ebi.c
> @@ -518,7 +518,7 @@ static int atmel_ebi_dev_disable(struct atmel_ebi *ebi, struct device_node *np)
>   static int atmel_ebi_probe(struct platform_device *pdev)
>   {
>          struct device *dev = &pdev->dev;
> -       struct device_node *child, *np = dev->of_node;
> +       struct device_node *np = dev->of_node;
>          struct atmel_ebi *ebi;
>          int ret, reg_cells;
>          struct clk *clk;
> @@ -592,7 +592,7 @@ static int atmel_ebi_probe(struct platform_device *pdev)
> 
>          reg_cells += val;
> 
> -       for_each_available_child_of_node(np, child) {
> +       for_each_available_child_of_node_scoped(np, child) {
>                  if (!of_property_present(child, "reg"))
>                          continue;
> 
> @@ -602,10 +602,8 @@ static int atmel_ebi_probe(struct platform_device *pdev)
>                                  child);
> 
>                          ret = atmel_ebi_dev_disable(ebi, child);
> -                       if (ret) {
> -                               of_node_put(child);
> +                       if (ret)
>                                  return ret;
> -                       }
>                  }
>          }
> 
> 
> --
> 2.43.0
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
