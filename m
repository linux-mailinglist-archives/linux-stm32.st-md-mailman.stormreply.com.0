Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4B174A185
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Jul 2023 17:50:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3A950C6B45B;
	Thu,  6 Jul 2023 15:50:24 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F66DC04B10
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Jul 2023 15:50:23 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-9891c73e0fbso162309366b.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Jul 2023 08:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688658622; x=1691250622;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XUhfDmggsn5eqK33qgGT6h59DblDFC/G1j0z4SZy8Ck=;
 b=zxr7ERCrDF1RetXZAxvNWoKt4JCwmRD+F7+ab+4uaw9SW9WaCbko3t5b8Ew7vhHlKF
 y/ypmKf9yxgOoqMRvZWTDUcidgZC6ywWzLBF5Itq1qzq0MfVeoDV2jc5TQVpQNjOQjPV
 R+JI78aOEH2PwA5NbGzI1XRtIUFMMeP/GQjkDpiIpnHi0UlmHqFCtk/DOX5L0jZjZPVA
 gL83rWs36sX9zj9hLZf0mWgDY7NGjPg88Wvfbp2ArAI8/+CI+wb5vTuBGUQwFKNSTxad
 bYWlNr2BjvrJaCoq6bbaPvb1cGdjbiZabUizqX5DSuLO4XyxXGmU04fBtwwpDXv4zwRy
 n6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688658622; x=1691250622;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XUhfDmggsn5eqK33qgGT6h59DblDFC/G1j0z4SZy8Ck=;
 b=QQHxdq+ae+YkYlp0PiyahVglaqcOknIZ50KbbDHDJyV5GRljzAqh7Kkk/SqX8AW40N
 WGDzwpyStxJCKZh5HInQdN8bjPBQg5m7fiN5CI6ycjUaYUpnOB5vbWjSkPbj53URY4iF
 BOFg9ZjFJNbr4NQ4zRaJvTFdBiXyNOZiC9qmVONwvOShIdwZLwG01xzq+wV9YUYoRa3x
 GMgSuMhofzsQo9ZXYO7Dmmhi6Ku1sdR1d+4E7FAfrexqxGmBPdc0yKzHzRfVN4nsEhEt
 BtCsfJdZZ5tY5aRv5S1NNNJLkWe/xdEJ6ix3JCpemIgPFaiH16ahZpFb6Hg5fouYgutJ
 klkQ==
X-Gm-Message-State: ABy/qLYVMcsrtjUoQpj0G03Q1vnlxGYZ5XgEfwf00w3j/5JrXDeE/Nk2
 qRM+ZdEssVd7O/Wr/YZ2QZHQLQ==
X-Google-Smtp-Source: APBJJlHaa8zI+ZK8HBkcP1KU9kxKBZritHwYfobLjVsnf/vocePla9ck7Sg9U8FFsnEDpg6QnVoX9w==
X-Received: by 2002:a17:907:1b1d:b0:98e:1729:aeee with SMTP id
 mp29-20020a1709071b1d00b0098e1729aeeemr5637800ejc.2.1688658622587; 
 Thu, 06 Jul 2023 08:50:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 o26-20020a17090608da00b00992f1a3b9bfsm979463eje.170.2023.07.06.08.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jul 2023 08:50:22 -0700 (PDT)
Message-ID: <fc6c219d-1ef2-f59f-ebb1-0a749fbbbc81@linaro.org>
Date: Thu, 6 Jul 2023 17:50:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Thomas BOURGOIN <thomas.bourgoin@foss.st.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S . Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lionel Debieve <lionel.debieve@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>
References: <20230706073719.1156288-1-thomas.bourgoin@foss.st.com>
 <20230706073719.1156288-2-thomas.bourgoin@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230706073719.1156288-2-thomas.bourgoin@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 1/7] dt-bindings: crypto: add new
 compatible for stm32-hash
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

On 06/07/2023 09:37, Thomas BOURGOIN wrote:
> From: Lionel Debieve <lionel.debieve@foss.st.com>
> 
> Add a new compatible for stm32mp13 support.
> 
> Signed-off-by: Lionel Debieve <lionel.debieve@foss.st.com>

Your SoB is missing.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
