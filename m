Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEE76E27F2
	for <lists+linux-stm32@lfdr.de>; Fri, 14 Apr 2023 18:04:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B118CC6A5E6;
	Fri, 14 Apr 2023 16:04:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 71EBEC69063
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681488272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/xY5S5AKjyyCNBcr52QSMM9S9bXcihct4tejRSjTCM=;
 b=DvZEf5xjbg6lL9XqHVDmPcLDz5xbpT17HLYeVnBUv/BxQdLVlzg76RTmFmyY/Sc66XKUX3
 HK9Cazl8281UpKO4eHyO6iGugp4QVl4/A2BvaRLzAso2N9Z6RdMcsgGkOPBQ+B6QwT2mwA
 yqw/PCH7CCWo9mdmNi6NcZhe0x98j6o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-j86l4uBZPuyKGhWxVWoxMw-1; Fri, 14 Apr 2023 12:04:31 -0400
X-MC-Unique: j86l4uBZPuyKGhWxVWoxMw-1
Received: by mail-ed1-f70.google.com with SMTP id
 p16-20020a50cd90000000b004fb36e6d670so6766276edi.5
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 14 Apr 2023 09:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681488270; x=1684080270;
 h=content-transfer-encoding:in-reply-to:references:to
 :content-language:subject:cc:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h/xY5S5AKjyyCNBcr52QSMM9S9bXcihct4tejRSjTCM=;
 b=CZTQnYyKrVgLB4d7Im74K12D5hvJ7+o3BuFZNiObtZ52CkX4vwE1AD5s8pTOv+FghG
 9cm3pxgoTc9wk7i+uU0mcf7/1PjHwZIGbeMFQW3nDaDBCUAAsRjNnp2Pyth3I3IA+/0t
 gvaoKx3ou98VFhYSy2yS/08FlkCW3ysD/SiQzaYwaPGYg6xNOVF+VUqEXLUbpNL/RlM6
 hes0tQi6o+ADyv4M1daNOE+up0Wl1ZyVuVniBbkiuCZekmIc5icLsVeA3t+noWcJkkgN
 S21lFFJ1TbbqP6cCkl6XPK4gm6/jWGLj+KeTcClhKugp+SH3rdehKxP6E1Agz5G4fDS0
 oNLw==
X-Gm-Message-State: AAQBX9d9h2fHEuFAnkoNQwEDoUQ0UsQ7SmYI72UDyBTMTgkTOgdHVqMr
 +5ikjc8ip/smPZZIySaoB1pv/cXqwR9+ZaU3pK0kYBT1WTqSzERSvQygJ90vnJHUJ1C9lmmBF3W
 /ILmvve/TZC7v+/fngFOhQ2wCAv7KD4oDoAr7SZYP
X-Received: by 2002:a17:906:55d2:b0:94a:4ce3:8043 with SMTP id
 z18-20020a17090655d200b0094a4ce38043mr6974847ejp.52.1681488270073; 
 Fri, 14 Apr 2023 09:04:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350YUd0s8wuUVSimKBiUGgDOIDL4Q9HN4aH0WFXgHCGjnWb4XN/KT7TjiDzhYoo/WnaAhvBfeKw==
X-Received: by 2002:a17:906:55d2:b0:94a:4ce3:8043 with SMTP id
 z18-20020a17090655d200b0094a4ce38043mr6974795ejp.52.1681488269738; 
 Fri, 14 Apr 2023 09:04:29 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net.
 [194.45.78.10]) by smtp.gmail.com with ESMTPSA id
 wv13-20020a170907080d00b0094ee21fe943sm1077039ejb.116.2023.04.14.09.04.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Apr 2023 09:04:29 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <5c3f37c2-3244-fbad-ba94-bc61b63c557c@redhat.com>
Date: Fri, 14 Apr 2023 18:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Song Yoong Siang <yoong.siang.song@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>, Alexander Duyck
 <alexanderduyck@fb.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Jacob Keller <jacob.e.keller@intel.com>
References: <20230414052651.1871424-1-yoong.siang.song@intel.com>
 <20230414052651.1871424-2-yoong.siang.song@intel.com>
In-Reply-To: <20230414052651.1871424-2-yoong.siang.song@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, brouer@redhat.com, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v5 1/3] net: stmmac: introduce
 wrapper for struct xdp_buff
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>


On 14/04/2023 07.26, Song Yoong Siang wrote:
> Introduce struct stmmac_xdp_buff as a preparation to support XDP Rx
> metadata via kfuncs.
> 
> Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
> Reviewed-by: Jacob Keller<jacob.e.keller@intel.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h   |  4 ++++
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c  | 18 +++++++++---------
>   2 files changed, 13 insertions(+), 9 deletions(-)

Acked-by: Jesper Dangaard Brouer <brouer@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
