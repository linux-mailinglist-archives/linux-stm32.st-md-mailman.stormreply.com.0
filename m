Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C07B800E0F
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 16:09:18 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4A476C6B47D;
	Fri,  1 Dec 2023 15:09:18 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B866AC6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  1 Dec 2023 15:09:17 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-67aa00ea853so1926596d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 01 Dec 2023 07:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701443356; x=1702048156;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLso2pmbW+pqec/n5hTLrdVINDT0pM+C03w8nh7HKns=;
 b=egMATAdRXMT++A85Lnr9DkxvOVKRIGDRrpXE+/rKlWybsVE3UX5CeJdhZVKMuoMoru
 X57eYv/qRhOMSXOJm6zprGSS1mmIjnjBWooshdGsubrlsixWXlC+ReM3d/BCu+dCxed7
 OOIE8dGtGByn/CNduyM5dq3dkwykfIxSTRvDffFvaUNSg8roXVDcz5MgRb/ojzR72NaX
 H/EUvAMWqWMKROL00WMG/qgxfRhWKgLgoHjw30hhBwKZodhzObUjSjXdJOuGtesEWkA6
 gVL0sPTLDhP6Lqy9S0dWZFVDOmuh37nc/mtDl5bCUXg/wdjYoHaWaJnM5/rF6Hmi/fyp
 ZRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701443356; x=1702048156;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=zLso2pmbW+pqec/n5hTLrdVINDT0pM+C03w8nh7HKns=;
 b=DQ+xJCGfthnI1vJ6jg6dVjIusfnDKznmINXxQcLLeq2o9KCiwWM+RMwj9i6jW5yZ1L
 6H45pUpve0Y3XHFW4dg5IRkR2CuGF1mjyRaryaSai/EFwOgwq/8/vpp9Iard3FMVX5jH
 IVCVoZTwFGeqijC4hDXVuHkaA7Q6F9uTS1nF65AhWDrCZbjoSxCVoorqExFnhK/UBEA6
 5wjgTZQI8JF0kYGww8Oe0+kOF1Ms6u2mPUUq/fHOv0TorwdJW8DNZDM++1qVGqAbyIDC
 D6luqi+ntwkMMo0jNTy7M/mCJIHTHLzo0zhgqN2Kxq9rJD1bj9ymcXsDFjUT9PugYrfE
 OSqQ==
X-Gm-Message-State: AOJu0Yyroo75bTDuL1MsPIQlGhCU6MZ4XoIj7EXJ0XOuEwMjB5189ahw
 LDWBzFk3M63EQBby0An8/6o=
X-Google-Smtp-Source: AGHT+IH54DZX3epKyg6LRt2pdYZkL/+XeUYhSrEyKX4h3aISopJX9pTR0/tZhUxii4HdMqDmoQRtqg==
X-Received: by 2002:ad4:4511:0:b0:67a:8ed9:c9f with SMTP id
 k17-20020ad44511000000b0067a8ed90c9fmr3811562qvu.48.1701443356450; 
 Fri, 01 Dec 2023 07:09:16 -0800 (PST)
Received: from localhost (114.66.194.35.bc.googleusercontent.com.
 [35.194.66.114]) by smtp.gmail.com with ESMTPSA id
 g12-20020a0caacc000000b0067a39a44ca5sm1106qvb.77.2023.12.01.07.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Dec 2023 07:09:15 -0800 (PST)
Date: Fri, 01 Dec 2023 10:09:15 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Bjorn Topel <bjorn@kernel.org>, 
 "Karlsson, Magnus" <magnus.karlsson@intel.com>, 
 "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@google.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Message-ID: <6569f71bad00d_138af5294d@willemb.c.googlers.com.notmuch>
In-Reply-To: <PH0PR11MB58306C2E50009A6E22F9DAD3D881A@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
 <d4f99931-442c-4cd7-b3cf-80d8681a2986@kernel.org>
 <PH0PR11MB58306C2E50009A6E22F9DAD3D881A@PH0PR11MB5830.namprd11.prod.outlook.com>
Mime-Version: 1.0
Cc: "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 0/3] xsk: TX metadata txtime
	support
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

Song, Yoong Siang wrote:
> On Friday, December 1, 2023 6:46 PM, Jesper Dangaard Brouer <hawk@kernel.org> wrote:
> >On 12/1/23 07:24, Song Yoong Siang wrote:
> >> This series expands XDP TX metadata framework to include ETF HW offload.
> >>
> >> Changes since v1:
> >> - rename Time-Based Scheduling (TBS) to Earliest TxTime First (ETF)
> >> - rename launch-time to txtime
> >>
> >
> >I strongly disagree with this renaming (sorry to disagree with Willem).
> >
> >The i210 and i225 chips call this LaunchTime in their programmers
> >datasheets, and even in the driver code[1].
> >
> >Using this "txtime" name in the code is also confusing, because how can
> >people reading the code know the difference between:
> >  - tmo_request_timestamp and tmo_request_txtime
> >
> 
> Hi Jesper and Willem,
> 
> How about using "launch_time" for the flag/variable and
> "Earliest TxTime First" for the description/comments?  

I don't particularly care which term we use, as long as we're
consistent. Especially, don't keep introducing new synonyms.

The fact that one happens to be one vendor's marketing term does not
make it preferable, IMHO. On the contrary.

SO_TXTIME is in the ABI, and EDT has been used publicly in kernel
patches and conference talks, e.g., Van Jacobson's Netdev 0x12
keynote. Those are vendor agnostic commonly used terms.

But as long as Launch Time is not an Intel only trademark, fine to
select that.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
