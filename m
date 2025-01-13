Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E24BDA0B508
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 12:04:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 88F8BC78012;
	Mon, 13 Jan 2025 11:04:45 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 168C1C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 11:04:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-436203f1203so3764865e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 03:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736766277; x=1737371077;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gEmfuSom1K4g2Z3xa5ZnSesfn3qFrMdTPJjB5HBZZu8=;
 b=AsBKlqW0/XHQ/bCeNm2M7USED4GPFeEJ1gBELip+SfVX2rMHIlCYu7qphv4IpWFnQW
 dmd3rGDy6iRLdlUwZrugQHmCXLtvsPf4+ABDtR0a1x1G8f5iNPHMHFp+6Y/S9MQqHFO5
 m+gYRtNOYhdKoWifmO9aWIem/jcyb/vuKlc5+OBRLr4PqfpBvMUnslrjmvwRwu7rSe0c
 EMAwhRV9HCysjguf5vYEklISwh6sYWuIGwdfcZI96io1C44juRARbjOeDuj23jR/GBSx
 o/Mok1c9EKaKlyRjrScxle6QZvD8CKxTntIEzjiebE3NC1fbbkaiW8QZVpbLF3ZswVKf
 MkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736766277; x=1737371077;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gEmfuSom1K4g2Z3xa5ZnSesfn3qFrMdTPJjB5HBZZu8=;
 b=LfIYxwUj/gzFyXuQ4X6MHqxdKxf80EdLszeIJwpA6YP/6VAxyA46BE2vWs+/tBglLD
 NcqgkYxB0+iu1FZRPxcTZQNz9nUIFhCZgFNg2CkEOWCMmUPsQFAjoJ/MZJzPUucpE33J
 rrfbCdILueqCBgQ5W/dTfuXz+db3YykFuy4E7hvvIi0D46IhX9GB+q/Y/RqMUfqukcfA
 Eco3BHHoYjd7dIqY1HnIfQL9W3R+FAYNdgnjtAZN7gx0yuH2Jkn0EW+BrzuybW6NxvkB
 PET1zyHcQS9t0DqyszhascHHP3sF4Gjaj9CZZskmR6453QhRioyQsmxcdOiyZvsAwFUD
 CCkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvBVXVixAbn2SCMTMlqRL2iIm3NITZilP47r+tyPsk15vHnCiWhwNgDwtt7b9399I0KFJ2kL+Gz9NoDA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyvA5P/uwYXnFBY9FHsF+LkZwVRKJojIVGbx7slo/l8zIMpwLJ3
 oGV4dBB9uHBIBny5Z6RzYHOLpu5e2pUoELSif14agv11fLOp8wSaJzGH+gfoUpM=
X-Gm-Gg: ASbGncvDux+/s+iu+SjkHfenXs7wOe+hnFrfr5ghy+MCELDP7wAhqGGqUrB9ac2XTVa
 1a7HPFsq0NcrOk7q0gyIAwVvyR8tZM5ysjC9jJjiQP35qyNhzjitOZkl5SvrfdLR7xGbt9NuQwr
 vS6F+cTikPOYCfrG4Ob2Z4FhPLIgrxv/l9k2dmj82xO2mxexC1p+PmE5T1dh6z68B7l1h0XiaE3
 ldEnHzXgUoQOwueCEhPqEs+O3A8uzWoraSObB6ZB3MxYR6pueAN4GpZfl6kgX6kjX1mGPopYztY
X-Google-Smtp-Source: AGHT+IFBhgHEBA9yuB0/M8KWfTrBEJrfmm5y1LllORvx6tSaZm1AW8LC5fWL6ENzzzSz3Irm4PbRow==
X-Received: by 2002:a05:600c:35c2:b0:434:941c:9df2 with SMTP id
 5b1f17b1804b1-436e272c89cmr71879115e9.8.1736766277438; 
 Mon, 13 Jan 2025 03:04:37 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e37d74sm139859755e9.29.2025.01.13.03.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2025 03:04:36 -0800 (PST)
Message-ID: <1376b2b3-90c4-4f06-b05c-10b9e5d1535e@linaro.org>
Date: Mon, 13 Jan 2025 12:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: MD Danish Anwar <danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
References: <20250112-syscon-phandle-args-net-v1-0-3423889935f7@linaro.org>
 <20250112-syscon-phandle-args-net-v1-2-3423889935f7@linaro.org>
 <0eaff868-f67f-4e8a-ade8-4bdf98d9d094@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <0eaff868-f67f-4e8a-ade8-4bdf98d9d094@ti.com>
Cc: netdev@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH net-next 2/5] net: ti: icssg-prueth: Use
 syscon_regmap_lookup_by_phandle_args
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

On 13/01/2025 09:07, MD Danish Anwar wrote:
> 
> 
> On 12/01/25 7:02 pm, Krzysztof Kozlowski wrote:
>> Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
>> syscon_regmap_lookup_by_phandle() combined with getting the syscon
>> argument.  Except simpler code this annotates within one line that given
>> phandle has arguments, so grepping for code would be easier.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>
> 
> The patch only touches `drivers/net/ethernet/ti/am65-cpsw-nuss.c`
> however the subject suggests the patch is related to "icssg-prueth".
> 
> I suppose the subject should be changed to "am65-cpsw-nuss" instead of
> "icssg-prueth"

Indeed, copy paste.

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
