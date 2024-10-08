Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3880399432D
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2024 11:01:17 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E3714C71287;
	Tue,  8 Oct 2024 09:01:16 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D9E1C6DD9F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2024 09:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728378069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Az/KMPreXaGl91pZI4523wJ5r8ejn+YnIG+Mof+90Ek=;
 b=gLoeG1BDrEOHTotR44qJAmZbKTO2bzCpM5rUzg7R65gpk1wAmEbwohWUVgvpFY8ZLXUFd7
 aMmzeNyHn3sWTm6bFUyksUkLBB7MP2lu7dx54nL80UugGcvf95iFFlpC62YkdspDUTa94U
 jApWD39bOgW2NZL1EPAJd1MzKzw/wC8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-EJceBl4QN0Cmj8YTewT8RA-1; Tue, 08 Oct 2024 05:01:08 -0400
X-MC-Unique: EJceBl4QN0Cmj8YTewT8RA-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-42cceb06940so42094705e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 08 Oct 2024 02:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728378067; x=1728982867;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Az/KMPreXaGl91pZI4523wJ5r8ejn+YnIG+Mof+90Ek=;
 b=W8P01bM/rg8qPWL1I9GjnhxdRyJMgX8xNfCMk/vlqgUhzELiZrtql2BuUvl4XYiRvp
 IDp2Ll48B9aGE87L0Wgl4vcc+UYY7hgHBNkpfbQjVDcy9ry7wSUf0oGSTdwsE26gKUNW
 ZKEcTwXXsPXxwOn5bb+1OghI9ZHJN4xS83w4Xw/pyxL07u0uCcmOZ9RNbxF4rgmRWzjL
 PIVB8VXfJfRdN8khrIyNr5a344k7nO6OFGaxDyy5ZAahQZId+ns9du3kzHPIU1ITy4nb
 VKLQI5GIAFeQCw34TjM/OgNf9dnEqeUagJvi5BGrU2Cv9+LH8vXNGT3A86JDn00LMixW
 qMnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzN8WaWR1AVShYFvwcua1MZ7O/XMrsEenZAIPjz7KErJXvOxEz6U2FkhGiojF4rgFfyeiOf1bLZx+HzQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyCQRPWvZCQ1BEgiRdpO9onkEpK2eCgcNU/uH2XMyFnkOypDgs2
 YNCSctd9jyfSZxFr3h4OmFC8F9+4SjX14QcYedPi8SR+kT75RckDXO6zPIO+l8e+W/hmpYCH4dk
 h5UiRiekYeTcABWdAVX1Gy9nQuk9QsmEKGiRtNMn/4zPRiUwsAN49O1ZyRynI1R244PyPtplMCe
 QB+w==
X-Received: by 2002:a5d:64e7:0:b0:374:c040:b00e with SMTP id
 ffacd0b85a97d-37d0e7d43c8mr10304852f8f.39.1728378067035; 
 Tue, 08 Oct 2024 02:01:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIFwLBzdlSN+s2luoQEVwbNKJu+jYd1X+INDAyIvF4Y/gn2XGZgzsLbGQxoIp6iqg9MixO4A==
X-Received: by 2002:a5d:64e7:0:b0:374:c040:b00e with SMTP id
 ffacd0b85a97d-37d0e7d43c8mr10304829f8f.39.1728378066670; 
 Tue, 08 Oct 2024 02:01:06 -0700 (PDT)
Received: from [192.168.88.248] (146-241-82-174.dyn.eolo.it. [146.241.82.174])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1691a4d8sm7587775f8f.36.2024.10.08.02.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 02:01:06 -0700 (PDT)
Message-ID: <24e50bd4-05e7-48be-b943-b361f4e73fdf@redhat.com>
Date: Tue, 8 Oct 2024 11:01:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
References: <Zv_BTd8UF7XbJF_e@shell.armlinux.org.uk>
 <E1swfQz-006Dfg-5U@rmk-PC.armlinux.org.uk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <E1swfQz-006Dfg-5U@rmk-PC.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Jose Abreu <joabreu@synopsys.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Eric Dumazet <edumazet@google.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Mengyuan Lou <mengyuanlou@net-swift.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 08/13] net: pcs: xpcs: use
 FIELD_PREP() and FIELD_GET()
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

Hi,

On 10/4/24 12:21, Russell King (Oracle) wrote:
> diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> index 805856cabba1..f55bc180c624 100644
> --- a/drivers/net/pcs/pcs-xpcs.c
> +++ b/drivers/net/pcs/pcs-xpcs.c
> @@ -592,7 +592,8 @@ int xpcs_config_eee(struct dw_xpcs *xpcs, int mult_fact_100ns, int enable)
>   		ret = DW_VR_MII_EEE_LTX_EN | DW_VR_MII_EEE_LRX_EN |
>   		      DW_VR_MII_EEE_TX_QUIET_EN | DW_VR_MII_EEE_RX_QUIET_EN |
>   		      DW_VR_MII_EEE_TX_EN_CTRL | DW_VR_MII_EEE_RX_EN_CTRL |
> -		      mult_fact_100ns << DW_VR_MII_EEE_MULT_FACT_100NS_SHIFT;
> +		      FIELD_PREP(DW_VR_MII_EEE_MULT_FACT_100NS,
> +				 mult_fact_100ns);
>   	} else {
>   		ret &= ~(DW_VR_MII_EEE_LTX_EN | DW_VR_MII_EEE_LRX_EN |
>   		       DW_VR_MII_EEE_TX_QUIET_EN | DW_VR_MII_EEE_RX_QUIET_EN |

Very minor and non blocking thing: perhaps consider renaming 
DW_VR_MII_EEE_MULT_FACT_100NS to DW_VR_MII_EEE_MULT_FACT_100NS_MASK - 
possibly in a later work?

Cheers,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
