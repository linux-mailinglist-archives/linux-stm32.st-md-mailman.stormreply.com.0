Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE1089D8B6
	for <lists+linux-stm32@lfdr.de>; Tue,  9 Apr 2024 14:02:33 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 81D8CC7128A;
	Tue,  9 Apr 2024 12:02:33 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C3F74C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Apr 2024 12:02:31 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-56e6a1edecfso2389282a12.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Apr 2024 05:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712664151; x=1713268951;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AkRKDf5GLr5pj942wy9NJKid+umpjbRA7GynacZfPEQ=;
 b=MUrlb83Mhuc55mucM9YEtl1sbHjiOnLrkumC/CC5koJ6zN80YdSa1CjzGGZXXhwHGQ
 RhVwUJf6I115+3cz/ARU4qfYpg6x+bR5+XtDj5XxOzG+ROPXp1qOTwI5GDIqTkNcZ+zL
 V/W4IS6v59xIdosfmGpFb8KLoDIWm5PJbYJ4wtm6Qza2Krc7gaUa8MnxhNy6E9no4CsU
 ZqY9fgMopqM5xnWQI6NoKK0EGImeB7NMB41RjHPbHoNzLsgb+ojll72a8oIPVtmD+iaK
 frTlE2BJzw9G9OXmoMlt+03oTbpur7X2HiWAlhAr1rSBpAZUTvtbzrZ56acbqldD5sbH
 dTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712664151; x=1713268951;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AkRKDf5GLr5pj942wy9NJKid+umpjbRA7GynacZfPEQ=;
 b=PPgS/US8NSb2Cs+NTwwkPx7Zr7/4UwP85EYq4U4R5OvTwUEIaMdZz3BMLLjd6+/Qxd
 zM0WOqGNE3TUQpAnfxU0mjU1FpCMsnYhpwJgEZ8ZrNCYCnlNEez4DSqeK4C55/NLkGWh
 2DdAKZ2pDAF0Gn6XzG423bUrHDiwYcUTnY25420FB7y9PliqxSMY2q3epR4Q2XXYvKLp
 bWslui/3xVCmOD41Cm6QfthX8k3PC7v3kA9GJ84VcqQAeDNjFu5prUnZDHfItdK/v2r1
 ZVpXJXticxYSiStnRYi3EqFRmqULQ3nmmX4sRKLrQ7sjDXR4q8IOlIWX+Sz1m0b8cKON
 gkaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaMLackFB4k/JIKqM1OQKOCGeCtm3moj4lunhI/TSnsAIw+0ky4Hx/4asoWTAUNqNhgYwvPub84wllvV69vAoJ8Z82+4vZ3OmVj4gMnpEtVY/lH0vp9hBW
X-Gm-Message-State: AOJu0YyLoxasyIxowtsMQajd5P7+VkvMuLGS0WnzfI0fZ3bdkRhijEZZ
 9ydvZ/f16IMm6cZOI4iiCxTwwqSeT5zHPMGNdX+ofFakPzqoF0zG
X-Google-Smtp-Source: AGHT+IH3wXGsiaRiem9EQMmXVabh3sBI1WiYbDC3AT/ATTb2okPbMfexW2j0doktw3Yi0bClXEyv6Q==
X-Received: by 2002:a17:907:31c9:b0:a51:ddc6:edc1 with SMTP id
 xf9-20020a17090731c900b00a51ddc6edc1mr3751319ejb.28.1712664150849; 
 Tue, 09 Apr 2024 05:02:30 -0700 (PDT)
Received: from [192.168.0.31] (84-115-213-64.cable.dynamic.surfer.at.
 [84.115.213.64]) by smtp.gmail.com with ESMTPSA id
 jg18-20020a170907971200b00a51a60bf400sm5466509ejc.76.2024.04.09.05.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 05:02:30 -0700 (PDT)
Message-ID: <a4283479-2c4a-4f8f-b224-999dd12ba009@gmail.com>
Date: Tue, 9 Apr 2024 14:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20240408-rtc_dtschema-v1-0-c447542fc362@gmail.com>
 <20240409102658d86fb2bd@mail.local>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20240409102658d86fb2bd@mail.local>
Cc: linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-aspeed@lists.ozlabs.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Joel Stanley <joel@jms.id.au>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/9] rtc: convert multiple bindings into
	dtschema
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

On 4/9/24 12:26, Alexandre Belloni wrote:
> On 08/04/2024 17:53:00+0200, Javier Carrasco wrote:
>> This series converts the following bindings into dtschema, moving them
>> to trivial-rtc whenever possible:
>>
>> - orion-rtc: trival-rtc, referenced in arm arch.
>> - google,goldfish-rtc: trivial-rtc, referenced in mips arch.
>> - lpc32xx-rtc: trival-rtc, referenced in arm arch.
>> - maxim,ds1742: trivial-rtc, not referenced in arch, cheap conversion.
>> - rtc-aspeed: 3 devices to trivial-rtc, all referenced in arm arch.
>> - pxa-rtc: add missing properties and convert. Referenced in arm arch.
>> - st,spear600-rtc: trivial-rtc, referenced in arm arch.
>> - stmp3xxx-rtc: convert, referenced in arm arch.
>> - via,vt8500-rtc: trivial-rtc, referenced in arm arch.
> 
> Probably all the moves to trivial-rtc can be squashed.
> 

Sure, I will squash them for v2.

Best regards,
Javier Carrasco

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
