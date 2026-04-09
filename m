Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MBeNEzf12klTwgAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 19:18:04 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 628BE3CE080
	for <lists+linux-stm32@lfdr.de>; Thu, 09 Apr 2026 19:18:04 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id F2B4FC08D19;
	Thu,  9 Apr 2026 17:18:03 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5654DC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  9 Apr 2026 17:18:02 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1216)
 id 937EC20B710C; Thu,  9 Apr 2026 10:18:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 937EC20B710C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1775755081;
 bh=uMAf/aAFn2cF17U/6EJfT5ll571ILEGPz4I3Tb9MzL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FyTJ0T0F6U8+kQZOAwLlJOpHbvHmcTLv1ZKXZ3WoGBXtCTdMmwn+K46HIl8/76vJM
 bUHquLGXpUfuDi70JCvo3WyEHZQKdvU4Nx/BznJwKLCVcXU+h8GeU5FEcSg17CQqy8
 rm1/wEAVFn6WefNv0YAR3dz+M/HmOhPX5GcTRQBE=
Date: Thu, 9 Apr 2026 10:18:01 -0700
From: Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Message-ID: <adffSYxKIuaDLZit@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260407192859.270745-1-hamzamahfooz@linux.microsoft.com>
 <adYNClYB6RY820Xl@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <adYNClYB6RY820Xl@gondor.apana.org.au>
Cc: Jeff Barnes <jeffbarnes@linux.microsoft.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Paul Monson <paul.monson@capgemini.com>
Subject: Re: [Linux-stm32] [PATCH] crypto: tstmgr - guard xxhash tests
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linux.microsoft.com:s=default];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.microsoft.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[hamzamahfooz@linux.microsoft.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:herbert@gondor.apana.org.au,m:jeffbarnes@linux.microsoft.com,m:linux-kernel@vger.kernel.org,m:davem@davemloft.net,m:linux-crypto@vger.kernel.org,m:mcoquelin.stm32@gmail.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:paul.monson@capgemini.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linux.microsoft.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	NEURAL_HAM(-0.00)[-0.905];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hamzamahfooz@linux.microsoft.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[linux.microsoft.com,vger.kernel.org,davemloft.net,gmail.com,st-md-mailman.stormreply.com,lists.infradead.org,capgemini.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 628BE3CE080
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 08, 2026 at 04:08:42PM +0800, Herbert Xu wrote:
> Please show me the panic.  Normally it's not an issue if an algorithm
> is not present while the test vectors are.
> =


alg: hash: failed to allocate transform for xxhash64: -2
Kernel panic - not syncing: alg: self-tests for xxhash64 (xxhash64) failed =
in fips mode!
CPU: 0 PID: 425 Comm: modprobe Not tainted 6.6.130.2-2.azl3 #1
Hardware name: Microsoft Corporation Virtual Machine/Virtual Machine, BIOS =
Hyper-V UEFI Release v4.1 01/08/2026
Call Trace:
=A0<TASK>
=A0dump_stack_lvl+0x4c/0x70
=A0dump_stack+0x14/0x20
=A0panic+0x179/0x330
=A0alg_test+0x678/0x680
=A0? __alloc_pages+0x1e2/0x340
=A0do_test+0x26f8/0x7670 [tcrypt]
=A0do_test+0x72c5/0x7670 [tcrypt]
=A0tcrypt_mod_init+0x65/0xff0 [tcrypt]
=A0? __pfx_tcrypt_mod_init+0x10/0x10 [tcrypt]
=A0do_one_initcall+0x4e/0x330
=A0? kmalloc_trace+0x2e/0xa0
=A0do_init_module+0x68/0x250
=A0load_module+0x1f2e/0x2150
=A0? __do_sys_init_module+0xe6/0x1d0
=A0__do_sys_init_module+0x19c/0x1d0
=A0? __do_sys_init_module+0x19c/0x1d0
=A0__x64_sys_init_module+0x1e/0x30
=A0x64_sys_call+0x11b3/0x1c90
=A0do_syscall_64+0x5a/0x80
=A0? irqentry_exit_to_user_mode+0x29/0x50
=A0? irqentry_exit+0x3f/0x50
=A0? exc_page_fault+0x87/0x160
=A0entry_SYSCALL_64_after_hwframe+0x78/0xe2
RIP: 0033:0x7715f70fab9e
Code: 48 8b 0d 85 32 12 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 =
00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 af 00 00 00 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 8b 0d 52 32 12 00 f7 d8 64 89 01 48
RSP: 002b:00007ffde8fef6c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000af
RAX: ffffffffffffffda RBX: 00005d0b39626af0 RCX: 00007715f70fab9e
RDX: 00005d0b1710197a RSI: 0000000000028c39 RDI: 00005d0b39635310
RBP: 00005d0b1710197a R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000071 R11: 0000000000000246 R12: 00005d0b39635310
R13: 0000000000000000 R14: 00005d0b39626c20 R15: 00005d0b39626da0
=A0</TASK>

Seems like crypto_alg_mod_lookup() [1] fails and that triggers the panic() =
at [2].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/crypto/api.c?h=3Dv7.0-rc7#n338
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/crypto/testmgr.c?h=3Dv7.0-rc7#n5760

BR,
Hamza
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
