Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 139CB802C82
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 08:55:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AAA43C6DD68;
	Mon,  4 Dec 2023 07:55:36 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8C66C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 23:12:30 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-77d63b733e4so145697585a.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Dec 2023 15:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1701472349; x=1702077149;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a50PSVMEXWIrlF9Tli8fOmbsqWneSFikUwGhyJPwIGY=;
 b=EX1ax4/qK5EWSecrNrAvYL/Ce458N0fKV+cOkWzEsJIE7Ky/UhWgcUcxRpE7mvdjcX
 rjhySLpF2vZiO8kQwnLD/tt3HJwBh4UvTaCnDPTC+eXloKqCf3IQBGAyf4ftbb5N8pDV
 qRdNoZes0fZGmWcND74lNNPWvIsh5e85AsXHgDcdX3J/FomuM5LS/9qeksE3Yqke+YEJ
 KaT/WrFHdd5xv7pOO1x2SHWHQTWvLTKSgwTG83zuRl/LemzsDZlPdOtQMj90sKekABSK
 U7QmCe1fQAz0kjVZSXC71jELgET5Yz1pIxTmCt0w9a+PoMMVfm8BDNNeejYw3N+CpRFf
 F3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701472349; x=1702077149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a50PSVMEXWIrlF9Tli8fOmbsqWneSFikUwGhyJPwIGY=;
 b=OPAoPBkXkcqKpHmG3IysEmZOqUGDUMEh5NCoARJRttYs/vvS2YLO1EkHolp81Sc1IG
 ZcTxZYqVvVqSprbuS1pfkCyE9bq00eHJ3H9eDw6DTub+pU7HZW8qf4AMz8k9VNnskTLx
 71GLZ7G+gJ9zW6IdqnXWJVLU9YkytBOpNqTmYeJxOQ/1T6vWG+YOtsTeyJt3MtzjacZJ
 +qx7lGhq1gGnbi3ost8FjIu2twa3xeh3s7lD4DSyaE+YtbxLTvlcTotEXNyVBT3fYvP6
 8r9drtdV5CgWQkHdV9P0pOH/ff6vAq2IdAs8ncXUy7MDPoqdNbj3IC2u5pTD1HJUg6wu
 012Q==
X-Gm-Message-State: AOJu0Yz+CN+eSZrN/MbrnDiGIV64NH1lHrH3hL8Wxw6700wztZu/4GvB
 t+SQF2watpwE3or7DiK7aJbYoA==
X-Google-Smtp-Source: AGHT+IF3Z3/RzfTwbCTpw0iP7Wf8/w6zwvmRXwU6DVH7OKN9elzjeew+laW1/G83KjRpnw/aIrbT5g==
X-Received: by 2002:a05:620a:8209:b0:77d:9fde:23e2 with SMTP id
 ow9-20020a05620a820900b0077d9fde23e2mr343467qkn.20.1701472349734; 
 Fri, 01 Dec 2023 15:12:29 -0800 (PST)
Received: from dell-precision-5540 ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 bq42-20020a05620a46aa00b0077d6443ae82sm1910778qkb.83.2023.12.01.15.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 15:12:29 -0800 (PST)
Date: Fri, 1 Dec 2023 18:11:36 -0500
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <ZWpoKEcM0ZeYAsBa@dell-precision-5540>
References: <20231201214014.2539031-1-ben.wolsieffer@hefring.com>
 <b070eb2a-05d7-4e6a-8de9-15179045d192@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b070eb2a-05d7-4e6a-8de9-15179045d192@sirena.org.uk>
X-Mailman-Approved-At: Mon, 04 Dec 2023 07:55:34 +0000
Cc: linux-kernel@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: enable controller before
	asserting CS
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

On Fri, Dec 01, 2023 at 09:50:33PM +0000, Mark Brown wrote:
> On Fri, Dec 01, 2023 at 04:40:14PM -0500, Ben Wolsieffer wrote:
> 
> This feels like it'd be a good fit for moving to runtime PM - that way
> we avoid bouncing the controller on and off between messages which is
> probably better anyway.  The driver already does pinctrl management for
> the device there.

Yes, that probably makes sense. There are a few bits that can only be
configured while the controller is disabled, but it doesn't look like
that applies to any of the ones set in stm32_spi_prepare_msg().

I'm a little hesitant to make big changes to the driver since I can only
test them on an STM32F7 though.

> It also occurs to me that this isn't going to work for devices which
> chip select inverted - for them we can't stop driving chip select at all
> since they need it held high when idle.  There aren't that many such
> devices and it'd loose us the PM which is rather awkward...  I guess
> that's an incremental issue with a more invasive fix though.

The driver only supports GPIO chip select rather than native, so I don't
think this is a problem. Also, I don't think there's any difference
between inverted or uninverted here. They both either need to be driven
all the time or have pull-up/downs.

Ben
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
