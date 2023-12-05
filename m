Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3DA8057F5
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 15:55:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 989A0C6A61D;
	Tue,  5 Dec 2023 14:55:22 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4FA18C65E56
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 14:55:20 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-daf26d84100so4041331276.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 06:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701788119; x=1702392919;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vwn3+d55WIDQqPzaUZ6Y1euKtU0awuVxdMPC2F9sWJM=;
 b=SW8/7ef2VpIF4+FiE+3Dw/NkkLLK4/v4c20RARpDSohvpbTp4uHRfeMHTfG1+MmCqk
 nLjcIxj/J3Y1/7wG8UKPhZmsYEh6f7A7/YkHzpTu0nvgR+CIoXL3jp1r76L+KiAoE6O2
 2LfUP9H4V2Xbbwe60iyGT8xzJ0nSff7h3mJQVwXRQdA36+JUnxCNG1VX21H0BLHuMGlG
 venBlGwSOJFVQw8VEaEgcr1TPG/Ofd8OKju2qt7bXJeqEJwmUHB9mqmKNxllmiyYJDsV
 OqLk9GRnzI+URdIOwDIbiI99p6Y3iebAc97WREPBl+Thh7ihbnJ+wkgKMP25pZvP5+rU
 JYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701788119; x=1702392919;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Vwn3+d55WIDQqPzaUZ6Y1euKtU0awuVxdMPC2F9sWJM=;
 b=RHWwH9qR9BI+FBY7ikvDKxB/ooeeOEqZhcPT474HSirXLMd1E2eq9lqNVcPXWg3ip/
 WsxyI18LxZgAr5W7W9SOvgozv3FzMHEc+TFt4mmrdlm/GbntgfGlPtsgBVa9rUHIx6Rg
 oGXsNcPzdQUeFOPKWzQyRQE/V26o5Fc770C8+ys3UfltnWYUyxTb6mD0AFN6wKBLncYd
 ZzRx1HH17S5B/puIjEfFtcfIr3p1NjRaBHHGKWcCDupkmf2+D4TJEGfm8ZfArUi0/ok1
 WIk3/3d5KVvdSYJ7tYHymNoyHZiDBOfK/ScRovCBZ+7C8FEmg+cW3m3jq/XN8hZtI41j
 KXJg==
X-Gm-Message-State: AOJu0YyKDUoABGzegkeS7J5UcIvSIcaDoCYeh3MqqCkVEfHQImnXHlJo
 LYTxvDUJ/CPaQ1uV+iuQieU=
X-Google-Smtp-Source: AGHT+IEnh/AUcJ58dEYlv0mOXPOLlM3dnoDwAL/EwYEQJJaHDHgJRu8pTV3oURCvpfonLhzgIUIT/Q==
X-Received: by 2002:a25:c50a:0:b0:db5:4d4b:d8a7 with SMTP id
 v10-20020a25c50a000000b00db54d4bd8a7mr4619822ybe.50.1701788119064; 
 Tue, 05 Dec 2023 06:55:19 -0800 (PST)
Received: from localhost (114.66.194.35.bc.googleusercontent.com.
 [35.194.66.114]) by smtp.gmail.com with ESMTPSA id
 ez16-20020ad45910000000b0067aa25438fdsm3832891qvb.40.2023.12.05.06.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 06:55:18 -0800 (PST)
Date: Tue, 05 Dec 2023 09:55:18 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
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
Message-ID: <656f39d668439_3dd6422949e@willemb.c.googlers.com.notmuch>
In-Reply-To: <PH0PR11MB58305C7D394FD264F1634819D885A@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
 <20231201062421.1074768-3-yoong.siang.song@intel.com>
 <5a660c0f-d3ed-47a2-b9be-098a224b8a12@kernel.org>
 <PH0PR11MB5830F08AC202C42501D986C0D887A@PH0PR11MB5830.namprd11.prod.outlook.com>
 <656de8eb14c24_2e983e29435@willemb.c.googlers.com.notmuch>
 <PH0PR11MB58305C7D394FD264F1634819D885A@PH0PR11MB5830.namprd11.prod.outlook.com>
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
Subject: Re: [Linux-stm32] [PATCH bpf-next v2 2/3] net: stmmac: Add txtime
	support to XDP ZC
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
> On Monday, December 4, 2023 10:58 PM, Willem de Bruijn wrote:
> >Song, Yoong Siang wrote:
> >> On Friday, December 1, 2023 11:02 PM, Jesper Dangaard Brouer wrote:
> >> >On 12/1/23 07:24, Song Yoong Siang wrote:
> >> >> This patch enables txtime support to XDP zero copy via XDP Tx
> >> >> metadata framework.
> >> >>
> >> >> Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
> >> >> ---
> >> >>   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
> >> >>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
> >> >>   2 files changed, 15 insertions(+)
> >> >
> >> >I think we need to see other drivers using this new feature to evaluate
> >> >if API is sane.
> >> >
> >> >I suggest implementing this for igc driver (chip i225) and also for igb
> >> >(i210 chip) that both support this kind of LaunchTime feature in HW.
> >> >
> >> >The API and stmmac driver takes a u64 as time.
> >> >I'm wondering how this applies to i210 that[1] have 25-bit for
> >> >LaunchTime (with 32 nanosec granularity) limiting LaunchTime max 0.5
> >> >second into the future.
> >> >And i225 that [1] have 30-bit max 1 second into the future.
> >> >
> >> >
> >> >[1]
> >> >https://github.com/xdp-project/xdp-
> >> >project/blob/master/areas/tsn/code01_follow_qdisc_TSN_offload.org
> >>
> >> I am using u64 for launch time because existing EDT framework is using it.
> >> Refer to struct sk_buff below. Both u64 and ktime_t can be used as launch time.
> >> I choose u64 because ktime_t often requires additional type conversion and
> >> we didn't expect negative value of time.
> >>
> >> include/linux/skbuff.h-744- *   @tstamp: Time we arrived/left
> >> include/linux/skbuff.h:745- *   @skb_mstamp_ns: (aka @tstamp) earliest departure
> >time; start point
> >> include/linux/skbuff.h-746- *           for retransmit timer
> >> --
> >> include/linux/skbuff.h-880-     union {
> >> include/linux/skbuff.h-881-             ktime_t         tstamp;
> >> include/linux/skbuff.h:882-             u64             skb_mstamp_ns; /* earliest departure
> >time */
> >> include/linux/skbuff.h-883-     };
> >>
> >> tstamp/skb_mstamp_ns are used by various drivers for launch time support
> >> on normal packet, so I think u64 should be "friendly" to all the drivers. For an
> >> example, igc driver will take launch time from tstamp and recalculate it
> >> accordingly (i225 expect user to program "delta time" instead of "time" into
> >> HW register).
> >>
> >> drivers/net/ethernet/intel/igc/igc_main.c-1602- txtime = skb->tstamp;
> >> drivers/net/ethernet/intel/igc/igc_main.c-1603- skb->tstamp = ktime_set(0, 0);
> >> drivers/net/ethernet/intel/igc/igc_main.c:1604- launch_time =
> >igc_tx_launchtime(tx_ring, txtime, &first_flag, &insert_empty);
> >>
> >> Do you think this is enough to say the API is sane?
> >
> >u64 nsec sounds sane to be. It must be made explicit with clock source
> >it is against.
> >
> 
> The u64 launch time should base on NIC PTP hardware clock (PHC).
> I will add documentation saying which clock source it is against

It's not that obvious to me that that is the right and only choice.
See below.
 
> >Some applications could want to do the conversion from a clock source
> >to raw NIC cycle counter in userspace or BPF and program the raw
> >value. So it may be worthwhile to add an clock source argument -- even
> >if initially only CLOCK_MONOTONIC is supported.
> 
> Sorry, not so understand your suggestion on adding clock source argument.
> Are you suggesting to add clock source for the selftest xdp_hw_metadata apps?
> IMHO, no need to add clock source as the clock source for launch time
> should always base on NIC PHC.

This is not how FQ and ETF qdiscs pass timestamps to drivers today.

Those are in CLOCK_MONOTONIC or CLOCK_TAI. The driver is expected to
convert from that to its descriptor format, both to the reduced bit
width and the NIC PHC.

See also for instance how sch_etf has an explicit q->clock_id match,
and SO_TXTIME added an sk_clock_id for the same purpose: to agree on
which clock source is being used.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
