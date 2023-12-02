Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AA9801D31
	for <lists+linux-stm32@lfdr.de>; Sat,  2 Dec 2023 15:15:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AA18C6B479;
	Sat,  2 Dec 2023 14:15:46 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7ABB4C6B457
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Dec 2023 14:15:44 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-77f035e4dabso9184685a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 02 Dec 2023 06:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701526543; x=1702131343;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cHjT/29o2cHv+uPSUDloG/9K5z+4mwtqcKQnCHqcHPk=;
 b=Zk0r1ZPgBwLPznpiDcCNaSjVvUZgwB+rwEJ27ELW7r1IB2y4fCuVTw/3ze8POrznA/
 0+9/SDOp+MNKZFXG79X6UisY9RaSv6o/WGrajKyTHT8YNrjmoFWyFHp9d+qNXMOVaZmG
 JNcNrftq6VVu84Zw353pidCccJveDMOqsJdRgJIesKsZyv2fXjMGL8sI28seoa7qjBFJ
 gvF/UZTFq6TF3ZZAfxhhQlm3zxW3WzZZwsGya1u54NXjh5ZwoXHEijmU9VWZdOn/Dmme
 o/GiA5N7+SHU4IRsVV5vWdRqIQHC3TqD2JhxyW+AgjLSMVHpy9L+Vq8UngMg86QYd0lJ
 WOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701526543; x=1702131343;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cHjT/29o2cHv+uPSUDloG/9K5z+4mwtqcKQnCHqcHPk=;
 b=spQwvvnFaJtO7IYSN8l15wMexuwzUxeoGE3eQ6uegIfZbJwajo9xw9WUjzx8JKK4Ax
 bo5XMsYSsZIBuWSEMbZr9R7at719cwf1NGU6G6TBD98VG7Y2CtVlGNjTMtql8fDaGOL8
 KTL8QYQmEPjZBow6Zs+gcIVkpqT8k1CowK6vlEOyzuxMcpy3K1+Y1Mm+Gi+XMBUjGmUc
 eUmBJhUbe5DKWhbmqD1f+pZ2qxZqPnNcj+dQyVT5eAZLlShmm/Dtejf3w0fYakyWHpk2
 Uvif0VLpMDTYTJPsFNLVAQBjJd6A+mG3tuTsRdDRVNi3etWv6Su28C5u6i7RBsq/KZr4
 ql5Q==
X-Gm-Message-State: AOJu0YyNKOWr3sQU5giXe2f67tZXo/WerBNuU0E9oNWy9DcdgpXlKhqr
 M1riQ7O4wdFiMhKm1W+QnbE=
X-Google-Smtp-Source: AGHT+IFMroJHDqq6Ir9gZVJ3R728hRmkVYJHVfNaHzVnIzw/nmWz3p78L6RXN42OK1k/cU3B+r7M9w==
X-Received: by 2002:ae9:f812:0:b0:77e:fba3:4f32 with SMTP id
 x18-20020ae9f812000000b0077efba34f32mr1152322qkh.136.1701526543353; 
 Sat, 02 Dec 2023 06:15:43 -0800 (PST)
Received: from localhost (114.66.194.35.bc.googleusercontent.com.
 [35.194.66.114]) by smtp.gmail.com with ESMTPSA id
 br30-20020a05620a461e00b0077d742fb27esm2452534qkb.49.2023.12.02.06.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 06:15:42 -0800 (PST)
Date: Sat, 02 Dec 2023 09:15:42 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
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
 Jose Abreu <joabreu@synopsys.com>, Andre Fredette <afredette@redhat.com>
Message-ID: <656b3c0ebb103_1a6a2c2947d@willemb.c.googlers.com.notmuch>
In-Reply-To: <179a4581-f7df-4eb1-ab67-8d65f856a2fe@kernel.org>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
 <d4f99931-442c-4cd7-b3cf-80d8681a2986@kernel.org>
 <PH0PR11MB58306C2E50009A6E22F9DAD3D881A@PH0PR11MB5830.namprd11.prod.outlook.com>
 <6569f71bad00d_138af5294d@willemb.c.googlers.com.notmuch>
 <179a4581-f7df-4eb1-ab67-8d65f856a2fe@kernel.org>
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

Jesper Dangaard Brouer wrote:
> 
> 
> On 12/1/23 16:09, Willem de Bruijn wrote:
> > Song, Yoong Siang wrote:
> >> On Friday, December 1, 2023 6:46 PM, Jesper Dangaard Brouer <hawk@kernel.org> wrote:
> >>> On 12/1/23 07:24, Song Yoong Siang wrote:
> >>>> This series expands XDP TX metadata framework to include ETF HW offload.
> >>>>
> >>>> Changes since v1:
> >>>> - rename Time-Based Scheduling (TBS) to Earliest TxTime First (ETF)
> >>>> - rename launch-time to txtime
> >>>>
> >>>
> >>> I strongly disagree with this renaming (sorry to disagree with Willem).
> >>>
> >>> The i210 and i225 chips call this LaunchTime in their programmers
> >>> datasheets, and even in the driver code[1].
> >>>
> >>> Using this "txtime" name in the code is also confusing, because how can
> >>> people reading the code know the difference between:
> >>>   - tmo_request_timestamp and tmo_request_txtime
> >>>
> >>
> >> Hi Jesper and Willem,
> >>
> >> How about using "launch_time" for the flag/variable and
> >> "Earliest TxTime First" for the description/comments?
> > 
> 
> I don't follow why you are calling the feature:
>   - "Earliest TxTime First" (ETF).
>   - AFAIK this just reference an qdisc name (that most don't know exists)
> 
> 
> > I don't particularly care which term we use, as long as we're
> > consistent. Especially, don't keep introducing new synonyms.
> > 
> > The fact that one happens to be one vendor's marketing term does not
> > make it preferable, IMHO. On the contrary.
> >
> 
> These kind of hardware features are defined as part of Time Sensitive
> Networking (TSN).
> I believe these TSN features are defined as part of IEEE 802.1Qbv (2015)
> and according to Wikipedia[2] incorporated into IEEE 802.1Q.
> 
> [2] https://en.wikipedia.org/wiki/Time-Sensitive_Networking
> 
> 
> > SO_TXTIME is in the ABI, and EDT has been used publicly in kernel
> > patches and conference talks, e.g., Van Jacobson's Netdev 0x12
> > keynote. Those are vendor agnostic commonly used terms.
> > 
> 
> I agree that EDT (Earliest Departure Time) have become a thing and term
> in our community.
> We could associate this feature with this.
> I do fear what hardware behavior will be it if I e.g. ask it to send a
> packet 2 sec in the future on i225 which max support 1 sec.
> Will hardware send it at 1 sec?
> Because then I'm violating the *Earliest* Departure Time.

That should definitely not happen. At least not on a device that
implements EDT semantics.

This relates to Jakub's question in the previous thread on whether
this mechanism allows out-of-order transmission or maintains FIFO
behavior. That really is device specific.

Older devices only support this for low rate (PTP) and with a small
fixed number of outstanding requests. For pacing offload, devices need
to support up to linerate and out-of-order.

I don't think we want to enforce either in software, as the hardware
is already out there. But it would be good if drivers can somehow
label these capabilities. Including programmable horizon.

It is up to the qdisc to ensure that it does not pass packets to the
device beyond its horizon.

ETF and FQ already have a concept of horizon. And a way to queue
errors for packets out of bound (SO_EE_CODE_TXTIME_..).

> 
> > But as long as Launch Time is not an Intel only trademark, fine to
> > select that.
> 
> The IEEE 802.1Qbv is sometimes called Time-Aware Shaper (TAS), but I
> don't like to for us to name this after this.  This features is simply
> taking advantage of exposing one of the hardware building blocks
> (controlling/setting packet "launch time") that can be used for
> implementing a TAS.
> 
> I like the name "launch time" because it doesn't get easily confused
> with other timestamps, and intuitively describes packet will be send at
> a specific time (likely in future).
> 
> --Jesper

Understood on your point that txtime and tx_timestamp are too similar.
As said, I don't care strongly. Launch time sounds fine to me. Others
can speak up if they disagree.

I take launch time as a less strict than EDT: it is a request to send
at a certain time, with no strict definition on uncertainty. While EDT
more strictly ensures that a packet is not sent before the timestamp.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
