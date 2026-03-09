Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEr+CObqrmlRKAIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 16:44:38 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFE123BF3A
	for <lists+linux-stm32@lfdr.de>; Mon, 09 Mar 2026 16:44:37 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4C332C2909A;
	Mon,  9 Mar 2026 15:44:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7B9CAC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  9 Mar 2026 15:44:36 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-439b94f879aso557250f8f.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 09 Mar 2026 08:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773071076; x=1773675876;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qcTW7+6Cg2+gxZdrQfqfkBSqoWwEQDXBlUTitYt0Mio=;
 b=jGvWya+21gGdjWpNsyPY3/NgVzQyfXD+mCQCn7bDdgYy/N6IkL04jgdth+K+vRnLXa
 lAt+TT25iS2PEhGQ465/gnHuDNvXm3GzkEh9Qohe7vmMemInrV07gckXBqVyoUtIVo0C
 VxBsNKxkUexcztrNZwoIU3J6LT0taC/7VZWNIjQgt1SnJGoubM967EkX6mh0EWNV9xJd
 yZgRDc2me9lv+GBBj5WTMlyPCbYM4W2DSsBtzM9iE99fZIUK420z5Gu4MojMhfUNuysw
 gTYPLoVWeDcm4hzp3/ZG4p1fblb/xQUXZCVRWGXBTe7fgeJ4ALm9r0I1XM88b4Qk8VzG
 xTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773071076; x=1773675876;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qcTW7+6Cg2+gxZdrQfqfkBSqoWwEQDXBlUTitYt0Mio=;
 b=OwomJRKS9633QXnkpFGuiNsa/KeRqapAzJB7hIUh0/ZR0MVsUNzGcyhe4r8tQtW7rW
 sjCFSelq4/UJcXg/1N+ZDu3PMNZos7jK1GW/ObGekaahZDNV8rK8+z1LME0Y/H8LXQFD
 lbs4l3/nCyVAwDYzHQbaVxNtiWXUFNoLmnc8Tpx/fnbJUNmRWtEPxiV849xMcRl7SQTc
 Alnrx6vAA4VAAnoUBPfqvpZL7QN3k69Bjs3WC0c2Pfudu0E1IRyvMVdId7vNLRD1Nl8x
 7AV6c/tiZ/p8iw8CS8sxbWCBXp38VPhq+ENzZl24Rn1LBHZaXVtK/0OuDVmsoYTznWWb
 1Ckw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJ/l9GqupssDXXbAAVlVINx1bl7epWwaMNcCGF9ZYOFeoRGB6fanrcot1/B0ZeJUhJP+dYFMMgjKOP7Q==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzbgNEnRn2Me1pQ2Y+v9QCFsKnXWKmRCa7RX0Vf7Fz/zfkcmPiO
 lj148J0xo4pa/VOZzWsv3pu6h5N0v1ffZUqsTiBEDHs/npkQEWAt+ZOU
X-Gm-Gg: ATEYQzyIYXHVe16dO1ZRIESHIhmzoIargDs8wEHNtgfoYvW6o/MklTf0XSZy45AU9I5
 0uQKKq4kNThAh4Nx1vWIDr2GP0Hkkso9zPlseRdbAfnCCCncLTYV/hT8EoWTkjROHMXSMDvYlra
 Dc/8JHU/ubeQbflnOJ+ZbnrvRojj2/Kvnz67xI//gbwQdW3Ras9ei43e9eyyeVRqZppHO21FQrQ
 uRKMrQfcdzNut1OHoMsdMYiK1Gi6Ca8MFdQ+KNiExQWdOXyAC5vbKb1ENaZABv9sD0GKqJa37tB
 bTEziSc1f5uEnQmroFNw/myAvnZrlTGKL6NLKz51slM+Dp1NNiaTf0tStKoLF61q9C+V1y0VP9j
 8H33r2fGLlyszj0LyJzjDOroQH3N9Y4Lo4vcp+DCVx9/H4rpuu29p0gbBiwMjE3UU6Hj/l02QxQ
 fCKqcpWPLaQWsGRQ==
X-Received: by 2002:a05:600c:c4a2:b0:471:ab1:18f5 with SMTP id
 5b1f17b1804b1-48526978618mr112712015e9.7.1773071075458; 
 Mon, 09 Mar 2026 08:44:35 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d00a:e00:8799:3a7d:3c86:3200])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541a6bbcesm439845e9.3.2026.03.09.08.44.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 08:44:34 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:44:32 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20260309154432.b3dbantow3e3tkry@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
 <aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
 <20260227165556.5cf9e844@kernel.org>
 <20260228083111.5df8550c@kernel.org>
 <aaRBjWhP4-7Kru9D@shell.armlinux.org.uk>
 <20260302155736.1fd2980e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302155736.1fd2980e@kernel.org>
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
X-Rspamd-Queue-Id: ABFE123BF3A
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
	NEURAL_HAM(-0.00)[-0.095];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 03:57:36PM -0800, Jakub Kicinski wrote:
> Alright, I think the best we can do here is to merge patch 2 
> in a "stable tag" way. The rest will have to go via net-next.
> 
> I applied patch 2, Russell please rebase the rest on net-next 
> and repost. Patch 2 should disappear. I don't want to merge it
> now as is without an explicit nod from Vinod. He did ask for 
> a tag and we won't provide one.
> 
> Vinod / Vladimir, to merge the "stable tag" of patch 2:
> 
> tag_name=phy-qcom-sgmii-eth-add-set_mode-and-validate-methods
> git fetch https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> git tag $tag_name 0e8147f4da00
> git merge $tag_name
> git tag -d $tag_name
> 
> I think this should work.

Thanks for the anonymous tag. I think you mean sha1sum
4ff5801f45b494ad8251a16ec06c9f303ed3b9a0, not 0e8147f4da00.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
