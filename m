Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 627AA57EA1
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 10:49:51 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2C97AC57B65
	for <lists+linux-stm32@lfdr.de>; Thu, 27 Jun 2019 08:49:51 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D08ABC064FF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 13:00:02 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id x17so6475873wrl.9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2019 06:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8wF7WA98OxDDzb/JbNa9apiKkBno+3E3VvLccD/kQj0=;
 b=OofVqYsQ+uEMxYNp1YF+yKBVLkict2Nn/d9BA5e8W0OtsE9NFZ8TRJcn9YAssJPzRl
 u+Vfrrzmhau1eZTHg+pPk7MGHuBYzJqZ1k/YWaU8ZeBl9HdhIqqm0xz3Dkr4e2t9cbOp
 Ym/bZIgijSOYchiaQpI3SWeBu8WymLXORjdGUKXVIGGRHYQvys+V3v0IeXKPSplpC7+m
 86cisHAXxaKOdjWB5AjG8xpLX5DmqFC2YmiClwaChMpotYUhxJDHocPjcrA+MQlSXZ/+
 9bVaOtF5ig0wINgh310gGStv0Mma+oWgk3H/i3zywRO/JPR0lRad7H98T/QQIDt/hs0i
 PvhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8wF7WA98OxDDzb/JbNa9apiKkBno+3E3VvLccD/kQj0=;
 b=PaK3Xb4NlMll+oZZk6vvAwg4xzxcqJBJBw1Iz690enh4tX1bSU5ZL45omS+ilDAljF
 uvDN6fQnH9+U6TZm855B8Fn9FLgzpO897/PFiP0qVOFhhO7OxyrDj1mwgBKk7l5FIMvC
 X2tDyHDx7XDnEUTYWcvj55RZpz7DGY6plFZbEBgZaX08A7wjR9TXacGLgUB5e0MWGsiC
 NAq4x2IwJ3HBf5tCcRfgAD37Ice1hrCw9plBz7t972uvPGgoR5kRRn3pNY4Kc5pJzTZX
 1YT9egFfeRkV4w4hSFV8totNnsEM/QeEHxW9+cM4VbRrfQ0wjVXSZmgjNHcCBYMJElAv
 cmEg==
X-Gm-Message-State: APjAAAXo0zBJHxyYw5VblOJCzPZAgToN0jN9umDwc+tcE1KRszXnUhgV
 tDA0cwr4BW9Uer4h7ni6B7I=
X-Google-Smtp-Source: APXvYqzkLD+mTM8BMDClKNN7/zxRqd/YuZN3ue53KMZ3dB+TNMWWRlr4iHDFgc2/aBpuwMWHPQmcOw==
X-Received: by 2002:adf:f84a:: with SMTP id d10mr16077615wrq.319.1561122002510; 
 Fri, 21 Jun 2019 06:00:02 -0700 (PDT)
Received: from Red ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 67sm2689625wmd.38.2019.06.21.05.59.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Jun 2019 06:00:01 -0700 (PDT)
Date: Fri, 21 Jun 2019 14:59:58 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-ID: <20190621125958.GA4299@Red>
References: <cover.1560890800.git.mchehab+samsung@kernel.org>
 <7cd1fc25708bc50ee487ef1b301b2528ebe8bb02.1560890800.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cd1fc25708bc50ee487ef1b301b2528ebe8bb02.1560890800.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 27 Jun 2019 08:49:46 +0000
Cc: Mark Rutland <mark.rutland@arm.com>, linux-fbdev@vger.kernel.org,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-mips@vger.kernel.org,
 Harry Wei <harryxiyou@gmail.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Jesper Dangaard Brouer <hawk@kernel.org>, xdp-newbies@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Kevin Cernekee <cernekee@gmail.com>, John Fastabend <john.fastabend@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-serial@vger.kernel.org, James Hogan <jhogan@kernel.org>,
 devicetree@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Halasa <khalasa@piap.pl>,
 linux-omap@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 Paul Burton <paul.burton@mips.com>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, Imre Kaloz <kaloz@openwrt.org>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH v2 10/29] docs: arm: convert docs to ReST
 and rename to *.rst
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

On Tue, Jun 18, 2019 at 05:53:28PM -0300, Mauro Carvalho Chehab wrote:
> Converts ARM the text files to ReST, preparing them to be an
> architecture book.
> 
> The conversion is actually:
>   - add blank lines and identation in order to identify paragraphs;
>   - fix tables markups;
>   - add some lists markups;
>   - mark literal blocks;
>   - adjust title markups.
> 
> At its new index.rst, let's add a :orphan: while this is not linked to
> the main index.rst file, in order to avoid build warnings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/arm/{sunxi/README => sunxi.rst} |  98 +++-
>  drivers/crypto/sunxi-ss/sun4i-ss-cipher.c     |   2 +-
>  drivers/crypto/sunxi-ss/sun4i-ss-core.c       |   2 +-
>  drivers/crypto/sunxi-ss/sun4i-ss-hash.c       |   2 +-
>  drivers/crypto/sunxi-ss/sun4i-ss.h            |   2 +-

For sun4i-s::
Reviewed-by Corentin Labbe <clabbe.montjoie@gmail.com>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
