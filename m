Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGa/EKhg+2kuaQMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 17:39:20 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C894DD69D
	for <lists+linux-stm32@lfdr.de>; Wed, 06 May 2026 17:39:19 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90C74C8F289;
	Wed,  6 May 2026 15:39:19 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3CA2AC8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  6 May 2026 15:39:18 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-488d2079582so68356065e9.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 06 May 2026 08:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778081958; x=1778686758;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+RE97dD5fWvLcGBYDBhe9zTaH8AQpDWyp4x6oWJE49c=;
 b=n5RWyJUDaIO4QJuGEGtN59DCWyYOda5C7LkTqvSUhx2pgDUMSPGjuqaJGdAAeYE8/m
 3hOOgYxjTMLA8rq/U+j8Ufy03+Xywa6gsXDm5KdUWTM7Uq95ZAu67+Z4gACYZ3UB9d/Y
 7baBh+86uGf4ap1CwiolvUuj64rhoUApwXFZ257hpL4JB/yrdA0OrQwxQ6E7hrqUyS8e
 ETKgGKYY1KqvG/SxiX7FaJOsgcaR5LjDCZ133V8zm1YoTOkWb2sns0z0vH0j3aaLry8x
 oglOu+TbOK+Jy8AFktA26eAurvRS91l57vd3UeT76mS1VV4J80y15oC7VzlmS67Xeizx
 nCig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778081958; x=1778686758;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+RE97dD5fWvLcGBYDBhe9zTaH8AQpDWyp4x6oWJE49c=;
 b=UhLBUvycpxcIzIpMUeLX1XV8amr6F5mhZdWt4XFjRVRjQ74wlNBDmNEzwfLUrpkHEk
 WTuzu1zd8h5jB83divtZr9bATnDMBR/0epo507wR5qvPzZoHRAUntHc0Tl7G9AOyGtkH
 5yc9W0lqgJ3Fs5kG84bi/nZnmd2BlqBFPhJEJVf0BwLELskzfiMH2rzdLs+SaLItGSjY
 FvhOco+Bmwt5mTTU2Ajimk9UnLjTbVBX+HZdPkwEI9LX7CrUOQM05FjJuy/Vjm5u5SoY
 e4fsNIUbfGdQAIFS6xyNmUpk317bzOkvjNo5je9GKlxN9YM6G59fKGTrueygyxmZboH6
 9zHg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9AUAzln60CLjH1gDtJxoB4LCX6I+2EW6+V9VH4C5LtWroDlCsgpL6NBjPRAtblOl6DBe8fvnBXnG6+rw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzTaOkzwO14HsdhYxwWXkifBqXKRy87PQ4mGHJpuZOIOQs/1DIu
 fHDlo8ESRKDSpCVyyXOuzbL8HIis/IVtvHbVBeQc9X4oLIJb8gdysLYb1zTiVBaL8is=
X-Gm-Gg: AeBDietiX2IJMhwDPDo5UsHm9QxeF7zprTJaQe62nHqcWfH8P1h9GUXn+nUjRcfdv0v
 7ZyI8M4I+s26ZCwTiK/aRjVES0UmZbFWTnBVPtXFYoGGXS/VpYjhy9CB/OAKn3i752KDDIH/ww/
 GYI6Hr4w4pzmN15CGVrHhymIb1S+UVI1puLy4o5Q4tNE2tcvDaYvCIQJA0KWFyUoJ2Nuk8ostCr
 SjzZIWQ4bow7ZV8R/PTJQWP0TRAFPKcuBb3N1o2UXA8PHdTppK7VdWR7RYGRSxF+I3gnodNWvkO
 ul0Jhu4Jhem8tjEQxondos/hVgJa8XAPV4C225puH7v+iZgsApOrRcH/vsQrS8cuDFOKljhXBGT
 FPViOKFpP2W5C0ol04nqOf4MQ52oF5mi4FrrYPuhA4ZgsTFGlRfvyvk4XeUlahPj7UUc9dlmpHA
 hs4Bi78cqT1Wra0G2Q3aCMvDzVKlDuZzNmsyGiew/B+s15Z2/j6NPk6YNxb6wSSOFX/WMme2VOp
 JfFWFvu5e4D453c92w4aX029d49hbm0okHGt/pjf3CeGzq/wD69gv2OxqlK+uxMULpv9c/pxagA
 TyimamvzRAR7MHWQCAU=
X-Received: by 2002:a05:600c:6209:b0:48a:525b:e157 with SMTP id
 5b1f17b1804b1-48e51f2e660mr64800835e9.13.1778081957492; 
 Wed, 06 May 2026 08:39:17 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538fb19csm52241905e9.11.2026.05.06.08.39.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 08:39:16 -0700 (PDT)
Date: Wed, 6 May 2026 16:39:14 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Xilin Wu <sophon@radxa.com>
Message-ID: <aftgorkah-Hjrvq2@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <224E233C593EF171+8c8a43dd-5061-40f8-9eb7-f360eabf2ecc@radxa.com>
 <4015f47a-af62-441d-b1b8-a8598f963970@lunn.ch>
 <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4C0D95BC59F1A4ED+53f3be85-2cdd-4058-8950-57970027d481@radxa.com>
Cc: Andrew Lunn <andrew@lunn.ch>, me@ziyao.cc, ast@kernel.org,
 linux-kernel@vger.kernel.org, chenchuangyu@xiaomi.com, edumazet@google.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 robh@kernel.org, mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Rspamd-Queue-Id: D4C894DD69D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sophon@radxa.com,m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kerne
 l.org,m:a0987203069@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[lunn.ch,ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCPT_COUNT_GT_50(0.00)[50];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.977];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,aspen.lan:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]

On Wed, May 06, 2026 at 10:35:18PM +0800, Xilin Wu wrote:
> On 5/6/2026 10:19 PM, Andrew Lunn wrote:
> > On Wed, May 06, 2026 at 08:59:01PM +0800, Xilin Wu wrote:
> > > On 5/1/2026 11:54 PM, Alex Elder wrote:
> > > > +	/* AXI Configuration */
> > > > +	axi = &td->axi;
> > > > +	axi->axi_lpi_en = 1;
> > > > +	axi->axi_wr_osr_lmt = 31;
> > > > +	axi->axi_rd_osr_lmt = 31;
> > > > +	/* All sizes (2^2..2^8) are supported */
> > > > +	axi->axi_blen_regval = DMA_AXI_BLEN_MASK;
> > > > +	plat->axi = axi;
> > > > +
> > > > +	plat->mac_port_sel_speed = speed;
> > > > +	plat->flags = STMMAC_FLAG_MULTI_MSI_EN | STMMAC_FLAG_TSO_EN;
> > >
> > > I got WoL working only after adding STMMAC_FLAG_USE_PHY_WOL here. I guess
> > > it's required, since the driver clocks down the MAC/PMA/XPCS in its suspend
> > > hook?
> >
> > Nice to see somebody testing WoL.
> >
> > In your testing, is it the PHY doing the WoL, or the MAC? I assume
> > PHY.
> >
> > If i remember the DT correctly, the PHY interrupt is connected to a
> > SoC GPIO, not a GPIO of this chip. So for your board, it is the SoCs
> > GPIO controllers ability to perform the wake which is
> > important. However, where the PHY interrupt is connected is a board
> > design issue. Could the PHY interrupt be connected to the chip? Would
> > the chip be able to wake the system? Should STMMAC_FLAG_USE_PHY_WOL be
> > conditional?
>
> Yes, the PHY is doing the WoL. And I guess this makes sense as it allows the
> MAC to power down during suspend to save power.
>
> The INTN pin of QCA8081 is connected to the ETH_0_INT_N of QPS615. And the
> INTN_WOL pin is connected to a SoC GPIO.

Interesting. That is different to RB3gen2 where INTN is routed to both
(although there is a do-not-fit 0ohm resistor option that could change
that).

Does that mean you don't get phy interrupts reported in /proc/interrupts
before any suspend happens?


> Without this change, I can't get WoL to work. I have a working branch for
> our board here:
> https://github.com/strongtz/linux-radxa-qcom/commits/v7.0.2-8280-wip/

I took a quick look at the DT and I noticed you have an SGMII PHY
attached to both eMAC0 and eMAC1 on your board. This is something we
think should work but were unable to test. Are you able to use both
eMACs concurrently? Would be great to see that confirmed!


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
