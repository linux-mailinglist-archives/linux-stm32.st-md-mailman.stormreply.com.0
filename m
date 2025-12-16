Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 08087CC111A
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Dec 2025 07:13:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CB72EC87EDC;
	Tue, 16 Dec 2025 06:13:16 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 978C9C87EDB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Dec 2025 06:13:15 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-bf1b402fa3cso4003414a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Dec 2025 22:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765865594; x=1766470394;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u5zoZFyP/UKoHmMIxoc2u4i7dlhbVg1+Ja56v9O8ZVo=;
 b=aGnae+FfzMbgU2mMWnY7SgMgh4DY1EUmfMI7ZuH+NN0vGao53DtudVj3RBns4TkkUL
 CKC97LBypkg2uDidDu6bOmtyzYNuLlRVvW4lT2fhk5pSp3tHSxSE0h5o2yPZdHCCr9Bj
 r7oyJ66Nk1GA52jBymoUNCn5PVDdS7BqHs+viGX8ReEUOBo7tqQDUUKMeNfP99GnPieu
 whVlEJ8mnPKti+1mow76vm8n02YzQqEZO9hhc0dY54iW6rQIU+8Z15bLZhlFJPmAvC9r
 f4/EO/SiElCaePzcnUIvnOjVEDe1yid9oDXlGhwPyOzxiljpNX2mLEu9DDOFRZQmBUlm
 J2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765865594; x=1766470394;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u5zoZFyP/UKoHmMIxoc2u4i7dlhbVg1+Ja56v9O8ZVo=;
 b=m3m2QVIIipGqse/CRmpVeLcXwCS6XRVdQ7fGxs7soSIdyVNKyQMSsU3ZvLgFnzMPby
 t+/QIGqRevdzJVWClp6VjXLtUsKUyIaeG4DwPlC4x1B5gcjZ6QbEreaLDUakYqcmIkYC
 uksBy/3fGYKIphoMFlslplE11mkCahCGLMMvqKozpZMNWBMmi+FZkeKOgkVWqWeGm8zD
 bLRPmkLsDNfokZvZCPA7/OMrmBjpFXO5lxwdP2V+70FUwPqOLsYqrplatyegMIN6nNHE
 Q59L4aL7foe3RIoSdeLR2SS8CkEHKszdrava5up60c2CWMhd509mRimOY01FfJXXa6LE
 yyNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqIB12hqN+WXBWptYQf9phv0W47NY+RNH6+gt9qQDwSTb/gcrSgVkXEZ4+3du7ddVtAwtZ6zJt2DfWEQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxyZhk8G/EIVvKc8XxiUZG7iqDePvtHeOPJe7vATCt578Knm0ah
 DzqydqJ4iqqeMjUiuptHsfslA6aLPIh6Meugdfh2gZP9z0m3ectwfD9d
X-Gm-Gg: AY/fxX7CSiK3cxbuv1QkUUAeMda47M6mtIb3q8QFQMHtcXEHYKdlZ/ZAT5uyMxhHrXm
 oAZ7VUvLC2HXpXiz2oRker0nXe6Sld00ST0cfJcCdNxnKUqKku9lea2MCe2skwSzXV11fzk0Xep
 ZeErkJ9i1F+HxaBIxKgW7Bzv7s/nf8+p8uxyEnpLCIOx6DupASM/u4MF5WjaGVwTRmH6B6g2zyh
 ttO4VbMMhFnWl7ZxAISVaFsqjsw9UHbKyopmySfc+aOlFGRVdgajdyPbCZ43kVPD6gfBQvSQk5G
 lnuXfdlN+Bv7Swgr7cdMVuZ+RMrrT3HelbnSu2HA7G4Pj6K2SLmI56+Tg0jlLCRpyzvWCis8zVV
 7yIrHac2V0Gpe8RulvpSQ1y3OOrhdZGH+0eQoOg/dPQLCQ2hzlFOv4igNnMuQWYWsB+o2LenD2T
 50fA62CVGAWMbxDl1J0goXIWJPEHOUsrtzULEMYsKrPETBCh1pHPY=
X-Google-Smtp-Source: AGHT+IEmPAJNRn3fZOAHPgVaJN4wVPNoEF0Tp25i8w7vUd23/VJa6NjYmY8OiorI1jp6xbp+SVUYoQ==
X-Received: by 2002:a05:7301:907:b0:2ac:1e68:2331 with SMTP id
 5a478bee46e88-2ac3014dd34mr7837424eec.39.1765865593824; 
 Mon, 15 Dec 2025 22:13:13 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:ac28:4c61:4797:3d5])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ae4f0546d9sm499892eec.28.2025.12.15.22.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 22:13:13 -0800 (PST)
Date: Mon, 15 Dec 2025 22:13:11 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Message-ID: <hpmm5fhs74swrhkneaif4s5dquqeclujdlua7ygmkvcmtf6n4t@rsahxu23xwfp>
References: <20251215-fts-fixes-v1-0-8c1e3a63ebf1@ixit.cz>
 <20251215-fts-fixes-v1-4-8c1e3a63ebf1@ixit.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215-fts-fixes-v1-4-8c1e3a63ebf1@ixit.cz>
Cc: Rob Herring <robh@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-kernel@vger.kernel.org, Petr Hodina <petr.hodina@protonmail.com>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Andi Shyti <andi@etezian.org>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] Input: stmfts - use client to make
 future code cleaner
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

Hi David,

On Mon, Dec 15, 2025 at 03:30:04PM +0100, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Make code cleaner, compiler will optimize it away anyway.
> 
> Preparation for FTM5 support, where more steps are needed.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/input/touchscreen/stmfts.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
> index 4b166b0a9a5a6..06845a00348cc 100644
> --- a/drivers/input/touchscreen/stmfts.c
> +++ b/drivers/input/touchscreen/stmfts.c
> @@ -747,9 +747,10 @@ static int stmfts_runtime_suspend(struct device *dev)
>  static int stmfts_runtime_resume(struct device *dev)
>  {
>  	struct stmfts_data *sdata = dev_get_drvdata(dev);
> +	struct i2c_client *client = sdata->client;
>  	int ret;
>  
> -	ret = i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_OUT);
> +	ret = i2c_smbus_write_byte(client, STMFTS_SLEEP_OUT);

Sorry but I do not see how using a temporary cleans things up compared
to a simple structure member access, given that it happens only once
here.

>  	if (ret)
>  		dev_err(dev, "failed to resume device: %d\n", ret);
>  
> 

Thanks.

-- 
Dmitry
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
