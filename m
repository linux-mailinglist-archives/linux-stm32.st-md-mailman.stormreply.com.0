Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D8668523
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Jan 2023 22:14:17 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37D26C65E45;
	Thu, 12 Jan 2023 21:14:17 +0000 (UTC)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com
 [209.85.217.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAFB1C64110
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 21:14:15 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id k4so20364503vsc.4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Jan 2023 13:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9G8E/pbF0yCVEwppEfeZ3APRR94ekY7sl663Hc09EMo=;
 b=CLGQjrQB/cXT4ivLFkBZ2uFfRzV2B4EuZw/fwRZDs/OamGqTfErZRyoEF5zSftNssA
 aXo/J943u3z52xiiyn9ozbhsyoQruIu2fecHP/z+SDB5JICNMpxq0KcptZnYMIhrShBM
 YfC96q6zTGqcqq9hX2DPYulrMchhsuMtmAzxE/31s8E9O7Mmo6W9CLXhI76inUfSWyDe
 +cHCugoc13oZ7d5vWOFEfSgOP8LUmFvg/dNuqBbCgACKDXztYEDpxaveJOoNssA3MPUw
 vfhD6ahNx593rmXHQEFQIlfxRB/Tly17byXrAoAyTruXS4oWhtjl0KJfWf3LFxNyESR/
 QMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9G8E/pbF0yCVEwppEfeZ3APRR94ekY7sl663Hc09EMo=;
 b=XCvzhfEH5vBw+84Z8vfH5GaVMMpmJcj9t36kc6Y8Gc/dRfBJ9rIFptUZjaID1fSw/1
 5sJfVs47Y6l0R7sauekb01wCtFU/3yuO9YlD/TRRMDhx6+ZS9ZauRZDayPmmXE0qUu7M
 27uL6LjMKcHlunMjm9amSa8FckX3UPQqx/clSYTlNI5foIaq/vLbNj7j2jw+tvFa+zSp
 G0MyyoE98PHgEiqkc38IhgO5UfX6WZO57+Xf6zCcjrwY/dxGSvlnE5DWs0stjZkJfdxN
 ushixfPkK1ldFtkDY8RTpBs8F+L0ev3oAlmIZucTTMPTW5m5mfbNLXYTksvpNN+eHVMQ
 gQ4A==
X-Gm-Message-State: AFqh2koAh9cRwQT5hxsXN9jUmqCTaEKQfZyP7WV7lBETo8PP+zrmOcfo
 aCU7Wp/aM68D6hHtcMtFf38=
X-Google-Smtp-Source: AMrXdXvqOpDKUMfAeRKnyAEn0jSg0Xdln+Y3NUo/FVdyWNh9GqqApDbAMshix//ZhSV0K8IXOyErgA==
X-Received: by 2002:a05:6102:32d3:b0:3d1:657e:39ff with SMTP id
 o19-20020a05610232d300b003d1657e39ffmr335281vss.30.1673558054609; 
 Thu, 12 Jan 2023 13:14:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 u15-20020a37ab0f000000b006f9c2be0b4bsm11202593qke.135.2023.01.12.13.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 13:14:14 -0800 (PST)
Message-ID: <2fd5c783-94f1-1896-c6b9-431a754aec14@gmail.com>
Date: Thu, 12 Jan 2023 13:13:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Li Yang <leoyang.li@nxp.com>
References: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
 <20230112-net-next-c45-seperation-part-2-v1-3-5eeaae931526@walle.cc>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230112-net-next-c45-seperation-part-2-v1-3-5eeaae931526@walle.cc>
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next 03/10] net: mdio: mux-bcm-iproc:
 Separate C22 and C45 transactions
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

On 1/12/23 07:15, Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> The MDIO mux broadcom iproc can perform both C22 and C45 transfers.
> Create separate functions for each and register the C45 versions using
> the new API calls.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Apparently, in the c45 case, the reg value including the MII_ADDR_C45
> bit is written to the hardware. Looks weird, that a "random" software
> bit is written to a register. Florian is that correct? Also, with this
> patch this flag isn't set anymore.

We should be masking the MII_ADDR_C45 bit because the MDIO_ADDR_OFFSET 
only defines bits 0 through 20 as being read/write and bits above being 
read-only. In practice, this is probably not making any difference or harm.
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
