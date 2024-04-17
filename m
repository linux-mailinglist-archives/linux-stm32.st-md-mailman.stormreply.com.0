Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3352E8A7DFF
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Apr 2024 10:19:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D51F3C6B444;
	Wed, 17 Apr 2024 08:19:08 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C492C69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 08:19:08 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-518a56cdc03so4642843e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Apr 2024 01:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713341947; x=1713946747;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3WVqvTWkSJuMK42oCBd4QTeLpoVUswiSt5bNCxSQhCk=;
 b=Y8zAqAsTU/l8XWRhQ85ZEcK8d8nW6pU5KRyv3e+Q+Hp2XDggbtBDhAJ/jSHShRd2mM
 X6wJSxOQyU9m/cEUKprkDB8dMR8MJUjAtg1YddEYNSCy485hokW1NnW/WeTWjINCeIFJ
 j2CREpMx+DZEOSZnVQcCYgNuHDMxWrfY4zg8kaBoBzK/b19NrYuhjD3Y2lRboIjLw2zE
 ICug5u8GQrCKXEHoyPb3T8OxrqKuTayB6XWToUSg3oUIFTUotQHuOhrp4eimRL+S8vaQ
 f3gLs/KJ//rgTnWDIII4h8K6cf8tDpwOD0HLgZ44XlvZ0xuJ1LgSBWLhyj/Z+958ZXMf
 U/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713341947; x=1713946747;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3WVqvTWkSJuMK42oCBd4QTeLpoVUswiSt5bNCxSQhCk=;
 b=C8huFfaPcPhNzRGkAERDxxCetjt/8vPVAEt2mkXP1lFm182W3TIKPqypwkey+RFrhQ
 QC3c5Oy6FkDhzkxSypf/vjKGoRPkJ6mH7GxunT4d3Sk7cJhf1lLwxie3qMWlmtmfZhc/
 xA6F+iYIZmzx5PtoZTLxPpTyazTohHW3LgSvVlf6KPn93VRl1xixUYKIF5HiBv18JPr+
 c5OLiZcmQ944Kx3JjPhnrmJ+HDCMs/4HcwP9AtMKnOHJQcAyUyLPWQVzWf5jJeGd0gzn
 NJPF+DsvLWEZYCQ7kVWcMSldWN3zM1741C/2pcY0KlBywzAWmu2CTiYBuwhWo75VLYcZ
 qp8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2xhS8K5ob8XD2cOvyRHLK+0bsIn9R4vOQHhr0IdWKLbPEZKYmUhwOJecvH7fMt1IIpFEOhyxJtXMxIEClBWrTjPiNbw1b6/wvgW5sI00JGGSMANkoXZjs
X-Gm-Message-State: AOJu0Yz3JYdVFBUg2hEAxMw5pBFds46YIF5nJzubSzi1RV8XmKDIzPcm
 qMczFQsl7meB8mnmjbSWjqhKtYPROCDRYG+/QW4tD1feQrXRbxI0
X-Google-Smtp-Source: AGHT+IEZH+ylq78IQkJNfP5FDxkXscm3aRgH3ubDyx46wNRqQbkl2T+2tyX+4h0ejdbXrQysINo+Vg==
X-Received: by 2002:ac2:5106:0:b0:518:8c8c:db33 with SMTP id
 q6-20020ac25106000000b005188c8cdb33mr8624693lfb.7.1713341946952; 
 Wed, 17 Apr 2024 01:19:06 -0700 (PDT)
Received: from [10.10.12.27] (91-118-163-37.static.upcbusiness.at.
 [91.118.163.37]) by smtp.gmail.com with ESMTPSA id
 p27-20020ac246db000000b00518948d6910sm1446525lfo.205.2024.04.17.01.19.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Apr 2024 01:19:06 -0700 (PDT)
Message-ID: <04f71d99-aad2-4e56-8f92-89469c159b48@gmail.com>
Date: Wed, 17 Apr 2024 10:19:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: kernel test robot <lkp@intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240408-rtc_dtschema-v1-2-c447542fc362@gmail.com>
 <202404170656.LoL9eBYs-lkp@intel.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <202404170656.LoL9eBYs-lkp@intel.com>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: rtc: google,
 goldfish-rtc: move to trivial-rtc
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

On 4/17/24 00:45, kernel test robot wrote:
> Hi Javier,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on fec50db7033ea478773b159e0e2efb135270e3b7]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/dt-bindings-rtc-orion-rtc-move-to-trivial-rtc/20240408-235612
> base:   fec50db7033ea478773b159e0e2efb135270e3b7
> patch link:    https://lore.kernel.org/r/20240408-rtc_dtschema-v1-2-c447542fc362%40gmail.com
> patch subject: [PATCH 2/9] dt-bindings: rtc: google,goldfish-rtc: move to trivial-rtc
> reproduce: (https://download.01.org/0day-ci/archive/20240417/202404170656.LoL9eBYs-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202404170656.LoL9eBYs-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    Warning: Documentation/devicetree/bindings/power/wakeup-source.txt references a file that doesn't exist: Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt
>    Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
>    Warning: Documentation/devicetree/bindings/sound/fsl-asoc-card.txt references a file that doesn't exist: Documentation/devicetree/bindings/sound/fsl,asrc.txt
>    Warning: Documentation/gpu/amdgpu/display/display-contributing.rst references a file that doesn't exist: Documentation/GPU/amdgpu/display/mpo-overview.rst
>>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
>    Using alabaster theme
> 

This issue has already been addressed in v2, which was sent a week ago.

Best regards,
Javier Carrasco
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
