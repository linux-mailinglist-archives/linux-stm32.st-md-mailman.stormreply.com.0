Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3q7JCAWFo2lWFwUAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 01:15:01 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1391C9CC4
	for <lists+linux-stm32@lfdr.de>; Sun, 01 Mar 2026 01:15:00 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id EA745C030D6;
	Sun,  1 Mar 2026 00:14:59 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 9FDC5C36B3D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun,  1 Mar 2026 00:14:58 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4398d747f7cso284355f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 28 Feb 2026 16:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772324098; x=1772928898;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zYnsoG7qDnrk7Z/gOuxzAyQoovXIM2RIYjUlYbsloBk=;
 b=Cb5o4vZNirwGobtIreqAL3cFuyEx56bm0EpNr7EHlSTGF6w/ucCJmZOZXUPOATkLzv
 ufIGtRlab+NeYDX1yz+NUzUC9NBJlPbtBCWMMPxV+GDm4glY6gklnn5NYnUTc61pabB8
 hkYbrJ332Rw7JpRYLkKRmo7HpIU4PpwcP3qdj9wucDIaPBUhZN+vM3DkfmIAvB2g98Ss
 S/e2JdrfHbnjCgBC3O2azjR5wqSe30xmxymGqEdEu7gD2mZLAvwSL2cyrO8gd7BpljMK
 0KgW3w3onvwN2li/XqyLe3AxW+Sqx3Uv8/TeApNhsZxb8Gmhrm0uGovF6guLDdsaI1GE
 49ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772324098; x=1772928898;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zYnsoG7qDnrk7Z/gOuxzAyQoovXIM2RIYjUlYbsloBk=;
 b=mJAq37+NzZNK5cv9LtXoOX2QzkBzIaJhLJXZWTZHadLsfNpWoSGEltK9xKRWoiDPps
 kmKqggTdVCrNzi6QnbbXXvxYHmtJ7XaVp8F7Me5Dml2tL4Emwjc55xfQroqa/VJAiDXf
 yMQkl4WrbO2EO39KnyhFz0e5SoeYPWkbLRo3XSbkOc01jEOUL1TZxX5XITJUV4Bf6w4h
 yA1vlCzfH72v09ZLckgwr8V7atkCtgTU9GpmeOlktcc/rLNb8IGsE6YkfDZs8SRwM+0u
 7R57ct81C9o1CEnmVZUkOn45zBgoSSTLm+PCrAf+7hDfuk1DnFpFgAieaYRh5fnTft0P
 JUtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrTAwM2a5q3iphss5vf9OXh1aDMgs3Csp1Wg4a+JxUfD6T80smHl+Xsss6mqfs/ZcYubUFX78WAlTcgQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yzm73e5Swbhw5AaKLjQfavOieU1qLGTlJvX32Fcfal+vBCFcS1A
 118yJcxWxpvu8EBPgk+laHW0plTxZgjnHbX5BTXeVyEkZlpc9vTLbcKK
X-Gm-Gg: ATEYQzxc19ZuBD8QwujogBeRgQ3MhQfaPpgmyyBaDgZ/Zq3YHslY5bqLsmD+W3k/Gm0
 VLWd9AKlN/i9Qvb1m/RhKp2MM/xprzqzw6L45CZVL7tgrM4kf1b/7AG/9dHrfUuyaf5EKFA6KjA
 B+8Jb4UR0AUXAvvB62zUpwKFBlFUCGbDaxcHh+qj2mH1GtbadGv3kEG8uLXkrRbIfw5Tkxas3uH
 DLpXfZGftv+xFLN5LjmN4T1yds5YCqPMTkqKWN1nMiZNSLu8bZXcxdHJuctzKkncpTlOEElbu+v
 f09zit5cVxtWBYKJqlbKPl4bN7FpjkaBVJbXPOJMbMJP0QUvMBcLjbvJc7jOdXC++uVejg60vPo
 q2RSKIshMszMVWsiLfWQkDl74IThefYC8ZVDnL+WX9DuoH0vrGa+t2zsRJ90F5te142/21ov25t
 7s29NxUvADrS6OqpOBcf4=
X-Received: by 2002:a05:600c:474e:b0:483:7d93:9fb7 with SMTP id
 5b1f17b1804b1-483c9b99876mr77353565e9.2.1772324097547; 
 Sat, 28 Feb 2026 16:14:57 -0800 (PST)
Received: from skbuf ([2a02:2f04:d608:3a00:53bb:2a43:1888:95a0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd75dfaasm278799855e9.12.2026.02.28.16.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Feb 2026 16:14:56 -0800 (PST)
Date: Sun, 1 Mar 2026 02:14:53 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20260301001453.lpd2rawy7bqxyivp@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260228083111.5df8550c@kernel.org>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:kuba@kernel.org,m:andrew@lunn.ch,m:mohd.anwar@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux@armlinux.org.uk,m:andrew+netdev@lunn.ch,m:edumazet@google.com,m:vkoul@kernel.org,m:netdev@vger.kernel.org,m:linux-phy@lists.infradead.org,m:pabeni@redhat.com,m:davem@davemloft.net,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[olteanv@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email]
X-Rspamd-Queue-Id: 9E1391C9CC4
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 08:31:11AM -0800, Jakub Kicinski wrote:
> On Fri, 27 Feb 2026 16:55:56 -0800 Jakub Kicinski wrote:
> > On Sat, 28 Feb 2026 00:11:29 +0000 Russell King (Oracle) wrote:
> > > The AI review for patch 7 says:
> > > 
> > >   This commit fixes a bug but lacks a Fixes: tag. The commit modifies
> > >   behavior introduced in 360000820ae2 ("phy: qcom-sgmii-eth: add
> > >   .set_mode() and .validate() methods") by making phy_power_on() call
> > >   qcom_dwmac_sgmii_phy_calibrate() to restore the previous setup, and by
> > >   making qcom_dwmac_sgmii_phy_set_mode() check if the PHY is powered on
> > >   before attempting calibration.
> > > 
> > >   Should this commit include:
> > > 
> > >   Fixes: 360000820ae2 ("phy: qcom-sgmii-eth: add .set_mode() and .validate() methods")
> > > 
> > > which is _wrong_, this isn't a bug fix.  
> > 
> > Yes, that's what I thought but then I saw the other thread..
> 
> Trying to apply this now but stmmac parts don't apply on Linus's tree,
> and Vinod wants a tag :( What do we do? 
> 
> Could you, perhaps, send us a PR with this on top of Linus's tree 
> (a resolution of the inevitable conflict with net-next would be helpful
> too).
> 
> Or do we give up on the tag?

Actually, I think it's mainly me who wants a stable tag. I'm working on
a series for phy-next which will conflict with this hunk from Russell's
patch 1:

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 5b1c82459c12..4ea3dce7719f 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -7,6 +7,7 @@
 #include <linux/ethtool.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/phy.h>
 #include <linux/phy/phy.h> // this gets renamed to <linux/phy/phy-provider.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>

If there's no other way to provide a stable tag other than on v7.0-rc1
(like for example a snapshot of current net-next/main), which I didn't
know wouldn't be possible, then I think going with the route of fewer/
more trivial merge conflicts makes sense.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
