Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EB62A72F628
	for <lists+linux-stm32@lfdr.de>; Wed, 14 Jun 2023 09:23:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9A207C6A61A;
	Wed, 14 Jun 2023 07:23:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4F7E9C6A615
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 07:23:57 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so59892866b.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 14 Jun 2023 00:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686727437; x=1689319437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X48c7AoEOD3TxiGjzZ730W7QuuocGN40Ji4sYGrasgI=;
 b=AtHampU+XnfOFRa3UiWqVTavPvWwSBDwj08vushK74etxW/+TzPgltr6/zw/btuhFE
 HzLAnfpiZuJqMPGBNjXFL1l+linJmw/NYyucs8WLnrQr2cYmFkO1+3WzazC+i7blSpBk
 jkYn3pmPeNGEhPaOntF/JU2Fe75Jw6cI1XmkL1gvZ6LZKhjlFRP7d2oQXwKyuPFVaiWD
 uGdfIbDACla6yu6/RIttUUMDBNBLoF9L7naUE6zMDq1imfFT1kwowe7iCF5X+YV5neGV
 MY0dSU0/H/nJLVNelsqd6dhVZKpxTbbmZZoevFNWK0EQbl4Loe+N8K5jUi975+y3mfLl
 tIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686727437; x=1689319437;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X48c7AoEOD3TxiGjzZ730W7QuuocGN40Ji4sYGrasgI=;
 b=dfenH6p8Bt/v7sRwdFW9qWSA5C29aKJEtJLO69wjeO9F00CHklQew+ny7Ty+8LT+9t
 4jxNdx1Sz8o9cJilKz66fIUitGuCMSyqrRdyUS7IL7iACsbkU0YYbotZtnveN7dhydF5
 6qUKPiOM4jQ9KOUdwWhO87hPKAk1rw9M4cTIKK+WDxpMM8gxrh/ZxIUTs3nMwg6+rdQY
 yJOQdXuSQHqEl6MbbENR0pW5T7nuCVwgxGR4oyusXlZqb1TMJjpYpJzb+l+eiiCJ8sa+
 NHxAWhLZjrLxRW+/Hix4BXBWVN2FrAQ0afZ7oXa7qqGEyOB0SFr2hB/6WI5vwXickSBL
 lt2w==
X-Gm-Message-State: AC+VfDyg9bRU26FVHtrBpL58lnfrsKJuFrvowIU31Xq2s1fpCl80uyhL
 4aLGTA43gJmd05+slbmwdUBLBQ==
X-Google-Smtp-Source: ACHHUZ7HprcUbY4Np2NnM2SRFCO1cDvQEs1A8ynQEvGZx3Dh5Jm8HUXXavnivFzBkFvto59qd1FDyw==
X-Received: by 2002:a17:907:2da4:b0:981:a949:2807 with SMTP id
 gt36-20020a1709072da400b00981a9492807mr9406993ejc.1.1686727436730; 
 Wed, 14 Jun 2023 00:23:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 ce14-20020a170906b24e00b00977cc3d37a2sm7598052ejb.133.2023.06.14.00.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 00:23:56 -0700 (PDT)
Message-ID: <30d50e3d-b501-273a-66b8-6d38d63842b4@linaro.org>
Date: Wed, 14 Jun 2023 09:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Bartosz Golaszewski <brgl@bgdev.pl>, Vinod Koul <vkoul@kernel.org>,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>
References: <20230612092355.87937-1-brgl@bgdev.pl>
 <20230612092355.87937-20-brgl@bgdev.pl>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230612092355.87937-20-brgl@bgdev.pl>
Cc: devicetree@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 19/26] dt-bindings: net: snps,
 dwmac: add compatible for sa8775p ethqos
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

On 12/06/2023 11:23, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the compatible string for the MAC controller on sa8775p platforms.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
