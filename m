Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA1584AFC5
	for <lists+linux-stm32@lfdr.de>; Tue,  6 Feb 2024 09:17:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0C750C6907A;
	Tue,  6 Feb 2024 08:17:51 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5AAABC65E4F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  6 Feb 2024 08:17:49 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33b1d7f7366so2705143f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 06 Feb 2024 00:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707207469; x=1707812269;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=UyN5OHMQS53X20sOXqYyX0W/PsIbBopkeWbqDFzNQLU=;
 b=LJV7DVvaAP3saqsH38hMm8xcISHbBZIPPjBK5VWHHUkhSbM0E7swgfsSkkUfw4UYsE
 5nKnkwrpuyx2iYbsKzMGN6FOtq6ApVUos1puBFN9HPWOx0HKCwQzKDETvNsiE0YzyhbN
 OEqCWzN10vc7YaFPb8GrRd/VPhbibUaUtE7T+hNr3HdHFJG619QnhWjE+Oi5X9idd90N
 t7VFGgUhoM87sMxU04PyFgmShuetKcFYHfIfkVYhRVi6KkFt81BWqRgxbRBTCxx5dkm5
 OvM8EOD5mwWtItw226IoGnMrNU0Xasfz7LGlrE07NHjkQ+6PmmX9xxkfWCTXDC6i3hpU
 kzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707207469; x=1707812269;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UyN5OHMQS53X20sOXqYyX0W/PsIbBopkeWbqDFzNQLU=;
 b=l8AhZOzf6x7WfoCFaG0+UNsq9/1Kd5HKOdXwDKWJG/qvaGOZ2/TfHV8xvDIsOnwznW
 2AeVIpG4hW7CTdNbW/hL19Ir530yLpBvNKH9nic8F949e+bJBlUEoNB+WWDG2FNJdrkF
 sFgwsaP/a8jtsw+W4eHzzjoHxsm0XiIOBGns7UjWjk6f41IzNKkRCTgxXZfsbNv+s+iD
 Yxyv6eetOLPkaZy1i2c982n3gFk/jHJw/Q9tAkydArY19UKfLXZQUMZhEXvfTm5ebE1R
 YlUtI/czICA7tzupJA+7n1KIqchco5xRZEgUsjWi1KgOmriwKGIq6c6TeV0+xRcq4aRm
 mUuA==
X-Gm-Message-State: AOJu0YyhlsBSC8Dj+laxDlI4B+vvN+z4tmNGuPMEW7uzdsdQDVhb/LYA
 fuGiVnvN3Lc0SPL4SQvIYt+a6eG2PHKF4jCg+9V3/ZQB7zzsrZ9UbWaPNMJK3HA=
X-Google-Smtp-Source: AGHT+IHAWrg8qRK6AZYhEs+t47vN/8OCCIixVZWOXrnHnOpCitooPhNhs+moVNdSthDRAt8USHwP1w==
X-Received: by 2002:a5d:4986:0:b0:33b:139e:9110 with SMTP id
 r6-20020a5d4986000000b0033b139e9110mr603630wrq.36.1707207468752; 
 Tue, 06 Feb 2024 00:17:48 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU3BzcUEkoM6juRR1EGp+PLKZxtOtBug1EJ4C0nP92GLAnLGzemAa2sr+2UeW8SX+HXIm5tAGSssUiSqoCjdq773ZxesH70yJdiR2w5jvn5nn1wScia8XUAUuznbFN8g4Y+jyjgXHrRPYleYecfBWF8eTghG8EgqaKlAGX5CikZbjOh5NUHhxmZ72HITcqKM/bjSICAdflkffgroAavUHFrMxcMoTnTd892daW+i5iN9Y//8nEMHlBtLqsxUYrRcphJqn5WVISWqu5aN4+9ga9VExroHbyLDVlsb8jyhC44RgvYZZhsgKLPEJ1pKHeh/0vCjpOh4VCLKGBPO1DaDN0ATLQ+geriTMo1NkVCpk6HJR8AcIwykzU4MaQ7/Z+rDgGuMTH7hyn8ngRd8bKQVuE/JwxmJ1/ZDq6HlZBzNxsPyZ5wjE2q8jfyaBFfSvLh3j2BuK40JSzeIaL/GMfzVRyprYfLf/ewWEM4MN9u0292Bzvx0g5/kxXqxkY3BVcVQIXuecNtOxj7nd+PmjzkqqzeZSM8HMKT2OANFevPDAQI2/o16li6V/8pRFLBJbGQ7OnCSCoWZDAVtUo7Qkc4VORA+PUQgAXIWOfMdfLG1iAS7n1gRj6aAQbfiIwRl3/OGA==
Received: from ?IPV6:2a01:e0a:982:cbb0:ba23:8574:fa8:28dd?
 ([2a01:e0a:982:cbb0:ba23:8574:fa8:28dd])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d67c2000000b0033b4335dce5sm1418976wrw.85.2024.02.06.00.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 00:17:48 -0800 (PST)
Message-ID: <30648f19-f25b-49cc-94f1-213bc96c67f4@linaro.org>
Date: Tue, 6 Feb 2024 09:17:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
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
References: <20240205-ltdc_mp13-v1-0-116d43ebba75@foss.st.com>
 <20240205-ltdc_mp13-v1-5-116d43ebba75@foss.st.com>
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
Organization: Linaro Developer Services
In-Reply-To: <20240205-ltdc_mp13-v1-5-116d43ebba75@foss.st.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 5/5] drm/panel: simple: push blanking
	limit on RK32FN48H
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

On 05/02/2024 10:26, Raphael Gallais-Pou wrote:
> Push horizontal front porch and vertical back porch blanking limit.
> This allows to get a 60 fps sharp.
> 
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>   drivers/gpu/drm/panel/panel-simple.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 7b286382ffb4..10b361d603be 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -3516,10 +3516,10 @@ static const struct display_timing rocktech_rk043fn48h_timing = {
>   	.pixelclock = { 6000000, 9000000, 12000000 },
>   	.hactive = { 480, 480, 480 },
>   	.hback_porch = { 8, 43, 43 },
> -	.hfront_porch = { 2, 8, 8 },
> +	.hfront_porch = { 2, 8, 10 },
>   	.hsync_len = { 1, 1, 1 },
>   	.vactive = { 272, 272, 272 },
> -	.vback_porch = { 2, 12, 12 },
> +	.vback_porch = { 2, 12, 26 },
>   	.vfront_porch = { 1, 4, 4 },
>   	.vsync_len = { 1, 10, 10 },
>   	.flags = DISPLAY_FLAGS_VSYNC_LOW | DISPLAY_FLAGS_HSYNC_LOW |
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
