Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5E267939F
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Jan 2023 10:05:33 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05264C65E72;
	Tue, 24 Jan 2023 09:05:33 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A196BC01E98
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 09:05:31 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id e3so13142779wru.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Jan 2023 01:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wh9YPwUFmU9TlXE8h6aarMlvLtrqOnroY8ktmkM9cF4=;
 b=NZLu/mXW/jR7P3J17bOgR6qP2EvV8pBIAs2EK+EY8boNhE8FtlYTBwgw1o4LP0Ou5l
 7o9Ot2ODWivHgzBSAJ0IBV+AjHzdb/yukmzpiuClYyjEROnI3ViQRRGAxEgPg+Aa8riC
 /AEH2/T5wFH6p7d08431R59fEPkQPu0yfIC+5VFqCfp1HoGp3Pzsb2O0R+lJCpAhsUGS
 dxOGk6V7Uo+G3wxAFhgDfzHRNuEFmH3+71rHT0oNwPvn/PfJj4WULB6tuCfythudkkAk
 Iq3YSBNJYb0c/jvBZfE4g6qZiRcRY90ZDBvI2s9Iu4kIZb8WiN9rzzTZchvcSyXjzL9p
 p4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wh9YPwUFmU9TlXE8h6aarMlvLtrqOnroY8ktmkM9cF4=;
 b=PHw822shEDVA/OnM0WoXPblqJ7Bg3srSCz4lZ2LlkNgWSrfSDKCzlkyZvl+agbMoJe
 TJpjauc/rmi9oT7i4/76kpKChv12pexVinPXOOwACG8kHa6fTCZn0m3Xd+DTcuCNDChK
 YfrxuIzBtz2K4t4vyiyyHLoCUmtuIjq4Cj4wpJbzpRbaASoqyUxDH7nNsdPJ44DHwmcR
 nqnoePjT8LNSucgNBmEyapgRG0Tq88dV3mm/INxBcYMQg5daslbn2weDF6jaz66wOHbJ
 Rx14E+7xO9H5mDcI448bKmxTmeE9m4Dq5q5Vc2CJ4FVjR6rE+7FcLY0Ig2vmUQtHybFh
 jjpA==
X-Gm-Message-State: AFqh2kpzvwduCMKn01v1UoxFL3Ps2o9JGkOutMAtbsnqH7ST52X1hv5Z
 S8xMsbjsKjXBC7vWdaLuPGGWrg==
X-Google-Smtp-Source: AMrXdXukUC6LKF0R6+9iNiS48zc+9/Y6jhzP7MWyQ85ZuTQuZfZ3Y1McusWuaT27kf+OhuNHIrxGtQ==
X-Received: by 2002:a5d:6b05:0:b0:2bd:cf99:e6ab with SMTP id
 v5-20020a5d6b05000000b002bdcf99e6abmr22075514wrw.65.1674551131018; 
 Tue, 24 Jan 2023 01:05:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 l4-20020adfa384000000b00241fab5a296sm1365052wrb.40.2023.01.24.01.05.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jan 2023 01:05:30 -0800 (PST)
Message-ID: <71fd9674-63a7-9887-d602-1f57ae3982aa@linaro.org>
Date: Tue, 24 Jan 2023 10:05:27 +0100
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

Eh, this is not trivial to solve. The
"intel,ixp4xx-expansion-bus-controller.yaml" bindings add properties to
children nodes, just like spi-peripheral-props:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/bus/intel,ixp4xx-expansion-bus-controller.yaml?h=v6.2-rc5#n147

Any node can be there:
1. serial, which was broken since beginning but errors not visible,
2. flash, which work fine just because mtd-physmap.yaml allows it,
3. more?

Existing DTS of this ixp4xx controller have different nodes, for example:
flash, shared-dma-pool, ns8250, arcom,vulcan-gpio, maxim,max6369:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts?h=v6.2-rc5#n40

Probably we need expansion-bus-controller-peripheral-props.yaml and
include it in every possible child. Does it sound reasonable?

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
