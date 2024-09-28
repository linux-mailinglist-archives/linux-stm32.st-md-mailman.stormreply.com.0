Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 409C599287A
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Oct 2024 11:45:26 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1B081C78036;
	Mon,  7 Oct 2024 09:45:23 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 311C5C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Sep 2024 20:45:56 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-20b64584fd4so2905215ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Sep 2024 13:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tenstorrent.com; s=google; t=1727556355; x=1728161155;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=B1wN4Mv6KTR3klc618UZyJIvaPfyrd+I69sEqUZILgs=;
 b=DEKdkAW7I8EeZ++NvUvph5Pour4vH7L0QSbsiT1iTcQglnBTsGQcoqFL4ka1y/KIVc
 DH6IqeVn6+iGWAGjMu9y3VTq7IUfhTi1T2i7Wxup46bT/OMdjf2OuI6Wr5BlN8mZguei
 Db8HPR6CVuw9xLTSkoaAMT/AZtkrd1pY7IWeZTNdSCq89vMltu2K3pv3FScOcD9nRUu/
 SwTVbm96Rzbh5aRkrpdMT76fr+txgxNgAhUmI6sAKUf8LAfZob8y6B5XfcYdZ96rqxri
 Kt4AXEEY/hapIbMvPedKS1nFRbhY04Cf3w4Dtfm8c6RBEo/bLD/2pjFZB/Oat9HiOJ7x
 1n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727556355; x=1728161155;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B1wN4Mv6KTR3klc618UZyJIvaPfyrd+I69sEqUZILgs=;
 b=Qdz/fTLzw8jogOUPnbCU36CkI3scmnwcKHCSpgBBcYKkxO1bjW8YKhZoskRtKitbyf
 /uNTO46IgEd8CwLb2qnPJMXGhN5gnySvkzmixMqTfeujohVJgvIwJfiDXEVkgT7n7KU1
 GV7XHBFEnO0Y2iLtAzpuhD7kTpvnlXqkrwpk35O+M+wv7sEZ7TX9vPWXXB7eoIS+TIVs
 UmDqUnVX1lnWqLSEgPWO1blQ0z0xhpU31y2f9F508V1fqPS8Is1sokX6ybccm89ijqv0
 V7s7Ze5VRcEwNd3kZycVJ8X7B/Z0HdbvQgvK++WCx8BYzhG7HmekQ5WEHbj43lR/IFog
 j5nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6cWxg8SabAl9VrLrF5DRxk8c65FHIeOrLIiN00FVPF3P1fMopyuZOHvEnusYvZVyf5KMvR2X7StLRgA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw2waAlo+i47UjS27aRy/NBiYj2meJSbyiMJxIbaIAKMAkuHG0R
 RRdngk5KyZbpL58h99uYqy3BEnMm2mSScghMUYm2wiDd4bKiV4wOx6WeKqPnc4U=
X-Google-Smtp-Source: AGHT+IHYe5C2dCeMbXLolGkdYVgGv6vaXYzm7QHCg36ZJ1QQJYHSFNwHxNkSM+iWKcxoee+lJlo/DA==
X-Received: by 2002:a17:902:c952:b0:20b:6a57:bf3a with SMTP id
 d9443c01a7336-20b6a57c137mr21788895ad.1.1727556354766; 
 Sat, 28 Sep 2024 13:45:54 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20b37e2f382sm30487635ad.182.2024.09.28.13.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Sep 2024 13:45:54 -0700 (PDT)
Date: Sat, 28 Sep 2024 13:45:52 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Message-ID: <ZvhrAFyfvj9mXuuV@x1>
References: <20240926-th1520-dwmac-v2-0-f34f28ad1dc9@tenstorrent.com>
 <20240926-th1520-dwmac-v2-3-f34f28ad1dc9@tenstorrent.com>
 <CAJM55Z-FLmpFfisNpJi8FP7o_5mwoDa7r18VXW7u7nF0V6oiRw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z-FLmpFfisNpJi8FP7o_5mwoDa7r18VXW7u7nF0V6oiRw@mail.gmail.com>
X-Mailman-Approved-At: Mon, 07 Oct 2024 09:45:20 +0000
Cc: Eric Dumazet <edumazet@google.com>, Guo Ren <guoren@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Drew Fustini <drew@pdp7.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Fu Wei <wefu@redhat.com>
Subject: Re: [Linux-stm32] [PATCH v2 3/3] riscv: dts: thead: Add TH1520
	ethernet nodes
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

On Fri, Sep 27, 2024 at 05:55:04AM -0700, Emil Renner Berthing wrote:
> Drew Fustini wrote:
> > From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> >
> > Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> > [drew: change apb registers from syscon to second reg of gmac node]
> > [drew: add phy reset delay properties for beaglev ahead]
> > Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> > ---
> >  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  91 ++++++++++++++
> >  .../boot/dts/thead/th1520-lichee-module-4a.dtsi    | 135 +++++++++++++++++++++
> >  arch/riscv/boot/dts/thead/th1520.dtsi              |  50 ++++++++
> >  3 files changed, 276 insertions(+)
> 
> ...
> 
> > diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > index ca84bc2039ef..d9d2e1f4dc68 100644
> > --- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
> > @@ -11,6 +11,11 @@ / {
> >  	model = "Sipeed Lichee Module 4A";
> >  	compatible = "sipeed,lichee-module-4a", "thead,th1520";
> >
> > +	aliases {
> > +		ethernet0 = &gmac0;
> > +		ethernet1 = &gmac1;
> > +	};
> > +
> >  	memory@0 {
> >  		device_type = "memory";
> >  		reg = <0x0 0x00000000 0x2 0x00000000>;
> > @@ -25,6 +30,16 @@ &osc_32k {
> >  	clock-frequency = <32768>;
> >  };
> >
> > +&dmac0 {
> > +	status = "okay";
> > +};
> > +
> > +&aogpio {
> > +	gpio-line-names = "", "", "",
> > +			  "GPIO00",
> > +			  "GPIO04";
> > +};
> > +
> 
> These GPIO line names does not belong in this patch. They should
> already be included in your other patchset adding the names for the
> other lines.
> 
> /Emil

Thanks, yeah, those sneaked in here.

Drew
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
