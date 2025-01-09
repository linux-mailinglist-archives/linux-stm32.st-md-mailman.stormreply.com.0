Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id ACAF0A07EE7
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 18:39:29 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5FACEC71292;
	Thu,  9 Jan 2025 17:39:29 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E682EC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 17:39:21 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2166022c5caso19150435ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jan 2025 09:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736444360; x=1737049160;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6KsRQIc1JxQBezEIVdfkOzKqKFxNDLhEnsfcwp5vSS0=;
 b=P4T4ggNUnOVQ/4HCvbln5zVZ9h/EK8KMFjsT2YDzWBelwR3jn+9m1azS2q8A7vDJNG
 Y7MJNzL6puaJN1LNOXLZdWFUKjXK1mV4o2qw6TofohDPPOiXC2XMZb49cEHxqs7kFjJo
 MECrmtxTm5mqdM3vAPluLB8rs4nqiMpW0e0gGSpYzc58lPPXaDqJFVyKMzmfHvNtNSqP
 FIj+T6ZqYhPZBzAz6E5oYybngrgKHyBsU/l/SjVugqOeLRZfybk4JzBmTNzwdP6/tI/n
 bRMct3kqyTr5TFq+Tk7tlVHxicym8FaXh7a0SBbcOhG02j9ieYLoylrUznO/s8n8z/1O
 ZWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736444360; x=1737049160;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6KsRQIc1JxQBezEIVdfkOzKqKFxNDLhEnsfcwp5vSS0=;
 b=HuPOJnPwW+nLLjV71ARGQM1gtv2DTDkDk8gE9HtB/u2X4J4ol7dDIg1usMXYP5M76f
 g3WwNFb/753t/jQDjWWUQ554rG4pkbIjP3o1hKdTJqmpLctgEjP1CA8ZbkLnLZsaG4WA
 Izj7/x5xEOXkNVHgm98njyz2pbKH84g2ugD1scJSIL1pBcfpXjy3fpdmtbqKUFByaVFN
 yEWG9Blod0ogZT62HcZf6gA6ejspSrA4pvbGuoEx1TMvOuowTQuRmtrf+XYVpVKZ7WK+
 cVxqaMRZoSTfmrU2eKjQL4+jSpql9rc42nvfXReAZ3XrN3DLuv7/0E3WpuWO1atidBed
 wRfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIN3QhuflBzSfG8UdABqGpenqiT2xQ26vo/m1y8mqKflUC9iiA3TA4R8HByDuX9w+mm4m5Ka37xUBpBw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyC+2b5SXMKxBe0OkfzKG9CO9EGN+BoMhdzQ1L/EnxROSdvmmNR
 YpzPQTgh6jpEirRgZLUdV2FMRUl0nSTodJdEGUrN6us9Mk8K73w=
X-Gm-Gg: ASbGncvAZ4WYmYf2pkqJu/rfxh7W7ghyZK9p+pXtA0BPDSu09jfpuL9vcirldWIhyIm
 zJwJs/wcQ3Kx788AbOsGAhdXblQnnh+c8C6L+dd3fJYPYnFLkyzCzhLKCMXfwgNdQ9x+ikJaH3P
 6GHqPIerF7BHgJcR98AUk3DcZV4FYmB1Sz7vk0Dpxwg6H4DZfAyiV4PAKFwBgsZLhHkm8/WTpvv
 TMQu219dhzHuoutkDQ+IVXqi/3lSxxRNd1YwpjL+WPBDGUAGdtPGyQ2
X-Google-Smtp-Source: AGHT+IEOsPd8gi8EzkqvvII6DaS7kpXwJUDoEvR9sz6x99GD7Aypk+y99jv+WqRaCxVsNJdjbVm5kQ==
X-Received: by 2002:a17:902:d2ca:b0:216:56d5:d87 with SMTP id
 d9443c01a7336-21a83f8ea52mr112422135ad.34.1736444360267; 
 Thu, 09 Jan 2025 09:39:20 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f22f051sm516575ad.203.2025.01.09.09.39.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 09:39:19 -0800 (PST)
Date: Thu, 9 Jan 2025 09:39:19 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: "Song, Yoong Siang" <yoong.siang.song@intel.com>
Message-ID: <Z4AJx-a-eY3pgHNv@mini-arch>
References: <20250106135658.9734-1-yoong.siang.song@intel.com>
 <Z31fXHxWuKNog_Qh@mini-arch>
 <PH0PR11MB58304082BF0EA96D1A74E4C5D8132@PH0PR11MB5830.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH0PR11MB58304082BF0EA96D1A74E4C5D8132@PH0PR11MB5830.namprd11.prod.outlook.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "Bezdeka,
 Florian" <florian.bezdeka@siemens.com>, "Damato, Joe" <jdamato@fastly.com>,
 Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, "Nguyen,
 Anthony L" <anthony.l.nguyen@intel.com>, Daniel Jurgens <danielj@nvidia.com>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Mina Almasry <almasrymina@google.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Mykola Lysenko <mykolal@fb.com>,
 "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 Donald Hunter <donald.hunter@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eduard Zingerman <eddyz87@gmail.com>, "Fijalkowski,
 Maciej" <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, KP Singh <kpsingh@kernel.org>,
 "Karlsson, Magnus" <magnus.karlsson@intel.com>, Hao Luo <haoluo@google.com>,
 Willem de Bruijn <willemb@google.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Bjorn Topel <bjorn@kernel.org>,
 Simon Horman <horms@kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 3/4] net: stmmac: Add launch
 time support to XDP ZC
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

On 01/09, Song, Yoong Siang wrote:
> On Wednesday, January 8, 2025 1:08 AM, Stanislav Fomichev <stfomichev@gmail.com> wrote:
> >On 01/06, Song Yoong Siang wrote:
> >> Enable launch time (Time-Based Scheduling) support to XDP zero copy via XDP
> >> Tx metadata framework.
> >>
> >> This patch is tested with tools/testing/selftests/bpf/xdp_hw_metadata on
> >> Intel Tiger Lake platform. Below are the test steps and result.
> >>
> >> Test Steps:
> >> 1. Add mqprio qdisc:
> >>    $ sudo tc qdisc add dev enp0s30f4 handle 8001: parent root mqprio num_tc
> >>      4 map 0 1 2 3 3 3 3 3 3 3 3 3 3 3 3 3 queues 1@0 1@1 1@2 1@3 hw 0
> >>
> >> 2. Enable launch time hardware offload on hardware queue 1:
> >>    $ sudo tc qdisc replace dev enp0s30f4 parent 8001:2 etf offload clockid
> >>      CLOCK_TAI delta 500000
> >>
> >> 3. Add an ingress qdisc:
> >>    $ sudo tc qdisc add dev enp0s30f4 ingress
> >>
> >> 4. Add a flower filter to route incoming packet with VLAN priority 1 into
> >>    hardware queue 1:
> >>    $ sudo tc filter add dev enp0s30f4 parent ffff: protocol 802.1Q flower
> >>      vlan_prio 1 hw_tc 1
> >>
> >> 5. Enable VLAN tag stripping:
> >>    $ sudo ethtool -K enp0s30f4 rxvlan on
> >>
> >> 6. Start xdp_hw_metadata selftest application:
> >>    $ sudo ./xdp_hw_metadata enp0s30f4 -l 1000000000
> >>
> >> 7. Send an UDP packet with VLAN priority 1 to port 9091 of DUT.
> >
> >Tangential: I wonder whether we can add the setup steps to the
> >xdp_hw_metadata tool? It is useful to have one command to run that
> >takes care of all the details. Same way it already enables HW
> >tstamping..
> >
> >Or, if not the full setup, some kind of detection we can signal to the
> >user that some things might be missing?
> 
> Sure. I can try to add the setup steps into xdp_hw_metadata
> by using ioctl() function. However, there are some device specific
> command, like the number of queue, their priority,
> how they route the incoming packet, etc. I will try to find out
> a common way that can work for most of the devices,
> at least work for both igc and stmmac.

We can query the number of queues (and everything else you need) in the
tool, similar to what we do in
testing/selftests/drivers/net/hw/ncdevmem.c, take a look. But if it's
too complicated, maybe at least print these commands on startup and tell
the user to run them.

The reason I'm asking is that I hope that we eventually can run this
tool from (automatic) testing/selftests/drivers/net/hw testsuite to
make sure the metadata stuff keeps working.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
