Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 606EC5FC619
	for <lists+linux-stm32@lfdr.de>; Wed, 12 Oct 2022 15:13:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 12C72C640F9;
	Wed, 12 Oct 2022 13:13:03 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3AADEC0D2BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 13:13:02 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id g11so5465299qts.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 Oct 2022 06:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Oya1NNXFgEbQyEYLD7+z5oGWxx/yoIcQNtgt3HKMgx4=;
 b=kCBrGeiwJCLGFO9YEWhUCqI8U81XeVDagS8lBbFr4QTzwTJ9efP5w2c8W7wUlvpCUq
 Qdo4f8jW0vNkfBAHSWC2eja6PjGVL2c4OMFxQaD+u3MQIyBqpeZS64yoiKGiz9rtPL0r
 mMPbefxxoUw+1TEiG4lBNb78mKraShxuNlIiDVJe6eU5u/eGEBgoe29Qdn54GsI2wHDu
 mnOT8GK+7oyrObhsqBiOaaWVriF2qI5A5oJyV+GbLV9Vq27yNGGBHq2Wsdvo0eDH9hCu
 lATc8h4GMi6OqbPOgmmoRnduFf3BhQU0QcoOKW7p5basgZiICC+3b5sO6YKN3NB3oM7e
 Rkhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Oya1NNXFgEbQyEYLD7+z5oGWxx/yoIcQNtgt3HKMgx4=;
 b=O2dHhuMKOhadsFNM6PCA1ALUOKjc+wJ5UdT/imoEB/l0qC2Mu4dqjVadOClgBEh/eb
 vb4QeUjiJiomkCqWhPQq8iY4IEREopavPS57xFI491IEdhBkBByDbYN/sHVkdUynXINT
 wyuPH1qv0e4TvL3YCj+YILqaUhj5nsJ63ixWrPi2ctTRyMHYTyLxEPFZLMoY+RDiyq8D
 Ar+nEbb1iEGNYWks4JIiUFlsr8Nn0i17utxgA4l7Md+RPMUmMxvYpLUa+q/3NZ35Hhto
 vewIE7ugwOa7Gs1TNI1zOL5FSs+rlutJwQI1ILNQifgrJvvUqMY9QWUNOopMMISHvWZl
 U3xA==
X-Gm-Message-State: ACrzQf3XxghYU16FPfmf7IDzh1VBsFwbGbKfMqBFHSG5P+zo1IYpUXya
 4kU6QoNAcDbKfDx/KF+rk7Vcbw==
X-Google-Smtp-Source: AMsMyM5NNr3Kol3tWrwbPqWrVG1qsyy7JWtJWBTKjLNZ4No9uMzIDaM7xeA1lVVCtlU0WkYy5oCinA==
X-Received: by 2002:a05:622a:178d:b0:39c:c64e:292 with SMTP id
 s13-20020a05622a178d00b0039cc64e0292mr998862qtk.231.1665580381158; 
 Wed, 12 Oct 2022 06:13:01 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com.
 [72.225.192.120]) by smtp.gmail.com with ESMTPSA id
 q4-20020a05620a2a4400b006ee74cc976esm5919970qkp.70.2022.10.12.06.12.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 06:13:00 -0700 (PDT)
Message-ID: <d9b57819-c956-31bb-dedf-c7fd04d37902@linaro.org>
Date: Wed, 12 Oct 2022 09:12:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To: Clark Wang <xiaoning.wang@nxp.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, mcoquelin.stm32@gmail.com
References: <20221012105129.3706062-1-xiaoning.wang@nxp.com>
 <20221012105129.3706062-3-xiaoning.wang@nxp.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221012105129.3706062-3-xiaoning.wang@nxp.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/3] dt-bindings: add mx93 description
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

On 12/10/2022 06:51, Clark Wang wrote:
> Add mx93 compatible string for eqos driver.
> 
> Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
