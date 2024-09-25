Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24D985E63
	for <lists+linux-stm32@lfdr.de>; Wed, 25 Sep 2024 15:34:23 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED41DC78006;
	Wed, 25 Sep 2024 13:34:22 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F133C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 13:34:16 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5c876b6c061so10197a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 25 Sep 2024 06:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727271255; x=1727876055;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1G9GlB0spcSQ2Hzbn1Dic1BfcSKakLMd9Fn04CdJsDE=;
 b=YGGU377CwhRczGZjKxv1Q1Getgx2FdfWDRjT7dAphKZkiffD2/MmR3sXQor5uUW/hp
 YBAqUZanhIZ1NA5AkDswDxvIlj7wSLa/bTd3LFrQBI47pXMeIAq2y8Ra1Q9S+0svliou
 b9Ta4hi8hejtJT0ICGAhbAH/bO4S99bTA9Cgmh8scxjSQwNcygnckSfnfH7QGlvcGaXB
 roO1jKoJFqmnY/z6IHHWjUlYdh0inmPDuP2tEpIGTpJepOBppNOg7IEcWHS3wZ1qjalS
 nQ7Eq3ieONozVnyOHO4OZmehWpis5nlbUS7bo8WsP7WN5E5jGaxSlor9A0Vjljv/kAGt
 9b8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727271255; x=1727876055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1G9GlB0spcSQ2Hzbn1Dic1BfcSKakLMd9Fn04CdJsDE=;
 b=cNKX3ReDszdkX9wbw/G5dG0S7bILPJEevtq60NoezpwRsWo6l89CAajxSl2ZJstSmR
 xZZeiq3a2FmJnTL0AnDLfEDeKCD4sKGLTmI6MXb6QCf1l3zomQcoIgJ1DdUAIK2Ec3/T
 WRDJrtZujvjJxzcmbVPqKmj1xGSTdDeCNkSJ/10xwvngk0ocTr7KYoEXH+RlQ/j4loF1
 qACcXQ724QAIYcuN9cKf6Hc3xQhy7+ev9nq2OktIVSSrV8iqN3nhK8Z3f9w+lp+x6J70
 UazM/NsYXwbmFiHrAeEWxqleOcie1x/7bcTDwoRr80m9tsVdgPhvTe/JDZChzgm3QiJK
 L1cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvOHy6nAxrPUTnNH+ceIkpT1Q9dKdJigN9FalMKkjaBftKXmwyoSAZyPlHdgU9kW8X0eVJcuBtMLziZQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzxSGM92OnYhnEmh+kfwH0peSRUNoxFSRnt/nY+MvB/vYrSKAFo
 Ek3WqIvE4HaIS11P7N+TLX6G+rJZl5aBzz7oBjPai6pthXtMOTL5
X-Google-Smtp-Source: AGHT+IFlt8RigiKecsjAQw3jCdDTeX+psJX6Ye/0uvJWpmUJn4dFKXnuhwDgbyCk2uZZJ0TnWaWFhQ==
X-Received: by 2002:a17:906:d554:b0:a8a:93ce:d252 with SMTP id
 a640c23a62f3a-a93a039f506mr116078366b.6.1727271255186; 
 Wed, 25 Sep 2024 06:34:15 -0700 (PDT)
Received: from skbuf ([188.25.134.29]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f34291sm214235466b.14.2024.09.25.06.34.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 06:34:14 -0700 (PDT)
Date: Wed, 25 Sep 2024 16:34:12 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Message-ID: <20240925133412.76bnadwfw55sw37a@skbuf>
References: <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <ZvF0er+vyciwy3Nx@shell.armlinux.org.uk>
 <E1ssjd9-005NsL-K7@rmk-PC.armlinux.org.uk>
 <E1ssjd9-005NsL-K7@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E1ssjd9-005NsL-K7@rmk-PC.armlinux.org.uk>
 <E1ssjd9-005NsL-K7@rmk-PC.armlinux.org.uk>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Jose Abreu <joabreu@synopsys.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 08/10] net: dsa: sja1105: use
 phylink_pcs internally
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

On Mon, Sep 23, 2024 at 03:01:35PM +0100, Russell King (Oracle) wrote:
> Use xpcs_create_pcs_mdiodev() to create the XPCS instance, storing
> and using the phylink_pcs pointer internally, rather than dw_xpcs.
> Use xpcs_destroy_pcs() to destroy the XPCS instance when we've
> finished with it.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
