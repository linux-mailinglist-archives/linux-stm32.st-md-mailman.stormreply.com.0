Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A491E6CA176
	for <lists+linux-stm32@lfdr.de>; Mon, 27 Mar 2023 12:30:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69764C6905A;
	Mon, 27 Mar 2023 10:30:54 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B1D6C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 10:30:53 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id s13so4735031wmr.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 03:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679913053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RY27zgzeo2/+h7DIhGEkGBVdjkuFT2cSOB/27xypFIc=;
 b=fOdVH/hECAL4wFQubNSlYN4PDodltQkSGcxz4dq3C03YK+0Q/KwtULN/xziMXHv8sV
 0WrkaSAK8pMYCCmuzuNYn9wrFD7IpDMasZv9ZkJ7digaa135se1/Yn1VOe7g664CKkQp
 F9tkTOn6PzWrO6irJvcr0B6MzgyMWHcfMXp0jQ+hb3XpH4i+q8WE6Mhk7yd9gLfSpbSb
 80wGKdjIgifl9Iy0aP35pLBhnEqdknWEaRiv0UKl1aPqVCPg0/TDgS4+hd5+EmfSg9SK
 0lYUZb9v8WjCebZmstIJXTB3Tm99at/jNl6SYZLieRU7MlIf3P0/rrYmBNZgV57FAZIT
 SKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679913053;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RY27zgzeo2/+h7DIhGEkGBVdjkuFT2cSOB/27xypFIc=;
 b=1QXiYquVGmqu3SRTFvQyG9Vrcr4v98E8ElTleoant+owrm/iotE9VhjUaOr4qeYaZQ
 K2PgjqK/VwNU4aGRCXLGN05VkmifhG4l4N6mymCurlMuT1RYzic27Xzl9nOzrHop6hYm
 nTsEjcF8OOlWjNSuunCwNCj3KGViHXEwLpQ6V9fWBGLYjCCPhhJX7r7aTMOfErb8No9J
 rJz5aBlxJxyCHrOm2mKgaXInxgeccgT3XCPoHmw15xHZry11iDuBJXO29GyDMK4pSQl/
 GX9NCDDiXf+GTWW/bUftIfwUw36aw/s/svcNWTs/QwL4Zz1ECdCIHDkxlo9f4mdpVAJg
 wKFQ==
X-Gm-Message-State: AAQBX9e7X81kVauZJr9t3cbr68gvMTd0rwovS/Thvh3ZtxWiF+aC6YUL
 xRuzss61JOycSEtRMg9ekXHf6995w7grtiiwFP0=
X-Google-Smtp-Source: AKy350bijtXyfmmTUEm5apbI4I5dJpRvgt+p2sW5YhazHqdvAVc9zhnq0B9uAOBd/By/F49mT6CJZw==
X-Received: by 2002:a7b:cb47:0:b0:3ef:68d5:9573 with SMTP id
 v7-20020a7bcb47000000b003ef68d59573mr3886507wmj.19.1679913053051; 
 Mon, 27 Mar 2023 03:30:53 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.91])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a7bc8d8000000b003eb596cbc54sm13362684wml.0.2023.03.27.03.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 03:30:52 -0700 (PDT)
Message-ID: <75dcd205-5432-7103-370c-d65d792631ea@linaro.org>
Date: Mon, 27 Mar 2023 11:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
References: <20230327094742.38856-1-christophe.kerello@foss.st.com>
 <20230327094742.38856-3-christophe.kerello@foss.st.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230327094742.38856-3-christophe.kerello@foss.st.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/2] mtd: rawnand: stm32_fmc2: use
 timings.mode instead of checking tRC_min
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



On 3/27/23 10:47, Christophe Kerello wrote:
> This patch is using timings.mode value instead of checking tRC_min timing
> for EDO mode support.
> 

Fixes and Cc to stable here too, as you'd like to have this backported
as well, don't you?

> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

> ---
>  drivers/mtd/nand/raw/stm32_fmc2_nand.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> index 3abb63d00a0b..9e74bcd90aaa 100644
> --- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> +++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
> @@ -1531,7 +1531,7 @@ static int stm32_fmc2_nfc_setup_interface(struct nand_chip *chip, int chipnr,
>  	if (IS_ERR(sdrt))
>  		return PTR_ERR(sdrt);
>  
> -	if (sdrt->tRC_min < 30000)
> +	if (conf->timings.mode > 3)
>  		return -EOPNOTSUPP;
>  
>  	if (chipnr == NAND_DATA_IFACE_CHECK_ONLY)
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
