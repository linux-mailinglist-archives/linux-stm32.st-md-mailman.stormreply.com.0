Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAAAA2A674
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 11:57:32 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 072CFC78F88;
	Thu,  6 Feb 2025 10:57:32 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 16460C78F86
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 10:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738839449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ks1EJyaV3dJWopJIxPGTdysgQbtxzRdmygE8oecODfI=;
 b=Ikm7+dAxneZRtIfnyXXwxGJuOfGnf0ZVEQwQq4QH3ArFiNxcrAph9E8kXrGFxu3+Kae937
 yXhtgiAp9shhVHGMrxwMXb/qAtthfdbdhq2FzbEhBrt8M5B0GEN6lEg1AUjl+JGeNtkP1q
 BAAYjhUN3G5zicbnk4GPly/SkR4GymI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-XYrYeKe4PJelVnn8GLwrPg-1; Thu, 06 Feb 2025 05:57:27 -0500
X-MC-Unique: XYrYeKe4PJelVnn8GLwrPg-1
X-Mimecast-MFC-AGG-ID: XYrYeKe4PJelVnn8GLwrPg
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4359206e1e4so6084225e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Feb 2025 02:57:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738839446; x=1739444246;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ks1EJyaV3dJWopJIxPGTdysgQbtxzRdmygE8oecODfI=;
 b=XaQC335XwBpv/9UtpcS2ofnZeSZ7B7MNMDyvUUicqDuRLsRxLrOlH5uvWlyiBwa5zU
 DarwZV9fD9HhgushunmQFehSEptVrJoUjmMIRfmoU9CpUoS5YpAKwWI6d6Bc3n0Z/mdH
 uP9MY9hMshKI8XjnLOKLQZuWoCFwgRRNThP/aYrOQGHj0iYG5tmcAYjmq5e4QgzLO30t
 hzfUXHuxE+OcKas2s0ZguTuha4I5AEj3dAmz0OKldQ4+JishZS7oF7u4rW3xsSBGzlz+
 EH82JLBWOY0jxaXB1BGKihrksYfxtaYDbnKXSiggvFPKP4uuatQlzXeV8MDTGtrv8llK
 ed9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJNQsxZMg8C9lYe8gGOCw0L1e36xh6sESh9eNNkf7v1hbkcwjXcTKEE8p97lAVG+muzMRHygS8AOWYGA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwMEtEzH+nmwg9HHPxX2+F4xdDDk0CltOKg2rSnfgmbDOQgbrZK
 fXYbdE6lWRwKVKXmsH3aknsc4mUmfKoj+M9tnKExSjk0DSSg49hkyyFiD2JNDmC8JWlzeQioFDS
 kvmEfClL5sZCzQ+LD3iTafsJB+REqevT053RsW+wHuhfs7icsjlPnrdj5oIXUYqg5IMbmtDDz0R
 Q8Ug==
X-Gm-Gg: ASbGncv/TJxZEkVHVPPFNctN5E+WxeqcMpmt8N4OBvNDgJMdbH/13C3E3+2tHcNr5Ww
 wrq5ZhnkwYFP+jdVddCYW2TNCLFxPTEeB1LddijpSOcdZ4cZeHtaFWKla5cJB89Hl5gGCSh9N1J
 Ft+hSqg8bZ4xxVni6ilxYMSWqGDc2IaeY6uvugNgW5h+DosADgILc1e6Lv6LcDN1+qOU5C64pW2
 s8IsrN3iNHnMaebZw7h6pZz5e3eIsxQgFTnOpkqK6tCT2Z642mgzx2OkpsYh4DLsgEjNtjuG8Xn
 YDMYmOJwY0gkxbZs5elGs9/DSCtzx49nBPM=
X-Received: by 2002:a05:6000:401e:b0:38d:be61:2592 with SMTP id
 ffacd0b85a97d-38dbe61266bmr1223894f8f.42.1738839446079; 
 Thu, 06 Feb 2025 02:57:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFLyD8qKeYPHkk51RV7daxUs9XqUUKgX6jSRdYNwnc255CmiNF1pLJ6S6c+04Q/17xlRqYqpA==
X-Received: by 2002:a05:6000:401e:b0:38d:be61:2592 with SMTP id
 ffacd0b85a97d-38dbe61266bmr1223877f8f.42.1738839445638; 
 Thu, 06 Feb 2025 02:57:25 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde31d9bsm1414982f8f.94.2025.02.06.02.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 02:57:25 -0800 (PST)
Message-ID: <8f891a0b-249c-4c4c-ac76-da9ac41ca857@redhat.com>
Date: Thu, 6 Feb 2025 11:57:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
 <2cff81d8-9bda-4aa0-80b6-2ef92cd960a6@redhat.com>
 <Z6STSb0ZSKN1e1rX@shell.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z6STSb0ZSKN1e1rX@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WIbuXNaAVqs-2Zq6p-eaCq2I4VuZpYH34q6ycqmSN5w_1738839446
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net] Revert "net: stmmac: Specify hardware
 capability value when FIFO size isn't specified"
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

On 2/6/25 11:47 AM, Russell King (Oracle) wrote:
> On Thu, Feb 06, 2025 at 09:08:10AM +0100, Paolo Abeni wrote:
>> On 2/5/25 1:57 PM, Russell King (Oracle) wrote:
>>> This reverts commit 8865d22656b4, which caused breakage for platforms
>>> which are not using xgmac2 or gmac4. Only these two cores have the
>>> capability of providing the FIFO sizes from hardware capability fields
>>> (which are provided in priv->dma_cap.[tr]x_fifo_size.)
>>>
>>> All other cores can not, which results in these two fields containing
>>> zero. We also have platforms that do not provide a value in
>>> priv->plat->[tr]x_fifo_size, resulting in these also being zero.
>>>
>>> This causes the new tests introduced by the reverted commit to fail,
>>> and produce e.g.:
>>>
>>> 	stmmaceth f0804000.eth: Can't specify Rx FIFO size
>>>
>>> An example of such a platform which fails is QEMU's npcm750-evb.
>>> This uses dwmac1000 which, as noted above, does not have the capability
>>> to provide the FIFO sizes from hardware.
>>>
>>> Therefore, revert the commit to maintain compatibility with the way
>>> the driver used to work.
>>>
>>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>>> Link: https://lore.kernel.org/r/4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net
>>> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
>>
>> Given the fallout caused by the blamed commit, the imminent net PR, and
>> the substantial agreement about the patch already shared by many persons
>> on the ML, unless someone raises very serious concerns very soon, I'm
>> going to apply this patch (a little) earlier than the 24h grace period,
>> to fit the mentioned PR.
> 
> Thanks. Here's the missing Fixes tag that I missed:
> 
> Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when
> FIFO size isn't specified")
> 
> Not sure if patchwork will pick that up.

Thank you indeed for the missing piece. I'll add that when applying the
patch (~now).

/P

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
