Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJkSAPKl/GmwSQAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 16:47:14 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE764EA76C
	for <lists+linux-stm32@lfdr.de>; Thu, 07 May 2026 16:47:13 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F1677C8F289;
	Thu,  7 May 2026 14:47:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4948AC8F283
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  7 May 2026 14:47:11 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-488ba840146so8821685e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 May 2026 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778165230; x=1778770030;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QZB38wJGIZd42iBI3srRP0pjjAxDTyyGTqCWJp8RgtQ=;
 b=nKJobXKszsG79WgYkJWlhkelKpGx68tCWaafmWWTNTVIKEtDcHn1MFgalDYSpox8oP
 62PJJDcvlx8al11V555hJ/zVMxqCRIQq+iRNkAkqgdLqLRpPoeMFPgiOssdRpddwgK3T
 qrDMEHSrgPyK/J+c3PbsMBnFofFgtJkJTYDh/7Nj2XajFYr+65zFNlf0fUp5Xds8canz
 LbvHvgmML1SlBXBzA8YCTyGs68OEaS6eydkUOjcxssGeMojp2shMfSVri1PpCqLJByoD
 AMMNkRAm4ekqMMPd7Pf8jFjJ2OIdDnYHmzvgFPQ4uiG/mUU7IQJa8aip58tlzxUsCp8s
 CiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778165230; x=1778770030;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QZB38wJGIZd42iBI3srRP0pjjAxDTyyGTqCWJp8RgtQ=;
 b=eD6sDul6aL/0hVDG3g6cHojh/2nkufKjf9cQ/ZRDd8f2u1+HP1N8Z4We8gG49RPdYE
 +LPINL2Okcm7BoQR0CO9ykKNxXqchAo52XH4Cr6roLQqWXAPPGhL6CTC1e89Io0zXHl/
 Opondo50vfQGyTQJPopUYHvot6Noth8fZntqKsUPS3Bh0WHq0CLNqww2PUBaFgWI3NuD
 Wecz/nejJlgWPU1aJGaQlfbJmBA50YmpVKvSzytwDkE3fzqhmxTENd0T4vDgZx2RGVsW
 FNapqqyoTPs75JYIbeYGEKwonTrcfUTgswIsIjrqaI0FGUdn3Fc5IbgTGp5nC6DfLjRy
 BvIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/CZuKYcBpjlsw8RXtdQr+qDe1II3fRS2+GIhfIBLOhUwXIsqXHrppj9XLiL7nudD36fHAzPd5YFGooFA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxLnNC+X+depuu/SKZUOcAYMrswQVnBtO9H5OX504yHv3kg0D7W
 3aWKdc6H8xo5vDWTy9dDrGtfzNhOPRpDW5MBDhdTSuQFwgGBhKZagfdpN3rwIkQKdT4=
X-Gm-Gg: AeBDievRiFJ+m7OBKK8/02Op16eGpVct59PgbPaNLQ1KGBrqC+f5hqQ2tgTuEiijgDQ
 SnFWvN7/Ev4YyUjBD0oONQFsWvWIUmTpNBxB1vRxPxgyq/z0z9c0Qe8cM1Hv21bmcpiFFWrs3g1
 mAV68bbuGZPTSaF0DwmoU67+C93nT3Y5tojeh9zMmgLu6nPax4F2lYAIVUGP2Vt4kva/eOnIMjI
 C1i8zoIBcIEMOeb1cX2QHPqmaRNMse4M2Yf/c7BZWM5SpDr0T48oVhxXAW4WOrWBUmTiTtQsgay
 4d5+S0S/qhzFwHoFbaRSXqgBZfyWfjgkKDbnKDXHhTiN65VJfJwkXYoUhfgtNrwK5p6ygEjxBDX
 gFJMBKufEtm5P2EBWc7QubJ/KMehMA+nPssq8uDhXmX+YFT2kt+lxWqfuoq4KWA309+8PP7gtwo
 CEqr0vbwrqYWweQHkq5EkfL85lJ6vKknuLOVJximlARc9mX8uYaDR0xTJPW4m/A1VmxQxdAKavW
 2fM9EJgthYk82IHOkF7jXjh+E0s9JpfS74pGnHBJ8mNynOujLJzZC5guz2RBNDRC/ST8wSzaREJ
 iEiWea8eS+psOmBiumk=
X-Received: by 2002:a05:600c:a317:b0:488:a977:8d6 with SMTP id
 5b1f17b1804b1-48e52bd4f32mr100824405e9.19.1778165230150; 
 Thu, 07 May 2026 07:47:10 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538a5486sm134813275e9.6.2026.05.07.07.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 07:47:09 -0700 (PDT)
Date: Thu, 7 May 2026 15:47:06 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <afyl6gpHLlAnxir7@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-9-elder@riscstar.com>
 <20260504-fascinating-teal-tarsier-b116c8@quoll>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260504-fascinating-teal-tarsier-b116c8@quoll>
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
Subject: Re: [Linux-stm32] [PATCH net-next 08/12] dt-bindings: net: toshiba,
 tc965x-dwmac: add TC956x Ethernet bridge
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
X-Rspamd-Queue-Id: 6BE764EA76C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [7.19 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a098720306
 9@gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.670];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:52.209.6.89];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,stm-ict-prod-mailman-01.stormreply.prv:helo,aspen.lan:mid,st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url]
X-Rspamd-Action: add header
X-Spam: Yes

On Mon, May 04, 2026 at 01:00:07PM +0200, Krzysztof Kozlowski wrote:
> On Fri, May 01, 2026 at 10:54:16AM -0500, Alex Elder wrote:
> > From: Daniel Thompson <daniel@riscstar.com>
> >
> > Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
> > bridges.
> >
> > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > Signed-off-by: Alex Elder <elder@riscstar.com>

Alex already replied to most of your comments but on this one
specifically...


> > ---
> >  .../bindings/net/toshiba,tc956x-dwmac.yaml    | 111 ++++++++++++++++++
> >  1 file changed, 111 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> > new file mode 100644
> > index 0000000000000..d95d22a3761da
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> > @@ -0,0 +1,111 @@
> > <snip>
> > +examples:
> > +  - |
> > +    pcie {
> > +      #address-cells = <3>;
> > +      #size-cells = <2>;
> > +
> > +      tc956x_emac0: pci@0,0 {
> > +        compatible = "pci1179,0220";
> > +        reg = <0x50000 0x0 0x0 0x0 0x0>;
> > +        #address-cells = <3>;
> > +        #size-cells = <2>;
> > +        device_type = "pci";
> > +        ranges;
> > +
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +
> > +        phy-mode = "10gbase-r";
> > +        phy-handle = <&tc956x_emac0_phy>;
> > +
> > +        mdio {
> > +          compatible = "snps,dwmac-mdio";
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          tc956x_emac0_phy: ethernet-phy@1c {
> > +            compatible = "ethernet-phy-id311c.1c12";
> > +            reg = <0x1c>;
> > +          };
> > +        };
> > +      };
>
> Keep only one example, unless you have different properties (not their
> values, but their presence),

At some point I simplified the example by stripping out excess
properties from each ethernet-phy. In the process it looks like I
removed too much and eliminated reason I thought it important to
include both PCI functions in the example!

Each ethernet-phy will typically describe a reset gpio but we expect
only eMAC0 to act as a gpio-controller. For that reason I wanted to
show that. You can see part of that that in the current example because
tc956x_emac1 is not a gpio-controller.

In other words tc956x_emac**1**_phy will, in the real world, include a
reset-gpios property that references tc956x_emac**0**. For example:

    reset-gpios = <&tc956x_emac0 1 GPIO_ACTIVE_LOW>


So... is it better to strip it back the example to describe only a
single PCI function or should I add back the reset-gpios that I
accidentally removed?


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
