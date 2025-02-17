Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9389CA3794E
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Feb 2025 01:55:46 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3C77EC78F68;
	Mon, 17 Feb 2025 00:55:46 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1BED2C71289
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Feb 2025 00:55:39 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7c0a1c4780bso11823485a.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 16 Feb 2025 16:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739753738; x=1740358538;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3miERDX1Xv3RedAiXlRskPLUBkRSYFDtnSlJTeyyWT0=;
 b=QH2+kfya3AXYq/BKzLrefK+Cyfh9B3yUAgbOixLyXIpj3y9mXrJCYJ788DwVSsPxkT
 11Ef9FEENYrAjwhKM9L+jriXT6Fg5KZrbL/swJD/5SjVeLtOsW8vswtko3nZfA+AFE9O
 0i0EGUSc9Oyf9XwmZLlzxdTRcA2XU6O5ui/DZOkeXTEqrMzGab1mD7ee33KBrr8RTUe0
 hQlOjO4gbQilSuO1iK6e5BPfvbmHe5Swo1xVJuUZAl7YsYbBqsOXMk/CXU+MLYlXiTWF
 rOF6KHpOrB1+ZAsKdCIrZXEnyxDndDB89NVcgWMwKyeoZElyAa1/reiqBtWRBo49CWgn
 KsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739753738; x=1740358538;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3miERDX1Xv3RedAiXlRskPLUBkRSYFDtnSlJTeyyWT0=;
 b=jxjPrDUO3XB+1ChhCT5K1BVQkw/FDsSEMMoUfXprXlsNUmuZro4QY0dbUXM1mjveSR
 QVvRfXZtLb2ghmlFAqtDIXdZpSLDaj+16V4cX1quPz7g2S5oWvemqP5BM4RSYx1d3YNJ
 /WV3SUZUFTLPe/AiyVI80vn6U4cGs0NIOHJjWZzJYAGiNJCgmdB2kwQi2xl7Tv+qfZyV
 gY7FcmOMlguEm+kiyr/UxMgrzSFe0VM+9B78NJJiunDFm0vLdRdBNwpe+naiWuV3DSJ3
 +IOiiIY7D74lrBWW/dkk6BP82/nwjgR/IgDhen4wYxLFmWfQFL2rQkh/Kgi2N+slrMsN
 bNlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMn+swqZs+0EYjnj9AfQOySUem8ETGeF0U/okx0xUcjXnYlqymVn3jmNeveeKSywg+c0/mNetf2hJUPA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz2dhD9q+AYVqUZ1ti+kfvOz+gHyUUbiuyqMdCLJCELF8ztDoCL
 lnFlQfd94lJwVc52/2Z3xscXHxmHcpjxCs71whhtadxU8zpjMCNK
X-Gm-Gg: ASbGncsd14m4Xval08AZ+kZy65kqw7cU5Lex44Hweg4BSq2a0T1OQYpKtSrDp3ESwmE
 CjIWR+P1JBLs2ZCP1pKSK4+WD1iMZsuQhvOZwGuggtZ8aCmVMHWCn3aX0dCKdyr92yNZYbDIGTy
 Ga4DaL68sLsb8bN3szcpW8SXkql9kjGjC8vLuN5MuF/kJ+UcLKw2gHf9EUTyPUXNyplFWtsBRMh
 5fhq6fiR7xAF/zjUVTsXCFUwkw3WAkSGn3gx35ZA0pGVR8G6RoYQ+eI3F4vUZmWF+s=
X-Google-Smtp-Source: AGHT+IHgsgnwFBgfmCk8QhqZ6tipeWPXEoq+VknthPTSmFHcxqBFyFKlKkuCSkeq1Ol3omy/oe0Xgg==
X-Received: by 2002:a05:620a:8904:b0:7c0:7e88:79c2 with SMTP id
 af79cd13be357-7c08a9c8a13mr1123805585a.22.1739753737957; 
 Sun, 16 Feb 2025 16:55:37 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c09a302b3bsm85445485a.35.2025.02.16.16.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 16:55:37 -0800 (PST)
Date: Mon, 17 Feb 2025 08:55:25 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <o4wyk6rrctm3f36s6gzg3stxyplziwtpdorbfcch434ns5iwso@7f6jikrnxumi>
References: <20250216123953.1252523-1-inochiama@gmail.com>
 <20250216123953.1252523-3-inochiama@gmail.com>
 <9dcab9aa-6d1e-4804-82ff-fb8dfa434df7@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9dcab9aa-6d1e-4804-82ff-fb8dfa434df7@lunn.ch>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Chen Wang <unicorn_wang@outlook.com>, Furong Xu <0x1207@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Richard Cochran <richardcochran@gmail.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Lothar Rubusch <l.rubusch@gmail.com>,
 sophgo@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Drew Fustini <dfustini@tenstorrent.com>, linux-arm-kernel@lists.infradead.org,
 Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org,
 Romain Gantois <romain.gantois@bootlin.com>, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Hariprasad Kelam <hkelam@marvell.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v5 2/3] net: stmmac: platform:
 Add snps, dwmac-5.30a IP compatible string
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

On Sun, Feb 16, 2025 at 05:59:31PM +0100, Andrew Lunn wrote:
> On Sun, Feb 16, 2025 at 08:39:50PM +0800, Inochi Amaoto wrote:
> > Add "snps,dwmac-5.30a" compatible string for 5.30a version that can avoid
> > to define some platform data in the glue layer.
> > 
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Reviewed-by: Romain Gantois <romain.gantois@bootlin.com>
> 
> Ideally, this would be two patches, one adding the
> stmmac_gmac4_compats[] with the existing compatibles, and then a patch
> adding snps,dwmac-5.30a. Logically, these are different, so two
> patches.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew

I will separate them and apply the tag, thanks for reviewing.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
