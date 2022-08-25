Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C65AA5A0B37
	for <lists+linux-stm32@lfdr.de>; Thu, 25 Aug 2022 10:21:54 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 635B0C5EC76;
	Thu, 25 Aug 2022 08:21:54 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A425DC03FCB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 08:21:52 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id n24so16658137ljc.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 25 Aug 2022 01:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=5ngialnJweWTxFhnpS3C9ddQCugujDSZYGR0J8FTnHk=;
 b=rvGQEUqW0aqnj4g1kHRRzHHqlMVtjORIUuoL99n5tztXvYQ1FqengLIcpF/CE4LkYd
 /A5dX+AuvNVj8NyUiyA2ObQuqaIAMikguTsvB8dSlUfAgfn8Qazy6/bZhVRzYztl0mjk
 1nKb9AL+hyG+fw23Mvb7zVRRIPqXyLfzRe7zMmBA84NtTJPPyxxUtB+rln+3F9Wl3STt
 5mgv0hUK58wVfIIOQ/A+aVWceH58Egv8idp/ywj1Vd6nErZhjHleuGjunZr9IxMauUVU
 5P5nJj1ul2KKrW33/ZNCihGHkEqz/L8qRjj4knDNA9l+4TYNeqMFWvV+Wg9103Mqrmg3
 Ez8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=5ngialnJweWTxFhnpS3C9ddQCugujDSZYGR0J8FTnHk=;
 b=XHvAIRIoioXkvz/diIzVORRa8R0ePTLxCHqOqwFczci1Ksqy8HbWFdZv4xAB5n4WsA
 j6VSVbLH6pxjmahtGLH7f1jxIQm3fsvw9TkYVL6SamimmcJGxu3gTZBLhxhUxiqLU4eM
 zLYZvifYO97R4b8DMvTm4y+KK+fwFVLTcWWmZMzuS3uDwEKjNngOs3bO8wbH2ks44Vw+
 d5nS1UFfGdyZ9N+bQ52xHiDIzPRnXGTzme7kvFanMbaSH6Ca0CtNPryAbKcYt58rN4fs
 Ua2k3YOQ1ahiKNWpqwN885tWyyx7Ew+X5EmdFAqkLL7+vcmW0v4NztOpuiY37DH4G4L/
 1S+w==
X-Gm-Message-State: ACgBeo0mBQBDtT9azIIF6rV+ntvHoJEgFQ+yRQjzXOazPPDJ1hAmBEOK
 og9lcqLMRDWWvhq3yyVABcj/cQ==
X-Google-Smtp-Source: AA6agR7uT7Su4lHGAOiQyY9ljhllP8dx9Y2jhf2/BSPJmxMpA6d0kWUyMQOHjKrcw3F7GMJy7Oyt4g==
X-Received: by 2002:a05:651c:a04:b0:25e:753b:db42 with SMTP id
 k4-20020a05651c0a0400b0025e753bdb42mr737611ljq.529.1661415712008; 
 Thu, 25 Aug 2022 01:21:52 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05651205d200b0048afe02c925sm363108lfo.219.2022.08.25.01.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 01:21:51 -0700 (PDT)
Message-ID: <022a60e0-17a4-cf13-d8d6-af342468acab@linaro.org>
Date: Thu, 25 Aug 2022 11:21:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Amelie Delaunay <amelie.delaunay@foss.st.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>
References: <20220823145649.3118479-14-robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823145649.3118479-14-robh@kernel.org>
Cc: devicetree@vger.kernel.org, Scott Branden <scott.branden@broadcom.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ray Jui <ray.jui@broadcom.com>, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: phy: Add missing
 (unevaluated|additional)Properties on child nodes
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

On 23/08/2022 17:56, Rob Herring wrote:
> In order to ensure only documented properties are present, node schemas
> must have unevaluatedProperties or additionalProperties set to false
> (typically).


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
