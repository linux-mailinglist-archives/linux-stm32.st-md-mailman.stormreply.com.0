Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E9815800637
	for <lists+linux-stm32@lfdr.de>; Fri,  1 Dec 2023 09:51:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 817D8C6B47D;
	Fri,  1 Dec 2023 08:51:12 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id F0217C6B479
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 20:28:37 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-db4050e68f3so1465034276.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 30 Nov 2023 12:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701376117; x=1701980917;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YYgokxpdXnom83isGSeLIiEWyDvQWuc8uahFIcEFCiU=;
 b=LFowGhImbHKh65G8VmbzSPJraaHHsW+GqbkJ44C2k5DvOl0jEnsEMd/qn0FUUY3M2I
 Nw2jJuSO3/zyVqmn7LbS1fvclwcHCTZgq7AtHvOpC7PFjkKLZRqAZUAvbF/qS72KzHJI
 WwNe8l7l9yccgVv+Rgv+Vndgv2UWrtjmdMz8cjbArXv+1mlUB7abyPcaAFsFzTDPZi7x
 /khdNcgpNiXO+Wb9zlk7udiMy4ktmP9RCy9uAcMkkWQHAdbAI7AVIWv7O38vj2o5HWp5
 LOnOqNDwNieBKP87Kjbp/Co7Mye8dHAjanjGcTeQWtkKF+/ylIOSdV029yOGpbldPmfd
 rHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701376117; x=1701980917;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YYgokxpdXnom83isGSeLIiEWyDvQWuc8uahFIcEFCiU=;
 b=e99CtaLpRhYtI5C29lWn9sXcFbNiKCpJcZd0Z0Fk8iCX1fkCbNFZVh8GqaUrvKHedi
 VWUwwRBh7X0Bn9vWgJbz1GJ9lU/lp0aDoXo06cx1xjWKyfb90hyQH8b+H1tRnnxpjGy5
 CScNWh+jCqUHaQAysQLOZ/yJE2MCM3fzuuKSGvOaFbD/6LNorLX24LdruNyRSvSUERnC
 1d3lN8/MYtc+d9LBr2BWEMnKzDKVzPqqEaXgNj0E5AH7ctsKjfiA9IiSbI332/m6gqcq
 FP6JEwoa59B2v84Ly1VJk1+RcxrL5cJOSCcZuAkVdQPyYVsoioBV4Jt3zILtCGVoK9Ma
 YCWA==
X-Gm-Message-State: AOJu0YzpKWPxzyHI1ntUdCGMK1PXEnoKKhISe3T9Tf/t8RUJELpQnHpw
 rsTmifr6ha/nk7q9zn9PF+c=
X-Google-Smtp-Source: AGHT+IHYZiQbkBLJ008rJXlLXZbrmVVGfJZyhDvQvrE7IAhJuIYy3iC3ruuDLfNDxv8+R4e1qKgz3Q==
X-Received: by 2002:a25:268f:0:b0:db5:4938:483 with SMTP id
 m137-20020a25268f000000b00db549380483mr975627ybm.32.1701376116773; 
 Thu, 30 Nov 2023 12:28:36 -0800 (PST)
Received: from localhost (114.66.194.35.bc.googleusercontent.com.
 [35.194.66.114]) by smtp.gmail.com with ESMTPSA id
 q2-20020a0c9a42000000b00679d7e76b64sm800622qvd.126.2023.11.30.12.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 12:28:36 -0800 (PST)
Date: Thu, 30 Nov 2023 15:28:36 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Bjorn Topel <bjorn@kernel.org>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
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
Message-ID: <6568f07418508_fbb8229478@willemb.c.googlers.com.notmuch>
In-Reply-To: <20231130162028.852006-2-yoong.siang.song@intel.com>
References: <20231130162028.852006-1-yoong.siang.song@intel.com>
 <20231130162028.852006-2-yoong.siang.song@intel.com>
Mime-Version: 1.0
X-Mailman-Approved-At: Fri, 01 Dec 2023 08:51:11 +0000
Cc: xdp-hints@xdp-project.net, Song Yoong Siang <yoong.siang.song@intel.com>,
 linux-doc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next 1/3] xsk: add launch time support
 to XDP Tx metadata
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

Song Yoong Siang wrote:
> This patch extends the XDP Tx metadata framework to include Time-Based
> Scheduling (TBS) support where the NIC will schedule a packet for
> transmission at a pre-determined time called launch time. The value of
> launch time is communicated from user space to Ethernet driver via
> launch_time field of struct xsk_tx_metadata.
> 
> Suggested-by: Stanislav Fomichev <sdf@google.com>
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> ---
>  Documentation/netlink/specs/netdev.yaml      |  4 ++++
>  Documentation/networking/xsk-tx-metadata.rst |  5 +++++
>  include/net/xdp_sock.h                       | 10 ++++++++++
>  include/net/xdp_sock_drv.h                   |  1 +
>  include/uapi/linux/if_xdp.h                  |  9 +++++++++
>  include/uapi/linux/netdev.h                  |  3 +++
>  net/core/netdev-genl.c                       |  2 ++
>  net/xdp/xsk.c                                |  3 +++
>  tools/include/uapi/linux/if_xdp.h            |  9 +++++++++
>  tools/include/uapi/linux/netdev.h            |  3 +++
>  tools/net/ynl/generated/netdev-user.c        |  1 +
>  11 files changed, 50 insertions(+)
> 
> diff --git a/Documentation/netlink/specs/netdev.yaml b/Documentation/netlink/specs/netdev.yaml
> index 00439bcbd2e3..a602776bbfb4 100644
> --- a/Documentation/netlink/specs/netdev.yaml
> +++ b/Documentation/netlink/specs/netdev.yaml
> @@ -66,6 +66,10 @@ definitions:
>          name: tx-checksum
>          doc:
>            L3 checksum HW offload is supported by the driver.
> +      -
> +        name: launch-time
> +        doc:
> +          HW Time-Based Scheduling (TBS) is supported by the driver.

Can we avoid introducing another term? We already have too many:
launchtime, earliest delivery time (EDT), SO_TXTIME,
pacing offload, earliest txtime first (ETF).  


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
