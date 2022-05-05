Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D6051BB7F
	for <lists+linux-stm32@lfdr.de>; Thu,  5 May 2022 11:10:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 55F27C5F1FB;
	Thu,  5 May 2022 09:10:23 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3DBCEC5EC56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 May 2022 09:10:21 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id kq17so7506839ejb.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 05 May 2022 02:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=c8YCaE+5K/dsPc+9iPR/du6PTroxvuxyU+b5yayfxT0=;
 b=BR9/PiFUmueB+D/dPuLP5gschdU/Btt/V6TifIiCR9DF9iMhXyAll6y6HgiXExHK5f
 LCVDrMZOR/Kn+bqkWVXn1PHgfgjAbOlqka3Iu1awF0njedHmUvHbvwbnMVW/mnuaJcTN
 zSe0NjynuCAT9rJckKeozN4VOfdarIDSP2C4abZ3zH6fK8QCWzDJH3bFgx23pC0e10yX
 a8nPQqMNzz4Ftzl9gTIDqvSo8tyjX09k6MqEhCJ71sPOqnY3ZuW59KgBVzv6f2V4Vdwp
 VBbQ6bvT6rn4vslTrJSz8so4skmLZe5YuaKHws5ojTgR5418yqOhNzZUMdzZY3Xp84Ir
 LPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=c8YCaE+5K/dsPc+9iPR/du6PTroxvuxyU+b5yayfxT0=;
 b=HX5F+CRHg5unNpiEVuB8oiLSrY4GTjjBgIRGLBehSH5dPtQX9xSqe8AbP9tFN5KEXi
 EEUnJ3kKLdMVEwLbooqMBm77F1F5ycHGEwPIxGu4HUwFaO8EPm7CURAuqr8+/MkNtGW2
 pwzjpUH4anMowjHvScGB5H728SJUrBV//APJT9L+k2quRBtwOW6giC9LcEkA7+bUUvSy
 F8b5gFX5yLDQ5Lj4LR5RwTADkcTj0XJfR9iYci4qxT+k0Dn2LX0wk2QHy5XtcQmJBQMg
 9hvWKtI5125HleiyNoz6/VD+BCrIcnA5x6FsiLgmljZiyICkwDqHxLl1q5BvslAd2OnS
 GP+w==
X-Gm-Message-State: AOAM533nvwv0eMV/6I9HYgFxuGDfS+OeINBMw6g+nPT5OjB5Ok08Rwyj
 aeY3SC0idQSrzrydY6CkkDuJLUXNMiJX8WPL
X-Google-Smtp-Source: ABdhPJz7tsXlNRMPlAktkJhnba7TvMyZHIV5xs8SGanC49KbwY/dkQKKC6fYnLD9+ao8S0FbRuugvg==
X-Received: by 2002:a17:907:1c24:b0:6f4:ff62:a393 with SMTP id
 nc36-20020a1709071c2400b006f4ff62a393mr643548ejc.154.1651741820790; 
 Thu, 05 May 2022 02:10:20 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 el22-20020a170907285600b006f3ef214e1dsm511229ejc.131.2022.05.05.02.10.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 02:10:20 -0700 (PDT)
Message-ID: <e0af5143-7fe1-fa68-25c0-eb81d695844a@linaro.org>
Date: Thu, 5 May 2022 11:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20220504094143.1272200-1-arnaud.pouliquen@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220504094143.1272200-1-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: remoteproc: Fix
 phandle-array parameters description
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

On 04/05/2022 11:41, Arnaud Pouliquen wrote:
> Replace the FIXME by appropriate description.
> 
> Fixes: 39bd2b6a3783 ("dt-bindings: Improve phandle-array schemas")
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../bindings/remoteproc/st,stm32-rproc.yaml      | 16 ++++++++--------

Please add "st,stm32-rproc" as last prefix in the subject. With that:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
