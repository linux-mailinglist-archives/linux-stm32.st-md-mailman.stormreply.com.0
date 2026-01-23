Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPb5Na5Qc2kDuwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 11:42:54 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 966D674787
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 11:42:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5C887C8F26A;
	Fri, 23 Jan 2026 10:42:54 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A4255C8F264
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 10:42:52 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-8230f2140beso693287b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 02:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769164971; x=1769769771;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/cJzMSeJBm/TCcIoSkUUB8qr/tXilSOEhL8O9TYXtqM=;
 b=Bs1XL0mitZ2pzpL1ndOjMO/0D/6PMQ406KWcsNWU0MIx9aWstVCO6gVPIj3l5SOr6L
 qLcZaShn51Fg7ZNn5/mGvTIdDyH7I1Mus2AskOitm2A5XifnPl6wnOG6Crh6hN+v+w94
 7b0UDPCOIwa59t5sKQVQgwWVHTwoPpc8oUy0KEJVVu3DcWqArFm18n58qaATJj36iXGP
 zife3PVOItUwLt0g5CRSdaLvkzBsuh8NsvRDltpybviXUFZhx6IFlRhi10LUpar1oxAJ
 bSmy+EegRVWk98KZ5cpZblqynWvBuwdr6ZV23ZrSWRq0oZ21TGtQkvafNnWQG9KUfhrU
 Lrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769164971; x=1769769771;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/cJzMSeJBm/TCcIoSkUUB8qr/tXilSOEhL8O9TYXtqM=;
 b=gIJ2TmJUtkP+bF2loezfcSh44LFLvHEDa/4NQQkfk0x9gAlPkUnlHVXR4xFltJ07QA
 z3CtH+H1JScvj1XO+8yQoa3hdG+4JuijwXQuqFfcPXsErgM73lTN9T1bnfP+mGNUG/db
 zMw8m6OmBWnugv4XVI5O4r/BhGaCf3eIFHHKrjAtGfkMthR4J4UDSonk4SLkb4j23oZJ
 7CGho+F4jMD3vXsjgiJLUt7eJy9Boni8tvEfX1Hj5HPOyV0IGVupZeGCYWidzFKC4CLQ
 Zv582P3WO3ptm8tBDLO663ST18EXZAUtQt6KQrWeO/kSKoaVuK5H7d7Jk8ujL8XUYkrM
 TqCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUEUMXJQ4Cxf84ERwjWSm+Zf6Tfh+dbFc58IQxvNbIh/d25zkmBrQ7O8OQPou9RY6gtOPKF+hSJrasrQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwVMPjLAcWxk96SYhlz+t9NJs7ks+rWyI7KY6Hygohs5pUKU1kg
 A5mo4ztPlHSUzfgJzB/vxmn191sZ29b1icA1G5zGJBeKGJThyPktotWm
X-Gm-Gg: AZuq6aL/cH4NBXxPrc+lC9U9qp++1IPZgdiw7LAqouKzs9Q5elr1Z8ZVwbAbhKd4k+8
 /ZTSS5QgPWpWzbWLmLiOneJsyEDH/tBTk6a6aWq3XzA0MhIbMVlX/IL4hnmz7KUTG4PtJvo3np+
 jCQBG34MSQmuPy8DPIp9CtUAItLK5C2BYSVVXuw6yZymPtMoNegIbxSuD3SD/qcS8Cih1n9PvIA
 LxXDSxZr6+VPOfyiXW4NwlmpR3OhgJyXeHHQavt9oBJ8y+6R22r03CpSPxFxVeakQ2So6U9tO5r
 zLY2NShYb7oYpOZW+OdDh4F9t5sfgOFpf/NqgwglBw3EaHTzkLhARxKPmRU6+D0e0hJaKgfIy12
 CropnRVLbga9RJbiyOL3GCGZFi34Pr7NePrsPOoZuZi/4r35uRg3V9+c2wR1QOfe+4JwNR/DJ8T
 0Jp3ZppqdLTUKmHA==
X-Received: by 2002:a05:6a21:1507:b0:354:dcc0:8c0f with SMTP id
 adf61e73a8af0-38e6266c26bmr5654764637.12.1769164971008; 
 Fri, 23 Jan 2026 02:42:51 -0800 (PST)
Received: from [192.168.1.131] ([172.92.174.155])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c635a141fc4sm1743148a12.8.2026.01.23.02.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 02:42:50 -0800 (PST)
Message-ID: <43923bf9-6202-4147-8eac-5bd7bb653fd4@gmail.com>
Date: Fri, 23 Jan 2026 02:47:18 -0800
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
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <e6f7da45-3dec-4af6-a5b1-a72210bf24f4@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
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
	NEURAL_HAM(-0.00)[-0.955];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 966D674787
X-Rspamd-Action: no action

Hi Krzysztof,

On 1/23/26 02:07, Krzysztof Kozlowski wrote:
> On 23/01/2026 08:39, Bo Gan wrote:
>>> I assume the address of the interface is fixed. So you can just key
>>> off that to distinguish the two instances.
>>>
>>> Since this is an internal property, not a board property, it is not
>>> clear it actually belongs on DT.
>>>
>>>       Andrew
>>
>> IMO, they should be in DT to provide maximum flexibility. The SoC .dtsi
> 
> This is not the purpose of DT. Please rather use arguments in terms of
> DT rules (see docs, presentations).
> 
Any examples? links? Thank you for your patience.

I'd say if the board .dts never overrides the eswin,rx-clk-invert, (E.g.,
the SoC .dtsi has rx-clk-invert, later the board /delete-property/'s it)
then yes, it can be treated as something inherent to the mac, and then
"use arguments in terms of DT rules". I was thinking about use cases like:
https://lore.kernel.org/all/20230714104521.18751-3-samin.guo@starfivetech.com/

> We really do not care about maximum flexibility.
> 
> Best regards,
> Krzysztof

Bo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
