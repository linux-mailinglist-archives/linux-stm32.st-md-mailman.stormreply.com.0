Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 78248A06133
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 17:13:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 13CFFC78F67;
	Wed,  8 Jan 2025 16:13:05 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8F7E8C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 16:50:14 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-216281bc30fso13328695ad.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2025 08:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736268613; x=1736873413;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1kkw8OsqKUstZ6+HR7QBUZKdgqA2L6g+toZ/3deeQ/o=;
 b=Re+0OGspWLzTLhLRzGHaDt1Miy4B8KQDrHHlOW0MDwAfIKwJNSLgSPBYWockSR3+qi
 2/Iqaakb/PlBY4zCHmQLnVoudhcbgssUOApchn6b/lRTD8iMStHeL3T2I2PfQKDpTaq9
 LooAaXyBerCk+9AxlSOS4vCdR7qACLPuq3eEj9C4UpxGFZfLfkqAbNGyV4zl9vE9Mwf4
 dk/Rt+DSPNxOTTbHdSKF4PyzTMouF51N+0kdghkQaUgW0dGRaF5RQe5rLnNnAwJIst4x
 W/wS4DxoelrYZgA+fnMLYvJEOZaVSnBOw12JyRqGoORQYHhge59wBsVNTraiKxyTXJfK
 fW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736268613; x=1736873413;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1kkw8OsqKUstZ6+HR7QBUZKdgqA2L6g+toZ/3deeQ/o=;
 b=VYe0DaQgfRNg/91dRXjQ/luVmos+Mu4mQFcu5NcuksNqpEjlx06u2FjxzLSJhXVBfx
 h3Jqlj7JVgcbmIAWsYUQJlTjVwWS9+qZcFhg+Fwi9jnacLuMSdwpzfnCMgU2jFU2w+jZ
 CC37pIOBsNDAnVJ3n8hW4yOxZXQaYXIeJjjXgfbF071RobBQYIfsFC6rYV7v2epMl6a4
 ue2HzQwcDrSxYc8+nQ+MxdXoYyX4xFmH2ecpBxMWjR+VVqawv6SnygllmbMObjrdUStO
 9QR721MsxJ+WPdtS23OiW0RKPOEBRJ55KXSsjRcVjbqerDRkW7zM5DWaqDKpEE1HPcG4
 DiHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAAUyS1T17mGooqqdCjG9UDIFY0LTzWI6oLCD2dI0YoSVlFUadxQGzt2i8LgJJ6EHeAA52MJliWwangA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwdlHFokbQ4XrBRPj5sg/RnpnutlrIrYufKxGQGaFOzt9ZVdTVp
 rehNGrPj/CBYrBDwmQQS0WCkrRRR+oaEKelrmhZk4Okg4u3g7xE=
X-Gm-Gg: ASbGnct+YTp6pb7iXaF+TE2sOMnKi7IcHzZu+8YVIHpzmOi7CYidql7MEkyF0kf2KoV
 jiFH/C/SMmfnyk5rGJp5+Ha1Wqjg4eEx52muKW/URsVANXe0s8PNAEw5E3QIE1dE38yuOcawtbq
 dJcq3ZkMle+lIx7G3sNUQzcljK2+8919weQ3nb4Wb2LAbIzdeyxVBvsG3wBRkwhoA28osuCxYIM
 WEn1wmTqS8/3S/AlELfmOibhFBKASCC2vFgGixKUNxJmoQrxSBvQa39
X-Google-Smtp-Source: AGHT+IFENMHtBxMqOYbLnyZklK8TxKhy57F1FhvRUtYUInQIrUA9rU8ymAx4xYOehq+j+0FGzA2uug==
X-Received: by 2002:a17:903:41d1:b0:217:8557:5246 with SMTP id
 d9443c01a7336-219e6f4979amr721019265ad.55.1736268612929; 
 Tue, 07 Jan 2025 08:50:12 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc9f7d83sm314319215ad.226.2025.01.07.08.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:50:12 -0800 (PST)
Date: Tue, 7 Jan 2025 08:50:11 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Message-ID: <Z31bQ6xEkyQvbutN@mini-arch>
References: <20250106135606.9704-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250106135606.9704-1-yoong.siang.song@intel.com>
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

On 01/06, Song Yoong Siang wrote:
> Extend the XDP Tx metadata framework so that user can requests launch time
> hardware offload, where the Ethernet device will schedule the packet for
> transmission at a pre-determined time called launch time. The value of
> launch time is communicated from user space to Ethernet driver via
> launch_time field of struct xsk_tx_metadata.
> 
> Suggested-by: Stanislav Fomichev <sdf@google.com>
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> ---
>  Documentation/netlink/specs/netdev.yaml      |  4 ++
>  Documentation/networking/xsk-tx-metadata.rst | 64 ++++++++++++++++++++
>  include/net/xdp_sock.h                       | 10 +++
>  include/net/xdp_sock_drv.h                   |  1 +
>  include/uapi/linux/if_xdp.h                  | 10 +++
>  include/uapi/linux/netdev.h                  |  3 +
>  net/core/netdev-genl.c                       |  2 +
>  net/xdp/xsk.c                                |  3 +
>  tools/include/uapi/linux/if_xdp.h            | 10 +++
>  tools/include/uapi/linux/netdev.h            |  3 +
>  10 files changed, 110 insertions(+)
> 
> diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
> index cbb544bd6c84..e59c8a14f7d1 100644
> --- a/Documentation/netlink/specs/netdev.yaml
> +++ b/Documentation/netlink/specs/netdev.yaml
> @@ -70,6 +70,10 @@ definitions:
>          name: tx-checksum
>          doc:
>            L3 checksum HW offload is supported by the driver.
> +      -
> +        name: tx-launch-time
> +        doc:
> +          Launch time HW offload is supported by the driver.
>    -
>      name: queue-type
>      type: enum
> diff --git a/Documentation/networking/xsk-tx-metadata.rst b/Documentation/networking/xsk-tx-metadata.rst
> index e76b0cfc32f7..3cec089747ce 100644
> --- a/Documentation/networking/xsk-tx-metadata.rst
> +++ b/Documentation/networking/xsk-tx-metadata.rst
> @@ -50,6 +50,10 @@ The flags field enables the particular offload:
>    checksum. ``csum_start`` specifies byte offset of where the checksumming
>    should start and ``csum_offset`` specifies byte offset where the
>    device should store the computed checksum.
> +- ``XDP_TXMD_FLAGS_LAUNCH_TIME``: requests the device to schedule the
> +  packet for transmission at a pre-determined time called launch time. The
> +  value of launch time is indicated by ``launch_time`` field of
> +  ``union xsk_tx_metadata``.
>  
>  Besides the flags above, in order to trigger the offloads, the first
>  packet's ``struct xdp_desc`` descriptor should set ``XDP_TX_METADATA``
> @@ -65,6 +69,65 @@ In this case, when running in ``XDK_COPY`` mode, the TX checksum
>  is calculated on the CPU. Do not enable this option in production because
>  it will negatively affect performance.
>  
> +Launch Time
> +===========
> +
> +The value of the requested launch time should be based on the device's PTP
> +Hardware Clock (PHC) to ensure accuracy. AF_XDP takes a different data path
> +compared to the ETF queuing discipline, which organizes packets and delays
> +their transmission. Instead, AF_XDP immediately hands off the packets to
> +the device driver without rearranging their order or holding them prior to
> +transmission. In scenarios where the launch time offload feature is
> +disabled, the device driver is expected to disregard the launch time
> +request. For correct interpretation and meaningful operation, the launch
> +time should never be set to a value larger than the farthest programmable
> +time in the future (the horizon). Different devices have different hardware
> +limitations on the launch time offload feature.
> +
> +stmmac driver
> +-------------
> +
> +For stmmac, TSO and launch time (TBS) features are mutually exclusive for
> +each individual Tx Queue. By default, the driver configures Tx Queue 0 to
> +support TSO and the rest of the Tx Queues to support TBS. The launch time
> +hardware offload feature can be enabled or disabled by using the tc-etf
> +command to call the driver's ndo_setup_tc() callback.
> +
> +The value of the launch time that is programmed in the Enhanced Normal
> +Transmit Descriptors is a 32-bit value, where the most significant 8 bits
> +represent the time in seconds and the remaining 24 bits represent the time
> +in 256 ns increments. The programmed launch time is compared against the
> +PTP time (bits[39:8]) and rolls over after 256 seconds. Therefore, the
> +horizon of the launch time for dwmac4 and dwxlgmac2 is 128 seconds in the
> +future.
> +
> +The stmmac driver maintains FIFO behavior and does not perform packet
> +reordering. This means that a packet with a launch time request will block
> +other packets in the same Tx Queue until it is transmitted.
> +
> +igc driver
> +----------
> +
> +For igc, all four Tx Queues support the launch time feature. The launch
> +time hardware offload feature can be enabled or disabled by using the
> +tc-etf command to call the driver's ndo_setup_tc() callback. When entering
> +TSN mode, the igc driver will reset the device and create a default Qbv
> +schedule with a 1-second cycle time, with all Tx Queues open at all times.
> +
> +The value of the launch time that is programmed in the Advanced Transmit
> +Context Descriptor is a relative offset to the starting time of the Qbv
> +transmission window of the queue. The Frst flag of the descriptor can be
> +set to schedule the packet for the next Qbv cycle. Therefore, the horizon
> +of the launch time for i225 and i226 is the ending time of the next cycle
> +of the Qbv transmission window of the queue. For example, when the Qbv
> +cycle time is set to 1 second, the horizon of the launch time ranges
> +from 1 second to 2 seconds, depending on where the Qbv cycle is currently
> +running.
> +
> +The igc driver maintains FIFO behavior and does not perform packet
> +reordering. This means that a packet with a launch time request will block
> +other packets in the same Tx Queue until it is transmitted.

Since two devices we initially support are using FIFO mode, should we more
explicitly target this case? Maybe even call netdev features
tx-launch-time-fifo? In the future, if/when we get support timing-wheel-like
queues, we can export another tx-launch-time-wheel?

It seems important for the userspace to know which mode it's running.
In a fifo mode, it might make sense to allocate separate queues
for scheduling things far into the future/etc.

Thoughts? No code changes required, just more explicitly state the
expectations.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
