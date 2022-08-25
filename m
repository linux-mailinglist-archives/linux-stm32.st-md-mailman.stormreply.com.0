Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E345A08A9
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 08:13:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 10802C5EC76;
	Thu, 25 Aug 2022 06:13:14 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CE1CC03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 06:13:12 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id u24so12851444lji.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Aug 2022 23:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=wXqYQNt6cQwwovEWaPctQuIwu12r6o/ryFEQHXvmidw=;
 b=Z8V/D1iHr+3qt3pSFcQ5ZOeH0iO4G/pHn+XoNotaIYjxtt+oIh0RJD9YL3fzn6NmF2
 keRguEOY+JCT3rPJ4clH8kP1+xBJEQvelpo2RA91EyugRKUr7jACpJxh49EkA75pYy+R
 4u1FzXdV5fEX3vnN7Uuu1Tcxfrs4J3riE0OLKIGGS8Wuio93l6VtWFG3NUMbWDRZ2XIj
 m3cArYVlka9n7JbWg2A0+Pbrvx+Afr3ku+XlfM8+eqZ6HURCFjdxteLrXE0IuPmQJzai
 lUJDfZtzcC0W0+lYdbZeAgdnRKGwUbTbD/6hq31m3HOs5yzAyK5n0yqIel30J6Tw8bSs
 OHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=wXqYQNt6cQwwovEWaPctQuIwu12r6o/ryFEQHXvmidw=;
 b=xoCSVSgpypRjXMfNH8Kq8P7U6781x+dFt2m+Y+W1mgfJZvpfkjMspOk0wNaEtaXlKS
 XpURoVOz6l8aEDeIUkOoa/g4oMB7VkldQLm5HFzJR+7iqli6y0fL3i/XEvW/xPy8o6IF
 wSeqbFpCbzajSP8sFgsx8CXs4TMVcCw8AIGPBNg+t314vNTmyqu/8iwmq83OUXWxjkN9
 ojoFJyuGGpQSH9kizZCfvlBMPg/tSvcQQgKZOnjOQTlglmTA3AzlDYnDGws/VxjNXuZB
 lULT1g/GMuP02ugA1CXE13o7p8q+p9bmnV5aMjb2D4KhYoSdZ4nYNsmGfoHT2CwZ3bMj
 FuSg==
X-Gm-Message-State: ACgBeo3Cnu+/TAUt5LPGFPCEJAzRDkEUDRBavDeNZkZpHdseAoVU6I27
 OBfpdkfjQ5kY790HogOmawYYmg==
X-Google-Smtp-Source: AA6agR4m4Z9GwEQ+k4jSc0Z8Nk2/b5GFxRJY/8LmssR1LVZFSvwsKEH0v/tzq4so1SvajWcwWWcQxw==
X-Received: by 2002:a2e:9913:0:b0:261:ccfa:da6d with SMTP id
 v19-20020a2e9913000000b00261ccfada6dmr580559lji.269.1661407991448; 
 Wed, 24 Aug 2022 23:13:11 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 p3-20020ac24ec3000000b00492b494c4e8sm301859lfr.298.2022.08.24.23.13.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 23:13:10 -0700 (PDT)
Message-ID: <9f293197-b4f9-c53c-ead4-08e2113d9c8d@linaro.org>
Date: Thu, 25 Aug 2022 09:13:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Tim Harvey <tharvey@gateworks.com>, Robert Jones <rjones@gateworks.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Maxime Ripard <mripard@kernel.org>, - <patches@opensource.cirrus.com>,
 Steve Twiss <stwiss.opensource@diasemi.com>, Chris Zhong
 <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>,
 Alistair Francis <alistair@alistair23.me>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>, Renner Berthing <kernel@esmil.dk>
References: <20220823145649.3118479-4-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145649.3118479-4-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mfd: Add missing
 (unevaluated|additional)Properties on child nodes
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

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
