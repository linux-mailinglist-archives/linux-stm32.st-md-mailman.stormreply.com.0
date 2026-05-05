Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC+WGf8Z+mlYJQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 18:25:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3ED4D13BF
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 18:25:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 89C93C87ED0;
	Tue,  5 May 2026 16:25:34 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 22DD3C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2026 16:25:33 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-488b0046078so47531645e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 May 2026 09:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777998332; x=1778603132;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=dvgEgjFlnhgVavTSLAwA8kue6OnY1fSQmcbYOk/Oxj8=;
 b=sTrpymC5POtsumY8sTxvgSieBZmOXgO3/cHdNOTXgu9mSq4ANtBnw4LBdnVjYTKy6W
 X4y9NooxeAikXYk61BeNGv75b5C5uQyWpauZ1uHtYe8uwFjifxRkbLa7XYnEnFcOgYaT
 2DHo1zqBlA+v15BvjN6ymWMe48C2iaBZ3IIa/bJoU1k+BViD2qecP1lHjQwJJxK6jYti
 6VBdWlhseRe+x6r2kBcPhmj1CU/9vWjAqyuaYTcyXA4jemroG+0S8GkBwyQxqVrV8omn
 q1DhMroTY4xvp4yPwv2cQRW4vKlY5mITkWOymKutT+TJmaNDh5C0Ds0q7FT10Z+qM6OM
 zS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777998332; x=1778603132;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dvgEgjFlnhgVavTSLAwA8kue6OnY1fSQmcbYOk/Oxj8=;
 b=olM5ONQuqSuG4duMT/rPgZjgwnkM2eKEwwaZtPqnT4U6uTuggjM36sAASSmBYRzZIr
 FDPKRKRGUhsYNZ4deVuc6scr+AH0L0j8NwN5d24pJG5LrcXfLWhcQIS+dHN/zZfweyPa
 iLIGQin0ZCFwzG1/AZ8G/1xWpPc+Ja3Jgu3+PeOp61W1eA0goBcvsmHnW1LKrK7mnHqS
 L7+O1/kseLZzzDff7OerrHM/n9c0+sItHit0VkqxgNPGS4tJf5iHA7mLyY+/jtE+MLXx
 vfViwUK97PP0Q1VVdhUu1jGcOoSC4yxpzoAEtzaFZeVCb0cjnO2T7uIBM+4awcb2gKQ7
 LTvw==
X-Forwarded-Encrypted: i=1;
 AFNElJ85XBgDyYMUk/kzXcSTDHc0kgQISDHBmb/OP0UmSVlEh3lZ6+BtxRDtAJebu6pToYfjKXFZdJWBOHhZnQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzX04RAiIr17q+DVXUyAW1Azo5LYGdz9NnBtg0UCkdyNG+4Ysvk
 JBwVW1MYXEtjndQ79ZaJeWAED5C4GQXYS72QqgAZvCE8eHf+I8JfX7WFWNp61wB1qvw=
X-Gm-Gg: AeBDieua3LqhkAQ8rex1hBiOj181uMMzl2uK+n3pDJHLqm0pbc95+qsZ56bh40zLLSn
 lr2foVH5oP1bnUYSvP7EsiTTEbGXsR2m3fO2I+cEpFyA1oWiQP/+A0ePlMONDLQBUZE18xSuu8A
 n/LDnnahjESHL1kj2ZX0ec5a6AieOHr9JBPKPaiEOH+MCf4cuD8mZSj0g/CrAc3ej27U5oJhGJY
 3+wGA2CWHBTalpx7xAWdHEJ0vycvMuVt56sNUUSTnL4N8Kys00wNXHNiiuVsxCOnSjfHTQ+YLML
 lQAeFV9qJCloW5MTnI5/AKTQ1SQ+TFErKxCIXtZGY+IeaQPWAoSwv6d/TiquuXeRHHh/PmTe7oa
 OvY/VHDoibgjtC9lCcDn43uc/6LuCTypxGCTwxNx+dEJXoeASd7OGlUtnJHql+gwdzIaxruXFrE
 WMcJS/Rr9rimn1E0Sysgf0UYcSNnKCbfHAoauULK1XRIygKD5+Fx8UqfGp/ZUSJIcqDZQvvT2O2
 KgFSUzjLLbm73V1xyC3DV6+ZpPrPyjWOqYePyXoNW4ErBiJK4PyltLF01A+KmvS0rqYG2sbZH2X
 Kti4m1qhkv3WMq4JekY=
X-Received: by 2002:a05:600c:3e05:b0:489:1ff1:74df with SMTP id
 5b1f17b1804b1-48a9852fbcfmr256956845e9.1.1777998332149; 
 Tue, 05 May 2026 09:25:32 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a81ed6bafsm737620655e9.2.2026.05.05.09.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 09:25:31 -0700 (PDT)
Date: Tue, 5 May 2026 17:25:28 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <afoZ-LuVRaX6ixs4@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-13-elder@riscstar.com>
 <d29621c3-07fc-4720-abff-d8901a0d791c@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d29621c3-07fc-4720-abff-d8901a0d791c@lunn.ch>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 chenchuangyu@xiaomi.com, edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 Alex Elder <elder@riscstar.com>, daniel@iogearbox.net, chenhuacai@kernel.org,
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
Subject: Re: [Linux-stm32] [PATCH net-next 12/12] arm64: dts: qcom:
 qcs6490-rb3gen2: enable TC9564 with a single QCS8081 phy
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
X-Rspamd-Queue-Id: EA3ED4D13BF
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
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069
 @gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.855];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspen.lan:mid,1c:email,st-md-mailman.stormreply.com:rdns]

On Fri, May 01, 2026 at 11:09:42PM +0200, Andrew Lunn wrote:
> > +					tc956x_emac1_phy: ethernet-phy@1c {
> > +						compatible = "ethernet-phy-id004d.d101";
> > +						reg = <0x1c>;
> > +						reset-gpios = <&tc956x_emac0 1 GPIO_ACTIVE_LOW>;
> > +						reset-assert-us = <20>;
> > +						reset-deassert-us = <20>;
> > +
> > +						pinctrl-names = "default";
> > +						pinctrl-0 = <&qep_irq_pin>;
> > +						interrupts-extended = <&tlmm 101 IRQ_TYPE_EDGE_FALLING>;
>
> What is probably wrong. PHY interrupts are level, not edge.

Thanks (and agree). Will fix.


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
