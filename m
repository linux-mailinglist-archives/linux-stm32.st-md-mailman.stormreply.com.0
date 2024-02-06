Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B79D84AFC8
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 09:18:03 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C78DC6907A;
	Tue,  6 Feb 2024 08:18:03 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BC135C65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 08:18:01 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-33b189ae5e8so2763166f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 00:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707207481; x=1707812281;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ecxK0OeSx8DU/V9lxqcdeUM2UFGv78q9j2Mxgkb5Lhg=;
 b=dQt/Livw5DQ7rQJ5HoR86uo3heLa4oK6AOjpDkov+jidKCPQUKuNCNbOrsn5lPyy/L
 eHrrEARAlSBMv2PUwpbH70v01M4mTjG9FjRIVBQNH0BR5MS2NIkB/uepF1LI7m75Mk/q
 flroyyG2bNB2xhVjqjOSUyDwTQNQ+pUSdgKM1fKK3y+77b+bAtYS1f4VTbMHCF0XUHO5
 Qhuk8Uk1pu62jU03L9RWGYmJH88KoMmzGP2SNcC1a16gNYetV4CmKekzvqqewi856f6q
 ovGDg7tqnRcsGlEZT0M0kF2/8ZEd2CmpoILudJdaPaRVujasw3M937F5CFuEgvIxfIIF
 YoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707207481; x=1707812281;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ecxK0OeSx8DU/V9lxqcdeUM2UFGv78q9j2Mxgkb5Lhg=;
 b=OTBNX3VoG1fxrx2ZGcMGR2+VLvxQo6YzYCmF7a0gmoRY+DEf6+7OcBrUGoHfGs2naE
 JKgF8nPKB4nDiFD4CFKN/o/9mG3/5lx3DyS3umta9B0GsxmkD8wXOwoXHn3eys6JcV0p
 mUOotdOyMJRHFLK8Jqx28u07UkgefM4Kh98UiLxq9R3a58A//OuOC8D/hCa8pVIkIKQh
 rVZ0ECuha/Fy7H3TEXGpgPvP/DlkROGK5JVgtkI4ufGz0DI6CsonMqm+tDcwA6YcfZQ9
 A3WEV03SRp/TjF8AFGBAFEUU9o0e9nRlByYsg1/pcK60uGX5DspPno/pHkAZctbpIiDZ
 Q9vA==
X-Gm-Message-State: AOJu0YxaKzB2XKrguM3lowtxooKIoPybjvbJHr4RKUEoIOcJ12ePhA4J
 yJXDAPLhMF15+AsQ165TeyW4uSdeaEtXhj0Vs8ISOlPp6BlO+ziEGLsrJXJiEmQ=
X-Google-Smtp-Source: AGHT+IEpMcoa6cfEkFvIfvzpfuQ8Yx+dGDw/vR+l5ulMZgEDkKNzC9S0nuR1ItidAKgMFW7/sDqpmA==
X-Received: by 2002:a5d:55c6:0:b0:33b:287d:412c with SMTP id
 i6-20020a5d55c6000000b0033b287d412cmr598635wrw.43.1707207481106; 
 Tue, 06 Feb 2024 00:18:01 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWHbtH0YjwFLURKvvaj4m5/n5NPHSzvgoPcHOJvao8oQ289AiAyaZ5GlNthURTVrfwvxHGKwF/HByeoEpD+uZMQpctXoCfGsgiAyaEyYsTs6LfLhec/hMJIhdvM8RXPV+7wCwtHd8sZZgDd4GXS1jAHF5aui6uCObLAEYXcNNqdPt7J9g7TkUH/rxmx1DhYLT8uSV/U/hqzSL72p1q/aKrsVnkOXT7g8wHC1X7FkLKguFAX18M/M9Y62UGCDBCXsQaGxayBlRjZfLAfNfKon+27TgHHviOPrgxIyqs4hV+EekHxC8x5no4M0zewRa1C+jist3lT6cKCEGVn8HdYdujWfObaAUDD5wJz5kp/iEP6LSZ3hNfrXrTSlXcpfrrJhCAlqScMB3qMlxsf87phYRMPGVn4dUiydThdQmv21/QTuS03MvLDuTgufP3V8rsjNunlMsRUCF3He1FMwwC/nlBT1ttm5APCq6KNQy/rmWrRgJ4yWZUcGMYD31PLCggD2R2e0dxSEdgKUf40GI/sb4Na0qpZUpQdBMg/YGbf7UwG9Y3JawmduQdwiiNK3mEhXj3M0uJdPc96IrJsckfaO5aTaDfyWrkSqSoA1na0Ff6a0ipo/klDRxmO7jjBMZ0lYw==
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd?
 ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d67c2000000b0033b4335dce5sm1418976wrw.85.2024.02.06.00.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 00:18:00 -0800 (PST)
Message-ID: <b78d2ca4-9516-4d7e-9ec0-3fe93894523b@linaro.org>
Date: Tue, 6 Feb 2024 09:17:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US, fr
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20240205-ltdc_mp13-v1-0-072d24bf1b36@foss.st.com>
 <20240205-ltdc_mp13-v1-4-072d24bf1b36@foss.st.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240205-ltdc_mp13-v1-4-072d24bf1b36@foss.st.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 4/5] drm/panel: simple: fix flags on
	RK043FN48H
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

On 05/02/2024 10:06, Raphael Gallais-Pou wrote:
> DISPLAY_FLAGS_SYNC_POSEDGE is missing in the flags on the default
> timings. When overriding the default mode with one described in the
> device tree, the mode does not get acked because of this missing flag.
> Moreover since the panel is driven by the positive edge it makes sense
> to add it here.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 2214cb09678c..7b286382ffb4 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3523,7 +3523,8 @@ static const struct display_timing rocktech_rk043fn48h_timing = {
>   	.vfront_porch = { 1, 4, 4 },
>   	.vsync_len = { 1, 10, 10 },
>   	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW |
> -		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE,
> +		 DISPLAY_FLAGS_DE_HIGH | DISPLAY_FLAGS_PIXDATA_POSEDGE |
> +		 DISPLAY_FLAGS_SYNC_POSEDGE,
>   };
>   
>   static const struct panel_desc rocktech_rk043fn48h = {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
