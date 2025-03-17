Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C2962A65F35
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Mar 2025 21:34:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6F4F2C7128F;
	Mon, 17 Mar 2025 20:34:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA3DFCFAC47
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 20:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742243673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Be+m8+WOPuEDPOjxk6T2O5N+1An96EeClwZ5PGpZN34=;
 b=YGRE8eGyGChDnHXHoR/IKToIdWvlur04zQcIIzdTZZsxu00GRglchkXvpllafN4g+GvUnO
 1tDz9nYj2sBUnBd8ss5wiZnArPToIF8qrSQ6GHUy8rsCJnSGygWYgaH8yOVz5xs93wE12U
 ynJeugFIr80z8nbXjdnrbTiywjHotfI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-H4qrQRGNM9iE-BIXnOaO3Q-1; Mon, 17 Mar 2025 16:34:30 -0400
X-MC-Unique: H4qrQRGNM9iE-BIXnOaO3Q-1
X-Mimecast-MFC-AGG-ID: H4qrQRGNM9iE-BIXnOaO3Q_1742243669
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-391492acb59so3059460f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Mar 2025 13:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742243669; x=1742848469;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Be+m8+WOPuEDPOjxk6T2O5N+1An96EeClwZ5PGpZN34=;
 b=QpsDbIouap8sxpJg/bIczZRX1n5gFw0jfZ6rHMgQ2G+u4I+0zgBwDwJoug/DYXJk9c
 op7M4riphzCnMEc2+l6O5IMUuinlg3+0RTR+F6qkfVIKuvl9cg9Qz8ynFfLlGswat+WH
 Qmv+JIzCrjhVGsn/DmfydflPwk/FI5nWHsL/UrTdnBTEI5a+rQ+hOE4GhXgX2yZ+TH2y
 z+S07Z/hHpMJ0PCAl/m5/Bl8qhr6ErU6y+OuXODUfwyff1Glowcai0kMH5cgfWaveie3
 Hyhgbde/wxhMQcCvWwRuI/3Xhas81JTolWc3VkPLtyA/UD7tFfHVmpI/p8dRmtoGYQGn
 e93A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWB5HgQpzL+KVm8q1essMCnj/n49dqTZQ/6QkE+y1KbleW6e6ZjwBb2gWym0Cffuc+vZDUq7/ohGuXebw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzMVamgxOVdFz3MeGqGGiYgXoZwwk0W2e7hGnmxaVpTM/78gT4f
 WORPLlYYnqOKKFxQrrfFs+LKmho0Y6bOxZvS+dxsW1Xu5IMccvqQu1NHwH+WumxU28xmh3dpkhZ
 W2WWM8LUtglkyv9mpd0/GgtnFauN6xa0eqtIf18caD/D2pHP/fYKzfRA2FNoTTESPGafljRZJR5
 uBsA==
X-Gm-Gg: ASbGncvvr5b2RCYiS8r0zZQ51rFkob0fUKSPeppL5aZb+Y5FqFLoXM1cm+bOENEukCh
 yd461ZxJprw2nkE7j7lfkkWljqRjgVWdiJMSsy631bkBD0uIyHOdCTgwa1M1fHsAoIO0z3Ohiow
 8zcV+ErH4iCHjpu1umf81no8XJepwCZqYHh2GyJsYkbwEbCsJOYlOtF27VNBskNEgFJmrKM0Ma7
 hrTUcTv0jE7fS6c6m/5ierPmCHjuk2NlYRJ9B0RPdu2iTtu7Y4zHXjiGIYihNwtnmxYDmbjcuMk
 ZS7ytU4K36Jl7WFhTL+OGlR+uCul/AnAFMmJdaJof1y0rQ==
X-Received: by 2002:a5d:5f8f:0:b0:391:37e0:d40f with SMTP id
 ffacd0b85a97d-3971d237dd4mr11307633f8f.17.1742243669307; 
 Mon, 17 Mar 2025 13:34:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxEfR0n9grx2beojtM/iScHwTGCBD3F8wtb70BAlYyWIxmSC6fEqAY7CKzL0p1YPz6UW1K1A==
X-Received: by 2002:a5d:5f8f:0:b0:391:37e0:d40f with SMTP id
 ffacd0b85a97d-3971d237dd4mr11307624f8f.17.1742243668902; 
 Mon, 17 Mar 2025 13:34:28 -0700 (PDT)
Received: from [192.168.88.253] (146-241-10-172.dyn.eolo.it. [146.241.10.172])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d200fad64sm114260775e9.25.2025.03.17.13.34.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 13:34:28 -0700 (PDT)
Message-ID: <8176af6a-07b0-4f57-848e-6d161fe58746@redhat.com>
Date: Mon, 17 Mar 2025 21:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>
References: <Z87bpDd7QYYVU0ML@shell.armlinux.org.uk>
 <Z9KTixM7_vc_GFe-@shell.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <Z9KTixM7_vc_GFe-@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u1sYFY9Nn7SUypA2MuAkpfxF-dKTiyXNPpjA9FNswLI_1742243669
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/2] net: stmmac: avoid
 unnecessary work in stmmac_release()/stmmac_dvr_remove()
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

On 3/13/25 9:12 AM, Russell King (Oracle) wrote:
> On Mon, Mar 10, 2025 at 12:31:32PM +0000, Russell King (Oracle) wrote:
>> Hi,
>>
>> This small series is a subset of a RFC I sent earlier. These two
>> patches remove code that is unnecessary and/or wrong in these paths.
>> Details in each commit.
>>
>>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 -----
>>  1 file changed, 5 deletions(-)
> 
> Hi Jakub,
> 
> Why is this series showing in patchwork, but not being subjected to
> any nipabot tests?
> 
> There's also "net: phylink: expand on .pcs_config() method
> documentation" which isn't being subjected to nipabot tests.

We had an outage in the nipa infra that caused no test running for a
while. At least it entered later CI runs.

Cheers,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
