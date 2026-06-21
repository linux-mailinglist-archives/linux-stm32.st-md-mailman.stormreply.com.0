Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id z2kpJkjfN2rTUwcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 14:55:36 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 275B46AAC3A
	for <lists+linux-stm32@lfdr.de>; Sun, 21 Jun 2026 14:55:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=Lqy6kOiQ;
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D279FC8F288;
	Sun, 21 Jun 2026 12:55:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0A92AC2909A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2026 12:55:34 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-49241a577d8so14568275e9.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 21 Jun 2026 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782046534; x=1782651334;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WU+6TPSMrQeQnOmPDKoUDmLIYSzXbxEWNqGQFFhaaZU=;
 b=Lqy6kOiQP/IGjajkRwcZ0Du1/6H0jwGGIHFz5m50yQ516KDtjjjYiAE9IJodLx3c1o
 kFtdW+UT+XjYJpGXXer8lu+P77OuNWbad+rjyen0V3UCFXA1JmmabzFofTEHWVvEWJ47
 r4R7HCGSv/NqlKwGTcun8pfy187+DsUKXgcETevZZKBFPAvPA2ePe2EErAY7/B/EHY2Q
 Mh7HFg1e/0UPDLUEq8F3jPhVDHl+2DnWtrTgbZVxI72JTliYK6nINMBiCrg4OdNIJsud
 7eSynNvRxO/hVRrpzuuXY7KN4QQy3Q++1pri+cHOC0KqNMjB0VhHrdTkcDZdYu0VGUKm
 g/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782046534; x=1782651334;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WU+6TPSMrQeQnOmPDKoUDmLIYSzXbxEWNqGQFFhaaZU=;
 b=SNz5iNgMh+k6QKLVEzxZf9gbtIJWcCO0nWkmHv1GzUbh4nDQAmSFkwUoo+O3wq9jC0
 O/2MtVQJ+QGx/6OqgdPzqN3adGI1SFvjM/OMjEwSGAI3TWV+xTOw++YTJ586aqlU4L2s
 B5cfo4We/6THX+lPSaZ9it34LOGow4g99VoLJ6pMJ3KmVNEkruNGMF4YuAosSIoZ3fc1
 avLyqIJC+fb/1+vvu+NmD5IBt6+ZYZs4JF/WVMLFjQmi49ldb/gxcw8ji6B1Fdvj1smn
 6J7EL+Yq/LXlFOqWKiYX7V0sO1hi5q0lmvFYVUtykxZAZjAK59i7j4LleeKbKzCYFhsO
 cnUg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+1n/UQzn2bcnNJlQOyS7n1XaX56Z8eHlw2jDbln0ZWvja26Dsfj+FBrrpBLqnCUJt+0v+lrAnzqJ6H9g==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yznt/wNEVDEMgh2fTReItTA8Ua1MCzBP50M8v1iX72raHXW5W78
 /K8HM14j7kwGQlCfcqJD6EyHt5vyjN7jsVa85AF9Wf43aIiVAGDYZMQi
X-Gm-Gg: AfdE7ckXEjwhiRAvwB0pnlSFUZU4jq7K55U2iaprHJfGKYjTHDX2491aYIh0K9MDT5i
 BydL4oWTKpNNYKtbhTIWRKTJLbyAh+UP3iIfWfLMAqReCol/KFUpfYu3+dclODfMoesOD3bQCdn
 GiZ5XZk37dF3UHgcP3QN90DCKP7kEo4lo8Ej8yRnAKfeAS0vSX8BzqN+6Zv1PXjXJY9zLtFEZwB
 pEsGaAjuz8tSC9HuWLpc85kxul8PdKg5xSmLd/qcaPgSjwGxVVtAJ/5/h7OPzb9so8tqsHYlSeC
 +9GBQ8Sb+/PRGFeA4giYSQ9xhCTvfs0P3MmK0Unt257jQQ3fWF55a3z6hnFdWxKb24Q8rH0YwhH
 vdjaCYz/dTorRZ4U34hXzEmABIwKEy+UIGUYFXJTtfv/pGKLsY7cdfOPk3J+kP4A2su0hHBnzlD
 oWcfSv5Jfi6BZPFNQfmJpc3F/YlMqojlmRJkrfBU52/nYwF5V3Sw==
X-Received: by 2002:a05:600c:e547:20b0:48f:d5b8:5b07 with SMTP id
 5b1f17b1804b1-49240e81b22mr113459545e9.20.1782046534244; 
 Sun, 21 Jun 2026 05:55:34 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49249238900sm129230375e9.4.2026.06.21.05.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jun 2026 05:55:33 -0700 (PDT)
Date: Sun, 21 Jun 2026 13:55:31 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Message-ID: <20260621135531.243375d9@pumpkin>
In-Reply-To: <87ik7cmcb7.ffs@fw13>
References: <20260621093430.264983361@kernel.org>
 <20260621093811.168514984@kernel.org> <87ik7cmcb7.ffs@fw13>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 John Ogness <john.ogness@linutronix.de>, linux-rdma@vger.kernel.org,
 linux-ext4@vger.kernel.org, Steven Rostedt <rostedt@kernel.org>,
 linux-trace-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 linux-kbuild@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 2/2] tracing: Add
 CONFIG_TRACE_PRINTK_DEBUGGING to clean up kernel.h
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:mark.rutland@arm.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:dri-devel@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:john.ogness@linutronix.de,m:linux-rdma@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:rostedt@kernel.org,m:linux-trace-kernel@vger.kernel.org,m:yury.norov@gmail.com,m:linux-kbuild@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:mathieu.desnoyers@efficios.com,m:linux-arm-kernel@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:torvalds@linux-foundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:julia.lawall@inria.fr,m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:linuxppc-dev@lists.ozlabs.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,infradead.org,linutronix.de,lists.freedesktop.org,st-md-mailman.stormreply.com,kernel.org,gmail.com,efficios.com,lists.infradead.org,linux-foundation.org,inria.fr,lists.ozlabs.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pumpkin:mid,stm-ict-prod-mailman-01.stormreply.prv:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 275B46AAC3A

On Sun, 21 Jun 2026 12:13:00 +0200
Thomas Gleixner <tglx@kernel.org> wrote:

> On Sun, Jun 21 2026 at 05:34, Steven Rostedt wrote:
> > Instead of having trace_printk.h included in kernel.h, create a config
> > TRACE_PRINTK_DEBUGGING that when set will update the CFLAGS in the
> > Makefile to allow developers to add trace_printk() without the need to add
> > the include for it. Having it included in the Makefile keeps it from being
> > in the dependency chain and it will not waste extra CPU cycles for those
> > building the kernel without using trace_printk.  
> 
> IOW, you make it worse just because.
> 
> With the header being separate I add the three trace_printk()s and the
> include to the source file I'm investigating. The recompile will build
> exactly this source file.
> 
> Having to enable the config knob will result in a full kernel rebuild
> for no value.

Indeed...
Isn't trace_printk() just an extern?
Having it defined somewhere isn't going to make any difference to build times.

	David
 

> 
> Seriously?
> 
> Thanks,
> 
>         tglx
> 
> 
> 

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
