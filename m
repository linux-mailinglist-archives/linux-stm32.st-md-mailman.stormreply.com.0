Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 824CF67EB7D
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Jan 2023 17:49:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3563EC65E4B;
	Fri, 27 Jan 2023 16:49:19 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A313C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jan 2023 16:49:17 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 iv8-20020a05600c548800b003db04a0a46bso5932620wmb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Jan 2023 08:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MwxIin163802ACvSCq0jg4HlDZfjOU+b7ag/1i6mXEE=;
 b=p0bN2yAu28MNGvTlRbQWr0+f8dRrN7+Tn627u0K/x42EmNDLphayIf9NlMev0wqj8h
 /EmzHfmLQqKOVu8ZgIciDK/fUJr6PvWPKCTqRsZtsPxIDrQvOH3aJeQUvnun7rNkTSUQ
 6/KZMhpjpBCdTsrlPk0Pq1AqbefuhemfseqENDs+CCppSNm6HT2vKHwFAalheOqTayxm
 dtjoNuM92e8Dp5V+KrvfMQYfpqoVE/fUi7G9DPER5YIOirUmedqSV5KeWbBKvr23C7Je
 C0hL4yNzr1apQ8T4Xaqa5bA4xfUJep3aF5qWXf5H1dWiQl4NI8yI1oLJqFFQ+XguiBLe
 Z84Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MwxIin163802ACvSCq0jg4HlDZfjOU+b7ag/1i6mXEE=;
 b=vtWAXGJm3Wtls1MoYdCPtu10VGCdt8CjASN8JlUwhMnbc4FdJu0Z+1Zf5YPc+FOZyr
 hwr3N5pWLpVYmvJREUKN7RUCIKZ+WSWMrVjZWn37jgDyvaPTKcaTj0Ot8KxtBqqYYYvP
 MVBvn2xAFm1pkibqRgRQagIABUMjjh1h5yHIpA2KE9+EZJNEMkX1bTct/cfVVbu+rKtY
 zn3ot+dprp+zDaqIFGcfC3MUyDkWQwT0rx7W85lHXoZW2WoEuVyLOEzNWVlLjAHnt4fz
 gVI3VUaMxIYZcC/z8vsMwGxwOXkiXB0RcvWdnrg+v66KYJSH6bDSLJ9hK+FZYhY3Gy7y
 e9mg==
X-Gm-Message-State: AO0yUKXmIPt5DwigcLzkJe1s3XEY+Mt6aEcKix3nrt5fdzj3CvqHs3pk
 A6/GSWGHUAHog8Q1pXhtkf2H1w==
X-Google-Smtp-Source: AK7set91BwRn6DZssbXKyvbz30nnUQMYADbkS+Drm/RA9jZHFwp9Oe0M3rmb1c4Tgb8gUCp8+I209g==
X-Received: by 2002:a05:600c:3151:b0:3dc:443e:420e with SMTP id
 h17-20020a05600c315100b003dc443e420emr40585wmo.2.1674838156833; 
 Fri, 27 Jan 2023 08:49:16 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 p24-20020a05600c1d9800b003dafadd2f77sm8990779wms.1.2023.01.27.08.49.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 08:49:16 -0800 (PST)
Message-ID: <1e498b93-d3bd-bd12-e991-e3f4bedf632d@linaro.org>
Date: Fri, 27 Jan 2023 17:49:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Oleksii_Moisieiev@epam.com, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alexandre.torgue@foss.st.com,
 vkoul@kernel.org, jic23@kernel.org, olivier.moysan@foss.st.com,
 arnaud.pouliquen@foss.st.com, mchehab@kernel.org,
 fabrice.gasnier@foss.st.com, ulf.hansson@linaro.org, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com
References: <20230127164040.1047583-1-gatien.chevallier@foss.st.com>
 <20230127164040.1047583-2-gatien.chevallier@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230127164040.1047583-2-gatien.chevallier@foss.st.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-iio@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-serial@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v3 1/6] dt-bindings: Document common
 device controller bindings
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

On 27/01/2023 17:40, Gatien Chevallier wrote:
> From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
> 
> Introducing of the common device controller bindings for the controller
> provider and consumer devices. Those bindings are intended to allow
> divided system on chip into muliple domains, that can be used to
> configure hardware permissions.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> 
> No change since V1. I'm letting this patch for dependency with bindings to
> avoid noise with dt/bindings checks. Therefore, it should be reviewed on the
> appropriate thread.

There was a v6 already, this is v3 and I don't understand this comment.
What do you let? Whom? If it is not for review and not for merging,
please annotate it in the title ([IGNORE PATCH] or something).

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
