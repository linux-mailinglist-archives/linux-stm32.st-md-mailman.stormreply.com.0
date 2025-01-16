Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE5CA12FB1
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Jan 2025 01:27:23 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 64CDBC78F6E;
	Thu, 16 Jan 2025 00:27:23 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98DC0C78F6C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Jan 2025 00:27:16 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2161eb94cceso3351485ad.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 15 Jan 2025 16:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736987235; x=1737592035;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bEcOoHqZCQz992D1472+Bd71qizVhWfxyGjZ+LGLdMs=;
 b=JnFpw6JWa6T0Z/PoCLRPpsElDn27ENF1GLK6sujD7DldcTdHJQkhcnyygKMZ0sOw77
 mXaCTxX0XbIGTWv8FsGDvB2+e1mIX5QBNX6+iAdcryXKUqdbw5JkL3mPy++3WszJeQiw
 YWcUcKC0RzRwcThf67Xyq7DmuSKp2NU1UYellCPQuRFJ0GmtP/1FmTO5fc2NanKKjOBW
 tJYNcHF9J2m5Trj2p23ahkG2naTWYZzhDmY11i/WBxAOfCCDCYwRzrRqT4099UxeZXKI
 Ulsr3w7W/+/BesxzSFz6/VOY0Sum3YqF8JIW97ZCL3l5ThfFbFgjaCIIGkopc1ilcrT2
 SArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736987235; x=1737592035;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bEcOoHqZCQz992D1472+Bd71qizVhWfxyGjZ+LGLdMs=;
 b=S/VYSPoV+jwq7k3pefrLwQvuDERS9MJz+w7SaYNsbsG5nL7ppKmV+hWqtwQTqpOS6D
 iFkkJHsnteb4XzA9pqtmgErsQn9vc+IL68tqVIvfEltqKl/u7yEv0/R8nsfRDzT6T48G
 uLcdPQx1D9ZpMkmE2PqrSmUpTe5qsAqcreqEdahJekxoADlTvrEGVKyqsdP34XFMYvDg
 xfJe5XnfUd9tuThfW6SNlpZbn1hjH6Vxa/EqWW27h+aaF29VJrfaPiSzbpnUv1KBvbya
 RDlFY5Qr4hrzm6beuJ7Y+WMQ7C/e0xCjCz2eeG4IawEfr5SK/cPiZJZHhwGwG/bPj5uV
 XpUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKSut2tCKNmrO2M+kP6VBV5dWVsXyFcBOWK1EgPTkmY4izc6ckOCky2Yo8BydH7k63gId4dVgCsLIX0A==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyvA9uCNH7hA7I1fLU8G4BM8SQH6FzxfxvkMNzAHD0aJCJCFV+5
 4PaqnaI+MJkmvsIygc7BvXQhK0uPdvcwh5E8i+Xt0AajUcRdEiA=
X-Gm-Gg: ASbGnctfD/sC+KxG5Bc/P6Ght6kTK5AhU3u+4Iw4tjkS4Bzpqxk29jqtqg6K/2M8+ux
 jwc29c8ko+o8ihXoLpXJtDh0wacdubrV3FOHzUG2izgwkvSzItZgHmh0dN1Cqmtsj8g1WA0wlYi
 1YnIABkrypW4tmHh9di2mk1620kVjDyMuqzezYrg1KrSd8UKAZZBVtgsYNhgsRkmVmIyNXc3wgJ
 tVwwu/oqLoAAIB6u0t2akUzmyth/XUAntDTXX0xn2i7UqbEKZqf1oQS
X-Google-Smtp-Source: AGHT+IF42kOgX+PydEftgfBZixafBXfUCJHxwxxwV4uV0EJebudeO3qjsr2vtf7hdNZFfdVhP9a6Vw==
X-Received: by 2002:a17:902:ce06:b0:216:5561:70d7 with SMTP id
 d9443c01a7336-21a83fe48c0mr475141105ad.52.1736987235115; 
 Wed, 15 Jan 2025 16:27:15 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21a9f253a98sm87014465ad.224.2025.01.15.16.27.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 16:27:14 -0800 (PST)
Date: Wed, 15 Jan 2025 16:27:13 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Message-ID: <Z4hSYdzvbggntSr0@mini-arch>
References: <20250114152718.120588-1-yoong.siang.song@intel.com>
 <20250114152718.120588-2-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250114152718.120588-2-yoong.siang.song@intel.com>
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
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Bjorn Topel <bjorn@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf-next v5 1/4] xsk: Add launch time
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

On 01/14, Song Yoong Siang wrote:
> Extend the XDP Tx metadata framework so that user can requests launch time
> hardware offload, where the Ethernet device will schedule the packet for
> transmission at a pre-determined time called launch time. The value of
> launch time is communicated from user space to Ethernet driver via
> launch_time field of struct xsk_tx_metadata.
> 
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
