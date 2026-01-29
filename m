Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLVKCXa+emnw+AEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 02:57:10 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ADBAAEF6
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jan 2026 02:57:09 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 319EDC5663A;
	Thu, 29 Jan 2026 01:57:09 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0113AC56603
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jan 2026 01:57:07 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-124877d78a6so563224c88.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 28 Jan 2026 17:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769651826; x=1770256626;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1PA8gr+YKpeMZlbtexD0GnfzavDOVqcWassYAa2Q9AU=;
 b=XZ4nZmpYnZ5Bt4bPlsIqjjxtUcQhk5BL00wqw4ImJV+cOf8TcKbFNY5iVxvBNdeTRX
 so41i6BBnxDeLnLg3oXZDoFNZk53vBxiDsWsks0jIFYzytGnCcPWLs7iIhR10YvbOTiE
 qaTkB3QTqGecmg1RP9vsX1RUM5vCJ4NaMCgXuiQt8RBx+Tx2KyhIQQ4fIZ1eV1LAisGa
 AL1djNhV00iHl0MGQHXunkg+pJ63Ik9UXXE67Z1nkQ3rAp8dRbhwW9mB6+qcRqgmV66y
 SL6waCfoKnEy7+7jlTPJD1HWKETYeU1h+8EXuiO6qmoTfU4EIvuVduff0+D/kOgAaQo6
 Za2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769651826; x=1770256626;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1PA8gr+YKpeMZlbtexD0GnfzavDOVqcWassYAa2Q9AU=;
 b=NwtwZp4DgUOYef/sW7tOQeJn2OaRB4KAksY/QOwjE3Cv9ncuLaFKijojxoPvJdxIRm
 ifxK5K4ybytwuVG2rcTIyXxG6Ya4L/cVJK7y5LRS/bHQ66TRle1N0T0+VWA490LkewJU
 tXYgCfdD6ELbdyZg1zzMK89gJDJogVT/hvdwG6mviPzlufiGdvWP3zD3crVr5d4WbQBg
 zUIJ+UWRXnR5PhuTdplK+t3Fq5TJd+7sS5heMHg7lL8cvkqQdInWGBP+IGMjrddwCwWr
 ZlftBg3U+7ZVtEDkFX4jp8u3CU+R5qOYKYYpAzQKa7WdOehI8KFpLdHduiDS2DlAt4eC
 Jl4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1368aKS1ga0J5YHMTHBemWhLuKcbYGdAIqs+q64Z9/+FGdryOlhOc4umUyAitNy6ijwk00xNwo0uXQg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2hntMI4XOtvUbVer3Un8vnolBcn0D/NHBX1UUQDWphtNne8G4
 WboiEM4nml3JubZl6LhLf4m8vO0tN8iTFq64DzeiPPUjn7O+FtSiJ8Sy
X-Gm-Gg: AZuq6aKgE3YPPllmD2/vG+ckvZH0DRnRZ216PzAZB/4KHuZYvnfKH2xfAowf8YyIoDh
 2VWf7vT3UpLo0kS/WN12N5569skbyKTIBV/B6IiQBpqA172jaTf7G1RIz1DwBNWoKVa02dsw1Bi
 fZgLdEGXSSvQA6gHrsoYX9fql1BoJuonFO5ZBw0nIqhUs637HnJTLpInJy+6zhoRcPD0e1svb3b
 dyNOd+ByXSk3ZHCoTuhIMVzLxCoGyMsBJeBueUsVBwTK9DNXbAg06WYRkaIkwx0sRXNAelvujl6
 1q9sqaiRySXdDAFoSgQQos/2IBejLiegOUPlgv8+oDifzeWl9W3v19Xd++TKzCrssTuBclKgVwm
 XrjvNZEgkP2KmuPoyZ6Ew8rvVXo8/uLEHPOpcoz8gwC6Rge51nEljrMkLsJe/PEjwK8UErmE9/x
 xlf8AGamBGXWmziERf4eUZjp+efBqctOQmTkYMCIBR9WSrFA==
X-Received: by 2002:a05:7022:b8f:b0:11a:51a8:ec9 with SMTP id
 a92af1059eb24-124a00bd920mr3704741c88.29.1769651826013; 
 Wed, 28 Jan 2026 17:57:06 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-124a9cdcbcfsm5670014c88.0.2026.01.28.17.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 17:57:05 -0800 (PST)
Message-ID: <48f1c033-4a0a-4b17-aae0-9c712748b2ed@gmail.com>
Date: Wed, 28 Jan 2026 18:01:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
 <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
 <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
 <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
 <3ed93cd3-677c-4d0c-a3a6-25c3d47a4ef2@kernel.org>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <3ed93cd3-677c-4d0c-a3a6-25c3d47a4ef2@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org,
 linmin@eswincomputing.com, devicetree@vger.kernel.org,
 ningyu@eswincomputing.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, weishangjuan@eswincomputing.com,
 andrew+netdev@lunn.ch, edumazet@google.com, mcoquelin.stm32@gmail.com,
 kuba@kernel.org, krzk+dt@kernel.org, pabeni@redhat.com,
 rmk+kernel@armlinux.org.uk, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com
Subject: Re: [Linux-stm32] [PATCH v1 1/2] dt-bindings: ethernet: eswin: add
 clock sampling control
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ganboing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andrew@lunn.ch,m:lizhi2@eswincomputing.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linmin@eswincomputing.com,m:devicetree@vger.kernel.org,m:ningyu@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ganboing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,eswincomputing.com,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org,einfochips.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,kernel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: A2ADBAAEF6
X-Rspamd-Action: no action

On 1/28/26 02:05, Krzysztof Kozlowski wrote:
> On 23/01/2026 11:47, Bo Gan wrote:
>> Hi Krzysztof,
>>
>> On 1/23/26 02:07, Krzysztof Kozlowski wrote:
>>> On 23/01/2026 08:39, Bo Gan wrote:
>>>>> I assume the address of the interface is fixed. So you can just key
>>>>> off that to distinguish the two instances.
>>>>>
>>>>> Since this is an internal property, not a board property, it is not
>>>>> clear it actually belongs on DT.
>>>>>
>>>>>        Andrew
>>>>
>>>> IMO, they should be in DT to provide maximum flexibility. The SoC .dtsi
>>>
>>> This is not the purpose of DT. Please rather use arguments in terms of
>>> DT rules (see docs, presentations).
>>>
>> Any examples? links? Thank you for your patience.
> 
> Really, doing simple search for it is your homework, not our task. You
> need to try harder if you want to prove that you are not wasting our time.
> 
> Documentation/devicetree/bindings
> 
> Or any elinux resources or any recent talks of mine.
> 
> Best regards,
> Krzysztof

You brought up the "use arguments in terms of DT rules" approach. and all I
ask is just some pointers to make sure I'm not misinterpreting. No offense,
but The way you slamming people w/ "not doing their homework" is truly not
constructive.

Bo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
