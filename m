Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IfnC5fxu2kgqgIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 13:52:39 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C062CB6AD
	for <lists+linux-stm32@lfdr.de>; Thu, 19 Mar 2026 13:52:38 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 50E6CC87ED3;
	Thu, 19 Mar 2026 12:52:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0812AC08D19
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 19 Mar 2026 12:52:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4926C600C4;
 Thu, 19 Mar 2026 12:52:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9282C19424;
 Thu, 19 Mar 2026 12:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773924755;
 bh=jA7diFAaatzjClu0BNNjaXH84miUw/aL+tXzTcfiSyY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Udm/5szmcmrn1FQPUv6e/j0SN6gP++q+sDVLk95f5h2PMysLxA/Z+vmQxnocUccUn
 NuBv89GwjGw+atxJn1J0so9qkU5Fz40p+PTENxR41hcO8d78y7WoL7d68u7RJwiVoU
 24b8F9r9Rglgs2jG81B2Ku5fqywDVKhnmPJe34SHQaQbe0jVM5wnV7X8Yl87k20mNN
 uLVYl3OTVyKbPcX2UWMxSpOwWjfeL17ZUhqEmwTrU9V9I6dAEZqrK0WhNYjr1Zk1rv
 FL2a3cllmUIkPZSTj7CNTbJNtleLxEuRoC6olnUM1WEiLl3YJslQyYkYq6xD3FW/z0
 rvKJyE92if+Dg==
Date: Thu, 19 Mar 2026 12:52:22 +0000
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Joshua Hahn <joshua.hahnjy@gmail.com>
Message-ID: <caf19e7e-e8dc-4409-8655-f734279b0c45@lucifer.local>
References: <72750af6906fd96fb6f18e83ac3e694cf357a2c1.1773695307.git.ljs@kernel.org>
 <20260318210845.2591228-1-joshua.hahnjy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318210845.2591228-1-joshua.hahnjy@gmail.com>
Cc: linux-hyperv@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Jan Kara <jack@suse.cz>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-doc@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Clemens Ladisch <clemens@ladisch.de>, David Howells <dhowells@redhat.com>,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Marc Dionne <marc.dionne@auristor.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 linux-stm32@st-md-mailman.stormreply.com, Wei Liu <wei.liu@kernel.org>,
 Vlastimil Babka <vbabka@kernel.org>, linux-scsi@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Long Li <longli@microsoft.com>,
 linux-staging@lists.linux.dev, Dexuan Cui <decui@microsoft.com>,
 linux-afs@lists.infradead.org, Pedro Falcato <pfalcato@suse.de>,
 Ryan Roberts <ryan.roberts@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, David Hildenbrand <david@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org,
 Christian Brauner <brauner@kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Bodo Stroesser <bostroesser@gmail.com>
Subject: Re: [Linux-stm32] [PATCH v2 12/16] mm: allow handling of stacked
 mmap_prepare hooks in more drivers
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:joshua.hahnjy@gmail.com,m:linux-hyperv@vger.kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:vigneshr@ti.com,m:linux-doc@vger.kernel.org,m:alexander.shishkin@linux.intel.com,m:clemens@ladisch.de,m:dhowells@redhat.com,m:linux-mm@kvack.org,m:target-devel@vger.kernel.org,m:linux-mtd@lists.infradead.org,m:miquel.raynal@bootlin.com,m:marc.dionne@auristor.com,m:kys@microsoft.com,m:linux-stm32@st-md-mailman.stormreply.com,m:wei.liu@kernel.org,m:vbabka@kernel.org,m:linux-scsi@vger.kernel.org,m:richard@nod.at,m:longli@microsoft.com,m:linux-staging@lists.linux.dev,m:decui@microsoft.com,m:linux-afs@lists.infradead.org,m:pfalcato@suse.de,m:ryan.roberts@arm.com,m:arnd@arndb.de,m:jannh@google.com,m:haiyangz@microsoft.com,m:Liam.Howlett@oracle.com,m:viro@zeniv.linux.org.uk,m:david@kernel.org,m:surenb@google.com,m:linux-arm-kernel@lists.infradead.org,m:brauner@kernel.org,m:martin.petersen@oracle.com,m:gregkh@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:mcoquelin.stm32
 @gmail.com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:rppt@kernel.org,m:bostroesser@gmail.com,m:joshuahahnjy@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.145];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,suse.com,suse.cz,ti.com,linux.intel.com,ladisch.de,redhat.com,kvack.org,lists.infradead.org,bootlin.com,auristor.com,microsoft.com,st-md-mailman.stormreply.com,kernel.org,nod.at,lists.linux.dev,suse.de,arm.com,arndb.de,google.com,oracle.com,zeniv.linux.org.uk,linuxfoundation.org,gmail.com,linux-foundation.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns,stormreply.com:email,stormreply.com:url,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: B7C062CB6AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 02:08:45PM -0700, Joshua Hahn wrote:
> On Mon, 16 Mar 2026 21:12:08 +0000 "Lorenzo Stoakes (Oracle)" <ljs@kernel.org> wrote:
>
> > While the conversion of mmap hooks to mmap_prepare is underway, we wil
> > encounter situations where mmap hooks need to invoke nested mmap_prepare
> > hooks.
> >
> > The nesting of mmap hooks is termed 'stacking'.  In order to flexibly
> > facilitate the conversion of custom mmap hooks in drivers which stack, we
> > must split up the existing compat_vma_mapped() function into two separate
> > functions:
> >
> > * compat_set_desc_from_vma() - This allows the setting of a vm_area_desc
> >   object's fields to the relevant fields of a VMA.
>
> Hello Lorenzo, I hope you are doing well!
>
> Thank you for this patch. I was developing on top of mm-new today and had
> an error that I think was caused by this patch. I want to preface this by
> saying that I am not at all familiar with this area of the code, so please
> do forgive me if I've misinterpreted the crash and mistakenly pointed
> at this commit : -)
>
> Here is the crash:
>
> [    1.083795] kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
> [    1.083883] BUG: unable to handle page fault for address: ffa00000048efbb8
> [    1.083957] #PF: supervisor instruction fetch in kernel mode
> [    1.084030] #PF: error_code(0x0011) - permissions violation
> [    1.084086] PGD 100000067 P4D 10035f067 PUD 100364067 PMD 441ed9067 PTE 80000004466a3163
> [    1.084162] Oops: Oops: 0011 [#1] SMP
> [    1.084218] CPU: 0 UID: 0 PID: 305 Comm: mkdir Tainted: G        W   E       7.0.0-rc4-virtme-00442-ge53de5a0302f-dirty #85 PREEMPTLAZY
>
> As you can see, it's on a QEMU instance. I don't think this makes a difference
> in the crash, though.
>
> [    1.084321] Tainted: [W]=WARN, [E]=UNSIGNED_MODULE
> [    1.084369] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-5.el9 11/05/2023
> [    1.084450] RIP: 0010:0xffa00000048efbb8
> [    1.084489] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <40> 12 0e 00 01 00 11 ff d0 fa 8e 04 00 00 a0 ff 80 33 51 02 01 00
> [    1.084642] RSP: 0018:ffa00000048ef998 EFLAGS: 00010286
> [    1.084692] RAX: ffa00000048efbb8 RBX: ff11000102512cc0 RCX: 000000000000000d
> [    1.084766] RDX: ffffffffa06247d0 RSI: ffa00000048efa18 RDI: ff11000102512cc0
> [    1.084826] RBP: ffa00000048ef9c8 R08: 0000000000000000 R09: 0000000000000007
> [    1.084889] R10: ff110001047d1f08 R11: 00007effdc3d0fff R12: ff110001047d3b00
> [    1.084954] R13: ff11000446cae600 R14: ff110001024efe00 R15: ff11000102510a80
> [    1.085021] FS:  0000000000000000(0000) GS:ff110004aae72000(0000) knlGS:0000000000000000
> [    1.085083] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.085136] CR2: ffa00000048efbb8 CR3: 0000000102667001 CR4: 0000000000771ef0
> [    1.085201] PKRU: 55555554
> [    1.085228] Call Trace:
> [    1.085248]  <TASK>
> [    1.085274]  ? __compat_vma_mmap+0x8e/0x130
> [    1.085318]  ? compat_vma_mmap+0x76/0x80
> [    1.085354]  ? mas_alloc_nodes+0xb2/0x110
> [    1.085390]  ? backing_file_mmap+0xc3/0xf0
> [    1.085426]  ? ovl_mmap+0x41/0x50
> [    1.085463]  ? ovl_mmap+0x50/0x50
> [    1.085499]  ? __mmap_region+0x7e8/0x1100
> [    1.085539]  ? do_mmap+0x49f/0x5e0
> [    1.085573]  ? vm_mmap_pgoff+0xef/0x1e0
> [    1.085609]  ? ksys_mmap_pgoff+0x15c/0x1f0
> [    1.085647]  ? do_syscall_64+0xab/0x980
> [    1.085684]  ? entry_SYSCALL_64_after_hwframe+0x4b/0x53
> [    1.085730]  </TASK>
> [    1.085770] Modules linked in: virtio_mmio(E) 9pnet_virtio(E) 9p(E) 9pnet(E) netfs(E)
> [    1.085838] CR2: ffa00000048efbb8
> [    1.085874] ---[ end trace 0000000000000000 ]---
> [    1.085875] kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
> [    1.085918] RIP: 0010:0xffa00000048efbb8
> [    1.085921] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 <40> 12 0e 00 01 00 11 ff d0 fa 8e 04 00 00 a0 ff 80 33 51 02 01 00
> [    1.085988] BUG: unable to handle page fault for address: ffa00000048f7bb8
> [    1.086026] RSP: 0018:ffa00000048ef998 EFLAGS: 00010286
> [    1.086166] #PF: supervisor instruction fetch in kernel mode
> [    1.086221]
> [    1.086267] #PF: error_code(0x0011) - permissions violation
> [    1.086321] RAX: ffa00000048efbb8 RBX: ff11000102512cc0 RCX: 000000000000000d
> [    1.086348] PGD 100000067
> [    1.086394] RDX: ffffffffa06247d0 RSI: ffa00000048efa18 RDI: ff11000102512cc0
> [    1.086459] P4D 10035f067
> [    1.086486] RBP: ffa00000048ef9c8 R08: 0000000000000000 R09: 0000000000000007
> [    1.086550] PUD 100364067
> [    1.086577] R10: ff110001047d1f08 R11: 00007effdc3d0fff R12: ff110001047d3b00
> [    1.086641] PMD 441ed9067
> [    1.086668] R13: ff11000446cae600 R14: ff110001024efe00 R15: ff11000102510a80
> [    1.086731] PTE 80000004433d3163
> [    1.086764] FS:  0000000000000000(0000) GS:ff110004aae72000(0000) knlGS:0000000000000000
> [    1.086829]
> [    1.086868] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [    1.086931] Oops: Oops: 0011 [#2] SMP
> [    1.086958] CR2: ffa00000048efbb8 CR3: 0000000102667001 CR4: 0000000000771ef0
> [    1.087015] CPU: 29 UID: 0 PID: 306 Comm: mount Tainted: G      D W   E       7.0.0-rc4-virtme-00442-ge53de5a0302f-dirty #85 PREEMPTLAZY
> [    1.087050] PKRU: 55555554
> [    1.087115] Tainted: [D]=DIE, [W]=WARN, [E]=UNSIGNED_MODULE
> [    1.087207] Kernel panic - not syncing: Fatal exception
> [    2.158392] Shutting down cpus with NMI
> [    2.158629] Kernel Offset: disabled
> [    2.158668] ---[ end Kernel panic - not syncing: Fatal exception ]---
>
> It crashes at compat_vma_mmap, and here is what I think could be the
> potential crash path:
>
> - compat_vma_mmap() creates struct vm_area_desc desc;
>   - compat_set_desc_from_vma Doesn't initialize the struct, but instead
>     modifies independent fields. I think this is where the behavior
>     diverges, since before we would use the C initializer and uninitialized

Ah yeah you're right I'll fix that up!

>     variables would be set to 0 (including ommitted ones, like
>     action.success_hook or action.error_hook). But action.type = MMAP_NOTHING
>   - desc.action.success_hook remains uninitialized in vfs_mmap_prepare
>   - mmap_action_complete()
>     - Here, We've set action.type to be MMAP_NOTHING, so we have err = 0
>     - mmap_action_finish(action, vma, 0)
>       - And here, since err == 0, we check action->success_hook (which has
>         garbage, therefore it's nonzero) and call action->success_hook(vma)
>
> And I think action->success_hook(vma) where success_hook is uninitialized
> stack garbage gets me to where I am.
>
> Again, I'm not too familiar with this area of the kernel, this is just
> based on the quick digging that I did. And aplogies again if I'm missing
> something ; -) I do think that the uninitialized members could be a problem
> though.
>
> Thank you, I hope you have a great day Lorenzo!
> Joshua

Thanks for the report and analysis, much appreciated, hope you have a great
day too :)

Cheers, Lorenzo
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
