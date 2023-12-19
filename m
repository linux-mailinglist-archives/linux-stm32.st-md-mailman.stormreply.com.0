Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E5ACB81877F
	for <lists+linux-stm32@lfdr.de>; Tue, 19 Dec 2023 13:30:20 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8D6FAC6B461;
	Tue, 19 Dec 2023 12:30:20 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6F456C6B44D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 12:30:19 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5532b45c286so3491866a12.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 19 Dec 2023 04:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702989019; x=1703593819;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uAE5oZxuQF7vsLFo157rr7pOuH+fIC0h765Im6IICOg=;
 b=VYxRjS6IaoYE/btCGpEIm7MSva+FFnshr3VGq/JfOwrVyxQ3kqMnZGE96nm7bXQVxw
 LaXHpooVzLcrgUVqKS09cjykSPfgxwDTMxEMRExW4Su5mcYcIopeW+obg1dwae94Ak+x
 9CUvMVu0oUdVGv+xxhrs5iypSqlHm2h+FSYNS/aqxIPPNWxVjkqeTIxRzFjnop021cXQ
 4BUs2LWXX10PSj/2kt2hDtsKtankbOLGsDU9NVYElVXiPluvxaC0E4CExRu8qS3yjMC4
 erDVRhIYd+VAtgs1Gj5ukDy/AFXE52hfNP3mBnFOcBVlf+Wz8tbgTblA7xi18IxOSrrC
 2OkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702989019; x=1703593819;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uAE5oZxuQF7vsLFo157rr7pOuH+fIC0h765Im6IICOg=;
 b=GoSF9GOro0nz3E3/q5r7SaJ5nGxlecoCAjG7p2ldvPI7Jgl3+poMdSdNUzac7XBHEz
 KuqYgradj4CV2jCE7ZHLgfFgVMwcyhXtdqPIwYt5UcedsNQFh0xZUlzigRQBFLn31E4N
 F956FBweQZLsT6FWkeBq5eLlUM5D1vzOspXVwK7C7vcghgsM4B7or0MZ8pNeI9KBOANR
 N2C11s5wi8Z6YSYYpt0imh3DpU+8ikfNm27nUo0Tj35ZhsPFnSrYcx6mo+sSbYTIHZJD
 mNQ9gUHMSE+qOFUVQpnBsyf29nTztgveBTJ8kICrVxMZoIp8A7CgpB2F0O+UoeoF1VkI
 D2UA==
X-Gm-Message-State: AOJu0YyoNOGi1d84i1iOvLL9TN8UWTQVesYidWquwBNnHvtVWwhFplh8
 n+UgPhlb7T0sapDiQL4/ZZ8=
X-Google-Smtp-Source: AGHT+IFc5N71mVk34rjjafqWNqN0PdEd8VSeSvwch2jdpbByer+h2AyqIB/ZBY2FIKsYDc2IkcIZIQ==
X-Received: by 2002:a17:906:493:b0:a23:5f76:3467 with SMTP id
 f19-20020a170906049300b00a235f763467mr639744eja.100.1702989018649; 
 Tue, 19 Dec 2023 04:30:18 -0800 (PST)
Received: from skbuf ([188.27.185.68]) by smtp.gmail.com with ESMTPSA id
 x24-20020a170906135800b00a25501f4160sm492406ejb.1.2023.12.19.04.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Dec 2023 04:30:18 -0800 (PST)
Date: Tue, 19 Dec 2023 14:30:16 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Message-ID: <20231219123016.6xy3gamz4lkr5fdz@skbuf>
References: <20231218162326.173127-1-romain.gantois@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231218162326.173127-1-romain.gantois@bootlin.com>
Cc: Richard Tresidder <rtresidd@electromag.com.au>,
 Pascal EBERHARD <pascal.eberhard@se.com>, netdev@vger.kernel.org,
 Sylvain Girard <sylvain.girard@se.com>,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 0/1] Prevent DSA tags from breaking COE
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

On Mon, Dec 18, 2023 at 05:23:22PM +0100, Romain Gantois wrote:
> I've run some iperf3 tests and the TX hotpath performance doesn't seem
> to be degraded by the field added to dma_features.

I don't know what CPU cores you are using, but if the iperf3 performance
was line rate at gigabit before and is line rate at gigabit now, you
haven't effectively measured the impact of the change (and "doesn't seem
to be degraded" is a false conclusion). You need something more CPU
intensive to see the difference, like IP forwarding of 64 byte packets.

A very simplistic way to set up IP forwarding between 2 DSA user ports
is to do this on the router board (DUT):

echo 1 > /proc/sys/net/ipv4/ip_forward
ip link set swp0 up && ip addr add 192.168.100.2/24 dev swp0
ip link set swp1 up && ip addr add 192.168.101.2/24 dev swp1

and this on the system with 2 endpoints:

ip netns add ns0
ip link set $ETH1 netns ns0
ip link set $ETH0 up && ip addr add 192.168.100.1/24 dev $ETH0
ip -n ns0 link set $ETH1 up && ip -n ns0 addr add 192.168.101.1/24 dev $ETH1
ip route add 192.168.101.0/24 via 192.168.100.2
ip -n ns0 route add 192.168.100.0/24 via 192.168.101.2
./net-next/samples/pktgen/pktgen_sample03_burst_single_flow.sh -i $ETH0 -s 64 -m 00:04:9f:05:de:0a -d 192.168.101.1 -t 2 -f 13 -c 0 -p 400 -n 0 -b 4

I compiled the commands from some notes I had lying around, I didn't
retest them.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
