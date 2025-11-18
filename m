Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8CDC6A0E7
	for <lists+linux-stm32@lfdr.de>; Tue, 18 Nov 2025 15:42:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89F77C62D20;
	Tue, 18 Nov 2025 14:42:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4B080C628DE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 14:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763476966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KcIjluc6CF4ch514Lk0ctcAIz2wl4W9d5ngSIs1tzo4=;
 b=i8eT8I4Wa7/eqj4ifc+DNMXD0E4DQFIQjraIxGSuJ+gdBV/B8BqLV3eHmj+sJDV1pR+t/4
 fbtZv8sGi9SO3f5fmxT9ttgG52sjNSUTXRGeqT5s4eBjyAXJq5s7l9+kKSM8FUdQ1TCwAk
 zd5ELXSV3CPRgrMHSd6OGxmqjCbJwYc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-xITebGTlOUOSWP0bOKwiMg-1; Tue, 18 Nov 2025 09:42:39 -0500
X-MC-Unique: xITebGTlOUOSWP0bOKwiMg-1
X-Mimecast-MFC-AGG-ID: xITebGTlOUOSWP0bOKwiMg_1763476958
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4779b432aecso15319245e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 18 Nov 2025 06:42:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763476958; x=1764081758;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KcIjluc6CF4ch514Lk0ctcAIz2wl4W9d5ngSIs1tzo4=;
 b=N/1187yoLHTA3vOi460fDom3w/t+BAB4p9YDYpjIbCKZkfV2DxRv3NbvyTlZIHAUkj
 1aAfMo6LakWGcwcyndyjoodtWmFKHBCA1ntPR6flQTTyWrsGdxPlmbVJisEmjd1jOoWg
 NIPywdT8mEKdc0KntVO/cQ+Z7byPxkb4SfbDQV1LPJ2OIn21JhtRjIomx8rfBghmiBws
 3JnnrsGYGltnbJgykX7E1DUQiJa36INyBFSoHibtD1qGs4G5h9pYqp8o96a6Vnngqahd
 yOgyGM+VlsImyDU4r2u6eRPSSzPEhu1OQV2pWmNbDc6xlXnmEZBkLGrb3RzlDp8/C2Cc
 HsXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV837Uk1NwCQSaD7vANHo/0cMQMJQpXlHK4nRALCMPKQmc8a6yOt6/Q/QXg46LLzPe19iPCN3YSvAbVag==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxVIQusFihXPTG47P1IinNIjiXlXM5vo51I29TFrst3l2g+NEPz
 TZunldh2ySS8GUqNWXrpTyT1Wcb1qVtnrbtm9pqghxILNmgqCWkXtmJ1mat5Uwf3smpd0TIiIf7
 2lcogCgrq3uMVyUJcMAgaVPvoWdhDZ9mikQBqvMI3uEjbY4gI+EeEh+u3VOER5+3MvvPTKz1CnA
 pTy/bNWA==
X-Gm-Gg: ASbGncuYkDW89ybrxBbt69Srr0+T5NNWsQ9lFV3LE40NQ1Z95AaJWbmI4OYbrJk6aeZ
 jGjH9x2dfBXubf3LgritxADG1MxbVd5V+iCT2F5+P0/2uQghiwJ/gq2C3Dskiwz+/FQJidUmrCK
 4wlZgPnZ5CcXbNzons2KzgLnINLFVbNoIJm6w0EJmtuRgxcNjnCEjVSR4imd2KsqbACi26GVDun
 V2dKjqojrdirGV6WAHgbJkeRbblF7wsZhZfFhdYp/X/teaApyKpX+uSme8WSe5BVGbAlkpg4nSc
 ZK4ppuvchYoD/lxctWlHJiulb/x9VvJsgiRj9OIVyfbQ7yDS5l3NcgptEVIEQmzWM8rSt8Bn7PJ
 HqBNuXmQjB9XC
X-Received: by 2002:a05:600c:c177:b0:471:13dd:baef with SMTP id
 5b1f17b1804b1-4778fea3048mr167899445e9.26.1763476958185; 
 Tue, 18 Nov 2025 06:42:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0CCY6x+8bA07W4MfE2Q3iuNu7PIm0BhBaWtRwjXdbvpokwwW2evCf1FYfJCFjxSD0LjK6Ug==
X-Received: by 2002:a05:600c:c177:b0:471:13dd:baef with SMTP id
 5b1f17b1804b1-4778fea3048mr167899055e9.26.1763476957729; 
 Tue, 18 Nov 2025 06:42:37 -0800 (PST)
Received: from [192.168.88.32] ([212.105.155.41])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a9741cbfsm19503645e9.6.2025.11.18.06.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 06:42:37 -0800 (PST)
Message-ID: <53b3ac97-830a-47fc-a83c-3d12dac2e21a@redhat.com>
Date: Tue, 18 Nov 2025 15:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paolo Abeni <pabeni@redhat.com>
To: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>
References: <20251114142351.2189106-1-Pavel.Zhigulin@kaspersky.com>
 <4a3a8ba2-2535-461d-a0a5-e29873f538a4@redhat.com>
In-Reply-To: <4a3a8ba2-2535-461d-a0a5-e29873f538a4@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KRBV0iBn8jlu_IBt4ReRhB_zyAD_qPSnFHbdNLgns_s_1763476958
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 Inochi Amaoto <inochiama@gmail.com>,
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Rayagond Kokatanur <rayagond@vayavyalabs.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] net: stmmac: add
 clk_prepare_enable() error handling
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

On 11/18/25 3:30 PM, Paolo Abeni wrote:
> On 11/14/25 3:23 PM, Pavel Zhigulin wrote:
>> The driver previously ignored the return value of 'clk_prepare_enable()'
>> for both the CSR clock and the PCLK in 'stmmac_probe_config_dt()' function.
>>
>> Add 'clk_prepare_enable()' return value checks.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Fixes: bfab27a146ed ("stmmac: add the experimental PCI support")
>> Signed-off-by: Pavel Zhigulin <Pavel.Zhigulin@kaspersky.com>
>> ---
>> v2: Fix 'ret' value initialization after build bot notification.
>> v1: https://lore.kernel.org/all/20251113134009.79440-1-Pavel.Zhigulin@kaspersky.com/
>>
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> index 27bcaae07a7f..8f9eb9683d2b 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
>> @@ -632,7 +632,9 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>>  			dev_warn(&pdev->dev, "Cannot get CSR clock\n");
>>  			plat->stmmac_clk = NULL;
>>  		}
>> -		clk_prepare_enable(plat->stmmac_clk);
>> +		rc = clk_prepare_enable(plat->stmmac_clk);
>> +		if (rc < 0)
>> +			dev_warn(&pdev->dev, "Cannot enable CSR clock: %d\n", rc);
>>  	}
>>
>>  	plat->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
>> @@ -640,7 +642,12 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>>  		ret = plat->pclk;
>>  		goto error_pclk_get;
>>  	}
>> -	clk_prepare_enable(plat->pclk);
>> +	rc = clk_prepare_enable(plat->pclk);
>> +	if (rc < 0) {
>> +		ret = ERR_PTR(rc);
>> +		dev_err(&pdev->dev, "Cannot enable pclk: %d\n", rc);
>> +		goto error_pclk_get;
>> +	}
> 
> It looks like the driver is supposed to handle the
> IS_ERR_OR_NULL(plat->pclk) condition. This check could cause regression
> on existing setup currently failing to initialize the (optional) clock
> and still being functional.

I'm sorry, ENOCOFFEE above, ->pclk is not NULL nor ERR when
clk_prepare_enable() fails. Still I don't stmmac  code depending pclk
being successfully initialized, and the eventual regression looks like a
real possibility.

/P

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
