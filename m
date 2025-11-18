Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC8FC69F78
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 15:30:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BA67CC628CF;
	Tue, 18 Nov 2025 14:30:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CEE05C35E2E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763476215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3eRIY/NbZeEoJzxpOIjcuTXUY4zJKOGkqyWddqMp990=;
 b=V7rvHirgW/l8Z/Kx8+iHWf5tC+woZIiV+MfHaQNpExUtKdLHbI1TXIl5MIIIrFAdpHtB1e
 E4P8ySy33r9NSt/t3VW5YHI2VxWBAqccCqOdkXLmIxaljaLwBxQEpTLTyiiepZt2Ig9Bm/
 Ubrpev3jwD01pI3jPdmLcY1f9uMa93E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-UlLaDGbYODW3HZOVkLIUzw-1; Tue, 18 Nov 2025 09:30:14 -0500
X-MC-Unique: UlLaDGbYODW3HZOVkLIUzw-1
X-Mimecast-MFC-AGG-ID: UlLaDGbYODW3HZOVkLIUzw_1763476213
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-429c5c8ae3bso3830547f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 06:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763476213; x=1764081013;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3eRIY/NbZeEoJzxpOIjcuTXUY4zJKOGkqyWddqMp990=;
 b=CLgNRWdigvC0K7SSj+bSASgKSRMJ778K9gkKri1l8JU3yWfSJsmlhnoiz4yUUGDb2c
 EVRaKnCF0MEW9lmRdS4swQ9B8hFWM3PkSkcMtvAjVBgJWgcgt2BTxJqFYuGNKAElL6Oc
 6oadRNvr+DLgoGHyHT1d24p4a2CDt8uzvgAOXkhnOQPG1GDAqKuq2SqlGPi562azROoj
 291AKIEjl7hTq8masmFJS63cfJccHalRsFPziVo9OfGoBEaWwISD446osx/Bxz2sB6Ms
 FG0Hv6gybucPL1yM3yc6O/GvsCoskl0oNZLi/QgxjvodSSB5zHBH0OONtKvrSJKFD/ys
 7L+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9BQyK9gT0W8SFz97g/c0iYBJ334Av1wATc6Y6KZyUQ3SmJz3Ow5wX9okf6c3/ysJesgstL0P1KU1gDQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwOlqvNu+ZWjcwl4fc2EUUdvmAVxRawUuGlMAjlitP0EMHov5wT
 Hx3AKMjRjbvfDt+jNC6nXJJV8lpEhzGGtvQttqNCgeVRTo7A4Q0/9RZzMgbB8FkMl5f2HRb21lw
 kcfW+ATFq5nx+o1Lxy16tdKbastYSXi/IYu+f5Vs2bK0/Ibz5ofmvNcFMZPwX8GgdUTXMqa2LrQ
 Nw42CxEw==
X-Gm-Gg: ASbGncvHiz5Abazn7yBmj2leYFEQJkaYGpDg9Zc4+jOsAjo0Op/XCUj8eNYzHdudpCB
 bBKdzzRhR/hoUqlt0sJUCfnmiojUiogeN6AZaguxwJBNwOFlBLKu1WwEpshSnuuf7KXu98T1eXw
 aUhxJx19wO/qkVlja99mMWVGZhr3/4MMrCoCHUFj7PYbA1buMG+8Kvhxlp8To9bfzzWa/vHFEwB
 S61Bc0CLrHJP+QKpoSpt3LAaRLTpdRUnh49Do6MGB+8upMWXlvQLWo3MW+AzBvVBuZosK/t/30r
 Ll+iarAMrZXnS0OBsDvOxgyjrxH83ltewH5afxza5y0YfQY8YR9XcUwRKMSKNaQ16zKOkPhCLX0
 XJ7vt8LMHfmSc
X-Received: by 2002:a05:6000:4186:b0:429:92d8:3371 with SMTP id
 ffacd0b85a97d-42b59342b99mr14525649f8f.11.1763476212686; 
 Tue, 18 Nov 2025 06:30:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwm2ThNaD3qGGBsOApPqujAYKRByi04FEJdieN5aJJjweY+ug15q24nDRRxPxeQEH6CYkCcw==
X-Received: by 2002:a05:6000:4186:b0:429:92d8:3371 with SMTP id
 ffacd0b85a97d-42b59342b99mr14525592f8f.11.1763476212191; 
 Tue, 18 Nov 2025 06:30:12 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e85e6fsm32541019f8f.18.2025.11.18.06.30.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 06:30:11 -0800 (PST)
Message-ID: <4a3a8ba2-2535-461d-a0a5-e29873f538a4@redhat.com>
Date: Tue, 18 Nov 2025 15:30:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>
References: <20251114142351.2189106-1-Pavel.Zhigulin@kaspersky.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251114142351.2189106-1-Pavel.Zhigulin@kaspersky.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3uqMBhcTacCKAf4o1VNX8MmHqZLQ2sYu60RLlXLBPz4_1763476213
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Inochi Amaoto <inochiama@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: add
 clk_prepare_enable() error handling
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

On 11/14/25 3:23 PM, Pavel Zhigulin wrote:
> The driver previously ignored the return value of 'clk_prepare_enable()'
> for both the CSR clock and the PCLK in 'stmmac_probe_config_dt()' function.
> 
> Add 'clk_prepare_enable()' return value checks.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: bfab27a146ed ("stmmac: add the experimental PCI support")
> Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
> ---
> v2: Fix 'ret' value initialization after build bot notification.
> v1: https://lore.kernel.org/all/20251113134009.79440-1-Pavel.Zhigulin@kaspersky.com/
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 27bcaae07a7f..8f9eb9683d2b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -632,7 +632,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
>  			plat->stmmac_clk = NULL;
>  		}
> -		clk_prepare_enable(plat->stmmac_clk);
> +		rc = clk_prepare_enable(plat->stmmac_clk);
> +		if (rc < 0)
> +			dev_warn(&pdev->dev, "Cannot enable CSR clock: %d\n", rc);
>  	}
> 
>  	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
> @@ -640,7 +642,12 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  		ret = plat->pclk;
>  		goto error_pclk_get;
>  	}
> -	clk_prepare_enable(plat->pclk);
> +	rc = clk_prepare_enable(plat->pclk);
> +	if (rc < 0) {
> +		ret = ERR_PTR(rc);
> +		dev_err(&pdev->dev, "Cannot enable pclk: %d\n", rc);
> +		goto error_pclk_get;
> +	}

It looks like the driver is supposed to handle the
IS_ERR_OR_NULL(plat->pclk) condition. This check could cause regression
on existing setup currently failing to initialize the (optional) clock
and still being functional.

I *think* we are better off without the added checks.

/P

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
