Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6FA67214C
	for <lists+linux-stm32@lfdr.de>; Wed, 18 Jan 2023 16:31:10 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4921BC69049;
	Wed, 18 Jan 2023 15:31:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4DF82C65E70
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674055867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qyi/LW55EkVK757BkAA9VDtsr0MGQ7QA8hOcylTonLk=;
 b=bJRY8KQM3CZ+JhHp+otLVHWy3pI74kmWaAYXzsHTuXoB+0E48HHoqVEU7p7kIV1D12hT6p
 3WM4/4Z66RKI8OJwi0fRLyBXXhYzhIHevtj+4bPjC5ExNT2JSydBjOv5JYp7VHDaqtY9SI
 vygPqdgeNN8uX+T3gT0lhZNtLN/ncg8=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-mIQdY95pOhibseo92uzDIw-1; Wed, 18 Jan 2023 10:31:00 -0500
X-MC-Unique: mIQdY95pOhibseo92uzDIw-1
Received: by mail-oo1-f69.google.com with SMTP id
 a10-20020a4a874a000000b004f6fdc9cd7cso925445ooi.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 18 Jan 2023 07:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qyi/LW55EkVK757BkAA9VDtsr0MGQ7QA8hOcylTonLk=;
 b=2XjP9Pn1DO3ljbmW1WNCI9Mq8gRf4TJptCp88XUE+7315j7GzCUhk2t8SQWRxobDey
 45rNfhs4pdAEke2atHDDXXA8xyfVJOQJTAe2z4k0XRKRt1fHTQrpeQxV+x19ydsIfXCC
 hYuBjh4MCq39Ec58KMvNzdu9poy8i58w6kfICzl1i7tLN6kwH/rtlxEmU9NL16sGn8ko
 1dVSQxwBSjGSUQgehnxwlXybH4kjzUAHjP/Hgogeutok6t1T/zoxtytnW9ftu4hsHpCg
 dJ3VXvdAkZrrIkHdr/FbdyYWSzasMCajjmFH0GmNm9nARAE3EtHGIvJWqpgCdTHxNY0b
 HpdQ==
X-Gm-Message-State: AFqh2komsfrBfJEwSw3P8qgZisncs5IpHXEHOioDzM4g0hhMgP3MQk8m
 XOKzri7O9GsC7xrzXnB+G/2OTQfXHggkHAZsq1U+UOlOu4awJ1vT2rS5geDTL4o0PmTDvYWVQYS
 g5z1mV2afK8Y7ei7/ubLPGuctLxIUYj1tjT0WSQCV
X-Received: by 2002:a05:6870:1614:b0:143:9d79:e911 with SMTP id
 b20-20020a056870161400b001439d79e911mr4735557oae.46.1674055858473; 
 Wed, 18 Jan 2023 07:30:58 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvQD1ylfnV23NmH/gc49C3Ld8OeoMRj5utANK8r0Vbn9N2WPIQ/3o+cIGR6YM0+vkC8xg1Q6Q==
X-Received: by 2002:a05:6870:1614:b0:143:9d79:e911 with SMTP id
 b20-20020a056870161400b001439d79e911mr4735523oae.46.1674055858208; 
 Wed, 18 Jan 2023 07:30:58 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::21])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a056870218300b00152c52608dbsm18681737oae.34.2023.01.18.07.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jan 2023 07:30:57 -0800 (PST)
Date: Wed, 18 Jan 2023 09:30:54 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Message-ID: <20230118153054.22vs2sqsuxifjpxg@halaney-x13s>
References: <20230116193722.50360-1-ahalaney@redhat.com>
 <20230117194348.3f098a18@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230117194348.3f098a18@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Ning Cai <ncai@quicinc.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, richardcochran@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, edumazet@google.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com, peppe.cavallaro@st.com,
 pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: enable all safety
	features by default
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

On Tue, Jan 17, 2023 at 07:43:48PM -0800, Jakub Kicinski wrote:
> On Mon, 16 Jan 2023 13:37:23 -0600 Andrew Halaney wrote:
> > I've been working on a newer Qualcomm platform (sa8540p-ride) which has
> > a variant of dwmac5 in it. This patch is something Ning stumbled on when
> > adding some support for it downstream, and has been in my queue as I try
> > and get some support ready for review on list upstream.
> > 
> > Since it isn't really related to the particular hardware I decided to
> > pop it on list now. Please let me know if instead of enabling by default
> > (which the original implementation did and is why I went that route) a
> > message like "Safety features detected but not enabled in software" is
> > preferred and platforms are skipped unless they opt-in for enablement.
> 
> Could you repost and CC Wong Vee Khee, and maybe some other Intel folks
> who have been touching stmmac recently? They are probably the best to
> comment / review.
> 

Shoot, yes thank you I intended to do! Will resend.

- Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
