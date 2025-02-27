Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1D3A480C6
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 15:18:25 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE031C7A84A;
	Thu, 27 Feb 2025 14:18:24 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3F50FC78F72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 14:18:24 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso7050785e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 06:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740665903; x=1741270703;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=3KjmgTTmGKnNMLEkQ2tYRKgEmMShvtFLmbhC7J1ZseQ=;
 b=f0Cv83m3WEtwgO0+jWiHKL4XIvq2a9YUs0R/KiFPMRryI663Ze9LouV+Hm2KRooVRD
 xGc4EZYLwkxqSbXyWae+8IjWxpWZMk7cONmOkoODcEBWKuwTevzx/hajI+9dy19pPrDh
 cLnQbrKq/XyhrbNEY+0Q5AJJjWB/NWssmcy6Zm05P6zP3xcocswxWq8S2yo3/gJkIs9T
 w7Ce3X5cK2fPG9imgR7Qu3lDDS5+mYJ7R65nJSumdvmonBnY+iGTLcbr3VLkp3MwLaek
 +hPByss6WFfMfyhtKkErqG65Q0B9EbWhcu9/yN3cg99F2JDn26hSNddOIPfPGZeill4w
 QFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740665903; x=1741270703;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=3KjmgTTmGKnNMLEkQ2tYRKgEmMShvtFLmbhC7J1ZseQ=;
 b=q8mv3mT8Y6yLn0/WDUqQuYB2tq33oMGiIOuR/C2qq8x2n0Sk4g8VSEYTLvwtuh0jwc
 5w/tGIgrR5EASbng04JSE/OnEi/uJ8yYm4+DlyurxcLnvB/1zlxRNV1b8NY4eq7NcVVz
 KMkrfdO18GCb3oBu3PbLOHIjZVW00IkmILaGdbf/vQG9N07gCbAtRScjX6FXfzLTQnlI
 d2WdW2cq/FTZsoRccVT0z7qDffgvuMJkP23mBrriP5yZIF/yrDHO59dY5sZJLqUkJiI7
 YQGx0ZqV3+V1nf3/DWRPOw1TcKUItHy+HjIHm7est6Nf0B1cRfGqnVHxo5jk/yNS2pfj
 pFeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBJjo0TwaqkvReJRg3BZ4nMNhSDfyPFZYUpxkQrSoGsg0G/hI6zN++X3ybiWGKiTgj+Ha0b80L45G6hg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxTM62ah2weM4793xgOWUqiV5kqvcpZbjyCYdiSkIWqhtITU4wk
 tx+LwSXREaLSHDfILE+GjiWT7YtkhtGS0npYsNVQxjUQrG1zY7PFRueynmQTVfk=
X-Gm-Gg: ASbGncs37/rC5XUBLBuGiCQy6Y0Vuc9Er+0YyaOI91g+z3Zl4LxMx0aNJ+037sY6lST
 vKaJhWwVJ1MWdkSduG72fPo8f2TOVU0Suk2xR9LA9nipV2zX5OZwwI/qB2ztlakX6k0QjHlITxd
 t5xuq46JBQLwsf1E3oiWaX4EuWsCfiw+/NQzMgYaUNWPkYXmJQKfmQRKLGVV9OSyaspZTUatTV+
 swmpceFdrt7fzC4up/Il7wZzpX+n+WnU2DX6XgvkmaJZraq3HA59E7w+hAZWemavB//gwNmxvd1
 5/wDFYCh+nK6IcJmaj5cIjI+ME5TB6Mc7Tbw8F5vGWBh2MVzH1jz1un1e3optjd6rIQnIk2JpdT
 6tbk=
X-Google-Smtp-Source: AGHT+IFcL1gSMJCTCnZcd6HJw2zwybdNPIHKIrsiUSeI2jk/mbKwBJYRWGcu2yQ2deoYklOEQz/emw==
X-Received: by 2002:a05:600c:4e50:b0:439:8653:20bb with SMTP id
 5b1f17b1804b1-439b2b06189mr248030835e9.14.1740665903502; 
 Thu, 27 Feb 2025 06:18:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958?
 ([2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba5870e7sm59261405e9.35.2025.02.27.06.18.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 06:18:23 -0800 (PST)
Message-ID: <2198e689-ed38-4842-9964-dca42468088a@linaro.org>
Date: Thu, 27 Feb 2025 15:18:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [Linux-stm32] [PATCH net-next 10/11] net: stmmac: meson: switch
 to use set_clk_tx_rate() hook
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi,

On 27/02/2025 10:17, Russell King (Oracle) wrote:
> Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
> manage the transmit clock.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> index b115b7873cef..07c504d07604 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
> @@ -22,9 +22,10 @@ struct meson_dwmac {
>   	void __iomem	*reg;
>   };
>   
> -static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
> +static int meson6_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> +					phy_interface_t interface, int speed)

You can keep priv as first argument name and remove the next changes

Neil

>   {
> -	struct meson_dwmac *dwmac = priv;
> +	struct meson_dwmac *dwmac = bsp_priv;
>   	unsigned int val;
>   
>   	val = readl(dwmac->reg);
> @@ -39,6 +40,8 @@ static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
>   	}
>   
>   	writel(val, dwmac->reg);
> +
> +	return 0;
>   }
>   
>   static int meson6_dwmac_probe(struct platform_device *pdev)
> @@ -65,7 +68,7 @@ static int meson6_dwmac_probe(struct platform_device *pdev)
>   		return PTR_ERR(dwmac->reg);
>   
>   	plat_dat->bsp_priv = dwmac;
> -	plat_dat->fix_mac_speed = meson6_dwmac_fix_mac_speed;
> +	plat_dat->set_clk_tx_rate = meson6_dwmac_set_clk_tx_rate;
>   
>   	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>   }

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
