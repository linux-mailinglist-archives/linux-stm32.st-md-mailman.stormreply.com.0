Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACAB9874D1
	for <lists+linux-stm32@lfdr.de>; Thu, 26 Sep 2024 15:54:50 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 49C88C6DD72;
	Thu, 26 Sep 2024 13:54:50 +0000 (UTC)
Received: from fout-a2-smtp.messagingengine.com
 (fout-a2-smtp.messagingengine.com [103.168.172.145])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD29CCFAC50
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 26 Sep 2024 13:54:42 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id 152F51380297;
 Thu, 26 Sep 2024 09:54:42 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-10.internal (MEProxy); Thu, 26 Sep 2024 09:54:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm1; t=1727358882;
 x=1727445282; bh=6riDWHgJboduwD6LaSFNyFPLRcRPaab9kSUcfli2BKY=; b=
 Ed82I70M0gRdT9TOoYaLzrvfHoLQ2RkVw5BljDBCWBHW5/YtKj816v3sAP+b7ZSm
 cZoIFqIaVwq5PHBT/e35Wg4s5vbFREFevM//daefmaW6kP+XYxepPCYyTXHw3QZ0
 9Za1MYRn7T98NbA5SZfsbPsmZzSiI7SC3tSrSXiBBKVyfj2pBH6mBaNrjOxrFaHE
 j49q0/22DpSKg/bsY3mml7j9HF3n4sLnbkfP6PQILPBqWhYIc1DlKnqtFgxhz20J
 3kccxBEvmwm7gelOqzjUi/OyBkCJJShdYOKtnleaeWdN5njs6O1xbn4nIFM65Yhm
 YmauC2QVmPVGgRo9SrBwFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727358882; x=
 1727445282; bh=6riDWHgJboduwD6LaSFNyFPLRcRPaab9kSUcfli2BKY=; b=R
 3y/KsXabibaJ2Z/XkVysWRaZOs8MTtsGNxYTlNWKe7wzJP2qTTNiBsy3MdawjKzW
 0c/i8g4NVXfzSmdWt87jP66p8OWqjCS2WourGpBGTP2iwOVQgH79FH+EE3gQR0m0
 rheDEpOt7B7Dso+6iT/5xT59DHUYbAseI3FJ7vd9kVI6eGyd+dD6sxD56OuQ1Mgw
 4YU0P7chz9BoVPa9xYbZWK0T1egLvkjZunHNa98cjf8dNOsPcURxW/lkhDQYd9uT
 5YVDeZSGlPl3GmQQIK38QWLQjVwddi8BnzWgbhpeLRrZuKjZEtasvdnzWAy3mCM/
 WuF3u9Im8+31VwBTNF1PQ==
X-ME-Sender: <xms:oGf1ZkqdmIpA7o2_QzgaN1fdtEYURj_XJL8PbUipRTKbPtqfIWADNA>
 <xme:oGf1ZqqQeZTrmeBKpSvohuYmfbNnevz71Ar_g3IYdL_mHSretB_U6oJUuZO9-jznk
 16KkdMa_LQIOvQaVog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtjedgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
 guvgeqnecuggftrfgrthhtvghrnhepgeehveefleethefhudfhjeeutedvtedttdejieff
 feeuieevhfehgeekieffgfeunecuffhomhgrihhnpehutghlihgstgdrohhrghdpuggvsg
 hirghnrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeefpdhmohguvg
 epshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghn
 khgvnhdruggvpdhrtghpthhtohepvhhlrgguihhmihhrrdhmuhhriihinhesrghrmhdrtg
 homhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdr
 vghupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtoh
 eprghlvgigrghnughrvgdrthhorhhguhgvsehfohhsshdrshhtrdgtohhmpdhrtghpthht
 oheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehjtghmvhgskh
 gstgesghhmrghilhdrtghomhdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdr
 tghomhdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:oGf1ZpOs0y-FbPti-OKl6xR1ZY2dhie4YLDkmurMdwnfxHpHtJYoFA>
 <xmx:oGf1Zr74k2DXoCSjpcxnYW6z-HhZzsyJVBY7ImllYBvWSFNv1qkDIA>
 <xmx:oGf1Zj5h518sYyyR-7X7t9gpI0zata-tw922AwVZ1WhK4IinxbpVLQ>
 <xmx:oGf1Zri38KCr4FELnXbIKGVGM8vn4Dn5Mz07V6elrrKyLhz_X1BznA>
 <xmx:omf1ZtSyM5YH_Y3K6L2LepXVBPOPk7t-GP7MIFO1kTmF_iVRLYo_xwlZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id E77A02220071; Thu, 26 Sep 2024 09:54:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 26 Sep 2024 13:54:09 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Hildenbrand" <david@redhat.com>, "Arnd Bergmann" <arnd@kernel.org>, 
 linux-mm@kvack.org
Message-Id: <1a1f118e-9a7c-4c66-b956-d21eb36fce48@app.fastmail.com>
In-Reply-To: <b7f7f849-00d1-49e5-8455-94eb9b45e273@redhat.com>
References: <20240925210615.2572360-1-arnd@kernel.org>
 <20240925210615.2572360-6-arnd@kernel.org>
 <b7f7f849-00d1-49e5-8455-94eb9b45e273@redhat.com>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michal Hocko <mhocko@suse.com>,
 Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Linux-Arch <linux-arch@vger.kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Christoph Hellwig <hch@lst.de>,
 Matt Turner <mattst88@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Vladimir Murzin <vladimir.murzin@arm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Damien Le Moal <dlemoal@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Vlastimil Babka <vbabka@suse.cz>,
 Christian Brauner <brauner@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 5/5] [RFC] mm: Remove MAP_UNINITIALIZED
	support
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

On Thu, Sep 26, 2024, at 08:46, David Hildenbrand wrote:
> On 25.09.24 23:06, Arnd Bergmann wrote:
>
> The first, uncontroversial step could indeed be to make 
> MAP_UNINITIALIZED a nop, but still leave the definitions in mman.h etc 
> around.
>
> This is the same we did with MAP_DENYWRITE. There might be some weird 
> user out there, and carelessly reusing the bit could result in trouble. 
> (people might argue that they are not using it with MAP_HUGETLB, so it 
> would work)
>
> Going forward and removing MAP_UNINITIALIZED is a bit more 
> controversial, but maybe there really isn't any other user around. 
> Software that is not getting recompiled cannot be really identified by 
> letting it rest in -next only.
>
> My take would be to leave MAP_UNINITIALIZED in the headers in some form 
> for documentation purposes.

I don't think there is much point in doing this in multiple
steps, either we want to break it at compile time or leave
it silently doing nothing. There is also very little
difference in practice because applications almost always
use sys/mman.h instead of linux/mman.h.

FWIW, the main user appears to be the uClibc and uclibc-ng
malloc() implementation for NOMMU targets:

https://git.uclibc.org/uClibc/commit/libc/stdlib/malloc/malloc.c?id=00673f93826bf1f

Both of these also define this constant itself as 0x4000000
for all architectures.

There are a few others that I could find with Debian codesearch:

https://sources.debian.org/src/monado/21.0.0+git2905.e26a272c1~dfsg1-2/src/external/tracy/client/tracy_rpmalloc.cpp/?hl=890#L889
https://sources.debian.org/src/systemtap/5.1-4/testsuite/systemtap.syscall/mmap.c/?hl=224#L224
https://sources.debian.org/src/fuzzel/1.11.1+ds-1/shm.c/?hl=488#L488
https://sources.debian.org/src/notcurses/3.0.7+dfsg.1-1/src/lib/fbuf.h/?hl=35#L35
https://sources.debian.org/src/lmms/1.2.2+dfsg1-6/src/3rdparty/rpmalloc/rpmalloc/rpmalloc/rpmalloc.c/?hl=1753#L1753

All of these will fall back to not passing MAP_UNINITIALIZED
if it's not defined, which is what happens on glibc and musl.

       Arnd
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
