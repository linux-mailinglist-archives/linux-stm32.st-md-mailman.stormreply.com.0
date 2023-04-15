Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC616E301E
	for <lists+linux-stm32@lfdr.de>; Sat, 15 Apr 2023 11:34:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50CB1C6A613;
	Sat, 15 Apr 2023 09:34:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id AC734C6A610
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681551284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZxPnWAcQVBNBNS9KRY2KFLNjYwkNYHKUC4oRsplfh2c=;
 b=UYWTlVgkphQlkSTddG2aOLCk4mcA0eJRNbkWa3J/1+cnT0SbIs+Qx5as4PMq71cXbvBjeq
 b7WXbbBTW9hNkEdC60gcp95B6zYPGv6tgewOXdT6qVt5MMNs+zR2cL6pItjcJGil/QhUdQ
 DTpkBWgXqIlDT5lH068vW8BDw3kTCWE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-XKY8Bm40MXCydKvCukYNhw-1; Sat, 15 Apr 2023 05:34:43 -0400
X-MC-Unique: XKY8Bm40MXCydKvCukYNhw-1
Received: by mail-ej1-f71.google.com with SMTP id
 rf18-20020a1709076a1200b009333eaeb2b3so7565265ejc.12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 15 Apr 2023 02:34:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681551282; x=1684143282;
 h=content-transfer-encoding:in-reply-to:references:to
 :content-language:subject:cc:user-agent:mime-version:date:message-id
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZxPnWAcQVBNBNS9KRY2KFLNjYwkNYHKUC4oRsplfh2c=;
 b=E2YBpHg5H0Q3Nr2yOYt6qXqMcsoeeU8NPSvPkMSxjq509ZW5isIuxAVP/Yq3gsaRNU
 0Jae90G6YmFt+4xVrLl3iXIZeKN+PzvEqyXz+Ko3GSxZa+jzog2/cigtAru2joAAOSoq
 SIkCaWht39okybR1z/OPrs2TjyP4sK4IPX6H+20xo0hANHfPjw9pYB6qmiqhRPA6yNK7
 n0CQ2D281B5arMJlA62AD6w8ix+g27kkdTD2yJPcvAR47JcMVvBncX2wNajSCQ1pRwVz
 Ald08CvIaVMD+z37xP90dMmrd0v1DbVKwgFjGXx3rsrLxiMe9ggF3iFEQXx5uldE5NvH
 iNog==
X-Gm-Message-State: AAQBX9eY71EaBWvGVq02wYo8VmeT9sypETTLJivKkE+K7/ejIQgNtLQX
 SGk8OrPcLbIma6VAiuRPUaxJ11D8Z8A9zoEHE5ckPBdqWbXiaKywG1gyyQ73B4IG65nn0cu4Iso
 pf1sAaUHUqFcRoZ7IrfFOyBGB+fuhxZvE7rB0YPUP
X-Received: by 2002:a17:906:6bd0:b0:94e:f969:fb3e with SMTP id
 t16-20020a1709066bd000b0094ef969fb3emr1661550ejs.43.1681551282637; 
 Sat, 15 Apr 2023 02:34:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350ahABqOGqRCJSwv9+bd3MwJOCg8HOEo/vfDe75jx4W55RgExcuyfQKh2L9CES3tCsodbIai/w==
X-Received: by 2002:a17:906:6bd0:b0:94e:f969:fb3e with SMTP id
 t16-20020a1709066bd000b0094ef969fb3emr1661531ejs.43.1681551282362; 
 Sat, 15 Apr 2023 02:34:42 -0700 (PDT)
Received: from [192.168.42.222] (194-45-78-10.static.kviknet.net.
 [194.45.78.10]) by smtp.gmail.com with ESMTPSA id
 b22-20020a1709062b5600b009306ebc79d3sm3549540ejg.59.2023.04.15.02.34.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Apr 2023 02:34:41 -0700 (PDT)
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
X-Google-Original-From: Jesper Dangaard Brouer <brouer@redhat.com>
Message-ID: <eb277f26-932b-d1b5-ec67-5aee2bd0a287@redhat.com>
Date: Sat, 15 Apr 2023 11:34:40 +0200
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
 <20230415064503.3225835-4-yoong.siang.song@intel.com>
In-Reply-To: <20230415064503.3225835-4-yoong.siang.song@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: xdp-hints@xdp-project.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, brouer@redhat.com, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net-next v6 3/3] net: stmmac: add Rx HWTS
 metadata to XDP ZC receive pkt
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
> Add receive hardware timestamp metadata support via kfunc to XDP Zero Copy
> receive packets.
> 
> Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
> ---
>   .../net/ethernet/stmicro/stmmac/stmmac_main.c | 22 +++++++++++++++++++
>   1 file changed, 22 insertions(+)

LGTM

Acked-by: Jesper Dangaard Brouer <brouer@redhat.com>

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
