Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJgICICT+Gl8wgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:28 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DD18D4BD04B
	for <lists+linux-stm32@lfdr.de>; Mon, 04 May 2026 14:39:27 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9646DC60497;
	Mon,  4 May 2026 12:39:27 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5A0A6C36B3E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 May 2026 18:06:28 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-7baee75f874so31257267b3.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 May 2026 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777658787; x=1778263587;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=h1DjW845zhModhDu44NYwmrHvDI4OE4s13MqVWiObLc=;
 b=MmZZ9OHGAsf7yPlRipiMn80cxZIOIit+G9kdWJo1XwgeFZv36JL08geh3PZsJIAjR6
 dy7YrHYHw2rgQNkq537QozkgeJU6aHisMD6yq60IjHjlMqXG4gRM/NymdRSuyBw2oocP
 CLT3xDVP3/NrKcOSgWux85HU4QcwFYLQqSFHKtb9MJ6CnIXpqMTgVLOE6PMr2VmRCtxi
 6zONyYgUuTPmMKLKPCD3XW0hZKssW0kzlvBAUs0piXiafSagSuibyvNc2E3e9cqrpzib
 PFdUUzP8NGCb1jCcQ94rQ0OywGZT+2F7qyVlUC54jf6UPl/gRdmRG6Pa8b3eIJ4+WXXh
 8e9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777658787; x=1778263587;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h1DjW845zhModhDu44NYwmrHvDI4OE4s13MqVWiObLc=;
 b=KMmc6Oe7/FGHDglt7Q7s1YDfWbxLG/wuQ0hsIXwi2ZpoP8vrxHlgQwe3yeOc2U5Q+c
 4RCW3l8O74rVu9o7Ot2y1zukuPoNmzrL3MJX4JFWWZYMW0x57VJdKMbxb/pFh/xWxXcb
 ztxGMc0fj3rshiD9kV2pmWVefB1KZBGJTzPZ9trLvO732qxAZHydmW7mnaLHO7zdGom4
 29yGU4JUAO00UGr+T2VglhcCdH8tl9TEhd5sTtJ9oamQB2a7Esvxf2K7WfhJFXGpPc5Q
 KeeGmQDYFY5s1EYDULdgEv/E9yFvsrR4T0StZpop5KfbRJY2FWDE2bAqdc4zyYfzEni2
 z/yQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8FGWJfdlHxMPqlkt7gTsaIRU08BsyERDeQqMRfSW0XOFM5HFGJuYIKtfJWNJDFfuB6VAkyXbOy6RoZlw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxXDoIMa9smxt3vHj8MUNjaw/J5zCyGwQQ7PqrNtG5bMfGKiVqG
 UAxJvkv0wOTLFgJ+UgAQSCutuzTLgEunBwNa0BEz92PtH5TKDEJFqh21m2xS6OFXtE0=
X-Gm-Gg: AeBDieuacBOc+7D55diH2LwUJyIRwvERwZ/jjnrL8R0sIC6hz8BPxZ+vuiRQR8j84cK
 blQ2zlUOK3wNGUhv6bmBkbooQ0JqKAHnRTm26LiWgP3IuatWAko7yW/ugaRpo+mVXl3DbidfFZX
 VYkAteSHdrSLyXSuVltLIs/sc9SwQgiAPDKHNBPl3WecWviYPi9H5z+5xRNnxDj2MD0YJ8klo6+
 jrw8Atr3Twri/TfEwLMdkg3MrfW/9XKTZM2lqV9Mjy5tEIMsIgBxEC3J9g3PDTjZ0mDffyvwCZU
 p4RKNFnwZGD4aydUBuHlhDnZbe91uS2B7wu7kneaV+A8PlZ0I5wZmlxvbWlGV168IQQ0g524hkt
 Ng2zsNhAwlTSd3kN6lEgSnVL3Nv9Zun8rPsGptKRRzoY0bbDqSBy/sbHC55yRWkLkozc1nurDno
 R+aVQKEuyvEh9JGIUlI+EhMb+0o1uczTBeKtcdyDsuwvJpEMSgFe0BwRdIB7X80k0PpdCPg434E
 w==
X-Received: by 2002:a05:690c:dd3:b0:7af:6904:3f3f with SMTP id
 00721157ae682-7bd77170409mr4261187b3.45.1777658787005; 
 Fri, 01 May 2026 11:06:27 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7bd66019105sm14575347b3.0.2026.05.01.11.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 May 2026 11:06:26 -0700 (PDT)
Message-ID: <539b9de3-4a78-44cf-9085-06cd0cab2d17@riscstar.com>
Date: Fri, 1 May 2026 13:06:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Andrew Lunn <andrew@lunn.ch>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-5-elder@riscstar.com>
 <9203d8dd-8ec0-415e-9c2e-5b06b1b8dc11@lunn.ch>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <9203d8dd-8ec0-415e-9c2e-5b06b1b8dc11@lunn.ch>
X-Mailman-Approved-At: Mon, 04 May 2026 12:39:23 +0000
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 daniel@riscstar.com, chenchuangyu@xiaomi.com, edumazet@google.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 daniel@iogearbox.net, chenhuacai@kernel.org, john.fastabend@gmail.com,
 maxime.chevallier@bootlin.com, siyanteng@cqsoftware.com.cn, sdf@fomichev.me,
 kuba@kernel.org, pabeni@redhat.com, konradybcio@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, hawk@kernel.org,
 arnd@arndb.de, brgl@kernel.org, linux-arm-msm@vger.kernel.org,
 richardcochran@gmail.com, rohan.g.thomas@altera.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, livelycarpet87@gmail.com,
 linux-gpio@vger.kernel.org, rmk+kernel@armlinux.org.uk, wens@kernel.org,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 gregkh@linuxfoundation.org, linusw@kernel.org, a0987203069@gmail.com,
 davem@davemloft.net, andrew+netdev@lunn.ch, boon.khai.ng@altera.com,
 mcoquelin.stm32@gmail.com, inochiama@gmail.com, krzk+dt@kernel.org,
 julianbraha@gmail.com, matthew.gerlach@altera.com, andersson@kernel.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 04/12] net: stmmac: dma: create a
 separate dma_device pointer
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
X-Rspamd-Queue-Id: DD18D4BD04B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	DATE_IN_PAST(1.00)[66];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a098720306
 9@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.761];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]

On 5/1/26 12:13 PM, Andrew Lunn wrote:
>>   	if (priv->dma_cap.host_dma_width) {
>> -		ret = dma_set_mask_and_coherent(device,
>> -				DMA_BIT_MASK(priv->dma_cap.host_dma_width));
>> +		u64 mask = DMA_BIT_MASK(priv->dma_cap.host_dma_width);
>> +
>> +		ret = dma_set_mask_and_coherent(priv->dma_device, mask);
> 
> I'm nitpicking, but i don't think you need to introduce mask.
> DMA_BIT_MASK... is already on a line of its own, and is within the 80
> limit. Nothing changes here with s/device/priv->dma_device/
> 
> 	Andrew

I did this.  It was simply to silence a checkpatch.pl warning
about a long line.

I don't care either way, I'll gladly put it back the way it was.

					-Alex
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
