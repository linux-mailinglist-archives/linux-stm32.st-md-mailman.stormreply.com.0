Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FBchO6asb2ncEwAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 17:26:14 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABCE47750
	for <lists+linux-stm32@lfdr.de>; Tue, 20 Jan 2026 17:26:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC000C57A52;
	Tue, 20 Jan 2026 12:11:19 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45B72C36B2A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 12:11:19 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id
 4fb4d7f45d1cf-655b5094119so767973a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 20 Jan 2026 04:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768911078; x=1769515878;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EdNwNcGnrHVRj7c7tzYxsUBjZ6i7z3klcWNlJbURQPw=;
 b=h+K6SWFBrtdJB6DCn3E7Gis0yCg3AJHXINB1Aso4F+slIoI3rOL+WRmnatE7pS8Shs
 FS1SGopLt2hxGNpm4CigzEhYCpHcBr5k0JJkE05qbidoSKK2iFH1TPgEHV4MFUa4Frz1
 QSFboKNBq2FTRbMSnpPA4g+uL58dCJYaEf+u+hazpOi37HZoyspgJFWaj2h4AAO33VEB
 RfeyQTe9CDwF/rGqZAzjoCL45waWdIsGrwDG/wUIZZclvQsym/00SiHa8ATiFYPT2oQi
 x9y9CZTuNx6TdxVkWufgpbiNB26qkDXr+UqiIHljLfQWFBIMED6PquhL7/zAlr5Dol8x
 K0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768911078; x=1769515878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EdNwNcGnrHVRj7c7tzYxsUBjZ6i7z3klcWNlJbURQPw=;
 b=Bsvt1vafKLbpw4nqCidOdWsxptGZUouR+iQDHNcUuNu/D2ozNX+R4Fsq4JxAULNY5w
 /gnVd/76CzvS4iM4S2tXdUtnFXfiYnKnJgrscY7MUrkM9jgJJgCTThHMC7tPMjQtNSZt
 ixwgzLJJSoTLwwlr1AGGHENuxfzT09xM4/1qXXG+WeI4IyXwusN6wcZ2YARRSowyh5Ke
 U2MZraUS9KI2xEBJRWIWooi342lUWowwNwhPUKQcxbFxqm6jh07TvK7+M7M5zr1X/2eA
 Mw1UXGjhmR6kZFJM8eRcyFgQKsW38l5/sR3f1o4RGW3xjd8+kPVzEL2uetxLzQzGj/Wi
 ANVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTX3lgHPt/EYHluhcbfO1/wSoqicWoDzc9YsP1Z1ylAkrBLdgnnmnpB3Jw8I2iG/IzcDH2YjLN/WDASw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz8563Tzgk3RwFs1m8XO+7a0b+JCYjrf4vD287HieSMPvsRI9ZX
 xj9LOWwn+IkFEx3UDRUnAXF+IiWGT7Zq/6ynZ+PVEarZD08g0VxXfHMB
X-Gm-Gg: AZuq6aIf2xnPeAQ3vVKBALXwk6wm2r0n4uNMd1oGTOeN18X1gQpSPScz/eZg7gQZCMR
 DJg6TBu/dd/6H9Vipw6JaS4rSiL3UnkC2/hoXmDAvlnuY/BLBvd6xPy2K0FQzDbL8AnrOFOQ+dv
 SAAXkvth438nZyoa5Lxm0Nvvg+WdMSfLHccCzHeKYtmrBYv4xks0VwQ0M78PY5psqaQEB106aJW
 RMOUrldvIiCrFWqko1jn3K4BUYkr7+Uh3Ymsackg3g4J+09SfBvAXJj1NNbjp5ZVxrm5fRUtmYN
 nxjcw98WsGBpPjz70h8fv3zgq6KjLXl37DgZl7UO+48E+/fX6B6A+xpopJCzSwgNOwavBDxnaP3
 H3nzfFjSYFuLF4IGUTmJpHSL6Ui+7ICfhdasDaaaD7twWttbnxUOTSbdmhbHInhleibAaVI24/O
 xixsY=
X-Received: by 2002:a05:6402:348d:b0:64c:9e19:982d with SMTP id
 4fb4d7f45d1cf-654523cc85bmr6515961a12.1.1768911078156; 
 Tue, 20 Jan 2026 04:11:18 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:619a:24df:1726:f869])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-654535c4aa7sm13503305a12.34.2026.01.20.04.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 04:11:17 -0800 (PST)
Date: Tue, 20 Jan 2026 14:11:14 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260120121114.2aedgu42i2wax3yp@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120081844.7e6aq2urhxrylywi@skbuf>
 <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
Cc: neil.armstrong@linaro.org, mohd.anwar@oss.qualcomm.com, vkoul@kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 andrew+netdev@lunn.ch, edumazet@google.com, andrew@lunn.ch,
 mcoquelin.stm32@gmail.com, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org,
 hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [net-next,
	05/14] net: stmmac: add stmmac core serdes support
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:linux@armlinux.org.uk,m:neil.armstrong@linaro.org,m:mohd.anwar@oss.qualcomm.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:andrew@lunn.ch,m:mcoquelin.stm32@gmail.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,m:hkallweit1@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,oss.qualcomm.com,kernel.org,vger.kernel.org,st-md-mailman.stormreply.com,lunn.ch,google.com,gmail.com,lists.infradead.org,redhat.com,davemloft.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:email,stormreply.com:url,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 8ABCE47750
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 10:12:46AM +0000, Russell King (Oracle) wrote:
> First, I'll say I'm on a very short fuse today; no dinner last night,
> at the hospital up until 5:30am, and a fucking cold caller rang the door
> bell at 10am this morning. Just fucking our luck.

Sorry to hear that.

> On Tue, Jan 20, 2026 at 10:18:44AM +0200, Vladimir Oltean wrote:
> > Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
> > after calling pcs_disable(), though?
>
> No. We've already called mac_prepare(), pcs_pre_config(),
> pcs_post_config() by this time, we're past the point of being able to
> unwind.

I'm set out to resolve a much smaller problem.

Calling it a full "unwind" is perhaps a bit much, because pcs_pre_config()
and pcs_post_config() don't have unwinding equivalents, unlike how
pcs_enable() has pcs_disable(). I don't see what API convention would be
violated if phylink decided to drop a PCS whose enable() returned an error.

Similarly, the fact we don't have to whom to report an error code
doesn't make it pointless to offer the guarantee that pcs_disable() will
be called only when pcs_enable() has succeeded.  It is only the latter
that seems necessary in order to develop reliable complexity on top of
these.

If SerDes PHY integration in phylink_pcs drivers is a model to follow
for other drivers, I think the way in which balanced calls can be made
from pcs_enable()/pcs_disable() needs to be given more attention.
And I think it's a bit worse than "doesn't matter, the port is dead
anyway".  For example, we can have QSGMII where 4 PCSes share a single
SerDes lane, so one single malfunctioning PCS instance can affect all
the others through the lane's phy->power_count.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
