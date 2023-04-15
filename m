Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C3C6E3018
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Apr 2023 11:33:29 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2FB8AC6A613;
	Sat, 15 Apr 2023 09:33:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4D61BC6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681551207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yiqPklxUzRy8bqs+v/ZpMBXMKYs89gD+rYERGCmxvBI=;
 b=NSzsuY3nh20hYKR5r63/OntVkBwtUdSwYVQi5ne3bwsnVCvkSyp3REmpdB+pmQh/CQxb3U
 xdt51IRHR5Tp4EFPhnxO0Jc/Opk0PD1Z1dnhJVNyORgLgpmVw0E3RO0NLuy07NCU0cmrd3
 y00iarI++EwbiAty4ByULvjdJMz+hU0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-StYmo3MRNG29DSRH6ReQ6A-1; Sat, 15 Apr 2023 05:33:26 -0400
X-MC-Unique: StYmo3MRNG29DSRH6ReQ6A-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-5067c88a429so967266a12.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 02:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681551205; x=1684143205;
 h=content-transfer-encoding:in-reply-to:references:to
 :content-language:subject:cc:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yiqPklxUzRy8bqs+v/ZpMBXMKYs89gD+rYERGCmxvBI=;
 b=FyX2Mes/cnIBcatd1/tt96PzlZYtIcVSUglZF0tVo38MgVN4lgOWCAQZijvZJSOG53
 mh+z9GTogHqJ0aA5AYCHfrKl9ZuY4uxl2lXnmw2x7vdZfkgYl5OM83KZ8e+BeeEZFKx1
 8vrOph3ZhvqcQxQBCEG1m7Cz6arOSaAHHbxjZe+Yrx/upq2nPwfN+q71L8Nia0VDK7E5
 ncwwvUakQwNpp/UyvL8Pd1kAa88WPaTUmzqvBi3kOsp85pGYzOnPrNRnXmpoqRcjOlRI
 bpTV7YC4GRxXu3Tscau4E1tzhhyA75+ILdTz3QlDQPLeM8tSCIZW3qmEYPhr2N1lUxVQ
 RzMA==
X-Gm-Message-State: AAQBX9fULRvbehh2AX5ikclLPzHJ4xe4qw0AsbMbjcZcUx/sslcCilYG
 FG/hrfpCt4T1BcYxvtrB0pnweoHSPMhlKzt7phWcnF6PKdUZ3DKWAhGIjagD+F0zcgBCAPjIqjG
 JWjNUoBya0lhvpeq0qoD4tKJOzFQiaXIFJhYhXPhN
X-Received: by 2002:aa7:d04e:0:b0:505:7d54:db93 with SMTP id
 n14-20020aa7d04e000000b005057d54db93mr8621913edo.21.1681551204996; 
 Sat, 15 Apr 2023 02:33:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350YF2Zbojdxq6qbQxtDvNXENyG1SKgwEvrcmid1+4koV/BuLd+OMKg6WCD3kviyV5EY7ijM6YA==
X-Received: by 2002:aa7:d04e:0:b0:505:7d54:db93 with SMTP id
 n14-20020aa7d04e000000b005057d54db93mr8621886edo.21.1681551204598; 
 Sat, 15 Apr 2023 02:33:24 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net.
 [194.45.78.10]) by smtp.gmail.com with ESMTPSA id
 o24-20020aa7c7d8000000b005067d089aafsm2138743eds.11.2023.04.15.02.33.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Apr 2023 02:33:24 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <164fc8a0-0248-76dc-be53-706eb36a9ec2@redhat.com>
Date: Sat, 15 Apr 2023 11:33:22 +0200
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
References: <20230415064503.3225835-1-yoong.siang.song@intel.com>
 <20230415064503.3225835-3-yoong.siang.song@intel.com>
In-Reply-To: <20230415064503.3225835-3-yoong.siang.song@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, brouer@redhat.com, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6 2/3] net: stmmac: add Rx HWTS
 metadata to XDP receive pkt
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


On 15/04/2023 08.45, Song Yoong Siang wrote:
> Add receive hardware timestamp metadata support via kfunc to XDP receive
> packets.
> 
> Suggested-by: Stanislav Fomichev <sdf@google.com>
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> Acked-by: Stanislav Fomichev <sdf@google.com>
> ---
>   drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  3 ++
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 40 ++++++++++++++++++-
>   2 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index ac8ccf851708..07ea5ab0a60b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -94,6 +94,9 @@ struct stmmac_rx_buffer {
>   
>   struct stmmac_xdp_buff {
>   	struct xdp_buff xdp;
> +	struct stmmac_priv *priv;
> +	struct dma_desc *desc;
> +	struct dma_desc *ndesc;
>   };

Thanks for the adjustments.

Acked-by: Jesper Dangaard Brouer <brouer@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
