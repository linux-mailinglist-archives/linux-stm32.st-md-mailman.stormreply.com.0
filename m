Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C43D84CC0C
	for <lists+linux-stm32@lfdr.de>; Wed,  7 Feb 2024 14:52:24 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5B1DBC6DD68;
	Wed,  7 Feb 2024 13:52:24 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 495EDC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  7 Feb 2024 13:52:23 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id
 4fb4d7f45d1cf-5602500d1a6so779231a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 07 Feb 2024 05:52:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707313943; x=1707918743;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ssucjkApVHBsZVPy7RMVbGWlOv8R81OtHKLkTIxL75E=;
 b=Agauga83/67JA7RwecUG4rQ3GgdyBKkMgzDUUhYgCp0Cg6v68NtijsaHfh5sxJBWSv
 PFSdsv9y4fKyXIuGPUfkmp86PjhksSWzxTirvmpH+eMUkmosDGg4gUMNsFvq/wQddJON
 tX5jQgT7zcun0+2A79aJuKsN9GU0VcjX0yGgpmREVukKesqDeKv8/wgfNhyTeTrR69gP
 Thbs5KgPRnNgw17MF5LRA0gyH1MuvT39BnQDYwns/gGqHmCby4Z1QgOFJcyOm6QIggbk
 Otx3rmgH95h6SY4riqk+P014el9UreLKDPWQKVqH1bXOb9tzy6sEiQtIDLgRc1o7c3xX
 VAPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707313943; x=1707918743;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ssucjkApVHBsZVPy7RMVbGWlOv8R81OtHKLkTIxL75E=;
 b=R0sgc1BlA7t73dm9MkZadKkh+i+u5GWq51Q6v0soY5zZEu0v2J6myYgipbyviEPJq6
 ckQf23ov64QYyuZLFV8r4Rzp3CE0BFHK/hHAqXKWxb1XxXACWLVEZ4BgKxf9w0sh0yLv
 7h5+dMBhHFtKI3nH8Tha5gUyW7ujO/QX4ESlyxNdKv2psNgS9G+RQwX02lnd0iBwKVLR
 xG/Uzoetuf8vaMay8QGquzL6GDkLVNTMcwvpYirEQjoUCaxz9+igSszAYugXi7be5IHV
 KVNQuz+i6OQPR/wq+XDdrplQCcuM0CCWeFMrRXODis6j2+0zbgsFB3SN3nVYJqN+2FlJ
 ekKg==
X-Gm-Message-State: AOJu0Yyh0x7GyAa+RRHs6JX0+TDa62iE45TwwZ3QoRXtSPVwW+L+HWOH
 9kWZgfsbdjYlbEkXFl80bkWZ9qudPx8YWl0kVlJbQx7ufrL23lBX
X-Google-Smtp-Source: AGHT+IENDHIhbR7wteWQbXtL2mevl2caQhgOmSZZBbuKlHearZm4BYxKy1Kk0y3Hkngo2TMyudHymQ==
X-Received: by 2002:a05:6402:1b0b:b0:560:c888:9cf4 with SMTP id
 by11-20020a0564021b0b00b00560c8889cf4mr1856528edb.28.1707313942560; 
 Wed, 07 Feb 2024 05:52:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXi1rfmfbaYmAUzLd6Nkj/pUMld79kgFYZjdrRWY/at3fU7YbH/8fju/1n2729UouFwNWBQbDsEFVdXiGSE+FgZncZ9ioCshkawR7c1Po7aKMgk+y7tZGK887rKNw0rtKcUFAefRTGdXUPQaLFWujuzEPXMLh4RzM1V9OoTt933V62CGj8UgQ8LACqks53aUTrsaWH16//w8VErcsf8U3KensmRKmkYb84nq2+zP2O5oX7YAKkYT72iLELf3i4k2hfkBMeew0y52CtlTP44lhgji5hAtvvKm0RJEzAC1qdJjTPFDDGpD/HKWlQRgobeXVIViTxrR7pj4V47az0xBwBdsOnY0wv06IOUOY/tI/Nc0Eugf0iKN8rAPiZbOMiDrsBixTIHTXVXroh5G6RITtUvD77vIgKc1CHegNRsPD0Ounda/JjTN5UMZj4W44Vpvo9cTuZJxPf4OFTb0azG9dUMTIgmcMTmro29H9O0nomlQ7tasrXz+WRtlYSB0NCIxNoEeyPpycbXwCTqJrCF52e/pTtt6C+BE+cjIp86A4L+UJNklTi862r5IEolwJZwqklN8SDlBz+rxBCBTx7nmdQ2lJ5u6Jl8VW/LIfXdODOm3PFVozVb60knGgwJf+1l+q7Frkhv2K2Fxdpr4QkTHEORhNGbBvQhCfQqEnZle798Gne47wylrnO5s6Z+u4O6jGCIecHbo/LTInSDj5Xo6mmoRqnn6V2OYWslv31cIWxEw8meBg==
Received: from skbuf ([188.25.173.195]) by smtp.gmail.com with ESMTPSA id
 fi25-20020a056402551900b00558a1937dddsm686175edb.63.2024.02.07.05.52.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Feb 2024 05:52:22 -0800 (PST)
Date: Wed, 7 Feb 2024 15:52:19 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20240207135219.7wr4hctzjuanotxv@skbuf>
References: <Zb9/O81fVAZw4ANr@shell.armlinux.org.uk>
 <E1rWbNI-002cCz-4x@rmk-PC.armlinux.org.uk>
 <20240206112024.3jxtcru3dupeirnj@skbuf>
 <ZcIwQcn3qlk0UjS4@shell.armlinux.org.uk>
 <20240206132923.eypnqvqwe3cga5tp@skbuf>
 <57406055-ff3c-4788-bbf7-8476f63f90db@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <57406055-ff3c-4788-bbf7-8476f63f90db@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Justin Chen <justin.chen@broadcom.com>,
 Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 linux-stm32@st-md-mailman.stormreply.com, Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Jose Abreu <joabreu@synopsys.com>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Byungho An <bh74.an@samsung.com>,
 Wei Fang <wei.fang@nxp.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, Clark Wang <xiaoning.wang@nxp.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 6/6] net: dsa: b53: remove
 eee_enabled/eee_active in b53_get_mac_eee()
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

On Tue, Feb 06, 2024 at 08:25:17PM -0800, Florian Fainelli wrote:
> 
> 
> On 2/6/2024 5:29 AM, Vladimir Oltean wrote:
> > On Tue, Feb 06, 2024 at 01:12:33PM +0000, Russell King (Oracle) wrote:
> > > > I know next to nothing about EEE and especially the implementation on
> > > > Broadcom switches. But is the information brought by B53_EEE_LPI_INDICATE
> > > > completely redundant? Is it actually in the system's best interest to
> > > > ignore it?
> > > 
> > > That's a review comment that should have been made when the original
> > > change to phylib was done, because it's already ignored in kernels
> > > today since the commit changing phylib that I've referenced in this
> > > series - since e->eee_enabled and e->eee_active will be overwritten by
> > > phylib.
> > 
> > That's fair, but commit d1420bb99515 ("net: phy: improve generic EEE
> > ethtool functions") is dated November 2018, and my involvement with the
> > kernel started in March 2019. So it would have been a bit difficult for
> > me to make this observation back then.
> > 
> > > If we need B53_EEE_LPI_INDICATE to do something, then we need to have
> > > a discussion about it, and decide how that fits in with the EEE
> > > interface, and how to work around phylib's implementation.
> > 
> > Hopefully Florian or Doug can quickly clarify whether this is the case
> > or not.
> 
> Russell's replacement is actually a better one because it will return a
> stable state. B53_EEE_LPI_INDICATE would indicate when the switch port's
> built-in PHY asserts the LPI signal to its MAC, which could be transient
> AFAICT.
> -- 
> Florian

Thanks, Florian.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
