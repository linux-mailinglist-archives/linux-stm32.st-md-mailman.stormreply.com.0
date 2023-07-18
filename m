Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2577E75760A
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Jul 2023 10:00:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E443FC6A611;
	Tue, 18 Jul 2023 08:00:17 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F0B1C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 08:00:17 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-4fb41682472so8647330e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Jul 2023 01:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689667216; x=1692259216;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0TMF8KkLHgIjjvuu9yRbShpISudcqJyFHmRqyTxc6O4=;
 b=jWuqqDtk3x6ktCQ+Glsyd2kL95uhDESKBMrQtRQ58ong17rYZworF6J3gSwDGvrOaQ
 09qHQCiL3V2B2BS/Oz8xm35SNQ8TMdBUSlk87J8GduCn9Wfu02wJGuKxFO+9plxPhHXu
 3TgtvZFt0v/WvpIURdO8NY3dgcerNOX1LIG6KSM0SkW4PRs/aSEswYlWBOn/OrKzTUhU
 Q/HFw+2oRp3N6TcWPL07pBqki4dfTuKCjbKXFdTMfc969Sviha2bpkEEhw/7p5GqTNEP
 CryarmLHTFBJSpXFfvz2q7455VMybZIJl9joGPMX1JBSj2xq1x/fEHXKicz3z7rO4+uH
 HRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689667216; x=1692259216;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0TMF8KkLHgIjjvuu9yRbShpISudcqJyFHmRqyTxc6O4=;
 b=JCAb1F6/cExtrBBAJoRRedL0sW9F49sU6diEY8EeLjVHE6GB0wcsIInWGmDXCcVJFx
 rZYJ/QCIhd1kl8e+hrna6eVtpWFFDznZX6dlAPWpDH7IAKaINTqkc6+xtlQXQOcuv88I
 1driutGbGopvq0bnCmMrAbNjoZUNxTGtm70xAXHFk26JLn5CZv/RHOn/xDKWVtSwH1Rl
 Puxmn3ab0tjErEGhKyutNQRVdxk50wZH9QP+rW0C2PkSYaklsI4nqskH0EY/M/lgvBnj
 ZjVGjMkiddQrOccrgeF5xqrDy5OJNFLHIvG110+EHAqGLcP0LWedT0/bo9DQykP5v8Jx
 cNbw==
X-Gm-Message-State: ABy/qLYGjnjg+jBKLlZb6bWB+0OyJ5yOdtkyzfNSMJr45Jt0ZMqg2+3y
 T/T/HcBqYC8haZRCrU4MbpU/1A==
X-Google-Smtp-Source: APBJJlHk3u4MdO8axVsUFrnEBFxv5a8PaAepGuSbyIx6Wu0c1NWLR2Yv9yDhcPOpldRKz2pvU9g3mA==
X-Received: by 2002:a05:6512:3d03:b0:4fb:8f79:631 with SMTP id
 d3-20020a0565123d0300b004fb8f790631mr18681248lfv.46.1689667216606; 
 Tue, 18 Jul 2023 01:00:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
 by smtp.gmail.com with ESMTPSA id
 k23-20020aa7c397000000b0051d9dbf5edfsm825879edq.55.2023.07.18.01.00.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jul 2023 01:00:16 -0700 (PDT)
Message-ID: <9ac33c64-337d-d9b6-275c-94942797e5a4@linaro.org>
Date: Tue, 18 Jul 2023 10:00:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Marco Felsch <m.felsch@pengutronix.de>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com
References: <20230717164307.2868264-1-m.felsch@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717164307.2868264-1-m.felsch@pengutronix.de>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 1/2] dt-bindings: net: snps,
 dwmac: add phy-supply support
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

On 17/07/2023 18:43, Marco Felsch wrote:
> Document the common phy-supply property to be able to specify a phy
> regulator.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
