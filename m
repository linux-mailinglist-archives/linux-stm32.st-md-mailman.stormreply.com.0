Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +If+HOAN+2kuVwMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 11:46:08 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D81E4D8D98
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 11:46:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2CEE8C8F289;
	Wed,  6 May 2026 09:46:07 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CD0FBC32EB0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 09:46:05 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48a7fe4f40bso66539365e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2026 02:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778060765; x=1778665565;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jvO5cR5xwJ6Wruq4xsZ8UnvszQRGf9f2UYLH+AJmPFY=;
 b=EpIC+4YzZylxvZrMFT/wyWm6sQS6w0awwrmH6r868hJl/hCf8haEsO0f62AxS/r85q
 tOvy5hS9gipa30aduGlE8L+YSNCHTP2IeYnTlfJ4XWaujvRNLAnqPBKhpEJpUCZNvaji
 uVQfb8tsgjHzk2+ZA2gpRt87j54wIR1skqC7Vf0D+rIwSz2LDPw1jvolLscQwCFpGRSy
 z6oXJ1aSGyp43NHZgqQpBxEbXFD9q4i1N6XSfnh1Oo4Uo7/YFiie/eX4z/NZ4vKjmCgF
 tH1DMWnJTrITPjd+WnegXbXAZf3gz8cApOJe2hTQzGYtTCz2PFxopVMqkKhuZb5SiHoL
 Ro1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778060765; x=1778665565;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jvO5cR5xwJ6Wruq4xsZ8UnvszQRGf9f2UYLH+AJmPFY=;
 b=s1pcmhZPwm0uvzro4G1NRec9Qv5ww4QoUEEG2a8gcWo3OtByHIG4NBX/d6XcBHYDU2
 EI5eYTw1Fanot2BxTAVNCM9raiWyK7PaVoiSfmUc5uh8Rp9IEqA5M0RqASHh8nh+nCK3
 na5nr9GPbUQ+p7HjvcoIe9pRZYYaiQ2PzhnWF4VjLQT8Tx43OKS2fQpBCep0JEQyANmM
 ihMqDB0LzNMQAiEXDFF0u3djQ1tz9YTRC46/GgrSdv0cCpIohUiBjJSLRFvx2YdoxDjQ
 l8CB5aCKgOk17wiP3d0BBwF/iXlc0rmQcYP/mtREq2S1frtvbgseEvgTTrhYwyCGN/82
 jKCQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+8aq3wY2RQ+rky+bAwoeV1nS6cxWQ3/SC2gN7kz10TJJqg2V/72HawRgVYpu2156VKbDzhzqXMQ+8xmg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzPunLSsxtC4pML2cSTTz3EW4nUrxLSkzPTP53FuUTnjZhSSkCT
 /8KINFQZX9GjowoR6sYzhJ1ZiCWKOIjJ0sRHGILDFbfmkrKAGZgzXyzGl/rnLD0Uh5k=
X-Gm-Gg: AeBDieuDMYuhlO2vknTfhFgn7FLb2m1vGOD/BAIWcDYAetexbjQsevuCe9SK3v09ODe
 IIBXdkMO179SPSVugSniRIpECOpSEYar7S6oLGry4BaL33VavOdVG4r3ujvmGQ56zLmaAm5oErq
 xM5CcpiGncFWrp7dTNY3bdwfK9IaYBg+cOUi1hxKzAITb/SDANKzndFhUn32LR4BbhXfe1k/7Bh
 M9zJO+W+lo4/oXKPSyiKsJFx/OVzYrwMV351iuRAXsvSJ312gEQnex1rzUKl/UZl/QtZFg5LB9B
 p6PZ0cTqPbBlr/YPk0/n+wiSYHXHOFQQxhSzqapb/XGvgHZ3cjb6YoLWGC5wmnPDf2H0Og/UlrC
 DVI/F9cq8qJTZ1iX7nRzXlj6VvhGTElFPPjgT7WuNCG66aW+6tC/ultgFyIiwQv9VRy47/Y1zBa
 SZjYgtN+W7M/t0buUlSF3ukaZAn0S/14G8mFSPyNLYmPcrXcHMXkhnjVVCUusT1Y9YZ/Rd9Jdwe
 H7Kqn6dd9gRs7xdhAA67JwBGAMSI+aOqaobfso1O6sNIgXnrOGYUDiEtz8l7wwpuqYuHD33UK0s
 jRN7JsnZhE3zHdQBqGk=
X-Received: by 2002:a05:600c:a305:b0:48a:5970:2005 with SMTP id
 5b1f17b1804b1-48e51e08362mr31054235e9.2.1778060764831; 
 Wed, 06 May 2026 02:46:04 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e5313b023sm19233185e9.5.2026.05.06.02.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 02:46:04 -0700 (PDT)
Date: Wed, 6 May 2026 10:46:00 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <afsN2JrKNFw-PV-g@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-4-elder@riscstar.com>
 <91332fc1-11ed-444e-a211-699420cf0108@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91332fc1-11ed-444e-a211-699420cf0108@lunn.ch>
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
Subject: Re: [Linux-stm32] [PATCH net-next 03/12] net: pcs: pcs-xpcs:
 Preserve BMCR_ANENBLE during link up
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
X-Rspamd-Queue-Id: 0D81E4D8D98
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
	NEURAL_HAM(-0.00)[-0.973];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[riscstar.com:email]

On Fri, May 01, 2026 at 07:06:15PM +0200, Andrew Lunn wrote:
> On Fri, May 01, 2026 at 10:54:11AM -0500, Alex Elder wrote:
> > From: Daniel Thompson <daniel@riscstar.com>
> >
> > Currently the XCPS found on Toshiba TC9564 (a.k.a. Qualcomm QPS615)
> > is unable to operate at 1000base-X and slower with a PHY connected
> > using SGMII/2500base-X (in our case a Qualcomm QCA8081). The link
> > negotiates speed correctly but the MAC can't get any packets out.
>
> We need to break this down into its components.
>
> I assume you are saying the PHY negotiates the media speed with the
> link partner. That is PHY talking to PHY.
>
> But we also have the PCS talking to the PHY. There can be inband
> signalling here, for SGMII and 2500BaseX. But not for over clocked
> SGMII, which is how some vendors implement 2500BaseX. SGMII signalling
> does not work when overclocked to 2.5G.
>
> > This attracted attention to the ANENABLE bit and we observed that the
> > bit is currently set during config and cleared during link up.
>
> Here we are talking about the PCS ANEBNABLE, not the PHY ANEBNABLE. So
> this is negotiation between the PCS and the PHY.
>
> > Preserving the bit during link up allows the system to work as expected.
>
> >  	int ret;
> >
> >  	if (neg_mode == PHYLINK_PCS_NEG_INBAND_ENABLED)
> >  		return;
>
> Think about this.
>
> >  	ret = xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> > -			 mii_bmcr_encode_fixed(speed, duplex));
> > +			 mii_bmcr_encode_fixed(speed, duplex) | an_enable);
>
> And mii_bmcr_encode_fixed().

Thanks for highlighting that... and for being gentle with the clue
stick!

This patch will be gone the next time this patchset is published and
I'll get the phylink configured properly.


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
