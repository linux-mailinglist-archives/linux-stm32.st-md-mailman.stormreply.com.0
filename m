Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B74E1642443
	for <lists+linux-stm32@lfdr.de>; Mon,  5 Dec 2022 09:14:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78A2DC65E60;
	Mon,  5 Dec 2022 08:14:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A697FC65E5D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  5 Dec 2022 08:14:08 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id o5so17382678wrm.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 05 Dec 2022 00:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=mOAaEDQ/+KQ94HSAsqFzfVKtm6woYUzL9fBYQMgBuLc=;
 b=e2HPFLjESRMzz+xhAqeTVs6J7M+U5l/REgtnswgMQLAoEHF/udvkXCFDUTJYrrvMGi
 jHHsPiLyYeKKoRaxUjgoK7P8q2ezNypfzTTxa0qlXXVzoCFdagY3iEM9fu6Pl/3SlkM5
 kNfB4w+ejaH0GTXmk5Cgws3weouY5xJ4dC82oEfJbV//rO+LNGvQzpbG+y9ly+gIi1d2
 ejLRyrd3502i1iV1ag9UqznyKebBPAEpbOWpMlg++nslY0vV10UABAICcYEElgww1IRz
 k3xU+st9iv1wiJ29GiJOjUTyFkkR0atN/Gc/rgw/RldEa7aJdlE5Lm+QB5Jf7FUrW3yh
 0b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mOAaEDQ/+KQ94HSAsqFzfVKtm6woYUzL9fBYQMgBuLc=;
 b=fH2ukhUSBNAdjreS+f/skKN/9Ag+sfcuMSjDbUJTmUSfbaKzJGAHsG4oLtFD6fV4qg
 CqSzG6T+RJHkf+i2j/Z2UXGR9tJcU3w25A3ntwcGbuF4z91GxASDbKmuRkUMNUcB7z17
 KAyqS9OemqxNNzXFWUDPt/vBpZNnvu3nZivBHwv6YtB3VNRQCxMnqo0StQhGT+xeaSEl
 ECk5ZAOM5ovgQ3pMkDDPPrMA4QUpNwZf30CfCT7pvin8WaCluBlnazfCyXGKH2YObdnj
 yoHo8wyTJEbshtwUyvAoAckdDsI8JGOUjkm0E2chDQhoNuLx9tKabX+veblW1aI28VKB
 yOAQ==
X-Gm-Message-State: ANoB5pkCJ5JRnLES1G+6at154iZfmFwDtRWKoli1rx//2r6TBEhbBUWD
 Ddao2eDmCrhbaPQuvBHJXM1MKg==
X-Google-Smtp-Source: AA0mqf5Ch2HHmf8vDl45Rz3/ktkKscqe8a3oGxpy7NLT/9M1FQnwqH+PvbPyBevvGm9zi9w+mCtgXw==
X-Received: by 2002:a5d:5685:0:b0:235:f0a6:fafd with SMTP id
 f5-20020a5d5685000000b00235f0a6fafdmr50278628wrv.75.1670228048267; 
 Mon, 05 Dec 2022 00:14:08 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a05600c0a0a00b003c70191f267sm23656674wmp.39.2022.12.05.00.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 00:14:07 -0800 (PST)
Message-ID: <938d6732-adc8-5e45-6177-33cfe8c1ab70@linaro.org>
Date: Mon, 5 Dec 2022 09:14:06 +0100
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
 <20221204182908.138910-4-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221204182908.138910-4-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 4/9] media: dt-bindings: amlogic,
 meson-gx-ao-cec: reference common CEC properties
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
> Reference common HDMI CEC adapter properties to simplify the binding and
> have only one place of definition for common properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/media/cec/amlogic,meson-gx-ao-cec.yaml        | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 

<snip>


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
