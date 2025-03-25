Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9DA6E975
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Mar 2025 07:06:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6BB02C78F68;
	Tue, 25 Mar 2025 06:06:36 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id AB8DDC78F67
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Mar 2025 06:06:35 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-549963b5551so5371847e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 24 Mar 2025 23:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742882795; x=1743487595;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UpkYXileyTcIk8TFV6as38CU1iJIxbB4fpN2GYjcrIo=;
 b=iahLo2Q7FNUanEtC39YU2l0z/U84/k8eGauk5ckIa071gmgDXAve8mHClX7d6mtXvE
 M0M4C1MWtoMqk/atWIEKgphozo33S5AECQ5t9kxz0wfsbBE2BYf+FlZmsae+6OMwtRBX
 g0dZZ8KDjvcWa7FKK9c+kW9XCEqcoqD5SVHezirDkJUlv6A5bGWNut4NpEJfnGjr4EEU
 Cfpe+ROlY1w+s7Y6qtVpXeP0TcBreU5wxe368/fiDs3+Qa5XIn5MQ/oILHNbVFAu3RfK
 JM09iCTG/CZKz2pKNLUZkmhY1mO0EdycTum/TOxicc8lLs3PM2Jq1kC8aQWfcrgKvB12
 8Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742882795; x=1743487595;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UpkYXileyTcIk8TFV6as38CU1iJIxbB4fpN2GYjcrIo=;
 b=Bm4lUHHHANd0LqtEOHIrmemWZcStEbc19//Wsk2PMheF1L5OM/uOr7ELR/61H0FzeX
 F7uUR89ypxlP4jHq7Sh6cDaWM3Zxvt5GWYAs4+OLsLnEjhwilS/6RkybwZBYiJ25Vo95
 6g50ASq0PsGllxfPcjErGq5Gm1SXF7lB7EzB9TciQLZtB0UfvckrAP+0n/TGq6n7ctfg
 m/lktS91UJ8daHENlCgx5JeD2dMiKG+9Tf4Xo10NQJwIMp5xh7om5TpIyX7zYwZ0W3lW
 8TX6SN3KdU8Ar89D5BezhbzrSqjgvfGd23vd8hHWJB/1npWsalC/WP1zksp37SVlUFwX
 kpsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnDAmGBUVHWsbjezjKr10KzwqqniBNva/LI3RyWC+5dL2JC6s+tKvd4K9ylNlPzgTk+YOyQ8SCHhNa5A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzkOnR/JPR82PFOgHcjk23bue2UE7XK895qKZXXeKgu68q4Kr21
 acD72Eor1yOQpirgan7EkRFU4geNO9Lm330hY2nP0Iui9JmaWQwi
X-Gm-Gg: ASbGncsEDHVEKjdKF10fjmKsmRjR4gGn7ssg6FV/wv3cN99MZBSX5OQx6WHUozxwZoF
 XIuVlWPb0dtcnAcrzC7o+i+sg6c0XivUez4eVcAr+gy0YWuTtdmDQnph9c8iZReS2uyihGktD9p
 FEmLdXHktlY8hyEfuLKZxB7yz9QXMCvNBlCdyz99Csz0voeA9UowtsYOySuMzdz7L13U+q5Kgjm
 lp3D2Tjp4JdEFauzhC74R0+D2iRYoxg1hsZpSXhd1XvoxwnVxsngVuE7TBUaUX9d1tBRANVG++8
 xFTQbAa0TVXxk6ukAKfuBBTw0h5GceVPe/pSEIEHjVqwSJvLkNvszvofeniVUfEYPjHiqgUShPo
 CJkWdTJ8SIGlIRqWUtsDz3D/oE7nT2cizipoN
X-Google-Smtp-Source: AGHT+IHRTEer1v2dD1wPBDR8uDVpWnU/Fj1Edj8fXP52s1Zi+C3mR/ra+yeS2GT0K1XmpsBuk0gkKg==
X-Received: by 2002:a05:6512:ea2:b0:544:ffbe:cd22 with SMTP id
 2adb3069b0e04-54ad6500d8fmr5018858e87.46.1742882794350; 
 Mon, 24 Mar 2025 23:06:34 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703?
 ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ad65037d5sm1368146e87.180.2025.03.24.23.06.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 23:06:32 -0700 (PDT)
Message-ID: <007c6e9b-ffcd-42ef-a3f2-4b8fb62e99eb@gmail.com>
Date: Tue, 25 Mar 2025 08:06:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Anshul Dalal <anshulusr@gmail.com>,
 Ramona Gradinariu <ramona.gradinariu@analog.com>,
 Antoniu Miclaus <antoniu.miclaus@analog.com>,
 Robert Budai <robert.budai@analog.com>,
 Petre Rodan <petre.rodan@subdimension.ro>, Andreas Klinger
 <ak@it-klinger.de>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250324125313.82226-1-krzysztof.kozlowski@linaro.org>
 <20250324125313.82226-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20250324125313.82226-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [Linux-stm32] [PATCH 2/2] dt-bindings: iio: Use
 unevaluatedProperties for SPI devices
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On 24/03/2025 14:53, Krzysztof Kozlowski wrote:
> SPI devices should use unevaluatedProperties:false instead of
> additionalProperties:false, to allow any SPI device properties listed in
> spi-peripheral-props.yaml.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
