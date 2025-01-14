Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DCD6A111ED
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Jan 2025 21:28:54 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B525BC7802D;
	Tue, 14 Jan 2025 20:28:53 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31CC6C6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 20:28:46 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43637977fa4so6426285e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Jan 2025 12:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736886525; x=1737491325;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IS4Wxdv2z85JzVf37y1D36qgWJoPNxZK2y7SNaI2jos=;
 b=fk8PzIybDT/uGuj3gi2wx8l0CPiGYgZIAV6JDXjOw7jZQw/kXr8hh0XdpdrV/sMrZG
 lyULqjYDn0IoARsEePNjMliLquvpZEtEWvUt2XoMLKOamrUly4M8CGcQtX5FatMUBF+c
 5lVtMkZ06J8IW3VatIVVmlyld42b+qYqL9Dys4lKMBOf6hAM6pXj99hv2M+HrSXI2XGR
 9RQMO4C3jr3okKXVFv8VsJdVDbsFPsr5xsSgTp6kblJgk5vfru4hq0TosbN0EEZ5CQ3m
 ZiDdfjTdBO40qpkcFboC6EBgjlC4AQWfuEFnqa73Gltqbw5NM8EzEyjEI9kQ8cuSdsY1
 NuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736886525; x=1737491325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IS4Wxdv2z85JzVf37y1D36qgWJoPNxZK2y7SNaI2jos=;
 b=tMYa15bl/mABmX1Ck158Aa/e/i6NpDmU7LR5GG5rVxEo7APiUyGScd9BuHELRmOanp
 I4BkzAxLUWaM0IX3t78gLBIzcD4Xd9zuKIFiykrf4F0gh5GcIWfAc9PBwuV9wPN7qx+I
 7dsGrHOioWoB9BIjCCnrrqaTKNcE8AFwpjZXpmnzijImJ3GUZtn6IS3GLgpp1gF5Qvme
 83jM7YL1n77igs27rJOMxkpLstoQ4eE+AoIomtxA9uPYxchrbtbnc6DkP+KITwKoRnMW
 yU4Rtk1khBfJ43i4VJIc5hr/itiEHzezGR6amtfkP0xXlwQ3T1AyOtevMK6/rtpB5Syu
 pjpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWn+QXt1Eetl/RRnZv+weIaGyOmYPsezjpNDGiDnSjOYtSNQ+/ktb6wFuTzTOInCc8THw8HJDM1CF+bzQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyIzRWcu7I03Ncqjkp3XVsLKRNkzNkSVwNMmQVzLyeKB4qiUFff
 XCzH1/9BmZXgTVGsaJ1RI5evZN+O8L1FWgn/r1eRS+t6UyS+NeG9
X-Gm-Gg: ASbGncskYrdZ2/qfknL136KU7SVYvlOD+P4e1Xw6JpeF2ufFySKF0HSvc9pIsTmUiWV
 9JmRN+y+n6yhhfjcpirLxLkh1z2DYmJ9zu1ohP2zvK30GJ7Ad9lESZ5oPwH3GO9VEDtU2cQfKfl
 S0jHcttBswAVAKO4XfIw4nPNLxCQozCNmylh0HScchnOaROLfcbxm5G5jp11rf1cLa7w+iVIhUQ
 MW1W90E3nlnlGCOJyKrvkiTZdUmxkqDrdDNxBmpJNYM
X-Google-Smtp-Source: AGHT+IEU33fIHNbn/okRr8JUsVv3C++gKoC0+f27tclkArtV3nUfl1Wc1JVN9bZrD1YIOmFn/4buBw==
X-Received: by 2002:a05:600c:4fd6:b0:434:f5f8:22cd with SMTP id
 5b1f17b1804b1-436e25603fdmr82902975e9.0.1736886525263; 
 Tue, 14 Jan 2025 12:28:45 -0800 (PST)
Received: from skbuf ([86.127.124.81]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e92f7bsm222377555e9.38.2025.01.14.12.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2025 12:28:44 -0800 (PST)
Date: Tue, 14 Jan 2025 22:28:42 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20250114202842.yeevjylh6566wiwm@skbuf>
References: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
 <E1tXhVK-000n18-3C@rmk-PC.armlinux.org.uk>
 <20250114192656.l5xlipbe4fkirkq4@skbuf>
 <Z4bC77mwoeypDAdH@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4bC77mwoeypDAdH@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 UNGLinuxDriver@microchip.com, Bryan Whitehead <bryan.whitehead@microchip.com>,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH RFC net-next 10/10] net: dsa: allow use of
 phylink managed EEE support
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

On Tue, Jan 14, 2025 at 08:02:55PM +0000, Russell King (Oracle) wrote:
> > What is the reason for including this patch with this set, where
> > it is of no use until at least one DSA driver provides the new API
> > implementations?
> 
> No criticism against you, but I guess you didn't read the cover
> message? I tend not to read cover messages. I've been wondering for a
> while now whether anyone actually does and thus whether they are worth
> the effort of writing anything beyond providing a message ID to tie a
> series together and a diffstat for the series.
> 
> Here's the relevant bit:
> 
> "The remainder of the patches convert mvneta, lan743x and stmmac, add
> support for mvneta, and add the basics that will be necessary into the
> DSA code for DSA drivers to make use of this.
> 
> "I would like to get patches 1 through 9 into net-next before the
> merge window, but we're running out of time for that."
> 
> So, it's included in this RFC series not because I'm intending it to
> be merged, but so that people can see what DSA requires to make it
> functional there, and provide review comments if they see fit - which
> you have done, thanks.
> 
> I'm sure if I'd said "I have patches for DSA" you'd have responded
> asking to see them!
> 
> Of course, I do have changes that will require this - mt753x - but
> that patch is not quite ready because this series I've posted has seen
> a few changes recently to remove stuff that was never settled (the
> LPI timer questions, whether it should be validated, clamped, should
> phylink provide a software timer if the LPI timer is out of range,
> etc.) That's more proof that text in cover messages is utterly
> useless!

Ok, for your information, I had read the cover letter in its entirety,
including the paragraph which you are highlighting here again.

I still find it of limited usefulness for me to see and not be able to
leave meaningful feedback on a DSA conversion broken down into sets
which offer an incomplete image, especially when the API itself is still
subject to change. I wanted to leave an Acked-by but I didn't fully
understand where the conversion is going, so I asked the question instead.
I wonder what you would have done in my position.

I wish you a beautiful evening.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
