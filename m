Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHyIARAKcmmOagAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 12:29:20 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D88765FF3
	for <lists+linux-stm32@lfdr.de>; Thu, 22 Jan 2026 12:29:19 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 386D8C58D7C;
	Thu, 22 Jan 2026 11:29:19 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0B095C57B72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 11:29:17 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id
 ffacd0b85a97d-430f38c7d4eso120496f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 22 Jan 2026 03:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769081357; x=1769686157;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w719Adxu/spsT1aehDZuiWXX85fwgBdKYmTk1wyv4mk=;
 b=VffTQl1SwE/dhY+yBtCv1HIdXVRZ7CDQdkBL/Iz6lNd/SZzVRZYl5sMS4FpMQU26bH
 eUh90fV7J502D+oeUx/qAuVSzzdZekBiWJ7MB3IY6YxdAnV4FmAuPF6jjztslPN5YcHS
 beiEaWBfTybdgFCbEZw+rTGjElKVmhuuZPrqovyl4yF6v8B3n2T+BGkmz4XoAbHAHIxm
 IdquxDUPCiiirHG4H6uQmMYvzgq/gx/+S6YKasPo6sqCr3n36rXC2RnWFgrNDrCEr/mz
 X0ofUFXi76qotr/QwBtp1o1qkDGfYbyFY6lA6nC0KofYaoKxxGYAyk8zIWcdsqvjBLmR
 rq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769081357; x=1769686157;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w719Adxu/spsT1aehDZuiWXX85fwgBdKYmTk1wyv4mk=;
 b=iCoB7wovLZ6Z+4MtN7cTUKrrZiXfZxuk04Z7MmpXb898QwqbEqkLI7FHy7zEEzSNUf
 Pp2SFY2Vria6Qz+pea8OMNqYs6eFF4Kkdow0fdk9c9nUTsLFliBQNEf/qOv5JVPmdu6r
 W8m1Y2Jnq8ejxABMzQJDKhuLHd0wT6wVibeYwZvV4Hp7t0FNShBcA1HZAqBTASeDxRXP
 bxRdthUmncUs8aQByL2PglM6Zn13cW7QJhnXuNspu/Mlxyag/JcIeCiOUfaX32tWGis1
 PHj69wO5vUOc4piaQrDnAv4f5lmlg/b+6rjRz2/ORxG2yR0mPBBjzgqkxQjIQO+qu1Ze
 K+1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs15bLz4jyYw4M0XbQC9AftDrWY/yO8K8ZdUrftViGklg8IKX9n7m5Qp6vx6oSfnWHSkxKWiQw9PxTRQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yw+uKVT+V7rlgDWt4E7tFGC+/TbQmCnEmj/sb4zh5pYlSaVQSoB
 SFIbhWeMbfs2E3kwEsXkVN0BuJtweQ229gUgCfO0u04J+qaPOPtbKHWv
X-Gm-Gg: AZuq6aI7i2E1wCs/A3hacXOuYp0EzBBBMZbjclJv5HJREan65klzA+upOMCRV157Z9/
 bdmJvqCrQBjsntr/vyx3DaGLguTVFhi+BTKqk4N4/bnK7XkHB4ynjPDXmqFgbVpa11AxSrUDoh2
 TiD4mYQMm347MutkfJtGwKMpn1g6ZaOtZDsnRcTOk4ddmETVbsKFZgEf04AQbgyeqp9BMsPXPqq
 DBMQKHtaGQ8MfGKtG0/68iZv6Q6+T8I2VvgS3WhFRfLJfqZkQa79/XDovSifIipwOu07R//m4s3
 0qdjVmcb2AnuQA40WEQcMH5J9X5egArpLgnfcp+22YewYinT8m3ELkmOfIQn9bWm3vm/Ds6n2Fg
 GGTUR9ofaC9DZn+ak6qzQUsHG0EQjmGKakH2ynvjEIjHJ3JJZPxh0qHszVdCMiAzdhIbbGbSZmF
 iuhwY=
X-Received: by 2002:a5d:5f83:0:b0:429:bde0:1da8 with SMTP id
 ffacd0b85a97d-43569bdaa4amr18327128f8f.7.1769081356806; 
 Thu, 22 Jan 2026 03:29:16 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:7677:83bc:43db:13ae])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4356996cf58sm44986696f8f.22.2026.01.22.03.29.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 03:29:16 -0800 (PST)
Date: Thu, 22 Jan 2026 13:29:13 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <20260122112913.svzaie4eywk5nc32@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120081844.7e6aq2urhxrylywi@skbuf>
 <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
 <20260120121114.2aedgu42i2wax3yp@skbuf>
 <aXDm0jVOYOZ9l6Wu@shell.armlinux.org.uk>
 <20260121162345.4jpzvwqhfqxd7tl7@skbuf>
 <aXEN6B5_T9uFzVvu@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXEN6B5_T9uFzVvu@shell.armlinux.org.uk>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 8D88765FF3
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 05:33:28PM +0000, Russell King (Oracle) wrote:
> On Wed, Jan 21, 2026 at 06:23:45PM +0200, Vladimir Oltean wrote:
> > On Wed, Jan 21, 2026 at 02:46:42PM +0000, Russell King (Oracle) wrote:
> > > On Tue, Jan 20, 2026 at 02:11:14PM +0200, Vladimir Oltean wrote:
> > > > On Tue, Jan 20, 2026 at 10:12:46AM +0000, Russell King (Oracle) wrote:
> > > > > First, I'll say I'm on a very short fuse today; no dinner last night,
> > > > > at the hospital up until 5:30am, and a fucking cold caller rang the door
> > > > > bell at 10am this morning. Just fucking our luck.
> > > > 
> > > > Sorry to hear that.
> > > > 
> > > > > On Tue, Jan 20, 2026 at 10:18:44AM +0200, Vladimir Oltean wrote:
> > > > > > Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
> > > > > > after calling pcs_disable(), though?
> > > > >
> > > > > No. We've already called mac_prepare(), pcs_pre_config(),
> > > > > pcs_post_config() by this time, we're past the point of being able to
> > > > > unwind.
> > > > 
> > > > I'm set out to resolve a much smaller problem.
> > > > 
> > > > Calling it a full "unwind" is perhaps a bit much, because pcs_pre_config()
> > > > and pcs_post_config() don't have unwinding equivalents, unlike how
> > > > pcs_enable() has pcs_disable(). I don't see what API convention would be
> > > > violated if phylink decided to drop a PCS whose enable() returned an error.
> > > 
> > > While pcs_pre_config() and pcs_post_config() do not have unwinding
> > > equivalents (what would they be?) the issue here is that these could
> > > have changed any state that isn't simply undone by calling
> > > pcs_disable().
> > > 
> > > For example, pcs_pre_config() could have reprogrammed signal routing,
> > > clocking, or power supplies to blocks.
> > > 
> > > This already applies to Marvell DSA pcs-639x.c, where the pre/post
> > > config hooks change the power state of the PCS block (for errata
> > > handling), and the only way that gets undone is via a call to
> > > pcs_disable() which explicitly disables IRQs and power for the PCS. Its
> > > pcs_disable() isn't a strict reversal of pcs_enable(), it does more.
> > > 
> > > We already declare the interface to be dead on pcs_post_config()
> > > failure, but we don't do that for pcs_enable() failure.
> > > 
> > > Maybe I need to explicitly state that pcs_disable() does not directly
> > > balance pcs_enable(), but that _and_ the effects of pcs_pre_config()
> > > and pcs_post_config(). However, that itself will add to the problems.
> > > What if pcs_pre_config() and pcs_post_config() succeed but not
> > > pcs_enable()? pcs-639x needs pcs_disable() to be called, but if we
> > > require pcs_disable() to be balanced with a successful call to
> > > pcs_enable(), that messes up that driver, and pretty much makes it
> > > impossible to work around the errata.
> > 
> > What if we reordered phylink_major_config() such that phylink_pcs_enable()
> > comes first, followed by phylink_pcs_pre_config() -> phylink_mac_config() ->
> > phylink_pcs_post_config()? Superficially looking at pcs-639x, I don't
> > think it would break.
> 
> I'm sorry, but I don't have time to continue this discussion today. I
> woke late, we're trying to cram in the meals (in the middle of delayed
> lunch-time dinner right now), work wants a quick call to discuss a
> project that I missed the meeting for yesterday (which I haven't yet
> had time for...)
> 
> Sorry, but while you may wish to get this sorted, for me this is a very
> low priority issue that can be addressed later. Don't think I will have
> time to review anything you send - and that's not a personal attack,
> it's because I'm barely managing to hold everything together at my
> end, and I don't have the time.

Thanks, this was a good talk, I understood a bit more about the
challenges that need to be overcome. I'll do some testing on the
Turris MOX with a 6390 switch. From my side this shouldn't block the
stmmac integrated PCS from being integrated with the SerDes, but I do
agree that leaving a comment explaining the current phylink_pcs calling
convention, as Jakub requested, would be very useful.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
