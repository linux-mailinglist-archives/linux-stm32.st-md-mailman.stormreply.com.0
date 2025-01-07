Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A90FEA06135
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 17:13:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 391F7C78F6F;
	Wed,  8 Jan 2025 16:13:05 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 248BCC78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 17:07:43 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2164b1f05caso228213535ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2025 09:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736269662; x=1736874462;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=H6IgG8TBqPF+D4hNW02w96Pdr6FXNShPU0XiGtGLP2U=;
 b=WhuOHwuTLuPe5Yyk5F0lpUOtLLr905ptAGjykZXNErKdHA6RXD976zmCY0sMkBtYxp
 TAveGkVuaWwec9wiI9JzteSdsXvIEVZjPQkw53BXxR6Ck4+9aDGbC3J0UfXHsesG0viU
 UzaNKo4sH+nQoqoL0tbQaopI5s8h9D3SPRKtm+r7zn3nADgkFWcAc7klNWRvUg6HwIgl
 LFLtHfs0kYkxoSoenhJme0ooPtU8Xgi0W26CNfwPqkK5QitxNAdypnJB1StaOL5gttb6
 VRRdGS4n62CvyNIqT15RBQXwBOeKlvMjHSw3nXc9GpWIW0UChXvJwPPMjmqC5Ea1SZhf
 ut9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736269662; x=1736874462;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H6IgG8TBqPF+D4hNW02w96Pdr6FXNShPU0XiGtGLP2U=;
 b=JQjirqy1+pYPTaEPp7DMrQ8MIe64YgxqyFRZUmBbdVl7oQiTEuLWUoPWV3Z28pWlYH
 BEyQP9VD+Fb9xrMYmkLrDBBIoxACbM1WV5FOY/wLS5xjz7oL77c7vNGmI4v3LamxWRWH
 iv06mxXwXysDIq7z9SJOrrbhrDpX3ZUoxKvVsCKf4/1erIDZhekmg+BBGwlRN7RP3dIU
 87QJbLFog1lNYx9OJfufqz5Y3HNzbhdrszMNYCfhDsenVN30+nPP7b3rtUNE5/mkKWc1
 3V2lBS1Qhu/Gvz/xT7ad2raoFCK9MwEwkRzT4JCccynbVaC/uz0po70rR2v3UV9oA8/V
 h+vg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVygxWhGGLWjCbeafboERrlFb4uEBW0NHXCYHS0cYWMaAZLKN6WAPqeIZOohR1l2nwptf6ef9VEEwPOqg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyY0EyuP6w83cmbSs6PUMzwzV0Mkww4n4ag8XFFUZymaUSCcbSH
 1Vaw3MzUzz71g7Ci+y+vjjTdBH9VA9v6LBs1H5U2vxz9XQx7dpQ=
X-Gm-Gg: ASbGncs79AUUCejsUcmDG6qFaRXSTwdKWw2cb752cYpiAkhoATTPeOJMIu4I77WeuuC
 rhaQlK/RMGsvTQgDgx1tpXq5/O62MC+iEtg0L958AAdq02I3wdeWYuaFtriUNkuxHldSvY4urzg
 rVHmZWocMQJA+GghJi4/aWBnISXNcTeqqaBwq9UqxyJlQE7sOv/B4EcRU7oi2h5AN7GeH0iPfET
 ZhloAzf4CPRq8vtQ5yKoxvR2o7xxfRKwyVgGRE0qM7ULynePKTTjTvk
X-Google-Smtp-Source: AGHT+IHI4UAilr4fOsWcWRXO8E8vJoNjH2hq0o3vxddLmqIYgmVN8lBTyI8wQrNNttLzXRdwB4KPiw==
X-Received: by 2002:a17:902:ce92:b0:215:5ea2:6544 with SMTP id
 d9443c01a7336-219e6e8c365mr758236605ad.7.1736269661645; 
 Tue, 07 Jan 2025 09:07:41 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dca04ce7sm305940015ad.283.2025.01.07.09.07.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 09:07:41 -0800 (PST)
Date: Tue, 7 Jan 2025 09:07:40 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Message-ID: <Z31fXHxWuKNog_Qh@mini-arch>
References: <20250106135658.9734-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250106135658.9734-1-yoong.siang.song@intel.com>
X-Mailman-Approved-At: Wed, 08 Jan 2025 16:13:03 +0000
Cc: Jose Abreu <joabreu@synopsys.com>, linux-kselftest@vger.kernel.org,
 Florian Bezdeka <florian.bezdeka@siemens.com>, Joe Damato <jdamato@fastly.com>,
 Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Daniel Jurgens <danielj@nvidia.com>, Yonghong Song <yonghong.song@linux.dev>,
 Shuah Khan <shuah@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Mina Almasry <almasrymina@google.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Mykola Lysenko <mykolal@fb.com>, xdp-hints@xdp-project.net,
 Donald Hunter <donald.hunter@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, linux-doc@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Stanislav Fomichev <sdf@fomichev.me>,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, KP Singh <kpsingh@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Hao Luo <haoluo@google.com>,
 Willem de Bruijn <willemb@google.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Bjorn Topel <bjorn@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, bpf@vger.kernel.org,
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

On 01/06, Song Yoong Siang wrote:
> Enable launch time (Time-Based Scheduling) support to XDP zero copy via XDP
> Tx metadata framework.
> 
> This patch is tested with tools/testing/selftests/bpf/xdp_hw_metadata on
> Intel Tiger Lake platform. Below are the test steps and result.
> 
> Test Steps:
> 1. Add mqprio qdisc:
>    $ sudo tc qdisc add dev enp0s30f4 handle 8001: parent root mqprio num_tc
>      4 map 0 1 2 3 3 3 3 3 3 3 3 3 3 3 3 3 queues 1@0 1@1 1@2 1@3 hw 0
> 
> 2. Enable launch time hardware offload on hardware queue 1:
>    $ sudo tc qdisc replace dev enp0s30f4 parent 8001:2 etf offload clockid
>      CLOCK_TAI delta 500000
> 
> 3. Add an ingress qdisc:
>    $ sudo tc qdisc add dev enp0s30f4 ingress
> 
> 4. Add a flower filter to route incoming packet with VLAN priority 1 into
>    hardware queue 1:
>    $ sudo tc filter add dev enp0s30f4 parent ffff: protocol 802.1Q flower
>      vlan_prio 1 hw_tc 1
> 
> 5. Enable VLAN tag stripping:
>    $ sudo ethtool -K enp0s30f4 rxvlan on
> 
> 6. Start xdp_hw_metadata selftest application:
>    $ sudo ./xdp_hw_metadata enp0s30f4 -l 1000000000
> 
> 7. Send an UDP packet with VLAN priority 1 to port 9091 of DUT.

Tangential: I wonder whether we can add the setup steps to the
xdp_hw_metadata tool? It is useful to have one command to run that
takes care of all the details. Same way it already enables HW
tstamping.. 

Or, if not the full setup, some kind of detection we can signal to the
user that some things might be missing?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
