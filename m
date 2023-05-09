Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E33236FCCAA
	for <lists+linux-stm32@lfdr.de>; Tue,  9 May 2023 19:25:21 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A2BCC6904F;
	Tue,  9 May 2023 17:25:21 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com
 [209.85.218.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 92A4FC65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 May 2023 17:25:20 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id
 a640c23a62f3a-965cc5170bdso875609566b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 May 2023 10:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683653120; x=1686245120;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Em0Tlxs0MLA5e+TD26EWYH4+AdIng+idy64D5M98l8I=;
 b=gpn6j1SbQSfKQb6jx5iCvuNvPv3Ym7oRaSmYNEvVsIwGwOet5lEy1VJGFgmrGIGIxb
 r8aQKa0ff/uq1KJvx7fFEGx2oGmSG+j7mqcEryVvfpimGi5GQZSlZYN0s56NBc3Q5bCz
 5uz12JOWNYFnEBwk4v9uIV4lxCQR9zNh7kXuj+U2u+dNva23kdfKW/bD7ax3ndWAeNmK
 nYuo5+GnpImO1ZD1+gZsv2ZoU8+xNykTKsXoyjdvejT6nEnhkzq1UytPGlNAie/mzpDy
 zhzN3JnDaLQ+V95GOu+RmJLrwck0YU373bwHLQ4E3QGVKuS97Dd8TecAXqsSZH/S9EA+
 hQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683653120; x=1686245120;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Em0Tlxs0MLA5e+TD26EWYH4+AdIng+idy64D5M98l8I=;
 b=WROLznlmXIDOMU/Zju0iMECIg5qviNOS2QgferH2M3gGAfegAJ/vVVNUiTrv6I5h/I
 VKbh1JYfpPb6rOGWakiWsTnU7/e5qfx5X48SaJ7ipCQpP0i+puNv5naBrEJhnGa8icHp
 BXttJJ7dt4JncvhzdL7vXTsWHRpR9LDzKfhcnxnsE4mVXWhN+QFF482bxqtsXBHw0yRo
 vSF2LII78x17WL0nzq2hUJoAB0kqcAsRvP9zrjlaDBMmRiTlG4opJqxXhCOGvIkZ1FTn
 GbUYVaTARoYwQ9UifHYVoiKvaiBvBkj8NlBFaZEvNjpQ4YXsgGZBfB1cdrQ9gw7xPClK
 so6w==
X-Gm-Message-State: AC+VfDw8OciQkHlqFCzpCvtcKQqC976D3sI5nnzRXdSFO4iZD8+AwJCN
 uG6TeegoeRJd0i7Dfp1LuJc/8Q==
X-Google-Smtp-Source: ACHHUZ7137L7AL+XIMh5eeRUH1cmEK8Mv5X/suJrhcGkTmjpiqQqoAFJpseg+wDmAc66xXYcnPdTuQ==
X-Received: by 2002:a17:906:fd88:b0:965:a72a:b2ae with SMTP id
 xa8-20020a170906fd8800b00965a72ab2aemr11686758ejb.60.1683653120039; 
 Tue, 09 May 2023 10:25:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d0d5:7818:2f46:5e76?
 ([2a02:810d:15c0:828:d0d5:7818:2f46:5e76])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a170906380900b0094e1344ddfdsm1553378ejc.34.2023.05.09.10.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 10:25:19 -0700 (PDT)
Message-ID: <0fdc9a5b-d369-8dd3-3f5f-1280ed25150a@linaro.org>
Date: Tue, 9 May 2023 19:25:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Stefan Agner <stefan@agner.ch>, Marek Vasut <marex@denx.de>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
References: <20230426-stmpe-dt-bindings-v4-0-36fdd53d9919@linaro.org>
 <20230426-stmpe-dt-bindings-v4-1-36fdd53d9919@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230426-stmpe-dt-bindings-v4-1-36fdd53d9919@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4 1/2] dt-bindings: gpio: Convert STMPE
 GPIO to YAML schema
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

On 08/05/2023 14:35, Linus Walleij wrote:
> This rewrites the STMPE GPIO bindings to a YAML schema.
> 
> We add the properties that are used in the widely used
> STMPE GPIO device nodes found in the wild, most notably
> interrupt support, so interrupt-cells and
> interrupt-controller is now part of the bindings.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
