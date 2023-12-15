Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8098E815380
	for <lists+linux-stm32@lfdr.de>; Fri, 15 Dec 2023 23:22:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 38E65C6DD6D;
	Fri, 15 Dec 2023 22:22:56 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A6BCCC6DD6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 22:22:54 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id
 af79cd13be357-77fbab92df6so27974085a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 15 Dec 2023 14:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hefring-com.20230601.gappssmtp.com; s=20230601; t=1702678973; x=1703283773;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=7TFw7xg7w2M+8qc28EqEusL4T4Plz+lf2upO0JPQgw0=;
 b=hsos7eDlkUI+vY/W2o5YCOfioCMGN52JoMrJ1I8CD5WyOGIHkEHv52qReb+shWQ7wp
 wl8FFHbye1OzxnLGu1JbLHBZFrlTicL8XDnYmevXM5XIkMG+xQHdNJjXM2NBXKMwvJrn
 jwkYaGyanZPXc9Yrjnq9Z23Ey+lbmsxlAi4m4LhH8aaZ4/bU7dR/57B//AMwyppY5I3M
 MRmrGdvlynrthhu9fMwPCHBx9KjWpOtCvdbJQNbg7tf12BmefhFq73rChuR9ha18Ad+S
 q09PXGn0RbFsw25RaZZW5L3E8Ab0mHsNsJ4a7OwywYVTD0FDDFPKQQ6lMTve6MtMpSTS
 qFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702678973; x=1703283773;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TFw7xg7w2M+8qc28EqEusL4T4Plz+lf2upO0JPQgw0=;
 b=RD3xiPOoLLFsXOIqcS5OLsbomrxU1QUvaHo8cQO9ZwBdejq7zDgX3WgRUC1e5IdyDa
 1fimIlYGSnYNcilDIkHlGUeL3PVA4q5RZBL9G63TqyzgU4H+025BP0tFNbAbDfP0vc0N
 Bqu0cG6E38H/xtJjYPYquYKWpgmlfoyhL2QQyfKyVj9N31/1tXMJJ9YnAS3vVC69mQsO
 3v3UgZFVdBH58p0rld+Iy0b2vpYTuaM5SCBOyNLAPkJLOYEF9w2o26dduJdOsca9qM6j
 MAUvwvp86hLNlnniESx47W9wG8eP6/QyKgLUzS5ifEk735vtsWVaFCjgeENq5vTBCSOw
 znmw==
X-Gm-Message-State: AOJu0YySmvSxvjcS5Jp9HW0vXYwIDCoeeBEaVY4wy4odvSSiWoc1BitL
 cZGVY++mYPExZZ8QgBdYPKTA4A==
X-Google-Smtp-Source: AGHT+IEJekFwo4r+H8PtOrZH0hYzvRpj9POtATtBQr7tyBiNEDTS/FAF2UzeUfuDf/WaBoIwrOUJ3A==
X-Received: by 2002:a05:620a:146d:b0:77f:878:b58 with SMTP id
 j13-20020a05620a146d00b0077f08780b58mr14261801qkl.153.1702678973632; 
 Fri, 15 Dec 2023 14:22:53 -0800 (PST)
Received: from dell-precision-5540 ([50.212.55.89])
 by smtp.gmail.com with ESMTPSA id
 m1-20020ae9e701000000b007759a81d88esm6333130qka.50.2023.12.15.14.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 14:22:53 -0800 (PST)
Date: Fri, 15 Dec 2023 17:22:03 -0500
From: Ben Wolsieffer <ben.wolsieffer@hefring.com>
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Message-ID: <ZXzRi_h2AMqEhMVw@dell-precision-5540>
References: <20231204202055.2895125-1-ben.wolsieffer@hefring.com>
 <58897511-3187-4583-bf29-11871dd4d136@sirena.org.uk>
 <20231215182739.GA96945@gnbcxd0016.gnb.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215182739.GA96945@gnbcxd0016.gnb.st.com>
Subject: Re: [Linux-stm32] [PATCH] spi: stm32: use runtime PM to
	enable/disable controller
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

On Fri, Dec 15, 2023 at 07:27:39PM +0100, Alain Volmat wrote:
> Hi,
> 
> sorry for the delay.
> 
> On Thu, Dec 14, 2023 at 10:58:54AM +0000, Mark Brown wrote:
> > On Mon, Dec 04, 2023 at 03:20:55PM -0500, Ben Wolsieffer wrote:
> > > Instead of disabling the SPI controller between each message, do it
> > > as part of runtime PM.
> > 
> > This doesn't apply against current code, please check and resend.
> 
> I rapidly gave a try on this patch on top of the spi/for-next branch
> (manually fixing the conflict due to the MASTER->HOST renaming).
> It turns out that with that applied, transfers on the MP13
> (compatible: st,stm32h7-spi) are not working anymore while simply
> removing it back it works again.
> (test is simply doing loopback spidev_test)

That's unfortunate; I was worried about something like this because I
only have an STM32F7 to test. If you can't easily determine what's going
wrong, it would be interesting to know if the original version of this
patch has the same problem:
https://lore.kernel.org/lkml/ZWpoKEcM0ZeYAsBa@dell-precision-5540/T/

> 
> spi mode: 0x0
> bits per word: 8
> max speed: 500000 Hz (500 kHz)
> TX | 8D D6 73 8B 9D 8B 1C 7D 8D 80 EC 32 F9 0D BA AD 9F 88 A5 9B 3F AA 48 8C 21 35 0D C1 C8 E5 6A 81  |..s....}...2........?.H.!5....j.|
> RX | 8D 00 00 00 D6 00 73 00 8B 00 00 00 9D 00 00 8B 1C 00 00 00 7D 00 00 8D F9 00 00 00 BA 00 00 00  |......s.............}...........|
> 
> The RX data contains lots of 00 between each byte.  Moreover it seems
> that with this patch applied non-dma transfer (when there is no dmas
> properties within the node) are now failing.
> 
> I'll check that and give more details but could you avoid applying this
> patch for the time being ?
> 
> Thanks.
> Alain
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
