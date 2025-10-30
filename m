Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DA7C1E1B3
	for <lists+linux-stm32@lfdr.de>; Thu, 30 Oct 2025 03:16:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 354D4C62D79;
	Thu, 30 Oct 2025 02:16:34 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 43224C62D78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Oct 2025 02:16:33 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-340324d333dso540208a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Oct 2025 19:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761790592; x=1762395392;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=skyS+Cuyodx+9RItDMBTIU91z9/i7AQUnbc/OyIR+As=;
 b=b00rKLuTeJBIXEKvZ2gDv04FUL6hTYcO8a8QzcbKJ+qPx8Lr2R7kO+5u/OxQJSSSRT
 tK8lz3PSJIdifAu/5yw1BMs+iDDEHESJWQqPGDlmsHyXdv8m+0fxJzpr714uUGQ4t7aB
 gny1PMt6+XTfvo7ZfxiboSzKpm7hTgMALfBtj9nR3sCIOjA0hKUs1UqrLuLtS1BXxcnn
 HtvFZihUNqx+UMRVGlpS/imScIjCGJc5lBQ+BTJJ36EW18uwALoTLm4k6c3scUpISp1q
 OItMlHG4C84vnHPYifQ4D2LtHavQlCDkAr1JqPbu6A7lww1f0vg+wEuERYX45SJg2eE/
 OTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761790592; x=1762395392;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=skyS+Cuyodx+9RItDMBTIU91z9/i7AQUnbc/OyIR+As=;
 b=srJPKyerf4nYCRWLjSglNAyHjm9uJFNqTNCcyxDEGCERR5rt6uMiDRcd+aYaSpaA6u
 pji/YqZ34dLP4Jio9Mt1j6PZuoznFxtrOPpsJAIwQLSt8k3W7JSCZ72WI8+DB4/YmXAo
 arHQzCNndnHHM6Cc0UORkG7x7DX9n+oUCcTekxyeJcHNsie6n5Ez/LWpw2QzVGlF1Qeq
 4Nr6YbNMSapm1ZUoBWHHxV42T+O6ri7LoUtU2n8TMCT1ldCJJDgKtk1i3xNA3Qt1shi3
 NhUh7/+91iUk4cIpqJ9jlwAHnROyQgakQU45TF+BGvtC89MfrR5dluHOWc8cEY9vhA1I
 m0LQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn1oAStSEB0HxlC8PKtN2BpGUhAWgbcjdEHwizX9YRgB9K8IP4/CQxmyAmhlJmr9p5fxjYVhXphGu8fg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxUL3/t3fGZ608bwgLeDXMHsG/lc3j6WpgRphEOxmI6jiao59CH
 f3ZHsVCq0kRDsF+piU/6oFDywoIvGtusXdeD0h3XjuuXClbzbvrQLOst
X-Gm-Gg: ASbGncs0GnP2xLN3e7y2hmglRpqp/SXZMsxC767qpT9FNikT7WmCsRx+89UgYSaHraC
 FlIAODsL1VXPPwQx0VlMJS+JTJNH0l6m07q5Vg3ABpW/1draI20e49HasB1ay2NFOHTIGJoIMC7
 DJ9bjCAbVTIg6PUOpxxAv9GTwINp0oJ0NCWH9M+xknTbKizONhMvSqlIdpVJBXt9CNEV3eD5HLs
 /x+Sj1hLG0dPjfg4E6TfXMelaYy957BmDtlqnWrFgpLKuuRGBLwwQGTdVUQyXsgoDfsCo9cFYXN
 HG3wfIcBBCJcEZW/TqtDexIOsf9hXWPmIWNirrvBogkT9C3s1KN68Wl5JF4G8FupghV2T2Wp5GG
 4vLXgkAVCfHJNTntq9uSCphnu3CMaF0ItBKD81M8uZ4e2Hez4D+TOgaLKn/3VnjQrlCfV67sKLT
 M=
X-Google-Smtp-Source: AGHT+IFhl6dhnMtg2Ql5+VRs8APrxjowbgOu4JakifHuDRZCkhJocdr+tQp+x3ll8cCXsnDbLGKBuw==
X-Received: by 2002:a17:90b:2d8c:b0:339:ec9c:b26d with SMTP id
 98e67ed59e1d1-3403a25bb3emr6580820a91.8.1761790591601; 
 Wed, 29 Oct 2025 19:16:31 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34050ba1472sm580887a91.17.2025.10.29.19.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 19:16:31 -0700 (PDT)
Date: Thu, 30 Oct 2025 10:16:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Yixun Lan <dlan@gentoo.org>, Inochi Amaoto <inochiama@gmail.com>
Message-ID: <kvkmvw2a7n3zils6rx3casv7slgzvli5cwlukmixly2loju2aw@vsuigze4wgwu>
References: <20251028003858.267040-1-inochiama@gmail.com>
 <20251028003858.267040-4-inochiama@gmail.com>
 <20251030004948-GYB1549833@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251030004948-GYB1549833@gentoo.org>
Cc: Longbin Li <looong.bin@gmail.com>, Eric Dumazet <edumazet@google.com>,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>,
 Icenowy Zheng <uwu@icenowy.me>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Chen Wang <unicorn_wang@outlook.com>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Yao Zi <ziyao@disroot.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, sophgo@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Han Gao <rabenda.cn@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v4 3/3] net: stmmac: dwmac-sophgo: Add phy
 interface filter
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

On Thu, Oct 30, 2025 at 08:49:48AM +0800, Yixun Lan wrote:
> Hi Inochi,
> 
> On 08:38 Tue 28 Oct     , Inochi Amaoto wrote:
> > As the SG2042 has an internal rx delay, the delay should be removed
> > when initializing the mac, otherwise the phy will be misconfigurated.
> > 
> > Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > Tested-by: Han Gao <rabenda.cn@gmail.com>
> > ---
> ...
> > +static struct sophgo_dwmac_data sg2042_dwmac_data = {
> > +	.has_internal_rx_delay = true,
> > +};
> > +
> you forget to address in this version? see
> https://lore.kernel.org/all/ljyivijlhvrendlslvpo4b7rycclt5pheipegx3fwz3fksn4cn@fgpzyhr2j4gi/
> 

Yeah, that's right, it seems like I have forgot too much things.....

Regards,
Inochi
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
