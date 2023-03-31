Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 399626D2941
	for <lists+linux-stm32@lfdr.de>; Fri, 31 Mar 2023 22:17:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DE433C69069;
	Fri, 31 Mar 2023 20:17:26 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BCD8EC6904F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 20:17:25 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id g19so17292506lfr.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 Mar 2023 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680293845;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PCmSmcqOfsVfl2tCC9qQBF7W/rjcBMfD/MOmc9ZECng=;
 b=FEiZSZ2LMcZKJU2i8m5CNciGjOyJb4arZgojJLsdnH9X51Wu0xd9kykG7TVQeTWVt7
 EGdy0HMjLrf41HKCU5RkhArcpTo0OK/eIsYj0NSAXifw3hQ0JBi+IHUZF0TIGjEaJAUT
 REgb/Q4U4TV9zLTRSz6NiaZ7t5kmVlZAdyBrUHXB1dhGkRkdH0TLcRtvFgoQQy777BNT
 4CxdWjSMdSLdvAIWBDuRSlSKHIDXf0qRtRU0/JQFh2ySp2TJMbQw7KtTXVRP+kDh61si
 BZ+W1D8+PpuK+CQs+kL3EBN9ENntaT69bjpNmGSJe9ORVuSH8YKpdsCMi747ameemdZe
 r9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680293845;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PCmSmcqOfsVfl2tCC9qQBF7W/rjcBMfD/MOmc9ZECng=;
 b=4thwW3uqVfkhugypD1dDBmmPicwgBAE1kooyYZsND/qi18xPTHp3IAqQ7fBy9Rv+do
 Y3DLvIz9Ck22Ejg8mVoTXsxBiNPPPEfu0NQAe6t3/7h5rFFR/RtAY7XU11D5YQREbcJV
 1waKtBe2BFTC68AXd532G92/L6W+UT1fDJxarWsMzq6HJS29HWY+XxNUZaVFOn4wmyDk
 e79paW+0g7NoS18axjv3ZyOX7TbU4SBUsKehf42IunYq8gJZxlk1edDEQV0nzIkUgnKA
 t8m6oGQS1Fey8MxHudb0CSYrBT3RrR0vmm6zFXqgK1CC4Boz4pshD8h6YN7W0+O1qjDJ
 XpEw==
X-Gm-Message-State: AAQBX9dULRSaO77evlBrrQ/AL6yZGMhJpc4+qUg06wt4hJUkIemNrXdE
 V5DxW+6NtUGoDF9Zp86cS/uZfQ==
X-Google-Smtp-Source: AKy350ZW4tojQvCr/HnE4u4WkpM3V/on97zQF5/1LXrQhTmYXHS1Eyrs70NrN1cP9EiLT2GR3K7Mzg==
X-Received: by 2002:ac2:5b5b:0:b0:4da:ffa0:3f21 with SMTP id
 i27-20020ac25b5b000000b004daffa03f21mr3033440lfp.14.1680293844910; 
 Fri, 31 Mar 2023 13:17:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 l28-20020ac24a9c000000b004db508326c0sm506148lfp.90.2023.03.31.13.17.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 13:17:24 -0700 (PDT)
Message-ID: <fccbd0bb-8cd5-b286-c68e-32c094db3cb3@linaro.org>
Date: Fri, 31 Mar 2023 22:17:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20230331155527.3111125-1-arnaud.pouliquen@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230331155527.3111125-1-arnaud.pouliquen@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] dt-bindings: remoteproc: typo fix
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

On 31/03/2023 17:55, Arnaud Pouliquen wrote:
> Fix "communnication" typo error.

Use subject prefixes matching the subsystem/device (which you can get
for example with `git log --oneline -- DIRECTORY_OR_FILE` on the
directory your patch is touching).

> 
> Fixes: aca8f94e5b69 ("dt-bindings: remoteproc: stm32-rproc: add new mailbox channel for detach")
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>

No line breaks between tags.

With missing device prefix and dropping line break:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
