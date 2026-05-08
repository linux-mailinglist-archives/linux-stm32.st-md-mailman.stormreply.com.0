Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL7zIC/I/WlSjAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 13:25:35 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4A14F5B9A
	for <lists+linux-stm32@lfdr.de>; Fri, 08 May 2026 13:25:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF219C36B2A;
	Fri,  8 May 2026 11:25:34 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F0CBC36B13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 May 2026 11:25:33 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-449d6c68ed8so1553013f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 08 May 2026 04:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778239533; x=1778844333;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i3oCf6JjY2k4f2DdZmgb+d8lKs1DeUt4qK3/lGPB5dQ=;
 b=TsZYrFWEhIA72mULBskveAMZDub2mgRN4egMRgiqiGeXXNPpr8bXi/NIJ8yzNHs8lL
 gRb1miipPnBfGNWFEIY4dqxIc6m9NzUIWARdpwHzRmJ5OiorhvdkruSHaNtklJTtvyUQ
 2LhD5XlE51vT7bXTxxqr3s91o1ZNXo5+HVGOewmUBXOwTRqmYrh0QAfoN+6f8fJOsoCW
 FfhFWesh+bEiwZvtSVRgD2s0IaTSL2Ux5GNwdM3k5DDd3hAs3waqrJgptCBGhoZFmWpT
 +iUPztyrXqV9npTL816sUpzOj7fNWS/8SQbjvKFM/Kc5CQTZBHoRyfU1s8izab2/ILQD
 HYeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778239533; x=1778844333;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i3oCf6JjY2k4f2DdZmgb+d8lKs1DeUt4qK3/lGPB5dQ=;
 b=XwDZcThDie3l09KmpVTaNoENP2Eo3s77dn6f3cIbgFDx8xaLkOKJpL8+Q0tpO9+gGK
 1Y8FA9EkT+gn7DWxibM2p26pQeJlHDmvuqtnWM/mAcEKiXpQFgbv+pObTxv4MqqYVVv2
 JslN04YtmLYhgSLOB7rXXfgGv446Qf+7ZezYkxVUHbFATeon8XEesuoMOFfOghy2dfrF
 PJHkD/4C66N9JtwlHPx0g1sQLkEnPwUiaEG5hnnYkGEEwvkI+sVYKYXKttoiTz7dCQaJ
 UmkdNEodQThRluR4cDUlSm21GD0DzTbWMnHE/I21OLRH++77TeVLyvkPYFYpNBwi2x78
 a7QQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9nTnAYewl914M0U2prsn6CloeB8LOfSh7BoUINjRWUeVOf4Xpj9DVD1wnctgjXt0WFczLQgo/eAff9nQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyTdDm7DI4/5ZjojKGQ0/sUCX2jNITaXjrQoNkUSYfWENBEck+2
 3hJH7Ka8Xd1q8IhpX008BocuBve/DfKg2iXSLHSa9aNpQL4BAwmBHDETAPaWqO9SWxE=
X-Gm-Gg: Acq92OHeFHEuvC+MgCz3p9QIiCTFxC/wwtU8/uJVKtgu4Pex1y8GxbqPBCA8rPG6W4y
 N8+X8ZcwGm+rFIaoKoZ/lm8fvhV4NlIAdkE8oN2KVaPPn6Drn3sS/Hh/lhrbcvV/nun3ztGzi5n
 SHd6VV27XyKWKWwyB2gxzpaKJN5U5KjMR5QgQat0ywi+tzl8pBo1Px38+XyimzhbXl5AREVe0wd
 x2CXJYsYdLMM52RmDYHAfjhLAB6h5BYu8W1IVrh+2KLy3pe7dCW1Xfk8P1Et0kSHjVNUGhXx4/4
 oAXAEasWdL1lsgr2q7eBe3TWDoggcdBMFdmYax2uTaldQAF/NYFqRYpOp0Jml8nodYE/ygJivZu
 ClXQsYJ3DEe7FJPBlUTCyYP0dftePVzqjKbTW2XSgPqgJ4uq4Nd0O+ih9o0y0wWyG7t0rFsHmF/
 SIgpINccX/LU+3p9MNCl++oxtDDC2x0OyJZlSDhea0HlCwqkh3ZTxIfgdMFB61wqAXTRfxVswg7
 Kh+eF19gcNDVZR6sjIEj8sLZZC3CmaD8J0BTvbnXC1JIsBIUceR19M9VTuDb89+C6HiTsNd843H
 SvYQeHmi
X-Received: by 2002:a05:6000:26c9:b0:43b:3b80:6776 with SMTP id
 ffacd0b85a97d-4515d3dc30emr18803689f8f.30.1778239532551; 
 Fri, 08 May 2026 04:25:32 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-454917d57aesm3814079f8f.26.2026.05.08.04.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2026 04:25:31 -0700 (PDT)
Date: Fri, 8 May 2026 12:25:28 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <af3IKKkjl0jK8GGB@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-11-elder@riscstar.com>
 <2ce5897d-5bbb-486a-b0f0-0e30e54b451a@lunn.ch>
 <afy34kj2hPxIlArO@aspen.lan>
 <ef6df85f-11ac-404d-958a-8cf69b3b6bb6@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef6df85f-11ac-404d-958a-8cf69b3b6bb6@lunn.ch>
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
X-Rspamd-Queue-Id: 1A4A14F5B9A
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
	NEURAL_HAM(-0.00)[-0.833];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aspen.lan:mid,stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 06:29:15PM +0200, Andrew Lunn wrote:
> On Thu, May 07, 2026 at 05:03:46PM +0100, Daniel Thompson wrote:
> > On Fri, May 01, 2026 at 09:04:58PM +0200, Andrew Lunn wrote:
> > > > +static struct tc956x_mac_speed mac_speed[] = {
> > > > +	{ PHY_INTERFACE_MODE_2500BASEX,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > > > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_2500,  SP_SEL_SGMII_2500M, },
> > > > +	{ PHY_INTERFACE_MODE_SGMII,	SPEED_1000,  SP_SEL_SGMII_1000M, },
> > >
> > > That looks odd. Some vendors implemented 2500BaseX using SGMII
> > > overclocked. But that is not strictly 2500BaseX. Having the 2500BASEX
> > > entry suggests you have real 2500BASEX, so why have an SGMII entry
> > > with SPEED_2500?
> >
> > This is a consequence of the code that uses this lookup table being
> > called both during initialization and from the fix_mac_speed() callback.
> >
> > During initialization we only have the value in plat->phy_interface to
> > go on so we run the lookup table using plat->phy_interface (which is
> > typically PHY_INTERFACE_MODE_SGMII) and with the maximum permitted
> > speed.
>
> Something sounds wrong here. SGMII only supports 10/100/1G. You should
> never be asked to do SGMII at 2500. It should ask for 2500BaseX.

We weren't being asked. It was just an internal driver trick to common
up some code paths.

However I did a few tests and the internal driver trick doesn't
actually do much we can't achieve a different way. With that changed I
can (and will) remove the PHY_INTERFACE_MODE_SGMII/SPEED_2500 entry
from the table.


> > I haven't got detailed enough notes to allow me to double check but I
> > think there were problems completing the initial MAC reset if we didn't
> > write something sensible to the hardware during initialization.
>
> > During fix_max_speed() we get told to adopt 2500base-x. Reviewing the
> > code I can see we don't propagate that and just use
> > plat->phy_interface for fix_mac_speed(). I will fix the code to that
> > the requested interface propagates properly to the lookup table but I
> > think we would still rely on the SGMII entry to get sane initial values
> > to write to the hardware.
>
> Getting sane values into the hardware is good, but 2500 SGMII is not
> sane :-(

BTW if you are bothered by SP_SEL_SGMII_2500M, that name comes directly
from the TRM and I'd prefer to keep it if I can. The enumerated value
we have to write into the SP_SEL for 2500base-X is "SGMII 2500M".


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
