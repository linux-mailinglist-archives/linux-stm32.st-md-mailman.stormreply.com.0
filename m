Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 082CB8037D7
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 15:57:50 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B34BAC6B46B;
	Mon,  4 Dec 2023 14:57:49 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D6589C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 14:57:48 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-77dd07e7d39so328103185a.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 06:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701701868; x=1702306668;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4s/Fe1XG1yhJb8Cgkf39nJDFir7TwuGaTQXt4MseexI=;
 b=eTtvk9u+dGWEVEtCawQecHhFK7mNeG2UtbzPwhaVPMzMGMvDh2/D2ypob9rO0mFpPW
 DcZ3H9zO688RrxOAgm9p5ESXnXh0e2C5aJlUDaQQqPemX9aJ3uQOiOc32K9oDk+XkTLj
 FxkGxFcKke50IgU/5KWMTjMNXlRhcJF6vrcSshVHKGruVIVBDqQtZRc0zNyuCh26lEsL
 jTWv29HzxAFl7Tn50MH8VQto83iTCIH6luIpecH2Q6LnF9sTAbofKYSJjYFmOostCIbS
 BWqENZ6iikluNI0P5NJnUrEN4sCLZHXI+5KgkXecE1tc5jLxObsSTbJHCeOF9YeFyhuv
 suCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701701868; x=1702306668;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4s/Fe1XG1yhJb8Cgkf39nJDFir7TwuGaTQXt4MseexI=;
 b=aH9R8PQqee+01YKvA7M7mDdQVJuHBgZtb+P3AlT39xt3WWjpjvOBaimw+vvGvrxjue
 IMtPjVS2UK+IE9RyQecivoivGfAqhRqPkZPlowxW2TXCNhdMiW60HGgjFStUFTtkJt6U
 4LppZy3XBiwRy+ZmKgdf/jOj6vnibmGqmlS+sTc4pTZOA3xwVHpPjxJ3lpaNKEFgqLV2
 haUaMYv/r4WOHcXwIFSo4L8LRjr5RVFdRyIGsRcRqyDZUOwBu41JdurE7Z+AUpOKRBWx
 ow6eOlrxcaagpJccqykqDlg/zrh4dbLzRQDLCK2XKk1RjjhlkftOYSFLHAApCddH3Wc+
 D5Dw==
X-Gm-Message-State: AOJu0Ywhbsho41XWy04Nq9GnUQvdKTw+zM7swXaPI5s20iCwOoc8R06v
 3odPiQLbC8d8Ifu5mGB5D4c=
X-Google-Smtp-Source: AGHT+IHzXTkFfcFoLO6wmA/9e59vMmQf4zyM3GFQp9OdUcputmBMTr+GiTkRX07jj2BvW2TDnxIGXw==
X-Received: by 2002:a05:620a:269c:b0:77f:4cd:87 with SMTP id
 c28-20020a05620a269c00b0077f04cd0087mr4856192qkp.86.1701701867639; 
 Mon, 04 Dec 2023 06:57:47 -0800 (PST)
Received: from localhost (114.66.194.35.bc.googleusercontent.com.
 [35.194.66.114]) by smtp.gmail.com with ESMTPSA id
 x4-20020ae9e904000000b0077d660ac1b6sm4305854qkf.21.2023.12.04.06.57.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:57:47 -0800 (PST)
Date: Mon, 04 Dec 2023 09:57:47 -0500
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
Message-ID: <656de8eb14c24_2e983e29435@willemb.c.googlers.com.notmuch>
In-Reply-To: <PH0PR11MB5830F08AC202C42501D986C0D887A@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20231201062421.1074768-1-yoong.siang.song@intel.com>
 <20231201062421.1074768-3-yoong.siang.song@intel.com>
 <5a660c0f-d3ed-47a2-b9be-098a224b8a12@kernel.org>
 <PH0PR11MB5830F08AC202C42501D986C0D887A@PH0PR11MB5830.namprd11.prod.outlook.com>
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
> On Friday, December 1, 2023 11:02 PM, Jesper Dangaard Brouer wrote:
> >On 12/1/23 07:24, Song Yoong Siang wrote:
> >> This patch enables txtime support to XDP zero copy via XDP Tx
> >> metadata framework.
> >>
> >> Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
> >> ---
> >>   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
> >>   drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 13 +++++++++++++
> >>   2 files changed, 15 insertions(+)
> >
> >I think we need to see other drivers using this new feature to evaluate
> >if API is sane.
> >
> >I suggest implementing this for igc driver (chip i225) and also for igb
> >(i210 chip) that both support this kind of LaunchTime feature in HW.
> >
> >The API and stmmac driver takes a u64 as time.
> >I'm wondering how this applies to i210 that[1] have 25-bit for
> >LaunchTime (with 32 nanosec granularity) limiting LaunchTime max 0.5
> >second into the future.
> >And i225 that [1] have 30-bit max 1 second into the future.
> >
> >
> >[1]
> >https://github.com/xdp-project/xdp-
> >project/blob/master/areas/tsn/code01_follow_qdisc_TSN_offload.org
> 
> I am using u64 for launch time because existing EDT framework is using it.
> Refer to struct sk_buff below. Both u64 and ktime_t can be used as launch time.
> I choose u64 because ktime_t often requires additional type conversion and
> we didn't expect negative value of time.
> 
> include/linux/skbuff.h-744- *   @tstamp: Time we arrived/left
> include/linux/skbuff.h:745- *   @skb_mstamp_ns: (aka @tstamp) earliest departure time; start point
> include/linux/skbuff.h-746- *           for retransmit timer
> --
> include/linux/skbuff.h-880-     union {
> include/linux/skbuff.h-881-             ktime_t         tstamp;
> include/linux/skbuff.h:882-             u64             skb_mstamp_ns; /* earliest departure time */
> include/linux/skbuff.h-883-     };
> 
> tstamp/skb_mstamp_ns are used by various drivers for launch time support
> on normal packet, so I think u64 should be "friendly" to all the drivers. For an
> example, igc driver will take launch time from tstamp and recalculate it 
> accordingly (i225 expect user to program "delta time" instead of "time" into
> HW register).
> 
> drivers/net/ethernet/intel/igc/igc_main.c-1602- txtime = skb->tstamp;
> drivers/net/ethernet/intel/igc/igc_main.c-1603- skb->tstamp = ktime_set(0, 0);
> drivers/net/ethernet/intel/igc/igc_main.c:1604- launch_time = igc_tx_launchtime(tx_ring, txtime, &first_flag, &insert_empty);
> 
> Do you think this is enough to say the API is sane?

u64 nsec sounds sane to be. It must be made explicit with clock source
it is against.

Some applications could want to do the conversion from a clock source
to raw NIC cycle counter in userspace or BPF and program the raw
value. So it may be worthwhile to add an clock source argument -- even
if initially only CLOCK_MONOTONIC is supported.

See tools/testing/selftests/net/so_txtime.sh for how the FQ and ETF
qdiscs already disagree on the clock source that they use. 


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
