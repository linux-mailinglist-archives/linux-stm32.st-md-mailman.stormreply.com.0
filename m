Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id DQXPKeZIpGmMcgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 15:10:46 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 337731D023C
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 15:10:45 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8A103C8F269;
	Sun,  1 Mar 2026 14:10:45 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2DB2DC030D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 14:10:44 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48378e60742so4448555e9.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 Mar 2026 06:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772374243; x=1772979043;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TVGLTQN8MHuJLb/cmqvoQTI+Y7O1OTfTNxTJJccPmrI=;
 b=TUCpn9ULaT1cG1ZYRHKJjKdwOH7KdQR2MGzUPZ0iRO5ehGBuDbJhjXnmUFF/uf/zIW
 Z0833Hrrv6mvoqUU1WTs+xTRf2Rh5JYZEgcVYfR6Nb7nXUoS4xrwhgjagI9F7Li6HeM0
 O9rm9Ur3U6wZwnzio4LYKZlK8OGWZhS6hjalwUC8CEwI9fF6sByy+E8pR0Pgb1pdjb7t
 625ro5x5xTVJewe1pcMppYA8gCc12PSg49+ofLpcCEE7LreAAdOi0APUDmZvBAXziHZG
 PM+5hWdTv1SRZzaFSldADwShgmmmcX5DnlCF57ZakOxoBgIxoexcomd8zXhpv28TiBQ5
 /Ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772374243; x=1772979043;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TVGLTQN8MHuJLb/cmqvoQTI+Y7O1OTfTNxTJJccPmrI=;
 b=XdB38rm22LyNG6WPZxcpjpkk1D+3Ps9JvqZbJSCOXA0VJyzb0wwGh3qaSm1C1PYTer
 IoWxpQc5lc7pLBoS0jM8zA0sKwFUJ8aS/FcNFieci3toqh1xLKK/GuZGAjf5K56IoITu
 zkgUjJwYuUf5Pvy5L4y/OkJKOzxros8nGsKRvBE3T/ehuMYdmr+Pifv8yP4xHWh3pA6z
 WJpS+owUp5mFwwHnEo6G0Y9fAHjS4vyS0hyFZCLwJUSnpusmXvWDOtDAZqSB9Btx81ur
 Isr6Xh4yczauYIwKH0LgdyyktY8/lD/8nytghXbxjq3H57puN/jqTHIIEtj8tz64icjG
 ym/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1aPDBB5k696AAzXZbxVXBzBKe7OWGNqPQ7dUwYLtg+CveU/pknC3rV3QuVZION5Oc2ZdXtxYVTevZIw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzNuu/lp/MWiHsRf7swtY2O7KdLxNKH8XLBOtuk0sKb3sX4qUFD
 /CfYuZpbzATV1aXu9WzAhYOvwrGDE8wtIB1aV0zyHl25Adz45ko2rvzL
X-Gm-Gg: ATEYQzyHhmHyMORSQ0kQe47jW4qXdmDiNd27/PwYTctHPy35r275uNZ+hurbIXdskkB
 pql70fWf4x1l9+Yfx4r2+s4C2k/uc26otBmYJc+5DuB6e49ihtZDgrflfiB/FQyzVHrLTZ54REL
 A5hm8ylYxe114qOUyfkM+TlAEc3Z7YK1VdyjGGvKB7xtym5+rKLlGbp/LbGA/1K4Ij3Mke9fFFf
 ueT/62P6C4j8zPnsu8vlKcWq5IWnrLTcNGWvfCD/0reJKiK96uU6TakMN0cAyGXYXQ0QHoJjTDy
 q7RO70HrVb+pmkVgQBU9SggR6zCGvV3pzRU/yRWDVE3SdT7XUMBC4HN0p8upN0bQjWykDZdVn8Q
 gHqfGsEj3MFZvoueXy26+tyHpPtgl+28NwbFYoFyx6oB8F1smOVjvZ+ci+Ple9XPzE7QOCk0l0Y
 J/tWifZ4p4jMBy1JDdp1g=
X-Received: by 2002:a05:600c:4e8a:b0:483:887:6e32 with SMTP id
 5b1f17b1804b1-483c9bd9eaemr93243805e9.8.1772374243073; 
 Sun, 01 Mar 2026 06:10:43 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:8f4c:42a4:aebb:ef65])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb77abdsm107413555e9.2.2026.03.01.06.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 06:10:42 -0800 (PST)
Date: Sun, 1 Mar 2026 16:10:39 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260301141039.muzcrt6cynilvpei@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
 <20260301001453.lpd2rawy7bqxyivp@skbuf>
 <aaRCN7zbX6FjUtQ_@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aaRCN7zbX6FjUtQ_@shell.armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RESEND2 net-next 0/8] net: stmmac:
 qcom-ethqos: further serdes reorganisation
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 337731D023C
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 01:42:15PM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 01, 2026 at 02:14:53AM +0200, Vladimir Oltean wrote:
> > On Sat, Feb 28, 2026 at 08:31:11AM -0800, Jakub Kicinski wrote:
> > > On Fri, 27 Feb 2026 16:55:56 -0800 Jakub Kicinski wrote:
> > > > On Sat, 28 Feb 2026 00:11:29 +0000 Russell King (Oracle) wrote:
> > > > > The AI review for patch 7 says:
> > > > > 
> > > > >   This commit fixes a bug but lacks a Fixes: tag. The commit modifies
> > > > >   behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
> > > > >   .set_mode() and .validate() methods") by making phy_power_on() call
> > > > >   qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
> > > > >   making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
> > > > >   before attempting calibration.
> > > > > 
> > > > >   Should this commit include:
> > > > > 
> > > > >   Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")
> > > > > 
> > > > > which is _wrong_, this isn't a bug fix.  
> > > > 
> > > > Yes, that's what I thought but then I saw the other thread..
> > > 
> > > Trying to apply this now but stmmac parts don't apply on Linus's tree,
> > > and Vinod wants a tag :( What do we do? 
> > > 
> > > Could you, perhaps, send us a PR with this on top of Linus's tree 
> > > (a resolution of the inevitable conflict with net-next would be helpful
> > > too).
> > > 
> > > Or do we give up on the tag?
> > 
> > Actually, I think it's mainly me who wants a stable tag. I'm working on
> > a series for phy-next which will conflict with this hunk from Russell's
> > patch 1:
> 
> Is this because of the issues I raised with the quality of generic PHY
> API implementation by drivers?

I don't think the issue you are referring to is so much a "quality" one
as it is a "lack of requirements" one, but to answer - not necessarily.
Eventually I'll get to Ethernet Generic PHY interop too, but I saw as
first actionable step to clearly delineate what is PHY provider API from
what is PHY consumer API, in an attempt to stop PHY consumers from
poking inside struct phy.

To improve the interop situation, apart from patching drivers, I plan to
introduce a new CONFIG_GENERIC_PHY_EXPERIMENTAL (meaning: enable for
development, don't enable for production, but drivers required to work
with EXPERIMENTAL turned on) which would make a few changes:
- make the .validate() function pointer be a required dependency for
  .set_mode().
- call .validate() before calling .set_mode(), and reject the call if
  the mode and submode don't pass validation
- swap the power state before calling .set_mode(), and restore it
  afterwards

Some of these changes do need that consumer/provider API separation I
was talking about. For example, consumers should not look at the power
count of the PHY (some of them currently do; not to mention they do this
without proper locking). They should only concern themselves with
whether *they* powered the PHY up themselves.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
