Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A46C6677F54
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 16:16:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5F694C69055;
	Mon, 23 Jan 2023 15:16:46 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 15182C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 15:16:45 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id j17so9314005wms.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 07:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=oXHlh1GVe6XHIGjfxqBlGpday517k1tv+6ix4arA+Zg=;
 b=mTElaErKpyr/9+bfvnELgYwdkqnRrQO/qiv+5Uq27OCgDaLZ8aaksxAjd9sARIF4ia
 /MKEh6h6m5FSzyCivP3eglyAgdt3BzjqP26wkFUqzy2+/dG/8NmUZ9FlogJnpdCcldb2
 acKe0v4SIDaiXlfpQSpvIWPAs+IMm42n+sNx5ilNe2CRyMLhb+Qf8XUxMGpucgpCVr/5
 0xYCWc18aYTj2u9uyVm24v9OmlUdvlO9ti00jk7Cxckx4+EiBdL7LzF4JhLmGJ/0jnTk
 phGT5/FRGPYaX0W8aQOgkpWZLLlyatLsvD9LaqDBhKUfBRUYuNa/ewbjRDB8VrtWU+Az
 k2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oXHlh1GVe6XHIGjfxqBlGpday517k1tv+6ix4arA+Zg=;
 b=PSAu3fLmK4qsl5Cq67b/y9a9LbR6GwZocg8XkVTPTzUDg9GNN3B7DQOnHeOB9wwbV2
 N5DjcsGtKpwsyO2FyQaJj8SGSYbjjP7qHA6XzP3mq9yLObpa7odG/Ljzwb/0wYZOpRiv
 XSIenvIC+iz7cEJ3VPynmsN1WOcCIqsXSCzYHPssKrsaps2J4a1/leVm5iwRCVW/kOsU
 zoaYfNGMOUmdAO18jOMwcajEZSg3qePsxbfeW1Ms+C1hAbnlPOkpHU1hug377fhKV5mf
 edG94fMokVRdTob2bH4/U09W0GzuZfXr09qxtZEVHaCsKS26bEl1MNpaOzt1gjgJsUlp
 xbYw==
X-Gm-Message-State: AFqh2kq6SQivny/L7oGIZQqJWVlus3BbPNGf0UoRBNMrptoin/dXe4PG
 AQxWM0pMlisuBFAJvlROuzJQhw==
X-Google-Smtp-Source: AMrXdXv4pjrlJCiDM72DBhh38Wa+y+wDQd0b3eQquuYXJF+qOVFv9nVUL1oHgw77dN4sbV8WLhp+iQ==
X-Received: by 2002:a05:600c:1e1d:b0:3cf:674a:aefe with SMTP id
 ay29-20020a05600c1e1d00b003cf674aaefemr24094598wmb.22.1674487004649; 
 Mon, 23 Jan 2023 07:16:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b3d5:343d:5dc9:ee00?
 ([2a01:e0a:982:cbb0:b3d5:343d:5dc9:ee00])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a05600c188f00b003db122d5ac2sm10449596wmp.15.2023.01.23.07.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 07:16:43 -0800 (PST)
Message-ID: <767eb8e4-fba7-e25b-bcd3-3f05db9a6d80@linaro.org>
Date: Mon, 23 Jan 2023 16:16:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Michal Simek
 <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>, Le Ray
 <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 01/13] dt-bindings: serial: amlogic,
 meson-uart: allow other serial properties
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

On 23/01/2023 16:12, Krzysztof Kozlowski wrote:
> Reference common serial properties bindings to allow typical serial
> properties:
> 
>    meson-axg-jethome-jethub-j100.dtb: serial@23000: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../devicetree/bindings/serial/amlogic,meson-uart.yaml       | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
