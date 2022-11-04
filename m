Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0B7619677
	for <lists+linux-stm32@lfdr.de>; Fri,  4 Nov 2022 13:46:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A317DC65040;
	Fri,  4 Nov 2022 12:46:40 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A5DC0C035BD
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  4 Nov 2022 12:46:38 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id h21so2937812qtu.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 04 Nov 2022 05:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6mj+WKlY1HcQxQ/yWU1qrQ6DNMIOjDVUH0LcSZ0W+fA=;
 b=unEXYlUf8ILSnT9vwL7798Xkt5Aexz4M8v4axj1/7yv3c+iNWdPmwEVNOI0gskLjyV
 53WPal+SwjlN3jD3Ef7PnwByo1YPsmfH+lt+1Mbv/boGDhsWn72p61fJr74aQLlhMNOs
 4KWk7N0KLPUSFcgsKPiqRzCRI1zHmJyuYrvib+GVC+MGCKHpLEEdMYa6rD+DDB5jmC6G
 vvLghRC6CXFyJT1hkaJm0TdFnJ8rcsp63pAcktv1di0g96lUOZhqIahbIxdkzgh/+nRo
 OXwwqFSODrz9mMS5Op0HM3HDld+NU6m0l0pDlYKdsP9gxwQ0PXmAstVwPBY84nUrA5Py
 7xJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6mj+WKlY1HcQxQ/yWU1qrQ6DNMIOjDVUH0LcSZ0W+fA=;
 b=IrLX99ZH+bAEMvaAaYbsH7hIJ3bdr3HdML4l067l1d2VCElNMM9gBPpnbKjGIo0MhU
 EDXBUGJ8p3mjFFitxJBtbRbs7sUUOrxJjQJKQXqo4fvpnZ85fMMqGE+CIU8bqV7mZARq
 5DYYpczcb2GecvBM5eM6wHT5m3xZeV1yb2yU4FuYcQWGhVJgx2f6YLqeOZDMMb/5US+c
 ynP5d3zkIaDbndgaMISm3n2bO878FHZ7GZ+at3Fm34lgLmvC8XcwqfuyRL/BIYecyd0a
 bhORlk8ytdFl+Ol8ZCSSZGmkh8zdY31Mk7pOfCRfMsh21ycTOtK/cwqvg3h6PyFgirdQ
 z2JQ==
X-Gm-Message-State: ACrzQf1lMYCy+M/EkhCn3kv0TiyS7cB+6rng8NExfUhA+XrAc/t4VQpK
 dUiqWsvd1gyUSXbFtrn0MOFpYQ==
X-Google-Smtp-Source: AMsMyM4tqFfqwLOJfws9M+0wxPnylrB+BGQ7llCpIk8lmh4qqb2DGSHSEHE3Qb/F/O+F1Arw4YIfXg==
X-Received: by 2002:ac8:7508:0:b0:3a5:298d:c269 with SMTP id
 u8-20020ac87508000000b003a5298dc269mr20795904qtq.464.1667565997731; 
 Fri, 04 Nov 2022 05:46:37 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b?
 ([2601:586:5000:570:aad6:acd8:4ed9:299b])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a05620a0cc600b006e6a7c2a269sm2832382qkj.22.2022.11.04.05.46.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 05:46:37 -0700 (PDT)
Message-ID: <82801ce8-3a25-3174-65bb-239875065761@linaro.org>
Date: Fri, 4 Nov 2022 08:46:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Sriranjani P <sriranjani.p@samsung.com>, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, joabreu@synopsys.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com
References: <20221104120517.77980-1-sriranjani.p@samsung.com>
 <CGME20221104115909epcas5p25a8a564cd18910ec2368341855c1a6a2@epcas5p2.samsung.com>
 <20221104120517.77980-5-sriranjani.p@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221104120517.77980-5-sriranjani.p@samsung.com>
Cc: devicetree@vger.kernel.org, Jayati Sahu <jayati.sahu@samsung.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Pankaj Dubey <pankaj.dubey@samsung.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/4] arm64: dts: fsd: Add Ethernet support
 for PERIC Block of FSD SoC
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

On 04/11/2022 08:05, Sriranjani P wrote:
> The FSD SoC contains two instances of Synopsys DWC QoS Ethernet IP, one in
> FSYS0 block and other in PERIC block.
> 
> Adds device tree node for Ethernet in PERIC Block and enables the same for
> FSD platform.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Richard Cochran <richardcochran@gmail.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Jayati Sahu <jayati.sahu@samsung.com>
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> ---

Same comment apply.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
