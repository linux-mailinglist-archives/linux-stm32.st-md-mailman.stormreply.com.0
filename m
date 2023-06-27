Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEA573F5D9
	for <lists+linux-stm32@lfdr.de>; Tue, 27 Jun 2023 09:40:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3245CC6B44D;
	Tue, 27 Jun 2023 07:40:19 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56D8DC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 07:40:17 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2b69dcf45faso32819771fa.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 27 Jun 2023 00:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687851616; x=1690443616;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6NTcpMVbPtfKRTcDrSmD8MoUfkjuvD8dm7rw3ArPL9I=;
 b=swdKSXqee4DsixhpEGqQyNNW3XBWrUevNKszorloHuIBaCA0PcMPOfsuOzl9+QiTte
 4wOsYWBVcN7F8Tj78icmZyMkGYOi7Dm+2krXIRn7atuzwAfMsfDBMaOZ9rnRRGBreFTM
 T6w9ELsAX328Q75z7uohV2hndIY+XECbVG2a2EjOF+5CpugPTygos1zEsS/Efj66b8rp
 FE/YMAM82KyOJcjbDpIYUnEKa3Caf5z4C/YQN9PxDLKCsMG3Si0/KaASqAsXFCONmnQL
 9zuEFehYEYN9wLs03oc5+iWVK1iVNsitw/5ptAAcaTVhDNfxMHzKllJ7PBJJ9IiaC2h3
 ItEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687851616; x=1690443616;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6NTcpMVbPtfKRTcDrSmD8MoUfkjuvD8dm7rw3ArPL9I=;
 b=JgUh0gdI9nFse2H8gSFreiAvTqAW0Lz874sOSnRGrT2//Z7cFM4MrzFrzAWmbek8W3
 FODi4s91QgDEIM6iznTvjncr2+MMA1BCaz9oHyxfFcbO7zXzsCJGTqZj/ITfiryhiADX
 IgcMEZQgYQrabHL4EFdqkD4T1xtudMKr21CFUjyW2R7nxV8MkkTJUt3E1QCCICX0gu/x
 pTFZ1KFZMEuXvFafGWSMbsmSTb6sW7NqPwpD5PeiiKvE250lV99Opa5mS/93lurGQ6m2
 x3QTOUgseICvoHH6i7l9RoGxfJWGPDO4kgmQFO5jULwq5/UMT1rUs4ZT4WLcbs/PqW/I
 9bzg==
X-Gm-Message-State: AC+VfDyguOpKy/Bz3IbLyO0NopvuI9LHdg5k41c7t6cHzDDtXJIO86lD
 pKw0EgigL3xK3qUS2TaQm2A97g==
X-Google-Smtp-Source: ACHHUZ5+P/WxO4oUioGdTlGmHsZgaxSX0SXG7cUKhxcYXN9myY+XUcQUBUCnCbqT23LWO6u4jDOXNg==
X-Received: by 2002:a2e:7e11:0:b0:2b5:95a8:412b with SMTP id
 z17-20020a2e7e11000000b002b595a8412bmr7300556ljc.52.1687851616523; 
 Tue, 27 Jun 2023 00:40:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a7bca4e000000b003fa786b5195sm9823842wml.42.2023.06.27.00.40.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jun 2023 00:40:16 -0700 (PDT)
Message-ID: <61f9a781-81fe-d553-6c85-eb069174e6f0@linaro.org>
Date: Tue, 27 Jun 2023 09:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230627071707.77659-13-frank.li@vivo.com>
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

On 27/06/2023 09:17, Yangtao Li wrote:
> The upper-layer devm_request_threaded_irq() function can directly
> print error information.

I don't understand. "Can print"? It does not matter if it can, if it
does not. Currently it doesn't, therefore change is not correct.
Otherwise explain a bit better why this is redundant.

> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
