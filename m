Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JK6LbsT+mlRJAMAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 17:58:51 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD354D0C3F
	for <lists+linux-stm32@lfdr.de>; Tue, 05 May 2026 17:58:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id ED2AFC87ED0;
	Tue,  5 May 2026 15:58:50 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25D09C055F4
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 May 2026 15:58:50 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4852a9c6309so44081655e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 May 2026 08:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1777996729; x=1778601529;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=01VfL6gZZIzvH10mF1K5m6OM2N7Xtov5WNdZLRl6ixg=;
 b=ermh3cieEGmfhxujohfmZKy+niOY5MSNw8pjQqN2QfFB1/IoTNNyV/uCxCGOqq7vRQ
 igaewPTyradbRvWptmfsbSixjHsdpxm66pFp4w6ZsEo2ERS5hT/WFzXrznbEE8qfJDfB
 zFiSvJ8YVxrbSojcZUJn2+a0c2wXHO+2a6WS/tXFGvDgqaCrAXYrwA2AVl0/mGKFc4Id
 +OupCcdSB01dqaH6B143pv7G4Kw9u+CPnVMVwF03cboA4FP8BRRR1U3mxC2euMWWrDdX
 p4A55qE1gRBWDS8OmAvglCkkdfw7/jdRoDojc1m/j/uuJyd/hszbB09DQNo9aCe/xTG2
 25Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777996729; x=1778601529;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01VfL6gZZIzvH10mF1K5m6OM2N7Xtov5WNdZLRl6ixg=;
 b=svM+N8vSXKwucnVT5hnwtgRBO1lwcVldEP/j5X1PLdeGac7g5wklNHnYXkggfT9jAZ
 C8coSgirogTygCcVnaWsyI8NJ/+Wb/7CSY6tGyXU4qlFC/NglCNl/aXuU9FqUg+ldo6Z
 0uZHAvwRu1cObgc7BOABQZdOlbSQdGMCyoKuuUjwaBjbgr4aowX2D1Nub4ywCidqCm7X
 rtVYvHMn3zR7XBbrbjOJ8ElXAO/FFLXv5ZkSgXnPQcJp+TTCQev9m6Jlz5WQ3aObvh4Y
 M0vmjFnPXxWT4HxjRNyDZNKioBo+ayjcoXPodGb4dAsQYVLJgjTPEE5ag4SwHi6IjT18
 ftvA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kLfnvwkZ0GOhIGq5g8npEhdz63OXCXRRMIyGDtmaM98purNu8l6/VhbzAOl30gJfzx2zbs5zo3JsbCQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yy5Ar9KbHF4YLl8aJQu1YTOTDUdbtEDjAjMrXM/iN+6sMgvm1tI
 5RmDsdGLu1TcG2+jn9/abxFrqZHWZLfm9ce0/pTemJLI9QnrBkeOS0e/BoQF2IdZZKU=
X-Gm-Gg: AeBDievaA79FrsGgxTwncxiao3ITnQMG4PWLOJvo2VAwX76ekAmrUnTl58eOtTwG3md
 UNJuWqGkG3tY+J5t+giMp1wRv+avzXGa/BDMXlwdUA8vOXl7iu7VA99JqUMgC16WJpvBK6uxvO8
 ag7hdDGYsPvSwTqU/WUPRL/BTb7UXavSrvtTsKit0l+zYlqf4IGf4ErKjF1WZS2gwW1yfgDAY1Q
 3fVVu/FG57H6AX7sAmWdmADAX+f1Ut9ehtx2KK8j6+O4m8EYQbX9ofnRCB2i2Oer0wzJoDen347
 2M47vEMZXGS0Ja2q24mvrk23E+yuk7Ucd4K0LOXOVYzujvRgr3+qDC3qB25U5B3RdPAIXVw7qWg
 J9SfA1IAYMi0gp5zUBJ6iZ30+fBneM8pLNhPDM/yH8/bH/2p92nFkMbf+tBSeUgt6x+4XjtD4bP
 Mf3Hc99AP4UUbqDH09bGvVR/yZmsDnmP26kNSz8UXfQXGLTtKeXbqrWRM6m5t2etNs8I44EjMUQ
 Z2CA5JgMLomQQF29E+ZISDFcWIqRHyabFhruX/06fZ/j0NhfIFBr4j57L/4L8GFpqkJWrQH+BQU
 n+V/ekXKwMkfUvDBJ0s=
X-Received: by 2002:a05:600c:528e:b0:489:ecee:c4ef with SMTP id
 5b1f17b1804b1-48d18bde33amr61483785e9.13.1777996729166; 
 Tue, 05 May 2026 08:58:49 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a822bf3ffsm444582355e9.7.2026.05.05.08.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2026 08:58:48 -0700 (PDT)
Date: Tue, 5 May 2026 16:58:45 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <afoTtdAO23DhOeZ8@aspen.lan>
References: <20260501155421.3329862-1-elder@riscstar.com>
 <20260501155421.3329862-3-elder@riscstar.com>
 <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9a581a2-02ea-4948-8c97-835cb7638b1d@lunn.ch>
Cc: me@ziyao.cc, ast@kernel.org, linux-kernel@vger.kernel.org,
 chenchuangyu@xiaomi.com, edumazet@google.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, robh@kernel.org,
 mohd.anwar@oss.qualcomm.com, weishangjuan@eswincomputing.com,
 Alex Elder <elder@riscstar.com>, daniel@iogearbox.net, chenhuacai@kernel.org,
 john.fastabend@gmail.com, maxime.chevallier@bootlin.com,
 siyanteng@cqsoftware.com.cn, sdf@fomichev.me, kuba@kernel.org,
 pabeni@redhat.com, konradybcio@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, hawk@kernel.org, arnd@arndb.de, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, richardcochran@gmail.com,
 rohan.g.thomas@altera.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 livelycarpet87@gmail.com, linux-gpio@vger.kernel.org,
 rmk+kernel@armlinux.org.uk, wens@kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregkh@linuxfoundation.org,
 linusw@kernel.org, a0987203069@gmail.com, davem@davemloft.net,
 andrew+netdev@lunn.ch, boon.khai.ng@altera.com, mcoquelin.stm32@gmail.com,
 inochiama@gmail.com, krzk+dt@kernel.org, julianbraha@gmail.com,
 matthew.gerlach@altera.com, andersson@kernel.org, hkallweit1@gmail.com
Subject: Re: [Linux-stm32] [PATCH net-next 02/12] net: pcs: pcs-xpcs: select
 operating mode for 10G-baseR capable PCS
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
X-Rspamd-Queue-Id: 5AD354D0C3F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew@lunn.ch,m:me@ziyao.cc,m:ast@kernel.org,m:linux-kernel@vger.kernel.org,m:chenchuangyu@xiaomi.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:robh@kernel.org,m:mohd.anwar@oss.qualcomm.com,m:weishangjuan@eswincomputing.com,m:elder@riscstar.com,m:daniel@iogearbox.net,m:chenhuacai@kernel.org,m:john.fastabend@gmail.com,m:maxime.chevallier@bootlin.com,m:siyanteng@cqsoftware.com.cn,m:sdf@fomichev.me,m:kuba@kernel.org,m:pabeni@redhat.com,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:hawk@kernel.org,m:arnd@arndb.de,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:richardcochran@gmail.com,m:rohan.g.thomas@altera.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:livelycarpet87@gmail.com,m:linux-gpio@vger.kernel.org,m:rmk+kernel@armlinux.org.uk,m:wens@kernel.org,m:bpf@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:gregkh@linuxfoundation.org,m:linusw@kernel.org,m:a0987203069
 @gmail.com,m:davem@davemloft.net,m:andrew+netdev@lunn.ch,m:boon.khai.ng@altera.com,m:mcoquelin.stm32@gmail.com,m:inochiama@gmail.com,m:krzk+dt@kernel.org,m:julianbraha@gmail.com,m:matthew.gerlach@altera.com,m:andersson@kernel.org,m:hkallweit1@gmail.com,m:johnfastabend@gmail.com,m:conor@kernel.org,m:rmk@armlinux.org.uk,m:mcoquelinstm32@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[49];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[ziyao.cc,kernel.org,vger.kernel.org,xiaomi.com,google.com,st-md-mailman.stormreply.com,oss.qualcomm.com,eswincomputing.com,riscstar.com,iogearbox.net,gmail.com,bootlin.com,cqsoftware.com.cn,fomichev.me,redhat.com,arndb.de,altera.com,bp.renesas.com,armlinux.org.uk,lists.infradead.org,linuxfoundation.org,davemloft.net,lunn.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	NEURAL_HAM(-0.00)[-0.863];
	TAGGED_RCPT(0.00)[linux-stm32,dt,kernel,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]

On Fri, May 01, 2026 at 06:50:45PM +0200, Andrew Lunn wrote:
> > +static int xpcs_config_operating_mode(struct dw_xpcs *xpcs, int an_mode)
> > +{
> > +	int mdio_stat2, ret;
> > +
> > +	switch (an_mode) {
> > +	case DW_AN_C37_SGMII:
> > +	case DW_AN_C37_1000BASEX:
> > +	case DW_2500BASEX:
> > +		mdio_stat2 = xpcs_read(xpcs, MDIO_MMD_PCS, MDIO_STAT2);
> > +		if (mdio_stat2 < 0)
> > +			return mdio_stat2;
> > +
> > +		/*
> > +		 * If this XPCS supports 10Gbase-R then it will be the default
> > +		 * which prevents 1000base-X and slower from working correctly.
>
> It would be interesting to know if Toshiba messed up the integration
> of the PCS, or there is an errata for the licensed IP.

I'm afraid I don't know, but it looks like the issue is not unique to
Toshiba!

This is a discovery which, rather to my chagrin, I only made after we
posted the patches (thanks to a hint from Sashiko): there is similar
code in txgbe_xpcs_switch_mode(). I cleary overlooked that when I
originally reviewed the existing XPCS code. I suspect I stopped
scanning that code path due to the PMA related conditional branch...

Regardless of how I missed it, txgbe_xpcs_switch_mode() implements
similar logic to this patch. I think it is using MDIO_PCS_CTRL2_10GBX as
the Reserved value but otherwise looks similar. There are comments that
imply 10Gbase-X isn't implemented by their XPCS which would make
MDIO_PCS_CTRL2_10GBX reserved (but are too vague to be 100% sure).

Right now it looks like xpcs_switch_interface_mode() and my
xpcs_config_operating_mode() are more closely related than I realized
so I plan to move my code into xpcs_switch_interface_mode().

I don't think I can unify the Wangxun and Toshiba code (the waits and
resets in the Wangxun code make that too high risk) but I'm not yet
ready to give up and just make the Toshiba changes into another vendor
quirk!


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
