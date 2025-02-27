Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1D3A4819C
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Feb 2025 15:38:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 67E63C7A84B;
	Thu, 27 Feb 2025 14:38:56 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6B303C7A849
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 14:38:55 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4394a823036so10575635e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 27 Feb 2025 06:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740667135; x=1741271935;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=gDcODo9ERLNHFPyFhG+ldH6uGhEwuHVDSakPGts/Q/0=;
 b=u4SNvzK2JTTmqMf3iqGg83MjIcL2FnNyMHMdKeEd5t9zR36rNE1fUk2RHFaTQUgVQK
 2OYPQTLfpjlPsBOo50SWRgv/1eVdC//CkcSzZklJBHf4GGoYDQrGB7BgoFocNiNl0CJ8
 Zuw2hJq4kJAwr5HAu+DSY22rKSA7MqJgB4bOdHZWfsP8Z73r8uiBl389kEqYsw+tcqCx
 TRsA63dCH4vdPb575DdZT2dZIGNmaIGwGCpna1V94v2GspF2WEZE9AXYzeOleLDfsTN8
 FbAmXCiRqZruWRLBzlq0X7aIM4iDSkxRzJIlsvnnpppaVNb3lS9BZnL57yWjpY+xfmoR
 Ix9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740667135; x=1741271935;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=gDcODo9ERLNHFPyFhG+ldH6uGhEwuHVDSakPGts/Q/0=;
 b=XXUKvTfTXtnUk/MKTK7/kFN2bgucd1YjRJGzvqgVzUyLqIzn7IXuUyF+1tnS/pg3a1
 I2Sq0YpppBrN2/EvZQb0q4dt4nBJFBtSgRyqXYuaQwI4UUS+eit8M6O5upS5v93JWfkp
 pfAXHqXo25d15LOjQ/2nsxM24vvsB39nuuHh6oUCCLuuES/oOQ3NDl2QJW7E6D04HJCS
 sXJkSqdcM3377X/aE6G2GLEyWJ2iAdLqjvouQ5yFAX+AfrTpa06acotOllzsbuYAMBZG
 de1a4mAzKH0WbAPTIR26an8dlzdhCxzj2cxLqUAKRZBV03LFadYZLvYZp5zP1QlYIEet
 xcxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvAmXjpYryKH9SMDIwdfLy/K+4Bu/M1CMqG47zzPAFJ+Kpvy8+VDRFEq4Z4YDxNSzxosyes1wM+pPDqw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwCUKdPjJOVt4+KIKIB5RYGfjNermP2mirTXvW1g7OV3wuMmJEE
 6uU+N8GFOudKcVnXF4ewhVbaDdtaUZEyfHSK4oPZY1KwU5U4FDKWeXNGFNMVucA=
X-Gm-Gg: ASbGncvYjxxGV8z0I9qWMA0bSfiEslzR9whwDLrPSOEs53FukeW4tvEEKD8TdsNCegS
 jRjFmtlmmiMqHizOs8sDZIxSubviKKyy2p+pmXCSInHAw+Oz83IThME8EPbYCKGmR+TqyqXqPxO
 SD55cyWa2uKc3wiH8u4T56eoNVqS63WVCu77kbnGsFry0hybOFxZRck+fEsQwXzyxuDxlJRN5EL
 dtsprrDY9dbyOQGSXRxlEEtJf89Q2DcGLLwkgmSa5dNwvhxAMn05J/pFnvfUjZtHpY32O1qz/80
 aFuvnZnQ9NArCZefZIPEac3/GqShmgAUTgo9/WdcgqGizc020UizDM2CbPorQBoCphA7Kx4PHRF
 n0pA=
X-Google-Smtp-Source: AGHT+IGglvD0BjLjUSReKQ3M4zIhgXtSEWvSxDygsXG0F96YWhydQ0BMAYxWezFgG1DgXlMFXIW6VA==
X-Received: by 2002:a05:6000:1541:b0:38d:e48b:1783 with SMTP id
 ffacd0b85a97d-38f70825febmr20148963f8f.42.1740667134786; 
 Thu, 27 Feb 2025 06:38:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958?
 ([2a01:e0a:982:cbb0:c5de:e7f3:73c7:7958])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba58713bsm59521635e9.34.2025.02.27.06.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 06:38:54 -0800 (PST)
Message-ID: <f21edb2c-e49d-4448-a25d-fb75f44c902a@linaro.org>
Date: Thu, 27 Feb 2025 15:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <Z8AtX-wyPal1auVO@shell.armlinux.org.uk>
 <E1tna0z-0052tN-O1@rmk-PC.armlinux.org.uk>
 <2198e689-ed38-4842-9964-dca42468088a@linaro.org>
 <Z8B4OSbY954Zy37S@shell.armlinux.org.uk>
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
In-Reply-To: <Z8B4OSbY954Zy37S@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-amlogic@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
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

On 27/02/2025 15:35, Russell King (Oracle) wrote:
> On Thu, Feb 27, 2025 at 03:18:22PM +0100, Neil Armstrong wrote:
>> Hi,
>>
>> On 27/02/2025 10:17, Russell King (Oracle) wrote:
>>> Switch from using the fix_mac_speed() hook to set_clk_tx_rate() to
>>> manage the transmit clock.
>>>
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>> ---
>>>    drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c | 9 ++++++---
>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
>>> index b115b7873cef..07c504d07604 100644
>>> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
>>> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
>>> @@ -22,9 +22,10 @@ struct meson_dwmac {
>>>    	void __iomem	*reg;
>>>    };
>>> -static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
>>> +static int meson6_dwmac_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
>>> +					phy_interface_t interface, int speed)
>>
>> You can keep priv as first argument name and remove the next changes
> 
> I *can* but I don't want to. Inside the bulk of the stmmac driver,
> "priv" is used with struct stmmac_priv. "plat_dat" is used with
> struct plat_stmmacenet_data.

Right, it's still an unrelated change in this case.

> 
> Having different parts of the driver use the same local variable
> name for different structures is confusing, and has already lead to
> errors. Consistency is key. This is called "bsp_priv" in
> struct plat_stmmacenet_data, and therefore it should be referred to
> as "bsp_priv".
> 
> I am not yet going to be doing a big rename, but it *will* come in
> time.
> 

Doing it in a big rename patch would be much better indeed.

Neil
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
