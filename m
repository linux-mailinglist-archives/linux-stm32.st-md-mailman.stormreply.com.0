Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEyJJdfOfGlbOwIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 16:31:35 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 276C8BC096
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 16:31:35 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B5431C56603;
	Fri, 30 Jan 2026 15:31:34 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 98B44C01FBF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 15:31:33 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1769787091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vOa37cugu1e7NFG01Hi5lQxNeOFAbNhgF4zlCMpuWB0=;
 b=0KQp0ypVQ4kZaeO3mPHMfxJV+hK/54vG6DKBi+oQw7b2zUOdcXSHVjzGTkDhg+DII5BPUq
 aN49RxuHT0Y324cEPE9hahaKdLHrEB12udzdH1NvAbslSIBaR+apFss0VpjAJQGlvJvNWz
 Qkt0FDwz1uMiX4gq49nlr83YKlkc4clstGJ1Gn1qJZPTuOUjrQYGQ2og6q2aakCd23E2bK
 j7QeXx4RcIyDXczvYB5hGiBrowZd2spJR3vfcC58o7tRoab9LXrUZs+RPcCpb6cx/pdJtb
 HBe2qGa1jRaFKPPNxGpTtUqYNPr0BFkp5fHngur0T+mOUqFJcq3Nhz3k8u/Dpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1769787091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vOa37cugu1e7NFG01Hi5lQxNeOFAbNhgF4zlCMpuWB0=;
 b=tRQx2QeqDh72ig5xLjiaegMLqnl9AhaSG7GZod8dlzScFDOmHttRC8Fl88vJKoOCPg8W40
 GHTlrnG5vPdq05BA==
To: Petr Mladek <pmladek@suse.com>, Marcos Paulo de Souza <mpdesouza@suse.com>
In-Reply-To: <aWZyEHsOJFLRLRKT@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-1-21a291bcf197@suse.com>
 <aWZyEHsOJFLRLRKT@pathway.suse.cz>
Date: Fri, 30 Jan 2026 16:37:30 +0106
Message-ID: <878qdf3ynh.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Cc: Andreas Larsson <andreas@gaisler.com>, Kees Cook <kees@kernel.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Shan-Chun Hung <schung@nuvoton.com>, Eric Dumazet <edumazet@google.com>,
 netdev@vger.kernel.org, linux-hardening@vger.kernel.org,
 Breno Leitao <leitao@debian.org>, Jiri Slaby <jirislaby@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, sparclinux@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Richard Weinberger <richard@nod.at>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-serial@vger.kernel.org,
 Daniel Thompson <danielt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jacky Huang <ychuang3@nuvoton.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-m68k@lists.linux-m68k.org,
 Nicholas Piggin <npiggin@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Tony Luck <tony.luck@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-fsdevel@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH 01/19] printk/nbcon: Use an enum to
 specify the required callback in console_is_usable()
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[linutronix.de:s=2020,linutronix.de:s=2020e];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linutronix.de : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[john.ogness@linutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pmladek@suse.com,m:mpdesouza@suse.com,m:andreas@gaisler.com,m:kees@kernel.org,m:kgdb-bugreport@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:schung@nuvoton.com,m:edumazet@google.com,m:netdev@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:leitao@debian.org,m:jirislaby@kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:anton.ivanov@cambridgegreys.com,m:sparclinux@vger.kernel.org,m:maddy@linux.ibm.com,m:andrew+netdev@lunn.ch,m:richard@nod.at,m:christophe.leroy@csgroup.eu,m:alexander.shishkin@linux.intel.com,m:geert@linux-m68k.org,m:linux-serial@vger.kernel.org,m:danielt@kernel.org,m:pabeni@redhat.com,m:ychuang3@nuvoton.com,m:senozhatsky@chromium.org,m:jason.wessel@windriver.com,m:linux-um@lists.infradead.org,m:rostedt@goodmis.org,m:linux-m68k@lists.linux-m68k.org,m:npiggin@gmail.com,m:kuba@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:laurentiu.tudor@nxp.com,m:tony.luck@intel.com,m:gregkh@linuxfoundation.org,m:dianders@chromium.org,m:g
 piccoli@igalia.com,m:mcoquelin.stm32@gmail.com,m:mpe@ellerman.id.au,m:linux-fsdevel@vger.kernel.org,m:johannes@sipsolutions.net,m:linuxppc-dev@lists.ozlabs.org,m:davem@davemloft.net,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gaisler.com,kernel.org,lists.sourceforge.net,vger.kernel.org,nuvoton.com,google.com,debian.org,st-md-mailman.stormreply.com,cambridgegreys.com,linux.ibm.com,lunn.ch,nod.at,csgroup.eu,linux.intel.com,linux-m68k.org,redhat.com,chromium.org,windriver.com,lists.infradead.org,goodmis.org,lists.linux-m68k.org,gmail.com,nxp.com,intel.com,linuxfoundation.org,igalia.com,ellerman.id.au,sipsolutions.net,lists.ozlabs.org,davemloft.net];
	DKIM_TRACE(0.00)[linutronix.de:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,jogness.linutronix.de:mid,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 276C8BC096
X-Rspamd-Action: no action

On 2026-01-13, Petr Mladek <pmladek@suse.com> wrote:
> On Sat 2025-12-27 09:16:08, Marcos Paulo de Souza wrote:
>> The current usage of console_is_usable() is clumsy. The parameter
>> @use_atomic is boolean and thus not self-explanatory. The function is
>> called twice in situations when there are no-strict requirements.
>> 
>> Replace it with enum nbcon_write_cb which provides a more descriptive
>> values for all 3 situations: atomic, thread or any.
>> 
>> Note that console_is_usable() checks only NBCON_USE_ATOMIC because
>> .write_thread() callback is mandatory. But the other two values still
>> make sense because they describe the intention of the caller.
>> 
>> --- a/include/linux/console.h
>> +++ b/include/linux/console.h
>> @@ -202,6 +202,19 @@ enum cons_flags {
>>  	CON_NBCON_ATOMIC_UNSAFE	= BIT(9),
>>  };
>>  
>> +/**
>> + * enum nbcon_write_cb - Defines which nbcon write() callback must be used based
>> + *                       on the caller context.
>> + * @NBCON_USE_ATOMIC: Use con->write_atomic().
>> + * @NBCON_USE_THREAD: Use con->write_thread().
>> + * @NBCON_USE_ANY:    The caller does not have any strict requirements.
>> + */
>> +enum nbcon_write_cb {
>> +	NBCON_USE_ATOMIC,
>> +	NBCON_USE_THREAD,
>> +	NBCON_USE_ANY,
>
> AFAIK, this would define NBCON_USE_ATOMIC as zero. See below.

Yes, although the start value is not guaranteed. And anyway if is to be
used as bits, it should be explicitly set so (such as with enum
cons_flags).

But in reality, we only care about NBCON_USE_ATOMIC and
!NBCON_USE_ATOMIC, so I agree with your comments below about keeping it
a simple enum and not caring about the numerical value.

>> @@ -631,7 +645,7 @@ static inline bool console_is_usable(struct console *con, short flags, bool use_
>>  		return false;
>>  
>>  	if (flags & CON_NBCON) {
>> -		if (use_atomic) {
>> +		if (nwc & NBCON_USE_ATOMIC) {
>
> Let's keep it defined by as zero and use here:
>
> 		if (nwc == NBCON_USE_ATOMIC) {
>
> Note that we do _not_ want to return "false" for "NBCON_USE_ANY"
> when con->write_atomic does not exist.

I agree.

If changed to "nwc == NBCON_USE_ATOMIC":

Reviewed-by: John Ogness <john.ogness@linutronix.de>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
