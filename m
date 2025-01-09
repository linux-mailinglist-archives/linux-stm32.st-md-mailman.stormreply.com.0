Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F8EA07EF3
	for <lists+linux-stm32@lfdr.de>; Thu,  9 Jan 2025 18:40:14 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78E0BC71292;
	Thu,  9 Jan 2025 17:40:14 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0711FC6C83A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Jan 2025 17:40:13 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2eed82ca5b4so1935876a91.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 09 Jan 2025 09:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736444411; x=1737049211;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tWpZAtZ5fwsLcgO5aqlcO3OYh1NgLbgjWHyNFFao33Y=;
 b=T7aXy3VnDvcVN46CV+Nmln/aCZBNdBgN36/ayN7TZavIHHyVOFcTZFxczphGmo2l7J
 jDqetzY4vXWvruJICf/+MJ1f/Vfs2tDhTiCiEsyCNRfCj6lXFNtn5Yk0rL9ITdRbNmYA
 JX7t0ZHKsTK29e/rFKzooQ3aDlLjBnvAs3Y5sKYAmuT7coywgjouyuBW0sdrMbwJgr2Y
 UKKykfeYRr/nyxQkA1NBzhgcR3yKctt5S1azZ07SvUqox7U6oL5qiEXG7ps/q/qTbn2C
 EFX7yj6f6fxJmcpWeRxJgX90SgCorGdaYomaV0rz677DtoE2pyG+ZN2RlciQA5lzEgZb
 H4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736444411; x=1737049211;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tWpZAtZ5fwsLcgO5aqlcO3OYh1NgLbgjWHyNFFao33Y=;
 b=VnPEivy7Ov+FDaOBP9qwEmWsvvmxo44Rl7zT9lrmeGGT2Qjq2ev2xSN2Zq6TXOJOv5
 /+0nY6W4AT8dTNPAehynGgSaz5vbqHS131HZEYAzuSsCblUn8hXVpl3FUOYs3j3SQQtA
 9g+fvrLgYkwJbT3PdNfYl+LH/hLF2PA+WXVvXmFvCotaRM14PReMmqHpsda979r/hhit
 +RDECW/HmS79QxBYMidUTfK/c1okUaYYd1qWf6Fr0QawIKZErFJwuUCaIA9BazScUmDQ
 O/4c+cO4y+dJKL8UyHhjPV0jtF/1wSRSrNw4jZMoJ0SXBaygqm8L39t8l7StZmCdw7Xa
 HNeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmyVHRsL/JJHMnf1qqUSLF1iIsj0GtrgWccjaReyYe+fPMV8BaXNj02ex4M97Pj0u9RjOyHLQTtKOQYA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzTTk7DKo8J60TgxhWD3IaAitRP7lK65N5HbFF7Vmj0zXOLtpqt
 mTUcvFgAeDSApzaWnEcRjO9LUUxX9OUT+fXd0eQ77PAjdhARFtU=
X-Gm-Gg: ASbGncvW9UaFn2YPn5ThG1tYJvLI1YjO36ADv9uesUNHfPxEZ2jMUJz7SwzYS2ejOo3
 PllRIBozT0TbD713S14Ax++pBv3PrL5zb/xHdDCQLtk1MbvxMV9XgKREpFpUkXndh/iaLW0R2NB
 aYDhhRNC9JPGaOMuw2nYSz7Z1xGtlUH9lG2Wm24L2VdrZOuswVP995v0OoPnnGZeg3UQZjBFD2y
 wp0HI3AGqIbJ3bczoTuwRZt+9E3jFR8J6iwsMFBYv5C6cXLb50Mjibz
X-Google-Smtp-Source: AGHT+IEZHpA+1As7rYRP/wbYTv7BBI8EycFV1R1kQaORb6ULu5g6y7WttO6FZ+OmR/qIEMsz9TCzbg==
X-Received: by 2002:a17:90a:d887:b0:2ea:7cd5:4ad6 with SMTP id
 98e67ed59e1d1-2f5490dbefemr9659697a91.32.1736444411540; 
 Thu, 09 Jan 2025 09:40:11 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f5593d0911sm1848116a91.8.2025.01.09.09.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 09:40:11 -0800 (PST)
Date: Thu, 9 Jan 2025 09:40:10 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: "Song, Yoong Siang" <yoong.siang.song@intel.com>
Message-ID: <Z4AJ-pIyAUbXJJpx@mini-arch>
References: <20250106135606.9704-1-yoong.siang.song@intel.com>
 <Z31bQ6xEkyQvbutN@mini-arch>
 <PH0PR11MB5830D33B679A0ACD3FD6E23CD8132@PH0PR11MB5830.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5830D33B679A0ACD3FD6E23CD8132@PH0PR11MB5830.namprd11.prod.outlook.com>
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
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 1/4] xsk: Add launch time
 hardware offload support to XDP Tx metadata
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
> On Wednesday, January 8, 2025 12:50 AM, Stanislav Fomichev <stfomichev@gmail.com> wrote:
> >On 01/06, Song Yoong Siang wrote:
> >> Extend the XDP Tx metadata framework so that user can requests launch time
> >> hardware offload, where the Ethernet device will schedule the packet for
> >> transmission at a pre-determined time called launch time. The value of
> >> launch time is communicated from user space to Ethernet driver via
> >> launch_time field of struct xsk_tx_metadata.
> >>
> >> Suggested-by: Stanislav Fomichev <sdf@google.com>
> 
> Hi Stanislav Fomichev,
> 
> Thanks for your review comments.
> I notice that you have two emails:
> sdf@google.com & stfomichev@gmail.com
> 
> Which one I should use in the suggested-by tag?

google.com should be bouncing now. sdf@fomichev.me is preferred.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
