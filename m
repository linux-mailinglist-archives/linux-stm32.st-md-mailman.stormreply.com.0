Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8178FA1AAAB
	for <lists+linux-stm32@lfdr.de>; Thu, 23 Jan 2025 20:49:40 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 43DDDC78F85;
	Thu, 23 Jan 2025 19:49:40 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A2A94C7128F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 19:49:32 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-21661be2c2dso23639025ad.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 23 Jan 2025 11:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737661771; x=1738266571;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/qLickY1e0ujLI7bpuAPKBg3ra7SxF8sIpaNTGdpk/E=;
 b=IyhQpzXdokz9tOZbmI9PLhv/s6H04r52On4Mjpl1o8H1whWGb5bsEZAY/wfzgEH1OQ
 avKibDM6vxNIi6VzWRTBQkBFWs6sx6qeItACdJAwnAiDI52V89dMB4YVcThM6CafAJ3C
 PZLk7gKvlCmzAo1kKdZ50VxhT9w2XYeBaSWB5iw0VkinRHKhFQdwpCQzXP5yH8b4Vf3V
 UhZRhyCOtK2gW5fVXs1d4NHnbZJGS+kQGK6SkPDf7uTPKNxwTbvhAsC1igJaKKHhmRdv
 CpUUDlJPPA3p7nNl00VWa46f1Vvr6TErZMDXHK4tnf5xTyGXmFDtIKzt4KE29fcQr2oq
 ZVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737661771; x=1738266571;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/qLickY1e0ujLI7bpuAPKBg3ra7SxF8sIpaNTGdpk/E=;
 b=rD+xPYHUUHvL8o14fblA00FuYj1FO6iX8MxMMpN8Go2HXsL3qMF5qT/A0qGIGTYWcW
 oAlVL/1Bl/tBez5Y9Kcb1oFR7RkdgIs/Qp2ght95O2tOqPn9pXSZIolQQy173rZgR9en
 SwfoRSb2FSwWC7Jsme6OxL0gaxtICrZThG1grAz+/xJZl1hRv4PVFQWFFZxOU3xhm4Uv
 yCDlwxgXWgWvPzY22mIdoY9XsQZmtGzUTof7TsiqhIxFzvtdj+cX8ayEaOAqPaBWxByT
 lI1LHac+fekeicgiLusCRwGKXe7QtMc0l8NlDYT2m/01yU4Jr7868YLQDysZ7RMZ8VKR
 ja1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp8/VatKjwWlzoORmkobXA3v4oPO+LNAAIc8ZY2CZDUbgKNgTz50j7EyIasBz7ZonpQ+jTNTOInPVAvQ==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzqG1WXsBhOnP+h8OJyqDYzzLQYbFi/UNaT4nZstFdx73Mzhzjf
 fnCSECnQjSBu8yiotwlShk6BSo4eeT1We7OItwtanZdbEvHy7tg=
X-Gm-Gg: ASbGnctklhlGUj5lWSmYpihyByeLxI+VgMdwUGDEM89QfKz6Gv9KVmLKDiJVRIm1Gq2
 Fb4MISfa4x/PxCK10EUVnVwXFm4RsunlvWMWzegY8ytJSbEmiLLkTOCGuHi2uqpuxRnDdGs3yzu
 8jzgmmNnrHrTnDKw++eNNYbtU/ynLWx/whFeV95iHe+eirbsULGdk8dlon2bP+Y/+HR0AsZ0sWW
 YgDw/eTOXdHMLkPlz7XZqJ94WSSKevk6xqH/jNSS7XsN2XD4E8+bftQWaXi1+XUCGQuLos4jlIY
 zb5H
X-Google-Smtp-Source: AGHT+IESeNKwX2zcipFaXoMlvYsxaD0Oto3RCfSnVHPTxJyo13u3XHbde1U83PRnjPUOPMjYL0fFMw==
X-Received: by 2002:a17:903:988:b0:216:7ee9:220b with SMTP id
 d9443c01a7336-21c35530048mr461405425ad.22.1737661771206; 
 Thu, 23 Jan 2025 11:49:31 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da4141436sm2728275ad.134.2025.01.23.11.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 11:49:30 -0800 (PST)
Date: Thu, 23 Jan 2025 11:49:30 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Florian Bezdeka <florian.bezdeka@siemens.com>
Message-ID: <Z5KdSlzmyCKUyXTn@mini-arch>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
 <AS1PR10MB5675499EE0ED3A579151D3D3EBE02@AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM>
 <PH0PR11MB583095A2F12DA10D57781D18D8E02@PH0PR11MB5830.namprd11.prod.outlook.com>
 <ea087229cc6f7953875fc69f1b73df1ae1ee9b72.camel@siemens.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea087229cc6f7953875fc69f1b73df1ae1ee9b72.camel@siemens.com>
Cc: Jose Abreu <joabreu@synopsys.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Damato,
 Joe" <jdamato@fastly.com>, Alexei Starovoitov <ast@kernel.org>,
 Song Liu <song@kernel.org>, Eric Dumazet <edumazet@google.com>, "Nguyen,
 Anthony L" <anthony.l.nguyen@intel.com>, Daniel Jurgens <danielj@nvidia.com>,
 Yonghong Song <yonghong.song@linux.dev>, Shuah Khan <shuah@kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Mina Almasry <almasrymina@google.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Mykola Lysenko <mykolal@fb.com>,
 "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 Donald Hunter <donald.hunter@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 "Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Stanislav Fomichev <sdf@fomichev.me>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eduard Zingerman <eddyz87@gmail.com>, "Fijalkowski,
 Maciej" <maciej.fijalkowski@intel.com>, "Song,
 Yoong Siang" <yoong.siang.song@intel.com>, KP Singh <kpsingh@kernel.org>,
 "Karlsson, Magnus" <magnus.karlsson@intel.com>, Hao Luo <haoluo@google.com>,
 Willem de Bruijn <willemb@google.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Bouska,
 Zdenek" <zdenek.bouska@siemens.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Bjorn Topel <bjorn@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf-next v6 4/4] igc: Add launch time
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

On 01/23, Florian Bezdeka wrote:
> Hi all,
> 
> On Thu, 2025-01-23 at 16:41 +0000, Song, Yoong Siang wrote:
> > On Thursday, January 23, 2025 11:40 PM, Bouska, Zdenek <zdenek.bouska@siemens.com> wrote:
> > > 
> > > Hi Siang,
> > > 
> > > I tested this patch series on 6.13 with Intel I226-LM (rev 04).
> > > 
> > > I also applied patch "selftests/bpf: Actuate tx_metadata_len in xdp_hw_metadata" [1]
> > > and "selftests/bpf: Enable Tx hwtstamp in xdp_hw_metadata" [2] so that TX timestamps
> > > work.
> > > 
> > > HW RX-timestamp was small (0.5956 instead of 1737373125.5956):
> > > 
> > > HW RX-time:   595572448 (sec:0.5956) delta to User RX-time sec:1737373124.9873 (1737373124987318.750 usec)
> > > XDP RX-time:   1737373125582798388 (sec:1737373125.5828) delta to User RX-time sec:0.0001 (92.733 usec)
> > > 
> > > Igc's raw HW RX-timestamp in front of frame data was overwritten by BPF program on
> > > line 90 in tools/testing/selftests/bpf: meta->hint_valid = 0;
> > > 
> > > "HW timestamp has been copied into local variable" comment is outdated on
> > > line 2813 in drivers/net/ethernet/intel/igc/igc_main.c after
> > > commit 069b142f5819 igc: Add support for PTP .getcyclesx64() [3].
> > > 
> > > Workaround is to add unused data to xdp_meta struct:
> > > 
> > > --- a/tools/testing/selftests/bpf/xdp_metadata.h
> > > +++ b/tools/testing/selftests/bpf/xdp_metadata.h
> > > @@ -49,4 +49,5 @@ struct xdp_meta {
> > >                __s32 rx_vlan_tag_err;
> > >        };
> > >        enum xdp_meta_field hint_valid;
> > > +       __u8 avoid_IGC_TS_HDR_LEN[16];
> > > };
> > > 
> > 
> > Hi Zdenek Bouska, 
> > 
> > Thanks for your help on testing this patch set.
> > You are right, there is some issue with the Rx hw timestamp,
> > I will submit the bug fix patch when the solution is finalized,
> > but the fix will not be part of this launch time patch set.
> > Until then, you can continue to use your WA.
> 
> I think there is no simple fix for that. That needs some discussion
> around the "expectations" to the headroom / meta data area in front of
> the actual packet data.

By 'simple' you mean without some new UAPI to signal the size of that
'reserved area' by the driver? I don't see any other easy way out as well :-/
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
