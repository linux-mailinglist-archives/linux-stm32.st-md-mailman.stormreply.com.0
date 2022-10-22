Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A27FB608DF4
	for <lists+linux-stm32@lfdr.de>; Sat, 22 Oct 2022 17:18:57 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 206EAC64105;
	Sat, 22 Oct 2022 15:18:57 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35203C03FDA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Oct 2022 15:18:56 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-13b6336a1acso1579572fac.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 22 Oct 2022 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gz0LxUsOUlJDcIAW5bPu+WDjpQGro2FyWxGKpu7r8bo=;
 b=gWrs34NeTJPV2fQ1MVoQY+zpFojHR3D/A6fVxaEOoPyaG1lz86TK/RINtSik3ihs6m
 epr6PhFlnoD33CCeTfWoNQCRee99kzlwRupaR937A3VU5HU4OTIvs/zluF82SMnywl6D
 HdEJ7m7PbwxapFaNOFa9ppWW4y91iGtKkwoLpnocgDPBTYKE8ItremNKc8YrHhceRIZp
 h3VMtehI1AqTwZwEWQcTgFOjDVRQQngjmAnbv2gz4Ef/Bbck+zcB6GCOTs8PKUKrqPeL
 49sPdfcCEYUyqTEphtRdJczJc984b2NmTshEFvs/XiFALWDOPilFuaMHYm7NR6Fhz+qX
 X9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gz0LxUsOUlJDcIAW5bPu+WDjpQGro2FyWxGKpu7r8bo=;
 b=gHrFWr5+rXPFT9Mxsia5MzusgiAsjlJHvFu3DmKcN1EVI8TsYNa24DEvJGSuIu+X3N
 hth86Fm0bPBbem2RE0kLcst9pOZ0SXGJ9HqnWqf4FROkJS8J805JTiz2GfSpzplt4veu
 Ws+5sVRNO71KAChS+iYU2DfmNZDXmqwDoZvJu7bZ3+lnTr14EOqlTYG+zz9lgvpNd56p
 Zps8vBrykxIeFO5S4SDsZcUw4OaNZ26rdYirXmLomOTI1BSbznET1hWCC7GHeOhoqM27
 cHkeA/VWGarp7Q8vAyXhb3/GsYG2+YoR/3/ss5Ck71DKtPK0nz3lzH4rKwZ6vJqIh1wk
 nX4Q==
X-Gm-Message-State: ACrzQf2r/AXpLB6839GYAYqmVbIA91Jd0ro1By84gbst+lJ6Jq6uJdE+
 yvU7VR+Y1r6MjAGKXyC6iiAsEQ==
X-Google-Smtp-Source: AMsMyM4Ums0et6AQMZox+xdB7Wz2plUu78klbaMd0EOzV1OnnwGbhhl8/BymyNDqbBFL+Y+cBT/t0g==
X-Received: by 2002:a05:6870:f288:b0:131:de71:3eb6 with SMTP id
 u8-20020a056870f28800b00131de713eb6mr31239483oap.63.1666451935002; 
 Sat, 22 Oct 2022 08:18:55 -0700 (PDT)
Received: from [10.203.8.70] ([205.153.95.177])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056870310500b00136c20b1c59sm11538284oaa.43.2022.10.22.08.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Oct 2022 08:18:54 -0700 (PDT)
Message-ID: <e7ace68a-98e5-63c8-7dd7-a35d0eba1c6e@linaro.org>
Date: Sat, 22 Oct 2022 11:18:49 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: Arnd Bergmann <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20221021202254.4142411-1-arnd@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021202254.4142411-1-arnd@kernel.org>
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-iio@vger.kernel.org, alsa-devel@alsa-project.org,
 dri-devel@lists.freedesktop.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Ben Dooks <ben-linux@fluff.org>, Simtec Linux Team <linux@simtec.co.uk>,
 linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 dmaengine@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 00/21] ARM: s3c: clean out obsolete
	platforms
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

On 21/10/2022 16:22, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform was marked as deprecated a while ago,
> and for the s3c64xx platform, we marked all except one legacy
> board file as unused.
> 
> This series removes all of those, leaving only s3c64xx support
> for DT based boots as well as the cragg6410 board file.
> 
> About half of the s3c specific drivers were only used on
> the now removed machines, so these drivers can be retired
> as well. I can either merge the driver removal patches through
> the soc tree along with the board file patches, or subsystem
> maintainers can pick them up into their own trees, whichever
> they prefer.

Just to be sure - do you expect me to ack the series, or rather as usual
pick them up?


Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
