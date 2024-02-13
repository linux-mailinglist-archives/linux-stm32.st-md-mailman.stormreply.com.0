Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C50D5852A47
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 08:52:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7329FC6C83D;
	Tue, 13 Feb 2024 07:52:49 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D3AAC65E42
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 07:52:48 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5116ec49081so4347058e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 12 Feb 2024 23:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707810767; x=1708415567;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4gUdl2/6yyUfOH9+d0TxWj7DiTsTpgfUjt65todPL28=;
 b=Qrx8/ENhw61taZslzVaRwvhcB/2NAferHe8sKXQ3elhcGevf/HTDqBzhFrM+IrQete
 bG0dF0Pyz9odw6pW7+MDhBjVbW8grdygBX9KDqEKMDtgL+4cTGHvm8qUrivTYN1IP3d1
 oNA1MSdvI6QYaAD1eZDviFGBnX6TdoQjqEO+KEo+MYBRaWHQSf/kHJh7RTISzQsoL+p+
 AF2omTH1QJAYqTQpaa7uvZ/vTKj1RmiyOYQcwuqr37XGaDVuq7hy9I6N5JPmBR+VpIc2
 mdJBsqnGmbv7iVzJPedk4LRCGqqk86iHQORJJnU+mStY3zBimplN5RsDe+P4sMZwBIVb
 p2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707810767; x=1708415567;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4gUdl2/6yyUfOH9+d0TxWj7DiTsTpgfUjt65todPL28=;
 b=G5jtGzZgx3KfLkkMXOn0aRMJUlZ96k8SF/nBU+IKRXVKkJb9tvCv2eFqIp8lygrlTS
 EHUAbdcvEMJlmw0WtgcDRjeJGs7vP9LGnx6vLSaXzkZCXQqlvtTI7JpYi63yrWzBUg3q
 5bqlZ4uaaC4nalraswComUNXx8Qwf7DQf30W3YxphkJ+wCmAtYeStqaCCiFuf5q0O/lU
 9/XkMvfIBLfNjzmuje/zf+mGWdf0RewDl705Y9i+ybwZgjvjVQ0iMpY50YZ6lrAEf3dk
 c3lj+vCgnZ0exlhqYpSEV2kXXVmGOmA2V6Y4AGz2mklqcgqJbMdKFY7sIDGRyG4Ubd/S
 S1dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKYKz7+CC7t4Ax4lzHb5HW7TWYtgkFE3P8fwXK7Ss+W9ShEf9vBEW6Ut+T1IOaHmVtFibMiFNZwmmWnxcPkEOmK9i/ccf7Zk39kQwSBR9shChB7wvhYECn
X-Gm-Message-State: AOJu0YxLTjH9pRB0CQraZyvLx+3Z882hkTRsgLVRyfyNEVOJcwdATDer
 lEm8FDcxZ6ykxqctNQMweNbr8+j1LT+sTMCBu76t6utB769etzI/O2QxUy3spH0=
X-Google-Smtp-Source: AGHT+IGb1cmv23Djtnq5yjHeIK0VKg3qB6uyfQOubZv26Q3PESmao9vQc4FXyx18Z/la97IOwrOeGQ==
X-Received: by 2002:ac2:41ca:0:b0:511:1ed7:61b8 with SMTP id
 d10-20020ac241ca000000b005111ed761b8mr6112291lfi.30.1707810767434; 
 Mon, 12 Feb 2024 23:52:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWfIDnmXSHQs9RC0eoASbW20HKcbnPj50wh9FUN+kizs9ao1dURas9VwCeuqxtwEPZiIacvm72Kz/N2AH8XlcscBWq097C+iovnIqNPr3UMBdL2bFx2qExOObM64qvpdYTDNQ9R4wwN+Lxn6tfOEpfDEh6CFdUz5PQxfkviU+upojm3mmHslvGf7v9yZF5bDo8hJTunE+RnVWwmJsR+nhknn/OksnjmvQrz5GPf2u1R2nRQ53QBf7glwaooK098HUxr+LaeRNaRJQfffjTscWqoetkIko+m+yIGtl4Cjf44CYRVBg81DMHN6eHjo1qfbM8FqlFsqUgbVbZrUzbNUmQ5BkajBhJAft7WSbMrhE155Vkh36wku3aUkds=
Received: from [192.168.1.20] ([178.197.223.6])
 by smtp.gmail.com with ESMTPSA id
 jx6-20020a05600c578600b0040ffd94cd27sm10703773wmb.45.2024.02.12.23.52.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Feb 2024 23:52:47 -0800 (PST)
Message-ID: <989661f0-f539-43c3-a332-13c0e99ed7b9@linaro.org>
Date: Tue, 13 Feb 2024 08:52:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Christophe Kerello <christophe.kerello@foss.st.com>,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-7-christophe.kerello@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240212174822.77734-7-christophe.kerello@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 06/12] memory: stm32-fmc2-ebi: add RIF
	support
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

On 12/02/2024 18:48, Christophe Kerello wrote:
> The FMC2 revision 2 supports security and isolation compliant with
> the Resource Isolation Framework (RIF). From RIF point of view,
> the FMC2 is composed of several independent resources, listed below,
> which can be assigned to different security and compartment domains:
>   - 0: Common FMC_CFGR register.
>   - 1: EBI controller for Chip Select 1.
>   - 2: EBI controller for Chip Select 2.
>   - 3: EBI controller for Chip Select 3.
>   - 4: EBI controller for Chip Select 4.
>   - 5: NAND controller.
> 


>  	regmap_update_bits(ebi->regmap, reg, mask, setup ? mask : 0);
>  
>  	return 0;
> @@ -990,6 +1023,107 @@ static const struct stm32_fmc2_prop stm32_fmc2_child_props[] = {
>  	},
>  };
>  
> +static int stm32_fmc2_ebi_check_rif(struct stm32_fmc2_ebi *ebi, u32 resource)
> +{
> +	u32 seccfgr, cidcfgr, semcr;
> +	int cid;
> +
> +	if (ebi->majrev < FMC2_VERR_MAJREV_2)
> +		return 0;
> +
> +	if (resource >= FMC2_MAX_RESOURCES)
> +		return -EINVAL;
> +
> +	regmap_read(ebi->regmap, FMC2_SECCFGR, &seccfgr);

No checking of read value?

> +	if (seccfgr & BIT(resource)) {

Then on read failure this is random stack junk.

> +		if (resource)
> +			dev_err(ebi->dev, "resource %d is configured as secure\n",
> +				resource);
> +
> +		return -EACCES;
> +	}
> +
> +	regmap_read(ebi->regmap, FMC2_CIDCFGR(resource), &cidcfgr);
> +	if (!(cidcfgr & FMC2_CIDCFGR_CFEN))
> +		/* CID filtering is turned off: access granted */
> +		return 0;
> +
> +	if (!(cidcfgr & FMC2_CIDCFGR_SEMEN)) {
> +		/* Static CID mode */
> +		cid = FIELD_GET(FMC2_CIDCFGR_SCID, cidcfgr);
> +		if (cid != FMC2_CID1) {
> +			if (resource)
> +				dev_err(ebi->dev, "static CID%d set for resource %d\n",
> +					cid, resource);
> +
> +			return -EACCES;
> +		}
> +
> +		return 0;
> +	}
> +
> +	/* Pass-list with semaphore mode */
> +	if (!(cidcfgr & FMC2_CIDCFGR_SEMWLC1)) {
> +		if (resource)
> +			dev_err(ebi->dev, "CID1 is block-listed for resource %d\n",
> +				resource);
> +
> +		return -EACCES;
> +	}
> +
> +	regmap_read(ebi->regmap, FMC2_SEMCR(resource), &semcr);
> +	if (!(semcr & FMC2_SEMCR_SEM_MUTEX)) {
> +		regmap_update_bits(ebi->regmap, FMC2_SEMCR(resource),
> +				   FMC2_SEMCR_SEM_MUTEX, FMC2_SEMCR_SEM_MUTEX);
> +		regmap_read(ebi->regmap, FMC2_SEMCR(resource), &semcr);
> +	}
> +
> +	cid = FIELD_GET(FMC2_SEMCR_SEMCID, semcr);
> +	if (cid != FMC2_CID1) {
> +		if (resource)
> +			dev_err(ebi->dev, "resource %d is already used by CID%d\n",
> +				resource, cid);
> +
> +		return -EACCES;
> +	}
> +
> +	ebi->sem_taken |= BIT(resource);
> +
> +	return 0;
> +}
> +
> +static void stm32_fmc2_ebi_put_sems(struct stm32_fmc2_ebi *ebi)
> +{
> +	unsigned int resource;
> +
> +	if (ebi->majrev < FMC2_VERR_MAJREV_2)
> +		return;
> +
> +	for (resource = 0; resource < FMC2_MAX_RESOURCES; resource++) {
> +		if (!(ebi->sem_taken & BIT(resource)))
> +			continue;
> +
> +		regmap_update_bits(ebi->regmap, FMC2_SEMCR(resource),
> +				   FMC2_SEMCR_SEM_MUTEX, 0);
> +	}
> +}
> +
> +static void stm32_fmc2_ebi_get_sems(struct stm32_fmc2_ebi *ebi)
> +{
> +	unsigned int resource;
> +
> +	if (ebi->majrev < FMC2_VERR_MAJREV_2)
> +		return;
> +
> +	for (resource = 0; resource < FMC2_MAX_RESOURCES; resource++) {
> +		if (!(ebi->sem_taken & BIT(resource)))
> +			continue;
> +
> +		regmap_update_bits(ebi->regmap, FMC2_SEMCR(resource),
> +				   FMC2_SEMCR_SEM_MUTEX, FMC2_SEMCR_SEM_MUTEX);
> +	}
> +}
> +
>  static int stm32_fmc2_ebi_parse_prop(struct stm32_fmc2_ebi *ebi,
>  				     struct device_node *dev_node,
>  				     const struct stm32_fmc2_prop *prop,
> @@ -1057,6 +1191,9 @@ static void stm32_fmc2_ebi_save_setup(struct stm32_fmc2_ebi *ebi)
>  	unsigned int cs;
>  
>  	for (cs = 0; cs < FMC2_MAX_EBI_CE; cs++) {
> +		if (!(ebi->bank_assigned & BIT(cs)))
> +			continue;
> +
>  		regmap_read(ebi->regmap, FMC2_BCR(cs), &ebi->bcr[cs]);
>  		regmap_read(ebi->regmap, FMC2_BTR(cs), &ebi->btr[cs]);
>  		regmap_read(ebi->regmap, FMC2_BWTR(cs), &ebi->bwtr[cs]);
> @@ -1064,7 +1201,7 @@ static void stm32_fmc2_ebi_save_setup(struct stm32_fmc2_ebi *ebi)
>  
>  	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>  		regmap_read(ebi->regmap, FMC2_PCSCNTR, &ebi->pcscntr);
> -	else
> +	else if (ebi->access_granted)
>  		regmap_read(ebi->regmap, FMC2_CFGR, &ebi->cfgr);
>  }
>  
> @@ -1073,6 +1210,9 @@ static void stm32_fmc2_ebi_set_setup(struct stm32_fmc2_ebi *ebi)
>  	unsigned int cs;
>  
>  	for (cs = 0; cs < FMC2_MAX_EBI_CE; cs++) {
> +		if (!(ebi->bank_assigned & BIT(cs)))
> +			continue;
> +
>  		regmap_write(ebi->regmap, FMC2_BCR(cs), ebi->bcr[cs]);
>  		regmap_write(ebi->regmap, FMC2_BTR(cs), ebi->btr[cs]);
>  		regmap_write(ebi->regmap, FMC2_BWTR(cs), ebi->bwtr[cs]);
> @@ -1080,7 +1220,7 @@ static void stm32_fmc2_ebi_set_setup(struct stm32_fmc2_ebi *ebi)
>  
>  	if (ebi->majrev < FMC2_VERR_MAJREV_2)
>  		regmap_write(ebi->regmap, FMC2_PCSCNTR, ebi->pcscntr);
> -	else
> +	else if (ebi->access_granted)
>  		regmap_write(ebi->regmap, FMC2_CFGR, ebi->cfgr);

So this is kind of half-allowed-half-not. How is it supposed to work
with !access_granted? You configure some registers but some not. So will
it work or not? If yes, why even needing to write to FMC2_CFGR!

>  }
>  
> @@ -1124,7 +1264,8 @@ static void stm32_fmc2_ebi_enable(struct stm32_fmc2_ebi *ebi)
>  	u32 mask = ebi->majrev < FMC2_VERR_MAJREV_2 ? FMC2_BCR1_FMC2EN :
>  						      FMC2_CFGR_FMC2EN;
>  
> -	regmap_update_bits(ebi->regmap, reg, mask, mask);
> +	if (ebi->access_granted)
> +		regmap_update_bits(ebi->regmap, reg, mask, mask);
>  }
>  
>  static void stm32_fmc2_ebi_disable(struct stm32_fmc2_ebi *ebi)
> @@ -1133,7 +1274,8 @@ static void stm32_fmc2_ebi_disable(struct stm32_fmc2_ebi *ebi)
>  	u32 mask = ebi->majrev < FMC2_VERR_MAJREV_2 ? FMC2_BCR1_FMC2EN :
>  						      FMC2_CFGR_FMC2EN;
>  
> -	regmap_update_bits(ebi->regmap, reg, mask, 0);
> +	if (ebi->access_granted)
> +		regmap_update_bits(ebi->regmap, reg, mask, 0);
>  }
>  
>  static int stm32_fmc2_ebi_setup_cs(struct stm32_fmc2_ebi *ebi,
> @@ -1190,6 +1332,13 @@ static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
>  			return -EINVAL;
>  		}
>  
> +		ret = stm32_fmc2_ebi_check_rif(ebi, bank + 1);
> +		if (ret) {
> +			dev_err(dev, "bank access failed: %d\n", bank);
> +			of_node_put(child);
> +			return ret;
> +		}
> +
>  		if (bank < FMC2_MAX_EBI_CE) {
>  			ret = stm32_fmc2_ebi_setup_cs(ebi, child, bank);
>  			if (ret) {
> @@ -1261,6 +1410,23 @@ static int stm32_fmc2_ebi_probe(struct platform_device *pdev)
>  	regmap_read(ebi->regmap, FMC2_VERR, &verr);
>  	ebi->majrev = FIELD_GET(FMC2_VERR_MAJREV, verr);
>  
> +	/* Check if CFGR register can be modified */
> +	ret = stm32_fmc2_ebi_check_rif(ebi, 0);
> +	if (!ret)
> +		ebi->access_granted = true;

I don't understand why you need to store it. If access is not granted,
what else is to do for this driver? Why even probing it? Why enabling
clocks and keep everything running if it cannot work?

> +
> +	/* In case of CFGR is secure, just check that the FMC2 is enabled */
> +	if (!ebi->access_granted) {

This is just "else", isn't it?

> +		u32 sr;
> +
> +		regmap_read(ebi->regmap, FMC2_SR, &sr);
> +		if (sr & FMC2_SR_ISOST) {
> +			dev_err(dev, "FMC2 is not ready to be used.\n");
> +			ret = -EACCES;
> +			goto err_release;
> +		}
> +	}
> +
>  	ret = stm32_fmc2_ebi_parse_dt(ebi);

>  

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
