Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D2A1FCC50
	for <lists+linux-stm32@lfdr.de>; Wed, 17 Jun 2020 13:32:02 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 05704C36B0D;
	Wed, 17 Jun 2020 11:32:02 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id D4BEBC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 11:32:00 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id g1so1650434edv.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 17 Jun 2020 04:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FYdkGKfQbhF4PHnRrzgzko0Pu9PmmGSrtwLwQw3bXCE=;
 b=T6g/CX7W+eXe+BRcWuJ5xyVhGW2503osrL3cKcV6OwvrYm/9hGecwioyC+6DqBxTI1
 GI3r24MpPOf8dxaGrCpCdkjUcr75F/pyPxEyZUCaJbBaB1B81jr8ye2xiRwpwEfmKz/R
 s20pUHPC2URccpUTBgbiQWehgTG6uWVQ2v/XyX+DYvIPmMWoXFeDUAoj3wyZ80pg22fY
 PbpOpMB6D03FcwlVLSuwpdkgbO80PIvW7TRnNwSbi4FJ/i2WbD282lHu4i2/8zvuWxWD
 CF0FE6nsV2KZfRBAsHeD3SPnVGyKot3OeZGUJlZfnCIcfK06jzKo1iPCCL2iRZL5a5tC
 TYCA==
X-Gm-Message-State: AOAM531SO6fBU8M/Lngm41LzDXUuycvcUAkz6PZAXKVuE9yteCn+vI4b
 5fDnJqDSwUjhtg8z/fXkeHA=
X-Google-Smtp-Source: ABdhPJzbijHiPBJ8QWNf9hQXsnh9CB5HA28VxqbN6FIY1pPr6HYmH8EGA0XHv2KQOLuy+zTeoR016w==
X-Received: by 2002:a05:6402:3106:: with SMTP id
 dc6mr6587998edb.375.1592393520398; 
 Wed, 17 Jun 2020 04:32:00 -0700 (PDT)
Received: from localhost (ip-37-188-158-19.eurotel.cz. [37.188.158.19])
 by smtp.gmail.com with ESMTPSA id y62sm12010608edy.61.2020.06.17.04.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 04:31:59 -0700 (PDT)
Date: Wed, 17 Jun 2020 13:31:57 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20200617113157.GM9499@dhcp22.suse.cz>
References: <20200616015718.7812-1-longman@redhat.com>
 <fe3b9a437be4aeab3bac68f04193cb6daaa5bee4.camel@perches.com>
 <20200616230130.GJ27795@twin.jikos.cz>
 <20200617003711.GD8681@bombadil.infradead.org>
 <20200617071212.GJ9499@dhcp22.suse.cz>
 <20200617110820.GG8681@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617110820.GG8681@bombadil.infradead.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, linux-btrfs@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, dsterba@suse.cz,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 linux-sctp@vger.kernel.org, keyrings@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org,
 James Morris <jmorris@namei.org>, kasan-dev@googlegroups.com,
 linux-wpan@vger.kernel.org, David Rientjes <rientjes@google.com>,
 Waiman Long <longman@redhat.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, linux-pm@vger.kernel.org,
 ecryptfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-integrity@vger.kernel.org,
 linux-nfs@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 target-devel@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, Johannes Weiner <hannes@cmpxchg.org>,
 Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org
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

On Wed 17-06-20 04:08:20, Matthew Wilcox wrote:
> On Wed, Jun 17, 2020 at 09:12:12AM +0200, Michal Hocko wrote:
> > On Tue 16-06-20 17:37:11, Matthew Wilcox wrote:
> > > Not just performance critical, but correctness critical.  Since kvfree()
> > > may allocate from the vmalloc allocator, I really think that kvfree()
> > > should assert that it's !in_atomic().  Otherwise we can get into trouble
> > > if we end up calling vfree() and have to take the mutex.
> > 
> > FWIW __vfree already checks for atomic context and put the work into a
> > deferred context. So this should be safe. It should be used as a last
> > resort, though.
> 
> Actually, it only checks for in_interrupt().

You are right. I have misremembered. You have made me look (thanks) ...

> If you call vfree() under
> a spinlock, you're in trouble.  in_atomic() only knows if we hold a
> spinlock for CONFIG_PREEMPT, so it's not safe to check for in_atomic()
> in __vfree().  So we need the warning in order that preempt people can
> tell those without that there is a bug here.

... Unless I am missing something in_interrupt depends on preempt_count() as
well so neither of the two is reliable without PREEMPT_COUNT configured.

-- 
Michal Hocko
SUSE Labs
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
