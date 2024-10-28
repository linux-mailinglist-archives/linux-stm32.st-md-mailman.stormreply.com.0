Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4515A9B2896
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Oct 2024 08:17:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3ACC8C78015;
	Mon, 28 Oct 2024 07:17:28 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2083CC78014
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2024 07:17:21 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-20ce5e3b116so25156545ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Oct 2024 00:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730099840; x=1730704640;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=l+Lv0cqccltbLrN2cRosIlLw7fZjxncTIQzMOXjL94g=;
 b=cPw6Kt5YPkBtQRNKSR2hOGBZUXZSljB3kvVF3e+zbAvWUrp+VFSaENOX6En4M4/wVj
 EVP3fsDmziHs/AK/BOk1piDuboyACazQDsTyN8g8y3X94asRcC2u/Sb8kgYJea6d5FrE
 DcDEJjZj4xIhv9usUh14//j1fDBW0EfOUr+2JtGAiVedF/q2/oMoudGxq2NsB8/0/rFG
 enohoTmXfTjzeS8DP1qHS43idhN+gJEZD+Inm4I9RIiw+8VVhS9Yn5lZ6sY+7b4nat+f
 OJBF6Ir4TnvKXCwcDfuIhoiOFXe/2uuIU5mhGJ7hNGc+H4s5n8Dy2s5w3E3nHtFCW5T3
 clTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730099840; x=1730704640;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l+Lv0cqccltbLrN2cRosIlLw7fZjxncTIQzMOXjL94g=;
 b=PqbarYcb8vOhPd3Zq5owaq4RacmYFHHxdAz3Z7L0oBAhaxUQpwd01YasUFazlhoXol
 njT1Rr8qNVGiMk/8OKDt/6F5z5QyEmPSuDUZTSAJTlAvv9SrI+Fq2yaqOVGPSzZmXxwS
 SqnyYmTUOT3MB7dWihQ+1JCZltzZ843JYBUM4DLaxcdy7VKlns1JvbfTJ5Zekw7guKCX
 JAiE/ErUI4tpBnISOQcvaKIbUh81C4vY5T+esIpyipC7zhr1PR9FrTJtWuT6yi0ggIzU
 2TxrU5DdEFekrOlqo9J7xmj+WopWAhJjld792fe8kFzy4XqEr3rClHNXnk0JFe+nTy84
 KLOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRrlq8dmD9VdpZpndH0WlCa5nIWPu2tMsD5bHxAXUCVOvNne9ZDSi1p/w6vCRzU6NQsvADCL/IWT3ECA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yytd0leu/pKaPkzS98bCCYXzWgwIRgULtOsIce8n/m0gJxSH9bn
 slE/R/WSn4Wt3RI3kMyzmDR35KJVn7Cc7vhYU+bUtsXfBC6FysEC
X-Google-Smtp-Source: AGHT+IHzWBoCJf/unr9JRCs10+RBX8U2VlT071YJUNmeAJD/FQLj2WyaOuVYdAuzuRY5sIOEG1ACqQ==
X-Received: by 2002:a17:90a:bcf:b0:2e2:effb:618b with SMTP id
 98e67ed59e1d1-2e8f106f63cmr9468469a91.13.1730099839533; 
 Mon, 28 Oct 2024 00:17:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e8e36a4860sm6374761a91.32.2024.10.28.00.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 00:17:19 -0700 (PDT)
Date: Mon, 28 Oct 2024 15:16:54 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <gcur4pgotkwp6nd557ftkvlzh5xv3shxvvl3ofictlie2hlxua@f4zxljrgzvke>
References: <20241025011000.244350-1-inochiama@gmail.com>
 <20241025011000.244350-3-inochiama@gmail.com>
 <4avwff7m4puralnaoh6pat62nzpovre2usqkmp3q4r4bk5ujjf@j3jzr4p74v4a>
 <mwlbdxw7yh5cqqi5mnbhelf4ihqihup4zkzppkxm7ggsb5itbb@mcbyevoat76d>
 <8eeb1f7c-3198-45ac-be9a-c3d4e5174f1f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8eeb1f7c-3198-45ac-be9a-c3d4e5174f1f@kernel.org>
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

On Mon, Oct 28, 2024 at 08:06:25AM +0100, Krzysztof Kozlowski wrote:
> On 28/10/2024 00:32, Inochi Amaoto wrote:
> > On Sun, Oct 27, 2024 at 09:38:00PM +0100, Krzysztof Kozlowski wrote:
> >> On Fri, Oct 25, 2024 at 09:09:58AM +0800, Inochi Amaoto wrote:
> >>> The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> >>> with some extra clock.
> >>>
> >>> Add necessary compatible string for this device.
> >>>
> >>> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> >>> ---
> >>
> >> This should be squashed with a corrected previous patch 
> > 
> > Good, I will.
> > 
> >> (why do you need to select snps,dwmac-5.30a?), 
> > 
> > The is because the driver use the fallback versioned compatible 
> > string to set up some common arguments. (This is what the patch
> 
> Nope. Driver never relies on schema doing select. That's just incorrect.
> 

Yeah, I make a mistake on understanding you. For me, I just followed
what others do. But there is a comment before this select.

"""
Select every compatible, including the deprecated ones. This way, we
will be able to report a warning when we have that compatible, since
we will validate the node thanks to the select, but won't report it
as a valid value in the compatible property description
"""

By reading this, I think there may be some historical reason? Maybe
someone can explain this.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
