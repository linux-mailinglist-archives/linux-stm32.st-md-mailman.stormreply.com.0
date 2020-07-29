Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA060232601
	for <lists+linux-stm32@lfdr.de>; Wed, 29 Jul 2020 22:15:36 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 76A76C36B29;
	Wed, 29 Jul 2020 20:15:36 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BB846C36B25
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 20:15:34 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id kq25so12694728ejb.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 29 Jul 2020 13:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ouwd0qsnQ1Adj/+zRaVzdVpCm+8h05KMUp30fVnhcA8=;
 b=rSyd2wylwUx2qLOZYrsWXhNwszVrWgTnK21tsZ1j8iteqEim5ibbhQrHjjukxE1yuW
 keF3581+dZrNrE0JDBxzodsW+5JOQwQQCEbezKHQey92/VetALJtxo+VU5xg1yGSk7nM
 jTYaSgMVfIKYgiHrZUDw52MZmKFXJk/8ziFHbjsHjSohLShk8z0L+DAyFQZdVigcrGx8
 HMKC6//Oh2xnrhzjlknKGqJBpw09YJ9ZsLMd19Hsp1cPhsNeCBHztG9SUYBmeqTWxkZG
 B8BeZpwvs2fdEcIzlLTdwVhe8oqaWc78gz2RZo3D9UrEq5m2fVQhtUlQxBiv4tXvkeXn
 M9tA==
X-Gm-Message-State: AOAM531AuDF2FiiSwsSLsMgPE4fhWnf5KFDyUndK06XAxlqUUtcIhXWR
 9ZBjoZmql6w7eP2BYcjsi1E=
X-Google-Smtp-Source: ABdhPJwzrwf3LW20eQQQ23yUjSgwrzDTiF8v8xCprZhLNGtK2AACk3VnEMiEQ8SoXRyfDGmBo2eFdQ==
X-Received: by 2002:a17:906:5013:: with SMTP id s19mr96306ejj.26.1596053734270; 
 Wed, 29 Jul 2020 13:15:34 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
 by smtp.googlemail.com with ESMTPSA id qc23sm2624999ejb.97.2020.07.29.13.15.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 13:15:33 -0700 (PDT)
Date: Wed, 29 Jul 2020 22:15:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200729201530.GA26917@kozik-lap>
References: <20200729160942.28867-1-krzk@kernel.org>
 <CAK8P3a38VC5UD+1HHRFWnafM7ZLMc34Ay23FUCjjgiz46SCV=A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a38VC5UD+1HHRFWnafM7ZLMc34Ay23FUCjjgiz46SCV=A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Sylwester Nawrocki <snawrocki@kernel.org>,
 Cedric Roux <sed@free.fr>, Russell King <linux@armlinux.org.uk>,
 linux-stm32@st-md-mailman.stormreply.com, Lihua Yao <ylhuajnu@outlook.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Guenter Roeck <linux@roeck-us.net>, Sergio Prado <sergio.prado@e-labworks.com>,
 LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Simtec Linux Team <linux@simtec.co.uk>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Vincent Sanders <vince@simtec.co.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>
Subject: Re: [Linux-stm32] [PATCH 0/7] ARM: samsung: Cleanup of various S3C
	bits
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

On Wed, Jul 29, 2020 at 10:01:26PM +0200, Arnd Bergmann wrote:
> On Wed, Jul 29, 2020 at 6:11 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Hi,
> >
> > I tried to cleanup few warnings in S3C machine code which lead to
> > finding some bigger issues.
> >
> > Patches touch mostly the ARM Samsung machine code except patch #1 (clk)
> > and #5 (watchdog).  They are independent from each other, except
> > some conflicting lines.
> >
> > The last three patches would welcome some testing... as I did not
> > perform such (lack of S3C hardware).
> 
> I have an older series that I mean to repost. Please have a look at
> the s3c-multiplatform branch of
> git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git
> 
> The patches in there need to be rebased on a newer kernel, which
> should be easy, but they will conflict with your work. If there is
> anything in there you can easily pick up into your series, please
> do so.

Indeed now I remember you were doing it some time ago but a follow up
never happened.  I can take a look and either cherry pick or even take
over the series.

Best regards,
Krzysztof

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
