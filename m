Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E26AAFCC5
	for <lists+linux-stm32@lfdr.de>; Thu,  8 May 2025 16:22:03 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F137AC7A821;
	Thu,  8 May 2025 14:22:02 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E8794C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  8 May 2025 14:22:01 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5fa828b4836so207452a12.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 08 May 2025 07:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746714121; x=1747318921;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jNWI+Nclv93Aye+gTppmcR/l9SWzqbEWpt2nqbIN0p0=;
 b=iyx5GEidqyQvfypZC72xz3cROWV9jnAP9YJj+71pFAqsbI5l1WHq9LdN88sUNpHMmb
 BenBUCXoKd41H0DZC8bgJ9FcugN/Be5NwXrAYn/uR2QGtV8aTDnssBVxRqHb3xfwEcZt
 r8zXnhVTWGoLLZ9LUO2HcyYP5k9bpQX2Srkz6ZUqh0L6UzmDXwTr0Q4qoSPitF6TYsOc
 7R9hr7gCsSx7Kot7WfJvrr6cb49XRvI6akVELNb/WuYT8raiz31B1UkIguySUMCfCS8s
 Zs4VDP8qlCtVZR7wC1OjOk6Gqx22lorVjNL6uAsIpZefiKyi0SSjIvNgHBI7mdsXunOH
 rcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746714121; x=1747318921;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNWI+Nclv93Aye+gTppmcR/l9SWzqbEWpt2nqbIN0p0=;
 b=fnoErc7Zrpp+wQ1bVRJ6goQWwSHP86Z3AJXKt59jdUK0yIcT0FcfWbEzm7ZlF8CWiR
 U+wZJkFiXnl1m3JtW715aJNiJH592TfPcnPgh8cZ/fDOl8N4cNNno+3psBMm+PK4sm8q
 daZ1hlgs6Wl8LPtGvtpvVsS+7sLOs3oHO++HDkt6bnPtKQlxrGUIQ2YuuBmro8sHRwtp
 0MyOSNlCsfdYQK75suS4YJkZmUECNP0jRQwMs3ebq+YFvAoWfeE2dOlZvAgtnp5FXefO
 xdmL9IduWo/ss91umAts2s8XCeWA3ouTn2d3tPrayrLqoYN9OGjvByUlZmZma3q6bqSi
 oTWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhyNU1b8MMkpO99ydsugFX+pNPOPT2ldsIx/AI3aOPk0BIErCedUwUxLyVaiCfmuGUlMsRrft74YV1uA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxcA00rwysdnG/jhOYLPawo0hZBPOKOFtuoR6y7Ydb1VnkDqDoP
 M4DLFcjLMzLcPjjv0xT8ibSIpEP6W+o737jDn3BFrGlsRPmkuBrq
X-Gm-Gg: ASbGncusbHw8Zwzqm3Y5YXY7EnJHtIEIwtAJ55tlGR+zek4G5Pm+fCn4v13z/NYCGAz
 5P4sSeL8S+Tvej+1gCFdmyd1P0tMz/w71vfw91uHASnBnEIaHJrEzRg/9aQQzj9HHYD7qh+ksWg
 LLNCFSO4C9Zvw3wiPatRJS36uG3YXnEESw3IOj4FdjNAnD+CuGkWev4W5yHQK5aqbiGZyVdvbrZ
 MavAlZLQBo7e2ErntZeZmC2KrUQrg8h2PnFLeq1dZmh0UsWzuovnKv4nigPqb6eYA6RyZCUjJTt
 gRFG/sw+ALKDHR4bYAbcttrBQTe8
X-Google-Smtp-Source: AGHT+IFfZ2LnoFTAbLbT59dqIXofCuoLaOmROgL2oU2ZsTZgEECOqFTuOXZEyDYUdQu+N8uFOfThsg==
X-Received: by 2002:a05:6402:524b:b0:5f3:7f49:a396 with SMTP id
 4fb4d7f45d1cf-5fbe9f5ad89mr2172801a12.7.1746714120949; 
 Thu, 08 May 2025 07:22:00 -0700 (PDT)
Received: from skbuf ([188.25.50.178]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fa77b8fe2fsm11502312a12.57.2025.05.08.07.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 May 2025 07:22:00 -0700 (PDT)
Date: Thu, 8 May 2025 17:21:57 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Message-ID: <20250508142157.sk7u37baqsl7yb64@skbuf>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
 <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
 <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
 <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
Cc: willemb@google.com, Jason Xing <kerneljasonxing@gmail.com>,
 irusskikh@marvell.com, netdev@vger.kernel.org, bharat@chelsio.com,
 linux-stm32@st-md-mailman.stormreply.com, UNGLinuxDriver@microchip.com,
 andrew+netdev@lunn.ch, edumazet@google.com,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 ayush.sawal@chelsio.com, kuba@kernel.org, horms@kernel.org, pabeni@redhat.com,
 davem@davemloft.net, sgoutham@marvell.com, Jason Xing <kernelxing@tencent.com>
Subject: Re: [Linux-stm32] [PATCH net-next v1 4/4] net: lan966x: generate
 software timestamp just before the doorbell
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

Horatiu,

On Thu, May 08, 2025 at 11:41:56AM +0200, Horatiu Vultur wrote:
> > > > -       skb_tx_timestamp(skb);
> > >
> > > Changing this will break the PHY timestamping because the frame gets
> > > modified in the next line, meaning that the classify function will
> > > always return PTP_CLASS_NONE.
> > 
> > Sorry that I'm not that familiar with the details. I will remove it
> > from this series, but still trying to figure out what cases could be.
> > 
> > Do you mean it can break when bpf prog is loaded because
> > 'skb_push(skb, IFH_LEN_BYTES);' expands the skb->data area?
> 
> Well, the bpf program will check if it is a PTP frame that needs to be
> timestamp when it runs ptp_classify_raw, and as we push some data in
> front of the frame, the bpf will run from that point meaning that it
> would failed to detect the PTP frames.
> 
> > May I ask
> > how the modified data of skb breaks the PHY timestamping feature?
> 
> If it fails to detect that it is a PTP frame, then the frame will not be
> passed to the PHY using the callback txtstamp. So the PHY will timestamp the
> frame but it doesn't have the frame to attach the timestamp.

While I was further discussing this in private with Jason, a thought
popped up in my head.

Shouldn't skb_tx_timestamp(skb); be done _before_ this section?

	/* skb processing */
	needed_headroom = max_t(int, IFH_LEN_BYTES - skb_headroom(skb), 0);
	needed_tailroom = max_t(int, ETH_FCS_LEN - skb_tailroom(skb), 0);
	if (needed_headroom || needed_tailroom || skb_header_cloned(skb)) {
		err = pskb_expand_head(skb, needed_headroom, needed_tailroom,
				       GFP_ATOMIC);
		if (unlikely(err)) {
			dev->stats.tx_dropped++;
			err = NETDEV_TX_OK;
			goto release;
		}
	}

The idea is that skb_tx_timestamp() calls skb_clone_tx_timestamp(), and
that should require skb_unshare() before you make any further
modification like insert an IFH here, so that the IFH is not visible to
clones (and thus to user space, on the socket error queue).

I think pskb_expand_head() serves the role of skb_unshare(), because I
see skb_header_cloned() is one of the conditions on which it is called.

But the problem is that skb_header_cloned() may have been false, then
skb_tx_timestamp() makes skb_header_cloned() true, but pskb_expand_head()
has already run. So the IFH is shared with the clone made for TX
timestamping purposes, I guess.

Am I completely off?

Also, I believe you can set dev->needed_headroom = IFH_LEN_BYTES,
dev->needed_tailroom = ETH_FCS_LEN, and then just call
skb_ensure_writable_head_tail().
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
