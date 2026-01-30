Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDYuAgTqfGmWPQIAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 18:27:32 +0100
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D52BD14E
	for <lists+linux-stm32@lfdr.de>; Fri, 30 Jan 2026 18:27:31 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37DFAC56603;
	Fri, 30 Jan 2026 17:27:31 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A643CC36B12
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 30 Jan 2026 17:27:29 +0000 (UTC)
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1769794048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o3M3i7fOsBJJ8QZ7iZoiOC82WHRYdzsj5QwfB37tvhM=;
 b=4vjFnCIdprQ4bapgrR0W30E28e5XqGnWTzlLJRIchP5KT0mQiU7C2HocIuX1Kdz8pUDo0Y
 qc+5Orpl1l1vZoFNRQKL24RKcgRr4rbqO02DrPCVc+5aUzHom7b8+oniEw+b53sZSdrxJg
 +9kDxpq15AQ1xIFUPYwfQgdiBumRwsh+faRgD4dNJMyLkXr/A+P3jXB+CHRA0Hld9eIR+Y
 7xvqnLxeTCF6EQZwTVn1wPEr2oy9Q/+88+eiC8F7PD8kB/n3dpKOZdgpjEsqUgdQZXqqI6
 yQRXOGphajl9ppYkFrEud4nWZdOCa3/Ob9kGErESIR3cRVjE/LChlCPSJd3YTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1769794048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=o3M3i7fOsBJJ8QZ7iZoiOC82WHRYdzsj5QwfB37tvhM=;
 b=520kqiApVkDPFPboRTL5PTkP4fVPei7/H7ecnPwf1SVFxrBJQEXzDTADXeZGZGuaQ0gr4c
 ZZ61wAzhpOPpFsDw==
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, Jiri
 Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Shan-Chun Hung <schung@nuvoton.com>, Laurentiu Tudor
 <laurentiu.tudor@nxp.com>
In-Reply-To: <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-5-21a291bcf197@suse.com>
Date: Fri, 30 Jan 2026 18:33:27 +0106
Message-ID: <87343n3ta8.fsf@jogness.linutronix.de>
MIME-Version: 1.0
Cc: kgdb-bugreport@lists.sourceforge.net, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-hardening@vger.kernel.org,
 linux-serial@vger.kernel.org, netdev@vger.kernel.org,
 sparclinux@vger.kernel.org, Marcos Paulo de Souza <mpdesouza@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 05/19] printk: Add more context to
	suspend/resume functions
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[linutronix.de:s=2020,linutronix.de:s=2020e];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linutronix.de : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[46];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[john.ogness@linutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_TO(0.00)[suse.com,nod.at,cambridgegreys.com,sipsolutions.net,linuxfoundation.org,windriver.com,kernel.org,chromium.org,goodmis.org,debian.org,lunn.ch,davemloft.net,google.com,redhat.com,linux-m68k.org,intel.com,igalia.com,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,gaisler.com,linux.intel.com,foss.st.com,nuvoton.com,nxp.com];
	FORGED_RECIPIENTS(0.00)[m:mpdesouza@suse.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:gregkh@linuxfoundation.org,m:jason.wessel@windriver.com,m:danielt@kernel.org,m:dianders@chromium.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:senozhatsky@chromium.org,m:jirislaby@kernel.org,m:leitao@debian.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:geert@linux-m68k.org,m:kees@kernel.org,m:tony.luck@intel.com,m:gpiccoli@igalia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:andreas@gaisler.com,m:alexander.shishkin@linux.intel.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:laurentiu.tudor@nxp.com,m:kgdb-bugreport@lists.sourceforge.net,m:linux-um@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-hardening@vg
 er.kernel.org,m:linux-serial@vger.kernel.org,m:netdev@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.ogness@linutronix.de,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	TAGGED_RCPT(0.00)[linux-stm32,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Queue-Id: 92D52BD14E
X-Rspamd-Action: no action

On 2025-12-27, Marcos Paulo de Souza <mpdesouza@suse.com> wrote:
> The new comments clarifies from where the functions are supposed to be
> called.
>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>
> ---
>  kernel/printk/printk.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 173c14e08afe..85a8b6521d9e 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2734,7 +2734,8 @@ MODULE_PARM_DESC(console_no_auto_verbose, "Disable console loglevel raise to hig
>  /**
>   * console_suspend_all - suspend the console subsystem
>   *
> - * This disables printk() while we go into suspend states
> + * This disables printk() while we go into suspend states. Called by the power
> + * management subsystem.

Since you are touching this comment, I would prefer to make it
technically accurate. It is not printk() that is disabled, it is console
printing that is disabled. Perhaps something like:

 * Block all console printing while the system goes into suspend state.
 * Called by the power management subsystem.
   
>   */
>  void console_suspend_all(void)
>  {
> @@ -2766,6 +2767,12 @@ void console_suspend_all(void)
>  	synchronize_srcu(&console_srcu);
>  }
>  
> +/**
> + * console_resume_all - resume the console subsystem
> + *
> + * This resumes printk() when the system is being restored. Called by the power
> + * management subsystem.

And something similar here:

 * Allow all console printing when the system resumes from suspend. Called by
 * the power management system.
 
> + */
>  void console_resume_all(void)
>  {
>  	struct console_flush_type ft;

John Ogness
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
