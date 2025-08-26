Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0A9B351D3
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Aug 2025 04:42:34 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BF30FC3FAD9;
	Tue, 26 Aug 2025 02:42:33 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D9F56C3FAD8
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Aug 2025 02:42:31 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-76e2e88c6a6so4440073b3a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Aug 2025 19:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756176150; x=1756780950;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xR6DYc89vuHriP+8uKQP0na1daOwB9mmorwHUhrAVP8=;
 b=Hq1ICZSFTWmZ+5gGBjejDHDHilcDHxOOfdjiZZsZXoUSo58o2zjoGzAdxMu2dpvOps
 d8e2f8tEdXEom9ZkM24gjqeBVjpwsCVWgAnpz3DGsR0Ugd9iuT2xkoNDfD+h3Bq2PsMo
 qdCUjOJtEOAVl8oVZU+lGtGO8Qb5SWfnlypzP6lkrUZDb4WKcCcUiRumAxKMf+7FeGHh
 K5q9d4PplOtnwnEl0P7aZYMhBK53eaNbUQPaeCQFH2VpJnl8Lx0nKBgFQo1VPGrikAHO
 MGq+ZqGBhe9boyzQoo7w/tnUiIMzOAF4Go75P7yqhHw7Ua2TzhYrgr0RVqG+egNJg5Xi
 5ChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756176150; x=1756780950;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xR6DYc89vuHriP+8uKQP0na1daOwB9mmorwHUhrAVP8=;
 b=Tu62vArk69ACY4xpaSW4tNL3qxSxb1tUJfc1KDcMxocMsLA49aYhXn9vX523Jil2Mi
 cTESlL2/fAyZPoYAilt7h95gF/k2e3u2mTfkx2nWdB8QEHXLh3Gv+sIauRhM7Si2k9ix
 btbsmyY8BPog+1sJg1KW8YSHCihSuPJ+PXhEiyZnCiz3xk86KwBVdUAnhilZ91tgIWGc
 QMGXSzovP+cakihBKTONK/ZVloa6frQT0fZDwa6Dp+mX7ztl9WHiJR5MVjBZ0qI/8Q43
 O7O9XBw4pyaENi3IMx4FRNXjfQnW280VhNYpOMynW14jGwNERICzdvGNFB4TfLTkkPzB
 9gKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC4I4B+JHEDn187xsLLL4ZfL9BaRFxq6fQJiu3+Vx8RITqDMJpC3ORcE+9s1L3jwy/cytUzU8jZZwn1w==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxPN7LgRVZ829MtpH7OLPc8Pbeqpypok9wcHTky3YuoO7NmohuL
 vezyGsp2ODAxnnb1QokTpkVzjhKz47oBsqLtjzyZDrQN1BdAaMgutT56
X-Gm-Gg: ASbGncuwcs7eQUFxjVOgZ68hhk3vEUhOKr3Go8F8wlV784vfe0sXRhllam/lRLvg8cb
 zaSngB5L0qbBNoExwp/ERrEGaP8qLqgiZrpwOPd0GpFkghCvQJ7lZxGt4UTb0xFMhLJDNBtcdKx
 rcCkmMrLCPM9EmFiJvOE4h8r8Raid6OoDPa21oAS6L4BTrfZwu7b/uOt6+td+eKsSZwzMTttLfq
 W4a5v9or9tvPHi2CjdtUZb4qf0kxHkFx6Y0uMmArUeIQlKK27auM38bNqgJfubSOQhGDdw1cFij
 CXewJupUMkRIk2eBziYKWDYJqXGtT/4pLgfxSJoaVEXQp+dUMejp8v56FFVkdXa7/S89K1BStin
 OwvVRQVVY0b7sRrCCRyo/l1I=
X-Google-Smtp-Source: AGHT+IFpXXOz6jvKmc98oCi1NCiBQLg+bmp0DWJBuKZIBlouXbVcIiSBZxDk5lZs14cKqzF4SAkDxQ==
X-Received: by 2002:a05:6a20:258c:b0:23d:ded5:12b9 with SMTP id
 adf61e73a8af0-24340d91d6fmr19374286637.32.1756176150053; 
 Mon, 25 Aug 2025 19:42:30 -0700 (PDT)
Received: from dixit ([2401:4900:1c42:3335:1f6f:7d68:6bb2:7634])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b49cb8b4b98sm7835430a12.19.2025.08.25.19.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Aug 2025 19:42:29 -0700 (PDT)
Date: Tue, 26 Aug 2025 08:12:11 +0530
From: Dixit Parmar <dixitparmar19@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Message-ID: <aK0fA4QnFKH5AQas@dixit>
References: <20250822-enomam_logs-v1-0-db87f2974552@gmail.com>
 <20250825093150.3ba23f2a@jic23-huawei>
 <20250825123919.3c228ef7@jic23-huawei>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825123919.3c228ef7@jic23-huawei>
Cc: imx@lists.linux.dev, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org,
 Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Haibo Chen <haibo.chen@nxp.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 David Lechner <dlechner@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Michael Hennerich <Michael.Hennerich@analog.com>, Ray Jui <rjui@broadcom.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-samsung-soc@vger.kernel.org,
 Cai Huoqing <cai.huoqing@linux.dev>, Andreas Klinger <ak@it-klinger.de>,
 linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>,
 Support Opensource <support.opensource@diasemi.com>,
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [Linux-stm32] [PATCH 00/10] iio: Drop unnecessary -ENOMEM
	messages
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

On Mon, Aug 25, 2025 at 12:39:19PM +0100, Jonathan Cameron wrote:
> On Mon, 25 Aug 2025 09:31:50 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Fri, 22 Aug 2025 09:19:48 +0530
> > Dixit Parmar <dixitparmar19@gmail.com> wrote:
> > 
> > > The drivers do not require their own error messages for error
> > > -ENOMEM, memory allocation failures. So remove the dev_err
> > > messages from the probe().
> > > With these patches, all the iio drivers now has uniform handling
> > > of the -ENOMEM while device_allocation and trigger_allocation
> > > calls.
> > > 
> > > Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>  
> > Series looks fine to me, after the minor tweaks to commit messages
> > that Andy requested.  However as it touches a lot of drivers
> > I'd like to leave it on list a little longer.
> 
> I changed my mind after taking the dev_err_probe() series earlier.
> I'm rather too busy at the moment, so clearing this out now will reduce
> what I need to keep track of.
> 
> Fixed up the () that Andy asked for in commit messages and applied
> to the togreg branch of iio.git, pushed out initially as testing.
> 
> There is still the rest of the week (probably) in which I can add
> tags etc if anyone wants to give them before I push that out as
> a non rebasing tree.
> 
> Thanks,
> 
> Jonathan
Thanks Jonathan.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
