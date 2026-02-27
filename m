Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCPzNmRPoWkfsAQAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 09:01:40 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A38D1B4344
	for <lists+linux-stm32@lfdr.de>; Fri, 27 Feb 2026 09:01:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5344CC87EC5;
	Fri, 27 Feb 2026 08:01:40 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D045EC87EBE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 08:01:38 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-824a829f9bbso914916b3a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 27 Feb 2026 00:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772179297; x=1772784097;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ie2+UrGam8yuOMRgs4ibqBLJsyZZMJwKunkcFXbejKY=;
 b=A25IGhEvwHn+ZtQ6R9M6pYv6vjq8EN+l5qlpCYryvqBVhSpv5nso5UDMcsNzgepmL9
 rUs0F/axlANdf/wDBgIFStcss1GgdMelsk3G8SmQUUfrcj/Ew+clElZqBW/BkMeTBErp
 IE95L6UJTB9myGjRMn/rtoIt319Tn3uRD1RbfLod3OGwXiCgXzQNDA1YYasaNPpAXG2L
 DNVZyGFoRIsCnjAZe49hlj9+GhHHwKAj7NbxuV+RwThKcy6aVeDaouMjH90zBv/iU2eU
 Zll46GqC6JHlzAWOC8GeR7If298hOG64ftK3R2Zo8J200GTu1elg4zaDUD9WtMh70bz5
 G83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772179297; x=1772784097;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ie2+UrGam8yuOMRgs4ibqBLJsyZZMJwKunkcFXbejKY=;
 b=g8nKKiBRR2pJ7kHowOFmNc5fOZY7BOUbNrFsjIn96IaOD7PPuYgZKM1Zuk/k3P99zv
 FZwJc97z9675i5y23VBowDXRuM7O1GDUdUBtV1tXgnFiHwVOWyaUt6MG8j3yC8ewRjxh
 OD9AplM3cYnbKAnfqgrEV+yjaA0e/d5PAgp9IXaZBAVFFi6XL+4DYJiJ5Pd44nwnaKf0
 Cgc6PMlh64igdq4hLIKxBv1sOH41EQRXoLumnRzno8ZviGZnvwM3TS6S2nW8IhwYU+3h
 8N4roiecD4QvglSTTzEHVtDZhmOFOzyT4WP25x6vrjEvQ4dq62TnW9J/Wv72DxkiZdXE
 TFbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy+ubLGFMlsjcvugrlvUEBaWftUPfD9VEMazC7bkPxAj5uACY24uSmJU0BdD5GBIX6GrOMk4bqNI2eqw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwA+8jgaHD8yQhHXfkoiWNKxObNHAPhVbuaazZO1rYQHS3jCe8x
 CnVgv1X72nM34eImM1GZ3YX7ckxglEVJZ+JXDhPkT8azozb1Y5y3Ixpe
X-Gm-Gg: ATEYQzyHrEkvrefSnOVxL5qQWPA80jpzFiidR8QVt2ev/4o3GRhtkZQdbMOfORH4mQm
 yfNNcirbjNEQe5jlezl9rvESHJs/FKIoyOQRC3RAaqD8QrbfzvgXmKWknWgLOVbwKJryEY9KULY
 fWDNcbLlMrofCshVa4nehxDy6BfnI49qEaNKlADfNcTRfLaFf5aMFPnlrqB2NbefVNEamWH/j+a
 kCsZCODITokLaFkvrfvj3PULT23O/HhiVgcYBjHVDp0ktaO+lA+saqhuy873aiYYUn2eqnA85jX
 a7fyn7qVf5XFClPdNGu5ltVEd+hj/ML/iFeldP6vwKCz4yfiGzQ/Gj80Ux7rXbgzXwMbz5iEr1w
 qUmIYhdR9B7lRt4EWsov5N6c4ANSZRhsmQhH4eFIyOIyyn8NwwKi6l5P4ctmELr7+zl/0QWB0bU
 QBFneg18AqEXjNFivB2JvOpQ==
X-Received: by 2002:a05:6a20:94cf:b0:393:dc6b:a10b with SMTP id
 adf61e73a8af0-395c3b0f6e6mr2039870637.44.1772179297185; 
 Fri, 27 Feb 2026 00:01:37 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359037af175sm7729375a91.13.2026.02.27.00.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Feb 2026 00:01:36 -0800 (PST)
Date: Fri, 27 Feb 2026 16:01:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Emil Renner Berthing <emil.renner.berthing@gmail.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Inochi Amaoto <inochiama@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Quentin Schulz <quentin.schulz@cherry.de>,
 Richard Cochran <richardcochran@gmail.com>, 
 Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>,
 Yixun Lan <dlan@gentoo.org>, Zhi Li <lizhi2@eswincomputing.com>
Message-ID: <aaFOeQ0deTKVW0_N@inochi.infowork>
References: <20260130022705.1059214-1-inochiama@gmail.com>
 <CANBLGczi6o4NwDF0fge0_RZ+TVX2dQ=vYD2PYMSupb5xSnabZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANBLGczi6o4NwDF0fge0_RZ+TVX2dQ=vYD2PYMSupb5xSnabZQ@mail.gmail.com>
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Longbin Li <looong.bin@gmail.com>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v4 0/3] riscv: spacemit: Add
 ethernet support for K3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:emil.renner.berthing@gmail.com,m:rmk+kernel@armlinux.org.uk,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:alexandre.torgue@foss.st.com,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:wens@kernel.org,m:conor+dt@kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:peppe.cavallaro@st.com,m:inochiama@gmail.com,m:kuba@kernel.org,m:joabreu@synopsys.com,m:krzk+dt@kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:maxime.chevallier@bootlin.com,m:mcoquelin.stm32@gmail.com,m:palmer@dabbelt.com,m:pabeni@redhat.com,m:pjw@kernel.org,m:quentin.schulz@cherry.de,m:richardcochran@gmail.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:siyanteng@cqsoftware.com.cn,m:ziyao@disroot.org,m:dlan@gentoo.org,m:lizhi2@eswincomputing.com,m:devicetree@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:looong.bin@gmail.com,m:linux-riscv@lists.infradead.org,m:spacemit@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@list
 s.infradead.org,m:emilrennerberthing@gmail.com,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:conor@kernel.org,m:krzk@kernel.org,m:mcoquelinstm32@gmail.com,m:looongbin@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,armlinux.org.uk,eecs.berkeley.edu,ghiti.fr,foss.st.com,lunn.ch,altera.com,kernel.org,davemloft.net,google.com,st.com,synopsys.com,bp.renesas.com,bootlin.com,dabbelt.com,redhat.com,cherry.de,eswincomputing.com,cqsoftware.com.cn,disroot.org,gentoo.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.924];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.infradead.org,lists.linux.dev,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,kernel,netdev,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 8A38D1B4344
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 10:00:29AM -0600, Emil Renner Berthing wrote:
> Quoting Inochi Amaoto (2026-01-30 03:27:01)
> > Add initial support for ethernet controller of the Spacemit K3 SoC.
> > This ethernet controller is almost a standard Synopsys DesignWare
> > MAC (version 5.40a). This controller require a syscon device to
> > configure some basic features, like interface type and internal delay.
> 
> Hi Inochi,
> 
> Do you have a tree that includes the dt entries?
> Otherwise how are we going to test this?
> 

Yes, I have one, but it is not opened as I was requested.
I will send the DTS patch, once the clock, gpio, and pinctrl
device is available. At least for now, I had no way to post
my DTS patch.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
