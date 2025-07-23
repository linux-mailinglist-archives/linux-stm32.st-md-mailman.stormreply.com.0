Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A7165B0FA0A
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Jul 2025 20:13:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 51FCAC36B3F;
	Wed, 23 Jul 2025 18:13:36 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E03AC36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 18:13:34 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id
 d75a77b69052e-4ab7082b3f7so2700161cf.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Jul 2025 11:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1753294413; x=1753899213;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=jRAUCvyU8pYPmWFn/9AeIOCYqe0g5gOFDinoFnUur9s=;
 b=He/zeiYrpF24sfDxDdcPLOQCZrKlPwkpBNe+DU0xkdty+UfLPpTqDyB3q1HmbC+gyT
 4h0TymLzRfeSiRJSnKwUIXd1YQbC3s11lRzoY2k8Wa1u8YtzWEsVfkkqGaOneOs023Bm
 j33F35rqJ6lZ9wn8RiI2mDoYmsIwugDIp5d/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753294413; x=1753899213;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRAUCvyU8pYPmWFn/9AeIOCYqe0g5gOFDinoFnUur9s=;
 b=i6gZRZPWAUalxXY4A3+sKCgL455o0z3g5Bh+Nctf6bgmYKNoaBG898H4RbQ5aDFW7s
 u3ZcJ1qs3OEycej2J4W92dIdLmayCiq0CzjZJUpa4jg8xxUv2ITJODZ4RhII195kemxS
 rgULnuIVrLr+HVibK3yyL8pF93/m969EbL+/iHcwouyO9lJx63ojm3bcbGoGbNnaOE3C
 dLCs9Xkau15MDmQV1TPmG+MqbwLcdqXCx1RK4Krz0b2dfUCGofjcx+u+ZMNyMS/X7dE7
 11iXnPJ9PA1jHwAW9IgFEfHHdleuLQPH31rLvsxHjJ+R2HmIoyS+JWp81LzSFUHGSACf
 jPsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF6WT2avtq1vFnJtjeO533fub4otYUctoBddW8A3NzKAvc21XoBf03RQf/EqnaxOG1ITMON1Naat33DQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzEinrZ4H0Wd33b/la25xANFjaFSW9rf2m6hik53aHJJTlt9Pxh
 girJiZXxWuFGnKNypcaWMgF7K9EGTryZ8poeSrTLyQPTxHAE53HO9c+6DHbyl70tCg==
X-Gm-Gg: ASbGnctmh7HWJuW5eUzv9Px7lkPnERjht6eoF6x+mob4SZQS13vmNNs8ZcveIbT+oOb
 QRpFrEklZNlTkD163I9FnEaRcXVRrswBifHxBBJCE28Q5SDIthuiyAEELe7Lhb2ukRqVzpkByND
 2gfQvWWLUljs6Fo/8ikUEzdb17LqIw7ikI1TwkBd3W61xnf4MAQNrm19qrqq3beQ0GS7XK0QJc0
 JqwTiCqWTpkZmhF/2tUpzKVZ8MydpIxwLrqaYQTYhn0AIl4bObp8va4VSwnhOAWq5rCMebOq2eF
 3qdW7s9KaBUDuHAMS44guvvXkf467lp5gs8XKNvcvsEHi0+YU9rgC+L2YvaqWpuDtWgXjm6W19g
 l/kXMZfWt2iEtEfNmQTeVtqRZs/IygJC2H7aMCsbdApb1RuSvRU5h0wsmttoztA==
X-Google-Smtp-Source: AGHT+IFEF43RiqqzhjaLFGYq5MEC9HWC1y8/iwg5IEvEfmbn8mT4shMSnIGatZImTK+5KIX285TGZw==
X-Received: by 2002:a05:622a:59cf:b0:4ab:66d1:dcdd with SMTP id
 d75a77b69052e-4ae6df6ebecmr72328811cf.39.1753294412889; 
 Wed, 23 Jul 2025 11:13:32 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abbf5575bbsm62437351cf.24.2025.07.23.11.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 11:13:32 -0700 (PDT)
Message-ID: <69711c9c-b85b-4cd4-a5fe-2719b8e30438@broadcom.com>
Date: Wed, 23 Jul 2025 11:13:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <faea23d5-9d5d-4fbb-9c6a-a7bc38c04866@kernel.org>
 <f5c4bb6d-4ff1-4dc1-9d27-3bb1e26437e3@foss.st.com>
 <e3c99bdb-649a-4652-9f34-19b902ba34c1@lunn.ch>
 <38278e2a-5a1b-4908-907e-7d45a08ea3b7@foss.st.com>
 <5b8608cb-1369-4638-9cda-1cf90412fc0f@lunn.ch>
 <383299bb-883c-43bf-a52a-64d7fda71064@foss.st.com>
 <2563a389-4e7c-4536-b956-476f98e24b37@lunn.ch>
 <aH_yiKJURZ80gFEv@shell.armlinux.org.uk>
 <ae31d10f-45cf-47c8-a717-bb27ba9b7fbe@lunn.ch>
 <aIAFKcJApcl5r7tL@shell.armlinux.org.uk>
 <9f00a6cf-c441-4b4c-84ca-5c41e6f0a9d9@lunn.ch>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <9f00a6cf-c441-4b4c-84ca-5c41e6f0a9d9@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 Simon Horman <horms@kernel.org>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Tristram Ha <Tristram.Ha@microchip.com>, Jakub Kicinski <kuba@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
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

On 7/23/25 07:23, Andrew Lunn wrote:
>> We can't retrofit such detection into PHY drivers - if we do so, we'll
>> break WoL on lots of boards (we'd need to e.g. describe PMEB in DT for
>> RTL8211F PHYs. While we can add it, if a newer kernel that expects
>> PMEB to be described to allow WoL is run with an older DT, then that
>> will be a regression.) Thus, I don't see how we could retrofit PHY
>> WoL support detection to MAC drivers.
> 
> WoL is a mess. I wounder on how many boards it actually works
> correctly? How often is it tested?
 > > I actually think this is similar to pause and EEE. Those were also a
> mess, and mostly wrongly implemented. The solution to that was to take
> as much as possible out of the driver and put it into the core,
> phylink.
> 
> We probably want a similar solution. The MAC driver indicates its WoL
> capabilities to phylink. The PHY driver indicates its capabilities to
> phylink. phylink implements all the business logic, and just tells the
> PHY what it should enable, and stay awake. phylink tells the MAC what
> is should enable, and that it should stay awake.

We would need both a phylib and a phylink set of helpers because not all 
of the drivers need to be converted to phylink.

> 
> Is this going to happen? Given Russell limited availability, i guess
> not. It needs somebody else to step up and take this on. Are we going
> to break working systems? Probably. But given how broken this is
> overall, how much should we actually care? We can just fix up systems
> as they are reported broken.

Please just refrain from making such statements, it really just does not 
help, and if you have no direct hands on experience with Wake-on-LAN, it 
becomes purely gratuitous. I agree that there is a lack of adequate 
consistency and guidelines for developers to implement Wake-on-LAN 
properly, but I don't agree with the message and the way it is 
delivered. It's just completely antagonistic to people like me and my 
colleagues who have spent a great deal of time implementing Wake-on-LAN 
for actively used systems, and I am talking hundred of millions of STBs 
deployed each of them doing hundreds of system suspend/resume involving 
Wake-on-LAN per day.

> 
> I also think WoL, pause and EEE is a space we should have more tests
> for. To fully test WoL and pause you need a link partner, but i
> suspect you can do some basic API tests without one. WoL you
> definitely need a link partner. So this makes testing a bit more
> difficult. But that should not stop the community from writing such
> tests and making them available for developers to use.

The tests are in premise very simple, but you need a link partner and 
you need to be ideally on the same physical network and you need to have 
a system that supports system wide wake-up, or if nothing else s2idle. 
Then you need a secondary wake-up source like a RTC or GPIO in order to 
ensure that there is an upper bound on when you timeout for not 
receiving a proper wake-on-LAN trigger.

It's not clear to me what needs to be contributed to the community, but 
essentially the pseudo code is something like:

- wait for DUT to boot
for each support Wake-on-LAN mode:
	- configure wake-on-LAN on DUT
	- snapshot /sys/*/wakeup_count for the MAC/PHY device
	- enter standby with e.g.: rtcwake -s <TIMEOUT> -m mem
	- send Wake-on-LAN trigger from external device
	- ensure DUT woke-up before <TIMEOUT> and check that /sys/*wakeup_count 
is +1 compared to the previous snapshot
-- 
Florian
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
