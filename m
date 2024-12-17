Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 994F49F478E
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Dec 2024 10:30:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 44315C78011;
	Tue, 17 Dec 2024 09:30:39 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9D9A7C71292
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734427831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jsZWLwNN3Dj8vY9Jgz0ZZvXQlClGHa97ZSTKANn10HM=;
 b=SWHJ/Ox+4B3pNll7+Yj8KTQoQ4uDiUCINokXmXCTvUhzjDip2Oio9gnTHH5Lim1DafcbwY
 8NxE3j6PVxZtybV+eI942RldL2k+lo72IjMszwPfcw7dLTdWzlL6i8B3uTi52XML3luo4o
 In9iatf156Izl07n9uKRbc84xBdcyUI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-xFPOSGD7O2CSQMpqUT-3Xw-1; Tue, 17 Dec 2024 04:30:29 -0500
X-MC-Unique: xFPOSGD7O2CSQMpqUT-3Xw-1
X-Mimecast-MFC-AGG-ID: xFPOSGD7O2CSQMpqUT-3Xw
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-385d52591d6so2559619f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Dec 2024 01:30:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734427828; x=1735032628;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jsZWLwNN3Dj8vY9Jgz0ZZvXQlClGHa97ZSTKANn10HM=;
 b=Dc0Dnr6YSRTdvNsbpJ0NShW3Q5zygYarye+ltsFBa+zpbM59I1p1X+iDQZPIW14MP9
 dzw8vkVoF3mgBUGJmqRMdjy9G4/862yfUlfbgUlSYnpgEOM0jPvd9yWBuNrEuZZMA5qT
 ZuKIYaQK9ieR6eb9czwLdvIyONj4JvhBVHSI63fGt6c6MO/az0jE5CD5QQzzgvQMY8Ly
 jDMNC09yOYoPB5OKlCCApJagjaEKnu2ki4N6AkvNF2786yoFB147GbXM/906uaYnVfiK
 z89pzXymxw1dyiJ2+ztwwc4d6ighbfxZy6OAmbtDV3DRE6Sb0Cg5GG4m4oGMrKk8maki
 uxjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNCYxdbGePSZIX2IvMTiRj9Yi7lbJZYhwkuptvpXAAVzZHILnKfIm6PepoGFRS3BLbU5l09X3DSVQ1vw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzgaOLrG6WPr5+LGkAHqVLsSYZMEV6bpvw6CQPny39w6h1iq76m
 jwRVeDxdYycTDCPJsCOlPlpN/hmoXsxb6Rgdm5pPIY1+xSbkw6LQWh32wqlOXHmFroAV6+LB57A
 ke4GJ9a2J78015JGd4uZanfbGQBXpTuj18H/GXyudjllyJvWDQFPv6XHRy7sHYzXlHQiurDeJL2
 9V1g==
X-Gm-Gg: ASbGncvm5GilHQPHw/e0DkWd7SWWt99XT3y1J276bmTRXrp5jOsmRYrcQGq6vDDNE62
 wbBNds4hduwTSJoUc+6eGZXdZIyLhPXsyAb2/i096yNY9KSETrKTV6i+O91KAjilRzZtpcCgerL
 6HL+i1583hk+L6jztErrDMhOyGBVZNSRgwJVt+hxPgVpvorpgNs3w3GBqMGssIJn7oetyLdE6IP
 9cJskBd2eowXXlddysRMuGy/PDy1gdEHH3WKSUmt8xIiTFJcOtEu4tFMrQzjilw2SacBRny5VES
 e3qQNJJIaA==
X-Received: by 2002:a5d:6d8e:0:b0:386:3afc:14a7 with SMTP id
 ffacd0b85a97d-388db23b794mr2025561f8f.7.1734427828130; 
 Tue, 17 Dec 2024 01:30:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGfqm8yOmdd4TkH9Nm5un+/9BqyR43RiXrtTTnaPexsrsZBcqLS0wyDa2ydDNBgCgdLmOg5Q==
X-Received: by 2002:a5d:6d8e:0:b0:386:3afc:14a7 with SMTP id
 ffacd0b85a97d-388db23b794mr2025421f8f.7.1734427826252; 
 Tue, 17 Dec 2024 01:30:26 -0800 (PST)
Received: from [192.168.88.24] (146-241-69-227.dyn.eolo.it. [146.241.69.227])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c805d489sm10688171f8f.88.2024.12.17.01.30.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 01:30:25 -0800 (PST)
Message-ID: <9d0722fe-1547-4b44-8a4a-69a8756bdb39@redhat.com>
Date: Tue, 17 Dec 2024 10:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241213030006.337695-1-0x1207@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241213030006.337695-1-0x1207@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t-y0QvDUVrkjEcTiYidSk_pc6wmxf3sjGd7ezF5OfEg_1734427828
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v1] net: stmmac: TSO: Simplify
 the code flow of DMA descriptor allocations
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

On 12/13/24 04:00, Furong Xu wrote:
> The DMA AXI address width of DWMAC cores can be configured to
> 32-bit/40-bit/48-bit, then the format of DMA transmit descriptors
> get a little different between 32-bit and 40-bit/48-bit.
> Current driver code checks priv->dma_cap.addr64 to use certain format
> with certain configuration.
> 
> This patch converts the format of DMA transmit descriptors on platforms
> that the DMA AXI address width is configured to 32-bit (as described by
> function comments of stmmac_tso_xmit() in current code) to a more generic
> format (see the updated function comments after this patch) which is
> actually already used on 40-bit/48-bit platforms to provide better
> compatibility and make code flow cleaner.
> 
> Tested and verified on:
> DWMAC CORE 5.10a with 32-bit DMA AXI address width
> DWXGMAC CORE 3.20a with 40-bit DMA AXI address width
> 
> Signed-off-by: Furong Xu <0x1207@gmail.com>

Makes sense to me.

Since this could potentially impact multiple versions, it would be great
if we could have a little more 3rd parties testing.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
