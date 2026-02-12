Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IFeLfBkjWkn2AAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 06:28:16 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E68B12A694
	for <lists+linux-stm32@lfdr.de>; Thu, 12 Feb 2026 06:28:16 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D2CDCC87ECC;
	Thu, 12 Feb 2026 05:28:15 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 88DC9C87EBE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 12 Feb 2026 05:28:13 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-823c56765fdso1541980b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 11 Feb 2026 21:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770874092; x=1771478892;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KAvHmXBR6Z1t7fykOb+Q8OlteilYCII3PJTMYzVRo6g=;
 b=l9vBDCpb5lVb6ySpryYAw1SUuDmxteKDhT+sUBLro4tGNNVAYe83WKbDRy+Ur5kJw7
 b+IRU/LS3V+yx5pE/3tY6AyUSInrsPnFEEE496W3Rjmi5Rm148Nlb2MrTy0KVzka/VsW
 Flkw6LSfqdaIBhHp3E0ZX1Pv5bHVYP+qjqYMIIDhyviRGKvA488XCaDi4e8ydH/RD4si
 YrQlEuU+RUkvOorFZR1h6yypy1A9hEbWw9pEl5uC3+U9s//shrO03HtNUa93D05FdY8f
 pCmW1nW1a21Ou896uh1QcitKr9LZB3iY1vnaDGAWXg5DwS+NBH4XbAJ7KWf55m/rM3RJ
 7Iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770874092; x=1771478892;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KAvHmXBR6Z1t7fykOb+Q8OlteilYCII3PJTMYzVRo6g=;
 b=jeeiQBZiiTMBYn7SZPbZMYgiYiNPklVzoOvVodUwP5iUWHFB8rdvZYusfgTZ6afBI1
 2Uye5maltY/U6niA7+6nV/AyarBPsIZTWfUhW1sjH+7LETK5HsVA9A4+gpNjSp6BlzoE
 H3Vmwcpe2MLfIdz8xpKXNLHc4ohnmTQVw9/WaWWjT610vhbkre0XKPz+M8S9SG5xJAGO
 FjvCT9zcUGqfwznE5jtRttkgzs/xMJj/2HCdo221Gg7V9Po6Ulwb0etgliKy6KOElaPF
 Cv2iS5mCtn5pCJYyiTVGjjeKUhV7mWmIY+fUFvABxCE7yx46tugn6oJUUajz/1aKKwuz
 QkNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1OY5ffv9qICBrtmkaD4wGjcpOFPFdEZD6NvWxZPnBa3dAwOFO0jlrFZ4FMBkh7WqRqtmnuYNQ76wbyg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyUJ+KZ+ti9kwRg68xZ3Rr5yOLUzJUJTYG1Tf//9nLFz//T4K45
 /JVgLQlJr89zJUNPr3yPnpFj5PI726DKIx7lr0Xl7KNgu5Wm5kO3zHtO
X-Gm-Gg: AZuq6aJhx6AGwym0BLqLuC5ls6cXBvoLI0TV4nlPV2FrQD3v820VnBd6QU7GeWmLNIg
 1el3N03xf0PdAJkucTuBolXQGJ1nrCJzAUIGLJPJhPN+MYaL94b1aqYdtfdZaDtDUZJp6eJnWwm
 IMBKKotnRDoN3akr8GiUOjDsOP16QGjXoGDVL7f91qPHSolj9CNAexdhzkLehkE1evyZZHJaB7u
 ktPSNNxoJ53Shl7biwsOef0d3g2ORF/SWLhut7ps32af8Dq1B1Miu5HTOVleTwSSXlBS8uxGZ/T
 HyeYxBKYq5vo76J8xsR7EP7mNRvKtGkjHVzcAMYbS9tJWdmkrFEf2esutrsasD8f0ARTJy4X58u
 vCFyOsJelszVEcH0VoJFKlWtQlb8vf/WY5VN+HgPXRabBHlQqTV0jNaPE1hKl0kMCcc5jWvkCFm
 stOiON5D6YHQI6LZcnHi2bytzyKFyiRgix+RlxIv+kkH7S2RyxjTzcv19A2Mjlv3JpNf38K8bap
 P9G
X-Received: by 2002:a05:6a00:92a6:b0:824:4a22:ec02 with SMTP id
 d2e1a72fcca58-824b3042b8bmr1089776b3a.42.1770874091996; 
 Wed, 11 Feb 2026 21:28:11 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net.
 [60.250.196.139]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8249e368d0asm4119668b3a.11.2026.02.11.21.28.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 21:28:11 -0800 (PST)
Message-ID: <532078ce-f02e-424f-8382-2b52438a657a@gmail.com>
Date: Thu, 12 Feb 2026 13:28:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20260210052226.3005666-1-a0987203069@gmail.com>
 <20260210052226.3005666-4-a0987203069@gmail.com>
 <aYsurPBMnzWDZCco@shell.armlinux.org.uk>
 <747b9ab4-6711-426d-95a5-4ce6c8732edd@gmail.com>
 <aYxYRZZkVFz2jHaF@shell.armlinux.org.uk>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <aYxYRZZkVFz2jHaF@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, ychuang3@nuvoton.com, edumazet@google.com,
 schung@nuvoton.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 openbmc@lists.ozlabs.org, joabreu@synopsys.com, kuba@kernel.org,
 pabeni@redhat.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 richardcochran@gmail.com, peppe.cavallaro@st.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com,
 krzk+dt@kernel.org, davem@davemloft.net
Subject: Re: [Linux-stm32] [PATCH net-next v12 3/3] net: stmmac:
 dwmac-nuvoton: Add dwmac glue for Nuvoton MA35 family
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:ychuang3@nuvoton.com,m:edumazet@google.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:openbmc@lists.ozlabs.org,m:joabreu@synopsys.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:mcoquelin.stm32@gmail.com,m:krzk+dt@kernel.org,m:davem@davemloft.net,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,nuvoton.com,google.com,st-md-mailman.stormreply.com,kernel.org,lists.ozlabs.org,synopsys.com,redhat.com,vger.kernel.org,gmail.com,st.com,lists.infradead.org,davemloft.net];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 3E68B12A694
X-Rspamd-Action: no action


On 2/11/2026 6:21 PM, Russell King (Oracle) wrote:
> On Wed, Feb 11, 2026 at 05:52:21PM +0800, Joey Lu wrote:
>>> Is this register preserved over suspend/resume ?
>> It is not preserved by the GMAC suspend/resume flow and therefore needs to
>> be treated as a system register rather than a GMAC local context.
> That is another reason to use .set_phy_intf_sel as that will be called
> just before GMAC soft-reset in the .ndo_open() and resume paths.
Got it! Thank you for clarifying.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
