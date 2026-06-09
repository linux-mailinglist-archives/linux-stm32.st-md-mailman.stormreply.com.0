Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wRErEDZqKGorDwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 21:32:06 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD77663BC6
	for <lists+linux-stm32@lfdr.de>; Tue, 09 Jun 2026 21:32:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=RUj6eopl;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=riscstar.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 904AEC8F292;
	Tue,  9 Jun 2026 19:32:05 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 70A4AC8F290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  9 Jun 2026 19:32:04 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-4859b1fc7a8so3192893b6e.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 09 Jun 2026 12:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781033523; x=1781638323;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WqDaomdcEkmPt/kMkSkh61O8nncSS4SHKIlJjYIogSM=;
 b=RUj6eopl2koTHB9d9k1WQMPEC6HYfJnVi78Pve5TeYlB8pPCcyiYCM9BQzTJbkrK00
 Mq1irfPIzwK4rW+6MJ6K5+OzD6DvbL23rO+dGPxq8FDuC4AtKYFY5uGay76ABWLLeHcN
 DBoabqdFKlDLOQPtMZTJCD0l6ly1SAywXcPWAXm/4RvcyvcQ0mqg+1zE8b0KY1Grl6T6
 rGVbTBhZEzhVu7Xq8lBx+UM9F4KeeiKW/RjwtDUa3gqTDZQi4YhRIcBSlU1iaj8zVatH
 7Q/vpdHm5Oa66wvBjakqK1pa/ohUeTFZBx8JyAX0jEFljHRrK/qLzcG5c85HOLzQu3Ao
 o6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781033523; x=1781638323;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WqDaomdcEkmPt/kMkSkh61O8nncSS4SHKIlJjYIogSM=;
 b=X9FlvM1xpm7jv5OQNBqHcuHAxuvLxq5isvFrAwxoHJ3+lWuE8sSSpx5klXzut6Wo63
 r38VN+ARq5OG7DHk3S9dsitadHLuZt44X75Y3jOrAQ0vWfYjJeNdjTofKT+q1KFbCaVT
 9Ya6Y9BRpxIFAQvxgE2w+58ueJKYmEoaFGg+Dr2i4v+nTLqow26AJinQmAVOV997KbB6
 u5Ef5FJXqDcoL6pfvf9pV90Z2FBnZ5X4+6aLMc38gIPyXTg+VMfS9I1/zQChZMNofACT
 FtY+uaQSW2NJJvOQGUIB2PjCR+szDL/p+UIIOlRsZQoZNCmon+rWiuZ/xF41qrUumr5R
 n70w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/vrPQ7nbkCKW+WwocfZrgHQMICaNBg7m47F8Cyo1pPvpnWABTKx3JTxU45rSh2icgzc36f+g9TVLms8w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwiA5K3OhCxaRfUobk5h7OC7mvW/0eWaocsf4n2h2wqPr/1s2BH
 Zrrn/UWgC1YSoEVkCJYp9mLkE0HSoumXX+F2mctgZFYpsX67ro2XXIzCghULK6GPMy8=
X-Gm-Gg: Acq92OFKNnJjO0mEY6FcHkyM/ta1Y5S6oguAnKQ49zjRbbZ4knTIU7NzIQEyGThgA0h
 MC3sKmgf6DYFE8abOjZLYeE0z15OHhIn0eG2WFGG+v8gj8Rwz8QQWYuGgQk0rUPJ+023mm34MM5
 GpIfoaUFq3YbcnVjz995Cwbpm+wuP/unTmWsttBF/SGTIFfDSWBNUN3Rq4yK1Wf9748XaDpDUDo
 6YpB/WPgwS6Mrg/DH2Oon8bdodaVakhBA0JfbV+SZY+UdxH3nSQ3Fu5DFZDTpwSAUdE+0rbLMsd
 0qx4JVACScN2Gui7qHYapirTKW2YQybMPyMAjuEIOgYTI0xbeKxDjILpe6z8AHpp0bjysvu6gOj
 Abgf/5vBLZfGm6bKwfXC0vRpgm9IUe4qjgwIgXj4/COYnT2A1xyx03D6zdVx9sxNlj5lOGnVUYH
 rKoddcH95kaZKuU0nuvgT/2gbpvETvJSbaVg==
X-Received: by 2002:a05:6808:4fe2:b0:485:7c72:786e with SMTP id
 5614622812f47-4868df054eemr14537468b6e.21.1781033523165; 
 Tue, 09 Jun 2026 12:32:03 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-4865b32f372sm16507092b6e.0.2026.06.09.12.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jun 2026 12:32:02 -0700 (PDT)
Message-ID: <47a9909a-da5b-4b12-806a-1b9542cf8bc2@riscstar.com>
Date: Tue, 9 Jun 2026 14:32:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, andrew+netdev@lunn.ch, 
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, rmk+kernel@armlinux.org.uk, andersson@kernel.org,
 konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linusw@kernel.org, brgl@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-14-elder@riscstar.com>
 <c60d1819-18d7-4d4c-a997-586599323d7e@bootlin.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <c60d1819-18d7-4d4c-a997-586599323d7e@bootlin.com>
Cc: me@ziyao.cc, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 devicetree@vger.kernel.org, hawk@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 ast@kernel.org, linux-gpio@vger.kernel.org, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, inochiama@gmail.com,
 a0987203069@gmail.com, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, bpf@vger.kernel.org, julianbraha@gmail.com,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next v2 13/14] net: stmmac: tc956x:
 add TC956x/QPS615 support
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[47];
	FORGED_RECIPIENTS(0.00)[m:maxime.chevallier@bootlin.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:rmk+kernel@armlinux.org.uk,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:me@ziyao.cc,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:linux-stm32@st-md-mailman.stormreply.com,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:devicetree@vger.kernel.org,m:hawk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:ast@kernel.org,m:linux-gpio@vger.kernel.org,m:wens@kernel.org,m:linux-arm-kernel@lists.
 infradead.org,m:inochiama@gmail.com,m:a0987203069@gmail.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:bpf@vger.kernel.org,m:julianbraha@gmail.com,m:hkallweit1@gmail.com,m:andrew@lunn.ch,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:conor@kernel.org,m:johnfastabend@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,vger.kernel.org,riscstar.com,xiaomi.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,kernel.org,gmail.com,cqsoftware.com.cn,fomichev.me,altera.com,bp.renesas.com,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,stormreply.com:url,stormreply.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCD77663BC6

On 6/5/26 11:05 AM, Maxime Chevallier wrote:
> Hi Alex,
> 
> On 6/5/26 03:00, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> Toshiba TC956x is an Ethernet AVB/TSN bridge and is essentially a
>> small and highly-specialized SoC. TC956x includes an "eMAC" subsystem
>> that can be accessed, along with several other peripherals, via two
>> PCIe endpoint functions. There is a main driver for the endpoint that
>> decomposes things and creates auxiliary bus devices to model the SoC.
>>
>> The eMAC consists of a Designware XGMAC, XPCS and PMA. Each eMAC is
>> supported by an MSIGEN that bridges TC956x level interrupts to PCIe
>> MSIs.
>>
>> Add a driver for the eMAC/MSIGEN combination.
>>
>> Co-developed-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> ---
> [...]
> 
>> +static int tc956x_lookup_max_speed(phy_interface_t phy_interface)
>> +{
>> +	switch (phy_interface) {
>> +	case PHY_INTERFACE_MODE_SGMII:
> 
> The SGMII definition we use in the kernel is the Cisco SGMII de-facto
> standard that only supports 10/100/1000M. Some vendors use flavours with
> names such as HS-SGMII and such, that's basically SGMII clocked at 2.5G
> with aneg disabled. It kinda becomes 2500BaseX then.

So for SGMII then, the max speed returned/used should be
SPEED_1000, correct?  And for 2500BASEX it's SPEED_2500.
(I'll fix this.)

For USXGMII I presume we'd use SPEED_10000 as the max_speed.

Can someone explain when the plat_stmmacenet_data->max_speed value
must be set?  It seems like plat_stmmacenet_data->phy_interface
should normally imply the right maximum speed.  It looks like
phylink_interface_max_speed() has a big switch statement related
to this.

Thanks.

					-Alex

> So all in all, we don't support 2500M on SGMII.
> 
>> +	case PHY_INTERFACE_MODE_2500BASEX:
>> +		return SPEED_2500;
>> +
>> +	default:
>> +		return -EOPNOTSUPP;
>> +	}
> 
> Maxime

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
