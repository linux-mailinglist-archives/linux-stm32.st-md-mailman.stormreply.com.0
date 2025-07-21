Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F01B0CA47
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Jul 2025 20:08:25 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 35FBAC32E8F;
	Mon, 21 Jul 2025 18:08:25 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F052C349C7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 18:08:24 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-748e63d4b05so2771253b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Jul 2025 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1753121303; x=1753726103;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OQau27tiFbgxeFSGF9XUGR95YzgyQaSOU0OlzzUWZMQ=;
 b=Yzd8F/DuY0AU7Lf/p/dCgJzi4CooArNXJTyz0cmoPnpgZZnPYGFVHiApavl9htxEK8
 hxw6YIFOU8uM7JICu5UFYi0eGUUzCZTWgfQs3DjxvMLlk23r0FYN/nilbSOQAaeBvm2u
 awiBFJd62oy2qrB4w4mdIlSBFw6Y/+wa1ai4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753121303; x=1753726103;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OQau27tiFbgxeFSGF9XUGR95YzgyQaSOU0OlzzUWZMQ=;
 b=M66tAzUAMtnhWrZ+/rapSkyQKcqYbAjSqlt/y0pgGUvjH4yXHlPt1GXnmT80Uo+PxG
 OkPhuxa/ZOIGpxVUnTYvAdQqgfMOaVt1+Dy3us94mdqZtjtINDhcny76Pyck5w9AEXQl
 qtZpx1LDPMAeibKGU5UrgcFvQVADXi4HiTECfHbebYYjJvofPA0RnsB3TPNk4XvxyO3f
 TqDv34qwk7PWEsmBvf9d/Q2b/JfLvklDnx64HPdt7e3b3NIDzEglwHNFqhSq+H4S1c33
 737PpbuorGUzMcyUWNHl89THtkmTt55vjKaKR2Ml27L46PhfjsbTXueNVRi070NoyN03
 brpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmOA4hTXoFJgPIkSLoPY5Pv6ZSufjfvFYbVm9EtEbNiDqG5ZQpQBkscPdfkE689sUeIBbWU9zelS2F1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyPxFSZd3e6PCf1w1IdApdobZ7r9NsjRfkCi+a112+9tfflx0aE
 k612ixL2HdGQy2woNEepad8Q7W3LdeWbQk8eZPHnAaeHPiu2L6ARWxVBBA1etyf1ag==
X-Gm-Gg: ASbGncsI4C5zYnaFHZBHp9+DlCHuHTXeG11fNjpuMpUz0OfgAnfCSuy27f/mCJC7ilG
 FrsVzqZsbo0OrBSB17NJjWJJUU9EPE09hQWVLN88014CqsqyuQ0lYb3nlelHSkiY6b6/VRcdj69
 XP3nNDBT8u8avsyIXzku9tmmAIzVMnHahER4ptZp0dUwYFZILyTRth0xTh8cWZftXeksKHnXCjA
 o/IJgYDxvgt5citfQgKAra/e4tn9WIQM0zuBoq2r8DrpUT9D/bciW7+M3CkW8uMr8UppN/AKbq1
 J8FP3YPAnM5Ri8icxN4giCcq5lEoVTHp/hAc/jf50bfPpkwoIWUGC09wmJpcObGTYtSpx0mGCg3
 eMVq1XNxuFUS6c/PAcZ2CWCo3ANKMXUEYEhYR7kfpO6xC0MnF1S2xVf4Q0ddv3aBEBkwkre3bra
 80
X-Google-Smtp-Source: AGHT+IH3Pl8hly1TQfln2anufJFdUC5B1Ir4HZCUoycIdoSWzeF9avLSYC/Imq9DCATPu80vE9gR5A==
X-Received: by 2002:a05:6a00:4b43:b0:749:8c3:873e with SMTP id
 d2e1a72fcca58-75724876b0bmr33128549b3a.24.1753121302713; 
 Mon, 21 Jul 2025 11:08:22 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759c84e24c8sm5845796b3a.15.2025.07.21.11.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jul 2025 11:08:21 -0700 (PDT)
Message-ID: <7bebb6b5-d527-4621-9438-8a8d0ab9d970@broadcom.com>
Date: Mon, 21 Jul 2025 11:08:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>,
 Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
References: <20250721-wol-smsc-phy-v1-0-89d262812dba@foss.st.com>
 <20250721-wol-smsc-phy-v1-1-89d262812dba@foss.st.com>
 <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
In-Reply-To: <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>,
 devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 1/4] dt-bindings: net: document
 st, phy-wol property
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



On 7/21/2025 10:07 AM, Andrew Lunn wrote:
>> Regarding this property, somewhat similar to "mediatek,mac-wol",
>> I need to position a flag at the mac driver level. I thought I'd go
>> using the same approach.
> 
> Ideally, you don't need such a flag. WoL should be done as low as
> possible. If the PHY can do the WoL, the PHY should be used. If not,
> fall back to MAC.
> 
> Many MAC drivers don't support this, or they get the implementation
> wrong. So it could be you need to fix the MAC driver.
> 
> MAC get_wol() should ask the PHY what it supports, and then OR in what
> the MAC supports.
> 
> When set_wol() is called, the MAC driver should ask the PHY driver to
> do it. If it return 0, all is good, and the MAC driver can be
> suspended when times comes. If the PHY driver returns EOPNOTSUPP, it
> means it cannot support all the enabled WoL operations, so the MAC
> driver needs to do some of them. The MAC driver then needs to ensure
> it is not suspended.
> 
> If the PHY driver is missing the interrupt used to wake the system,
> the get_wol() call should not return any supported WoL modes. The MAC
> will then do WoL. Your "vendor,mac-wol" property is then pointless.
> 
> Correctly describe the PHY in DT, list the interrupt it uses for
> waking the system.

+1
-- 
Florian

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
