Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB8056B44F
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Jul 2022 10:18:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE88DC640F4;
	Fri,  8 Jul 2022 08:18:06 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0208DC03FC8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Jul 2022 08:18:04 +0000 (UTC)
Received: by mail-il1-f180.google.com with SMTP id k1so7891189ilu.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 Jul 2022 01:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=P6Gd+dIUTT3KkGrv9ENkxJer9nCvFgdfmHoOd7OvfxA=;
 b=MXWXmsdiLUQnCnslmIwo2CH3pAvsVQmDpyWIyYp9f7wga1G+VyuLRAz/FltCJ0DMon
 qlSREkRY0G2UDgvQV1IwPGaoISST0gSuQeBY1XKGFgQvEqllJbydZSWKtUURftpz5Hpe
 XfeNCZpdv6p7oe/Yzhqb8WqZcTs8SmmIYIG+je+fKAwtkecCAzBbiWVMoIz7jAcMAzI2
 Uze4Yo3RQ7KwKqDvf+Uvsdp7aANozHX4n0LESp/DxleVp2ocNDmEeOirGG5BQU4Fw5V2
 Dques4ELlQEy+G+X5jOJEmyaldF5VIGSUmFxL6jOzUC0sIO25BQkgaferMTWPufdyidJ
 aTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P6Gd+dIUTT3KkGrv9ENkxJer9nCvFgdfmHoOd7OvfxA=;
 b=lTdpkyFbndZrqmvL+U/XSGHsNUBHTu24t2N+Fp0UCTXVBOPgzGzq4HohzDfN5Z1Kwp
 AUz0y+YAvETIC9MkTErcihDgTWaaV5lseSgmXSwvK1uvAjd+IrEcO2x2ZTLDEeE2cHdW
 vL55BtaNteyMvKONDPgmvoMeql4G3QHgaSyQAoL78u35z4qozesNtsS52YTlmLJL14b0
 cm4opfnulSK7vtn44adRZ8ptU2RRr35wu/3dU0p2RKSDMK90WrBQuW50G9Ssts5497XQ
 kkeIgAa4N2RM2YmP2bR1a5LT/c0sqoEblY2Y9A5kMcTQgVXKJtutmmpRHa5zLf0D7GX5
 SXJw==
X-Gm-Message-State: AJIora8K+exLqojUcfKbACJt2tGxX/UGi+GwryWVd0rwI3ksowvQZbEf
 ZAV4NXN5c6gY0Ls7DQSzgf4=
X-Google-Smtp-Source: AGRyM1sMYLA3oN2FhV8iRlBxBKPC6Ma2VfIhQd5iP198thNMgX+FuuPQHfTYCjFgSpS9UIvXNT8yBA==
X-Received: by 2002:a05:6e02:1549:b0:2dc:616a:1dd4 with SMTP id
 j9-20020a056e02154900b002dc616a1dd4mr47747ilu.131.1657268283864; 
 Fri, 08 Jul 2022 01:18:03 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 g18-20020a05663810f200b0033cbfb5202esm2928253jae.11.2022.07.08.01.18.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jul 2022 01:18:02 -0700 (PDT)
Message-ID: <c088f936-00a1-4a7b-c995-dd49b011494f@gmail.com>
Date: Fri, 8 Jul 2022 10:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, David Miller <davem@davemloft.net>
References: <20220708075622.26342-1-biao.huang@mediatek.com>
 <20220708075622.26342-2-biao.huang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220708075622.26342-2-biao.huang@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Paolo Abeni <pabeni@redhat.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [Linux-stm32] [PATCH net v2] stmmac: dwmac-mediatek: fix clock
	issue
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



On 08/07/2022 09:56, Biao Huang wrote:
> Since clocks are handled in mediatek_dwmac_clks_config(),
> remove the clocks configuration in init()/exit(), and
> invoke mediatek_dwmac_clks_config instead.
> 
> This issue is found in suspend/resume test.
> 
> Fixes: 3186bdad97d5 ("stmmac: dwmac-mediatek: add platform level clocks management")
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 32 ++++++-------------
>   1 file changed, 10 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 6ff88df58767..6d82cf2658e0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -576,32 +576,12 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
>   		}
>   	}
>   
> -	ret = clk_bulk_prepare_enable(variant->num_clks, plat->clks);
> -	if (ret) {
> -		dev_err(plat->dev, "failed to enable clks, err = %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = clk_prepare_enable(plat->rmii_internal_clk);
> -	if (ret) {
> -		dev_err(plat->dev, "failed to enable rmii internal clk, err = %d\n", ret);
> -		goto err_clk;
> -	}
> -
>   	return 0;
> -
> -err_clk:
> -	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
> -	return ret;
>   }
>   
>   static void mediatek_dwmac_exit(struct platform_device *pdev, void *priv)
>   {
> -	struct mediatek_dwmac_plat_data *plat = priv;
> -	const struct mediatek_dwmac_variant *variant = plat->variant;
> -
> -	clk_disable_unprepare(plat->rmii_internal_clk);
> -	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
> +	/* nothing to do now */

We can just leave the function pointer point to NULL, that get checked before 
calling exit.

Regards,
Matthias

>   }
>   
>   static int mediatek_dwmac_clks_config(void *priv, bool enabled)
> @@ -712,13 +692,21 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
>   	mediatek_dwmac_common_data(pdev, plat_dat, priv_plat);
>   	mediatek_dwmac_init(pdev, priv_plat);
>   
> +	ret = mediatek_dwmac_clks_config(priv_plat, true);
> +	if (ret)
> +		return ret;
> +
>   	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>   	if (ret) {
>   		stmmac_remove_config_dt(pdev, plat_dat);
> -		return ret;
> +		goto err_drv_probe;
>   	}
>   
>   	return 0;
> +
> +err_drv_probe:
> +	mediatek_dwmac_clks_config(priv_plat, false);
> +	return ret;
>   }
>   
>   static const struct of_device_id mediatek_dwmac_match[] = {
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
