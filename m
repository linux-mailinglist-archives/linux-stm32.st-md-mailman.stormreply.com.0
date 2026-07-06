Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HoGSGdWuS2rbYQEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:34:13 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D33711537
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:34:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=redhat.com header.s=mimecast20190719 header.b=YxSC6EbQ;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=redhat.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 477B5C8F271;
	Mon,  6 Jul 2026 13:34:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 498A8C7A837
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783344850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IUhPhmdKFY/hvP+RYH3Pc2WHx3JLJjsr6cul6j9Vdw=;
 b=YxSC6EbQRyassKLh4zE3VIKFri+ZHEXE43B1tHD4Gc0/FH14gZOsUmi42cSPBJtyk7z35l
 QXRFcto8ZzOVQ8kpJfUKkAe0m47ZkGIiKBZjxwy/cnkDymS0+sJhMQT4T9lyvFj83kmA9/
 zWBBX7CGhPVTsr9Weo9651PcGP8efeY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-neXNRxmGN5mD6T-EK3a5Hg-1; Mon, 06 Jul 2026 09:34:09 -0400
X-MC-Unique: neXNRxmGN5mD6T-EK3a5Hg-1
X-Mimecast-MFC-AGG-ID: neXNRxmGN5mD6T-EK3a5Hg_1783344848
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-493bb6a4336so26862455e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 06:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783344848; x=1783949648;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3IUhPhmdKFY/hvP+RYH3Pc2WHx3JLJjsr6cul6j9Vdw=;
 b=sBQZyaChlTmnBdFo4e237zPZRa73gQOMT104O+q9oBeKsawX1VBzlywiJv/GUbSkRl
 zzPd3VTIoiJItjGhjbCE0HWOtKk0E5t1tVyR7jNbE8NC/yqDWDQ3LmpVnPqnZtTX81Yd
 nV+yby9ZNbWaajCiW+PJ9htoSQzok9VR9xoWSaQkj/hQQCyP0hqNsMeehrxgcGFn8jgd
 mv6fTxMQf2xMd39KycG1a+Q47XVQfM4VovbK6yiaN8sWi2Q5oowRZVFIn6iDEVPBv+NL
 FZun2d0vuLyAusHyRDqk/FHN1/j7XxPxsI10kGorXG76pxiyrZyB+BJu1zSc2Go23v4h
 xz8w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq5KWnHix7ud6S58FUqz6Bf6n5LqVE15lWzzbnj38sG6HmfohP0OikOahPlIciB/GSE6rAgNMOR8b6DHQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxzpPo4SEGjLDH8KB04h3mUOXXjskfqkn5hgCk7DDZoGW83/bDJ
 NpjBB9assxOXs6RloiPUr27VvBsdVWtdupgEqSgJBjv3HomgqEOJwLHVNzp5Ir1GX50J81VQuDy
 mOfVPUtBri2om+7/BwzDQvdlxeJwLxir5XsIQiDfjrcp0SFvTrZJ41Q0zOFlYbntYUZkyHUkFC7
 8vXTX+UA==
X-Gm-Gg: AfdE7cnGXxJ8AcL7fM9TNK2oSOkjkDVpfbHKnrhGDyZWbCRo9ilM5FWoPEGVnMbt+q2
 v+WqlKDWhe+ISVeleFlrhKm1REWKswwnkUwgJ0DhdXwZ8QHy3B7KJhT8s4N/IPQ989bv3Kimu7p
 KopgmUWSBkZ91q7QTFlLT/hta7OXSdaJvXLww15Li3iVlQLH/rcX+cXuMBpcqjtB0kX8gNTfwbd
 h1jRq6cgmWGRton5USbKPCK47WAq9ObtKgQlxPeDYC/fVWQELevz7UyQhQIhHNUexCwMdfYiwSM
 Of5xvBZs9SMHuStqrNM1mMvQkeglN5EjfzciC+kZbHmP58RwrlC5zUZoc6FqvMOfQXPYqZdAAQt
 Nsj6GKzv8YUfadCugwk9krJNPnuUWrvyS1xcXySg6o9enpwGyhh760LFi/dftxScrnUhFREzzVo
 brqmezQCeQFXg7
X-Received: by 2002:a05:600c:6085:b0:493:bc97:916b with SMTP id
 5b1f17b1804b1-493df0929f2mr5699375e9.26.1783344847654; 
 Mon, 06 Jul 2026 06:34:07 -0700 (PDT)
X-Received: by 2002:a05:600c:6085:b0:493:bc97:916b with SMTP id
 5b1f17b1804b1-493df0929f2mr5698905e9.26.1783344847212; 
 Mon, 06 Jul 2026 06:34:07 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d?
 ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccd9d607sm357583515e9.2.2026.07.06.06.34.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 06:34:06 -0700 (PDT)
Message-ID: <b95dda96-ee50-449c-9d23-3de490d3ab1f@redhat.com>
Date: Mon, 6 Jul 2026 15:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Conor Dooley <conor@kernel.org>
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
 <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
 <20260706-confess-dagger-e60b5fad57e8@spud>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260706-confess-dagger-e60b5fad57e8@spud>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aX7jeimPw1_jnXHzIllaQsa5R488lZwqrARmBw-bvL8_1783344848
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, lizhi2@eswincomputing.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, weishangjuan@eswincomputing.com, alex@ghiti.fr,
 andrew+netdev@lunn.ch, ningyu@eswincomputing.com, lee@kernel.org,
 maxime.chevallier@bootlin.com, kuba@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, aou@eecs.berkeley.edu, mcoquelin.stm32@gmail.com,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org, edumazet@google.com,
 pritesh.patel@einfochips.com, palmer@dabbelt.com, horms@kernel.org,
 pjw@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,eswincomputing.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,ghiti.fr,lunn.ch,bootlin.com,eecs.berkeley.edu,gmail.com,armlinux.org.uk,einfochips.com,google.com,dabbelt.com,davemloft.net];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:linux-kernel@vger.kernel.org,m:lizhi2@eswincomputing.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:andrew+netdev@lunn.ch,m:ningyu@eswincomputing.com,m:lee@kernel.org,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:mcoquelin.stm32@gmail.com,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pritesh.patel@einfochips.com,m:palmer@dabbelt.com,m:horms@kernel.org,m:pjw@kernel.org,m:davem@davemloft.net,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,m:krzk@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,dt,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,eswincomputing.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 94D33711537

On 7/6/26 3:21 PM, Conor Dooley wrote:
> On Mon, Jul 06, 2026 at 03:09:37PM +0200, Paolo Abeni wrote:
>> On 6/30/26 8:34 AM, lizhi2@eswincomputing.com wrote:
>>> From: Zhi Li <lizhi2@eswincomputing.com>
>>>
>>> Enable the on-board Gigabit Ethernet controller on the
>>> HiFive Premier P550 development board.
>>>
>>> This patch is included only to provide the DTS context for reviewing the
>>> binding and driver changes in this series.
>>>
>>> The upstream DTS series will be submitted separately after the binding
>>> and driver changes are finalized.
>>>
>>> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>
>>
>> @Rob, Krzysztof, Conor: I see this patch is not listed in the devicetree
>> PW, but I think it needs explicit acks from relevant SMEs. Could you
>> please have a look?
> 
> We do not typical provide tags from dts patches, but that's irrelevant
> for you, because this (and effectively all other dts) patch(es) should
> not go through the net tree to begin with.
> Instead, the platform maintainers should review and/or apply it.
> 
> Additionally, it seems the contributor's commit message suggests
> that they didn't intend this patch to be applied at all?

Thanks for the head-up.

I noticed a bit too late that part of the discussion about this patch
did not land on the netdev ML; a new revision is expected.

/P

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
