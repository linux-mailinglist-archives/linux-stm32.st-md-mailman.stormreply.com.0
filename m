Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ED22A85ACF0
	for <lists+linux-stm32@lfdr.de>; Mon, 19 Feb 2024 21:17:41 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 99F45C6B45E;
	Mon, 19 Feb 2024 20:17:41 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 706BEC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 20:17:40 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1d932f6ccfaso38492025ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 19 Feb 2024 12:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708373859; x=1708978659;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rONE3Abn4dO/b9f7QenLonwDofv6vCpXy42uqDKlHxo=;
 b=kzF1Gas9GNiUWrxhXv+PoJObdBIjHLou4+8/Wk0cdMt8YI5HN3zuq63+Cla2LHKloS
 s9uESotpjg+6jDzQ8CRWRWrLjrCEZEShs0LQJSI/yppX2e9VeGlttwm8DzGFXe8l2PoA
 tI5e+Ddr5lAgWtj/RVtQqOywJ/x7IIr/iKy3HI1A/xro+UR2drW/w8JYc4WjzSh2R4/a
 8ZCrlHMHSO5Zbj35Qmqkl8b/4F/rxVh2BJGQu4kIG/zJEIzfxdr7uZE1PrQPnGi40ABj
 WgOugY5scMflolDpjFoFl/djiWl6npXqfh0feAcTwaw7ar7uzVUe5GsW75MtBBFnVCfD
 DuhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708373859; x=1708978659;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rONE3Abn4dO/b9f7QenLonwDofv6vCpXy42uqDKlHxo=;
 b=hvbRmY8lkD8BAdBcfCybAf1og6AzBC5+fT7Xu+3J25Ios0dZXs7FwrpwHiJHaFMyOP
 mdbZl8zh2waTrdETtwCqkV3lWibyWAi9BXjUobeaFAN+AZNK+NdBAEONjN+ucxn5SlqM
 CR1RPlJddEZcW1ieqivWQeYbLgO+ybsEL8j6AAwEVan+gXQEgAfRS3s1kwWMcj/fezSM
 GPBarA1XTIcxXPSf5qQnDjubGG6qxP0diX0xoTa1Y4chrox719OCOy9tygAhd4yLbQl4
 YOj2UccfHRO2IgoFId4zv1ojgRfS+4Nu1TPdNH86dj1vSG2TPqlDx0FXLwx84YBlUzIK
 BsLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAPPTagic4JHp/8P/mn1Qfb7bGsVgmLXfI9vPivXxE+z7DDrBec2Zu5c0w8K0WejwSKoSE/RH7Xcyyk+V9eH/Sc0a5XehMoq29hvnpK3BJM73rRvmF6X/1
X-Gm-Message-State: AOJu0Yw6om2xhtVVbOOM5H3iq65xjqDaGgum07DGTNM3XqaJ0NXyeWaf
 Xz2tIF6nsjA7Gsb9hZxjYdzOVAO4qZdcJsR9+kcxXDJnec9gm2Ym
X-Google-Smtp-Source: AGHT+IEf41VN0cQCRsLyrwiGaNtQCiBDuirdu+fKuIUuNKMJOBH3FCxl/tzPUzaptxBRzL9nvHiI2Q==
X-Received: by 2002:a17:903:491:b0:1db:9759:f716 with SMTP id
 jj17-20020a170903049100b001db9759f716mr10190731plb.55.1708373858716; 
 Mon, 19 Feb 2024 12:17:38 -0800 (PST)
Received: from [10.230.29.214] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 t11-20020a170902d28b00b001db616fa11dsm4837055plc.238.2024.02.19.12.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 12:17:38 -0800 (PST)
Message-ID: <7961378c-9d4f-419b-bf86-4f5e55b3839a@gmail.com>
Date: Mon, 19 Feb 2024 12:17:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jesper Nilsson <jesper.nilsson@axis.com>
References: <20240216-stmmac_stats-v1-1-7065fa4613f8@axis.com>
 <61bdd802-abe4-4544-8e48-9493a6bb99c8@gmail.com>
 <20240219104025.GM22484@axis.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240219104025.GM22484@axis.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, kernel@axis.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: mmc_core: Assign,
 don't add interrupt registers
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



On 2/19/2024 2:40 AM, Jesper Nilsson wrote:
> On Fri, Feb 16, 2024 at 09:13:51AM -0800, Florian Fainelli wrote:
>> So in premise I agree with the patch, that incrementing those is not the
>> right way to go about them. However these registers are currently provided
>> as part of the statistics set, but they should instead be accessed via the
>> register dumping method.
> 
> You mean extending the dump register code to dump the MAC Management Counter
> registers that are not counters?

Yes that is what I meant.

>  From what I understand it's only the Rx and Tx interrupt and interrupt mask
> registers that aren't counters. Oh, and the MMC control register itself?
> 
> To be honest, I don't think their use can justify the code churn.

Fair enough, it really depends whether they are actually useful in 
troubleshooting or not.

> 
>> In either case you will get at best a snapshot of those two registers at any
>> given time and I suppose this can help diagnose a stuck RX condition, but
>> not much more than that.
> 
> Yeah, their use is very doubtful. For me, they only introduce more nonsense
> data in my logs.
> 
> The Rx registers looks to have been added in the first version of the MMC
> back in 2011, but the Tx registers never was.
> In commit 1c901a46d57 Giuseppe mentions the MMC interrupts as something to
> add later (if actually useful).
> 
> So Serge's suggestion to drop the entries completely is actually quite attractive.

No concerns from me to drop them, not much value in having inaccurate 
information.
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
