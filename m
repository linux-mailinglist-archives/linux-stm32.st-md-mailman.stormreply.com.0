Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b3BHBYjLTGp/pwEAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 11:48:56 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C353719F47
	for <lists+linux-stm32@lfdr.de>; Tue, 07 Jul 2026 11:48:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=riscstar-com.20251104.gappssmtp.com header.s=20251104 header.b=c75kS54r;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=riscstar.com (policy=none);
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 29AD8C8F273;
	Tue,  7 Jul 2026 09:48:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 58444C56600
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jul 2026 09:48:54 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-493b6f1b14bso15386635e9.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jul 2026 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783417733; x=1784022533;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Qs3A+LONAtni+h8Qp1wmlltG03uWEkxp59/Fd3Ox+rE=;
 b=c75kS54rKC6y77v829i09Iv/vCi9l7FslAFDu0TyN3KFBseLwgdQMgHmwAXxsbYPCn
 2vtBdUp0g634ymLOEkbUI+uJxAh2KEZ3zNLI8E5P95+jpkntRVf9TpoIQ9W7lyA58MZ+
 maWCcXNTTPstPlW7hOS8bDiRiVMNTjJ7uTwzAI7sSsx5BLGEawgU7G1lH8rc+93/fths
 Ml/vYVJOXpCefTjp2eQENdWR5rFjSDXyJHGJ7gJc5ITMfeQaYtxaMw0rkk2tLcDtXpST
 dVx4gMk5krUIbuWrKDl/jYtXmlWBKysyG8ZWgqGJyJpJyfZbhZ7gMWcxxizpH+E1Jt9j
 ITYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783417733; x=1784022533;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qs3A+LONAtni+h8Qp1wmlltG03uWEkxp59/Fd3Ox+rE=;
 b=LHD0XpNoJgpuQh9XXBH7UU3YltH05g2FfsVT4EpXtWq56CUAfm1lFkCG7fhp7WImpq
 wszjIYTcO5S2gz+85dSaSiwssPbknRLcwGxFsfDPYss3HxIGcz+634GVWWgl2CiGdXhy
 HN1IP7D1E7+Tcum+S4eac08hp2FfNCGt4kJvKPPh9KnxVMFSzOkmnaHE1ST1G1p28yZS
 LdxCQ7ZCmhudUxTXh7IZMsev+MKmGmsX/yD9vmPNJ4JLK5x+ATtPbixr0gMgsXOiLhTi
 AN5Jjuo+SvxXxXoHRPJAX/yhKIhXuVIRFWpQMalynhB58+5Ai3ki8V+Tmf1Ym2uJKIKb
 A5xQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoTjz4UYakAvVlxwqcuFIIkLl/KQJO0quLzbC4y2o1dPR6f7U3J+AkVGT0Mvn7lz9WxsDPAFvWdmRW+iA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzauBN+MCHRXgfdlvM6mTYl8pdu3lG+SRtW7nboXtiUpPSAd3vN
 eC4f8QeDGGiHDVcbcna2InC5Hny2VXMkrBcKS/BHEIAFrFWec8W5QBGXSk1zTx/BzLQ=
X-Gm-Gg: AfdE7ckhb55UoPwjlnk/lpej0sBh821CebiWg0YlKG/NmqdcxcRTOHO+svBsxsWeBWB
 PISEMbr2ttfMXGeQjs014PLzMk4YUZMlNY6ovYwEtLSfo44HwM79nUqsR1w9HyWk+a1rikyzejw
 mqlc9RrIslTzw13MR+v40OcY86SZI/ZR1vcnlbCkZwnMiZ0C/Pa64W+OvfHlRBl+Hgyp8kBd4ww
 bZeSRupQahBamho9TCZbsFH/qehoSU2rt/OVSH7CQoNUdYyOuBueLFGWs8EC8lYCeAZO/a3lh8c
 BUo0dcr8IRpX9s7Ko4gbyoGf9DL7/SMyFBu6K6ML/ZpWisRvKEs8dB8ydof2oDZThSonHd9cX2N
 dTMhHct49kN8aqrmy07rcLaaanoM7DonFSGiJOV376GyUpRrq20fnd1qltd/XP2MnmSPCLQSkij
 aLOSGFY4RsxR+VQMEDD0xcGfAbKW8aF3SQxHOlaHMkqdL6zWoZxw6AEnmG/dndh/kyO0CRbmdSf
 6p34JYY1Fkcm3GcjaOZY2oPareP73gqcJmntmoVo9pdpe4QQ0Vfq+LEh+j4NWTGQjxuWZVzhg==
X-Received: by 2002:a05:600c:8b67:b0:493:bd2f:c5dd with SMTP id
 5b1f17b1804b1-493df08c35dmr46181645e9.21.1783417733495; 
 Tue, 07 Jul 2026 02:48:53 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e0078d49sm47904175e9.0.2026.07.07.02.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2026 02:48:52 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:48:50 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>
Message-ID: <akzLgrzsw4xYmnLH@aspen.lan>
References: <20260706-tc956x-stmmac-no_irq_teardown-v1-1-df009d0272bf@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706-tc956x-stmmac-no_irq_teardown-v1-1-df009d0272bf@riscstar.com>
Cc: Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: Avoid freeing and
 re-requesting IRQ during XDP set prog
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
X-Rspamd-Action: no action
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,foss.st.com,iogearbox.net,fomichev.me];
	FORGED_SENDER(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:hawk@kernel.org,m:john.fastabend@gmail.com,m:sdf@fomichev.me,m:elder@riscstar.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stormreply.com:url,stormreply.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,riscstar.com:from_mime,riscstar.com:email,aspen.lan:mid,st-md-mailman.stormreply.com:from_smtp,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C353719F47

On Mon, Jul 06, 2026 at 05:17:58PM +0100, Daniel Thompson wrote:
> Currently stmmac will run a full cycle of IRQ tear down and setup when
> setting up a new XDP program. This makes tuning TSN systems difficult
> because whenever a new XDP program is installed then the irq threads will
> be stopped and restarted which will undo any thread tuning.
>
> The problem is avoided by removing stmmac_free_irq()/stmmac_request_irq()
> from stmmac_xdp_release()/stmmac_xdp_open().
>
> stmmac_free_irq() implicitly synchronizes interrupts and, with that
> removed, I was unable to prove that later actions in
> stmmac_xdp_release() are safe when there are concurrent interrupts. To
> avoid problems let's also move the code to disable DMA interrupts earlier
> in the sequence and explicitly sync the interrupts handler(s).
>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> <snip>
> @@ -7156,10 +7201,8 @@ int stmmac_xdp_open(struct net_device *dev)
>  	stmmac_reset_queues_param(priv);
>
>  	/* DMA CSR Channel configuration */
> -	for (chan = 0; chan < dma_csr_ch; chan++) {
> +	for (chan = 0; chan < dma_csr_ch; chan++)
>  		stmmac_init_chan(priv, priv->ioaddr, priv->plat->dma_cfg, chan);
> -		stmmac_disable_dma_irq(priv, priv->ioaddr, chan, 1, 1);
> -	}

Sashiko picked up that stmmac_init_chan() has the effect of enabling DMA
irqs, making this code unsafe.

Given stmmac_xdp_open() can only be called on a running interface (and that
stmmac_xdp_open() explicitly sets sph) then re-initializing with stmmac_init_chan()
should have no effect and we can drop that as well.

I'll double check with a code review across all the dwmac versions
before pushing out a v2!


Daniel.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
