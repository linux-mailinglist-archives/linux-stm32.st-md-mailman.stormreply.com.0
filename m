Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A59FF7162F9
	for <lists+linux-stm32@lfdr.de>; Tue, 30 May 2023 16:04:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 69E05C6A613;
	Tue, 30 May 2023 14:04:07 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 74618C65E5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 14:04:06 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-96f683e8855so649589566b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 30 May 2023 07:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685455446; x=1688047446;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kAaRAHBvmn5TiFi21og9H3c8Ufuxifop3fwjLkOCVes=;
 b=Aek8BtY/hryhXWGyso4A1d8LRPMyM1i6oQXslgfxRZnF8cAliqg5ePF4ytNdN3E+o6
 WmS0KpTrdb3r9/kUbqLGU09/wzgYaICG31s/pkSXtBRptvvmnm0O3TN+lcBEOJfNyQJw
 Jyo2qk66nTv4MIvWjps71q6cdC0XZ5627vivMGlIpQg4f2iwaUCKoZOPqxJSEA+cUqme
 7SLaLmXWpBAVoIJTMzfnNHlWJ7YVzvolgK82JIQUgFSaHUaikPkTgbkYT3r1izuzCR9C
 75Yr1WaVTrV4AvNAMD1ft0m7sL8mFg0r8vukhZyV6EL86xe1Oxzd2StmJY2OC4/ZSeUv
 gjig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685455446; x=1688047446;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kAaRAHBvmn5TiFi21og9H3c8Ufuxifop3fwjLkOCVes=;
 b=cx4+UAdsxUF3QubhNhq56LXSEHTVVdskfnqpFBxt0jDsFbvaEm44TLBziE/tadnlXW
 CELGacQEPp2L6jwxHnj9DozE1SOktA0CAKLUhgjpw48UYquQw/Nd8vyV372aUOuslQ9V
 NFYBAIuLF+GeJFxo47rKBDvy31UOzvXLxU22MGCVH9cTsVQpmB98wf7MlEEOqN7KBbMQ
 oSvpwXlmp7z90NBGm1TN+cA7xv/mkCvnG+wWXOnuDB0Ss/LU0OSqpFHaaUxu4LRt73OD
 bMaEMO1ET0PU8FlTLcgovB3oN8SeKR2z6XIBToHVTf/SSDcR68QxasjxHycHsDuAz5Sa
 w8GQ==
X-Gm-Message-State: AC+VfDz6BngVXduZNN8mu6xb3z60RZ/p6Ib/idTDm7quV/EdN21pG9YL
 sBROhZI33WvedUdhfsSl3TcRRw==
X-Google-Smtp-Source: ACHHUZ5eqKSA0S3xLv0PuDvXBu0UeK4GkplmqjpmtXOP8+/T/kVFZMGqkpaNHjXSCThrWsX2lB2TYQ==
X-Received: by 2002:a17:907:724b:b0:958:4c75:705e with SMTP id
 ds11-20020a170907724b00b009584c75705emr2423155ejc.17.1685455446007; 
 Tue, 30 May 2023 07:04:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170906148f00b00969f13d886fsm7439467ejc.71.2023.05.30.07.04.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 07:04:05 -0700 (PDT)
Message-ID: <1cce5a11-f182-04b0-0aa3-ed27614a564d@linaro.org>
Date: Tue, 30 May 2023 16:04:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>
References: <20230530083713.2527380-1-o.rempel@pengutronix.de>
 <20230530083713.2527380-2-o.rempel@pengutronix.de>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230530083713.2527380-2-o.rempel@pengutronix.de>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v2 1/3] dt-bindings: net: pse-pd: Update
 regex pattern for ethernet-pse nodes
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

On 30/05/2023 10:37, Oleksij Rempel wrote:
> This patch modifies the regex pattern for the $nodename property in the

Please do not use "This commit/patch", but imperative mood. See longer
explanation here:
https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95

> device tree bindings documentation for PSE-PD controllers. The updated
> pattern allows for additional node names, including those with a hyphen
> followed by a hexadecimal digit.
> 
> Before this change, the pattern ^ethernet-pse(@.*)?$ only allowed for
> node names like "ethernet-pse" or "ethernet-pse@1". With the new pattern
> node names like "ethernet-pse-1" are now also valid.

This part is duplicating first paragraph. What you should have here is
answer to why we need it.

> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  .../devicetree/bindings/net/pse-pd/pse-controller.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml b/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
> index b110abb42597..3548efc2191c 100644
> --- a/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
> +++ b/Documentation/devicetree/bindings/net/pse-pd/pse-controller.yaml
> @@ -16,7 +16,7 @@ maintainers:
>  
>  properties:
>    $nodename:
> -    pattern: "^ethernet-pse(@.*)?$"
> +    pattern: "^ethernet-pse(@[0-9a-f]+|-([0-9a-f]+))?$"

No need for inner ()

Let's make -N suffix only decimal, as discussed here:
https://lore.kernel.org/all/20221123024153.GB1026269-robh@kernel.org/

I will send a patch for other files.

>  
>    "#pse-cells":
>      description:

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
