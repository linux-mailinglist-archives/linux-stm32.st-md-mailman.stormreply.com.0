Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9958897C7EB
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Sep 2024 12:26:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3062AC6DD9A;
	Thu, 19 Sep 2024 10:26:03 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8CBD6C6C855
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Sep 2024 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726741554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iU37wya+IdTRVawKsRg1bySPViVfaBomPKDjH3Cb2/o=;
 b=KAid2qNRgXPDw51QaXJEa8IJ0aXMQdUPSsHjsm7xJgB2EQkRg+hWLYCtpi5+Gbq+/TQOro
 hVECKYLlFUz9K+LyElhmU2fD9vP3LmGUykGhPpr2NeT5yWyt9quA3PI+q0aAxjCZJdiYrF
 0gq+D07H42US7UCaTqo1zBrhFYmBo1c=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-tL9Pr-h_O_2gq01UvWSiCA-1; Thu, 19 Sep 2024 06:25:53 -0400
X-MC-Unique: tL9Pr-h_O_2gq01UvWSiCA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5365b801741so674740e87.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Sep 2024 03:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726741552; x=1727346352;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iU37wya+IdTRVawKsRg1bySPViVfaBomPKDjH3Cb2/o=;
 b=N56pLxgkgH+dhVWlxBLQCt6ux6PqMxX/8+R5j/po2vi83yqDgDO5Gn8MjcFxpBqND8
 +ZNT2jaA1PWPcTBtJWVuElrfHan5pcMQWAxIPpj48Os8IyvqX4U1HZH6Puq5pLDjmv7/
 RwRqUpRZ0AzfHiXpczUhkQBpaBNxrRWHg4Yar7RD3KvIOp0muK8MXlu23Evdt+L56I1Y
 oz50/bS0k0GMkMM20T2Rug1esJao906w5H4Er4KI2EdRphn1FcN2CDo6e752R1TPnFlD
 oOTpKlgRVsqLJyeM3HaH9DEwKFtthcMfK/nRG5aqFz3xE9yR2cybaU9qzfZOmIJWsoFo
 FVWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVm+DBPESpIAYBVWSqwbozskJ+pKUxb86brKaVFNQOuWY4Mgr6N/1WgkTZqnqtfOhI/LuzuUjlaTeXnkg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyO0SKNGkuLTxoAILWIIdoOOpG8JPAWV6SH7i05n85y4oZa44es
 bZrEodj/TcV2xof4hMeIfTyIOax8MDVke6lKPrpm/3gFixR+1MyKF9D3wUwZ5vEp4+VcYcmTbn0
 YN3TTxH4+p1vwxjo2vG2t1UcSLTuIIahAxCk57otwT4fanmAjVnu85jXgiJeu+JwhEYfj7jPcds
 lF+A==
X-Received: by 2002:a05:6512:10d0:b0:536:5339:35a6 with SMTP id
 2adb3069b0e04-5367ff32b6amr13726377e87.53.1726741551647; 
 Thu, 19 Sep 2024 03:25:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD+DJ5YDiNMnKzQb29hvyFQu3OUsT/R6K216mf/QQcWtGw4xhgMjTdU+zmbzcZtq1IeizPpQ==
X-Received: by 2002:a05:6512:10d0:b0:536:5339:35a6 with SMTP id
 2adb3069b0e04-5367ff32b6amr13726362e87.53.1726741551232; 
 Thu, 19 Sep 2024 03:25:51 -0700 (PDT)
Received: from [192.168.88.100] (146-241-67-136.dyn.eolo.it. [146.241.67.136])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90610f4375sm704469466b.73.2024.09.19.03.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Sep 2024 03:25:50 -0700 (PDT)
Message-ID: <7bbeed88-5ad1-41c1-a742-8a1737eb7ffa@redhat.com>
Date: Thu, 19 Sep 2024 12:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Furong Xu <0x1207@gmail.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Joao Pinto <jpinto@synopsys.com>
References: <20240913110259.1220314-1-0x1207@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240913110259.1220314-1-0x1207@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, xfr@outlook.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: set
 PP_FLAG_DMA_SYNC_DEV only if XDP is enabled
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

On 9/13/24 13:02, Furong Xu wrote:
> When XDP is not enabled, the page which holds the received buffer
> will be recycled once the buffer is copied into SKB by
> skb_copy_to_linear_data(), then the MAC core will never reuse this
> page any longer. Set PP_FLAG_DMA_SYNC_DEV wastes CPU cycles.
> 
> This patch brings up to 9% noticeable performance improvement on
> certain platforms.
> 
> Fixes: 5fabb01207a2 ("net: stmmac: Add initial XDP support")
> Signed-off-by: Furong Xu <0x1207@gmail.com>

I'm quite unconvinced that every performance improvement would be 
eligible to be considered a fix.

Reading the code it looks like this change actually addresses a 
regression introduced by the blamed commit, is that correct? If so 
please re-phrase the commit message accordingly.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
