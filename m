Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B829057287D
	for <lists+linux-stm32@lfdr.de>; Tue, 12 Jul 2022 23:23:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81807C640FB;
	Tue, 12 Jul 2022 21:23:13 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 87D5DC640F9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 21:23:12 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id t1so12518232lft.8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 12 Jul 2022 14:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KhYX7FuYQUxi67GuZ2ixbS/AMyDFa/KK/jRr3sISomk=;
 b=PNYcPmnzi0W8n5Qtze2ZGtkUJF6xrJGoMW1UtKbz/qf4aFBw0uwxVsdjsE1FYnr+TT
 Q6zQ9r3NE0BBSn4wxEAmrmlBZXa0SgM8P2O03nMK+Ky6vybEH3e8KIWSAVmHzzM8XMhp
 jmWGiYZBMNJTb0zFfevEw8EBjvSCqH65bPomEEPe/t0BHdUSxSL2ogvtEYbIx49l9XX6
 L2AY5zchLiQBOS4t/SijMsdbd9kDZPK5lvN6g4Mc5080gAbg1Y6+rdG5m8jhXwA5M39T
 K2yus7s4Ud0SUOlKgo+QBoaAmFCgwSgRrntdIx+qzyn/4z0qo6WIN5GCC9Cee4T/ontm
 RgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KhYX7FuYQUxi67GuZ2ixbS/AMyDFa/KK/jRr3sISomk=;
 b=fh7fvUGzeCfsKeg7biBYR60pvCEPP48XNIs+ua9+j2mEAG/0rRCyGmGkzHvWflnsDS
 EWjCA67EVdLqvsV4rNl10gR5SQnKtEfetx7sBeTt4KFIqLQ0jMkNHtLG1PiKnzYbb+hU
 bBrAYOLbdQtKn5aO/h/vpZQne0vL5soKEuddo7P55Vjr7FM8u43Ph+Gk++TCxva93Xmn
 S/XwDFnC6FGEfIAyANpjSkkLImti4DDzp5vvxkx6SMFeSq9BBIwzdbZ3yPpqTe8TWVYR
 dHt220kQmJGKW/3rpwL2sifMjcmwyU7PsjNNKLsYwRKIxCQtaCkxixFRJgXGYy7U18YW
 DqEA==
X-Gm-Message-State: AJIora/NcdsDAO0ieB5dr77lGd5+lEr4t0gbU8cuAcg2ZpJ6K1quez2y
 fwlPeSsCTLij46+IxRc5/MLC4wxn1nC7ew==
X-Google-Smtp-Source: AGRyM1s66esIFctUVClm4vc8Pa35fg55yA4QdNJhc8vEMh41lEP2nWRKR8ihjRFw3wJ2U/EW5Q3z0w==
X-Received: by 2002:a05:6512:1683:b0:47f:78ca:8ac5 with SMTP id
 bu3-20020a056512168300b0047f78ca8ac5mr16213908lfb.663.1657660991981; 
 Tue, 12 Jul 2022 14:23:11 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
 by smtp.gmail.com with ESMTPSA id
 b23-20020a056512061700b0047fac1feb6fsm2392578lfe.210.2022.07.12.14.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jul 2022 14:23:11 -0700 (PDT)
Message-ID: <01e7b72f-a044-676c-16b0-d8ce556a1100@linaro.org>
Date: Tue, 12 Jul 2022 23:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
 Lee Jones <lee.jones@linaro.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220712163345.445811-1-francesco.dolcini@toradex.com>
 <20220712163345.445811-5-francesco.dolcini@toradex.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220712163345.445811-5-francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 4/5] dt-bindings: iio: adc: stmpe:
 Remove node name requirement
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

On 12/07/2022 18:33, Francesco Dolcini wrote:
> STMPE driver does not require a specific node name anymore, only the
> compatible is checked, update binding according to this.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
>  Documentation/devicetree/bindings/iio/adc/st,stmpe-adc.yaml | 3 +--


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
