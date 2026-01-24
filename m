Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id P4njEQtVdGnE4gAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 06:13:47 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB287C88A
	for <lists+linux-stm32@lfdr.de>; Sat, 24 Jan 2026 06:13:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40B58C87EDF;
	Sat, 24 Jan 2026 05:13:46 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 003B3C36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 24 Jan 2026 05:13:44 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-5014d4ddb54so34512771cf.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 21:13:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769231623; x=1769836423;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uAVsETK21+kGnCxqlDEtp4ioX9WXTvhY2/OchwRYyU8=;
 b=ls5f90hiezmy7W27nVQPZ2nCxIMYTFxDcxu0GL3hyULvUrI4hlIDZ/Ply8HAqX6vLs
 NDj7QsFVcE40SgWFHNZ+FK2byUQfP7ilWzrTXzLEvnzZgwhc5BBJkfZ4jxBS2n5mbRlh
 ADMGtan/ZNbr8z0ukFiNZj56Yu2EPeD37ca0OAjbVtR6J7ProKv9d0wLYhEcP9zRorwk
 Z/iKa/TVO1Cnq3Tpx4aqVfs/nR1JUlCozpp5uHPrVPEVGrfa3ey1hhDnk2a7s+hZywKq
 QF2iV6basgCgTbQ1L+WbtrF/E84QWifkwuyyzadz51hV7QZnXUzra4QpkAP7iGMuZ3zY
 GyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769231623; x=1769836423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uAVsETK21+kGnCxqlDEtp4ioX9WXTvhY2/OchwRYyU8=;
 b=ukIU5JaA+VetIaMWMY9x+/OEkUlYQNPJuIDDavE7aCeB561uxKNJJ0KzkhOUc3JFEs
 Dq8HPM3Cy3zVDorE4lkHqX7Pps3prypvyxwIas/26kUrNjXmJVXXKItgpvux5PKQPHSg
 D9fACruLn3jfmlXMzYN25+qWR8obzMizkEGSycS3q2B3GU/Z69v9Zk1gWp40dKwjoHnA
 Tm/+1VdwAmOkpanaaSUOa3jcrcKSvAB/5yHA+PEMZ20/AMiCBit6MzsWNdTCq1p5pZZz
 FE+8eLiZAuPowYTXacn2+HpiQctAIstGdHhlF7S3ZeQ6pTXo1VRGtFMsord+uIREh/au
 HfHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtlSGumtcdX8pKPEV8yxwBw2al8qwlEfHht4fw7zW20ypjRJr4HetzpVgQQyoRaXEhC1FOLgX+zu8Mdg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxoH6kK9iQfbdkB3J65CDTsD8zseQwOfHXEGaW04X5JzshQd1Lk
 zOos++afyhza9wqXc2UlgCBpERRCltvuusOpv0iP/pcGd7bc0JogLAiwAxIsmw==
X-Gm-Gg: AZuq6aIsC+psKtoJx4LDqDK4R5VTftRYp9CXzdHZyrpaztd2VqbbAFWOqj/pG0Fs3lK
 1L6wYTthaE11+P1BxXyY8tBukHACT4pCIl+RhsnuruRAhWyPC58W32n+6rc4JmQ/pOR7G67U1Qi
 fvLrOX28O98YDvlMYskRsN8wxvcNr3L9vyLLS6xMRLtC34mVEcYJNA2aD6iwVaGKTZ4j59YtEiP
 CxKKpHu2zJBam8wgT/eiNYx9cSgwiO3/fS3f8GVib3/zACGQsb+nkYWaF7XhQHpGeLJ4E+R0Raj
 oqHHJ/coZewYwSkmjfocBuJuw4/8Zx0FI+g7iBubVUpnd5371+HmYsEgmIGcZtOWS5hiVJed9VO
 4fHk6XzO7AYLFGnRF4DEDzr4/tTxTtW+kt+AmgELZZd3amuiX3hM4pOezDrW1GBYq0RRwXcneCr
 GSf8ZhooSgSgipfGw42s1saTAVPgbjMsOoBpjOVC1xTZ4sFw==
X-Received: by 2002:a05:7301:1015:b0:2ae:5db9:f32c with SMTP id
 5a478bee46e88-2b739b6d1bdmr2095282eec.26.1769230365229; 
 Fri, 23 Jan 2026 20:52:45 -0800 (PST)
Received: from [172.16.0.242] ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b73aa22707sm5548789eec.29.2026.01.23.20.52.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 20:52:44 -0800 (PST)
Message-ID: <009aefc4-fbc9-4f91-9230-23d18c281bf3@gmail.com>
Date: Fri, 23 Jan 2026 20:57:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
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
 <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <bd202cfa-d6eb-4d0e-982d-b49795dd25f7@lunn.ch>
Cc: =?UTF-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, ningyu@eswincomputing.com,
 Krzysztof Kozlowski <krzk@kernel.org>, kuba@kernel.org, pabeni@redhat.com,
 devicetree@vger.kernel.org, conor+dt@kernel.org, rmk+kernel@armlinux.org.uk,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, edumazet@google.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:lizhi2@eswincomputing.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:ningyu@eswincomputing.com,m:krzk@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:rmk+kernel@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ganboing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[eswincomputing.com,st-md-mailman.stormreply.com,kernel.org,redhat.com,vger.kernel.org,armlinux.org.uk,lists.infradead.org,einfochips.com,google.com,lunn.ch,gmail.com,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: BBB287C88A
X-Rspamd-Action: no action

Hi Andrew,

On 1/23/26 11:43, Andrew Lunn wrote:
> On Fri, Jan 23, 2026 at 02:47:18AM -0800, Bo Gan wrote:
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
>>
>> I'd say if the board .dts never overrides the eswin,rx-clk-invert, (E.g.,
>> the SoC .dtsi has rx-clk-invert, later the board /delete-property/'s it)
>> then yes, it can be treated as something inherent to the mac, and then
>> "use arguments in terms of DT rules". I was thinking about use cases like:
>> https://lore.kernel.org/all/20230714104521.18751-3-samin.guo@starfivetech.com/
> 
> Your device should be compliant with the RGMII standard by
> default. There should not be a DT property to ask it nicely to follow
> the standard.
> 
> Properties like
> 
> motorcomm,tx-clk-adj-enabled;
> motorcomm,tx-clk-100-inverted;
> motorcomm,tx-clk-1000-inverted;
> 
> are for broken boards which break the standard and require the MAC do
> also break the standard so that everything works. We should not start
> out with the assumption you need to support broken boards which ignore
> the standard.

My reading of
https://lore.kernel.org/all/308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com/
is that the eth1 MAC is already breaking the standard at SoC level, and
the boards can un-break it or break it even more. Hence, even for proper
designed board, SoC .dtsi still needs eswin,rx-clk-invert (for *eth1*).
For broken boards, they may require eswin,rx-clk-invert for *eth0*, even
though SoC doesn't mandate. For *eth1* broken boards might have to
/delete-property/ it and use eswin,tx-clk-invert or something else.
It's clearer to have all these parameters visible and explicit in DT.

ESWIN, please correct me if I'm wrong.

P.S. I'm not affiliated to ESWIN, but I do own eic7700/hifive-premier
board, and I can talk to someone who owns eic7700/megrez. I can help
validating ESWIN's patches independently.

> 
>         Andrew
> 
Bo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
