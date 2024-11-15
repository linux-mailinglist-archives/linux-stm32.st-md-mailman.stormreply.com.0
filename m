Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E13D9CF29D
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Nov 2024 18:17:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1351BC78023;
	Fri, 15 Nov 2024 17:17:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3E255C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 17:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731691032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WNINNbdA0F6hP6eHCYu5y4eAOKcxmjVgS1A+60t/9YU=;
 b=ZxrymZ8FHrcZbdfPiw7mDqS58bk2+NjctsEAcu53vllQbaeF7ANlGb7abWXlt//zO2vKZQ
 d5XG3GK1UbJwUWOsfNIkqItdnh4Ix6LP9z4c9r6HEhxS4dBtXpfXfNIXl992nKBn6BLatp
 4wJ/VVDI5/Uj9fiQkg5/vRlsBf70WXQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-vtJYfmoPNouSQ5o2ZII0uw-1; Fri, 15 Nov 2024 12:17:10 -0500
X-MC-Unique: vtJYfmoPNouSQ5o2ZII0uw-1
X-Mimecast-MFC-AGG-ID: vtJYfmoPNouSQ5o2ZII0uw
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-37d59ad50f3so982726f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Nov 2024 09:17:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731691029; x=1732295829;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WNINNbdA0F6hP6eHCYu5y4eAOKcxmjVgS1A+60t/9YU=;
 b=YA1ynS+4FBCylY+bNRr5SqMesbqGTzFbWv5npSvlCcIcZKJHPMaWdk46ehyalX3QZT
 iOkJvgesfrwB+2KXLKSqYxfyob2mkIFl+IHBzMPwQNnD2fnbDfqZpvJG1JHdmRx0JMPH
 DaKOf34Z8i7iIVyWKzloZF7iKYRyLmniB0pXjSCGGnCSbk95NDCD4icrMaYkf2pCoUV6
 wb8Jl4H9hZCvb6tI1/BpbLAfxaX8bfYdCJOiPnmW5tdTqOV1ThLNoMC7I/s4GnUOxXow
 qBmcG5hgzz4Ck++OfSDPt+X2vHsNo+7GqQjxNlPe5Sbk/m9Cq3TT68dG/+u/NnR3e+ms
 t6ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSYPO/kW1Az2TGX08X+aypt+UXuZcRfFDYCjjTDEVT/wVWZFsRn0sz1YXjGuTPSmuf3cWCeAE0tx8pBQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwrVUemCV6oZfMQBzVSkAah8Y12Z/8dNz+wc4VenrVip4xSzKfq
 t+lrWF6K2rokojjT3iz2gVDKPdN+5qr/R1hyU4aOMo1Ei4GhF6iKfC+VEb7PW/8Z20nSQ9DgK3t
 4E8pMfvZtsuYYHpgcQ2ukSVWBIuqbkTPzFRQZH4RO22+h7DmvVv8ihnjSfU0P7pu3Zh/ooqK0/w
 V4tw==
X-Received: by 2002:a05:6000:1541:b0:382:2976:c26c with SMTP id
 ffacd0b85a97d-3822976c427mr1615838f8f.31.1731691029633; 
 Fri, 15 Nov 2024 09:17:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqsGWeYmupRnbdYRzMnGla3oGhpbGMYhra1dRBEvJ2Cnd/70uqsVI1qXDSJV35YPP52UmDlQ==
X-Received: by 2002:a05:6000:1541:b0:382:2976:c26c with SMTP id
 ffacd0b85a97d-3822976c427mr1615812f8f.31.1731691029280; 
 Fri, 15 Nov 2024 09:17:09 -0800 (PST)
Received: from [192.168.88.24] (146-241-44-112.dyn.eolo.it. [146.241.44.112])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ada2a8bsm4868047f8f.17.2024.11.15.09.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 09:17:08 -0800 (PST)
Message-ID: <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
Date: Fri, 15 Nov 2024 18:17:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Parker Newman <parker@finest.io>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3bcBL6-TeKo6W0MpwHyFYbnWQWQE_XS7J4Yjgk9g3-k_1731691030
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Parker Newman <pnewman@connecttech.com>
Subject: Re: [Linux-stm32] [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read
 iommu stream id from device tree
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

On 11/15/24 17:31, Parker Newman wrote:
> From: Parker Newman <pnewman@connecttech.com>
> 
> Read the iommu stream id from device tree rather than hard coding to mgbe0.
> Fixes kernel panics when using mgbe controllers other than mgbe0.

It's better to include the full Oops backtrace, possibly decoded.

> Tested with Orin AGX 64GB module on Connect Tech Forge carrier board.

Since this looks like a fix, you should include a suitable 'Fixes' tag
here, and specify the 'net' target tree in the subj prefix.

> @@ -241,6 +243,12 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
>  	if (IS_ERR(mgbe->xpcs))
>  		return PTR_ERR(mgbe->xpcs);
> 
> +	/* get controller's stream id from iommu property in device tree */
> +	if (!tegra_dev_iommu_get_stream_id(mgbe->dev, &mgbe->iommu_sid)) {
> +		dev_err(mgbe->dev, "failed to get iommu stream id\n");
> +		return -EINVAL;
> +	}

I *think* it would be better to fallback (possibly with a warning or
notice) to the previous default value when the device tree property is
not available, to avoid regressions.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
