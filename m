Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A3878D667
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Aug 2023 16:09:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A75C2C6B444;
	Wed, 30 Aug 2023 14:09:52 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9D7B0C62EFE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 14:09:51 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2bcb89b476bso85056991fa.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 07:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693404591; x=1694009391;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ltTU7x1ubVYH6+6pxLfR8tGONMoKmhnogX675uv2utg=;
 b=x5/eXzJFAL4AKnjqC3QehoKscdDSHkqC4nwKKBS7IBdXVggxODrVD47YbQifMnjOaC
 SavUUeupG0EidtC/FZurserahbDZuyJ2heBLopg9ga3/XU52RAH2WDL+nERgcvSTNFC2
 jigHHgNAJ9BZr+JdERBxSdNn8sd54yONiN2NuMOzm6skNbBXgOi7qcN9V8ViSUD5EyGS
 yf3YpJE1Qc6FAqs+54LrLGISq8FhEHOG52bjEpFYmD8XMzYUhMfi1gnaCR+p+QTd78TP
 XKn00ypAPOltlSRr6GiP93mzrBn0TvAzccomtR6D7j6vqfnPqmAWZujeOz0y/OZkW+0D
 /gZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693404591; x=1694009391;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ltTU7x1ubVYH6+6pxLfR8tGONMoKmhnogX675uv2utg=;
 b=ZtY3QRiV+XsehVyA7EELcMhS8OrBi7nikadVR/2aH0NBAOrvSLjgb6CJYAB03xzu53
 zoJ1QIC1ZNURs0UgVj60Wo136DO/LH4X8lcHTiT+Ugk+KsCjrHVvNyjsnz5tzBeF7GBo
 GmC898rvQ+TPN8HfYV9ShRxooZkgL9Rw71AtIwjHKV46Dwp7fveoSChbBcN0EWRfjfnu
 eVWwqUzj3DLz07QJdtv4aukCGn+p0pNOuMP1kCfqY47FMnrZMWp2d2HnWWt/G+S48Tjq
 uo0bmpKLa/l3+w+cbB+lUEUOUhBFAg3Qex6V7UpWR87j43Lh7bs+UR9Wja/nTAsUKR+b
 F71Q==
X-Gm-Message-State: AOJu0YxVBopbGu9lTf9VNIzE2vggEbeNBCdBbPRvcpE1niriapSIhtfS
 b5Z+EQT6VuUQcMSuisXcLCOIIA==
X-Google-Smtp-Source: AGHT+IEvseMKjwvTdU+tirPJuBVAonhmctyF2ZHRYFGoUuMs1GJ6IviTz27bgTAovzvA+OCO/A74JQ==
X-Received: by 2002:a19:f816:0:b0:500:b5db:990c with SMTP id
 a22-20020a19f816000000b00500b5db990cmr1347609lff.57.1693404590749; 
 Wed, 30 Aug 2023 07:09:50 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238]) by smtp.gmail.com with ESMTPSA id
 lh26-20020a170906f8da00b0099cbe71f3b5sm7189616ejb.0.2023.08.30.07.09.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 07:09:50 -0700 (PDT)
Message-ID: <38cd46c1-d0e2-e27d-f872-87bfee9058bb@linaro.org>
Date: Wed, 30 Aug 2023 16:09:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
To: Alexander Shiyan <eagle.alexander923@gmail.com>
References: <20230830114335.106344-1-eagle.alexander923@gmail.com>
 <e2dc91a9-d027-dc69-14bf-3a1184045254@linaro.org>
 <f40497d1-3547-9434-459f-050f592937ca@linaro.org>
 <CAP1tNvTvd5mZ1eWiMeck14b5KGyyXBNrEE=of0OKesbNKE_jqQ@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAP1tNvTvd5mZ1eWiMeck14b5KGyyXBNrEE=of0OKesbNKE_jqQ@mail.gmail.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Add MyirTech
 MYD-YA15XC-T development board support
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

On 30/08/2023 15:42, Alexander Shiyan wrote:
> Hello.
> 
> The initial thought in the file name was that the modules could be
> equipped with a CPU
> other than STM32MP151, i.e. 153 or 157. The development board, as far
> i understand,
> equipped with a STM32MP151 only, so can we leave the current name for
> the module (15x)
> as is and change it only in the file name (and in compatible property)
> for the development
> board only?

Depends. I do not see SoM here. You called it "MYIR MYC-YA15XC-T", so it
looks like end product for me. Can the same product have different SoC
module? How would your DTSI look like? You include there 151.dtsi, so it
could not have...

Yes, you also need to adjust compatibles to reflect real names, not
wildcards.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
