Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CE504642434
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 09:13:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5D1AAC65E60;
	Mon,  5 Dec 2022 08:13:23 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D129CC65E5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 08:13:21 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id f18so17348527wrj.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 00:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=9HQObmrwSMX8vA4JHKJaj2b6CjK14qWpD9rpN9nU90U=;
 b=hH8EH4emacWt/i3dinMgGS8nSqTXKGuNzRdVns89xp9lootuIhBo2OtYbrD8lkN1nC
 My+UVHjJw/oudKcISaxuAMfMeXv9FW/cX5R/Vkd4B1O5WU08dx8bw7PBC+kidyn/bINY
 qZi5EgJQD3FezXn6kyyA4EJlsO+b7YSOUK7A5lZrlCP9/CHrKE+R1EnIkfjwppZsZBQT
 4KFTZWay7o3jQZ1jVQsjLLUyGtdXHx1XVkRvxjI44hT/vnfsNMlzAMnEWZWTfr8cl61h
 SdxwhsbqUnqud1MpVoNIX6o7ozKyrgJU3rXXWjygMst1MvcCv7RojdyVlzk6dj08P93d
 bo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9HQObmrwSMX8vA4JHKJaj2b6CjK14qWpD9rpN9nU90U=;
 b=QZEC8g0j8jsYkBaG5VMRiU+JqGfUq9pJZYUUmwPzKQUBhK76wjWvK00qPB+WjzDoZB
 7OC0jhNlNm5tnTeTq1wFikvJSqzh0FR+VAgv7FK1WDSzs7+f9P+52WXgBAvlQlRv1PBX
 EkxGKyI5cfrTXY4MJhjaGIdhc9dP7CrFVeJh02UofQnUaiUq8QOrITP+HWrFUi/aXYaL
 i7z/ugP4osgwDKIdzo/DZ2pJJRuH9wPojzBho13+ci0uijj78R+6utyhTbTZ3wBAke+m
 +h2uK9X3nl6c/ui3vHjFx5yzdHE8G38Y6oQkt93XX7nr9Mud0T3LrS+hIi3u8I6FDF+i
 zg9w==
X-Gm-Message-State: ANoB5pm48nAC5IZmF594OduA6+UKb1QIfxJi2/fEnvYnZyBI3e5WJFiz
 DktY7+EEoy4nC0/kNWhLciPPhw==
X-Google-Smtp-Source: AA0mqf7ai5wgiIRIYciqsXgXnPof4ogfREHeWVAWQiK2meZ1Z7k5m4sdbH7en5NgAmqIhis69vieQA==
X-Received: by 2002:a05:6000:1c15:b0:242:28c9:d112 with SMTP id
 ba21-20020a0560001c1500b0024228c9d112mr15235142wrb.294.1670228001367; 
 Mon, 05 Dec 2022 00:13:21 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a5d4402000000b00226dba960b4sm13376083wrq.3.2022.12.05.00.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 00:13:20 -0800 (PST)
Message-ID: <b258ce94-627f-c029-6aa5-3723a87c0002@linaro.org>
Date: Mon, 5 Dec 2022 09:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Joe Tessler
 <jrt@google.com>, Yannick Fertre <yannick.fertre@foss.st.com>,
 Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 1/9] media: dt-bindings: amlogic,
 meson-gx-ao-cec: move to cec subfolder
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

On 04/12/2022 19:29, Krzysztof Kozlowski wrote:
> Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
> unneeded quotes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
>   MAINTAINERS                                                   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
>   rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)

<snip>


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
