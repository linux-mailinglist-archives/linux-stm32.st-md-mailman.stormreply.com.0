Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A281803ED5
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 20:54:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C7F5AC6C855;
	Mon,  4 Dec 2023 19:54:55 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BFC9C6C841
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 19:54:54 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-423dccefb68so49638911cf.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 11:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1701719693; x=1702324493;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JGHpcniqj4N4OVIiCaIFNQVtHMVvgMth5+0aM+Fp7ss=;
 b=1uxjVZWrLynehFLwMq3M3lW08XCmEgDUt4VQ34YQ1B8D5x0HuuAK2lbPlB9qw1Vmzv
 TRRcl3Bj3HlHGGRH7nRsK2LhSBuMFEfdp8bBRWgAM23nnCIQF8nHoP0f553tSVLsAxni
 MEptvFw3kJKPk4b95wKsL14StdLrynBVpQ7fCZEEXxEvjReDbciEFTe7ztbN9mlayafS
 OJ3YJurLw/sq4R2zpRy5E7gI1kywhpZqSXb17RGgKwYHvWXgblAC9g5xzr3R/K2tmlha
 vUUQFs5rT2d49VkH139OGrkhc1fxnelmsMKH/eSlFh9PKNjEkypYMO/PAm9hShEUhVLH
 p4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701719693; x=1702324493;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JGHpcniqj4N4OVIiCaIFNQVtHMVvgMth5+0aM+Fp7ss=;
 b=uWoqepdL98CD9hWThU+BoEqnsyiAsX6SFzdUb2u+4nHYamp0X13yHMc0Ic6pWyrkuM
 +kQ3AyCfz8bXssr1PtXV3fmIHHCiltScLXUlXKpq/rPOn4Kd8B2bVrYW4+6BAbJncJm6
 W9yBULmHOoZnSp3c2NaFvsFKfnUVIq2WkVS63L082TqKHfcCMA6QAvlgCnZchYYWSI7T
 5g85hgSTSWXxRYZEQ2bV0pGNwleSbThfi7xkoS1/ocxfizvWWOStH/rH/ZX/1/zh2Z34
 cL8hDGzLIvGzH25eOC1fWoI/xze2HRmPRh4+24vHQUu6B7ji74EicwmNru0vN0H36MQZ
 trtg==
X-Gm-Message-State: AOJu0YzCtprwA063qNyx9nKHRf5YT9s9VOTI4XDGJJzcqX+kOQND4ZPF
 5xJqdAolmVvLx/dvEMOJwQB8/g==
X-Google-Smtp-Source: AGHT+IGpQzkoEjzpqYLjRrG6QQOYQ6WgA8JZOQ7QLOJykpYca9iIy4BV9JC0iVY98WV8uaPFAB+4KA==
X-Received: by 2002:ad4:58e5:0:b0:67a:c4d9:dc15 with SMTP id
 di5-20020ad458e5000000b0067ac4d9dc15mr18233qvb.43.1701719693130; 
 Mon, 04 Dec 2023 11:54:53 -0800 (PST)
Received: from dell-precision-5540 ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a0cdd8b000000b0067ac1c30e80sm1459715qvk.120.2023.12.04.11.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 11:54:52 -0800 (PST)
Date: Mon, 4 Dec 2023 14:54:00 -0500
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <ZW4uWBpEc2_4JR2b@dell-precision-5540>
References: <20231201214014.2539031-1-ben.wolsieffer@hefring.com>
 <b070eb2a-05d7-4e6a-8de9-15179045d192@sirena.org.uk>
 <ZWpoKEcM0ZeYAsBa@dell-precision-5540>
 <9aa5e049-bd1c-41a6-b9b8-037ebb4f54b8@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9aa5e049-bd1c-41a6-b9b8-037ebb4f54b8@sirena.org.uk>
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

On Mon, Dec 04, 2023 at 12:43:42PM +0000, Mark Brown wrote:
> On Fri, Dec 01, 2023 at 06:11:36PM -0500, Ben Wolsieffer wrote:
> > On Fri, Dec 01, 2023 at 09:50:33PM +0000, Mark Brown wrote:
> > > On Fri, Dec 01, 2023 at 04:40:14PM -0500, Ben Wolsieffer wrote:
> 
> > > This feels like it'd be a good fit for moving to runtime PM - that way
> > > we avoid bouncing the controller on and off between messages which is
> > > probably better anyway.  The driver already does pinctrl management for
> > > the device there.
> 
> > Yes, that probably makes sense. There are a few bits that can only be
> > configured while the controller is disabled, but it doesn't look like
> > that applies to any of the ones set in stm32_spi_prepare_msg().
> 
> > I'm a little hesitant to make big changes to the driver since I can only
> > test them on an STM32F7 though.
> 
> It doesn't seem much more complex than what you're already proposing.

I'm working on a new patch that uses runtime PM and will submit it soon.

> > > It also occurs to me that this isn't going to work for devices which
> > > chip select inverted - for them we can't stop driving chip select at all
> > > since they need it held high when idle.  There aren't that many such
> > > devices and it'd loose us the PM which is rather awkward...  I guess
> > > that's an incremental issue with a more invasive fix though.
> 
> > The driver only supports GPIO chip select rather than native, so I don't
> > think this is a problem. Also, I don't think there's any difference
> 
> So mentioning the drive seems a bit confusing then?

Yes, I should have been more specific in the patch that only MOSI and
CLK float when the controller is disabled and that CS remains driven.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
