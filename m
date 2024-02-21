Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7010B85D290
	for <lists+linux-stm32@lfdr.de>; Wed, 21 Feb 2024 09:29:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CF0CC6B47A;
	Wed, 21 Feb 2024 08:29:32 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3456BC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 08:29:31 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-563c2b2bddbso9055778a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 21 Feb 2024 00:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708504170; x=1709108970;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CIF3oLHmCvNdf2w1LtFmrRJmYzffuUfqkjXXC5TFtKQ=;
 b=FTbYn3HLXErkb0s7uLkWdaLPc38esprZuHAmTgtqu+EFqBe81wsJ/9Wc/ST26XXPOc
 fkyd2SSu5uRS7nimXKA8MbNXcqUyaKhsWDCjrGyvTjMcm0NG4XjVEDCB/R317dUhjHuJ
 fqgOxCsS3euAvUfDrCYs89hT0RpG0Lm+Q62eQcpjB0TRnfFVmqWWyQaNd5qXoH0U5yqd
 06Szy7JTOggm5x8MTQgQNr2JdXqifm4upfR+GqZWuSj/qkLtHhwu1bE3FqMPhE4VLg5f
 LJ17r3QbkCMKFW//0/OotgJrsPxJgNoiyRRib/F9N70VdbqzjN/HKffVBAS40jlaQz3C
 +H7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708504170; x=1709108970;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CIF3oLHmCvNdf2w1LtFmrRJmYzffuUfqkjXXC5TFtKQ=;
 b=cyWADh8surPYEEicfxQV9L3KJSIZrVvJc89H3+VWxg1wlrPH3VqYQU6eSeJwvY3BPe
 FvT9ODvtY4jkawBj8lzT8lMfyPVoXWeVVvNJD7Mzs9c0rNQkiaTCfWTImENphcHQ1BQV
 vX+HwM2o5fUj9GvI5b+0majRPh98nEGAVg7kXaQGWIA1MFP1vP//5JtGZ9csoWmXE7hC
 1ojoYwkbSjlN4Ctp4FQq9LB461LguwLSn62FI1F5UsYSn/kP33LOvqtlhSVy2bCzri5O
 hOGpOfx8yOWh1OB6rCNNcdAUt/uLwiGTg2mgqMY6pFhBBHoFbNLYUskegNCRWKpsaL0F
 OygA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPu6fu0LK5Lz5iLYlHCglUYQYsnKgG7xFXE647IU/hGaAHi3uZhuV+70MES6VPpwmpiet3ZV/XEq5xNXKKTyBBFRi1bOQnTRQnrUDhXyXDa3YL8yfmLvqR
X-Gm-Message-State: AOJu0YwEZPTyGoWUoZ1oBUtYY+987q6nc3J7umdoQ+8H4aQt5xytu3ph
 YDQ2J5sItQL320opE2H1qNrxwO3EWqeXLchYd38ABwSlmWvUEU4UVVJASBd1EBA=
X-Google-Smtp-Source: AGHT+IFwLs2PXK7F8WAUFHe53efTAlG7yytZFExh1DXoSXHxGIOjUUAYP4LyJhqkaoOYH7kzaaNKTg==
X-Received: by 2002:a05:6402:3459:b0:564:f45d:1ae with SMTP id
 l25-20020a056402345900b00564f45d01aemr794885edc.19.1708504170618; 
 Wed, 21 Feb 2024 00:29:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
 by smtp.gmail.com with ESMTPSA id
 g14-20020a056402428e00b005642bcfed99sm3902151edc.23.2024.02.21.00.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 00:29:30 -0800 (PST)
Message-ID: <1c4ab974-2b72-45ce-ab20-de158b91e356@linaro.org>
Date: Wed, 21 Feb 2024 09:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20240219140202.85680-1-christophe.kerello@foss.st.com>
 <20240219140202.85680-3-christophe.kerello@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240219140202.85680-3-christophe.kerello@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v2 2/5] memory: stm32-fmc2-ebi: check
 regmap_read return value
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

On 19/02/2024 15:01, Christophe Kerello wrote:
> Check regmap_read return value to avoid to use uninitialized local
> variables.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> ---
> Changes in v2:
>  - New patch added
> 
>  drivers/memory/stm32-fmc2-ebi.c | 128 +++++++++++++++++++++++---------
>  1 file changed, 94 insertions(+), 34 deletions(-)
> 

...

> -static void stm32_fmc2_ebi_save_setup(struct stm32_fmc2_ebi *ebi)
> +static int stm32_fmc2_ebi_save_setup(struct stm32_fmc2_ebi *ebi)
>  {
>  	unsigned int cs;
> +	int ret;
>  
>  	for (cs = 0; cs < FMC2_MAX_EBI_CE; cs++) {
> -		regmap_read(ebi->regmap, FMC2_BCR(cs), &ebi->bcr[cs]);
> -		regmap_read(ebi->regmap, FMC2_BTR(cs), &ebi->btr[cs]);
> -		regmap_read(ebi->regmap, FMC2_BWTR(cs), &ebi->bwtr[cs]);
> +		ret = regmap_read(ebi->regmap, FMC2_BCR(cs), &ebi->bcr[cs]);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(ebi->regmap, FMC2_BTR(cs), &ebi->btr[cs]);
> +		if (ret)
> +			return ret;
> +
> +		ret = regmap_read(ebi->regmap, FMC2_BWTR(cs), &ebi->bwtr[cs]);
> +		if (ret)
> +			return ret;

These are just:

ret |= regmapr_read()
and one "if (ret)" clause.



Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
