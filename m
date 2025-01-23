Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B21A1AA9B
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2025 20:48:13 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 180A8C78F85;
	Thu, 23 Jan 2025 19:48:13 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 14B5EC7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 19:48:06 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2164b1f05caso22774045ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 11:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737661684; x=1738266484;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/ehvXM/x2Xpjmareg8hVceTaEqRxIeAlXfZcNgyZJpQ=;
 b=btKY8jgHiz3X78VLR0e3/gP5eFJAFf/NAnXE7UMH28peyrTqa+PNvBKNXLH5ZNW9+l
 BssswUVggyBcPDbEHJ9OtNdAj1LMh7TYbLrR58Bxv0sAblGgrtK5oryAacWdwgJhgEeN
 Nb9WR7vAactVGmpP2QUWvF/NCxhf5lG3M2WfqhxFrLjnd8+Wq0KKcBsBrwdQtTBFsAVR
 n7pkqErmDmln+Y1vgRWbdnhXH54fEkwGzOpqyc1gL5KH7G8GMtCNjTawKs5ho9uzpMAj
 f3cQoAFqj+Hntsec6vnfWwKnGK3Q5aODPazpKGqJ2XaYTs4oxLJvXw6ZvjZ6QyT4mhG5
 TQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737661684; x=1738266484;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/ehvXM/x2Xpjmareg8hVceTaEqRxIeAlXfZcNgyZJpQ=;
 b=FeahCiN74alneUutqZXeOzolU0imkSQK6RQNmy5y+fF4JhDOd5H0Y94+NYRdl+1jdw
 BPZG4EClK4J2oSOggoF0v/cBziFNWDEbmwcF3Pzw1ob3wQ+Iu71WbKQ/SrPTqVr9h6Xr
 MyLjPsL1FFSkTVZ+5XDHV5zQI4azujOz1lIqXXpbH85UKq581dp32S4Z/hHR2CyuZDQL
 J6KlGWXQUOd9pQfodJkV4Cr1tbPSXCs7f2tVAQ/QtOH0uEhP8HUbNSLsH9KrQCDqUWKp
 mMPRY2UUg/ZWn9Po03q2nc0g14GFv3mGLzwMVDabJqSRYL8Mdp1Id1r2J9YCd0sXjnUj
 d9wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd/5joxYOBGYojT4kL8y4IKVH0X/TLbuFHsakvgaZRK1dQNDzT7kRgCfoiJUBPFlXThIWABp/TYIlbiw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YxRFWlBxe3x45N3na/pxKJT+D73283IoBXEvjmhiTom6Ta2oL28
 OPwtoRX90DUyn93Fdyc4mjA83DrOBLGZ2CJ7Sdu7PUv32/1SnKk=
X-Gm-Gg: ASbGncu9d5hclozH8+ycbovx85wYq9+FsDPAF73ndKVOXVxxY5Zl3Mn/P736S6A/gal
 S+pBQ/QJtAlvtAzauHJBW9TBs4vYN7T6RCRoG+mns99Aa07h+ngXBNncInZvQvG/5Ta5xqcYKGL
 /RzVPtXmlRePYiymvKvS8g4XETWiaoXTAc1URVfG32Ogosn+rS70xpdQE8ymfcgtTD5OUa7shhD
 9FxGTHIt8H8LBj194DvLhH3KHpfFdcEJh/ndUvWyilLkI4I6mkzD9MqQUasRBVEInBVDsRJnAm1
 RL2d
X-Google-Smtp-Source: AGHT+IHN0sZtZXkNpILip1vz+eYUU1Y/MTgN8GKmFzFYwee95EZNDldTyC5bmSvcCfRBqUDdtCAgnw==
X-Received: by 2002:a17:902:e548:b0:216:60a3:b3fd with SMTP id
 d9443c01a7336-21c351d345amr370312355ad.3.1737661684548; 
 Thu, 23 Jan 2025 11:48:04 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3ea2430sm2880515ad.65.2025.01.23.11.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 11:48:04 -0800 (PST)
Date: Thu, 23 Jan 2025 11:48:03 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Message-ID: <Z5Kc8wufjrsXMCW9@mini-arch>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-3-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250116155350.555374-3-yoong.siang.song@intel.com>
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
Subject: Re: [Linux-stm32] [PATCH bpf-next v6 2/4] selftests/bpf: Add launch
 time request to xdp_hw_metadata
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

On 01/16, Song Yoong Siang wrote:
> Add launch time hardware offload request to xdp_hw_metadata. Users can
> configure the delta of launch time relative to HW RX-time using the "-l"
> argument. By default, the delta is set to 0 ns, which means the launch time
> is disabled. By setting the delta to a non-zero value, the launch time
> hardware offload feature will be enabled and requested. Additionally, users
> can configure the Tx Queue to be enabled with the launch time hardware
> offload using the "-L" argument. By default, Tx Queue 0 will be used.
> 
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>

Forgot to add:

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
