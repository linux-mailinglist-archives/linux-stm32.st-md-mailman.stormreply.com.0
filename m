Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ECD6C0166
	for <lists+linux-stm32@lfdr.de>; Sun, 19 Mar 2023 13:07:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6B3F4C6A5E7;
	Sun, 19 Mar 2023 12:07:11 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD5A3C57B6A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 12:07:10 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id b20so3840244edd.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 19 Mar 2023 05:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679227630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
 b=TzAXlqE8TgfprcWtggNsM5B4SQJQtCXYoRCn8uqjU6Dppl3AIp4F/El+x+T+cy9/Hp
 oAdm77wfFODxSKeyHAiXXUxrdkhRop2rDx79qH1f2hq0fJQiR6YqC0/5p587b7PhB50N
 Az1pLOxhlA4adj+8SICk15XWO3UofGCHYaEdHmQfeW5uy/uSbfi0mu2/WOM2SoE5NwK9
 XKhHart75hNrLBOJU0s4puBzvV/H170DSekttmS/Ku+kn8xvWyBxg94fAif55VGfJ2lc
 s8ZrCs9dbcSnm0K6ktftWRN9UtNVNOy7IHzXjQI/cq3HVT1durOmcBipUAdQzSZ9tz+J
 7FNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679227630;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
 b=X89vQJxNDF+dhc/+RwKO7QgVvZj5zWKWm+/SMPao4gR5wrO6v8gk4Yhy23TkMxtBZS
 1NxIF9gV3D1ILUgVHkBxhYRZcnfT7HQ+kVk8bKaNliXCqo5andmpK6KKQgox2MCnxOOA
 IE0nz1XXoxQQ4EBKvPILGN+87mf24Eb/acrq2p9PO7nOajen51SATWOxdVo7KY6BKxR8
 gEP8ELqe9aj2ZML2RWUPIkTA77RLW4z+UbJdU/LXNpp1PS/2m4ZDA0lZq51M9ZI0nrNK
 KCAUsa9n3MMsjRDsrEk1URmNxLKjpox8pq5Zl/t2a04iOl9y5mHfvQn6cvCpcJysk56Y
 9WHw==
X-Gm-Message-State: AO0yUKUmVm3oxaazdc3rz7u10+6hDw822khHb1Tu9R1OPJ9y2cgtpVfw
 oUDIhulcT9db0trmJsJckSj7Ng==
X-Google-Smtp-Source: AK7set8ojqGhOAjmBHwzN76QhQtwOWV8Psp9NGV0PffUGEU20N+02MFB5rvCOFkPKNTFQrrwRiSzoQ==
X-Received: by 2002:a17:906:40c2:b0:91f:32f9:82f0 with SMTP id
 a2-20020a17090640c200b0091f32f982f0mr5542602ejk.29.1679227630370; 
 Sun, 19 Mar 2023 05:07:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d?
 ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
 by smtp.gmail.com with ESMTPSA id
 jj4-20020a170907984400b009323f08827dsm2744307ejc.13.2023.03.19.05.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Mar 2023 05:07:10 -0700 (PDT)
Message-ID: <68a5d8d8-b70a-e58e-e38e-5f185121e01a@linaro.org>
Date: Sun, 19 Mar 2023 13:07:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230317233631.3968509-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233631.3968509-1-robh@kernel.org>
X-Topics: 
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: mtd: Drop unneeded quotes
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

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
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
