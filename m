Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A1A6E4639
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Apr 2023 13:18:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FEC9C6B453;
	Mon, 17 Apr 2023 11:18:34 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A03FC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 16:48:08 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 k36-20020a17090a4ca700b0024770df9897so507723pjh.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681577287; x=1684169287;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=c07ixhDHpQnBulkQZ2Nw0JwAr36rnVLPuwgUhNxAuT8=;
 b=VAm7lLW2qbtDmFHkaygXoNVicYRA7IQ6GgoHgPsyCQNfa+OPX88B/mb3fyqCdcZYlB
 Qb6vBWg9yf0V1FZ1UQn8AGxwQkqUXoHNh66IZq4PycRZbyKno5D9WgQs5jpy9jFw2OXy
 ce4dYeMqFtLPPcZeThBJekZ6hAAsuKU1TctgtzHrqbIhKsI2kAQJ4q4Gs3G6ONvGbrWK
 Ne6ZQXeA5MJrTDw9XVhAgoii6otPIhbaurxAW8ahIEkNhLiakjovuK/CPOrgqQXhSbEn
 qRGynIgdugnm3uE6whko3Q6+snSfYAMf2eC7Dp6jXGfBroLZjjfXXrZ1Yl9zLi2CHTyD
 LS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681577287; x=1684169287;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c07ixhDHpQnBulkQZ2Nw0JwAr36rnVLPuwgUhNxAuT8=;
 b=WvGUy5eBDXiQbcu48tMcxz7zdes6d/2TuWSKtHczIa4+IuPsW1XkmG4jWZL2RGuPbb
 /n1hW1i86G2+Y7zJfNgWT0wstrDYU2+KbCM+VDCYYcRmgDQK2UORzVff4uMQPMg6x8bY
 ROU0Ispmy8MoBUz2tApAXwwvpCQmb8ITk+J6itqDnLUYgw14sDVzAJyGbvxD1cnvV0iH
 bpuQyakEcbxxT7s1NJrRSOsjuabWTKSS39png/8qQn/WOuS7MnEYL1VZZ5Tumg0zUJZT
 P/4pzSEJ4s/VRIi5WeNd/7CLkMgpGIxrYCJBOQ5rHMS33nMdqRogleUNVIvxbhIf28GV
 +q4g==
X-Gm-Message-State: AAQBX9dVOLsP2xIVWFZBdVzjMbVTIic7c7D1JVTJyiUQA3p5Vhd9Zuot
 CwFGFTbJVFRsUFR3IS7AaUI=
X-Google-Smtp-Source: AKy350asRVcaBN4vEj52+Al3i6LdhYun2dQh4zNs0zIu8tfWua87lcM2Lbo7pD9ZdRNAVxvnTiBCow==
X-Received: by 2002:a17:90a:f409:b0:247:900:12db with SMTP id
 ch9-20020a17090af40900b00247090012dbmr9261041pjb.24.1681577286671; 
 Sat, 15 Apr 2023 09:48:06 -0700 (PDT)
Received: from [192.168.86.135] ([136.52.74.64])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a65498b000000b004e28be19d1csm4492195pgs.32.2023.04.15.09.48.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Apr 2023 09:48:06 -0700 (PDT)
Message-ID: <f059c09d-b9a4-d86b-e4bb-1aea096263f2@gmail.com>
Date: Sat, 15 Apr 2023 09:48:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Julius Werner <jwerner@chromium.org>, Evan Benn <evanbenn@chromium.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Sander Vanheule <sander@svanheule.net>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Fu Wei <fu.wei@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>,
 Eugen Hristev <eugen.hristev@collabora.com>, =?UTF-8?B?77+9ZWNraQ==?=
 <rafal@milecki.pl>, Linus Walleij <linus.walleij@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>, Anson Huang <Anson.Huang@nxp.com>,
 Robert Marko <robert.marko@sartura.hr>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Jamie Iles <jamie@jamieiles.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
 Srinivas Neeli <srinivas.neeli@xilinx.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
From: Justin Chen <justinpopo6@gmail.com>
In-Reply-To: <20230415095112.51257-2-krzysztof.kozlowski@linaro.org>
X-Mailman-Approved-At: Mon, 17 Apr 2023 11:18:33 +0000
Subject: Re: [Linux-stm32] [PATCH 2/6] dt-bindings: watchdog: indentation,
 quotes and white-space cleanup
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 4/15/2023 2:51 AM, Krzysztof Kozlowski wrote:
> Minor cleanup without functional impact:
> 1. Indent DTS examples to preferred four-spaces (more readable for DTS),
> 2. Drop unneeded quotes,
> 3. Add/drop blank lines to make the code readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/watchdog/brcm,bcm7038-wdt.yaml   |  6 ++--

Acked-by: Justin Chen <justinpopo6@gmail.com>

Justin

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
