Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LW4MsHIsmmvPAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 15:08:01 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 523DA273161
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Mar 2026 15:08:01 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E7F1CC8F28F;
	Thu, 12 Mar 2026 14:08:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 40482C8F28E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 14:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773324476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Khzpn5Mx56KvyAQlDdussK+xDM01SpYAZGq0vABXvB8=;
 b=aTQ01aerEtrLK+dIsbE0bgU/SMXO9ia21R9ctuPH87qqWNfUIPEl5WQyCOWk+PLJSLY9DQ
 YylMqCxuakkSwDL5gFurFv/WwMBHqX+lUnxiVHhf/ZIvlezjIIfShVgsgeeBijyrvsG5sm
 zO1Penrp1eF0qMbBEZ0GOLa75a/oNaw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-OMXDZjf6Os-b9mOq6Yf3vg-1; Thu, 12 Mar 2026 10:07:55 -0400
X-MC-Unique: OMXDZjf6Os-b9mOq6Yf3vg-1
X-Mimecast-MFC-AGG-ID: OMXDZjf6Os-b9mOq6Yf3vg_1773324473
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-485345e2fdfso5426575e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Mar 2026 07:07:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773324473; x=1773929273;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Khzpn5Mx56KvyAQlDdussK+xDM01SpYAZGq0vABXvB8=;
 b=tEp6GdZbgS7NDECwaVVVEmBKk6T6OudNhrlODbuvGlvmaC05W+oabM6nJ/A338c9c9
 AM24iua5K1eptvxkUQ3DWyehCQMsFFyw6aeHZx3cCdKP7BgvsH+iYGNhF2smy4grjrrJ
 /d8gTAHM/lhjlQ4qLag9Lmybq/2kb8gcAAhS89gX+MvcOGBJMoV2p3zgR1dozUfV7dy3
 fU/RwhAfRLl1zz0S2LINEZS21rc5y15BtTqHeNzQ/tpH07SoZ33XG2DYmi6nimaekjP1
 gNYOCo5sUtXXf+WN5HJcCapVFEsxdxlVL0ssfrl3aENT8aV8RvD/IkCmoR+PejqIMR41
 A0pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVSuA44xxG6QJC6ruojjWG5x9EH55YwElmWmYh79VQNuirW/+z2edW5J+BckjKlqysC/RuTmLsRZCbNw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwUrp2CSjZKwMTg4h+Fx+kA+qFWJCme/gLk2MUL6wmaAU/AGDUn
 ptCQhmdmq+KrYqfsr5hp94NXwGA07qMt295KP3HJ60TjALU/NBfFQsvJgSW8aqjt0kCX0W9Gce0
 Dsf006LHRLjOif8ZLoloh4mUJtzdflowreMT61Qaobkh1oN/Er9nAgPlXmvVsZWpoJlvMHAqQwA
 5ii7GK6w==
X-Gm-Gg: ATEYQzyL+bmWuDszpzJ5fxQQbR1zHmOyp1g0aBIC7FEkoEeDdxkoVKLKwxDmdZE3MGY
 bZgUg3rqw68pEoVT9BvWzbf6AwMoOuNDgk9B2LWiLMc4tTrfzA2SZFPpC97FpYc1f5KqFwG3/HX
 UFBM7dzV1kRk7lfrSH4xYHTpcD+vOZv8nH+g3iZ6NA7D36m6ZGqLFf54UsYJk2qs49xWNREuaFQ
 RbMuUARDvRYZpQZQDcz7TLyGd+d45rlYwE28o/dMalOcJNJfrwz8pRNGremhRMQSlJ0pz1dkRVj
 84bvqrRlan93bw+VQ1NciRURflz6Xiwg/NheHjOxAiddj4G3myzAIvz2RiTMJk0p8tOzK2J6wpy
 6CiUM91/tfv+XdbyG8gGCGS/UV/MrAOkUepUNft4uJmkEduC0U8i6F5g=
X-Received: by 2002:a05:600c:8b0a:b0:485:3ae8:2236 with SMTP id
 5b1f17b1804b1-4854b123cd6mr107431195e9.32.1773324473110; 
 Thu, 12 Mar 2026 07:07:53 -0700 (PDT)
X-Received: by 2002:a05:600c:8b0a:b0:485:3ae8:2236 with SMTP id
 5b1f17b1804b1-4854b123cd6mr107430595e9.32.1773324472680; 
 Thu, 12 Mar 2026 07:07:52 -0700 (PDT)
Received: from [192.168.88.32] ([216.128.11.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854b6756e4sm154581925e9.15.2026.03.12.07.07.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 07:07:52 -0700 (PDT)
Message-ID: <09528d3a-e08a-4942-aff7-b59610f6b13e@redhat.com>
Date: Thu, 12 Mar 2026 15:07:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: david.laight.linux@gmail.com, Johannes Zink <j.zink@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Bartosz Golaszewski <brgl@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Richard Cochran <richardcochran@gmail.com>
References: <20260310140155.3359-1-david.laight.linux@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260310140155.3359-1-david.laight.linux@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eHPIdepqeYqeJTbE3HuKqI6icG7OxS6UHZIunlW8Idg_1773324473
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Subject: Re: [Linux-stm32] [PATCH resend net-next 1/1] net: stmmac: actually
 error requests to change the auxiliary snapshot capture channel
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
X-Spamd-Result: default: False [4.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david.laight.linux@gmail.com,m:j.zink@pengutronix.de,m:alexandre.torgue@foss.st.com,m:alexis.lothore@bootlin.com,m:andrew+netdev@lunn.ch,m:brgl@kernel.org,m:wens@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:gatien.chevallier@foss.st.com,m:kuba@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:maxime.chevallier@bootlin.com,m:mcoquelin.stm32@gmail.com,m:netdev@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:richardcochran@gmail.com,m:davidlaightlinux@gmail.com,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,foss.st.com,bootlin.com,lunn.ch,kernel.org,davemloft.net,google.com,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,armlinux.org.uk];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[redhat.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.779];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 523DA273161
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/10/26 3:01 PM, david.laight.linux@gmail.com wrote:
> From: David Laight <david.laight.linux@gmail.com>
> 
> Commit 2ddd05d1d5ed ("net: stmmac: do not silently change auxiliary snapshot capture channel")
> added code that attempted to return -EBUSY to a PTP_CLK_REQ_EXTTS
> request whan a snapshot was already enabled.
> However it tested bits in 'acr_value' after they had been masked off
> so the check would never return an error.
> 
> Change the code so that the test actually works.
> Note that when the commit message says:
>     Previously in case of a PTP_CLK_REQ_EXTTS request, previously active
>     auxiliary snapshot capture channels were silently dropped and the new
>     channel was activated.
> this only refers to two commits earlier (a few minutes earlier).
> Prior to that only a single fixed snapshot channel could be enabled.
> 
> Note that the check will reject requests to re-enable the currently
> enabled channel.
> Plausibly the best fix is just to delete the check completely.

I agree with this last statement. Enforcing the check could potentially
break the user-space.

/P

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
