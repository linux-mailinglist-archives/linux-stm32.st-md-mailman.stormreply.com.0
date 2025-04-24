Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 819E4A9AC81
	for <lists+linux-stm32@lfdr.de>; Thu, 24 Apr 2025 13:53:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 33347C78F68;
	Thu, 24 Apr 2025 11:53:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 65995C7802F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 11:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745495624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7O71wS6omUP4Za+qu8KkJ9Z+HYsi5jrXQRVuEjbLS/Y=;
 b=U0x6VSFZpsG194wzvpvDS5puCDW1O4c6T2wxbF4VaeOkTqTz8aUnoZ8dIdiCV/bFQlsJSZ
 B23RuiJbzuIAYP2Xey7gg9+hQdr3WC79uHcoQquf/Fi6bzAfYF2wBwlEraZgplsbU8nYh0
 NP2+iAKn90MetYoSuwWcWga6M4nmHfA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-Fi8A5k5COpSPNI9eg7jG9w-1; Thu, 24 Apr 2025 07:53:43 -0400
X-MC-Unique: Fi8A5k5COpSPNI9eg7jG9w-1
X-Mimecast-MFC-AGG-ID: Fi8A5k5COpSPNI9eg7jG9w_1745495622
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43d4d15058dso6459665e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 24 Apr 2025 04:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745495622; x=1746100422;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7O71wS6omUP4Za+qu8KkJ9Z+HYsi5jrXQRVuEjbLS/Y=;
 b=PfQeco8JMLX3UmaXIclhqJMRML2lBThc6qpcEIH02y+4fK/rA01hNEiJPj7jPu18y7
 tm5mIyqTVTkRFek8CJXUQH2xf5v1jfBZiuT+MycavwkDcq7DyFANjWTD43bHBVS9iL6s
 AVfoj6fjgxm9k+UziBkyfluUXSom+ThIE7TIMZdThvkOR314ALc0TOJvgAdNeshltvXk
 L7UTtJzTxBteQDEQ6sl7yRpMtqRTHp5D8qb7S4IjLP+Dxy1dveQhIVtzoji3TYGf8ekQ
 6gvJrDPSpzh/NaQwvv14GbOXc1kJhyM8yUxEoqZVcgqnZMPDpwLuW+ui4utaAdTVk7gn
 Vjlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtdq67lCbgrcZAQ09qYtZkv+FP+tKheM6zGR0kmka5JonaSCtqZGWh9k7qZCbQ1B8Xa8VVHOoF4HuWdQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yytu4siH/FEPUo2YnQzf3byhMHxd1JXDhGrQz8imd9Y3+WbudcK
 boLjWyFyPH01YBJY0u1G6ghJL07JFSbYWT0Vgl51P/NgV/Ku0Ywz4XD7WxYIzH1enTCjTXVobg5
 kHuYe7kKsmxUdGIvxK2nt98WMxVLkNvPWYi5Sovudfcfmfi6Z/Kg50WbKZ/UkBcgHA6v1V8r3+y
 IzOg==
X-Gm-Gg: ASbGncsjODOOZqNVapiYgXYS1jcicL7SyflOC658g+EYXqQSnm0/YKB5M6VHkcndJRi
 n44d6CIGy6pdHtsasULwoTDGQlsj7RYkR8yA5YHLOL9ZBUD8zdO5fxggP+L29UAOAw1DzzKNt+X
 ctUVB3YaqmnQc8aWxizZ27+4EG/W/Ks4gnRXGubM/cWp4AGKawsQMDDrd8NliYPOvxTokFZBWp3
 9DHPRrMREZEcSJjb4m/ftXHr29fmmObLmzMyhV6Z3XkSKJ//28EZgy9mChS/G9mRDSgMzz3gG+q
 dZASA10AFjpy1yPDdromwloYAH5d6dQDvbNhTOw=
X-Received: by 2002:a05:600c:4e0a:b0:43c:f513:9585 with SMTP id
 5b1f17b1804b1-4409bd210eemr25352695e9.13.1745495621868; 
 Thu, 24 Apr 2025 04:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUAI2NQUKhz4qnOoSRg3Qvi8tq8xdza5SLA8RiijZXZRu9gfA8tceguZucQbwMmFsJdyoLyg==
X-Received: by 2002:a05:600c:4e0a:b0:43c:f513:9585 with SMTP id
 5b1f17b1804b1-4409bd210eemr25352255e9.13.1745495621516; 
 Thu, 24 Apr 2025 04:53:41 -0700 (PDT)
Received: from [192.168.88.253] (146-241-7-183.dyn.eolo.it. [146.241.7.183])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d54c246sm1831740f8f.86.2025.04.24.04.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 04:53:40 -0700 (PDT)
Message-ID: <edfa1585-c10c-4211-a985-ebfcb8e671d5@redhat.com>
Date: Thu, 24 Apr 2025 13:53:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Boon Khai Ng <boon.khai.ng@altera.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org
References: <20250421162930.10237-1-boon.khai.ng@altera.com>
 <20250421162930.10237-3-boon.khai.ng@altera.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250421162930.10237-3-boon.khai.ng@altera.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mLhtE2r_X-ysNJV18iFNspguAm5xBNUY0M2HPZp2C0M_1745495622
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Furong Xu <0x1207@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 G Thomas Rohan <rohan.g.thomas@altera.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Mun Yew Tham <mun.yew.tham@altera.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Tien Sung Ang <tien.sung.ang@altera.com>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v4 2/2] net: stmmac: dwxgmac2:
 Add support for HW-accelerated VLAN stripping
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

On 4/21/25 6:29 PM, Boon Khai Ng wrote:
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> index 389aad7b5c1e..55921c88efd0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
> @@ -4,6 +4,7 @@
>   * stmmac XGMAC support.
>   */
>  
> +#include <linux/bitfield.h>
>  #include <linux/stmmac.h>
>  #include "common.h"
>  #include "dwxgmac2.h"
> @@ -69,6 +70,21 @@ static int dwxgmac2_get_tx_ls(struct dma_desc *p)
>  	return (le32_to_cpu(p->des3) & XGMAC_RDES3_LD) > 0;
>  }
>  
> +static u16 dwxgmac2_wrback_get_rx_vlan_tci(struct dma_desc *p)
> +{
> +	return (le32_to_cpu(p->des0) & XGMAC_RDES0_VLAN_TAG_MASK);
> +}
> +
> +static inline bool dwxgmac2_wrback_get_rx_vlan_valid(struct dma_desc *p)

Please, avoid 'inline' function in .c files, especially for functions
that will land into function pointer like this one.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
