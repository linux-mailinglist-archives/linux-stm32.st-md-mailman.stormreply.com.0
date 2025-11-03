Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF34C2B218
	for <lists+linux-stm32@lfdr.de>; Mon, 03 Nov 2025 11:48:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB747C62D2D;
	Mon,  3 Nov 2025 10:48:26 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 666E9C57B78
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  3 Nov 2025 10:48:25 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-429cbdab700so141301f8f.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 03 Nov 2025 02:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762166905; x=1762771705;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=oT9RtigCr8SXNb36gcbFehyubQYXLfyyxsU6nQOAO4g=;
 b=BzsIwOg2z8ijLsldtuTr+40Dw8QkoCh5VaoakvlWgYd5CTdBO+AfxwTk5CO+jrsQ18
 jdUj0/X678Ad8lLtvoJ5MY5vCMVWAi+nLIhN1xc1G9oTgMyW8Io8e/CvuIxsqC//0eyB
 v+VvaRRpDURrPok4lsuymHaQOsKccrioA8UDZBKw+m0WQ0/8jhUUUfofyOR6AqDUrP6/
 HEy5DlwVcsWCWm3Vhhl1W3ys5lzIS02EtyGOQ8SKzxE3h6KiG9kLuewJgJc8Eb1lJuTz
 IL1MwWeMt/f2YNlKs8qiDXrfVPMgtej4XmrI8A0mXo9SCWeDNXxNO7lWrrlok1XOcIc6
 Tt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762166905; x=1762771705;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oT9RtigCr8SXNb36gcbFehyubQYXLfyyxsU6nQOAO4g=;
 b=rQL+/8w00IJZqUBRL1gD8ITMY5qgU8/AukNx3a1O2bY3W40C0dm5VUFH0QTNlAJJdv
 H7aWFJkGW09yBAif9ZrHpXYEYadtjCZUkoe4aL86fjCH8St38D/sEdX2ge9sywoo/K96
 ddPeFf0DvPl1DLyje5EA8XT1IW5fXk4Li+ald3ZInWRILCXhMbLOodMPmNGZhP/212lW
 dT0pJZTsCuD8UjNHaf8EBd8pT+YXVXikX7tOgTJOLahROBCPL3JPcSSk1Y/oT+JpM7Ay
 X4WWqR4dgjwg9pe0di4uUD1Dn0w8nm+UpTsjXg3wD0S464BF0y1Ggiuomaul4j2nFXu2
 3hSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ/l5P3ek7kyAE53wQjAWIikrIQYl+RTjFidkgybjRcFy2jE1vdhnop6WsnrkeUksnW0lvJqeRMuaVOQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxlOk7efkaJeaqTl6lV55VEr5IhhRUx5K17egCljfPM7V1kemNF
 wFmNIRCyLFH1H7vgbWTjnCSRfLwzYHxPBKWMmlyVM1LhO5mU/nAV9/Zp
X-Gm-Gg: ASbGncvdPn6m+2SKZfHgDkjibNnVOoHmCvowV0yrVgFuHZzMISsVa1AFDhPdLNsz4BV
 F9bWn+Y8+aUUw/AX2jz9fWhfMbv8KrIqyc+f+fqiBVgeAfDnrj2c1XuFWz4W9jpfC99WIkec+PO
 lnbKiiOBiVsFHpjseJOU6aZkoqbXKMQYJGb1wmufgxSSYOcTTaNKaE2bZJ6wTGc4LM+sPbAQsiT
 qhzCJZ0fJLVdjg4elR/XZgYEXJf7wXl4T9zH2JMC/sEwfL4C2SWSh+yLkirrWu8N0cw71seJVik
 +FUt+JSl1Sj32l1ExU/GwAZRq85DFV7ZRUmqcU+mplfGw5TmNZXd31x02erYjh9THfFbl7F2aXo
 jTXbtT56PKMrw9e0LnwG+XTVwsbmOV4IK6IhCduRDFb7HGsWS+fCnIeDY1tMgHTxV85HO
X-Google-Smtp-Source: AGHT+IFDkHIlGH+UICeedNY8tuFUMLJ68lqu5VoPcOTjTIWj9r93aVIljpR0UjzUe74VKQmlKp+fEQ==
X-Received: by 2002:a5d:5f50:0:b0:429:b4ce:c692 with SMTP id
 ffacd0b85a97d-429bd6a77bcmr5661427f8f.7.1762166904243; 
 Mon, 03 Nov 2025 02:48:24 -0800 (PST)
Received: from skbuf ([2a02:2f04:d406:ee00:7144:c922:dc8a:113d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429d12e1173sm7767173f8f.42.2025.11.03.02.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 02:48:23 -0800 (PST)
Date: Mon, 3 Nov 2025 12:48:20 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Message-ID: <20251103104820.3fcksk27j34zu6cg@skbuf>
References: <aP03aQLADMg-J_4W@shell.armlinux.org.uk>
 <aQExx0zXT5SvFxAk@oss.qualcomm.com>
 <aQHc6SowbWsIA1A5@shell.armlinux.org.uk>
 <aQNmM5+cptKllTS8@oss.qualcomm.com>
 <aQOB_yCzCmAVM34V@shell.armlinux.org.uk>
 <aQOCpG_gjJlnm0A1@shell.armlinux.org.uk>
 <aQhusPX0Hw9ZuLNR@oss.qualcomm.com>
 <aQh7Zj10C7QcDoqn@shell.armlinux.org.uk>
 <aQiBjYNtJks2/mrw@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aQiBjYNtJks2/mrw@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Furong Xu <0x1207@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Jacob Keller <jacob.e.keller@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Daniel Machon <daniel.machon@microchip.com>,
 "Jan Petrous \(OSS\)" <jan.petrous@oss.nxp.com>,
 Alexis =?utf-8?Q?Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [Linux-stm32] [PATCH net-next 0/3] net: stmmac: phylink PCS
 conversion part 3 (dodgy stuff)
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

On Mon, Nov 03, 2025 at 03:48:53PM +0530, Mohd Ayaan Anwar wrote:
> On Mon, Nov 03, 2025 at 09:52:38AM +0000, Russell King (Oracle) wrote:
> > On Mon, Nov 03, 2025 at 02:28:24PM +0530, Mohd Ayaan Anwar wrote:
> > > On Thu, Oct 30, 2025 at 03:22:12PM +0000, Russell King (Oracle) wrote:
> > > > On Thu, Oct 30, 2025 at 03:19:27PM +0000, Russell King (Oracle) wrote:
> > > > > > 
> > > > > > This is probably fine since Bit(9) is self-clearing and its value just
> > > > > > after this is 0x00041000.
> > > > > 
> > > > > Yes, and bit 9 doesn't need to be set at all. SGMII isn't "negotiation"
> > > > > but the PHY says to the MAC "this is how I'm operating" and the MAC says
> > > > > "okay". Nothing more.
> > > > > 
> > > > > I'm afraid the presence of snps,ps-speed, this disrupts the test.
> > > > 
> > > > Note also that testing a 10M link, 100M, 1G and finally 100M again in
> > > > that order would also be interesting given my question about the RGMII
> > > > register changes that configure_sgmii does.
> > > > 
> > > 
> > > Despite several attempts, I couldn't get 10M to work. There is a link-up
> > > but the data path is broken. I checked the net-next tip and it's broken
> > > there as well.
> > > 
> > > Oddly enough, configure_sgmii is called with its speed argument set to
> > > 1000:
> > > [   12.305488] qcom-ethqos 23040000.ethernet eth0: phy link up sgmii/10Mbps/Half/pause/off/nolpi
> > > [   12.315233] qcom-ethqos 23040000.ethernet eth0: major config, requested phy/sgmii
> > > [   12.322965] qcom-ethqos 23040000.ethernet eth0: interface sgmii inband modes: pcs=00 phy=03
> > > [   12.331586] qcom-ethqos 23040000.ethernet eth0: major config, active phy/outband/sgmii
> > > [   12.339738] qcom-ethqos 23040000.ethernet eth0: phylink_mac_config: mode=phy/sgmii/pause adv=0000000,00000000,00000000,00000000 pause=00
> > > [   12.355113] qcom-ethqos 23040000.ethernet eth0: ethqos_configure_sgmii : Speed = 1000
> > > [   12.363196] qcom-ethqos 23040000.ethernet eth0: Link is Up - 10Mbps/Half - flow control off
> > 
> > If you have "rate matching" enabled (signified by "pause" in the mode=
> > part of phylink_mac_config), then the MAC gets told the maximum speed for
> > the PHY interface, which for Cisco SGMII is 1G. This is intentional to
> > support PHYs that _really_ do use rate matching. Your PHY isn't using it,
> > and rate matching for SGMII is pointless.
> > 
> > Please re-run testing with phy-mode = "sgmii" which you've tested
> > before without your rate-matching patch to the PHY driver, so the
> > system knows the _correct_ parameters for these speeds.
> > 
> Sorry, I forgot to mention that all the recent testing is being done on
> QCS9100 Ride R3 which has the AQR115C PHY.
> 
> My rate-matching patch was for IQ8 which has the QCA808X PHY. I am
> putting its testing on hold until we sort everything out on QCS9100
> first.
> 
> So, for AQR115C, what should be the way forward? It has support for rate
> matching. For 10M should I remove its .get_rate_matching callback?
> 
> 	Ayaan

As Russell partially pointed out, there are several assumptions in the
Aquantia PHY driver and in phylink, three of them being that:
- rate matching is only supported for PHY_INTERFACE_MODE_10GBASER and
  PHY_INTERFACE_MODE_2500BASEX (thus not PHY_INTERFACE_MODE_SGMII)
- if phy_get_rate_matching() returns RATE_MATCH_NONE for an interface,
  pl->phy_state.rate_matching will also be RATE_MATCH_NONE when using
  that interface
- if rate matching is used, the PHY is configured to use it for all
  media speeds <= phylink_interface_max_speed(link_state.interface)

Those assumptions are not validated very well against the ground truth
from the PHY provisioning, so the next step would be for us to see that
directly.

Please turn this print from aqr_gen2_read_global_syscfg() into something
visible in dmesg, i.e. by replacing phydev_dbg() with phydev_info():

		phydev_dbg(phydev,
			   "Media speed %d uses host interface %s with %s\n",
			   syscfg->speed, phy_modes(syscfg->interface),
			   syscfg->rate_adapt == AQR_RATE_ADAPT_NONE ? "no rate adaptation" :
			   syscfg->rate_adapt == AQR_RATE_ADAPT_PAUSE ? "rate adaptation through flow control" :
			   syscfg->rate_adapt == AQR_RATE_ADAPT_USX ? "rate adaptation through symbol replication" :
			   "unrecognized rate adaptation type");
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
