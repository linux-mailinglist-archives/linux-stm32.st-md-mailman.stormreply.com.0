Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC9D512D5C
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Apr 2022 09:52:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D6115C6046D;
	Thu, 28 Apr 2022 07:52:40 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B49BC5F1EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Apr 2022 07:52:40 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id gh6so7963044ejb.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Apr 2022 00:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GdFNh01KnHdXyUQY0UlCve+IbfOnTdZcZpTYbx0W6OE=;
 b=GrUVXhq2FTHXUqJvn8n3SHTfwmAFU7hI3tCHKNBCJLCgO2uxtcnJg4Lcbe/7bm8OYB
 7PMBQhploWlCxc4klm662G9P0eJfsh1JaAHm2dwPk66A9jDhCRwNfIgDXuBaysN0VP4q
 1a4voEZD8Qd2rh/XrdTa2FsurAgY64rUww627XFliVs5gaqL7Qzb9DLfhpbHR11lF+22
 b1SJP3RfQs2Dmk12mTzLT6mZxe2Rg1woXiC/J0RQYSRNG8Cb1QZQsCKFEjhZHPlFZcPj
 GzROVpNJtiDqLWU9DbRdbSWhij5mgLh7LiZwDF/27Q6IocXz/S7r8Mxd4NcJC/4pAsNx
 3ajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GdFNh01KnHdXyUQY0UlCve+IbfOnTdZcZpTYbx0W6OE=;
 b=rDtbe1oU1/F+cb8n4bwNxlazPcvniC/DI4BJPMBDp70C8eDFg7ErHT0xnKaVScCokf
 RCjQQCEE8ZtMYUbLHobyDLK0mN3++yya+32bWxJmfi4nGy9YGN97Ynqlm5NT+ib2buUw
 z+ksnsU9EO3Gfp1zqkN8KIr1V9ZK+qpe030S0LLiYHlGdWS+klsAKn0y2QleGN9KMQ3+
 E93HwWmZ5RVlpanldOB82xo6qrwb7infA/uQ7p3Ytt8Ao8cVmCmdrtuQlvbPkIiZeUkx
 0HwKZP5ecDnqyZB0GGN2vu9KdddS/X1JY1/3fgcVqd5YXXhCyOd75XvMViO6S+KCkO01
 iCiQ==
X-Gm-Message-State: AOAM532jGBV1Y0ubJRe2N8fCP0lZ71kcOK0Ny16F82U4LwTJ6x9kKP7l
 Ir0IUsdsyXF4XKSxndj716+65w==
X-Google-Smtp-Source: ABdhPJzKwH/FP2+g3iINJG8WBh0TBUXz2SIF9TozPDC3AqbgBpsu/3QYG4F4D103gYPQyA4lMnuMlA==
X-Received: by 2002:a17:907:3f0f:b0:6f3:8e24:e9e6 with SMTP id
 hq15-20020a1709073f0f00b006f38e24e9e6mr20150538ejc.128.1651132359706; 
 Thu, 28 Apr 2022 00:52:39 -0700 (PDT)
Received: from [192.168.0.160] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 z15-20020aa7d40f000000b0042617ba63b9sm1108780edq.67.2022.04.28.00.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 00:52:38 -0700 (PDT)
Message-ID: <eafbfa2d-ed2a-8b5d-5366-5f8b10c1ca98@linaro.org>
Date: Thu, 28 Apr 2022 09:52:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
References: <20220426073511.1160119-1-o.rempel@pengutronix.de>
 <20220426073511.1160119-3-o.rempel@pengutronix.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220426073511.1160119-3-o.rempel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH v4 2/4] dt-bindings: net: silabs,
 wfx: add prt, prtt1c-wfm200 antenna variant
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

On 26/04/2022 09:35, Oleksij Rempel wrote:
> Add compatible for wfm200 antenna configuration variant for Protonic PRTT1C
> board.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/staging/net/wireless/silabs,wfx.yaml     | 1 +
>  1 file changed, 1 insertion(+)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
