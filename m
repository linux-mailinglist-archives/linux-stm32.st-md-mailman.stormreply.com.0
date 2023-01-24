Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C442B6791DB
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 08:25:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6FE93C65E72;
	Tue, 24 Jan 2023 07:25:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 752C6C01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 07:25:09 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so10208831wmc.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 23:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tf2jkhDB/fcmN7gxB9BcFTlLK/uYEMsrGqgyWUEbIpY=;
 b=Ey5ePlReG/n9vBilW4cfQNWTL/l/rns4G9TU3NjLnRqHlJJzRriYkfBLv5xkOYvf6k
 tNxSvygXO6JmhBMATZP+4RWAM/qYoK+q58K2fGxlVf3UbxlZmZosyZyB7cVttv347tmV
 ToZmZNkSArgBvXSky7SGWU5otTh8k17jeKQ6Uh0BaB+2hypaWFk51+cw5M9c8zLR4S3R
 rbDfCUXeYIQrU4d9Pt7pOiZaZYPBWWhjidrvFXtsrwVzlgWlckyPuyElevm1lIgZxXFd
 Sh35CcPBTdxpyV6N59BG7Xin73RUoxjOaqsLKKctlriqnkR8ys0RBffv86iFWpPani9v
 EefQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tf2jkhDB/fcmN7gxB9BcFTlLK/uYEMsrGqgyWUEbIpY=;
 b=jmwJgy7wvDOtfJFF1/66doEMIjVfJR2u0CdfCr0Bw6GbO1mdmYqHPECsEt36Lyr8HL
 KXIwAq94bEJu2bkltcMO1Ce9rz9KV2OTA8UFVV9lB9ir7WaNFnUgc2Ja+Hg8/OonFhzt
 k8Sl6y9cmiJjisXVd5V0n4XWHEEyKxxty9j8p32MLdD+AANWpXqjaYm93OV/LjM1lJxy
 iXCfBh4Zi1FXmtjD2XYojse1j9UC7e+8r+qwq6HpNJL19Z/ZT6t2Ld0iu/POybXIq2jB
 iqOQO+uMGyZJy6lYyis+uqXZZKOPFP5dKwXxGAjS7YnwMdLM37SmSuDlG+WRa6QIGBGX
 fnMQ==
X-Gm-Message-State: AFqh2koHTWiSGRJTAD8Hc2XUrScAAl3uSO0NO+HXnPsKsssNTIXgo62p
 rGnba5raGUbYHM2U0cLRF/Ic0g==
X-Google-Smtp-Source: AMrXdXvH5bGz6Fl5hSlEDfijg+poG9+NkFL619URN+WkIB9aNvhttf/yW+RHKBUEvSvYNh4NNDJZuw==
X-Received: by 2002:a05:600c:5386:b0:3cf:9844:7b11 with SMTP id
 hg6-20020a05600c538600b003cf98447b11mr27831353wmb.23.1674545108902; 
 Mon, 23 Jan 2023 23:25:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1c7519000000b003daf6e3bc2fsm1216707wmc.1.2023.01.23.23.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 23:25:08 -0800 (PST)
Message-ID: <e0dd24e8-9d4b-ea23-d1de-190330c0e825@linaro.org>
Date: Tue, 24 Jan 2023 08:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
 <20230123151302.368277-11-krzysztof.kozlowski@linaro.org>
 <167451486467.2795286.1299932821783618559.robh@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <167451486467.2795286.1299932821783618559.robh@kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Korsgaard <jacmet@sunsite.dk>, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-serial@vger.kernel.org,
 - <devicetree@vger.kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Chester Lin <clin@suse.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, Fugang Duan <fugang.duan@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Pragnesh Patel <pragnesh.patel@sifive.com>
Subject: Re: [Linux-stm32] [PATCH 11/13] dt-bindings: serial: restrict
 possible child node names
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

On 24/01/2023 00:05, Rob Herring wrote:
> 
> On Mon, 23 Jan 2023 16:13:00 +0100, Krzysztof Kozlowski wrote:
>> The re-usable serial.yaml schema matches every property with ".*"
>> pattern, thus any other schema referencing it will not report unknown
>> (unevaluated) properties.  This hides several wrong properties.  It is
>> a limitation of dtschema, thus provide a simple workaround: expect
>> children to be only of few names matching upstream usage (Bluetooth,
>> GNSS, GPS and MCU).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/serial/serial.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.example.dtb: serial@1,0: Unevaluated properties are not allowed ('intel,ixp4xx-eb-byte-access', 'intel,ixp4xx-eb-cycle-type', 'intel,ixp4xx-eb-t3', 'intel,ixp4xx-eb-write-enable' were unexpected)
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/serial/8250.yaml

Did I just forgot to test all the bindings (except the changed ones)? It
seems so, therefoer note to myself:

Please run `make dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions). :)

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
