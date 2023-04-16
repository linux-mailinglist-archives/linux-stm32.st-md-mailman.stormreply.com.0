Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E6C6E3A79
	for <lists+linux-stm32@lfdr.de>; Sun, 16 Apr 2023 19:26:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4169EC6B448;
	Sun, 16 Apr 2023 17:26:30 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 82B73C6B446
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Apr 2023 17:26:29 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id dx24so14337880ejb.11
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Apr 2023 10:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681665989; x=1684257989;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=VmJlKr7h7wrZk7+EWt+2i+sGb391Uksv0LFb5B7lgMY=;
 b=oSbPgpXvDFIZlnRCzfUa+M5xXfSTYT/azB5s8gUdOo8H7YPyoJxMsDJT/9FBXKTGN5
 4lvzDMaeho6hryYvHayGj5p4pR8yL4fYaCl+B3wYNiOj1/EaWh+ux0AJGarPrF4Vt9Gv
 /3BmMfURGNS220VFcST7FcLxTbUecKCbOwAX5ViP++6MdLThh1P0mZoAglk4vFvnZoQD
 ndmxTSgez/HJGCLoU2eIVo5HgvasKe7jC7bmpNZ0JUqHyIsWNoRGdMUHa2Qfs67FTjqI
 FMTRzwNUpvV/LDs9tXszqgAmdVrbkZRgooxxL32xLFBfc51bHXowTfkmNsNdRbeQSnOL
 i8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681665989; x=1684257989;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VmJlKr7h7wrZk7+EWt+2i+sGb391Uksv0LFb5B7lgMY=;
 b=cUp0JXAYxlVLPU74BuHBu9q9smW6eG797IE/p3x5psA9EMCsXBZICScgPwKpy+XvZg
 WYPagNbAcTK5OPjt7zS0ngs+UIB6WvwNW+8Rd2SisEFt91KJjMiS8+dqPqBSD3CMFTXG
 3HI59qoqIjseFXUx0zSgXFahWa3bVIJLYVm/iMLi6dJunh4XfDnTWszOXF+p0c/XJ1LH
 jHw2LkW8UnIsnrxKzbNT+hLnO+s9AbjNQGhIyK8/DFx6zOYc9IxCX2tRdkTfwtA4pIvd
 lNUinqqoCrsPltSk45eQ4tquLLN3NJODCU4pAi0zNwQioWd9seNYe8Ow5j8KiDH+CGJk
 53/A==
X-Gm-Message-State: AAQBX9fhCybG3rc3QGreeWNbfqj1J+U1HyTUcipAiNt1cy55YKmVphFz
 V0szxIHywJVoN4xZue7Jq3UEuQ==
X-Google-Smtp-Source: AKy350ZdSBYoLUiMvinEM1HVcDg1eOINAy32L8MsvIrHeB/CrkvnDl+z8dFUS9Lgv7qkJxYcSWJNCg==
X-Received: by 2002:a17:907:985b:b0:94f:3ce3:7cd9 with SMTP id
 jj27-20020a170907985b00b0094f3ce37cd9mr3330134ejc.10.1681665988967; 
 Sun, 16 Apr 2023 10:26:28 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92?
 ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a1709060b4800b0094f3cb173c7sm1550313ejg.63.2023.04.16.10.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Apr 2023 10:26:28 -0700 (PDT)
Message-ID: <abefdf2e-076c-6f0e-46e3-74dae3d068c1@linaro.org>
Date: Sun, 16 Apr 2023 19:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <16d3bb91-af02-2504-1a8b-7805a2d30bb4@roeck-us.net>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <16d3bb91-af02-2504-1a8b-7805a2d30bb4@roeck-us.net>
Subject: Re: [Linux-stm32] [PATCH 1/6] dt-bindings: watchdog: drop
 duplicated GPIO watchdog bindings
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

On 16/04/2023 18:04, Guenter Roeck wrote:
> On 4/15/23 02:51, Krzysztof Kozlowski wrote:
>> Two conversions to DT schema of GPIO watchdog binding happened and came
>> through different trees.  Merge them into one:
>> 1. Combine maintainers,
>> 2. Use more descriptive property descriptions and constraints from
>>     gpio-wdt.yaml,
>> 3. Switch to unevaluatedProperties:false, to allow generic watchdog
>>     properties.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> For the series:
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> On a side note, the e-mail addresses in patchwork are messed up for
> patches sent by you. As result, I can not reply to your e-mails after
> pulling a patch from patchwork. This means that some replies get lost
> if I did not keep the original e-mail.
> 
> That is how it looks like after I pull one of your patches from patchwork:
> 
> To:
> +=?unknown-8bit?q?Wim_Van_Sebroeck_=3Cwim=40linux-watchdog=2Eorg=3E=2C_Gu?==?unknown-8bit?q?enter_Roeck_=3Clinux=40roeck-us=2Enet=3E=2C_Rob_Herring_?==?unknown-8bit?q?=3Crobh+dt=40kernel=2Eorg=3E=2C_Krzysztof_Kozlowski_=3Ckrz?==?unknown-8bit?q?yszt

(Trimmed cc list)

Thanks for letting me know, I wonder what's the problem. I am sending
with send-email exactly the same way every day, but somehow this series
have such header in Patchwork:
https://patchwork.kernel.org/project/linux-watchdog/patch/20230415095112.51257-1-krzysztof.kozlowski@linaro.org/

Which I do not see in:
1. lore:
https://lore.kernel.org/all/20230415095112.51257-1-krzysztof.kozlowski@linaro.org/

2. Previous patches on Patchwork:
https://patchwork.kernel.org/project/linux-watchdog/patch/20230310223012.315897-1-krzysztof.kozlowski@linaro.org/

Lore (1 above) points to possible unescaped UTF character for
rafal@milecki.pl, but I wonder why send-email did not handle it.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
