Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7CB8C4A45
	for <lists+linux-stm32@lfdr.de>; Tue, 14 May 2024 01:53:30 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2DCDC6B476;
	Mon, 13 May 2024 23:53:29 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C2DF1C6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 23:53:22 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so5287113e87.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 May 2024 16:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715644402; x=1716249202;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=R+cOP9mgHdcUT8syROC27GujJ57GKSD45vkWwJ1/n4w=;
 b=hGZ0awl6dweNvuWaBYpiKnL7UEwpww59IzjN50ywC9HRfb7gye9r3OYBVilf7FVS6L
 AXkSMLoTXTK4ISDdn0CAzFzBJSnGiatnLwSUZrfgCpRJi1isUxLf+s9dxfpOLplYNyx/
 hN1BxNJgXmQhaafI8oEcHI5oMbCJRZcQeee95dnC/oy5ZzEnfAptu/P+43VBg46XhV95
 JS30v+wi0CJv6Z0RxdqIcu3asJxkq7/5xT7H28QDFueb+XE5jTeuJvx+CbNoJejcCVCm
 GT0eVtenjcapzOAX2opKx+UUm5iez4d1GYiiBH3oPDj2SNcs7qP+vChtdMlbg40BkZYH
 2fsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715644402; x=1716249202;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R+cOP9mgHdcUT8syROC27GujJ57GKSD45vkWwJ1/n4w=;
 b=e455OS+HyovAg35azgyfaiLiKsygP+x0qkhYqo6S0KrjOjMmsKS/Q5ZsdHlYFxjLs2
 8joO53/vJJexFISAnT4QzVkk5795UDKKZVtbukzKYAKMQKdmSsnbEvbOmRz5ZkNxc5nR
 1HtOT2uoi8PEKwQ5gOSw+7y9aSjyxqk2ug/4eCyLaEwSZBr3O1FG6ZNqxrYwMNgkhCia
 9dFTcz701hBvdkfF7uV793H6OK9YW5ZZKGszyOkF1i1rjJRS4kyaTEXZSp4V3IAN5szb
 J89G+y3AMQ8hLqfIkBEq07Sax5goRWiyOFcB1C4ricS8wZv0QO2n51/IS9LE1LfcSeoe
 ykpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU08r4Vr4TaOQoYGjGveeP1Ftpl/RNBgpS9r6XhDfs+VgRCOWoiICrECMRbwXsFn+oAUtxZqdiGIkiOB0nLOJQp+xGz5vjeoTFwc2nrwRM9LcURr902N5MW
X-Gm-Message-State: AOJu0Yxbi6zy/PK0d2m5i2VWz7PBSNAoo7vU+BfJ+ilFkDLbyL/n7nZl
 eCsL02hgQe4/ySSoExbk4ysqxgM7UXsKREWEivCc5rxeynwsSg+T
X-Google-Smtp-Source: AGHT+IE1GjZH3oJxU4HUXHyIk/vCKzT3VdKQBPxQK0G4bhVU96P+esjbYQj0lhElqTJLfthkCCFq6g==
X-Received: by 2002:a2e:8748:0:b0:2e3:4f79:4d26 with SMTP id
 38308e7fff4ca-2e51fd3fd73mr66915891fa.11.1715644399831; 
 Mon, 13 May 2024 16:53:19 -0700 (PDT)
Received: from mobilestation ([95.79.182.53]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce3113sm15856831fa.36.2024.05.13.16.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 16:53:19 -0700 (PDT)
Date: Tue, 14 May 2024 02:53:17 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <5v3ur3cm6xkuomu3eirbtjg6th32dreqyotfnqcuumb6bmkhkj@62r5gpaky2gd>
References: <ZkDuJAx7atDXjf5m@shell.armlinux.org.uk>
 <y2iz5uhcj5xh3dtpg3rnxap4qgvmgavzkf6qd7c2vqysmll3yx@drhs7upgpojz>
 <ZkKghpox1r6ZqtyB@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZkKghpox1r6ZqtyB@shell.armlinux.org.uk>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC 0/6] net: stmmac: convert stmmac "pcs"
	to phylink
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

On Tue, May 14, 2024 at 12:21:42AM +0100, Russell King (Oracle) wrote:
> On Tue, May 14, 2024 at 02:04:00AM +0300, Serge Semin wrote:
> > Hi Russell
> > 
> > I'll give your series a try later on this week on my DW GMAC with the
> > RGMII interface (alas I don't have an SGMII capable device, so can't
> > help with the AN-part testing).
> 
> Thanks!
> 
> > Today I've made a brief glance on it
> > and already noted a few places which may require a fix to make the
> > change working for RGMII (at least the RGSMIIIS IRQ must be got back
> > enabled). After making the patch set working for my device in what
> > form would you prefer me to submit the fixes? As incremental patches
> > in-reply to this thread?
> 
> I think it depends on where the issues are.
> 

> If they are addressing issues that are also present in the existing
> code, then it would make sense to get those patched as the driver
> stands today, because backporting them to stable would be easier.
> 

Sure. If I get to find any problem with the existing code I'll submit
a fix as an independent patch.

> If they are for "new" issues, given that this patch series is more
> or less experimental, I would prefer to roll them into these
> patches. As mentioned, when it comes to submitting these patches,
> the way I've split them wouldn't make much sense, but it does
> make sense for where I am with it. Hence, I'll want to resplit
> the series into something better for submission than it currently
> is. If you want to reply to this thread, that is fine.

I was meaning the "new" issues. Ok then. I'll prepare the fixes as
incremental patches either on top of the entire series or on top of
the respective patches, so the altered parts could be spotted right
out of the patches body. Then I'll submit them in-reply to the
respective messages in this patch set. After that you'll be able to
squash them up into the commits in your repo and re-shuffle the
changes as would be more appropriate.

> 
> There's still a few netif_carrier_off()/netif_carrier_on()s left
> in the driver even after this patch series, but I think they're in
> more obscure paths, but I will also want to address those as well.

Yeah, I noticed that. I was going to discuss this matter after getting
the changes tested.

-Serge(y)

> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
