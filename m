Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D616973F5EC
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jun 2023 09:44:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9690AC6B44D;
	Tue, 27 Jun 2023 07:44:48 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D79AC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 07:44:47 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-4f865f0e16cso5658436e87.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 00:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687851886; x=1690443886;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wFNM/13zo+D8MIGQZG1lJZIvVzqHNgB235Wb/AV3lUA=;
 b=K/YymU1Fw0XlFUpLmM/JsiHLwp6gglJu2CMqRj/MvPnLc7dAWpN6W2xm9QdXW23zZp
 EB/GIMb+FQD5HXV5uFtsqcfehGsDp50mJyMvPti+NlTe3jpVwhiMw/DL9pD3lBwH/38F
 VI7hRahj2se3hwB30hdrHGJl97u6LAhwODzX4Bh+TtDsM7yK2QfDPkEM34BCfupe1bE5
 CDgGRXGwvthPDiFaEmsp0zOTJsRR35s5RBS7lQRVYjDPWPfO1VPnfC4wOGKYltmqexFf
 LOEniz8brkiDyP6blhoVPWh5jdm96n58qKU7Y+wgsyalJRh3ilMhvKZnh1kURlyvlsH5
 6z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687851886; x=1690443886;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wFNM/13zo+D8MIGQZG1lJZIvVzqHNgB235Wb/AV3lUA=;
 b=DVNVNlHi+KvJna5aYAAVdyCzZsfIgqDfNxdexfbkZcGFti5x/oTDsx1WZPzTwqKBvk
 KoR7z7jZ26CS6WgynjeOznIwMQMBQnwkv3VLo/qMsT1Tz/jNWppEqQ9chPW2NjH6oYTX
 B4t4oIXDmvMzUPL/oXJqPt5CnC/ua3UT5iUX2lbrj46vJV/3gkflW1Xz0lKtkl0o7R0X
 RVi2nto2vXG5wCKNWepaGN2/ByRf3zaD4aMIebjFy3Msk7dnjAwb4rxJG/VDO561cIE6
 DlMe9Fm014DL2Bb+snpzGlgSMo6AHTV7PyuIz+r96XHyhXKQphqaXPmz8i3OTFEj+5AA
 IrJQ==
X-Gm-Message-State: AC+VfDyg93iQXQBnB4xseXOaptHWI9vOOgYoxvith8sHXjbcb6lAjv3y
 bLDz+7jsouRmRhxnvnp/mGDDsQ==
X-Google-Smtp-Source: ACHHUZ6A6FWPC46/BuRGtluWDc8BUdgJ8Rg4tYYbbS+0qBeQ5xLXdOL8H0TzB80PlKS/a86NhKNNZg==
X-Received: by 2002:a19:2d01:0:b0:4f8:7568:e948 with SMTP id
 k1-20020a192d01000000b004f87568e948mr13532699lfj.51.1687851886659; 
 Tue, 27 Jun 2023 00:44:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c378b00b003fa95f328afsm5250918wmr.29.2023.06.27.00.44.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 00:44:46 -0700 (PDT)
Message-ID: <3213e578-1c48-e1bb-f181-d0845f915031@linaro.org>
Date: Tue, 27 Jun 2023 09:44:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Yangtao Li <frank.li@vivo.com>, miquel.raynal@bootlin.com,
 rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
 rui.zhang@intel.com, mmayer@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, thara.gopinath@gmail.com,
 heiko@sntech.de, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 srinivas.pandruvada@linux.intel.com,
 DLG-Adam.Ward.opensource@dm.renesas.com, shangxiaojing@huawei.com,
 bchihi@baylibre.com, wenst@chromium.org, u.kleine-koenig@pengutronix.de,
 hayashi.kunihiko@socionext.com, niklas.soderlund+renesas@ragnatech.se,
 chi.minghao@zte.com.cn, johan+linaro@kernel.org, jernej.skrabec@gmail.com
References: <20230627071707.77659-1-frank.li@vivo.com>
 <20230627071707.77659-13-frank.li@vivo.com>
 <61f9a781-81fe-d553-6c85-eb069174e6f0@linaro.org>
In-Reply-To: <61f9a781-81fe-d553-6c85-eb069174e6f0@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 13/15] thermal/drivers/rockchip: remove
	redundant msg
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

On 27/06/2023 09:40, Krzysztof Kozlowski wrote:
> On 27/06/2023 09:17, Yangtao Li wrote:
>> The upper-layer devm_request_threaded_irq() function can directly
>> print error information.
> 
> I don't understand. "Can print"? It does not matter if it can, if it
> does not. Currently it doesn't, therefore change is not correct.
> Otherwise explain a bit better why this is redundant.

All your patches ended up in spam, so now I found your patch one.
Anyway, if this stays, please replace "can" with statement - "prints".

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
