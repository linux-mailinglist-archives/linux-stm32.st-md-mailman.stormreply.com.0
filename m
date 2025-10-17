Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C565BEBC4D
	for <lists+linux-stm32@lfdr.de>; Fri, 17 Oct 2025 22:56:14 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F8FBC5A4C7;
	Fri, 17 Oct 2025 20:56:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DFB3EC5A4C5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 20:56:12 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so11489125e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 17 Oct 2025 13:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760734572; x=1761339372;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=C12qJIzcq7trqDzz0klaWxch1uVCOS8XjPTTwM5i6CA=;
 b=lkX8iQEHILvrT0ouzo3EESjTfjNDA7hJgUJ/E0ykAPI5yHht5UNghG00jYhc8hirBF
 X+r/fxp6r0HCbBMTIMh4SOy2O9MzV6X4vc3hZW5pAvw2s6M8sMKqrAtyHQaofy+lKOje
 oiqfSgVqsg5wJlZJzy3amVSfV8n3y8mIIv1nK1BB4whrkHchBCAzSRBVGV7Sfa9QZt+a
 bhd+BPEb1blknBQJ4QwZSLI+ixLr3Be3+9qRVZJcbzDpKgLNPpatNFltT7uzGiy+/bWX
 e07B1yuqa8eP45aB+TuW1aXpcEt5RlzbZnDk39bX3jh9qEp7udqdC2l+Ki200YBEt/3M
 vKzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760734572; x=1761339372;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C12qJIzcq7trqDzz0klaWxch1uVCOS8XjPTTwM5i6CA=;
 b=TJf9DLy1PizZ2uwUCFDPmJwdnvSN4OcCi11N1ZGyNH39K6dwCd1lAjmmAstMiEYdaL
 L6vP/PjhdFDhevrzH5r/NRA7kx82zo2oanxuOD8JvnPCnyzuOLJt3QIc4IYvBqLAmU9F
 mmwu7QiJm6mF1I1X2Jkz7BwwWVPyIKB0Cn0ey6ufcvKYns9KzaX+/SzRkoik+NIORwk8
 +xbAoiotTKbNNXE6ERtKrEUTPPzaat4JuPprDUY3oBqrRKMpCqJV3i49HoSA0hCobZam
 WfPyAj0UwKvTxiRMe8b9xyC7dbMDMniHi7JJR1isRyp+jdbpLs+N0RaklLYU72YHuqhI
 uyEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqiXrZxHSCCb/OWBsxMAAnCUlEEmj9PI4jc7CADoOqmKU2CdsCZJ8rC5NC6b5k1V0bOXSahgURURRbXw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwVrDKVIjgcWVLawyVM1lW1r8i/o6glxoHQqmbvSRsChnbPjvrW
 2U6W9m+nhGPkwaJjZEvYNJ73fC4lCQNoa6rvA/0kQYBZDKidAvZ0mETI
X-Gm-Gg: ASbGnct+kEaLB1zX3HHsgpg7Jfk4a3nMKLgF8XXwucA52ij7Mtf5cwGd6FRphl59H5q
 zlz6NcxULALBpMuZbFEMiRCmeZ046cg8jyvdLnWnNmIg12nc/Nz9RaS2LAvX9QLOizCW/i4zWKd
 8cteuCe6QU59Vo5e5Bea9jy71N6FjUl1IzvoZy8v8qFLXyp9LZQ73X6uFfBl570H7q4GxvC2eUA
 6vu94g/9fQHPNodBm7Oo+b7DdDPLfQi//aXh/sqJ2pOmOGlIteP9+/drGZEaIx37sceA1SO3QGw
 1RyCWNKjSY1tSKVh5wHSJ6CbTfYEFk4QtI8QtrPxoCfsHZGLk5aJfFFvAt0WwrKQadbJQd7Vb8b
 iCEAghU/BHHp+EyhU1O+JQnY51CfphDJebXoErTmyC5w/gOG4w8JRWy64Aho8LwY3zqkCTDGdI6
 Ucn1U9fZvkKNAaxVbMRaasQCEOJLaA2x/o0nxzRfJw4LvuLmG0swXaQOPKXpQx5ShB6u7IV/x96
 Af5Iy5zGIbKsi6nqYbIH2zaMYe+wYdwEqyprHNl
X-Google-Smtp-Source: AGHT+IGbK1GYiGSq90AfCM3s0IP97DdTnr+FJIu4trDGK9h3lZNAS+qE7FdF8x0d0hVhDNhvUVLA9w==
X-Received: by 2002:a05:600c:a4c:b0:46e:37fc:def0 with SMTP id
 5b1f17b1804b1-471178a23c5mr36281265e9.9.1760734572196; 
 Fri, 17 Oct 2025 13:56:12 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f33:9c00:f581:27c5:5f61:b9b?
 (p200300ea8f339c00f58127c55f610b9b.dip0.t-ipconnect.de.
 [2003:ea:8f33:9c00:f581:27c5:5f61:b9b])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4715520d747sm13489075e9.14.2025.10.17.13.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 13:56:11 -0700 (PDT)
Message-ID: <dc7c8414-55fe-4d86-8e5f-7cf7eeb73f97@gmail.com>
Date: Fri, 17 Oct 2025 22:56:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <2a4a4138-fe61-48c7-8907-6414f0b471e7@gmail.com>
 <4a2d59c0-be25-4b83-b732-138d04f62292@lunn.ch>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <4a2d59c0-be25-4b83-b732-138d04f62292@lunn.ch>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH net-next] net: stmmac: mdio: use
 phy_find_first to simplify stmmac_mdio_register
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

On 10/17/2025 10:39 PM, Andrew Lunn wrote:
>> -	int addr, found, max_addr;
>> +	struct phy_device *phydev;
>> +	int addr, max_addr;
>>  
>>  	if (!mdio_bus_data)
>>  		return 0;
>> @@ -668,41 +669,31 @@ int stmmac_mdio_register(struct net_device *ndev)
>>  	if (priv->plat->phy_node || mdio_node)
>>  		goto bus_register_done;
>>  
>> -	found = 0;
>> -	for (addr = 0; addr < max_addr; addr++) {
> 
> With this loop gone...
> 
>> +	phydev = phy_find_first(new_bus);
>> +	if (!phydev || phydev->mdio.addr >= max_addr) {
>>  		dev_warn(dev, "No PHY found\n");
>>  		err = -ENODEV;
>>  		goto no_phy_found;
>>  	}
>>  
>> +	/*
>> +	 * If an IRQ was provided to be assigned after
>> +	 * the bus probe, do it here.
>> +	 */
>> +	if (!mdio_bus_data->irqs && mdio_bus_data->probed_phy_irq > 0) {
>> +		new_bus->irq[addr] = mdio_bus_data->probed_phy_irq;
> 
> ... what is setting addr to a value?
> 
Thanks. Indeed, addr can be removed and here phydev->mdio.addr has to be used.

> 	Andrew

--
pw-bot: cr
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
