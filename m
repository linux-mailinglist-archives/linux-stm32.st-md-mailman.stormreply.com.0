Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 521C3859D63
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 08:48:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1302CC71285;
	Mon, 19 Feb 2024 07:48:18 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED971C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 06:25:12 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d241ff062cso843581fa.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 18 Feb 2024 22:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tuxon.dev; s=google; t=1708323912; x=1708928712;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zy/lENoBOBZbXj8shKgVOAS0kIgCPAbaRSp31XzJm0E=;
 b=ITYjNDr9d50y+4kdYYnUznHUna9iKJElcXUk8y5/Mff6KchMfKKMyefdceiyqIwmwa
 ovbOkjhe1xC/rbiPDaRBwJT8MqT+mqzkm/1LGTsjxOl2VhHHqVifsiqZ4QqQxgNgYypz
 vPGjDithPWUTMiwklyDPahqCe4zFy26J8Gss6GmGQUn6HujKZazPLMjPPa40rGg/R6Vs
 BjHjUrLZbjRgZy2Fhlo8KAMM09pnZmNnB86CSoOFZ9QEyPGJ0Q9BVWx7AHMpSkJmcOLV
 QsAQ19r4Bhn5Wn5kNZzHq5zbQr3ZigDxz4M6RMBKRIAj8YlIZCdI8939cN1BggCYUt8u
 6qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708323912; x=1708928712;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Zy/lENoBOBZbXj8shKgVOAS0kIgCPAbaRSp31XzJm0E=;
 b=Cud6dGDJAiv9t8DPpEM4HD1MZ0fGctNCOEUfQZ3Cl4RW8v+NWaZb1VEZlmWwK8RH/9
 qZSBsTxuPQbH14o62h46Nb1XS8FgIUFykRNw7BO2rp0TXEI5pQWlVzLlFaWRcXDHsFIt
 u/y3b7eB2JTjfYg6GEUGq1NzBwyf8o8w8tugMqD2aTqawg1YdVbb9tTF27fIzEms21cY
 nTjeAdGacRDELkKwVqi5XV1TxdAXJV0uaN1o3grGBOTOTjd+ZfiOMIC9Ht0H+Wpx4jTb
 rWt1MMnlkJ7IDddhGbESb1rIs3QKk0xrDxZeWk09RyeorvoNKpWMgaQ+172jBr+EYjbg
 YCFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwhU2/rRGldkFe9purZmuR8E0L4GZp0MVkVZ4ZIzPyWSrwxOSFfPsXxcIpfu5YwHhL27tfMki63961P6me6F4jqQpnLVaZdggXERu7RDm5BWn3TlyFMOwO
X-Gm-Message-State: AOJu0YwWpDf+7sDRpU6IluSkStpoCDbX5+oWzsFNUFEQRQ370ru3MQoa
 IsYOrHjHVvYGJg4ZbTEOQcTjlk3jS/kUyAH1F26Dnp6H1u+YuRD3TH8GUwijZCo=
X-Google-Smtp-Source: AGHT+IGP6skyrpQ+LHssyeFVL9x4R2C5PmtB+z/bDgXXtY+zd/lWWTMfb39ns1BsA6xd3vrJYLpPRQ==
X-Received: by 2002:a2e:99c3:0:b0:2d2:3b20:72ba with SMTP id
 l3-20020a2e99c3000000b002d23b2072bamr755168ljj.50.1708323911958; 
 Sun, 18 Feb 2024 22:25:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a05600c044a00b004122fbf9253sm10177702wmb.39.2024.02.18.22.25.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Feb 2024 22:25:11 -0800 (PST)
Message-ID: <e43727bd-d83d-4271-9871-ff995c8e7d03@tuxon.dev>
Date: Mon, 19 Feb 2024 08:25:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Nishanth Menon <nm@ti.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 NXP Linux Team <linux-imx@nxp.com>, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Mon, 19 Feb 2024 07:48:15 +0000
Subject: Re: [Linux-stm32] [PATCH] clk: constify the of_phandle_args
 argument of of_clk_provider
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



On 08.02.2024 18:37, Krzysztof Kozlowski wrote:
> None of the implementations of the get() and get_hw() callbacks of
> "struct of_clk_provider" modify the contents of received of_phandle_args
> pointer.  They treat it as read-only variable used to find the clock to
> return.  Make obvious that implementations are not supposed to modify
> the of_phandle_args, by making it a pointer to const.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/at91/pmc.c                        |  3 +-
>  drivers/clk/at91/pmc.h                        |  3 +-

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
