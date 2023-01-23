Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6322F67801C
	for <lists+linux-stm32@lfdr.de>; Mon, 23 Jan 2023 16:41:04 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E20CCC69055;
	Mon, 23 Jan 2023 15:41:03 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3EFC7C01E99
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 15:41:02 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id y1so6703147wru.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 23 Jan 2023 07:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TXCK8+4pwBoN/PPZdEC5uZ0441SKSjWCGzz9sOXF4WA=;
 b=Gq7N/5f/dm907S2s95WddCgz2SPDJqx3jdQjw63tObNUotX8A1a2nwEQTIW8zLc0Bc
 32Ow2LueltQlPmFD27f3FiTg8+gy4lXPOTAEvCKMwLykk+YnCH9QOPqg6FhyXWijJtyZ
 59H0hdbLitzR0OuveGHOcXUhmgTDyZyFM/3dDMhwD/n/qKdf2a5hnTxCVGlDG9vTT5gs
 /b0iXquNdt1ZvKxoABL9FXeZCEIVBbk6AyNHp3Dg4Koa4FZ0febLMj6lvtWb1+cVQmtL
 9BjCADRSb0hhSHj1ZZzacokBiYCtFXPOe0KP/odN2uNCoOC5+H9t75lUAcHxQKzcSQgi
 4RsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TXCK8+4pwBoN/PPZdEC5uZ0441SKSjWCGzz9sOXF4WA=;
 b=4mXtLX4uvW1irOPbJ/rhOfqipT7HSt9DCbDbKlzvENY8yyI2FR8hK8J++kHBVbKVFG
 P0qbdtZ6imhW0i9rOCc/cYX3qlIr50S8fX3gocQRO0ZeZmlAvCpdf82mDegDvYvfy03w
 KH9nY+KWjDHUhXCklm9v6INVYXxTw2VhLxNwNmU/oFM4iZoDofqW+mI0WeRVCamQY+s/
 aeBvOF2u5GuJMflQ1O5pt1C0lusK6Xlpn3pV46JPJIYbWvso/Em5wmP78ffmzdPWvbh3
 K/DIZg2VocLt84L8YQOLxWYEEs42cty7FqIgqAz3nAG/yEQt10hAOPVr9yk99z8Eu59V
 NelQ==
X-Gm-Message-State: AFqh2kpC0HWFyIEq7cJpbUjFJNyOqSERgqdRpFw00AwwtvhFr/YKJtR5
 ot1Bsnsr9NH3XVr+H4H5dOUgDw==
X-Google-Smtp-Source: AMrXdXuBoUwMvAd/YfOcifByrJaMm2ho3lHEp8fql+PNjdwlzRsoBXxTm0E+49t+J2WwjGL6pXs8KQ==
X-Received: by 2002:a5d:63c4:0:b0:2a5:3a52:a034 with SMTP id
 c4-20020a5d63c4000000b002a53a52a034mr19494443wrw.35.1674488461847; 
 Mon, 23 Jan 2023 07:41:01 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 n9-20020adf8b09000000b00241d21d4652sm4602308wra.21.2023.01.23.07.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 07:41:01 -0800 (PST)
Message-ID: <9000e022-69be-3324-1e6c-a255d56a1dd8@linaro.org>
Date: Mon, 23 Jan 2023 16:40:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Michal Simek <michal.simek@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Lubomir Rintel <lkundrak@v3.sk>, - <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Michal Simek
 <michal.simek@xilinx.com>, Chester Lin <clin@suse.com>,
 Fugang Duan <fugang.duan@nxp.com>, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Pragnesh Patel <pragnesh.patel@sifive.com>, Le Ray
 <erwan.leray@foss.st.com>, Peter Korsgaard <jacmet@sunsite.dk>,
 Tomer Maimon <tmaimon77@gmail.com>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20230123151302.368277-1-krzysztof.kozlowski@linaro.org>
 <20230123151302.368277-5-krzysztof.kozlowski@linaro.org>
 <26046a72-27e6-213f-6b69-5cb82367dcf9@amd.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <26046a72-27e6-213f-6b69-5cb82367dcf9@amd.com>
Subject: Re: [Linux-stm32] [PATCH 05/13] dt-bindings: serial: cdsn,
	uart: add power-domains
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

On 23/01/2023 16:39, Michal Simek wrote:
>>
>>   examples:
>> --
>> 2.34.1
>>
> 
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> 
> btw: I was running it and I have seen that properties are checked only on nodes 
> which have status property okay. On disabled nodes properties are not checked. 
> Is this standard behavior/setting?

Yes, because disabled nodes might be missing several properties (e.g.
clocks or supplies).

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
