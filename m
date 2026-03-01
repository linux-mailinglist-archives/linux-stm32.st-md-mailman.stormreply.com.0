Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OMGAj8spGnZZgUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 13:08:31 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 910F61CF867
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 13:08:30 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 09A2AC8F266;
	Sun,  1 Mar 2026 12:08:30 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DEB2AC030D6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 12:08:28 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-483708b697cso4094545e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 01 Mar 2026 04:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772366908; x=1772971708;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UwOed2BoBm+IaxGS8G+Dca7DMJY6cOw/pE55KOFYvnI=;
 b=WuTnjqJ2yThP1kG/NDS7h7ZNjkXZrDaeR5jN7gz+9ei8/x7vlwNV3bERWvd2MojgS2
 XIF9JurqgQk5iOTG0Zp2SHcHKahiBMfSFiYOuocXqpxacH8X8CNLRMyARycC3LSirp8P
 tuOrDjxD2wFN7ARcRjb7DBMs7l+Dnj72Ks8H3P9ETsDQDpwn8Juw4fWZx/kqlX7EB6QM
 xeX46aVYZMM0sWPgxLUVq8hi1Az7KKvHLhtnzz64RWr74zAjPLKDSoi8lhDd89ECqaj6
 j1Wv7UWMomfpvS5hGxPyw0iBjKz18m+QuzYfENnKvig3zMW9YwdvCQcM0iny0PcHYQ9d
 Izlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772366908; x=1772971708;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UwOed2BoBm+IaxGS8G+Dca7DMJY6cOw/pE55KOFYvnI=;
 b=lDvG78+DIusbDrk2thOCP72uOF/Vn47FC2PNopu3d22RCLIglSm0k749wEOpK0OJyV
 VKqSFcgHji5y4AxdsQROGuP8LSIfmmukxkSqYDGadbxvh98/wPwWdl+XtuEnHBc+yDrX
 r+79+QT5snv9VHzxp2cn7GaPjS3psBKSp/ICt7KqCsMa25c+0RMLvo87rA4L1ZQz8ECO
 t2xAdlQitr3fG9N6C32WuGylleGhjuQiQzyzvZEaZU7NnenGb/wqanx8phoufA1/pHr7
 8hxFJKOpF6mSqu7YWYSHIGKCvcIROINa6yKteljGEvLIPNnIbky4DooMhIr2NGjCsDz/
 egNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnZXjxgTEZio6Yej8Bl+da/HmcmxK/Zz6/PcOmaDze02U5DuEanTmyL1EtUC2aRt/IZgvxmiuFI9W4Zg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YylZ6ZysTzImDpDZeuXcpZeCiaFLO6vsV6570I3+2sNC7jzWLK2
 dGBBLjwLF6TxjHsvXfWLpH0c7sBxzZu10hTx3Fvkft1cfsLxbCe8m7uM
X-Gm-Gg: ATEYQzzjz7V6kVlbY6CUp4hQg72njz0LBGTB3FZLlPAqh5MPfnzphqPd63iaTC52tVs
 6uDcwgDqbsjbWZtUGkJUpm+UPoetxBiWSKvZ5Mfht347rdX8SO03AkIb56Ql/QNcAFNcsb5OaND
 OWwxaqZ3Frii349y/MTfWt+g8L6mRhFsft1/W2a2egiLsQiGU1ju7O4SPTtx9IL/1fbxVqnDSg2
 fj0jCHYycWJIIBe0Esb5PLuw1HfV+FFOqtjPyhU3bGtgpryflH2IqlsquwFC5MXiM1SYEmzLB6e
 XulTUpaNdbdJ5iCaDJnOklttXyNSdH/Y+y/B/CHeujHGDjb6gKal3g80/u0ungFupt/aJ0Fvkgg
 qkbdfUZQ+HBm9lZe7awXcjKJZ1Qj8khsB0q56wZD4mBS/m72qx9OPTs0B66qhJPym4Cu0bTQrsV
 VdJXzOBVCbN14r2DOFR70=
X-Received: by 2002:a05:600c:828c:b0:47e:e20e:bbbc with SMTP id
 5b1f17b1804b1-483c9ba6db4mr86494875e9.1.1772366907868; 
 Sun, 01 Mar 2026 04:08:27 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:8f4c:42a4:aebb:ef65])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd7507adsm363973255e9.9.2026.03.01.04.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2026 04:08:27 -0800 (PST)
Date: Sun, 1 Mar 2026 14:08:24 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20260301120824.ot53bhv7z7kn5lfd@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
 <20260301001453.lpd2rawy7bqxyivp@skbuf>
 <20260228163229.1024f263@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260228163229.1024f263@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 "Russell King \(Oracle\)" <linux@armlinux.org.uk>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Vinod Koul <vkoul@kernel.org>, netdev@vger.kernel.org,
 linux-phy@lists.infradead.org, Paolo Abeni <pabeni@redhat.com>,
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
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 910F61CF867
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 04:32:29PM -0800, Jakub Kicinski wrote:
> > I'm working on a series for phy-next which will conflict with this 
> > hunk from Russell's patch 1:
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> > index 5b1c82459c12..4ea3dce7719f 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/ethtool.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/phy.h>
> >  #include <linux/phy/phy.h> // this gets renamed to <linux/phy/phy-provider.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> 
> That's not too bad.. if that's the extent of the conflict (which is
> probably hard to predict at rc2?) we could let linux-next handle it. 

Yeah, I can't predict the future beyond that.

> Of course assuming Vinod is okay with us merging Russell's entire
> series.
> 
> > If there's no other way to provide a stable tag other than on v7.0-rc1
> > (like for example a snapshot of current net-next/main), which I didn't
> > know wouldn't be possible, then I think going with the route of fewer/
> > more trivial merge conflicts makes sense.
> 
> To be clear, it's only about having a common ancestor, I wasn't actually
> planning on making y'all a tag. I'd just apply the series on top of
> v7.0-rc1 and merge them in. Then anyone can tag the relevant commit 
> in net-next or use as a base for their own work.
> 
> I haven't looked how bad the conflict would be if Russell's work was
> rebased on Linus's tree. If the delta is not too bad, and we can just
> resolve the merge conflict when pulling it into net-next. That's
> probably the cleanest.

I don't think applying the current series on top of v7.0-rc1 would be a
good idea. It depends upon this series in a very non-trivial way,
basically building upon it:
https://patchwork.kernel.org/project/netdevbpf/list/?series=1056390&state=*

For example, that previous series introduces ethqos_mac_finish_serdes()
- absent in v7.0-rc1 - and this series modifies it (in current net-next/main,
it is calling phy_set_speed(), and after this series, it is calling
phy_set_mode_ext()).

By comparison, the merge conflict with me renaming <linux/phy/phy.h>
would be smaller.

> I don't recall us ever making a "dirty tag" on net-next which would
> propagate few 100s of netdev patches into someone else's tree :S
> IDK how Linus would react. It's the least good option IMO.

Just for my curiosity, what difference would it make to him?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
