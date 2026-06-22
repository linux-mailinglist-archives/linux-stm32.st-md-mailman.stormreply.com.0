Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HSD8C5o0OWoEogcAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 15:11:54 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6AA6AFB26
	for <lists+linux-stm32@lfdr.de>; Mon, 22 Jun 2026 15:11:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b="YmClh/2z";
	spf=pass (mail.lfdr.de: domain of linux-stm32-bounces@st-md-mailman.stormreply.com designates 52.209.6.89 as permitted sender) smtp.mailfrom=linux-stm32-bounces@st-md-mailman.stormreply.com;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8178DC8F275;
	Mon, 22 Jun 2026 13:11:53 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com
 [74.125.224.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1F0ACC6C856
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2026 13:11:51 +0000 (UTC)
Received: by mail-yx1-f45.google.com with SMTP id
 956f58d0204a3-66310a69f65so2144941d50.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 22 Jun 2026 06:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782133911; x=1782738711;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XkaEWxUJkCuHp/17+ud4oWXJ3qqAKnltzqopfMTtFIs=;
 b=YmClh/2zydhC0ZEHBMs3tqMhrhUwYo9otBDpn+yAYI4wC91y74Lc/WmHfIErVTiOdW
 R2aUK+Dr8/M62ztlBFiea2z1h3oDOuLoNAv/qX2thtjFxRRMGUORSjkAKsCCbyz+B3I9
 IeRMAaRiPszqzhhDwBh/4kMN1oTistEoTc4X7ll19Ksbelxr3jvMFrR2dfNZeZGKkWk8
 dYQRAMGQTLJMty3JMjqZHYj6X2BuuCaCdh09zjlip+hJafCfu5cvtr4Rq6QQfYGrB4a+
 mbgNpRLGPgqV9WjTXFOe9MVNtTdWI8T/auW9cVI9ZwyvhqPyhns9rnYcM+8xvGup8cx3
 Jqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782133911; x=1782738711;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XkaEWxUJkCuHp/17+ud4oWXJ3qqAKnltzqopfMTtFIs=;
 b=PDIozm1azcruEcopea2PbdfGZyaqYKqRsPPlLPd6di1d0eZK9+VK0Wqm1aN2cxKWH5
 YvzeZlGQcuXU+oWbFWxwfUAqZJTABPCZFv0Kjv/eel/abGxpRVJ79UG4Sw1iCumTndoQ
 0j4tuIOqAeqCqWHqZJL55QYuV78W8M0XSXbVDye2XPtVh18ZRdB5kNAgKpiZ4QRfIyDK
 ILa2h0nzNttSj2jpP3U+8rOYfjxm/vPdX3T4oVLJCCfRT2N8bQcvnzMwyzaBTPvvbPfI
 gvcqUXok7EvTh5dkZOkSCIXG40vfwc6lgwZ22b9WTGkD1bUdTnJALUEw9WGlOeezGeKw
 9FVw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpymShFGEEdZKCMQ04/u9uvokszKf8AwavvoyfxBpb1apEUV1WIqn4yaQ+KRU/D4Bna55MQ1hlwKFrYhg==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwU5ibIx6Lvsk2IMq6pfp+auUjW1YSvxUU6dcdb3oFvC1bW11BT
 ut69QinL+AWqOdanv9XnZC/NroCDnfE6VmwrterZ9ZNlSLtdYofuszjF
X-Gm-Gg: AfdE7cnbn+M/MLxO1erJkkv4NVEeZuR5tjJQcLRdJN5ml9Ch7CpAAuNqxkDJVb4/W2M
 WjC+FNm0b7JjTqqN0Lo9cgnpIJ9Cxl0RPevTq55gHG3j2b7lw22S35PYKOcEn6uHqA/YcMRqIH/
 cy/ZubVUyroOLoNZXs5wk0rYRQnOz6NhKd+lIQ6xMhWGvvlZ0ESKHpHv7YgF0nFTlau7Ua7kQCR
 FQGdRqcpGGwZkUkfqtJVehvMgc7eYUrl6IxjWSGCcbYhtdhll9oRDMytOlLBcOIt9VxPgCZq1IM
 SY3D/S5yM4yFvkI4+iDUQB/Kz1xFjzO+j+IhHrYuwOm8wvv2IayK4S09EyM1nOksWxjmDdMnK1A
 ItgppSAuY94+ABjS5l7EHwoGhnBX/a+CiXwf0QZCiQt0ZOtya+bCJCWi1jErLqk5TggBnnlL2V0
 LDfeA68tI=
X-Received: by 2002:a05:690e:120c:b0:660:54e4:5dd1 with SMTP id
 956f58d0204a3-6630333ac1bmr11505521d50.44.1782133910591; 
 Mon, 22 Jun 2026 06:11:50 -0700 (PDT)
Received: from localhost ([38.101.158.131]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-66314ac3f96sm3600882d50.1.2026.06.22.06.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2026 06:11:50 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Mon, 22 Jun 2026 09:11:49 -0400
To: Steven Rostedt <rostedt@kernel.org>
Message-ID: <ajk0lT9P0SeuD94j@yury>
References: <20260621093430.264983361@kernel.org>
 <dbb5915e-6587-4de9-87f3-76bea5024da8@kernel.org>
 <20260622090826.20efadb3@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260622090826.20efadb3@fedora>
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 John Ogness <john.ogness@linutronix.de>, linux-rdma@vger.kernel.org,
 linux-ext4@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-kbuild@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Christophe Leroy \(CS GROUP\)" <chleroy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>,
 Thomas Gleixner <tglx@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [Linux-stm32] [PATCH 0/2] tracing: Move trace_printk.h out of
	kernel.h
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
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_RHS_NOT_FQDN(0.50)[];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[yurynorov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rostedt@kernel.org,m:mark.rutland@arm.com,m:kvm@vger.kernel.org,m:linux-doc@vger.kernel.org,m:peterz@infradead.org,m:bigeasy@linutronix.de,m:dri-devel@lists.freedesktop.org,m:linux-stm32@st-md-mailman.stormreply.com,m:john.ogness@linutronix.de,m:linux-rdma@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:mhiramat@kernel.org,m:yury.norov@gmail.com,m:linux-kbuild@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:mathieu.desnoyers@efficios.com,m:chleroy@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:torvalds@linux-foundation.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:julia.lawall@inria.fr,m:tglx@kernel.org,m:akpm@linux-foundation.org,m:linux-trace-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:yurynorov@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yurynorov@gmail.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FREEMAIL_CC(0.00)[arm.com,vger.kernel.org,infradead.org,linutronix.de,lists.freedesktop.org,st-md-mailman.stormreply.com,kernel.org,gmail.com,efficios.com,lists.infradead.org,linux-foundation.org,inria.fr,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:16509, ipnet:52.208.0.0/13, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns,st-md-mailman.stormreply.com:from_smtp,stormreply.com:url,stormreply.com:email,yury:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA6AA6AFB26

On Mon, Jun 22, 2026 at 09:08:26AM -0400, Steven Rostedt wrote:
> On Mon, 22 Jun 2026 10:05:13 +0200
> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
> 
> > > There's been complaints about trace_printk() being defined in kernel.h as it
> > > can increase the compilation time. As it is only used by some developers for
> > > debugging purposes, it should not be in kernel.h causing lots of wasted CPU
> > > cycles for those that do not ever care about it.  
> > 
> > Do we have a measurement of the increased compilation time ?
> 
> I believe Yury does.

I re-run compilation is a more strict environment, and the difference
is negligible.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
