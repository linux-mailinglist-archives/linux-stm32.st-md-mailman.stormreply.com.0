Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0911FAADCEC
	for <lists+linux-stm32@lfdr.de>; Wed,  7 May 2025 13:06:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3B24C78F9F;
	Wed,  7 May 2025 11:06:49 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EDA6BC78F9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 May 2025 11:06:47 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5f624291db6so10242777a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 May 2025 04:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746616007; x=1747220807;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=duDxhGSUaa+DKP3WsDW9rwdEeqUl14A6M/ImrV8wnQY=;
 b=JkUIhXMYuqA0nrd2GlHFgSPjmnNsIMmK00a8xlx+zlAJx1+TGmrhwafX7FnKbUs1Ny
 JsM0R76UV1QrM9fYenNy9yoxnFCPN8JzQm5MRERoVIu7MXScWWY7mZkChmaOoVIeM0R6
 GwRhqzZ24+SyYr8aseBsz+wsFzss3Iw8X0dRi/0YhmeutwWg54FnAMb48nJVb0D9ac/Z
 GNsn1b5LwnR4DR7fzjYdvey87hcgx3fseG2VtG2K+yYIHk5vmi+Z9bh9jPZhzN4fgLRZ
 YhyjAVbZcHkZ1ZjJyZpng1Eq6rDmYsNN5VA1s6eCFCrwJvbLqw5nKe5UNSkkeIiq1mfJ
 eJiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746616007; x=1747220807;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=duDxhGSUaa+DKP3WsDW9rwdEeqUl14A6M/ImrV8wnQY=;
 b=GORkbfbZyxFoO+4JGDjb+yLFMOHWDvvdx73X3FwcDlvHTUvxpZLQacALTWYxTwg7NV
 +NxdWCM0pj2bY4cytqg/N++W5TGAywAxw+8ONLVsD9LyGRxhBzAuc3lRdL4+LXwFlgrD
 64phGYN/ZIO73koafcYca2GUTFukhnEDbD7IGYlTfMPHWaPHLQZ7ZNEVfX22SnUxoYVh
 t294WH3KqyjzI28x6rGQwgxNAzBhQfz3WTZfVigTMh7w/hNhskJh1fZpX7H6+ooSWfTn
 jPrezFTllC5kM9/D7XNx2vpqQZ2y1YTz66+/+WSQ1n+2q1atVzajW9UDfAkA7LPDbHTG
 86PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnLfdQMykiPXC/W4ZTwagZWcIv/MOCbuG0Yxs5ctZtrSiYqVe2yHdTZNxliroBJRxzShht7AzoAWjMyQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw1Mfd7LhB1XOhTZcyhlZSaohnoanyTOOAVU2yLcQ9dw49P6O40
 HcPa43i8gLYOEPJzrfgd7sABSroM4YBRwAjFjP7wobzt0kenitbU
X-Gm-Gg: ASbGncuJHB2lE63pZ6RlBrwyRLUrYqbWaOaUofGVPRRJ5tWlN5rTFc+IKAG03hK080C
 kXB0hzHkirDL8KsGeHFD6mlJ62b2A7eF14Qn3GZw0HytPoQUUmxbk6JAduxOvBsHtUE1hZyjS2r
 O4LmaMEzJ0YTjGtP2LBxmrD6uuV2FBdmpEHm7QwEL8i4AUQgHbDzW9MFQCqWGUknclJWfJsjX9N
 tPR4hfKZL+THLPLxcF3hcfyzn8zEiXlFFeT+dE2/5ftXUgk+lCcwHL4D53Pz1r/EtGv2nF75CRX
 +HU7UGfcuifemkOJChy2BP4miD/bpQmXA8gjI0WrJrG+P11qew==
X-Google-Smtp-Source: AGHT+IHUTGuZKxGzeUHzGfykWA8vb3hzItLyZnesCtBXdESu0mFRGfHYDE/15YKTQH60qIZWWmK6oA==
X-Received: by 2002:a17:907:c388:b0:ace:d3f0:e51d with SMTP id
 a640c23a62f3a-ad1e8d89b0cmr288549566b.54.1746616006898; 
 Wed, 07 May 2025 04:06:46 -0700 (PDT)
Received: from [192.168.1.130] ([188.193.103.108])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad18914d067sm888907766b.3.2025.05.07.04.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 04:06:46 -0700 (PDT)
Message-ID: <63665c17-da37-4b5b-9c2d-28d5a669680f@gmail.com>
Date: Wed, 7 May 2025 13:06:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20250505115827.29593-1-goran.radni@gmail.com>
 <20250505115827.29593-5-goran.radni@gmail.com>
 <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
Content-Language: en-US
From: Goran Radenovic <goran.radni@gmail.com>
In-Reply-To: <2d0ff289-06f6-4bde-a238-097d22573d4e@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 4/4] ARM: dts: stm32: add initial
 support for stm32mp157-ultra-fly-sbc board
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

Hi Andrew,

thank You very much for Your comments.

Andrew Lunn wrote:
>> +&ethernet0 {
>> +	status = "okay";
>> +	pinctrl-0 = <&ethernet0_ux_rgmii_pins_a>;
>> +	pinctrl-1 = <&ethernet0_ux_rgmii_pins_sleep_a>;
>> +	pinctrl-names = "default", "sleep";
>> +	phy-mode = "rgmii-id";
>> +	max-speed = <1000>;
> 
> max-speed is probably pointless, rgmii cannot do more than 1G.

Agreed. I'll drop the `max-speed` property in the next revision.


>> +	phy-handle = <&phy1>;
>> +
>> +	mdio {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		compatible = "snps,dwmac-mdio";
>> +		phy1: ethernet-phy@1 {
>> +			reg = <1>;
>> +			interrupt-parent = <&gpiod>;
>> +			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
> 
> PHY interrupts are 99% time level, not edge.

That is correct, but I am facing strange behavior, when I set 
IRQ_TYPE_LEVEL_LOW.
My board stops booting at:

[    2.343233] Waiting for root device /dev/mmcblk0p4...
[   12.638818] platform 5a006000.usbphyc: deferred probe pending
[   12.643192] platform 49000000.usb-otg: deferred probe pending
[   12.649029] platform 48003000.adc: deferred probe pending
[   12.654277] platform 5800d000.usb: deferred probe pending
[   12.659744] platform 5800c000.usb: deferred probe pending
[   12.665089] amba 58005000.mmc: deferred probe pending
[   12.670239] amba 58007000.mmc: deferred probe pending
[   12.675185] platform 50025000.vrefbuf: deferred probe pending

I must investigate this. If You have any idea, You are welcome to share it.

> 	Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
