Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bYrtHxupS2p1YAEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:09:47 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1874E7110F2
	for <lists+linux-stm32@lfdr.de>; Mon, 06 Jul 2026 15:09:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=redhat.com header.s=mimecast20190719 header.b="Pz/8Vo6r";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=redhat.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D5F78C8F271;
	Mon,  6 Jul 2026 13:09:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3AC13C7A835
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jul 2026 13:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783343384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUHCisuScEtc1kpgEniw1SQHEHnjG8D0qhIWEGCMudA=;
 b=Pz/8Vo6rDnLyvAaMWe2b7mQwsltpk+qoOKSbGNII57Aw+9UOiP82NMDS5eThTEX43fjmkm
 LfwXeSTnkw0Y5pOtNzP8MVq5rUYOEzeYEpqT+vM/RvAuLFZnh7NANS8UFNzzBQHrNb/ndo
 5roTgCn3WSWFxfPvDurl5UM+zUdxq6U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-wdHBDn4hPX2ajXndgy3M_Q-1; Mon, 06 Jul 2026 09:09:43 -0400
X-MC-Unique: wdHBDn4hPX2ajXndgy3M_Q-1
X-Mimecast-MFC-AGG-ID: wdHBDn4hPX2ajXndgy3M_Q_1783343382
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-493ce4b7777so20716415e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 06 Jul 2026 06:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783343381; x=1783948181;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tUHCisuScEtc1kpgEniw1SQHEHnjG8D0qhIWEGCMudA=;
 b=EfxFHt4XbanX3pZGO8X/qT5S5QpxmOgbVb9o37erzcTIRnidpSip7SN3TomByqthyK
 kY9hTkvwLVoMOSTJyQtk0CTXaBAWpSi5f6WTKfB59YP9za4vY449ZoyuAUMvt7xU7Zwj
 XXOuBwY6uyciC7WFVsnf/MwJbI7H5ZZP/CdW6rB7VB8xEuBscTaAyShnpjvPb3zyDZks
 OIL/GA6NDrUL888IcxiRKjc8tU2sW9HaRWagMyxYbE4UhLPKVWX+43Po7rAq0NJcn0ts
 0BcP3bOiwv4anGCro1SCoRo0mv6cyHC7Fjzl3vTGEEYxFGdawNRopT9ulaABNdX6wcj9
 rOLw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpajkSN/HMUJY55DtHajhvNzr1wXHb0j7eR2XyiUO/xXIifPJjhjDxgDQijZGwmZb+zxvtr1HsuQW1iwA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzCe1JDu6T2l3um8k+x8QbqXwzDlwgk5diFVixcKSsHu0etVMUT
 3h816QYhMsCDOLTIMGrzhKR8PVUgHkrUkSeoBA2EzQ0BCVK2iGoj81QdnXfZPk3KSCZiDYyV1tM
 6U5XKi6CDlE/gjsJSMNmncLonpopM/IgThGP3vrkTsmD7HnIHH3v8dw6okbtn0A7H0v2wEA3t8B
 ghxAEQtA==
X-Gm-Gg: AfdE7cnUnETLELKnWVOSLGMcGHf+WfImsdd3gSxFuzl3cQV+N89xWz0wLcRSq7M/HJb
 hEkDboxUga+i6qYVM55hXYTmKRE8xmaYZkz3SLPfe9sWMwwVnNM7g+hA3+7Jvw9zawtQBy8Pe0g
 GZudhIh3D5ltbSbJNTOlPUirgGfR8ITW8N84gZRvSMG6Nt0TKRhtZuYBfkgNKsCJQzhJmPdV5Up
 um+A68rYj9aXWjdsdUeesxn1YzxPFwiwstvSLcb6rYv+hGr9MaZS3/YLCKWn6UL7gt47digt5Rh
 XVfnJZK2hw6O8LAm4+qlXiKWp4B9sBm9Qm6jN0m1QgRlQSFAbjTKvtJ9REmWJ7nJBqdund0XmEG
 iWrgOcdcbtaRFxo+qhC7pIP1jVBZOh9VKkkcuAJYRPN1J2J5hSOPK89q1/+oQJHIZoker5JZfxQ
 yCYE83ZS0kpggn
X-Received: by 2002:a05:600c:3f16:b0:492:454c:347c with SMTP id
 5b1f17b1804b1-493df066413mr4850675e9.7.1783343381365; 
 Mon, 06 Jul 2026 06:09:41 -0700 (PDT)
X-Received: by 2002:a05:600c:3f16:b0:492:454c:347c with SMTP id
 5b1f17b1804b1-493df066413mr4850375e9.7.1783343380895; 
 Mon, 06 Jul 2026 06:09:40 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:58fd:68f:7756:389d?
 ([2a0d:3344:5521:6b10:58fd:68f:7756:389d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47ad69519c2sm25839803f8f.37.2026.07.06.06.09.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jul 2026 06:09:40 -0700 (PDT)
Message-ID: <8e5eb97d-dfaf-47a1-8572-b3252a2c7ed3@redhat.com>
Date: Mon, 6 Jul 2026 15:09:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260630063445.1226-1-lizhi2@eswincomputing.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bHvp50heerBqxqHKV3EZpGf25YpdkUzTg1KO298l4Ng_1783343382
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, edumazet@google.com,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 weishangjuan@eswincomputing.com, alex@ghiti.fr, andrew+netdev@lunn.ch,
 ningyu@eswincomputing.com, lee@kernel.org, maxime.chevallier@bootlin.com,
 kuba@kernel.org, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 mcoquelin.stm32@gmail.com, rmk+kernel@armlinux.org.uk, wens@kernel.org,
 linux-arm-kernel@lists.infradead.org, pinkesh.vaghela@einfochips.com,
 linmin@eswincomputing.com, netdev@vger.kernel.org, lizhi2@eswincomputing.com,
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
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,google.com,lists.infradead.org,st-md-mailman.stormreply.com,eswincomputing.com,ghiti.fr,lunn.ch,kernel.org,bootlin.com,eecs.berkeley.edu,gmail.com,armlinux.org.uk,einfochips.com,dabbelt.com,davemloft.net];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:andrew+netdev@lunn.ch,m:ningyu@eswincomputing.com,m:lee@kernel.org,m:maxime.chevallier@bootlin.com,m:kuba@kernel.org,m:devicetree@vger.kernel.org,m:aou@eecs.berkeley.edu,m:mcoquelin.stm32@gmail.com,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:pinkesh.vaghela@einfochips.com,m:linmin@eswincomputing.com,m:netdev@vger.kernel.org,m:lizhi2@eswincomputing.com,m:pritesh.patel@einfochips.com,m:palmer@dabbelt.com,m:horms@kernel.org,m:pjw@kernel.org,m:davem@davemloft.net,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1874E7110F2

On 6/30/26 8:34 AM, lizhi2@eswincomputing.com wrote:
> From: Zhi Li <lizhi2@eswincomputing.com>
> 
> Enable the on-board Gigabit Ethernet controller on the
> HiFive Premier P550 development board.
> 
> This patch is included only to provide the DTS context for reviewing the
> binding and driver changes in this series.
> 
> The upstream DTS series will be submitted separately after the binding
> and driver changes are finalized.
> 
> Signed-off-by: Zhi Li <lizhi2@eswincomputing.com>

@Rob, Krzysztof, Conor: I see this patch is not listed in the devicetree
PW, but I think it needs explicit acks from relevant SMEs. Could you
please have a look?

Thanks!

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
