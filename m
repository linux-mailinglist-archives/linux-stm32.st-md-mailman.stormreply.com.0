Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F046CA55CC8
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Mar 2025 02:12:39 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A093BC78F85;
	Fri,  7 Mar 2025 01:12:39 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7A3BAC78F81
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Mar 2025 01:12:38 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-7c04df48a5bso125341585a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 06 Mar 2025 17:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741309957; x=1741914757;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RoTiwV/penO5v76PscVulf4a30dmwygkJIwyLi0333I=;
 b=jFQ4P6P0riCskk7VGLQ6Fnl+Gab0iMd9TIsWUZZQoHYxmChmCswxs2g+YNnru/TJWm
 QENvdQ0hoUNb+KVuDq9JJ3QQLhmDwDpj+K7Qq/fmc/gfiIcH5I+orogNcbxG3gAj03N6
 StUX02CVMrrsFOQUs8BqQqOm6UylVVBxAig+c5nTQeiya9U/9cBx8hsS/hA+/FTKO8Mk
 SzXomUbc/uBi2DQ1m1XLRrXYA8nRpA8gkBrt4YwQLFBOPUDf550SqfSynPtzkOOXcwE3
 jQHV5TxU/2OnI60OxkDehhMvqn94Hm2mu5jKPqVkSdGNSmtB/V/lOtqhkfxZBCZAwoX4
 4voQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741309957; x=1741914757;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RoTiwV/penO5v76PscVulf4a30dmwygkJIwyLi0333I=;
 b=LAvaZrBIAkrIi5JpUtFxJkeFVZJps6S1epS2ZSYsR/V+Wvczk+II/67jO6zI1UBjQX
 3oKDnmDEirKenTo4ZOkN5LqI3QGHU9FPzDgzlt0Q0I3RtvT1IjK5CdQwlZRf1LiMomMw
 U7Eosh/3U7M2q67Q7qY6wt17INuiaiPT4DE/B1iyJRYvSGC+51mKVVPhwxIgx/aBC6HZ
 QdS5m2ncGSKo/bfUYcuX3gpTrJ1wQYK+19v/WngavIyvYlqX7GVE4rmw4gEJomJEXhyI
 OcodvHKcRKd5CsjjxxZdb5T317S6H/d3AqeEdHRc1J/cXPxqD7vcuWKoOwgmZbUGNCqL
 zIlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVYaKnaXntaMpq4sl1K1tAQgT6Kx8OvqpiKEf/zUUN0ITM8sw8ycDzBnCRA3ZV1phTEJQx7gG0iAXYFw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy4k7Vd2DRrzCNEC05AzHjlfmqlL9ZxLb0UbzAxN6ZUpJORBwsW
 p7eXs/piqENnVT94uPwHDQHmcN5tMtNaFTyGihDQMhI1LLZIzRwG
X-Gm-Gg: ASbGncv722ZZZT4NhISLLJdaHKZxiQbrxLK5vE63iWlGI7g6rIIUqvoXgazp8cM9Qcy
 W2/EPsUTIi94L8Cizjojn/APf25zEq3aTHoTI1i0fFYP5hzatnw1dah9koN4Hks8UQ7SsY8asHf
 ax9N7kj02tTwsFlBXDykbsfwDXkQYZ5bzf1f2BEbNQpw1II+d3Q3b1DYheuxvx0VnHJ4Df5oiWW
 20qlxcTD9bdfAJE2w9DHSplkPhNant6UwmqyGQ5fU499JPHSn4A5QtCe/wpQCMfDSm4nawpuzmd
 hFxh868v4/IM+3aqyzB5
X-Google-Smtp-Source: AGHT+IFUBVq3F43PYm5XLqPTMM7AQh1lBI2X72APqLeXMYlSNYjEqY6EGkejol6T0++oyIAOjKb56g==
X-Received: by 2002:a05:620a:6607:b0:7c0:ae2e:630d with SMTP id
 af79cd13be357-7c4e168299dmr213772785a.16.1741309957325; 
 Thu, 06 Mar 2025 17:12:37 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
 by smtp.gmail.com with UTF8SMTPSA id
 af79cd13be357-7c3e54ffa6bsm163770985a.80.2025.03.06.17.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 17:12:35 -0800 (PST)
Date: Fri, 7 Mar 2025 09:12:33 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <ptq4ujomkffgpizhikejfjjbjcg44vyzw4pwbs7kureqqndy6e@alxgdc3qkm7q>
References: <20250305063920.803601-1-inochiama@gmail.com>
 <20250306165931.7ffefe3a@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250306165931.7ffefe3a@kernel.org>
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

On Thu, Mar 06, 2025 at 04:59:31PM -0800, Jakub Kicinski wrote:
> On Wed,  5 Mar 2025 14:39:12 +0800 Inochi Amaoto wrote:
> > The ethernet controller of SG2044 is Synopsys DesignWare IP with
> > custom clock. Add glue layer for it.
> 
> Looks like we have a conflict on the binding, could you rebase
> against latest net-next/main and repost?
> -- 
> pw-bot: cr

Yeah, I see a auto merge when cherry-pick here. I will send a
new version for it.

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
