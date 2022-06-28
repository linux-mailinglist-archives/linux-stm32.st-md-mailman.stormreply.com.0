Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCB055E35D
	for <lists+linux-stm32@lfdr.de>; Tue, 28 Jun 2022 15:36:56 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA91CC5F1EE;
	Tue, 28 Jun 2022 13:36:55 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 7CFB2C035BF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 13:36:54 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id u14so17288610qvv.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 28 Jun 2022 06:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gN4ZNyT9GRZ46Vwx3CUzNgwGxKE3ptwelsb3O/2waMc=;
 b=SRPS2zIET11DP06FAnMANUW30rX+F+KLnmvgpItTZuHDiHMYbx191l+udZ0BIKVo+p
 DUqKNFcRnPxEdciA9v/rjMoUuUABeinU5a59o91m7mO0ei+LjGwfeqP1sFK6bST4r2Sc
 +kwNrequilw+r3whlSvEqjUrw7uEou8aBEv26lUqmckZs7QEO1gxqNAIdKmR6ixdoBBW
 VwXL+VitONeiHER4+6czyOuvux/gSa01CsajOGl6xQeKgTZdOU9/PF5ai6yeP3/8Na6A
 VkyCaiWAoLiX3IML+rZ/qAH9obhof6Stg3VEpk4n7D6sOfmWV6A4zI2itZ9nI+NyrBEn
 GAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gN4ZNyT9GRZ46Vwx3CUzNgwGxKE3ptwelsb3O/2waMc=;
 b=6Yrb/OaATVpjj45YwCF+pA/b+ia5UyvATb397oKfUGdcTw7VJ57EGUq6gTZ+dCLprb
 hE1F1v4WiYeA1uJikaWUOKAx55IamXP8t7eDoeZgQlAFjiGMA7OIlp93g6k3goaB8rHa
 NFGcrWqplDz5C5zuPH1qx72IAIm2kqvTj1hxQcjUUHZXngjZZzRwnH3v9KRJymGNm0S+
 LCRmJ5uMdYBta1rGgbAZLBdEDxfBP7h3V0OAArhgKWOjPmbyGcqmgtdD+hH8aodPX5BU
 HbUnIrL8EL+7UlcH295BbKTH9ia2KVHXHvLOgpjBbV1O0xRT6e4ZGnFB+fP5ljykB6Fu
 q+dg==
X-Gm-Message-State: AJIora8YD7fm57F4790fp1dhWYyt7z/ifUnewqiZuTyPxlzq1oowAqJs
 FUj6yYNtmaJ6r9+Skp9rZKOjtg==
X-Google-Smtp-Source: AGRyM1uooXTVlKXYemR9EvbrrQp4i2XA4BpQT09bjvN7I6xIwm3cKCnpXCNHNGqwd+HxVz52pv3Omw==
X-Received: by 2002:ac8:5b0d:0:b0:31b:f519:4107 with SMTP id
 m13-20020ac85b0d000000b0031bf5194107mr1237416qtw.331.1656423413317; 
 Tue, 28 Jun 2022 06:36:53 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.129]) by smtp.gmail.com with ESMTPSA id
 s10-20020a05620a29ca00b006a79479657fsm708363qkp.108.2022.06.28.06.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 06:36:52 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1o6BOd-002vAA-VA; Tue, 28 Jun 2022 10:36:51 -0300
Date: Tue, 28 Jun 2022 10:36:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <20220628133651.GO23621@ziepe.ca>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
 <20220628004052.GM23621@ziepe.ca>
 <20220628005825.GA161566@embeddedor>
 <20220628022129.GA8452@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220628022129.GA8452@embeddedor>
Cc: nvdimm@lists.linux.dev, alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net,
 linux-stm32@st-md-mailman.stormreply.com, linux-s390@vger.kernel.org,
 Daniel Borkmann <daniel@iogearbox.net>, linux-rdma@vger.kernel.org,
 x86@kernel.org, kasan-dev@googlegroups.com, lvs-devel@vger.kernel.org,
 coreteam@netfilter.org, v9fs-developer@lists.sourceforge.net,
 Kees Cook <keescook@chromium.org>, intel-gfx@lists.freedesktop.org,
 linux-can@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, virtualization@lists.linux-foundation.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-sctp@vger.kernel.org,
 netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH][next] treewide: uapi: Replace zero-length
 arrays with flexible-array members
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

On Tue, Jun 28, 2022 at 04:21:29AM +0200, Gustavo A. R. Silva wrote:

> > > Though maybe we could just switch off -Wgnu-variable-sized-type-not-at-end  during configuration ?

> We need to think in a different strategy.

I think we will need to switch off the warning in userspace - this is
doable for rdma-core.

On the other hand, if the goal is to enable the array size check
compiler warning I would suggest focusing only on those structs that
actually hit that warning in the kernel. IIRC infiniband doesn't
trigger it because it just pointer casts the flex array to some other
struct.

It isn't actually an array it is a placeholder for a trailing
structure, so it is never indexed.

This is also why we hit the warning because the convient way for
userspace to compose the message is to squash the header and trailer
structs together in a super struct on the stack, then invoke the
ioctl.

Jason 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
