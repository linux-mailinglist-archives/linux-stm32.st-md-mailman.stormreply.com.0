Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB29A671C1
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Mar 2025 11:48:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12B71C78002;
	Tue, 18 Mar 2025 10:48:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F983C71280
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 10:48:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso22622795e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Mar 2025 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1742294882; x=1742899682;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=lQHq2hCTlCvty8OK/ZzDJdJz20qlST0ei05aCL2P84s=;
 b=C2YmjBbKWJC12CctLXjSfyIvGATgI9nygtCrk7bWbJr0LrjFh2U4ot8X4f3TJ1v/1L
 Ebu75cqa6IogGlZATxBHT2Hs15IxBb6OUwvUjMYoNxDtCEmv0K40920fulj46DP5S8sv
 plRXdbDjcEDQbSjgNWCSWfksBcwqrK90dlvVbdoFn3cnfhoTL8+ykL/G+Mx4L7IFvsVb
 ChIJp4h0VizTvAbYIDJIPr+6O0uak2fLDa30XYOvrwUefvAfRV710jo4yaUVEaWimtr6
 E1ecjnwfmI8R8cUofvRX+y1qOlyaOS2jjrStEQ+5GfX1P2J4SV5gYPgwXiGjRixhlCx/
 1GtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742294882; x=1742899682;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lQHq2hCTlCvty8OK/ZzDJdJz20qlST0ei05aCL2P84s=;
 b=L63G39s4lc6qsBzNKKDVKAESWRRdHQ4mCbNGr4b3VX8bdQUsn/JTAuQj1DqNm5LLhs
 B9f22TeWgYDdfO0tC9Wf4HICZZYxjn4YBhfNQD39gp7HP+dBZiWPjndeaW7QYqDAlwG9
 EIwpEk0SbmACBVocOzcAIA0fEpwWvwf788g81VOVKg+NQT04S7Cpn6cUSnE0iz8pPjT+
 0/cF5Ztd9gugeSj1174kLM+4yvZHReyIOHmbbSvZ90AcTiKPEyiPtX2F2H6oncpbI2Lz
 /2OWDIQk/+zueyWW2xDcUmjlFJtDX7y/XFDqHLCB7rpRQTb2Xb3uBR4Yghj/FIvCJ9fU
 HkMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuN8SadVHIGveZ+iEDAML2Cgcw4xsTNC4UrOrz0Qg7qPerpdmpk06OJgKHp1tQbDpv3noZ/yPdi3vwjQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yws6IHTSeNUBT20U4EUAUtASYhQNYVGKmBhJr19kwmjhCgwzaJ0
 5wRNSL9eWh0v28zgdkBv29fJp+Fw7XFptZGntP2Wl/uZXn2HLrUzj6KybioWgBk=
X-Gm-Gg: ASbGnctTmYPPGMAgdgi/ZuX6Etqsjl/vV839MVhEIFekc/M1l1LfS5sIR+TJ4/Q0tQ2
 v0vZp6hv8x4gwWTOixJoAuNXRkjEZZe29v5qxFcrTifRP9eG5Z0uycN5FrpMZfDYXAuOkBORRwx
 cmPiXSKMe2+yWJKWTEQuduH3gxg80DMRE8GkHA8tmlShZBgwcF7hxwr6ZAgoUHj6EQseoxSs2SR
 DoHFRug/DyYtFg9ffTAZ6ZGmEZLtF29SE97IxaxK+KrL/tIIWjn7BXsQVfhEkq1gTIV4WEVtZ4U
 yAmnantiriCaETCYzz7qBu8yUM7LuHGkQ+TJeH/MD1JcR8jCXzycHG9YL8Np2Z968w70aBT3L/F
 +tTvRD51UKQbsrKDO06+n8A==
X-Google-Smtp-Source: AGHT+IEvqQm0L33zdjtiaR0kLcpkjVK78vmD/D0qYWBavdIvwJwnojSo58SFbe1jRfiwWGTyvooy4Q==
X-Received: by 2002:a05:600c:1d85:b0:43c:fe15:41e1 with SMTP id
 5b1f17b1804b1-43d3fca93dfmr2270645e9.4.1742294882536; 
 Tue, 18 Mar 2025 03:48:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff?
 ([2a01:e0a:3d9:2080:eac1:f2d4:84a8:c5ff])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffc4173sm131457905e9.20.2025.03.18.03.48.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 03:48:02 -0700 (PDT)
Message-ID: <a2ecebf5-9d37-49ad-9422-f984d1da8c57@linaro.org>
Date: Tue, 18 Mar 2025 11:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20250317232426.952188-1-robh@kernel.org>
 <20250317232426.952188-4-robh@kernel.org>
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
In-Reply-To: <20250317232426.952188-4-robh@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/3] remoteproc: Use
 of_reserved_mem_region_* functions for "memory-region"
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

On 18/03/2025 00:24, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
> 
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> For v6.16
> 
>   drivers/remoteproc/imx_dsp_rproc.c        | 44 ++++++---------
>   drivers/remoteproc/imx_rproc.c            | 65 ++++++++-------------
>   drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++-----
>   drivers/remoteproc/qcom_q6v5_mss.c        | 60 +++++++-------------
>   drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++---------------
>   drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++----
>   drivers/remoteproc/qcom_wcnss.c           | 23 +++-----
>   drivers/remoteproc/rcar_rproc.c           | 36 +++++-------
>   drivers/remoteproc/st_remoteproc.c        | 39 ++++++-------
>   drivers/remoteproc/stm32_rproc.c          | 42 ++++++--------
>   drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 ++++-----
>   drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 ++++-----
>   drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 ++++-----
>   drivers/remoteproc/xlnx_r5_remoteproc.c   | 49 ++++++----------
>   14 files changed, 213 insertions(+), 347 deletions(-)
> 
<snip>

I get:
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_q6v5_adsp.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_q6v5_pas.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/qcom_wcnss_pil.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_dsp_remoteproc.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_m4_remoteproc.ko] undefined!
ERROR: modpost: "devm_ioremap_resource_wc" [drivers/remoteproc/ti_k3_r5_remoteproc.ko] undefined!

when building with arm64 defconfig. I guess a proper:
EXPORT_SYMBOL(devm_ioremap_resource_wc)
is missing.

Neil

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
