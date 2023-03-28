Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5B16CB76E
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Mar 2023 08:44:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0FB3C6A5F2;
	Tue, 28 Mar 2023 06:44:56 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 40E96C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Mar 2023 06:44:55 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id x3so45287445edb.10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 27 Mar 2023 23:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679985894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nmTvziNt2VFrSmXaXHn7cfTQldiBzclyda4PoCjJxWE=;
 b=KDvjJ+sJSVFfF+ax9cNRTuZm3PPD4QOVnSoLIozYu62wHnN0LvthEFWDLtXVvroHmO
 UG9miq8QhrSuSD27nq641NkuPALs5ipEHnV2igK6U9zVyewBXLMQOl9i+yOXyBoC7lO5
 +RWiBPkGLmNJk6NBYnc5sgw9mquFl1aSyyfIb0YeNCzFf7oPSekfsQhhlM7O4frh3zA2
 mbjauxBgowvPV19/w2zFI47p57F/g/8S6qlIcTdtJ7NDO09LanXxtC3z2GTab4qNsumB
 F9bLEszOEd2ps5tmD3bCfc0BI90KsOK12rR+l5AvfV/oKzqwipnPXF382hkkXduQ1Hu6
 LtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679985894;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nmTvziNt2VFrSmXaXHn7cfTQldiBzclyda4PoCjJxWE=;
 b=uo+sKjEUsSgGOVmja36b7QmIglN9lObFuk8L5VrSARf27OY8KF42sqnfknKX0pUipy
 R8e/eL0XQPp5U8ONrW17/e7a3Sn94VzqJO4O44xJe7MhJAGkIzeNnPQkGGg+RiLmHS72
 1X+qFe/YUhONPMlR0YACTI5o2NcwZT7ovWweeruRNR5snUKwAjD1e4SGm3JV53Uhg+x0
 vFOaU4kkmEFHGCXmCRmbdLhlpmkcSY1P7XtO4keVYRzIdG1Qe7oP7E+mbh5cmKDe22mQ
 1pQX2JV3GOcwWoOwMA6Pw21jeuIQAtHSGRqYT2Hlh2xlVrVHm6JipqiGRvOxFUaD750o
 NHWw==
X-Gm-Message-State: AAQBX9e/KQRsy+CSjY3ZNzf0BWxv+aXSKgfGqACY4wuKKOY25pZ+dKWO
 OXiD9tzPpNaykALYi+luNeEQ/w==
X-Google-Smtp-Source: AKy350Yo2Rt1rOFhXVKxwzhnMFISblPFU1CUUdS7F8h8GwafujSMEOGbp0rS44wexna8I2I5SC9t/w==
X-Received: by 2002:a17:906:9f04:b0:944:8c30:830d with SMTP id
 fy4-20020a1709069f0400b009448c30830dmr7483214ejc.42.1679985894744; 
 Mon, 27 Mar 2023 23:44:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6?
 ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a50c082000000b005002daeb27asm15465414edf.37.2023.03.27.23.44.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 23:44:54 -0700 (PDT)
Message-ID: <06919af5-a518-2da8-5cd0-ac657948b6c3@linaro.org>
Date: Tue, 28 Mar 2023 08:44:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Andy Gross <agross@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230327170114.4102315-1-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230327170114.4102315-1-robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: remoteproc: Drop unneeded
	quotes
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

On 27/03/2023 19:01, Rob Herring wrote:
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
