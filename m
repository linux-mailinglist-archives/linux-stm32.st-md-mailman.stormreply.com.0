Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D1A220C2
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jan 2025 16:43:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1A739C78034;
	Wed, 29 Jan 2025 15:43:52 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFB72C78024
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 15:43:50 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-38a8b35e168so595528f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jan 2025 07:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738165430; x=1738770230;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=hPHIr1AdUQXL4S8PLOw7faEqsccJFgDRWTAC+UQvuk0=;
 b=K8U8FuMoOw7kJUDLwJwys5tEByt2MnfPfZ+E79pq2NKYQfN3l1R7Jiw7dy08RPFxqr
 /uJPrufpFu45Mr2SfTwEhFYC9vj5C9zJZYPwfe+UvHyS0cGMHZ7IKWuOiJSg2Z3AaVwq
 7XOXs1wemFS7mZLX335pO0f6Bbp927/2TH1g3Z+9NYXpM/M3v4CgyMQfj/vm45TqSaMT
 ZPaL0xpI0HsDpDYd5M7PPDo2Aa/1C1deYWBFlJxy3FHunKhVYWBEINVopTHznzsqs0xu
 hMPB0T1D4fqK/6UhrOEB0HK9atTJ+N5ZiYt0R1ZkeaoriTMkmh3RBOxPYPHjO3gP3xQn
 NEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738165430; x=1738770230;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hPHIr1AdUQXL4S8PLOw7faEqsccJFgDRWTAC+UQvuk0=;
 b=nYZ3vMnwb32YlYtGkVcFBIQOcfvpItwg3artsT9N7SXEWtQafa+a+s/zJ9dumvTE8s
 mcT/yMzfpXtCk6aCYVxfdLd0SADU9zW5aA5x8hhDPhBfTnD+DWO56u/NkR9vRZpmjYkH
 QahMeQC0HML4MO+TfWDj1K8Ybl9V9CJwFfClRiNyYtfpQQxqctM4ZS9LpASdgJ5SVXai
 ZIgHOy5T6+ePrQh+xaoc77CE+Y1vfqnRB/ROMYo4bD3dyp/4CVdQjKn6BcYX4JiZDVgN
 p9qNiUGBl3wuEHeUvIo2F9gIthHoPp6ZPWXfe1+9QVasb9L5hhRsERAQ+wZcVVDCOABT
 B4LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbBi/Gq1ipxcACaF+mm5zKQapYSqN7fvgp2VN2ARqpeCmcIt72QRJoZQVrOh41q4KskNm7lgBANC8mFQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwS0kPJk6fkCcWbtKoq2uXsLowOix1PXGUncQt1CNdewLZfYNXC
 9KwnDOsZa2DZqZ+YNbZrusbExpnca37IClAulScaoWurgIS+gUu7P6+v6a8zYsU=
X-Gm-Gg: ASbGncvWTavtFNXzt1SKx+WrivJOpEaUsV8PdM5k24KyjoDsPyHR52pddTAEKhONWaF
 nSFeWXxZnc1GwoZ5jPxm66IYuhAhdOVNCxFevsfcCx9O6510hJaqtrzWPSamOutvBXdDFPn5C/V
 mPyupCsGYsxZUEhDRlCGXVNH6x3Vo9hXNH48O9SzPnfcRpuPbiK66t8D67d/3bx/xLnZmbPYZiG
 jmkeDc2KcdJPTCGj4UwQpUSSGGFQtkYEfoWwvgmsHBiCrXtK2jS53L1imLzER0QtfWw0Y4W3uuo
 jMTCL6PeofHgzZqmb0o1S/rTatC3uLxDjRj8d0ebej3zyrZ95sbT6kByNtqmqfbmLJfM
X-Google-Smtp-Source: AGHT+IG+AzLiMQGtSlFoPMZbCjyIVlZSwQQSJOvatG/rHgk08wCvQOFvIicCJd/sEzgRT/WR6JlERw==
X-Received: by 2002:a05:6000:1f81:b0:38a:a019:30dd with SMTP id
 ffacd0b85a97d-38c50fe7e90mr3136677f8f.8.1738165430293; 
 Wed, 29 Jan 2025 07:43:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b25e:a614:863b:566e?
 ([2a01:e0a:982:cbb0:b25e:a614:863b:566e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a188689sm17390387f8f.48.2025.01.29.07.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jan 2025 07:43:49 -0800 (PST)
Message-ID: <c7c2f630-ee9d-4427-adc4-0d982f9e7593@linaro.org>
Date: Wed, 29 Jan 2025 16:43:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maxime Ripard <mripard@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-5-0d1609a29587@redhat.com>
 <ieknc4dm5ntnqaqz6zdlinphocm2omsn4ll34vlbrohqcddl43@kg35irldnkuw>
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
In-Reply-To: <ieknc4dm5ntnqaqz6zdlinphocm2omsn4ll34vlbrohqcddl43@kg35irldnkuw>
Cc: imx@lists.linux.dev, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, John Stultz <jstultz@google.com>,
 Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Simona Vetter <simona@ffwll.ch>, Marek Vasut <marex@denx.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Kevin Hilman <khilman@baylibre.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, Joel Stanley <joel@jms.id.au>,
 Orson Zhai <orsonzhai@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Alison Wang <alison.wang@nxp.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Fabio Estevam <festevam@gmail.com>, Tian Tao <tiantao6@hisilicon.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-stm32@st-md-mailman.stormreply.com, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Yongqin Liu <yongqin.liu@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 05/14] drm/meson: move to
 devm_platform_ioremap_resource() usage
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

On 29/01/2025 16:40, Maxime Ripard wrote:
> On Tue, Jan 28, 2025 at 05:29:29PM -0500, Anusha Srivatsa wrote:
>> Replace platform_get_resource_byname + devm_ioremap
>> with just devm_platform_ioremap_resource()
>>
>> Used Coccinelle to do this change. SmPl patch:
>> @rule_3@
>> identifier res;
>> expression ioremap;
>> identifier pdev;
>> constant mem;
>> expression name;
>> @@
>> -struct resource *res;
>> ...
>> -res = platform_get_resource_byname(pdev,mem,name);
>> <...
>> -if (!res) {
>> -...
>> -}
>> ...>
>> -ioremap = devm_ioremap(...);
>> +ioremap = devm_platform_ioremap_resource_byname(pdev,name);
>>
>> Cc: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>> ---
>>   drivers/gpu/drm/meson/meson_drv.c | 9 +--------
>>   1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index 81d2ee37e7732dca89d02347b9c972300b38771a..6c805805b7a7f675f8bb03944318972eb4df864e 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -184,7 +184,6 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>   	const struct meson_drm_match_data *match;
>>   	struct meson_drm *priv;
>>   	struct drm_device *drm;
>> -	struct resource *res;
>>   	void __iomem *regs;
>>   	int ret, i;
>>   
>> @@ -220,14 +219,8 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>   	}
>>   
>>   	priv->io_base = regs;
>> -
>> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
>> -	if (!res) {
>> -		ret = -EINVAL;
>> -		goto free_drm;
>> -	}
>>   	/* Simply ioremap since it may be a shared register zone */
>> -	regs = devm_ioremap(dev, res->start, resource_size(res));
>> +	regs = devm_platform_ioremap_resource_byname(pdev, "hhi");
> 
> Given the comment, this one should probably be skipped.
> 
Yes please skip this one.

Thanks,
Neil

> Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
