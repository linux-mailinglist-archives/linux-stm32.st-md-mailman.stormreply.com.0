Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEgCEN0e+mkJJgMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 18:46:21 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E514D1970
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 18:46:20 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 129E6C87ED0;
	Tue,  5 May 2026 16:46:20 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 95E8DC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2026 16:46:18 +0000 (UTC)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-7982c3b7da9so51276087b3.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 May 2026 09:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777999577; x=1778604377;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B6Uy1BACyCfz4bGQoQ3uC1bOjVbvH4IGR3oICdNZrGU=;
 b=il8VX2kgTSfilKGE6K8cc/ZO6OVjFyCaasm6bYkL6CoS7DU6za+HcrcSKKzK66wacj
 9pec5baFQOXqPiHXqDAyclvTJkfACtp5O69tl18kTSW3z9+UkAU7UHQQP/QqPd04fOs5
 dh8sABFytORP5SS5CHAEHaV/ojWLvalXr3nlApnTzxD8+vbCeSEoEqdmQnBDYaBrgM7t
 MKZbmD/hfPO+U75Cez3465rr7WT9tbNEXBZ9izEhj7SYrTzTndf2WUwfSKDfMkctEkfl
 XcvKLQxQi6QsCZwO0gmUiE/bUKHUuNalI/kPiTLdRfeIVP2fH5S5H+bj9wB/pCmdHvHK
 2CoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777999577; x=1778604377;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B6Uy1BACyCfz4bGQoQ3uC1bOjVbvH4IGR3oICdNZrGU=;
 b=TGWS6CY+G8FZnMpMyR0dz08z5NHzlK7ujtm25ezR2MO8iTuETjbZ8q6iUxty/3oyzZ
 ket8SD2OtaW4WXhu1dp3Mo1hwGo37CsKErJkBw5CN0Y8g40OuTB8HNEhXUpZUYvW8lC8
 zw8+OrT5w82+Z0/sZINdEBwUnuwQQ3R+cIhUGinGrNIjjGFdiDIGnDA4nl8tlymbSREZ
 zwC3gzl0e5qqTMpdiXMy4ksDMSNaBouZZDeTwEY6eUt/JUZl1VYTqo8+EVMct5czNr2i
 sfZOOmorW+CJnjS/nmKMS2s4tA9fZYioS2S4WBh2wwyWMwYz0e3VdJ1YTvBB2jQAqsHg
 4C6A==
X-Forwarded-Encrypted: i=1;
 AFNElJ83lXdTo9KF7FSMxMpzcDe9niaBZU0YTYqYy0M5EJugPzeJz7c+fbjgMSraLpUsioguNZqRNanADOp+dg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw7TwpvMsfD4IV7BWn6ZNuJeXv/KhrkPXrMN9iV+I92NBhgxhEJ
 aovHvA9PZHifqKMLAjEfzbYDv9WYRCqGh4tXXJZtVKahVsQ5jL2tWyF1gmiq4s4Bl3k=
X-Gm-Gg: AeBDievOrrjBxbqxjVEok7IYYUFr4si5iJ6Sj+Z6Wkocm88bSNc3jPt4cKu+bzR3tWj
 /K7inNx98vnRZigF/myLJsLz/jQhsuu2i1BLyRwHqnzYw6V1OfXkwEw0vxe8hlRQwQ59tw1ngWd
 SB4J8IlHLjiG1KsT/G+++/W1tz1fprsykg6pqMBdbxvXbDFtmBHn4rZZ3sek+rtdWrp5WTC+7yY
 8H8zHBZrf6Y+ZZ+T+w9qQv7G8yKD8byPOdbJ3u514uZ1ruVhv0nlqMxpWEDwAFITEGzYhXu4Ppe
 pyv1JpBoBJf3TPWZS88BoRQaPq6rHpPiyJKWOw65gxDuRIQxQbKfnu+8Ixb1RNl2jAzwQ2FroN4
 wSuIqZmVj8zZJrP+Bf5i0b58oCBpF0nZENRyYvkOXsgu8CrKlk6n+CVp4kQoylljBxik7j30s69
 QgjUIpy3++JJvB6qXJg1QRFjsPo3c0SRffAlVGhh+rnjZaEXfFCzxN2/MuRoJRt4Quzt9O5WPIP
 Q==
X-Received: by 2002:a05:690c:e094:b0:79b:e346:fcfb with SMTP id
 00721157ae682-7bd770df5b9mr144294337b3.32.1777999577197; 
 Tue, 05 May 2026 09:46:17 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net.
 [75.72.117.212]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7bd6656542bsm66872617b3.20.2026.05.05.09.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 09:46:16 -0700 (PDT)
Message-ID: <e582f6ef-aa4d-4d7b-9d4d-7ea0445d42fd@riscstar.com>
Date: Tue, 5 May 2026 11:46:13 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <afodG9uuopgfvSmu@oss.qualcomm.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <afodG9uuopgfvSmu@oss.qualcomm.com>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 weishangjuan@eswincomputing.com, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 10/12] net: stmmac: tc956x: add
 TC956x/QPS615 support
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
X-Rspamd-Queue-Id: D0E514D1970
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mohd.anwar@oss.qualcomm.com,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:daniel@riscstar.com,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069@gmail.com,m:dav
 em@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[48];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,riscstar.com,xiaomi.com,google.com,st-md-mailman.stormreply.com,eswincomputing.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[elder@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.670];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,riscstar.com:mid,stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

On 5/5/26 11:38 AM, Mohd Ayaan Anwar wrote:
> Hi Alex,
> On Fri, May 01, 2026 at 10:54:18AM -0500, Alex Elder wrote:
> 
>> +	/*
>> +	 * TX956x has 8 TX queues but only #0 to #3 work for general IP traffic.
> 
> Minor typo in the comment: I think you meant TC956X instead of TX956X?

Yes, I'll fix that.

>> +	for (i = 0; i < td->plat->rx_queues_to_use; i++) {
>> +		res->rx_irq[i] = irq_create_mapping(irq_domain, HWIRQ_RX0 + i);
>> +		if (!res->tx_irq[i])
> 
> Typo: res->rx_irq instead of res->tx_irq.

Wow, that's important...  Fortunately we haven't been getting errors.

This will be fixed.

> PS: I was able to successfully test this series out on a Rb3Gen2 board.

Great!  Thank you.

					-Alex

> 	Ayaan

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
