Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F550E26C
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 15:53:44 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 25FACC60462;
	Mon, 25 Apr 2022 13:53:44 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 73F13C5F1F1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 13:53:42 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id y3so9394259ejo.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 06:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O5c0UqGvLtPw8emC5AWVjXB8dvbnto1ATcZ65iturcA=;
 b=Z8w7LYxWc4ApdukoH2e50ejIEdNwvoqXyHEC6plt0/Vw1+VK1Mu4bpnd7ccZ1yYdJt
 lgsSAvgeMia2TvsUXKLwIs8nlmUnCh5FwTApqoT46ktNVx6l7AVfb2ETLtVcO+vTYXUG
 YF7c7ULN1TOH8gq8v+1j72Vqkx24qcsM0DWCrBAGhYMMIs+FEdk/4VSZ90PiZFPey1E4
 XajUfAaalq6B5SXqMD3WbCkh3fbfbV/t16ApcRuYGvdoN2zFbi5cpgTRMeJ2So8jr8pQ
 nY8EWVmJhkUhK0uTBdjMtuFBa7zWn9oIAVi/YR1/N6tc7trjxJaDSBpbbGMJdu9K9bdG
 BVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O5c0UqGvLtPw8emC5AWVjXB8dvbnto1ATcZ65iturcA=;
 b=I1BzgBR904UAFwdd87Eb/tSDyz/bKWppXFtyNwTap6yuIq9e6C3Xg0PltMPe7Q/ghA
 EOzteqxQVALBm3nDEScflUK8bbobZmJwJhTuWqkHqNhPs3cvW1xWj+VIRY48eIuuRbbJ
 oTosUoL53uCJf4Ba8e7W21++HRCzI4w8V31IY4wUmHBysVOCdwoieKx7J7iRbM58gGHb
 bHEtVuvfetbPZbiews/fyAuDCw/llqY1mn3JDqTnvYc4HiKcTlkq7+IMB+86OnqPPzh1
 93mqWbFurHDdFPeK7FAs9G+DB8eCRIksdNTzqu90w16oTnr3vB/OGrpeQ2arW51L7WIE
 5EeQ==
X-Gm-Message-State: AOAM531X3KYMvurPHd3bePcx7Z7SnB6Nwk51e4ldqzEBZybWaS4iiCaE
 pAyz0IWOwFfzdcveUZk+lH1zPA==
X-Google-Smtp-Source: ABdhPJyJh6DWB2kVePBbEOthMsffKZenL6MCE3nNClBAPQGqQUSfgCEotwo6UYTEk0UqYpTDGEozNQ==
X-Received: by 2002:a17:907:60cf:b0:6f3:60ab:d1ed with SMTP id
 hv15-20020a17090760cf00b006f360abd1edmr13605037ejc.22.1650894821957; 
 Mon, 25 Apr 2022 06:53:41 -0700 (PDT)
Received: from [192.168.0.243] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 mb22-20020a170906eb1600b006f38dcf211bsm1529661ejb.138.2022.04.25.06.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 06:53:41 -0700 (PDT)
Message-ID: <35648611-cfa9-1df4-7130-7cd1bcf1a69e@linaro.org>
Date: Mon, 25 Apr 2022 15:53:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
References: <20220425132844.866743-1-o.rempel@pengutronix.de>
 <20220425132844.866743-2-o.rempel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425132844.866743-2-o.rempel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v3 1/4] dt-bindings: arm: stm32: Add
 compatible strings for Protonic T1L boards
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

On 25/04/2022 15:28, Oleksij Rempel wrote:
> This boards are based on STM32MP151AAD3 and use 10BaseT1L for
> communication.
> 
> - PRTT1C - 10BaseT1L switch
> - PRTT1S - 10BaseT1L CO2 sensor board
> - PRTT1A - 10BaseT1L multi functional controller
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
