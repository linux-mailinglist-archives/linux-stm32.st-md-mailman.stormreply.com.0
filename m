Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD521FBF48
	for <lists+linux-stm32@lfdr.de>; Tue, 16 Jun 2020 21:47:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5164DC36B0D;
	Tue, 16 Jun 2020 19:47:03 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED815C36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 19:47:01 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebce8352
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 19:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=7vGnD2Fc5hFa6zE6l8I/6fYFWTE=; b=auHBa5
 AEe5pm5r80dgWM49RbxNg2b1wePIyReSMQ0Rz/3L8Yx5mFtqdklxmmgnU69XYlJN
 hUBaHFgVJALywQiz6/SIkttoZgX1tGyz+Zg+VQcgVldFachBs52tuPslyyMFQ0LX
 thiKjEu3HP7G7pjaS6Q85sWuiJrjwSZZouMci0xDSFLn39VuLeRw1x/kWL7uYtnC
 q9lJ9u4WEJkyqJPlHNMFgYZ8GQhbEM4aqhZNPWgxeSvHzabhX4d1A2W++bIgoNgb
 5POprpu6DVgEzddWZ80fiiLd2tnSpz4DTk3KcXvzj6IQwWQeVy1VhdN6Y6LpuXnz
 67qrTsLtz03/PXLw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8d3c4096
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 19:28:59 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id r77so23450022ior.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 16 Jun 2020 12:46:59 -0700 (PDT)
X-Gm-Message-State: AOAM530toOYeCMkTpdXjNxvGmnUPP7Sv6/nbyvIIdIrLMYMLm6WsHQJ/
 l3NuCILre7WEAS2VfAL/SJAuxF67Fi5tejTztdU=
X-Google-Smtp-Source: ABdhPJxC2pRunaModJX8LCWHauaz4Ko5hXWZ58PHme1+4UYNCmQGIC+iarFUNAqn+rNJyw3DywT6LsxlwSFMRJ3z3pU=
X-Received: by 2002:a6b:6705:: with SMTP id b5mr4346341ioc.29.1592336817452;
 Tue, 16 Jun 2020 12:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
In-Reply-To: <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 Jun 2020 13:46:46 -0600
X-Gmail-Original-Message-ID: <CAHmME9rCD1KJNguthAhZ+OAVZTpBwEvGRLRV0tvQjBaEYG1bHQ@mail.gmail.com>
Message-ID: <CAHmME9rCD1KJNguthAhZ+OAVZTpBwEvGRLRV0tvQjBaEYG1bHQ@mail.gmail.com>
To: Joe Perches <joe@perches.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-btrfs@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 David Sterba <dsterba@suse.cz>, David Howells <dhowells@redhat.com>,
 Linux-MM <linux-mm@kvack.org>, linux-sctp@vger.kernel.org,
 keyrings@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, Matthew Wilcox <willy@infradead.org>,
 linux-wpan@vger.kernel.org, David Rientjes <rientjes@google.com>,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Steffen Klassert <steffen.klassert@secunet.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, David Miller <davem@davemloft.net>,
 linux-bluetooth@vger.kernel.org,
 linux-security-module <linux-security-module@vger.kernel.org>,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Netdev <netdev@vger.kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, linux-ppp@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v4 0/3] mm,
	treewide: Rename kzfree() to kfree_sensitive()
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

On Tue, Jun 16, 2020 at 12:54 PM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-06-15 at 21:57 -0400, Waiman Long wrote:
> >  v4:
> >   - Break out the memzero_explicit() change as suggested by Dan Carpenter
> >     so that it can be backported to stable.
> >   - Drop the "crypto: Remove unnecessary memzero_explicit()" patch for
> >     now as there can be a bit more discussion on what is best. It will be
> >     introduced as a separate patch later on after this one is merged.
>
> To this larger audience and last week without reply:
> https://lore.kernel.org/lkml/573b3fbd5927c643920e1364230c296b23e7584d.camel@perches.com/
>
> Are there _any_ fastpath uses of kfree or vfree?

The networking stack has various places where there will be a quick
kmalloc followed by a kfree for an incoming or outgoing packet. One
place that comes to mind would be esp_alloc_tmp, which does a quick
allocation of some temporary kmalloc memory, processes some packet
things inside of that, and then frees it, sometimes in the same
function, and sometimes later in an async callback. I don't know how
"fastpath" you consider this, but usually packet processing is
something people want to do with minimal overhead, considering how
fast NICs are these days.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
