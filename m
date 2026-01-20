Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFDaLEcCcGmUUgAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 23:31:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFBF4D005
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 23:31:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F04B6C349C4;
	Tue, 20 Jan 2026 22:31:34 +0000 (UTC)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 30DECC36B3C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 22:31:34 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-2b0ea1edf11so11111608eec.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 14:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768948292; x=1769553092;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oK1Xva04K7ygLWg0U7fdlOWooXBJszh65DA1fNcqFD8=;
 b=QSuyo0E99v206H2bh9pINWhXhu88/ArvXA9uaB0jBee7x+vLSjevAI+3DikKT8gKMM
 1PTZXhBMWQxxxWrMuWjq0nKHHIB/s6X6OThKyyLJsq/tMdaNuGRiNWeh56/FSndK3Y2d
 BkzLiS6ONPmT53a/Wo3aRADYyJ0b9iddciX1GIQREqOePkdoLeqs3amBRnI5SoIleKZ7
 dY8RcFlHJu6WJqySkRaqUq92gY+8bRVhd9K1TaG8NLmhBboEPCXZdjV7Lj7dxFNJ62fT
 tc5NBXO6G76toTixq86skiWUnN/BYHoRVMlKk6yCztOAoP1elVlPG8N9rgSA8n2Wkipx
 D34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768948292; x=1769553092;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oK1Xva04K7ygLWg0U7fdlOWooXBJszh65DA1fNcqFD8=;
 b=ZBGWZ1UeYZDnDpykETxZg397kVbvbNs9ZDeOdnYo5G2EJYAr6t9gR4hsify0p3LYGn
 tystY05tvtkfvzqVf8+WNZQ/BZYyvJ49neKHg5l6oGaFd3p6iO4pCK6KPcxiazfRH3NC
 7PNgWszee3ncVYhGA+sENeJyCrtp+goy0sLJnMrP1nfv430cDAjRhyNzcMQRDQnON4/S
 WgjwdMSU3iy65qsssSVTCMS5Y4pf5963rqqd11rwM0W1e4kKB/lF1VI+T6dWT2yMEkww
 wavV6aOX2uXu25Sgg5m5J3agIRhJyRlddEvqLkV7O5FPkzNPTaVwaU9FUBfGFwvmZkHI
 Oqbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvtifgYwZzpLecwzW7quuiqEs9Ak7wpXAd9+HBNevTnmyNCE3xOZttD+qRTlzggoJwUWBZlg7avyQFmw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yym9pi77QMHpbBOMBZY9X90Rqyv1ooLkWmlNKJHcW+eFQQ+W0G8
 KFAJLPJcaNDQyAb9mE2DGfNidxDC1EqaNh+/+7t+QgqnQA3GeJu3Tmft
X-Gm-Gg: AZuq6aICLRxmnuJJmWXLhRjA6Jl2JOFq1eJrM6mKllODTB/tIH6x1F5zixRjaNmsKx1
 4t7eqXfu26edk/G5NrSZERF4GcKWFaiNMl5s4MumxpYZlUmSSPMrvu5gl8OqRnQedHMja67j931
 wFvoKekqFJW6VK9gVetwlmjryyQNiR2ol4JYxFmwabAdpbRCaUOx5PdUJvdhrTMsFOEj19Mp7vg
 cT08q1sckVqhzzsTNh3Kq1h6jA0Mq1A6ZxLWFmV0ywBdVdVTJIRrFSez+9kM19ilquPyZcAAUlP
 MgJV74yk52o2BjEzkRK0S39g7XQi6/Wg38G/lFCl2BRL9o+dsvIcIcEXnZBpQtPh8TSxvdBtEB9
 R8g1i+inD9sQ5XLiYBGWKph/08etOL23jigLwwHDjLXsvwsay7W75gLnK1TbIZLzl1ig7HWClKh
 HjwLSSV1fz/RM4J4P43QRR
X-Received: by 2002:a05:7300:1493:b0:2ae:5a55:fc0a with SMTP id
 5a478bee46e88-2b6b4e287acmr16477739eec.7.1768948292340; 
 Tue, 20 Jan 2026 14:31:32 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b712881482sm499886eec.5.2026.01.20.14.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 14:31:32 -0800 (PST)
Date: Wed, 21 Jan 2026 06:31:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <aXABw0zVz8n3jLlm@inochi.infowork>
References: <20260120043609.910302-1-inochiama@gmail.com>
 <20260120043609.910302-2-inochiama@gmail.com>
 <aW9fL7r0AM0flALJ@pie> <aW9ou-lsQQ5dVzqW@inochi.infowork>
 <9334905d-d11b-49d4-92b1-61e8cf644f0f@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9334905d-d11b-49d4-92b1-61e8cf644f0f@lunn.ch>
Cc: Yao Zi <me@ziyao.cc>, Longbin Li <looong.bin@gmail.com>,
 Eric Dumazet <edumazet@google.com>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Yanteng Si <siyanteng@cqsoftware.com.cn>,
 Jose Abreu <joabreu@synopsys.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Yao Zi <ziyao@disroot.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>,
 spacemit@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Palmer Dabbelt <palmer@dabbelt.com>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Paul Walmsley <pjw@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next 1/3] dt-bindings: net: Add
 support for Spacemit K3 dwmac
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
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:inochiama@gmail.com,m:me@ziyao.cc,m:looong.bin@gmail.com,m:edumazet@google.com,m:linux-riscv@lists.infradead.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:weishangjuan@eswincomputing.com,m:alex@ghiti.fr,m:siyanteng@cqsoftware.com.cn,m:joabreu@synopsys.com,m:vladimir.oltean@nxp.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:aou@eecs.berkeley.edu,m:ziyao@disroot.org,m:richardcochran@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:rmk+kernel@armlinux.org.uk,m:yong.liang.choong@linux.intel.com,m:peppe.cavallaro@st.com,m:wens@kernel.org,m:spacemit@lists.linux.dev,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:dlan@gentoo.org,m:netdev@vger.kernel.org,m:quentin.schulz@cherry.de,m:linux-kernel@vger.kernel.org,m:andrew+netdev@lunn.ch,m:palmer@dabbelt.com,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:pjw@kernel.org,m:davem@davemloft.net,m:looongbin@gma
 il.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:krzk@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ziyao.cc,gmail.com,google.com,lists.infradead.org,st-md-mailman.stormreply.com,kernel.org,eswincomputing.com,ghiti.fr,cqsoftware.com.cn,synopsys.com,nxp.com,redhat.com,vger.kernel.org,eecs.berkeley.edu,disroot.org,bp.renesas.com,armlinux.org.uk,linux.intel.com,st.com,lists.linux.dev,gentoo.org,cherry.de,lunn.ch,dabbelt.com,altera.com,davemloft.net];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[inochiama@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url]
X-Rspamd-Queue-Id: 4CFBF4D005
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:48:12PM +0100, Andrew Lunn wrote:
> > IIRC, the "phy" clock is used to pass the phy from the mac core, I will
> > double check if it is possible to connect to the phy directly.
> 
> Are you saying this is the reference clock output from the MAC being
> fed to the PHY? That would be a clock provider, not a clock consumer.
> 
> Or is it the reference clock output from the PHY going to the MAC?
> Then the MAC would be a consumer.
> 
> And there are some designs which have a third party generate the
> clock, and both the MAC and the PHY consume it.
> 

I have confirmed the clock is directly from the the clock tree and
is consumed only by the PHY. It seems like I have got a wrong
information about this. So let's remove it and let the phy consume
the clock if it use this clock.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
