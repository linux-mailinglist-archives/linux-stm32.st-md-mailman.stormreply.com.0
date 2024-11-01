Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1AB9B8E15
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Nov 2024 10:45:07 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AB031C78034;
	Fri,  1 Nov 2024 09:45:06 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 39368C71290
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Nov 2024 09:44:59 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-71e983487a1so1454178b3a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Nov 2024 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730454298; x=1731059098;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5XPa1IlpixAalo9BA/o5sNKVNrHLCsckth76VFUIYgU=;
 b=CJyMfEvXLVqQXXXxLJOpAiOkv3CMB6znniiMJno/zP3dBF7bQvMcWxqbCR5rGcnY+x
 GNlzEIGMwekZ0ufnvWk6gspvZFwklslHQLBNECA11nONHJ9YCb+hJD5VTs9je49MGN57
 tDNrtLlalIAGl0uM6M6HjiHHYvyT1uklBc3TjXSAd0LgDYAOW9ObQanxqaMjwp8ZDp+i
 hWYBPElFk9GC8ez3XjAuYALxn1EGJtgNfE86Qm50Tpd3e6wB44PEB4nywtIgaf3DZOPb
 w7w3HYr5vEDrFV6iWIRBOKA4Oc5m1abXRw1/qR/mCOZCCL6DI03q5AGL6wbPLBKGdB3C
 OZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730454298; x=1731059098;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5XPa1IlpixAalo9BA/o5sNKVNrHLCsckth76VFUIYgU=;
 b=s32aoUtWhF83eegcLFHPPmrXxnIkh7PhToJITQiqtNPigbESFDAVb4bmqThKrnW6fm
 t+q7MmO0kxSaxGLcRwe6Si/C8x2zOoSoWdXuPpzpWqkSyMR5YDt+OXUTO5XtnWzC+X79
 05A6hDaTefHC7pesyIT28uGnV1vwHX8PuWwqQmrmoE5EBAB74kXx5MjyG62vu/R2IgGL
 6Cr510kj12OsB0LqCOxrZAecbEWPrhfaxu/Mxhih0NuqnQT38xYNUxNtSROgNsG1SNa2
 vCCB3thKwHfMWDdOZliU0T4zPKvUdGbf56y8yND+s/BvD8XlH+/dkcGQ59myCJKDe+/r
 iDkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWM90aHDRW6/8+h8vg0Kh+i+yuhgfDph6iCS/KH9dMYlz/p+MPtKKICN8DHOM6HbDXuliujssFmOmhGQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdinnI2iw9Unr7RnWNtIErUaJ60E2U/Yf3ggqqpiphtGk1+IZK
 +dPKv+psCCjsE/q9OQo38pC0fFyHTlPZpJAHAnLgICGsVwRYj8+3
X-Google-Smtp-Source: AGHT+IGzz+VDzAUOmgRPvDn9gKwbiqOY+8Ufm53TjoKqgLSjfioPk2EG5eDX4bVncoKvbVOiHTGVQg==
X-Received: by 2002:a05:6a21:e8e:b0:1d9:2453:433e with SMTP id
 adf61e73a8af0-1db91d517c4mr6918796637.4.1730454297630; 
 Fri, 01 Nov 2024 02:44:57 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92f90c6ddsm4712932a91.0.2024.11.01.02.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 02:44:57 -0700 (PDT)
Date: Fri, 1 Nov 2024 17:44:27 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <hlnvrmxos77rw4fftwnyg6q2sfjgvx4vlzdvyuf7kwiuamcvpa@llfuqlijev6t>
References: <20241101014327.513732-1-inochiama@gmail.com>
 <20241101014327.513732-2-inochiama@gmail.com>
 <uzr6gpmyng3irrhuf3q3bvswlbzyxnr74jwccyosplr32ceczu@jjrva67iq4ce>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <uzr6gpmyng3irrhuf3q3bvswlbzyxnr74jwccyosplr32ceczu@jjrva67iq4ce>
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
Subject: Re: [Linux-stm32] [PATCH RFC net-next 1/3] dt-bindings: net: Add
 support for Sophgo SG2044 dwmac
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

On Fri, Nov 01, 2024 at 08:51:11AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 01, 2024 at 09:43:25AM +0800, Inochi Amaoto wrote:
> > The GMAC IP on SG2044 is almost a standard Synopsys DesignWare
> > MAC (version 5.30a) with some extra clock.
> > 
> > Add necessary compatible string for this device.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > ---
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   4 +
> >  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 124 ++++++++++++++++++
> >  2 files changed, 128 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> > 
> 
> I wish patches for review were not marked as RFC. I remember this
> patch, so I don't consider this as RFC... but that's rather exception.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

Sorry for the change to RFC. I was told to switch to RFC as it
has a unmerged dependency since v2. Thanks for your review tag
and apology for the confusion.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
