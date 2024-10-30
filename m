Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF689B58C8
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Oct 2024 01:43:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 87A89C78020;
	Wed, 30 Oct 2024 00:43:52 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0EF9C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 30 Oct 2024 00:43:44 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20cf3e36a76so61184775ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Oct 2024 17:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730249023; x=1730853823;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=iZ3S2WcB+zGxiJngz5Z329XPyYJE8uVordKNgTGUhwk=;
 b=KuoEOKIf0P1lecQ4ZTTdFVGrAQQ7WhTaepi+A4/4wjz28UbdDV3kqHK+ba0ie45yaz
 08/v9Xc1V26BhuOcgnN0/XhnCtPcja9Xl3xB1GuoiKFhmo5x0DTLh/tr5JTGOnUf7rt/
 zq7arwe5g93UzDIs/VT2go1+X6H7xjpXVnip39Y6uLH/VXamnBoyyKWTYSTHGb6vB4xB
 cUxNr0L8RddCTnvaYEZKg1ODcFqJP0B8Ln5yfEN0zvNyrdL0beZpbgPNU1gNkTF6zreY
 6mKttwtrqK1AEXPlDGnjGv+KIFV15OSDIO7J2MO4nTwQTqt41G2wuN1/HQ/yPxnRl0KK
 a7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730249023; x=1730853823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZ3S2WcB+zGxiJngz5Z329XPyYJE8uVordKNgTGUhwk=;
 b=OfCav8sadtnr3YKB3Ye32N3ZVeMtZWc+KoJtWynS7QhoUtGzX5cJssqJ8LDtJcQ/lz
 c9u0iO+Z2m4EC0E227Ofed8i1CCBTCuX492dhWOQ65aRPiGaPW4tX9foXeyJ20qxL6K3
 /ld5e6RHmN37iycNT3qsPiqI1H+re37DJdoaa0dc2bS4qTzhbRieR+f3ZEbVRNp8WXCA
 O5CSZI0G4dSzXyPHxKv6geQYKy/z1xqsFbm1gS1MSHmgfh5YyMmPmEj0hZIAaw2AjUc8
 mJXtQZ03Y5QfqTCCvEnRrbAzcxwz67f1zdpjau1eYciBODrc2n6myX+ei1ldwGg3Yv+0
 30UA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgtPlc2/fWuzG42xKGQ+KOoY2MV8U84h8R8mDyUn/Y4Kvwb9HrlYdInxVkoFbZtgVTnu8tKhd+Z/5cnw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxGYK6SYQ9Y9vjxC/obxSKp9uLbxjIUe9NqyBwmhe0wWIqY0HlG
 9l2hwEs+bOvFLaW6zpmq164+iHU4b1o0Ihm6xR8vBvKJDm5jU46q
X-Google-Smtp-Source: AGHT+IHHRyGyDkKcNwaxMn/2+7uQYnlMNqSGQQ6CzP4zXPjfAAfmUzV8DyN0d/uv99tZavi9Wq36BA==
X-Received: by 2002:a17:902:d2d2:b0:20b:6d71:4140 with SMTP id
 d9443c01a7336-210c6c7354cmr156629705ad.44.1730249023405; 
 Tue, 29 Oct 2024 17:43:43 -0700 (PDT)
Received: from localhost ([121.250.214.124]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-210bc02eee6sm72101525ad.219.2024.10.29.17.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 17:43:43 -0700 (PDT)
Date: Wed, 30 Oct 2024 08:43:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <kg4fvjertilaekjwuwxiojy25qsrwrmc3pxnpu35awg7klmlmw@3aar5yqe3olc>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-3-inochiama@gmail.com>
 <4avwff7m4puralnaoh6pat62nzpovre2usqkmp3q4r4bk5ujjf@j3jzr4p74v4a>
 <mwlbdxw7yh5cqqi5mnbhelf4ihqihup4zkzppkxm7ggsb5itbb@mcbyevoat76d>
 <8eeb1f7c-3198-45ac-be9a-c3d4e5174f1f@kernel.org>
 <gcur4pgotkwp6nd557ftkvlzh5xv3shxvvl3ofictlie2hlxua@f4zxljrgzvke>
 <e134b98f-5a57-4a37-b46b-8b4017f050a6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e134b98f-5a57-4a37-b46b-8b4017f050a6@kernel.org>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Rob Herring <robh@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
 Jose Abreu <joabreu@synopsys.com>, Inochi Amaoto <inochiama@outlook.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Cochran <richardcochran@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 2/4] dt-bindings: net: Add support for
 Sophgo SG2044 dwmac
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

On Tue, Oct 29, 2024 at 02:27:20PM +0100, Krzysztof Kozlowski wrote:
> On 28/10/2024 08:16, Inochi Amaoto wrote:
> > On Mon, Oct 28, 2024 at 08:06:25AM +0100, Krzysztof Kozlowski wrote:
> >> On 28/10/2024 00:32, Inochi Amaoto wrote:
> >>> On Sun, Oct 27, 2024 at 09:38:00PM +0100, Krzysztof Kozlowski wrote:
> >>>> On Fri, Oct 25, 2024 at 09:09:58AM +0800, Inochi Amaoto wrote:
> >>>>> The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> >>>>> with some extra clock.
> >>>>>
> >>>>> Add necessary compatible string for this device.
> >>>>>
> >>>>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >>>>> ---
> >>>>
> >>>> This should be squashed with a corrected previous patch 
> >>>
> >>> Good, I will.
> >>>
> >>>> (why do you need to select snps,dwmac-5.30a?), 
> >>>
> >>> The is because the driver use the fallback versioned compatible 
> >>> string to set up some common arguments. (This is what the patch
> >>
> >> Nope. Driver never relies on schema doing select. That's just incorrect.
> >>
> > 
> > Yeah, I make a mistake on understanding you. For me, I just followed
> > what others do. But there is a comment before this select.
> > 
> > """
> > Select every compatible, including the deprecated ones. This way, we
> > will be able to report a warning when we have that compatible, since
> > we will validate the node thanks to the select, but won't report it
> > as a valid value in the compatible property description
> > """
> > 
> > By reading this, I think there may be some historical reason? Maybe
> > someone can explain this.
> 
> I think this is left-over from older times before all specific
> compatibles were added here and in their bindings. This binding has been
> waiting for some cleanup for a while now, so this is fine.
> 
> I still think the patches should be merged, though.
> 
> Best regards,
> Krzysztof
> 

Thanks, I will squash this patch in the next version

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
