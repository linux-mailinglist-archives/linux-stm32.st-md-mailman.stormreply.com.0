Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EN5bCxgmc2nCsgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 08:41:12 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A48F971E45
	for <lists+linux-stm32@lfdr.de>; Fri, 23 Jan 2026 08:41:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 52656C8F264;
	Fri, 23 Jan 2026 07:41:11 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2A7D8C87EDF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 23 Jan 2026 07:41:10 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3530e7b3dc2so1890600a91.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 23:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769154069; x=1769758869;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BybO1XLVfdhod5yqmV9OoExkCCsTqBLc4oAzOMgKi/0=;
 b=mqBgFqm6EEYbOqgv8JkwW1LtWgRmVeM+IVw1as0U2BdWDV2mQJFH9J1Xh186gIKivL
 NWrNqwHyUy51/kKEGoQq6xbnSqfSaZMyT6WbFDYJrkIanSynOyaZ1GOkN+Su72Nz6oGW
 QYKzTAn/FmxXM6tOhxmSVTKKDBI3NIQs+mirGjl5TpfbdjsnB1oeUWfST5rd2X1bCJpF
 mI/ODYUmFBBkiNSKtc6SfdILT+vwe+UsA42GXlZ5AZdI1DSmnnBjtWbIBN2Nt34typSk
 pc1uamw5nC+mBOJZbMjlrgCE0QqwmIBLiFvkR9FsGNbe54mpCa9WLi4QDNhxcVtTQLob
 pRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769154069; x=1769758869;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BybO1XLVfdhod5yqmV9OoExkCCsTqBLc4oAzOMgKi/0=;
 b=AadJWtYISCl8dhdusS4X6TTmpludVEqcoxkwNwHebZ/wXfNiw5/4TT6hBhaMQm86aN
 p+Q5I5Yfcr+eKJYafcruWxSv8yx1Tte+OfFMLSTDXPI36KHWYeXbL0T5PrRdtZEiQLgk
 g622RHZgND1/bqMm1zDuQ7+hVKgTjC8epXToEyCwtggQpgUxGuZUMEzCdMGVOTrtC+O4
 yyZzgkiuj0IKVwA+kt/ofXXUavLhSEd6c7lkGeS0qTlFrrIwTGcuyoi/Y4kBKbxYesx/
 SmWKEMR7o0ABWG19y6r7WiV4tj95LsDqyWqO6oa5b+XqdC10ow8LSGB+XJa3Dmtnp/kj
 S/Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMqdsJY/Gb72W3HaGTfjBiCVn38dw8oB4F05IJ2LrkUUzM6IgB4h0J3+cINazt+SsBAm85EffQdTxbJA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy7e7ESOo4jGIehfrzPi6FM2YOWbSBtbvv6zc6N/PW8fulkt4vA
 5mZeh0pEBnAEJQats6is31BXo5pTmRqy3GggOO3jC0lAGh7XYdre3m6w
X-Gm-Gg: AZuq6aLWU9CmrXYokDqLRVa27cgzSOgg8mSdtbll3/xOlikkfdyZqOlJLNgQr8lwk8a
 e6abERYdueD0K//N+6F27Hzfg9Tpm2svU6xmbmBNO0RsQhM8qxCigp97YAgndvaGXFPKQPLEXBv
 uGDVlVYDaf9wSjqay69yNF7UdrA+cwfBQf1wKZD2LFaBDHwhpnPUjDAX9tI5LUe7Lsm78kReIkz
 iXgr4GYLH+jZ6BSk/6vRu3a0oy3yDfk5Rmy1HG4j+Xbnpnbnz+VKHQ2R0R+MBmS7NmrioKNMuvj
 h/+UjACNTwboR5MKrR8j0FhvXDNik+6WGWrFEXsARMxEEQcVk1GvOA57WcVU+XEY8bFdZd2bfS4
 crk/VSEbH3GnDNSY0cR0FkJtsK/r8cPT7MvFsYWPDt14byriD+CE4NJnzdnvm6ptzoUx1G3grKQ
 STlgzQ8Y8bLj9N
X-Received: by 2002:a17:90b:2d8c:b0:33b:be31:8194 with SMTP id
 98e67ed59e1d1-3536911f08amr1801422a91.34.1769154068601; 
 Thu, 22 Jan 2026 23:41:08 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3536dc506dbsm1276411a91.14.2026.01.22.23.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 23:41:07 -0800 (PST)
Message-ID: <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
Date: Thu, 22 Jan 2026 23:39:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?B?5p2O5b+X?=
 <lizhi2@eswincomputing.com>
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:lizhi2@eswincomputing.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linmin@eswincomputing.com,m:devicetree@vger.kernel.org,m:ningyu@eswincomputing.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:mcoquelin.stm32@gmail.com,m:kuba@kernel.org,m:krzk+dt@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[ganboing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,eswincomputing.com,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,redhat.com,armlinux.org.uk,davemloft.net,lists.infradead.org,einfochips.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[ganboing@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.957];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,kernel];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A48F971E45
X-Rspamd-Action: no action

Hi Andrew,

On 1/22/26 19:19, Andrew Lunn wrote:
>>> You say internal. So the skew is fixed, it is a property of the
>>> silicon? If so, why a DT property? Why not just hard code it in the
>>> driver? Since it is internal, different boards should not need it set
>>> differently?
>>>
>> Thanks for the question.
>>
>> EIC7700 has two Ethernet MACs. Only eth1 has this internal RXC/RXD skew,
>> eth0 does not.
>>
>> So this is not a chip-wide constant that can be hardcoded in the driver.
>> We need a way to distinguish the two MAC instances, which is why this is
>> described per-port in DTS.
> 
> I assume the address of the interface is fixed. So you can just key
> off that to distinguish the two instances.
> 
> Since this is an internal property, not a board property, it is not
> clear it actually belongs on DT.
> 
>      Andrew

IMO, they should be in DT to provide maximum flexibility. The SoC .dtsi
can provide some sane defaults, and the board vendor can later override
them if the mac/phy requires further tuning. Applying such tuning by
the address of MAC seems messy and it hides the parameters used behind
driver. Through DT, everything becomes really clear.

I assume this is not uncommon: E.g., starfive/jh7110:
https://lore.kernel.org/all/20230714104521.18751-3-samin.guo@starfivetech.com/

BTW, no need to worry about backward compat. ESWIN hasn't checked-in any
DT for eth yet. As you and Russell said, they need to do it, pronto.

Bo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
