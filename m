Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D43BAC7031
	for <lists+linux-stm32@lfdr.de>; Wed, 28 May 2025 19:55:15 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EEC57C36B3A;
	Wed, 28 May 2025 17:55:14 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 61D0DC36B38
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 17:55:13 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-604f4127399so10902a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 May 2025 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748454913; x=1749059713;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=zKq72M/qEBv2XF5kG5Js6DEWdgDDhp+0iFQY6DFj+VY=;
 b=YSVGbxCP2SE1XAF+cloJIqi27Wrh5tc9hOR9y1/x1rmF75JYH2hKRKJGfDHJBn7dgE
 k+ka8rbWmCMh1L+AJjVgI+h0H9WAOPkIdUks4jF1oQuNRujxOp2qsg69ynoMeTMNTTuk
 stP43rW1dxj4k3ytrWDD2/+RM5tBI/hXcXnLr7vX0Ux4dgZO+o6l/V1uTe+qJNWeewzZ
 xMoXGECI0PSruHm53opz/ahlev15tNCuukRNXDMN+3UYkRRE2srTstGMSBngTUhP6Zy4
 +kQQ7mlGSqq9IJhdsUGI2n3XW/5/sS2lHXv9eocA6oiYykHvjWDpeXoNbX9IaNMXN9pS
 5mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748454913; x=1749059713;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zKq72M/qEBv2XF5kG5Js6DEWdgDDhp+0iFQY6DFj+VY=;
 b=NBfllTeYw46E25MnGjn+CBK2YUWJ+5jKxLOtLl0D86GHycrMOsqhAxO2oKN18pMcay
 3TF9PtpsL+9HQeXVIJBeF02yXCccPuqcNOXztdl8frH7WA7QxHb6XvShGBV2DcI0iMOu
 GjXscTBIFSKbrahLWohCsBH4hdG40zbE/NS/uqVsog/RAOoN7Hb/ydQc2yBWJQ9+TpOb
 lcw47jveWuHVPNeyBAVM4+mTMetMTp5RYanFswMxM69MHG3r26/jGYF+qKGTVj0rrka+
 NUH9btw0fPzDevSW0/1SZcRIQ5xmZZ2xuNa0Nn0g72Nf5UF21zQY7VRF6giMXZhbsXF2
 OwtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOtWK8yug1Cl4tFOChg0CCJSiHHjQsrOk8JCkTc0GSQmKb4Ite7IUvYIHXUao/s/vCiItFk3gQh6a53A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yxog1zfgTolotgwpMXhct4eT1UCGsL4CJQx80pognmsw2Z+eHv9
 HwZzvlsX3w74JpridZ0LuFgdgsFsYloK22LPQeZhvBlRuZSfMSNtf6ahXqsvD/meGMU=
X-Gm-Gg: ASbGncvMPdTbybHsAOkpfkZ9RzFk0JJgib0rKKbJuDB/+1Tk+uwo/PZuepcSDfRNjZW
 7hwhBCjopQltumTLaQlwNcY6aA62R4bNvj++jdGClm4N4o/DpeWA7dR1laYpLXRg9cCM0f4Qn/l
 HVSwbNYwd7zv28+TiDE/8NW41Q1s4Wu+W/N7LZ0Fi91/OhkkmnMERssquk0mmLGmA/pFwc8WwKP
 VpGFjg+0muBD2N2Ax4ZEIhyQ/t1MqbQUOnZqCRlwKG+mhNHEHV6P/OmQoj0VqQaOvxXHw2gN0ic
 dvenOBxYH3zvuuOM4VTW/5rAOefTgNe1yMxchCBq723+epvRQnbCfOiZflZ72Wic7XiUr1s=
X-Google-Smtp-Source: AGHT+IH95g1w/ws+xXJBLuOV0eOuE1EWZf0NM3t92WzHnu25SknjKy+douiXLWJfZWhRht3yMBhn3Q==
X-Received: by 2002:a17:907:2ceb:b0:ad8:9b31:290c with SMTP id
 a640c23a62f3a-ad89b312d7emr148533866b.14.1748454912580; 
 Wed, 28 May 2025 10:55:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad8a1b5d89bsm141117166b.183.2025.05.28.10.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 May 2025 10:55:11 -0700 (PDT)
Message-ID: <b6b7fb61-878e-4407-b964-564efb3524b1@linaro.org>
Date: Wed, 28 May 2025 19:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20250528-pinctrl-const-desc-v1-0-76fe97899945@linaro.org>
 <20250528-pinctrl-const-desc-v1-14-76fe97899945@linaro.org>
 <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <CAMuHMdUGDf5n_Fg7pwiPumm95nPUXyH15geAy2ULwY3U+OtZJA@mail.gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Tomer Maimon <tmaimon77@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tali Perry <tali.perry1@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-aspeed@lists.ozlabs.org, Emil Renner Berthing <kernel@esmil.dk>,
 linux-rtc@vger.kernel.org, Jesper Nilsson <jesper.nilsson@axis.com>,
 Benjamin Fair <benjaminfair@google.com>, openbmc@lists.ozlabs.org,
 linux-arm-kernel@axis.com, Hal Feng <hal.feng@starfivetech.com>,
 Nancy Yuen <yuenn@google.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Ray Jui <rjui@broadcom.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Damien Le Moal <dlemoal@kernel.org>, linux-mediatek@lists.infradead.org,
 Lars Persson <lars.persson@axis.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Rhodes <david.rhodes@cirrus.com>, Michal Simek <michal.simek@amd.com>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Scott Branden <sbranden@broadcom.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, patches@opensource.cirrus.com
Subject: Re: [Linux-stm32] [PATCH 14/17] pinctrl: renesas: Move fixed
 assignments to 'pinctrl_desc' definition
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

On 28/05/2025 14:54, Geert Uytterhoeven wrote:
>>         .pmxops = &rzn1_pmx_ops,
>>         .confops = &rzn1_pinconf_ops,
>>         .owner = THIS_MODULE,
>> +       .pins = rzn1_pins,
>> +       .npins = ARRAY_SIZE(rzn1_pins),
>>  };
>>
>>  static int rzn1_pinctrl_parse_groups(struct device_node *np,
>> @@ -878,8 +880,6 @@ static int rzn1_pinctrl_probe(struct platform_device *pdev)
>>
>>         ipctl->dev = &pdev->dev;
>>         rzn1_pinctrl_desc.name = dev_name(&pdev->dev);
> 
> ... if you would replace this assignment by a hardcoded name
> like "pinctrl-rzn1".

I saw it, but this would not be equivalent. dev_name includes platform
bus id, e.g. pinctrl-rzn1.0 which might matter here - conflict of names.
Are you sure this would work fine?

Best regards,
Krzysztof
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
