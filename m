Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F243B7DEC
	for <lists+linux-stm32@lfdr.de>; Wed, 30 Jun 2021 09:17:57 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8AAEDC57B7D;
	Wed, 30 Jun 2021 07:17:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A7AC2C57B53
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jun 2021 16:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624985767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q2NICKy+eY6u9v6U5C5rPMzRkfmDNI+XJLW4LIKdeOM=;
 b=SHTWhmVBEuzBVpb3ru6Hy6gHk3/NygllLgX8Nwyp6LGXPDDRzlce44DyCsquhVjtwgyjoc
 w8RWwAQ0N4JlYqviMJVzZbyJf1wrvV1rHoMW+T2D/Ia4R6H27dC254OYcCJLuDWJof/jY2
 R8RXIWTnOxBsqdqDYW0OefRHWmNwdWE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-aFUEF6EdNeGAKivYKc2Jzw-1; Tue, 29 Jun 2021 12:56:02 -0400
X-MC-Unique: aFUEF6EdNeGAKivYKc2Jzw-1
Received: by mail-ed1-f69.google.com with SMTP id
 r15-20020aa7da0f0000b02903946a530334so11800047eds.22
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 29 Jun 2021 09:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=q2NICKy+eY6u9v6U5C5rPMzRkfmDNI+XJLW4LIKdeOM=;
 b=YKezMwS47GMJ3bzqM6EW20gU8++8YbISycsgNPRLKjDIUaJN4sJdawDcntfzEMIjoz
 q5jlGbFo12TfPeN2IZH2I1kK09I0nBZj3kBxBUsjvKMz0hZb7cVorVuFDGWTKoVUqljh
 Q4RO9v+V141S1s2YBGmUqxPIxjs4CfMcqO0icTUuxx/z7XgZQ/xgyLbxKqegcjxYjbft
 O+z/g8rytjIkXfQ+bkclbZGhvn55uaAnnIx7Zu5Rc6Esaef2nPKdUfkrhz4k4YF7XHqd
 Zb+MzNWZec15tV61pEdFosDVjOrtY+emRXNoEbNLvxzUF9uvvjLSuaSRyfHX3jCx8sbW
 8xTA==
X-Gm-Message-State: AOAM532nhaiN/7O9ZnEIt3wx6VLjYBOISY+jOjaDkUMk0GaswP/7ByVY
 OkKZ51Kl7m/1o8iKOgArBHsAEvYkbs0zLdTEr1SDJ8XoR1YbDUvZKyVetpARb3ZUGmNQAsL8wil
 mvqXFa5PGwuT3Ss7RB8SUnad5M36kEstqNCdRLOZF
X-Received: by 2002:a05:6402:51c9:: with SMTP id
 r9mr10497270edd.326.1624985761638; 
 Tue, 29 Jun 2021 09:56:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6JX0kG7OliK+69WwEBKZuT8U9A5MzKTXCdCtoFvyGEIz/VAikmU9KP1H/PmK4CJpy/7zJHQ==
X-Received: by 2002:a05:6402:51c9:: with SMTP id
 r9mr10497251edd.326.1624985761526; 
 Tue, 29 Jun 2021 09:56:01 -0700 (PDT)
Received: from [192.168.42.238] (3-14-107-185.static.kviknet.dk.
 [185.107.14.3])
 by smtp.gmail.com with ESMTPSA id gv20sm8656803ejc.23.2021.06.29.09.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 09:56:01 -0700 (PDT)
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
References: <20210617145534.101458-1-xuanzhuo@linux.alibaba.com>
 <20210628104721.GA57589@ranger.igk.intel.com>
From: Jesper Dangaard Brouer <jbrouer@redhat.com>
Message-ID: <f5ce5610-443c-a2d9-43ef-d203f9afb0d8@redhat.com>
Date: Tue, 29 Jun 2021 18:55:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628104721.GA57589@ranger.igk.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jbrouer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-Mailman-Approved-At: Wed, 30 Jun 2021 07:17:56 +0000
Cc: Alexei Starovoitov <ast@kernel.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 Krzysztof Kazimierczak <krzysztof.kazimierczak@intel.com>,
 John Fastabend <john.fastabend@gmail.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v2] xdp,
 net: fix for construct skb by xdp inside xsk zc rx
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

On 28/06/2021 12.47, Maciej Fijalkowski wrote:

> +static __always_inline struct sk_buff *
> +xdp_construct_skb(struct xdp_buff *xdp, struct napi_struct *napi)
> +{

I don't like the generic name "xdp_construct_skb".

What about calling it "xdp_copy_construct_skb", because below is 
memcpy'ing the data.

Functions that use this call free (or recycle) the memory backing the 
packet, after calling this function.

(I'm open to other naming suggestions)


> +	unsigned int metasize;
> +	unsigned int datasize;
> +	unsigned int headroom;
> +	struct sk_buff *skb;
> +	unsigned int len;
> +
> +	/* this include metasize */
> +	datasize = xdp->data_end  - xdp->data_meta;
> +	metasize = xdp->data      - xdp->data_meta;
> +	headroom = xdp->data_meta - xdp->data_hard_start;
> +	len      = xdp->data_end  - xdp->data_hard_start;
> +
> +	/* allocate a skb to store the frags */
> +	skb = __napi_alloc_skb(napi, len, GFP_ATOMIC | __GFP_NOWARN);
> +	if (unlikely(!skb))
> +		return NULL;
> +
> +	skb_reserve(skb, headroom);
> +	memcpy(__skb_put(skb, datasize), xdp->data_meta, datasize);
> +	if (metasize) {
> +		__skb_pull(skb, metasize);
> +		skb_metadata_set(skb, metasize);
> +	}
> +
> +	return skb;
> +}

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
