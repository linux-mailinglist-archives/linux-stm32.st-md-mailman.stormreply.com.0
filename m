Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F1178D605
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Aug 2023 15:05:11 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AFD78C6B444;
	Wed, 30 Aug 2023 13:05:10 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 55B9DC6B442
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 13:05:09 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-52a3ec08d93so7273834a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Aug 2023 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693400709; x=1694005509;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=HEKRlFZUS3dyupZ+kK+mkGNYk/gW0Ty72y8W+FwpGBU=;
 b=rxry6Dgqazr8Gn2hkPidV1vFtAiGR7TVYShiWo3SapTmM2uTDrjbvKvbGwtY0DLCyE
 V3q0dJWA54MpWmDzQoyLbNPVQFTKXku+I7R5QCiODJCc9t/S+a9CBxMg4MMeToZYr+Wd
 dVosB9rwoszApZxRN/hGfaI1ej1U8UJ10myQdkfv8kjaARCdCnu+pl6PaMxHOOshQqd1
 hKgurUiIX3N6tMX3QLCA2qqzq2TZPgn/LlLLyi2JxKaOr02zPhAv2F8UCnYVBN1EkocI
 KSw5JexMB6naPa8KUl2fTNvuuksmOAHS/kAJ/5Vy7Sjt1kO7mlstP6CeEHsyGbP+m14u
 yb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693400709; x=1694005509;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HEKRlFZUS3dyupZ+kK+mkGNYk/gW0Ty72y8W+FwpGBU=;
 b=ax/lgunp4vCdbOc1J1REU0Iq94RSpofQRb252duJWu4ECVTW5Pn3oPMk0WTyQCLUWl
 DLb8tXNv297kJfqr5XtxjsblNnfalFRcwMes/C8oxPi83835QzHSj1KzyWCyebRIOjcI
 5lTSM1nq8iZ7jhs+Kay8mbijVolUZ3mFZMHvRYdKYZCPyNjwFdOwxpo0ve8cwOcWi+os
 kKOFX6yGQm4ZxvFiSGYJeWt3Rwq/ZqIq2XSR3PRBty4HAizf8Iwrql9k7AVCcZUk0rU5
 9ojyy2M1ba+hm35vHE7NF0aW5gLg5DwwZ5AeWQb6pO6zFXs7KatxZntuehAxBZzb7g7z
 oVRQ==
X-Gm-Message-State: AOJu0YwLtgXr4zMX/OqnhlA6a/KqP6d88JJoy32VbTKWRcJf64KvSSAf
 GuVglE3pnQOBZkQME9Cw/LpQ1w==
X-Google-Smtp-Source: AGHT+IG6tuWBogY1getqOWrJLQDobdIhDHQe+O6MXdBwyeWVbJP1FM/i5KkUVahXRdHtVbpn5qnMfg==
X-Received: by 2002:aa7:d311:0:b0:523:bfec:4912 with SMTP id
 p17-20020aa7d311000000b00523bfec4912mr1838174edq.11.1693400708725; 
 Wed, 30 Aug 2023 06:05:08 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl.
 [77.252.46.238]) by smtp.gmail.com with ESMTPSA id
 c6-20020a056402120600b005232c051605sm6740478edw.19.2023.08.30.06.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Aug 2023 06:05:08 -0700 (PDT)
Message-ID: <f40497d1-3547-9434-459f-050f592937ca@linaro.org>
Date: Wed, 30 Aug 2023 15:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexander Shiyan <eagle.alexander923@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20230830114335.106344-1-eagle.alexander923@gmail.com>
 <e2dc91a9-d027-dc69-14bf-3a1184045254@linaro.org>
Content-Language: en-US
In-Reply-To: <e2dc91a9-d027-dc69-14bf-3a1184045254@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com
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

On 30/08/2023 14:51, Krzysztof Kozlowski wrote:
> On 30/08/2023 13:43, Alexander Shiyan wrote:
>> Add support for the MyirTech MYD-YA15XC-T development board.
>>
>> General features:
>>  - STM32MP151
>>  - 256MB RAM
>>  - 2xUSB HOST
>>  - USB-C OTG
>>  - Gigabit ethernet
>>  - UART
>>  - Boot from NAND, eMMC, SD
>>
>> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
>> ---
>>  arch/arm/boot/dts/st/Makefile                 |   3 +-
>>  .../boot/dts/st/stm32mp15x-myirtech-myc.dtsi  | 351 ++++++++++++++
>>  .../boot/dts/st/stm32mp15x-myirtech-myd.dts   | 457 ++++++++++++++++++

Also naming looks wrong. This is stm32mp151, not 15x.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
