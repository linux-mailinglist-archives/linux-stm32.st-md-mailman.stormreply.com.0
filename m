Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 407D8A2A2ED
	for <lists+linux-stm32@lfdr.de>; Thu,  6 Feb 2025 09:08:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6936C78F88;
	Thu,  6 Feb 2025 08:08:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 184E2C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  6 Feb 2025 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738829296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NJj9rkDTFOQk+bEPSTqUhazzXgNIa2C9a7aAoT7fQaI=;
 b=C/mGnT0KdU1ssg5TrRJ838EXDYskum2CcDO9jhDAgbiRdWGTkjGd0Au6hOEUwG6cc6t0Jt
 d0iT8cg80wWNpZ5D6srvyFr7nJGyRJvN4OwDZETfVRdbCnvlwY6fmMp/tTm6JA61FAVx8N
 N24vy7JTSoPYZymZTXQYVTa0UrfxSIg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-cqg0sfV8MLWydui4QDQoMw-1; Thu, 06 Feb 2025 03:08:14 -0500
X-MC-Unique: cqg0sfV8MLWydui4QDQoMw-1
X-Mimecast-MFC-AGG-ID: cqg0sfV8MLWydui4QDQoMw
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-38dbe6a1e01so254872f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Feb 2025 00:08:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738829293; x=1739434093;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NJj9rkDTFOQk+bEPSTqUhazzXgNIa2C9a7aAoT7fQaI=;
 b=CpoXvwS31SUkIj5wF6B4jZbFZ1nVHmFheXmDmlhFKUjNCcjbpHu5fW2gMLxHwBkHpL
 GXDFaGpgoHNDJ1dDDrHqpKi9QOytlztfMgYcb/vQmI1OQvYVVKJ/6A2Ejjax6e//OMGs
 S27ZBhM+bzQv4EVmyPodOBN9eiqGv856U7RSWBRu9tMmxjx/pnfau0o1rSpYjacGJev8
 S3xr896ETN33N+xJUqUJf0+e1AOKetD/xTzVlc+Y3BZIldF+l2bTvG+4fN6E3C2hn2m3
 hIr5Hv96P88ryFg9Pd5pAkoXiX00G8nR/be2r89aBtkM8qP8mpO7GOPWThtvFZtqM749
 8jVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWIR42DZkwxkfPG5EOJ3NTUpWUH02uaX5ShhHZb3w86Og5P6YNeI74Idp3zAd91eItfxcb9KaB7XXsjQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwxLI94T+P8GxFQHYWI6oYcox0NOoDgriZYUSQ+s4oPsFuicUfr
 /ZzfCMFOOheFO8kuazixyB9aD6k992c4KYtusUdlyeqkFH4On3HKiztQ+ZwN8RnNyC1s7Wd8sjX
 9KTd0kxi7iN0lxLRtkG6HFa/UDVY1Kf3BCSRqamGXWFVJIN46A8h5ylFhJnXAkMVS4mCwAByxfJ
 lcQA==
X-Gm-Gg: ASbGnctojBtEZuBet4GGRaJVx1gV+uF7jMa6M+BmgUlc2Kh5mHAwUxaGZ6k+Rk63au8
 FCcHQNKxwtONmGA8NElFD0rRZ2u27Oso2jBp5tu59+4h9h09sVcxxcCL3TfPaUJCl8Yh08W4RRo
 6xOg9rCshDON7NTxJ1upeBQgh8M+8C83yrmz4vKuO4KfBxXJjUBvULEk+thpXaUS4bq6AchIFXD
 SrJgmVVLa9AjDL2zqDk8D5PxxHB0DcTmS0d2ONBp0o53xKJ38mUqzLBpygLDv3hpQcofaFKBMKR
 rg1oMSO6jFwq+jvW+kPbpuatS0XM6RkVrQU=
X-Received: by 2002:a5d:64e6:0:b0:38a:9fdb:7307 with SMTP id
 ffacd0b85a97d-38db490067dmr4768114f8f.43.1738829293321; 
 Thu, 06 Feb 2025 00:08:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPyrYegeID52tdxqQD7ciYyg2T0dKVG6S8SKrlSjQtzEXfxI41hNRfpZNFy4Gru5MLr+ZP/A==
X-Received: by 2002:a5d:64e6:0:b0:38a:9fdb:7307 with SMTP id
 ffacd0b85a97d-38db490067dmr4768079f8f.43.1738829292956; 
 Thu, 06 Feb 2025 00:08:12 -0800 (PST)
Received: from [192.168.88.253] (146-241-41-201.dyn.eolo.it. [146.241.41.201])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbf6e4a4bsm668008f8f.92.2025.02.06.00.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 00:08:12 -0800 (PST)
Message-ID: <2cff81d8-9bda-4aa0-80b6-2ef92cd960a6@redhat.com>
Date: Thu, 6 Feb 2025 09:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <E1tfeyR-003YGJ-Gb@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZZWNikhDaCGeOoGQAZ_ruwPrnFI9c6S28cudq5coZbM_1738829293
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
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

On 2/5/25 1:57 PM, Russell King (Oracle) wrote:
> This reverts commit 8865d22656b4, which caused breakage for platforms
> which are not using xgmac2 or gmac4. Only these two cores have the
> capability of providing the FIFO sizes from hardware capability fields
> (which are provided in priv->dma_cap.[tr]x_fifo_size.)
> 
> All other cores can not, which results in these two fields containing
> zero. We also have platforms that do not provide a value in
> priv->plat->[tr]x_fifo_size, resulting in these also being zero.
> 
> This causes the new tests introduced by the reverted commit to fail,
> and produce e.g.:
> 
> 	stmmaceth f0804000.eth: Can't specify Rx FIFO size
> 
> An example of such a platform which fails is QEMU's npcm750-evb.
> This uses dwmac1000 which, as noted above, does not have the capability
> to provide the FIFO sizes from hardware.
> 
> Therefore, revert the commit to maintain compatibility with the way
> the driver used to work.
> 
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Link: https://lore.kernel.org/r/4e98f967-f636-46fb-9eca-d383b9495b86@roeck-us.net
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Given the fallout caused by the blamed commit, the imminent net PR, and
the substantial agreement about the patch already shared by many persons
on the ML, unless someone raises very serious concerns very soon, I'm
going to apply this patch (a little) earlier than the 24h grace period,
to fit the mentioned PR.

Cheers,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
