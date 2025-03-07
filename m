Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA94A55D0A
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 02:20:06 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 77BC3C78F85;
	Fri,  7 Mar 2025 01:20:06 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9E70DC78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 01:20:05 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7c0a159ded2so146827685a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Mar 2025 17:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741310404; x=1741915204;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HxS+VSdF+25Ta0OPbr+oK1VDaaV8dgOLYKtTqCm4wmA=;
 b=UFoH9RSRR1t0X/v3erZ5qKNyerz5edy2nAOr12SJcy7p/pGBnNve9R0AZXS0n6cW6x
 iKRT5Aj/+5MJdr7uU5vNNlHmw/eUBkNawNIyzypWSKXnQbh9DcUN+eM9JWa5KpyJKyGG
 gAQswvJSyxxzTCrcIsXNJrADA9x+YajXJ+xEleQg4HKE23FrIiF6V4tvhAODRSDU/Rqa
 JzPdAYRhh7nGwSW655+XjUNSmm6H8bhqQDDzmRnXwkwfauBokLXltnr9MQf50h+NQtO6
 UrE5Xd4D3WqY48i/Ih6+TgThVdyiNWG+IwbL4gQDajfTBqio2HI4jzYGZsZXY8z3s97d
 /ELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741310404; x=1741915204;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HxS+VSdF+25Ta0OPbr+oK1VDaaV8dgOLYKtTqCm4wmA=;
 b=Mc7qEZ0SkWeDqOc8pOxqYeXx9q3DvHzhX1Wt9wtUxsGgeIzFuu6XLoeocc/pPGwd5U
 oYqkgDtuGNrZxAhngWowwvpje1HTs7wXMdepbUuUTStLHuEOfD3gNHrarwNc/fvaDu/I
 5kAxTotDmMOsxS3BfwO6YMZGp0t9RZfyZyRUNbirtCHCxa5rjIAhaZ0JQiPxwgnOx3Xl
 orqun5GUF2qwckNgV9EXshRzilKACxmLRhYeCw/irP+eqgnN7/kVAynp3bLw3o5U7hs4
 hTUfLXqCmxsT5n/72I3P3DfSaH4RDcbgMDCpVfbuyp6J3bmgstxl0vEDaq9W0r17QJkL
 XkkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbcd6lcMnW8+iQH3zFrtBtlX+I6WSdSMJqkoXoPZSnhnawAkqZImjabxHANwVVxWN37feZXBhhqTpOoA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxwnHv7fQfyTYMKKDsmQoUTgj25mbNJ7igbay7/hpUwauOtgsBH
 HNrO7+OqM4xxoxTjElcW0CXUiKtfFezriZiXFrhkWEQYKQXk9M9J
X-Gm-Gg: ASbGncuD3yoMGBpu2WxeITKPd0rvRbRjEDLdhcHLYA8di/YITRn64Uh9AwlC4do8Vkx
 Nz2CTtTYYd1si9TOtrGRYyKfRQydcGU0jbIEvkUsWeCN8y/kErBdTOd/PS+AR/7/phJ5N7Vff02
 ufBU35i4Mrxfxzohl2fgl0hIz02hArab9aqjxiRyk0OIVKf0EOWO0ugfsrgLF43Dz/41/JxqCcU
 5zQmJ5HndDFn3Fu70O/gHXOgrs1oZCdsM/BNNo4pVX4bPGh5SSBb/jlH28GYvA/x+rh9K+nH0MG
 0lbWSD6lM2QPyGHpXzI4
X-Google-Smtp-Source: AGHT+IGUO6/phCwAva8wDxFUHQEGREx4oP4CpMn1qmy+ZBLZmOEMjsqOLMniC66oleMf4LpqVxo2lw==
X-Received: by 2002:a05:620a:838c:b0:7c0:a0ba:2029 with SMTP id
 af79cd13be357-7c4e6178ce4mr254618085a.40.1741310404496; 
 Thu, 06 Mar 2025 17:20:04 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c3e551181dsm164602585a.110.2025.03.06.17.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 17:20:04 -0800 (PST)
Date: Fri, 7 Mar 2025 09:20:00 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <w7p3jnevmwumcblrkbpot7wpvajgf6enwpl4db5rbme4322hej@mxm54kytlguy>
References: <20250305063920.803601-1-inochiama@gmail.com>
 <20250306165931.7ffefe3a@kernel.org>
 <ptq4ujomkffgpizhikejfjjbjcg44vyzw4pwbs7kureqqndy6e@alxgdc3qkm7q>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ptq4ujomkffgpizhikejfjjbjcg44vyzw4pwbs7kureqqndy6e@alxgdc3qkm7q>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Chen Wang <unicorn_wang@outlook.com>, Furong Xu <0x1207@gmail.com>,
 Jose Abreu <joabreu@synopsys.com>, Paolo Abeni <pabeni@redhat.com>,
 =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Simon Horman <horms@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Lothar Rubusch <l.rubusch@gmail.com>,
 sophgo@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 netdev@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Hariprasad Kelam <hkelam@marvell.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net-next v6 0/4] riscv: sophgo: Add
 ethernet support for SG2044
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

On Fri, Mar 07, 2025 at 09:12:33AM +0800, Inochi Amaoto wrote:
> On Thu, Mar 06, 2025 at 04:59:31PM -0800, Jakub Kicinski wrote:
> > On Wed,  5 Mar 2025 14:39:12 +0800 Inochi Amaoto wrote:
> > > The ethernet controller of SG2044 is Synopsys DesignWare IP with
> > > custom clock. Add glue layer for it.
> > 
> > Looks like we have a conflict on the binding, could you rebase
> > against latest net-next/main and repost?
> > -- 
> > pw-bot: cr
> 
> Yeah, I see a auto merge when cherry-pick here. I will send a
> new version for it.
> 

Here is the new version:
https://lore.kernel.org/netdev/20250307011623.440792-1-inochiama@gmail.com/

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
