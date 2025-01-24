Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE6DA1B4F5
	for <lists+linux-stm32@lfdr.de>; Fri, 24 Jan 2025 12:45:56 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 24205C78F8F;
	Fri, 24 Jan 2025 11:45:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DB3C9C78F85
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737719148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=odeNkl2pdZWzjMRmLzJX8QVcRedjnH492ZzohS0yuak=;
 b=fOZ/4rFaBmtsjmoJDr4nL3v+JlI1sGzn0ofk1uj58wwg8SXTF6LajAFSoYNzZgCU93txyL
 pjZoEtmPBS+iPeNUJb64GQ7lylk95l1WtvxbJoztpIQzAAIZa/AenhPnwiUooPa3R8lA2q
 VZJnp6PAk82FKzTT99oyHm9+iXYyISo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-s8JTeI4dOkaBD2jJ3uakNA-1; Fri, 24 Jan 2025 06:45:46 -0500
X-MC-Unique: s8JTeI4dOkaBD2jJ3uakNA-1
X-Mimecast-MFC-AGG-ID: s8JTeI4dOkaBD2jJ3uakNA
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-aa67f03ca86so169203266b.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 24 Jan 2025 03:45:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737719145; x=1738323945;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=odeNkl2pdZWzjMRmLzJX8QVcRedjnH492ZzohS0yuak=;
 b=fYFFt6n+1/5COjeskbW+rr2LnFzX+GGBKQh2/6JEW/ShdVAaWyvI9C3WSeV7GTz95R
 CEKf1wW0YBuA2vQ/GD+nInssCeyo7ZJqmrMHe/bxNq3bWM/G05BcCZhU51nBlfvV+RHC
 cqy1NKIFGg7K/Nlepr9Yh0gZSkz3ogZQAjj9IaU1L+GI6rasYVUp7OiIhDD4wCkmpLoq
 vAwrsZjxnWVEQaeVUSuJilLkTXTx25AkYXJgK8FXJSsYpxfYeD2DzpMK0+4uH8eSJUhk
 j3Baea9/DY/+VDRLKUIn6Na0XTpHoUMGc1aYFfq3CmmjnNhh6cVE3qjn/IwaDD6X/oCh
 faWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVj9YuAGdA52gkWFL5sC5gPxl1UVaoX8W/AuWHZk2XU4BJNpCqNco0R356h737NWMN+hr9LUr5YE7xEDg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YyM+UchShdpPpzIaeaGe4IMlgIZPdaGStcyRXFppqbzlnQwnqoN
 FRN//5eOqvElqoEMqDBd69cy/mKdfN5bLowB+QRzY7yv4HziA73NvWYcWc3wRpk6HIopT6pmzoU
 OWQAUHcUcCU5CGOQWrKxnbaNXwaXX6LGcosETaqEbiN5Vbc2CsJmgAycdBi44nMwY83ETKA9Xoo
 DMXA==
X-Gm-Gg: ASbGncu84p9H4MO5uTHaOyVU6tZYkwL/liv4KTBgF4Gwps2AvTYP87pzEAlcsUqBVLN
 WkYFqrFYQjms3kxSzqnlYEOiZqgfCdPWONzu89tpWg2bZ6APstjtOKbSjBGK1oNIvt+qZJKWVO4
 idlwI7u9nHsfEfyCWWXHG9OOwIo9HhldERXvp0tvuabsRKGZnnXQohlxtfyF4++ZDMphJDL5n9X
 auJ+GgfQZfK9ky4l1l7kDRX48CInkas70J7OUwzTbUzXDBs933C6j8vlGzQftF1Q0x5irxy0hpY
 6SmwDzaxklG99lKI2Zg=
X-Received: by 2002:a05:6402:1e8e:b0:5dc:1059:6b2 with SMTP id
 4fb4d7f45d1cf-5dc105a5ec1mr11805713a12.7.1737719144843; 
 Fri, 24 Jan 2025 03:45:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeWFYBPETVo309BerlvPgux0XnsYsjMKjnLErW6dJ05V2oA4Fpf2Q3nZFN4K3N5AK1bx4cSA==
X-Received: by 2002:a05:6402:1e8e:b0:5dc:1059:6b2 with SMTP id
 4fb4d7f45d1cf-5dc105a5ec1mr11805656a12.7.1737719144333; 
 Fri, 24 Jan 2025 03:45:44 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760ab1d7sm117046766b.109.2025.01.24.03.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 03:45:43 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
 id 9DF17180AA6E; Fri, 24 Jan 2025 12:45:42 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Stanislav Fomichev <stfomichev@gmail.com>, Florian Bezdeka
 <florian.bezdeka@siemens.com>
In-Reply-To: <Z5KdSlzmyCKUyXTn@mini-arch>
References: <20250116155350.555374-1-yoong.siang.song@intel.com>
 <20250116155350.555374-5-yoong.siang.song@intel.com>
 <AS1PR10MB5675499EE0ED3A579151D3D3EBE02@AS1PR10MB5675.EURPRD10.PROD.OUTLOOK.COM>
 <PH0PR11MB583095A2F12DA10D57781D18D8E02@PH0PR11MB5830.namprd11.prod.outlook.com>
 <ea087229cc6f7953875fc69f1b73df1ae1ee9b72.camel@siemens.com>
 <Z5KdSlzmyCKUyXTn@mini-arch>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Fri, 24 Jan 2025 12:45:42 +0100
Message-ID: <87bjvwqvtl.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z_V4txcQgPBpNa55-oHKNEYRhRrDLhEDqQ2hoLS55lo_1737719145
X-Mimecast-Originator: redhat.com
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
Subject: Re: [Linux-stm32] [xdp-hints] Re: [PATCH bpf-next v6 4/4] igc: Add
 launch time support to XDP ZC
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

Stanislav Fomichev <stfomichev@gmail.com> writes:

> On 01/23, Florian Bezdeka wrote:
>> Hi all,
>> 
>> On Thu, 2025-01-23 at 16:41 +0000, Song, Yoong Siang wrote:
>> > On Thursday, January 23, 2025 11:40 PM, Bouska, Zdenek <zdenek.bouska@siemens.com> wrote:
>> > > 
>> > > Hi Siang,
>> > > 
>> > > I tested this patch series on 6.13 with Intel I226-LM (rev 04).
>> > > 
>> > > I also applied patch "selftests/bpf: Actuate tx_metadata_len in xdp_hw_metadata" [1]
>> > > and "selftests/bpf: Enable Tx hwtstamp in xdp_hw_metadata" [2] so that TX timestamps
>> > > work.
>> > > 
>> > > HW RX-timestamp was small (0.5956 instead of 1737373125.5956):
>> > > 
>> > > HW RX-time:   595572448 (sec:0.5956) delta to User RX-time sec:1737373124.9873 (1737373124987318.750 usec)
>> > > XDP RX-time:   1737373125582798388 (sec:1737373125.5828) delta to User RX-time sec:0.0001 (92.733 usec)
>> > > 
>> > > Igc's raw HW RX-timestamp in front of frame data was overwritten by BPF program on
>> > > line 90 in tools/testing/selftests/bpf: meta->hint_valid = 0;
>> > > 
>> > > "HW timestamp has been copied into local variable" comment is outdated on
>> > > line 2813 in drivers/net/ethernet/intel/igc/igc_main.c after
>> > > commit 069b142f5819 igc: Add support for PTP .getcyclesx64() [3].
>> > > 
>> > > Workaround is to add unused data to xdp_meta struct:
>> > > 
>> > > --- a/tools/testing/selftests/bpf/xdp_metadata.h
>> > > +++ b/tools/testing/selftests/bpf/xdp_metadata.h
>> > > @@ -49,4 +49,5 @@ struct xdp_meta {
>> > >                __s32 rx_vlan_tag_err;
>> > >        };
>> > >        enum xdp_meta_field hint_valid;
>> > > +       __u8 avoid_IGC_TS_HDR_LEN[16];
>> > > };
>> > > 
>> > 
>> > Hi Zdenek Bouska, 
>> > 
>> > Thanks for your help on testing this patch set.
>> > You are right, there is some issue with the Rx hw timestamp,
>> > I will submit the bug fix patch when the solution is finalized,
>> > but the fix will not be part of this launch time patch set.
>> > Until then, you can continue to use your WA.
>> 
>> I think there is no simple fix for that. That needs some discussion
>> around the "expectations" to the headroom / meta data area in front of
>> the actual packet data.
>
> By 'simple' you mean without some new UAPI to signal the size of that
> 'reserved area' by the driver? I don't see any other easy way out as well :-/

Yeah, I don't think we can impose UAPI restrictions on the metadata area
at this point. I guess the best we can do is to educate users that they
should call the timestamp kfunc before they modify the metadata?

-Toke

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
